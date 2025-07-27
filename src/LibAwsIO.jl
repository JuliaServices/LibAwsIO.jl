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

# AWS-based multithreading abstractions
# This provides a Julia-like threading interface using AWS CRT event loops and channels

# Core abstractions for AWS-based multithreading
abstract type AbstractAwsExecutor end

"""
    AwsThreadPool

Represents a pool of AWS event loop threads for executing tasks.
Provides load balancing across multiple event loops.
"""
mutable struct AwsThreadPool <: AbstractAwsExecutor
    event_loop_group::Ptr{aws_event_loop_group}
    thread_count::Int
    function AwsThreadPool(thread_count::Int = 0)
        init()
        group = aws_event_loop_group_new_default(default_aws_allocator(), thread_count, C_NULL)
        group == C_NULL && error("Failed to create AWS event loop group")
        pool = new(group, thread_count == 0 ? Sys.CPU_THREADS : thread_count)
        finalizer(pool) do p
            aws_event_loop_group_release(p.event_loop_group)
        end
        return pool
    end
end

"""
    AwsChannel

Represents an AWS channel tied to a specific event loop thread.
All tasks spawned on this channel will run on the same thread.
"""
mutable struct AwsChannel <: AbstractAwsExecutor
    channel::Ptr{aws_channel}
    event_loop::Ptr{aws_event_loop}
    function AwsChannel(pool::AwsThreadPool = AwsThreadPool())
        # Get next event loop from the pool
        event_loop = aws_event_loop_group_get_next_loop(pool.event_loop_group)
        # Create channel options
        options = aws_channel_options(
            event_loop,          # event_loop
            C_NULL,             # on_setup_completed
            C_NULL,             # on_shutdown_completed  
            C_NULL,             # setup_user_data
            C_NULL,             # shutdown_user_data
            false               # enable_read_back_pressure
        )
        # Create the channel
        channel = aws_channel_new(default_aws_allocator(), Ref(options))
        channel == C_NULL && error("Failed to create AWS channel")
        ch = new(channel, event_loop)
        finalizer(ch) do c
            # Shutdown and destroy channel
            aws_channel_shutdown(c.channel, 0)
            aws_channel_destroy(c.channel)
        end
        return ch
    end
end

# Use Future{T} from LibAwsCommon.jl 
import LibAwsCommon: Future, notify, CapturedException

# Exception type for canceled tasks
struct TaskCancelledException <: Exception end

"""
    AwsTask{T}

A Julia Task-like wrapper around Future{T} that provides standard Task interface methods.
Keeps the Future and thunk alive until completion, eliminating the need for a global registry.
"""
mutable struct AwsTask{T}
    future::Future{T}
    thunk::Function
    AwsTask{T}(thunk::Function) where {T} = new{T}(Future{T}(), thunk)
end

# Convenience constructor for Any type
AwsTask(thunk::Function) = AwsTask{Any}(thunk)

# Implement Task interface methods on AwsTask
Base.fetch(task::AwsTask) = wait(task.future)
Base.wait(task::AwsTask) = wait(task.future)
Base.istaskdone(task::AwsTask) = task.future.set[]
Base.istaskstarted(task::AwsTask) = true  # AwsTasks are started immediately

# Generic task completion callback that works for both aws_task and aws_channel_task
function aws_task_completion_callback(task_ptr, arg_ptr::Ptr{Cvoid}, status::UInt32)
    aws_task = unsafe_pointer_to_objref(arg_ptr)::AwsTask
    try
        if status == 0  # AWS_TASK_STATUS_RUN_READY
            # Execute the function and notify the future
            result = aws_task.thunk()
            notify(aws_task.future, result)
        else
            # Task was canceled or failed - notify with exception  
            if status == 2  # AWS_TASK_STATUS_CANCELED
                notify(aws_task.future, TaskCancelledException())
            else
                notify(aws_task.future, ErrorException("Task failed with status $status"))
            end
        end
    catch e
        # Handle any errors in completion
        notify(aws_task.future, e)
    finally
        # Free the C memory for the task (task_ptr points to either aws_task or aws_channel_task)
        aws_mem_release(default_aws_allocator(), task_ptr)
    end
    return nothing
end

# C callback function references (initialized in __init__)
# We need separate @cfunction refs because aws_task and aws_channel_task have different C signatures
const AWS_TASK_COMPLETION_CALLBACK = Ref{Ptr{Cvoid}}(C_NULL)
const AWS_CHANNEL_TASK_COMPLETION_CALLBACK = Ref{Ptr{Cvoid}}(C_NULL)

