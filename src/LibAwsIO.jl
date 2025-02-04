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

mutable struct EventLoopGroup
    ptr::Ptr{aws_event_loop_group}
    EventLoopGroup(ptr::Ptr) =
        finalizer(new(Ptr{aws_event_loop_group}(ptr))) do x
            if ptr != C_NULL
                aws_event_loop_group_release(ptr)
                # for i = 1:aws_event_loop_group_get_loop_count(ptr)
                #     Core.println("stopping event loop $i")
                #     el = aws_event_loop_group_get_loop_at(ptr, i - 1)
                #     aws_event_loop_stop(el)
                #     aws_event_loop_destroy(el)
                # end
            end
        end
end

const DEFAULT_AWS_EVENT_LOOP_GROUP = Ref{EventLoopGroup}(EventLoopGroup(C_NULL))
const DEFAULT_AWS_EVENT_LOOP_GROUP_LOCK = ReentrantLock()

function set_default_aws_event_loop_group!(group::Ptr{aws_event_loop_group})
    @lock DEFAULT_AWS_EVENT_LOOP_GROUP_LOCK begin
        DEFAULT_AWS_EVENT_LOOP_GROUP[] = EventLoopGroup(group)
        return
    end
end

function default_aws_event_loop_group()
    @lock DEFAULT_AWS_EVENT_LOOP_GROUP_LOCK begin
        if DEFAULT_AWS_EVENT_LOOP_GROUP[].ptr == C_NULL
            init()
            maxthreads = LIB_AWS_IO_MAX_THREADS[]
            # populate default event loop group; 0 means one event loop per non-hyperthread core
            set_default_aws_event_loop_group!(aws_event_loop_group_new_default(default_aws_allocator(), maxthreads, C_NULL))
        end
        return DEFAULT_AWS_EVENT_LOOP_GROUP[].ptr
    end
end

function close_default_aws_event_loop_group!()
    @lock DEFAULT_AWS_EVENT_LOOP_GROUP_LOCK begin
        if DEFAULT_AWS_EVENT_LOOP_GROUP[].ptr != C_NULL
            finalize(DEFAULT_AWS_EVENT_LOOP_GROUP[])
            set_default_aws_event_loop_group!(Ptr{aws_event_loop_group}(C_NULL))
        end
        return
    end
end

mutable struct HostResolver
    ptr::Ptr{aws_host_resolver}
    HostResolver(ptr::Ptr) =
        finalizer(_ -> aws_host_resolver_release(ptr), new(Ptr{aws_host_resolver}(ptr)))
end

const DEFAULT_AWS_HOST_RESOLVER = Ref{HostResolver}(HostResolver(C_NULL))
const DEFAULT_AWS_HOST_RESOLVER_LOCK = ReentrantLock()

function set_default_aws_host_resolver!(resolver::Ptr{aws_host_resolver})
    @lock DEFAULT_AWS_HOST_RESOLVER_LOCK begin
        DEFAULT_AWS_HOST_RESOLVER[] = HostResolver(resolver)
        return
    end
end

function default_aws_host_resolver()
    @lock DEFAULT_AWS_HOST_RESOLVER_LOCK begin
        if DEFAULT_AWS_HOST_RESOLVER[].ptr == C_NULL
            init()
            resolver_options = aws_host_resolver_default_options(8, default_aws_event_loop_group(), C_NULL, C_NULL)
            set_default_aws_host_resolver!(aws_host_resolver_new_default(default_aws_allocator(), Ref(resolver_options)))
        end
        return DEFAULT_AWS_HOST_RESOLVER[].ptr
    end
end

function close_default_aws_host_resolver!()
    @lock DEFAULT_AWS_HOST_RESOLVER_LOCK begin
        if DEFAULT_AWS_HOST_RESOLVER[].ptr != C_NULL
            finalize(DEFAULT_AWS_HOST_RESOLVER[])
            set_default_aws_host_resolver!(Ptr{aws_host_resolver}(C_NULL))
        end
        return
    end
end

# aws_client_bootstrap
mutable struct ClientBootstrap
    ptr::Ptr{aws_client_bootstrap}
    ClientBootstrap(ptr::Ptr) =
        finalizer(_ -> aws_client_bootstrap_release(ptr), new(Ptr{aws_client_bootstrap}(ptr)))
end

