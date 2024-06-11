module LibAwsIO

using aws_c_io_jll
using LibAwsCommon
using LibAwsCal

const IS_LIBC_MUSL = occursin("musl", Base.BUILD_TRIPLET)
if Sys.isapple() && Sys.ARCH === :aarch64
    include("../lib/aarch64-apple-darwin20.jl")
elseif Sys.islinux() && Sys.ARCH === :aarch64 && !IS_LIBC_MUSL
    include("../lib/aarch64-linux-gnu.jl")
elseif Sys.islinux() && Sys.ARCH === :aarch64 && IS_LIBC_MUSL
    include("../lib/aarch64-linux-musl.jl")
elseif Sys.islinux() && startswith(string(Sys.ARCH), "arm") && !IS_LIBC_MUSL
    include("../lib/armv7l-linux-gnueabihf.jl")
elseif Sys.islinux() && startswith(string(Sys.ARCH), "arm") && IS_LIBC_MUSL
    include("../lib/armv7l-linux-musleabihf.jl")
elseif Sys.islinux() && Sys.ARCH === :i686 && !IS_LIBC_MUSL
    include("../lib/i686-linux-gnu.jl")
elseif Sys.islinux() && Sys.ARCH === :i686 && IS_LIBC_MUSL
    include("../lib/i686-linux-musl.jl")
elseif Sys.iswindows() && Sys.ARCH === :i686
    error("LibAwsCommon.jl does not support i686 windows https://github.com/JuliaPackaging/Yggdrasil/blob/bbab3a916ae5543902b025a4a873cf9ee4a7de68/A/aws_c_common/build_tarballs.jl#L48-L49")
elseif Sys.islinux() && Sys.ARCH === :powerpc64le
    include("../lib/powerpc64le-linux-gnu.jl")
elseif Sys.isapple() && Sys.ARCH === :x86_64
    include("../lib/x86_64-apple-darwin14.jl")
elseif Sys.islinux() && Sys.ARCH === :x86_64 && !IS_LIBC_MUSL
    include("../lib/x86_64-linux-gnu.jl")
elseif Sys.islinux() && Sys.ARCH === :x86_64 && IS_LIBC_MUSL
    include("../lib/x86_64-linux-musl.jl")
elseif Sys.isbsd() && !Sys.isapple()
    include("../lib/x86_64-unknown-freebsd13.2.jl")
elseif Sys.iswindows() && Sys.ARCH === :x86_64
    include("../lib/x86_64-w64-mingw32.jl")
else
    error("Unknown platform: $(Base.BUILD_TRIPLET)")
end

# exports
for name in names(@__MODULE__; all=true)
    if name == :eval || name == :include || contains(string(name), "#")
        continue
    end
    @eval export $name
end

const DEFAULT_AWS_EVENT_LOOP_GROUP = Ref{Ptr{aws_event_loop_group}}(C_NULL)
const DEFAULT_AWS_EVENT_LOOP_GROUP_LOCK = ReentrantLock()

function set_default_aws_event_loop_group!(group)
    @lock DEFAULT_AWS_EVENT_LOOP_GROUP_LOCK begin
        DEFAULT_AWS_EVENT_LOOP_GROUP[] = group
        return
    end
end

function default_aws_event_loop_group()
    @lock DEFAULT_AWS_EVENT_LOOP_GROUP_LOCK begin
        if DEFAULT_AWS_EVENT_LOOP_GROUP[] == C_NULL
            init()
            # populate default event loop group; 0 means one event loop per non-hyperthread core
            set_default_aws_event_loop_group!(aws_event_loop_group_new_default(default_aws_allocator(), 0, C_NULL))
        end
        return DEFAULT_AWS_EVENT_LOOP_GROUP[]
    end
end

const DEFAULT_AWS_HOST_RESOLVER = Ref{Ptr{aws_host_resolver}}(C_NULL)
const DEFAULT_AWS_HOST_RESOLVER_LOCK = ReentrantLock()

function set_default_aws_host_resolver!(resolver)
    @lock DEFAULT_AWS_HOST_RESOLVER_LOCK begin
        DEFAULT_AWS_HOST_RESOLVER[] = resolver
        return
    end
end

function default_aws_host_resolver()
    @lock DEFAULT_AWS_HOST_RESOLVER_LOCK begin
        if DEFAULT_AWS_HOST_RESOLVER[] == C_NULL
            init()
            resolver_options = aws_host_resolver_default_options(8, default_aws_event_loop_group(), C_NULL, C_NULL)
            set_default_aws_host_resolver!(aws_host_resolver_new_default(default_aws_allocator(), Ref(resolver_options)))
        end
        return DEFAULT_AWS_HOST_RESOLVER[]
    end
end

# aws_client_bootstrap
const DEFAULT_AWS_CLIENT_BOOTSTRAP = Ref{Ptr{aws_client_bootstrap}}(C_NULL)
const DEFAULT_AWS_CLIENT_BOOTSTRAP_LOCK = ReentrantLock()

function set_default_aws_client_bootstrap!(bootstrap)
    @lock DEFAULT_AWS_CLIENT_BOOTSTRAP_LOCK begin
        DEFAULT_AWS_CLIENT_BOOTSTRAP[] = bootstrap
        return
    end