"""
    _spawn_on_executor(executor, thunk)

Internal function to spawn a task on a given executor (ThreadPool or Channel).
Returns an AwsTask that wraps the Future and keeps the thunk alive.
"""
function _spawn_on_executor(executor::AbstractAwsExecutor, thunk::Function)
    # Create AwsTask that wraps Future{Any} and keeps thunk alive
    aws_task = AwsTask(thunk)
    # Schedule on appropriate executor
    if executor isa AwsThreadPool
        # Get next event loop and schedule
        event_loop = aws_event_loop_group_get_next_loop(executor.event_loop_group)
        # Allocate C memory for aws_task and initialize it 
        task_ptr = Ptr{LibAwsCommon.aws_task}(aws_mem_acquire(default_aws_allocator(), Base._counttuple(fieldtype(LibAwsCommon.aws_task, :data))))
        aws_task_init(task_ptr, AWS_TASK_COMPLETION_CALLBACK[], pointer_from_objref(aws_task), "julia_spawn")
        aws_event_loop_schedule_task_now(event_loop, task_ptr)
    elseif executor isa AwsChannel
        # Allocate C memory for aws_channel_task and initialize it
        ch_task = Ptr{aws_channel_task}(aws_mem_acquire(default_aws_allocator(), Base._counttuple(fieldtype(aws_channel_task, :data))))
        aws_channel_task_init(ch_task, AWS_CHANNEL_TASK_COMPLETION_CALLBACK[], pointer_from_objref(aws_task), "julia_channel_spawn")
        aws_channel_schedule_task_now(executor.channel, ch_task)
    end
    return aws_task
end

# Default global thread pool for thread-agnostic spawning
const DEFAULT_AWS_THREAD_POOL = Ref{AwsThreadPool}()

function get_default_thread_pool()
    if !isassigned(DEFAULT_AWS_THREAD_POOL)
        DEFAULT_AWS_THREAD_POOL[] = AwsThreadPool()
    end
    return DEFAULT_AWS_THREAD_POOL[]
end

"""
    @spawn [executor] expr

Spawn a task to run asynchronously. Similar to `Threads.@spawn` but uses AWS event loops.

# Examples

```julia
# Thread-agnostic execution (any available event loop)
task = @spawn begin
    sleep(1)
    42
end
result = fetch(task)  # AwsTask implements fetch via its Future

# Channel-specific execution (same thread)
ch = AwsChannel()
task1 = @spawn ch println("Task 1")
task2 = @spawn ch println("Task 2")  # Runs on same thread as task1

# Thread pool execution
pool = AwsThreadPool(4)
task = @spawn pool expensive_computation()
```
"""
macro spawn(args...)
    if length(args) == 1
        # @spawn expr - use default thread pool
        expr = args[1]
        return quote
            local thunk = () -> $(esc(expr))
            _spawn_on_executor(get_default_thread_pool(), thunk)
        end
    elseif length(args) == 2
        # @spawn executor expr - use specific executor
        executor, expr = args
        return quote
            local thunk = () -> $(esc(expr))
            _spawn_on_executor($(esc(executor)), thunk)
        end
    else
        error("@spawn expects 1 or 2 arguments: @spawn [executor] expr")
    end
end

# Additional utilities

"""
    @async_channel expr

Create a new channel and spawn a task on it. Returns both the channel and task.
Useful for creating isolated thread contexts.
"""
macro async_channel(expr)
    return quote
        local ch = AwsChannel()
        local task = @spawn ch $(esc(expr))
        (channel=ch, task=task)
    end
end

"""
    sync_all(tasks...)

Wait for all tasks to complete. Throws if any task throws.
"""
function sync_all(tasks...)
    for task in tasks
        wait(task)
    end
end

"""
    fetch_all(tasks...)

Fetch results from all tasks. Returns a tuple of results.
"""
function fetch_all(tasks...)
    return tuple([fetch(task) for task in tasks]...)
end

export default_aws_event_loop_group, set_default_aws_event_loop_group!, default_aws_host_resolver,
    default_aws_client_bootstrap, set_default_aws_client_bootstrap!, default_aws_server_bootstrap,
    set_default_aws_server_bootstrap!, tlsoptions, close_default_aws_event_loop_group!,
    close_default_aws_host_resolver!, close_default_aws_client_bootstrap!, close_default_aws_server_bootstrap!,
    AwsThreadPool, AwsChannel, AwsTask, @spawn, @async_channel, sync_all, fetch_all

const LIB_AWS_IO_MAX_THREADS = Ref{Int}(0)

function init(allocator=default_aws_allocator())
    LibAwsCommon.init(allocator)
    LibAwsCal.init(allocator)
    aws_io_library_init(allocator)
    LIB_AWS_IO_MAX_THREADS[] = haskey(ENV, "LIB_AWS_IO_MAX_THREADS") ? parse(Int, ENV["LIB_AWS_IO_MAX_THREADS"]) : 0
    return
end

function __init__()
    # Initialize C callback function pointers
    # Both use the same Julia function but different C signatures
    AWS_TASK_COMPLETION_CALLBACK[] = @cfunction(aws_task_completion_callback, Cvoid, (Ptr{LibAwsCommon.aws_task}, Ptr{Cvoid}, UInt32))
    AWS_CHANNEL_TASK_COMPLETION_CALLBACK[] = @cfunction(aws_task_completion_callback, Cvoid, (Ptr{aws_channel_task}, Ptr{Cvoid}, UInt32))
    return
end

end