const DEFAULT_AWS_CLIENT_BOOTSTRAP = Ref{ClientBootstrap}(ClientBootstrap(C_NULL))
const DEFAULT_AWS_CLIENT_BOOTSTRAP_LOCK = ReentrantLock()

function set_default_aws_client_bootstrap!(bootstrap::Ptr{aws_client_bootstrap})
    @lock DEFAULT_AWS_CLIENT_BOOTSTRAP_LOCK begin
        DEFAULT_AWS_CLIENT_BOOTSTRAP[] = ClientBootstrap(bootstrap)
        return
    end
end

function default_aws_client_bootstrap()
    @lock DEFAULT_AWS_CLIENT_BOOTSTRAP_LOCK begin
        if DEFAULT_AWS_CLIENT_BOOTSTRAP[].ptr == C_NULL
            init()
            el_group = default_aws_event_loop_group()
            host_resolver = default_aws_host_resolver()
            bootstrap_options = aws_client_bootstrap_options(el_group, host_resolver, C_NULL, C_NULL, C_NULL)
            set_default_aws_client_bootstrap!(aws_client_bootstrap_new(default_aws_allocator(), Ref(bootstrap_options)))
        end
        return DEFAULT_AWS_CLIENT_BOOTSTRAP[].ptr
    end
end

function close_default_aws_client_bootstrap!()
    @lock DEFAULT_AWS_CLIENT_BOOTSTRAP_LOCK begin
        if DEFAULT_AWS_CLIENT_BOOTSTRAP[].ptr != C_NULL
            finalize(DEFAULT_AWS_CLIENT_BOOTSTRAP[])
            set_default_aws_client_bootstrap!(Ptr{aws_client_bootstrap}(C_NULL))
        end
        return
    end
end

# aws_server_bootstrap
mutable struct ServerBootstrap
    ptr::Ptr{aws_server_bootstrap}
    ServerBootstrap(ptr::Ptr) =
        finalizer(_ -> aws_server_bootstrap_release(ptr), new(Ptr{aws_server_bootstrap}(ptr)))
end

const DEFAULT_AWS_SERVER_BOOTSTRAP = Ref{ServerBootstrap}(ServerBootstrap(C_NULL))
const DEFAULT_AWS_SERVER_BOOTSTRAP_LOCK = ReentrantLock()

function set_default_aws_server_bootstrap!(bootstrap::Ptr{aws_server_bootstrap})
    @lock DEFAULT_AWS_SERVER_BOOTSTRAP_LOCK begin
        DEFAULT_AWS_SERVER_BOOTSTRAP[] = ServerBootstrap(bootstrap)
        return
    end
end

function default_aws_server_bootstrap()
    @lock DEFAULT_AWS_SERVER_BOOTSTRAP_LOCK begin
        if DEFAULT_AWS_SERVER_BOOTSTRAP[].ptr == C_NULL
            init()
            el_group = default_aws_event_loop_group()
            set_default_aws_server_bootstrap!(aws_server_bootstrap_new(default_aws_allocator(), el_group))
        end
        return DEFAULT_AWS_SERVER_BOOTSTRAP[].ptr
    end
end

function close_default_aws_server_bootstrap!()
    @lock DEFAULT_AWS_SERVER_BOOTSTRAP_LOCK begin
        if DEFAULT_AWS_SERVER_BOOTSTRAP[].ptr != C_NULL
            finalize(DEFAULT_AWS_SERVER_BOOTSTRAP[])
            set_default_aws_server_bootstrap!(Ptr{aws_server_bootstrap}(C_NULL))
        end
        return
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

export default_aws_event_loop_group, set_default_aws_event_loop_group!, default_aws_host_resolver,
    default_aws_client_bootstrap, set_default_aws_client_bootstrap!, default_aws_server_bootstrap,
    set_default_aws_server_bootstrap!, tlsoptions, close_default_aws_event_loop_group!,
    close_default_aws_host_resolver!, close_default_aws_client_bootstrap!, close_default_aws_server_bootstrap!

const LIB_AWS_IO_MAX_THREADS = Ref{Int}(0)

function init(allocator=default_aws_allocator())
    LibAwsCommon.init(allocator)
    LibAwsCal.init(allocator)
    aws_io_library_init(allocator)
    LIB_AWS_IO_MAX_THREADS[] = haskey(ENV, "LIB_AWS_IO_MAX_THREADS") ? parse(Int, ENV["LIB_AWS_IO_MAX_THREADS"]) : 0
    return
end

end