end

function default_aws_client_bootstrap()
    @lock DEFAULT_AWS_CLIENT_BOOTSTRAP_LOCK begin
        if DEFAULT_AWS_CLIENT_BOOTSTRAP[] == C_NULL
            init()
            el_group = default_aws_event_loop_group()
            host_resolver = default_aws_host_resolver()
            bootstrap_options = aws_client_bootstrap_options(el_group, host_resolver, C_NULL, C_NULL, C_NULL)
            set_default_aws_client_bootstrap!(aws_client_bootstrap_new(default_aws_allocator(), Ref(bootstrap_options)))
        end
        return DEFAULT_AWS_CLIENT_BOOTSTRAP[]
    end
end

# aws_server_bootstrap
const DEFAULT_AWS_SERVER_BOOTSTRAP = Ref{Ptr{aws_server_bootstrap}}(C_NULL)
const DEFAULT_AWS_SERVER_BOOTSTRAP_LOCK = ReentrantLock()

function set_default_aws_server_bootstrap!(bootstrap)
    @lock DEFAULT_AWS_SERVER_BOOTSTRAP_LOCK begin
        DEFAULT_AWS_SERVER_BOOTSTRAP[] = bootstrap
        return
    end
end

function default_aws_server_bootstrap()
    @lock DEFAULT_AWS_SERVER_BOOTSTRAP_LOCK begin
        if DEFAULT_AWS_SERVER_BOOTSTRAP[] == C_NULL
            init()
            el_group = default_aws_event_loop_group()
            set_default_aws_server_bootstrap!(aws_server_bootstrap_new(default_aws_allocator(), el_group))
        end
        return DEFAULT_AWS_SERVER_BOOTSTRAP[]
    end
end

function tlsoptions(host::String;
    allocator=default_aws_allocator(),
    # tls options
    ssl_cert=nothing,
    ssl_key=nothing,
    ssl_capath=nothing,
    ssl_cacert=nothing,
    ssl_insecure=false,
    ssl_alpn_list=nothing,
    on_negotiation_result=C_NULL,
    on_negotiation_result_user_data=C_NULL
)
    tls_options = aws_tls_connection_options(C_NULL, C_NULL, C_NULL, C_NULL, C_NULL, C_NULL, C_NULL, false, UInt32(0))
    tls_ctx_options = Ptr{aws_tls_ctx_options}(aws_mem_acquire(allocator, sizeof(aws_tls_ctx_options)))
    tls_ctx = C_NULL
    try
        if ssl_cert !== nothing && ssl_key !== nothing
            aws_tls_ctx_options_init_client_mtls_from_path(tls_ctx_options, allocator, ssl_cert, ssl_key) != 0 && sockerr("aws_tls_ctx_options_init_client_mtls_from_path failed")
        elseif Sys.iswindows() && ssl_cert !== nothing && ssl_key === nothing
            aws_tls_ctx_options_init_client_mtls_from_system_path(tls_ctx_options, allocator, ssl_cert) != 0 && sockerr("aws_tls_ctx_options_init_client_mtls_from_system_path failed")
        else
            aws_tls_ctx_options_init_default_client(tls_ctx_options, allocator)
        end
        if ssl_capath !== nothing && ssl_cacert !== nothing
            aws_tls_ctx_options_override_default_trust_store_from_path(tls_ctx_options, ssl_capath, ssl_cacert) != 0 && sockerr("aws_tls_ctx_options_override_default_trust_store_from_path failed")
        end
        if ssl_insecure
            aws_tls_ctx_options_set_verify_peer(tls_ctx_options, false)
        end
        if ssl_alpn_list !== nothing
            aws_tls_ctx_options_set_alpn_list(tls_ctx_options, ssl_alpn_list) != 0 && sockerr("aws_tls_ctx_options_set_alpn_list failed")
        end
        tls_ctx = aws_tls_client_ctx_new(allocator, tls_ctx_options)
        tls_ctx == C_NULL && sockerr("")
        ref = Ref(tls_options)
        host_ref = Ref(aws_byte_cursor_from_c_str(host))
        aws_tls_connection_options_init_from_ctx(ref, tls_ctx)
        aws_tls_connection_options_set_server_name(ref, allocator, host_ref) != 0 && sockerr("aws_tls_connection_options_set_server_name failed")
        if on_negotiation_result !== C_NULL
            aws_tls_connection_options_set_callbacks(ref, on_negotiation_result, C_NULL, C_NULL, pointer_from_objref(on_negotiation_result_user_data))
        end
        tls_options = ref[]
    finally
        aws_tls_ctx_options_clean_up(tls_ctx_options)
        aws_tls_ctx_release(tls_ctx)
        aws_mem_release(allocator, tls_ctx_options)
    end
    return tls_options
end

export default_aws_event_loop_group, set_default_aws_event_loop_group!, default_aws_host_resolver, default_aws_client_bootstrap, set_default_aws_client_bootstrap!, default_aws_server_bootstrap, set_default_aws_server_bootstrap!, tlsoptions

function init(allocator=default_aws_allocator())
    LibAwsCommon.init(allocator)
    aws_io_library_init(allocator)
    return
end

end
