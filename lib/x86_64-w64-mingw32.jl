using CEnum

"""
    union (unnamed at /home/runner/.julia/artifacts/f91e217c8008d4d0a73d5d6f460e778246f9ec6b/include/aws/common/task_scheduler.h:40:5)

Documentation not found.
"""
struct var"union (unnamed at /home/runner/.julia/artifacts/f91e217c8008d4d0a73d5d6f460e778246f9ec6b/include/aws/common/task_scheduler.h:40:5)"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"union (unnamed at /home/runner/.julia/artifacts/f91e217c8008d4d0a73d5d6f460e778246f9ec6b/include/aws/common/task_scheduler.h:40:5)"}, f::Symbol)
    f === :scheduled && return Ptr{Bool}(x + 0)
    f === :reserved && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"union (unnamed at /home/runner/.julia/artifacts/f91e217c8008d4d0a73d5d6f460e778246f9ec6b/include/aws/common/task_scheduler.h:40:5)", f::Symbol)
    r = Ref{var"union (unnamed at /home/runner/.julia/artifacts/f91e217c8008d4d0a73d5d6f460e778246f9ec6b/include/aws/common/task_scheduler.h:40:5)"}(x)
    ptr = Base.unsafe_convert(Ptr{var"union (unnamed at /home/runner/.julia/artifacts/f91e217c8008d4d0a73d5d6f460e778246f9ec6b/include/aws/common/task_scheduler.h:40:5)"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"union (unnamed at /home/runner/.julia/artifacts/f91e217c8008d4d0a73d5d6f460e778246f9ec6b/include/aws/common/task_scheduler.h:40:5)"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    aws_async_input_stream_vtable

Documentation not found.
"""
struct aws_async_input_stream_vtable
    destroy::Ptr{Cvoid}
    read::Ptr{Cvoid}
end

"""
    aws_async_input_stream

Documentation not found.
"""
struct aws_async_input_stream
    vtable::Ptr{aws_async_input_stream_vtable}
    alloc::Ptr{aws_allocator}
    ref_count::aws_ref_count
    impl::Ptr{Cvoid}
end

"""
    aws_async_input_stream_init_base(stream, alloc, vtable, impl)

Initialize [`aws_async_input_stream`](@ref) "base class"

### Prototype
```c
void aws_async_input_stream_init_base( struct aws_async_input_stream *stream, struct aws_allocator *alloc, const struct aws_async_input_stream_vtable *vtable, void *impl);
```
"""
function aws_async_input_stream_init_base(stream, alloc, vtable, impl)
    ccall((:aws_async_input_stream_init_base, libaws_c_io), Cvoid, (Ptr{aws_async_input_stream}, Ptr{aws_allocator}, Ptr{aws_async_input_stream_vtable}, Ptr{Cvoid}), stream, alloc, vtable, impl)
end

"""
    aws_async_input_stream_acquire(stream)

Increment reference count. You may pass in NULL (has no effect). Returns whatever pointer was passed in.

### Prototype
```c
struct aws_async_input_stream *aws_async_input_stream_acquire(struct aws_async_input_stream *stream);
```
"""
function aws_async_input_stream_acquire(stream)
    ccall((:aws_async_input_stream_acquire, libaws_c_io), Ptr{aws_async_input_stream}, (Ptr{aws_async_input_stream},), stream)
end

"""
    aws_async_input_stream_release(stream)

Decrement reference count. You may pass in NULL (has no effect). Always returns NULL.

### Prototype
```c
struct aws_async_input_stream *aws_async_input_stream_release(struct aws_async_input_stream *stream);
```
"""
function aws_async_input_stream_release(stream)
    ccall((:aws_async_input_stream_release, libaws_c_io), Ptr{aws_async_input_stream}, (Ptr{aws_async_input_stream},), stream)
end

"""
Documentation not found.
"""
mutable struct aws_future_bool end

"""
    aws_async_input_stream_read(stream, dest)

Read once from the async stream into the buffer. The read completes when at least 1 byte is read, the buffer is full, or EOF is reached. Depending on implementation, the read could complete at any time. It may complete synchronously. It may complete on another thread. Returns a future, which will contain an error code if something went wrong, or a result bool indicating whether EOF has been reached.

WARNING: The buffer must have space available. WARNING: Do not read again until the previous read is complete.

### Prototype
```c
struct aws_future_bool *aws_async_input_stream_read(struct aws_async_input_stream *stream, struct aws_byte_buf *dest);
```
"""
function aws_async_input_stream_read(stream, dest)
    ccall((:aws_async_input_stream_read, libaws_c_io), Ptr{aws_future_bool}, (Ptr{aws_async_input_stream}, Ptr{aws_byte_buf}), stream, dest)
end

"""
    aws_async_input_stream_read_to_fill(stream, dest)

Read repeatedly from the async stream until the buffer is full, or EOF is reached. Depending on implementation, this could complete at any time. It may complete synchronously. It may complete on another thread. Returns a future, which will contain an error code if something went wrong, or a result bool indicating whether EOF has been reached.

WARNING: The buffer must have space available. WARNING: Do not read again until the previous read is complete.

### Prototype
```c
struct aws_future_bool *aws_async_input_stream_read_to_fill( struct aws_async_input_stream *stream, struct aws_byte_buf *dest);
```
"""
function aws_async_input_stream_read_to_fill(stream, dest)
    ccall((:aws_async_input_stream_read_to_fill, libaws_c_io), Ptr{aws_future_bool}, (Ptr{aws_async_input_stream}, Ptr{aws_byte_buf}), stream, dest)
end

"""
    aws_channel_direction

Documentation not found.
"""
@cenum aws_channel_direction::UInt32 begin
    AWS_CHANNEL_DIR_READ = 0
    AWS_CHANNEL_DIR_WRITE = 1
end

"""
Documentation not found.
"""
mutable struct aws_event_loop_local_object end

# typedef void ( aws_channel_on_setup_completed_fn ) ( struct aws_channel * channel , int error_code , void * user_data )
"""
Documentation not found.
"""
const aws_channel_on_setup_completed_fn = Cvoid

# typedef void ( aws_channel_on_shutdown_completed_fn ) ( struct aws_channel * channel , int error_code , void * user_data )
"""
Documentation not found.
"""
const aws_channel_on_shutdown_completed_fn = Cvoid

"""
Documentation not found.
"""
mutable struct aws_channel end

"""
    aws_channel_handler_vtable

Documentation not found.
"""
struct aws_channel_handler_vtable
    process_read_message::Ptr{Cvoid}
    process_write_message::Ptr{Cvoid}
    increment_read_window::Ptr{Cvoid}
    shutdown::Ptr{Cvoid}
    initial_window_size::Ptr{Cvoid}
    message_overhead::Ptr{Cvoid}
    destroy::Ptr{Cvoid}
    reset_statistics::Ptr{Cvoid}
    gather_statistics::Ptr{Cvoid}
    trigger_read::Ptr{Cvoid}
end

"""
    aws_channel_handler

Documentation not found.
"""
struct aws_channel_handler
    vtable::Ptr{aws_channel_handler_vtable}
    alloc::Ptr{aws_allocator}
    slot::Ptr{Cvoid} # slot::Ptr{aws_channel_slot}
    impl::Ptr{Cvoid}
end

function Base.getproperty(x::aws_channel_handler, f::Symbol)
    f === :slot && return Ptr{aws_channel_slot}(getfield(x, f))
    return getfield(x, f)
end

"""
    aws_channel_slot

Documentation not found.
"""
struct aws_channel_slot
    alloc::Ptr{aws_allocator}
    channel::Ptr{aws_channel}
    adj_left::Ptr{aws_channel_slot}
    adj_right::Ptr{aws_channel_slot}
    handler::Ptr{aws_channel_handler}
    window_size::Csize_t
    upstream_message_overhead::Csize_t
    current_window_update_batch_size::Csize_t
end

# typedef void ( aws_channel_task_fn ) ( struct aws_channel_task * channel_task , void * arg , enum aws_task_status status )
"""
Documentation not found.
"""
const aws_channel_task_fn = Cvoid

"""
    aws_channel_task

Documentation not found.
"""
struct aws_channel_task
    data::NTuple{104, UInt8}
end

function Base.getproperty(x::Ptr{aws_channel_task}, f::Symbol)
    f === :wrapper_task && return Ptr{aws_task}(x + 0)
    f === :task_fn && return Ptr{Ptr{aws_channel_task_fn}}(x + 64)
    f === :arg && return Ptr{Ptr{Cvoid}}(x + 72)
    f === :type_tag && return Ptr{Ptr{Cchar}}(x + 80)
    f === :node && return Ptr{aws_linked_list_node}(x + 88)
    return getfield(x, f)
end

function Base.getproperty(x::aws_channel_task, f::Symbol)
    r = Ref{aws_channel_task}(x)
    ptr = Base.unsafe_convert(Ptr{aws_channel_task}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_channel_task}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
Documentation not found.
"""
mutable struct aws_event_loop end

"""
    aws_channel_options

Args for creating a new channel. event\\_loop to use for IO and tasks. on\\_setup\\_completed will be invoked when the setup process is finished It will be executed in the event loop's thread. on\\_shutdown\\_completed will be executed upon channel shutdown.

enable\\_read\\_back\\_pressure toggles whether or not back pressure will be applied in the channel. Leave this option off unless you're using something like reactive-streams, since it is a slight throughput penalty.

Unless otherwise specified all functions for channels and channel slots must be executed within that channel's event-loop's thread.
"""
struct aws_channel_options
    event_loop::Ptr{aws_event_loop}
    on_setup_completed::Ptr{aws_channel_on_setup_completed_fn}
    on_shutdown_completed::Ptr{aws_channel_on_shutdown_completed_fn}
    setup_user_data::Ptr{Cvoid}
    shutdown_user_data::Ptr{Cvoid}
    enable_read_back_pressure::Bool
end

"""
    aws_channel_task_init(channel_task, task_fn, arg, type_tag)

Initializes channel\\_task for use.

### Prototype
```c
void aws_channel_task_init( struct aws_channel_task *channel_task, aws_channel_task_fn *task_fn, void *arg, const char *type_tag);
```
"""
function aws_channel_task_init(channel_task, task_fn, arg, type_tag)
    ccall((:aws_channel_task_init, libaws_c_io), Cvoid, (Ptr{aws_channel_task}, Ptr{aws_channel_task_fn}, Ptr{Cvoid}, Ptr{Cchar}), channel_task, task_fn, arg, type_tag)
end

"""
    aws_channel_new(allocator, creation_args)

Allocates new channel, Unless otherwise specified all functions for channels and channel slots must be executed within that channel's event-loop's thread. channel\\_options are copied.

### Prototype
```c
struct aws_channel *aws_channel_new(struct aws_allocator *allocator, const struct aws_channel_options *creation_args);
```
"""
function aws_channel_new(allocator, creation_args)
    ccall((:aws_channel_new, libaws_c_io), Ptr{aws_channel}, (Ptr{aws_allocator}, Ptr{aws_channel_options}), allocator, creation_args)
end

"""
    aws_channel_destroy(channel)

Mark the channel, along with all slots and handlers, for destruction. Must be called after shutdown has completed. Can be called from any thread assuming '[`aws_channel_shutdown`](@ref)()' has completed. Note that memory will not be freed until all users which acquired holds on the channel via [`aws_channel_acquire_hold`](@ref)(), release them via [`aws_channel_release_hold`](@ref)().

### Prototype
```c
void aws_channel_destroy(struct aws_channel *channel);
```
"""
function aws_channel_destroy(channel)
    ccall((:aws_channel_destroy, libaws_c_io), Cvoid, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_shutdown(channel, error_code)

Initiates shutdown of the channel. Shutdown will begin with the left-most slot. Each handler will invoke '[`aws_channel_slot_on_handler_shutdown_complete`](@ref)' once they've finished their shutdown process for the read direction. Once the right-most slot has shutdown in the read direction, the process will start shutting down starting on the right-most slot. Once the left-most slot has shutdown in the write direction, 'callbacks->shutdown\\_completed' will be invoked in the event loop's thread.

This function can be called from any thread.

### Prototype
```c
int aws_channel_shutdown(struct aws_channel *channel, int error_code);
```
"""
function aws_channel_shutdown(channel, error_code)
    ccall((:aws_channel_shutdown, libaws_c_io), Cint, (Ptr{aws_channel}, Cint), channel, error_code)
end

"""
    aws_channel_acquire_hold(channel)

Prevent a channel's memory from being freed. Any number of users may acquire a hold to prevent a channel and its handlers from being unexpectedly freed. Any user which acquires a hold must release it via [`aws_channel_release_hold`](@ref)(). Memory will be freed once all holds are released and [`aws_channel_destroy`](@ref)() has been called.

### Prototype
```c
void aws_channel_acquire_hold(struct aws_channel *channel);
```
"""
function aws_channel_acquire_hold(channel)
    ccall((:aws_channel_acquire_hold, libaws_c_io), Cvoid, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_release_hold(channel)

Release a hold on the channel's memory, allowing it to be freed. This may be called before or after [`aws_channel_destroy`](@ref)().

### Prototype
```c
void aws_channel_release_hold(struct aws_channel *channel);
```
"""
function aws_channel_release_hold(channel)
    ccall((:aws_channel_release_hold, libaws_c_io), Cvoid, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_slot_new(channel)

Allocates and initializes a new slot for use with the channel. If this is the first slot in the channel, it will automatically be added to the channel as the first slot. For all subsequent calls on a given channel, the slot will need to be added to the channel via. the [`aws_channel_slot_insert_right`](@ref)(), [`aws_channel_slot_insert_end`](@ref)(), and [`aws_channel_slot_insert_left`](@ref)() APIs.

### Prototype
```c
struct aws_channel_slot *aws_channel_slot_new(struct aws_channel *channel);
```
"""
function aws_channel_slot_new(channel)
    ccall((:aws_channel_slot_new, libaws_c_io), Ptr{aws_channel_slot}, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_get_event_loop(channel)

Fetches the event loop the channel is a part of.

### Prototype
```c
struct aws_event_loop *aws_channel_get_event_loop(struct aws_channel *channel);
```
"""
function aws_channel_get_event_loop(channel)
    ccall((:aws_channel_get_event_loop, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_current_clock_time(channel, time_nanos)

Fetches the current timestamp from the event-loop's clock, in nanoseconds.

### Prototype
```c
int aws_channel_current_clock_time(struct aws_channel *channel, uint64_t *time_nanos);
```
"""
function aws_channel_current_clock_time(channel, time_nanos)
    ccall((:aws_channel_current_clock_time, libaws_c_io), Cint, (Ptr{aws_channel}, Ptr{UInt64}), channel, time_nanos)
end

"""
    aws_channel_fetch_local_object(channel, key, obj)

Retrieves an object by key from the event loop's local storage.

### Prototype
```c
int aws_channel_fetch_local_object( struct aws_channel *channel, const void *key, struct aws_event_loop_local_object *obj);
```
"""
function aws_channel_fetch_local_object(channel, key, obj)
    ccall((:aws_channel_fetch_local_object, libaws_c_io), Cint, (Ptr{aws_channel}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), channel, key, obj)
end

"""
    aws_channel_put_local_object(channel, key, obj)

Stores an object by key in the event loop's local storage.

### Prototype
```c
int aws_channel_put_local_object( struct aws_channel *channel, const void *key, const struct aws_event_loop_local_object *obj);
```
"""
function aws_channel_put_local_object(channel, key, obj)
    ccall((:aws_channel_put_local_object, libaws_c_io), Cint, (Ptr{aws_channel}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), channel, key, obj)
end

"""
    aws_channel_remove_local_object(channel, key, removed_obj)

Removes an object by key from the event loop's local storage.

### Prototype
```c
int aws_channel_remove_local_object( struct aws_channel *channel, const void *key, struct aws_event_loop_local_object *removed_obj);
```
"""
function aws_channel_remove_local_object(channel, key, removed_obj)
    ccall((:aws_channel_remove_local_object, libaws_c_io), Cint, (Ptr{aws_channel}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), channel, key, removed_obj)
end

"""
    aws_io_message_type

Documentation not found.
"""
@cenum aws_io_message_type::UInt32 begin
    AWS_IO_MESSAGE_APPLICATION_DATA = 0
end

# typedef void ( aws_channel_on_message_write_completed_fn ) ( struct aws_channel * channel , struct aws_io_message * message , int err_code , void * user_data )
"""
Documentation not found.
"""
const aws_channel_on_message_write_completed_fn = Cvoid

"""
    aws_io_message

Documentation not found.
"""
struct aws_io_message
    allocator::Ptr{aws_allocator}
    message_data::aws_byte_buf
    message_type::aws_io_message_type
    message_tag::Cint
    copy_mark::Csize_t
    owning_channel::Ptr{aws_channel}
    on_completion::Ptr{aws_channel_on_message_write_completed_fn}
    user_data::Ptr{Cvoid}
    queueing_handle::aws_linked_list_node
end

"""
    aws_channel_acquire_message_from_pool(channel, message_type, size_hint)

Acquires a message from the event loop's message pool. size\\_hint is merely a hint, it may be smaller than you requested and you are responsible for checking the bounds of it. If the returned message is not large enough, you must send multiple messages. This cannot fail, it never returns NULL.

### Prototype
```c
struct aws_io_message *aws_channel_acquire_message_from_pool( struct aws_channel *channel, enum aws_io_message_type message_type, size_t size_hint);
```
"""
function aws_channel_acquire_message_from_pool(channel, message_type, size_hint)
    ccall((:aws_channel_acquire_message_from_pool, libaws_c_io), Ptr{aws_io_message}, (Ptr{aws_channel}, aws_io_message_type, Csize_t), channel, message_type, size_hint)
end

"""
    aws_channel_schedule_task_now(channel, task)

Schedules a task to run on the event loop as soon as possible. This is the ideal way to move a task into the correct thread. It's also handy for context switches. This function is safe to call from any thread.

If called from the channel's event loop, the task will get directly added to the run-now list. If called from outside the channel's event loop, the task will go into a cross-thread task queue.

If tasks must be serialized relative to some source synchronization, you may not want to use this API because tasks submitted from the event loop thread can "jump ahead" of tasks submitted from external threads due to this optimization. If this is a problem, you can either refactor your submission logic or use the [`aws_channel_schedule_task_now_serialized`](@ref) variant which does not perform this optimization.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_channel_schedule_task_now(struct aws_channel *channel, struct aws_channel_task *task);
```
"""
function aws_channel_schedule_task_now(channel, task)
    ccall((:aws_channel_schedule_task_now, libaws_c_io), Cvoid, (Ptr{aws_channel}, Ptr{aws_channel_task}), channel, task)
end

"""
    aws_channel_schedule_task_now_serialized(channel, task)

Schedules a task to run on the event loop as soon as possible.

This variant always uses the cross thread queue rather than conditionally skipping it when already in the destination event loop. While not "optimal", this allows us to serialize task execution no matter where the task was submitted from: if you are submitting tasks from a critical section, the serialized order that you submit is guaranteed to be the order that they execute on the event loop.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_channel_schedule_task_now_serialized(struct aws_channel *channel, struct aws_channel_task *task);
```
"""
function aws_channel_schedule_task_now_serialized(channel, task)
    ccall((:aws_channel_schedule_task_now_serialized, libaws_c_io), Cvoid, (Ptr{aws_channel}, Ptr{aws_channel_task}), channel, task)
end

"""
    aws_channel_schedule_task_future(channel, task, run_at_nanos)

Schedules a task to run on the event loop at the specified time. This is the ideal way to move a task into the correct thread. It's also handy for context switches. Use [`aws_channel_current_clock_time`](@ref)() to get the current time in nanoseconds. This function is safe to call from any thread.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_channel_schedule_task_future( struct aws_channel *channel, struct aws_channel_task *task, uint64_t run_at_nanos);
```
"""
function aws_channel_schedule_task_future(channel, task, run_at_nanos)
    ccall((:aws_channel_schedule_task_future, libaws_c_io), Cvoid, (Ptr{aws_channel}, Ptr{aws_channel_task}, UInt64), channel, task, run_at_nanos)
end

"""
    aws_channel_set_statistics_handler(channel, handler)

Instrument a channel with a statistics handler. While instrumented with a statistics handler, the channel will periodically report per-channel-handler-specific statistics about handler performance and state.

Assigning a statistics handler to a channel is a transfer of ownership -- the channel will clean up the handler appropriately. Statistics handlers may be changed dynamically (for example, the upgrade from a vanilla http channel to a websocket channel), but this function may only be called from the event loop thread that the channel is a part of.

The first possible hook to set a statistics handler is the channel's creation callback.

### Prototype
```c
int aws_channel_set_statistics_handler(struct aws_channel *channel, struct aws_crt_statistics_handler *handler);
```
"""
function aws_channel_set_statistics_handler(channel, handler)
    ccall((:aws_channel_set_statistics_handler, libaws_c_io), Cint, (Ptr{aws_channel}, Ptr{Cvoid}), channel, handler)
end

"""
    aws_channel_thread_is_callers_thread(channel)

Returns true if the caller is on the event loop's thread. If false, you likely need to use aws\\_channel\\_schedule\\_task(). This function is safe to call from any thread.

### Prototype
```c
bool aws_channel_thread_is_callers_thread(struct aws_channel *channel);
```
"""
function aws_channel_thread_is_callers_thread(channel)
    ccall((:aws_channel_thread_is_callers_thread, libaws_c_io), Bool, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_slot_set_handler(slot, handler)

Sets the handler for a slot, the slot will also call get\\_current\\_window\\_size() and propagate a window update upstream.

### Prototype
```c
int aws_channel_slot_set_handler(struct aws_channel_slot *slot, struct aws_channel_handler *handler);
```
"""
function aws_channel_slot_set_handler(slot, handler)
    ccall((:aws_channel_slot_set_handler, libaws_c_io), Cint, (Ptr{aws_channel_slot}, Ptr{aws_channel_handler}), slot, handler)
end

"""
    aws_channel_slot_remove(slot)

Removes slot from the channel and deallocates the slot and its handler.

### Prototype
```c
int aws_channel_slot_remove(struct aws_channel_slot *slot);
```
"""
function aws_channel_slot_remove(slot)
    ccall((:aws_channel_slot_remove, libaws_c_io), Cint, (Ptr{aws_channel_slot},), slot)
end

"""
    aws_channel_slot_replace(remove, new_slot)

Replaces remove with new\\_slot. Deallocates remove and its handler.

### Prototype
```c
int aws_channel_slot_replace(struct aws_channel_slot *remove, struct aws_channel_slot *new_slot);
```
"""
function aws_channel_slot_replace(remove, new_slot)
    ccall((:aws_channel_slot_replace, libaws_c_io), Cint, (Ptr{aws_channel_slot}, Ptr{aws_channel_slot}), remove, new_slot)
end

"""
    aws_channel_slot_insert_right(slot, to_add)

inserts 'to\\_add' to the position immediately to the right of slot. Note that the first call to [`aws_channel_slot_new`](@ref)() adds it to the channel implicitly.

### Prototype
```c
int aws_channel_slot_insert_right(struct aws_channel_slot *slot, struct aws_channel_slot *to_add);
```
"""
function aws_channel_slot_insert_right(slot, to_add)
    ccall((:aws_channel_slot_insert_right, libaws_c_io), Cint, (Ptr{aws_channel_slot}, Ptr{aws_channel_slot}), slot, to_add)
end

"""
    aws_channel_slot_insert_end(channel, to_add)

Inserts to 'to\\_add' the end of the channel. Note that the first call to [`aws_channel_slot_new`](@ref)() adds it to the channel implicitly.

### Prototype
```c
int aws_channel_slot_insert_end(struct aws_channel *channel, struct aws_channel_slot *to_add);
```
"""
function aws_channel_slot_insert_end(channel, to_add)
    ccall((:aws_channel_slot_insert_end, libaws_c_io), Cint, (Ptr{aws_channel}, Ptr{aws_channel_slot}), channel, to_add)
end

"""
    aws_channel_slot_insert_left(slot, to_add)

inserts 'to\\_add' to the position immediately to the left of slot. Note that the first call to [`aws_channel_slot_new`](@ref)() adds it to the channel implicitly.

### Prototype
```c
int aws_channel_slot_insert_left(struct aws_channel_slot *slot, struct aws_channel_slot *to_add);
```
"""
function aws_channel_slot_insert_left(slot, to_add)
    ccall((:aws_channel_slot_insert_left, libaws_c_io), Cint, (Ptr{aws_channel_slot}, Ptr{aws_channel_slot}), slot, to_add)
end

"""
    aws_channel_slot_send_message(slot, message, dir)

Sends a message to the adjacent slot in the channel based on dir. Also does window size checking.

NOTE: if this function returns an error code, it is the caller's responsibility to release message back to the pool. If this function returns AWS\\_OP\\_SUCCESS, the recipient of the message has taken ownership of the message. So, for example, don't release a message to the pool and then return an error. If you encounter an error condition in this case, shutdown the channel with the appropriate error code.

### Prototype
```c
int aws_channel_slot_send_message( struct aws_channel_slot *slot, struct aws_io_message *message, enum aws_channel_direction dir);
```
"""
function aws_channel_slot_send_message(slot, message, dir)
    ccall((:aws_channel_slot_send_message, libaws_c_io), Cint, (Ptr{aws_channel_slot}, Ptr{aws_io_message}, aws_channel_direction), slot, message, dir)
end

"""
    aws_channel_slot_acquire_max_message_for_write(slot)

Convenience function that invokes [`aws_channel_acquire_message_from_pool`](@ref)(), asking for the largest reasonable DATA message that can be sent in the write direction, with upstream overhead accounted for. This cannot fail, it never returns NULL.

### Prototype
```c
struct aws_io_message *aws_channel_slot_acquire_max_message_for_write(struct aws_channel_slot *slot);
```
"""
function aws_channel_slot_acquire_max_message_for_write(slot)
    ccall((:aws_channel_slot_acquire_max_message_for_write, libaws_c_io), Ptr{aws_io_message}, (Ptr{aws_channel_slot},), slot)
end

"""
    aws_channel_slot_increment_read_window(slot, window)

Issues a window update notification upstream (to the left.)

### Prototype
```c
int aws_channel_slot_increment_read_window(struct aws_channel_slot *slot, size_t window);
```
"""
function aws_channel_slot_increment_read_window(slot, window)
    ccall((:aws_channel_slot_increment_read_window, libaws_c_io), Cint, (Ptr{aws_channel_slot}, Csize_t), slot, window)
end

"""
    aws_channel_slot_on_handler_shutdown_complete(slot, dir, err_code, free_scarce_resources_immediately)

Called by handlers once they have finished their shutdown in the 'dir' direction. Propagates the shutdown process to the next handler in the channel.

### Prototype
```c
int aws_channel_slot_on_handler_shutdown_complete( struct aws_channel_slot *slot, enum aws_channel_direction dir, int err_code, bool free_scarce_resources_immediately);
```
"""
function aws_channel_slot_on_handler_shutdown_complete(slot, dir, err_code, free_scarce_resources_immediately)
    ccall((:aws_channel_slot_on_handler_shutdown_complete, libaws_c_io), Cint, (Ptr{aws_channel_slot}, aws_channel_direction, Cint, Bool), slot, dir, err_code, free_scarce_resources_immediately)
end

"""
    aws_channel_slot_shutdown(slot, dir, err_code, free_scarce_resources_immediately)

Initiates shutdown on slot. callbacks->on\\_shutdown\\_completed will be called once the shutdown process is completed.

### Prototype
```c
int aws_channel_slot_shutdown( struct aws_channel_slot *slot, enum aws_channel_direction dir, int err_code, bool free_scarce_resources_immediately);
```
"""
function aws_channel_slot_shutdown(slot, dir, err_code, free_scarce_resources_immediately)
    ccall((:aws_channel_slot_shutdown, libaws_c_io), Cint, (Ptr{aws_channel_slot}, aws_channel_direction, Cint, Bool), slot, dir, err_code, free_scarce_resources_immediately)
end

"""
    aws_channel_slot_downstream_read_window(slot)

Fetches the downstream read window. This gives you the information necessary to honor the read window. If you call send\\_message() and it exceeds this window, the message will be rejected.

### Prototype
```c
size_t aws_channel_slot_downstream_read_window(struct aws_channel_slot *slot);
```
"""
function aws_channel_slot_downstream_read_window(slot)
    ccall((:aws_channel_slot_downstream_read_window, libaws_c_io), Csize_t, (Ptr{aws_channel_slot},), slot)
end

"""
    aws_channel_slot_upstream_message_overhead(slot)

Fetches the current overhead of upstream handlers. This provides a hint to avoid fragmentation if you care.

### Prototype
```c
size_t aws_channel_slot_upstream_message_overhead(struct aws_channel_slot *slot);
```
"""
function aws_channel_slot_upstream_message_overhead(slot)
    ccall((:aws_channel_slot_upstream_message_overhead, libaws_c_io), Csize_t, (Ptr{aws_channel_slot},), slot)
end

"""
    aws_channel_handler_destroy(handler)

Calls destroy on handler's vtable

### Prototype
```c
void aws_channel_handler_destroy(struct aws_channel_handler *handler);
```
"""
function aws_channel_handler_destroy(handler)
    ccall((:aws_channel_handler_destroy, libaws_c_io), Cvoid, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_channel_handler_process_read_message(handler, slot, message)

Calls process\\_read\\_message on handler's vtable

### Prototype
```c
int aws_channel_handler_process_read_message( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_io_message *message);
```
"""
function aws_channel_handler_process_read_message(handler, slot, message)
    ccall((:aws_channel_handler_process_read_message, libaws_c_io), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_io_message}), handler, slot, message)
end

"""
    aws_channel_handler_process_write_message(handler, slot, message)

Calls process\\_write\\_message on handler's vtable.

### Prototype
```c
int aws_channel_handler_process_write_message( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_io_message *message);
```
"""
function aws_channel_handler_process_write_message(handler, slot, message)
    ccall((:aws_channel_handler_process_write_message, libaws_c_io), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_io_message}), handler, slot, message)
end

"""
    aws_channel_handler_increment_read_window(handler, slot, size)

Calls on\\_window\\_update on handler's vtable.

### Prototype
```c
int aws_channel_handler_increment_read_window( struct aws_channel_handler *handler, struct aws_channel_slot *slot, size_t size);
```
"""
function aws_channel_handler_increment_read_window(handler, slot, size)
    ccall((:aws_channel_handler_increment_read_window, libaws_c_io), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Csize_t), handler, slot, size)
end

"""
    aws_channel_handler_shutdown(handler, slot, dir, error_code, free_scarce_resources_immediately)

calls shutdown\\_direction on handler's vtable.

### Prototype
```c
int aws_channel_handler_shutdown( struct aws_channel_handler *handler, struct aws_channel_slot *slot, enum aws_channel_direction dir, int error_code, bool free_scarce_resources_immediately);
```
"""
function aws_channel_handler_shutdown(handler, slot, dir, error_code, free_scarce_resources_immediately)
    ccall((:aws_channel_handler_shutdown, libaws_c_io), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, aws_channel_direction, Cint, Bool), handler, slot, dir, error_code, free_scarce_resources_immediately)
end

"""
    aws_channel_handler_initial_window_size(handler)

Calls initial\\_window\\_size on handler's vtable.

### Prototype
```c
size_t aws_channel_handler_initial_window_size(struct aws_channel_handler *handler);
```
"""
function aws_channel_handler_initial_window_size(handler)
    ccall((:aws_channel_handler_initial_window_size, libaws_c_io), Csize_t, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_channel_get_first_slot(channel)

Documentation not found.
### Prototype
```c
struct aws_channel_slot *aws_channel_get_first_slot(struct aws_channel *channel);
```
"""
function aws_channel_get_first_slot(channel)
    ccall((:aws_channel_get_first_slot, libaws_c_io), Ptr{aws_channel_slot}, (Ptr{aws_channel},), channel)
end

"""
    aws_channel_trigger_read(channel)

A way for external processes to force a read by the data-source channel handler. Necessary in certain cases, like when a server channel finishes setting up its initial handlers, a read may have already been triggered on the socket (the client's CLIENT\\_HELLO tls payload, for example) and absent further data/notifications, this data would never get processed.

### Prototype
```c
int aws_channel_trigger_read(struct aws_channel *channel);
```
"""
function aws_channel_trigger_read(channel)
    ccall((:aws_channel_trigger_read, libaws_c_io), Cint, (Ptr{aws_channel},), channel)
end

# typedef void ( aws_client_bootstrap_on_channel_event_fn ) ( struct aws_client_bootstrap * bootstrap , int error_code , struct aws_channel * channel , void * user_data )
"""
Generic event function for channel lifecycle events.

Callbacks are provided for: (1) Channel creation (2) Channel setup - If TLS is being used, this function is called once the socket has connected, the channel has been initialized, and TLS has been successfully negotiated. A TLS handler has already been added to the channel. If TLS negotiation fails, this function will be called with the corresponding error code. If TLS is not being used, this function is called once the socket has connected and the channel has been initialized. (3) Channel shutdown

These callbacks are always invoked within the thread of the event-loop that the channel is assigned to.

This function does NOT always imply "success" -- if error\\_code is AWS\\_OP\\_SUCCESS then everything was successful, otherwise an error condition occurred.
"""
const aws_client_bootstrap_on_channel_event_fn = Cvoid

# typedef struct aws_channel_handler * ( aws_channel_on_protocol_negotiated_fn ) ( struct aws_channel_slot * new_slot , struct aws_byte_buf * protocol , void * user_data )
"""
If ALPN is being used this function will be invoked by the channel once an ALPN message is received. The returned channel\\_handler will be added to, and managed by, the channel.
"""
const aws_channel_on_protocol_negotiated_fn = Cvoid

# typedef void aws_client_bootstrap_shutdown_complete_fn ( void * user_data )
"""
Called after client bootstrap has been completely cleaned up, after its last refcount is released.
"""
const aws_client_bootstrap_shutdown_complete_fn = Cvoid

"""
Documentation not found.
"""
mutable struct aws_event_loop_group end

"""
    aws_host_resolver_vtable

should you absolutely disdain the default implementation, feel free to implement your own.
"""
struct aws_host_resolver_vtable
    destroy::Ptr{Cvoid}
    resolve_host::Ptr{Cvoid}
    record_connection_failure::Ptr{Cvoid}
    purge_cache::Ptr{Cvoid}
    purge_cache_with_callback::Ptr{Cvoid}
    purge_host_cache::Ptr{Cvoid}
    get_host_address_count::Ptr{Cvoid}
end

"""
    aws_host_resolver

Documentation not found.
"""
struct aws_host_resolver
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
    vtable::Ptr{aws_host_resolver_vtable}
    ref_count::aws_ref_count
    shutdown_options::aws_shutdown_callback_options
end

# typedef int ( aws_resolve_host_implementation_fn ) ( struct aws_allocator * allocator , const struct aws_string * host_name , struct aws_array_list * output_addresses , void * user_data )
"""
Function signature for configuring your own resolver (the default just uses getaddrinfo()). The type in output\\_addresses is struct [`aws_host_address`](@ref) (by-value). We assume this function blocks, hence this absurdly complicated design.
"""
const aws_resolve_host_implementation_fn = Cvoid

"""
    aws_host_resolution_config

Documentation not found.
"""
struct aws_host_resolution_config
    impl::Ptr{aws_resolve_host_implementation_fn}
    max_ttl::Csize_t
    impl_data::Ptr{Cvoid}
    resolve_frequency_ns::UInt64
end

"""
    aws_client_bootstrap

[`aws_client_bootstrap`](@ref) handles creation and setup of channels that communicate via socket with a specific endpoint.
"""
struct aws_client_bootstrap
    allocator::Ptr{aws_allocator}
    event_loop_group::Ptr{aws_event_loop_group}
    host_resolver::Ptr{aws_host_resolver}
    host_resolver_config::aws_host_resolution_config
    on_protocol_negotiated::Ptr{aws_channel_on_protocol_negotiated_fn}
    ref_count::aws_ref_count
    on_shutdown_complete::Ptr{aws_client_bootstrap_shutdown_complete_fn}
    user_data::Ptr{Cvoid}
end

"""
    aws_client_bootstrap_options

[`aws_client_bootstrap`](@ref) creation options.
"""
struct aws_client_bootstrap_options
    event_loop_group::Ptr{aws_event_loop_group}
    host_resolver::Ptr{aws_host_resolver}
    host_resolution_config::Ptr{aws_host_resolution_config}
    on_shutdown_complete::Ptr{aws_client_bootstrap_shutdown_complete_fn}
    user_data::Ptr{Cvoid}
end

# typedef void ( aws_server_bootstrap_on_accept_channel_setup_fn ) ( struct aws_server_bootstrap * bootstrap , int error_code , struct aws_channel * channel , void * user_data )
"""
If TLS is being used, this function is called once the socket has received an incoming connection, the channel has been initialized, and TLS has been successfully negotiated. A TLS handler has already been added to the channel. If TLS negotiation fails, this function will be called with the corresponding error code.

If TLS is not being used, this function is called once the socket has received an incoming connection and the channel has been initialized.

This function is always called within the thread of the event-loop that the new channel is assigned to upon success.

On failure, the channel might not be assigned to an event loop yet, and will thus be invoked on the listener's event-loop thread.

This function does NOT mean "success", if error\\_code is AWS\\_OP\\_SUCCESS then everything was successful, otherwise an error condition occurred.

If an error occurred, you do not need to shutdown the channel. The `aws_channel_client_shutdown_callback` will be invoked once the channel has finished shutting down.
"""
const aws_server_bootstrap_on_accept_channel_setup_fn = Cvoid

# typedef void ( aws_server_bootstrap_on_accept_channel_shutdown_fn ) ( struct aws_server_bootstrap * bootstrap , int error_code , struct aws_channel * channel , void * user_data )
"""
Once the channel shuts down, this function will be invoked within the thread of the event-loop that the channel is assigned to.

Note: this function is only invoked if the channel was successfully setup, e.g. [`aws_server_bootstrap_on_accept_channel_setup_fn`](@ref)() was invoked without an error code.
"""
const aws_server_bootstrap_on_accept_channel_shutdown_fn = Cvoid

# typedef void ( aws_server_bootstrap_on_listener_setup_fn ) ( struct aws_server_bootstrap * bootstrap , int error_code , void * user_data )
"""
This function is only used for async listener (Apple Network Framework in this case). Once the server listener socket is finished setup and starting listening, this fuction will be invoked.
"""
const aws_server_bootstrap_on_listener_setup_fn = Cvoid

# typedef void ( aws_server_bootstrap_on_server_listener_destroy_fn ) ( struct aws_server_bootstrap * bootstrap , void * user_data )
"""
Once the server listener socket is finished destroying, and all the existing connections are closed, this fuction will be invoked.
"""
const aws_server_bootstrap_on_server_listener_destroy_fn = Cvoid

"""
    aws_server_bootstrap

[`aws_server_bootstrap`](@ref) manages listening sockets, creating and setting up channels to handle each incoming connection.
"""
struct aws_server_bootstrap
    allocator::Ptr{aws_allocator}
    event_loop_group::Ptr{aws_event_loop_group}
    on_protocol_negotiated::Ptr{aws_channel_on_protocol_negotiated_fn}
    ref_count::aws_ref_count
end

"""
    aws_socket_type

Documentation not found.
"""
@cenum aws_socket_type::UInt32 begin
    AWS_SOCKET_STREAM = 0
    AWS_SOCKET_DGRAM = 1
end

"""
    aws_socket_domain

Documentation not found.
"""
@cenum aws_socket_domain::UInt32 begin
    AWS_SOCKET_IPV4 = 0
    AWS_SOCKET_IPV6 = 1
    AWS_SOCKET_LOCAL = 2
    AWS_SOCKET_VSOCK = 3
end

"""
    aws_socket_impl_type

Socket Implementation type. Decides which socket implementation is used. If set to `AWS_SOCKET_IMPL_PLATFORM_DEFAULT`, it will automatically use the platform’s default.

PLATFORM DEFAULT SOCKET IMPLEMENTATION TYPE Linux | AWS\\_SOCKET\\_IMPL\\_POSIX Windows | AWS\\_SOCKET\\_IMPL\\_WINSOCK BSD Variants| AWS\\_SOCKET\\_IMPL\\_POSIX MacOS | AWS\\_SOCKET\\_IMPL\\_POSIX iOS | AWS\\_SOCKET\\_IMPL\\_APPLE\\_NETWORK\\_FRAMEWORK
"""
@cenum aws_socket_impl_type::UInt32 begin
    AWS_SOCKET_IMPL_PLATFORM_DEFAULT = 0
    AWS_SOCKET_IMPL_POSIX = 1
    AWS_SOCKET_IMPL_WINSOCK = 2
    AWS_SOCKET_IMPL_APPLE_NETWORK_FRAMEWORK = 3
end

"""
    aws_socket_options

Documentation not found.
"""
struct aws_socket_options
    type::aws_socket_type
    domain::aws_socket_domain
    impl_type::aws_socket_impl_type
    connect_timeout_ms::UInt32
    keep_alive_interval_sec::UInt16
    keep_alive_timeout_sec::UInt16
    keep_alive_max_failed_probes::UInt16
    keepalive::Bool
    network_interface_name::NTuple{16, Cchar}
end

# typedef void ( aws_tls_on_negotiation_result_fn ) ( struct aws_channel_handler * handler , struct aws_channel_slot * slot , int error_code , void * user_data )
"""
Invoked upon completion of the TLS handshake. If successful error\\_code will be AWS\\_OP\\_SUCCESS, otherwise the negotiation failed and immediately after this function is invoked, the channel will be shutting down.

NOTE: When using SecItem the handler and slot arguments will be pointers to the socket slot and socket handler. This is due to TLS negotiaion being handled by the Apple Network Framework connection in the socket slot/handler.
"""
const aws_tls_on_negotiation_result_fn = Cvoid

# typedef void ( aws_tls_on_data_read_fn ) ( struct aws_channel_handler * handler , struct aws_channel_slot * slot , struct aws_byte_buf * buffer , void * user_data )
"""
Only used if the TLS handler is the last handler in the channel. This allows you to read any data that was read and decrypted by the handler. If you have application protocol channel handlers, this function is not necessary and certainly not recommended.
"""
const aws_tls_on_data_read_fn = Cvoid

# typedef void ( aws_tls_on_error_fn ) ( struct aws_channel_handler * handler , struct aws_channel_slot * slot , int err , const char * message , void * user_data )
"""
Invoked when an error occurs in the TLS state machine AFTER the handshake has completed. This function should only be used in conjunction with the rules of [`aws_tls_on_data_read_fn`](@ref).
"""
const aws_tls_on_error_fn = Cvoid

"""
    aws_tls_ctx

Documentation not found.
"""
struct aws_tls_ctx
    alloc::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
    ref_count::aws_ref_count
end

"""
    aws_tls_connection_options

Documentation not found.
"""
struct aws_tls_connection_options
    alpn_list::Ptr{aws_string}
    server_name::Ptr{aws_string}
    on_negotiation_result::Ptr{aws_tls_on_negotiation_result_fn}
    on_data_read::Ptr{aws_tls_on_data_read_fn}
    on_error::Ptr{aws_tls_on_error_fn}
    user_data::Ptr{Cvoid}
    ctx::Ptr{aws_tls_ctx}
    advertise_alpn_message::Bool
    timeout_ms::UInt32
end

"""
    aws_socket_channel_bootstrap_options

Socket-based channel creation options.

bootstrap - configs name resolution and which event loop group the connection will be seated into host\\_name - host to connect to; if a dns address, will be resolved prior to connecting port - port to connect to socket\\_options - socket properties, including type (tcp vs. udp vs. unix domain) and connect timeout. TLS connections are currently restricted to tcp (AWS\\_SOCKET\\_STREAM) only. tls\\_options - (optional) tls context to apply after connection establishment. If NULL, the connection will not be protected by TLS. creation\\_callback - (optional) callback invoked when the channel is first created. This is always right after the connection was successfully established. *Does NOT* get called if the initial connect failed. setup\\_callback - callback invoked once the channel is ready for use and TLS has been negotiated or if an error is encountered shutdown\\_callback - callback invoked once the channel has shutdown. enable\\_read\\_back\\_pressure - controls whether or not back pressure will be applied in the channel user\\_data - arbitrary data to pass back to the various callbacks requested\\_event\\_loop - if set, the connection will be placed on the requested event loop rather than one chosen internally from the bootstrap's associated event loop group. It is an error to pass in an event loop that is not associated with the bootstrap's event loop group.

Immediately after the `shutdown_callback` returns, the channel is cleaned up automatically. All callbacks are invoked in the thread of the event-loop that the new channel is assigned to.
"""
struct aws_socket_channel_bootstrap_options
    bootstrap::Ptr{aws_client_bootstrap}
    host_name::Ptr{Cchar}
    port::UInt32
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    creation_callback::Ptr{aws_client_bootstrap_on_channel_event_fn}
    setup_callback::Ptr{aws_client_bootstrap_on_channel_event_fn}
    shutdown_callback::Ptr{aws_client_bootstrap_on_channel_event_fn}
    enable_read_back_pressure::Bool
    user_data::Ptr{Cvoid}
    requested_event_loop::Ptr{aws_event_loop}
    host_resolution_override_config::Ptr{aws_host_resolution_config}
end

"""
    aws_server_socket_channel_bootstrap_options

Arguments to setup a server socket listener which will also negotiate and configure TLS. This creates a socket listener bound to `host` and 'port' using socket options `options`, and TLS options `tls_options`. `incoming_callback` will be invoked once an incoming channel is ready for use and TLS is finished negotiating, or if an error is encountered. `shutdown_callback` will be invoked once the channel has shutdown. `destroy_callback` will be invoked after the server socket listener is destroyed, and all associated connections and channels have finished shutting down. Immediately after the `shutdown_callback` returns, the channel is cleaned up automatically. All callbacks are invoked in the thread of the event-loop that listener is assigned to.

Upon shutdown of your application, you'll want to call [`aws_server_bootstrap_destroy_socket_listener`](@ref) with the return value from this function.

The socket type in `options` must be AWS\\_SOCKET\\_STREAM if tls\\_options is set. DTLS is not currently supported for tls.
"""
struct aws_server_socket_channel_bootstrap_options
    bootstrap::Ptr{aws_server_bootstrap}
    host_name::Ptr{Cchar}
    port::UInt32
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    setup_callback::Ptr{aws_server_bootstrap_on_listener_setup_fn}
    incoming_callback::Ptr{aws_server_bootstrap_on_accept_channel_setup_fn}
    shutdown_callback::Ptr{aws_server_bootstrap_on_accept_channel_shutdown_fn}
    destroy_callback::Ptr{aws_server_bootstrap_on_server_listener_destroy_fn}
    enable_read_back_pressure::Bool
    user_data::Ptr{Cvoid}
end

"""
    aws_client_bootstrap_new(allocator, options)

Create the client bootstrap.

### Prototype
```c
struct aws_client_bootstrap *aws_client_bootstrap_new( struct aws_allocator *allocator, const struct aws_client_bootstrap_options *options);
```
"""
function aws_client_bootstrap_new(allocator, options)
    ccall((:aws_client_bootstrap_new, libaws_c_io), Ptr{aws_client_bootstrap}, (Ptr{aws_allocator}, Ptr{aws_client_bootstrap_options}), allocator, options)
end

"""
    aws_client_bootstrap_acquire(bootstrap)

Increments a client bootstrap's ref count, allowing the caller to take a reference to it.

Returns the same client bootstrap passed in.

### Prototype
```c
struct aws_client_bootstrap *aws_client_bootstrap_acquire(struct aws_client_bootstrap *bootstrap);
```
"""
function aws_client_bootstrap_acquire(bootstrap)
    ccall((:aws_client_bootstrap_acquire, libaws_c_io), Ptr{aws_client_bootstrap}, (Ptr{aws_client_bootstrap},), bootstrap)
end

"""
    aws_client_bootstrap_release(bootstrap)

Decrements a client bootstrap's ref count. When the ref count drops to zero, the bootstrap will be destroyed.

### Prototype
```c
void aws_client_bootstrap_release(struct aws_client_bootstrap *bootstrap);
```
"""
function aws_client_bootstrap_release(bootstrap)
    ccall((:aws_client_bootstrap_release, libaws_c_io), Cvoid, (Ptr{aws_client_bootstrap},), bootstrap)
end

"""
    aws_client_bootstrap_set_alpn_callback(bootstrap, on_protocol_negotiated)

When using TLS, if ALPN is used, this callback will be invoked from the channel. The returned handler will be added to the channel.

### Prototype
```c
int aws_client_bootstrap_set_alpn_callback( struct aws_client_bootstrap *bootstrap, aws_channel_on_protocol_negotiated_fn *on_protocol_negotiated);
```
"""
function aws_client_bootstrap_set_alpn_callback(bootstrap, on_protocol_negotiated)
    ccall((:aws_client_bootstrap_set_alpn_callback, libaws_c_io), Cint, (Ptr{aws_client_bootstrap}, Ptr{aws_channel_on_protocol_negotiated_fn}), bootstrap, on_protocol_negotiated)
end

"""
    aws_client_bootstrap_new_socket_channel(options)

Sets up a client socket channel.

### Prototype
```c
int aws_client_bootstrap_new_socket_channel(struct aws_socket_channel_bootstrap_options *options);
```
"""
function aws_client_bootstrap_new_socket_channel(options)
    ccall((:aws_client_bootstrap_new_socket_channel, libaws_c_io), Cint, (Ptr{aws_socket_channel_bootstrap_options},), options)
end

"""
    aws_server_bootstrap_new(allocator, el_group)

Initializes the server bootstrap with `allocator` and `el_group`. This object manages listeners, server connections, and channels.

### Prototype
```c
struct aws_server_bootstrap *aws_server_bootstrap_new( struct aws_allocator *allocator, struct aws_event_loop_group *el_group);
```
"""
function aws_server_bootstrap_new(allocator, el_group)
    ccall((:aws_server_bootstrap_new, libaws_c_io), Ptr{aws_server_bootstrap}, (Ptr{aws_allocator}, Ptr{aws_event_loop_group}), allocator, el_group)
end

"""
    aws_server_bootstrap_acquire(bootstrap)

Increments a server bootstrap's ref count, allowing the caller to take a reference to it.

Returns the same server bootstrap passed in.

### Prototype
```c
struct aws_server_bootstrap *aws_server_bootstrap_acquire(struct aws_server_bootstrap *bootstrap);
```
"""
function aws_server_bootstrap_acquire(bootstrap)
    ccall((:aws_server_bootstrap_acquire, libaws_c_io), Ptr{aws_server_bootstrap}, (Ptr{aws_server_bootstrap},), bootstrap)
end

"""
    aws_server_bootstrap_release(bootstrap)

Decrements a server bootstrap's ref count. When the ref count drops to zero, the bootstrap will be destroyed.

### Prototype
```c
void aws_server_bootstrap_release(struct aws_server_bootstrap *bootstrap);
```
"""
function aws_server_bootstrap_release(bootstrap)
    ccall((:aws_server_bootstrap_release, libaws_c_io), Cvoid, (Ptr{aws_server_bootstrap},), bootstrap)
end

"""
    aws_server_bootstrap_set_alpn_callback(bootstrap, on_protocol_negotiated)

When using TLS, if ALPN is used, this callback will be invoked from the channel. The returned handler will be added to the channel.

### Prototype
```c
int aws_server_bootstrap_set_alpn_callback( struct aws_server_bootstrap *bootstrap, aws_channel_on_protocol_negotiated_fn *on_protocol_negotiated);
```
"""
function aws_server_bootstrap_set_alpn_callback(bootstrap, on_protocol_negotiated)
    ccall((:aws_server_bootstrap_set_alpn_callback, libaws_c_io), Cint, (Ptr{aws_server_bootstrap}, Ptr{aws_channel_on_protocol_negotiated_fn}), bootstrap, on_protocol_negotiated)
end

"""
Documentation not found.
"""
mutable struct aws_socket_vtable end

"""
    aws_socket_endpoint

Documentation not found.
"""
struct aws_socket_endpoint
    address::NTuple{256, Cchar}
    port::UInt32
end

"""
    union (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/io/io.h:21:5)

Documentation not found.
"""
struct var"union (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/io/io.h:21:5)"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"union (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/io/io.h:21:5)"}, f::Symbol)
    f === :fd && return Ptr{Cint}(x + 0)
    f === :handle && return Ptr{Ptr{Cvoid}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"union (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/io/io.h:21:5)", f::Symbol)
    r = Ref{var"union (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/io/io.h:21:5)"}(x)
    ptr = Base.unsafe_convert(Ptr{var"union (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/io/io.h:21:5)"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"union (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/io/io.h:21:5)"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# typedef void aws_io_set_queue_on_handle_fn ( struct aws_io_handle * handle , void * queue )
"""
Documentation not found.
"""
const aws_io_set_queue_on_handle_fn = Cvoid

"""
    aws_io_handle

Documentation not found.
"""
struct aws_io_handle
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{aws_io_handle}, f::Symbol)
    f === :data && return Ptr{var"union (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/io/io.h:21:5)"}(x + 0)
    f === :additional_data && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :set_queue && return Ptr{Ptr{aws_io_set_queue_on_handle_fn}}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::aws_io_handle, f::Symbol)
    r = Ref{aws_io_handle}(x)
    ptr = Base.unsafe_convert(Ptr{aws_io_handle}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_io_handle}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# typedef void ( aws_socket_on_readable_fn ) ( struct aws_socket * socket , int error_code , void * user_data )
"""
Callback for when socket is either readable (edge-triggered) or when an error has occurred. If the socket is readable, error\\_code will be AWS\\_ERROR\\_SUCCESS.

`socket` may be NULL in the callback if the socket is released and cleaned up before the callback is triggered.
"""
const aws_socket_on_readable_fn = Cvoid

# typedef void ( aws_socket_on_connection_result_fn ) ( struct aws_socket * socket , int error_code , void * user_data )
"""
Called in client mode when an outgoing connection has succeeded or an error has occurred. If the connection was successful error\\_code will be AWS\\_ERROR\\_SUCCESS and the socket has already been assigned to the event loop specified in [`aws_socket_connect`](@ref)().

If an error occurred error\\_code will be non-zero.
"""
const aws_socket_on_connection_result_fn = Cvoid

# typedef void ( aws_socket_on_accept_result_fn ) ( struct aws_socket * socket , int error_code , struct aws_socket * new_socket , void * user_data )
"""
Called by a listening socket when either an incoming connection has been received or an error occurred.

In the normal use-case, this function will be called multiple times over the lifetime of a single listening socket. new\\_socket is already connected and initialized, and is using the same options and allocator as the listening socket. A user may want to call [`aws_socket_set_options`](@ref)() on the new socket if different options are desired.

new\\_socket is not yet assigned to an event-loop. The user should call [`aws_socket_assign_to_event_loop`](@ref)() before performing IO operations. The user must call `[`aws_socket_clean_up`](@ref)()` and "aws\\_mem\\_release()" when they're done with the new\\_socket, to free it.

When error\\_code is AWS\\_ERROR\\_SUCCESS, new\\_socket is the recently accepted connection. If error\\_code is non-zero, an error occurred and you should [`aws_socket_close`](@ref)() the socket.

Do not call [`aws_socket_clean_up`](@ref)() from this callback.
"""
const aws_socket_on_accept_result_fn = Cvoid

"""
    aws_socket

Documentation not found.
"""
struct aws_socket
    data::NTuple{672, UInt8}
end

function Base.getproperty(x::Ptr{aws_socket}, f::Symbol)
    f === :vtable && return Ptr{Ptr{aws_socket_vtable}}(x + 0)
    f === :allocator && return Ptr{Ptr{aws_allocator}}(x + 8)
    f === :local_endpoint && return Ptr{aws_socket_endpoint}(x + 16)
    f === :remote_endpoint && return Ptr{aws_socket_endpoint}(x + 276)
    f === :options && return Ptr{aws_socket_options}(x + 536)
    f === :io_handle && return Ptr{aws_io_handle}(x + 576)
    f === :event_loop && return Ptr{Ptr{aws_event_loop}}(x + 600)
    f === :handler && return Ptr{Ptr{aws_channel_handler}}(x + 608)
    f === :state && return Ptr{Cint}(x + 616)
    f === :readable_fn && return Ptr{Ptr{aws_socket_on_readable_fn}}(x + 624)
    f === :readable_user_data && return Ptr{Ptr{Cvoid}}(x + 632)
    f === :connection_result_fn && return Ptr{Ptr{aws_socket_on_connection_result_fn}}(x + 640)
    f === :accept_result_fn && return Ptr{Ptr{aws_socket_on_accept_result_fn}}(x + 648)
    f === :connect_accept_user_data && return Ptr{Ptr{Cvoid}}(x + 656)
    f === :impl && return Ptr{Ptr{Cvoid}}(x + 664)
    return getfield(x, f)
end

function Base.getproperty(x::aws_socket, f::Symbol)
    r = Ref{aws_socket}(x)
    ptr = Base.unsafe_convert(Ptr{aws_socket}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_socket}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    aws_server_bootstrap_new_socket_listener(bootstrap_options)

Sets up a server socket listener. If you are planning on using TLS, use `aws_server_bootstrap_new_tls_socket_listener` instead. This creates a socket listener bound to `local_endpoint` using socket options `options`. `incoming_callback` will be invoked once an incoming channel is ready for use or if an error is encountered. `shutdown_callback` will be invoked once the channel has shutdown. `destroy_callback` will be invoked after the server socket listener is destroyed, and all associated connections and channels have finished shutting down. Immediately after the `shutdown_callback` returns, the channel is cleaned up automatically. All callbacks are invoked the thread of the event-loop that the listening socket is assigned to

`setup_callback`. If set, the callback will be asynchronously invoked when the listener is ready for use. For Apple Network Framework, the listener is not usable until the callback is invoked. If the listener creation failed (return NULL), the `setup_callback` will not be invoked.

Upon shutdown of your application, you'll want to call [`aws_server_bootstrap_destroy_socket_listener`](@ref) with the return value from this function.

bootstrap\\_options is copied.

### Prototype
```c
struct aws_socket *aws_server_bootstrap_new_socket_listener( const struct aws_server_socket_channel_bootstrap_options *bootstrap_options);
```
"""
function aws_server_bootstrap_new_socket_listener(bootstrap_options)
    ccall((:aws_server_bootstrap_new_socket_listener, libaws_c_io), Ptr{aws_socket}, (Ptr{aws_server_socket_channel_bootstrap_options},), bootstrap_options)
end

"""
    aws_server_bootstrap_destroy_socket_listener(bootstrap, listener)

Shuts down 'listener' and cleans up any resources associated with it. Any incoming channels on `listener` will still be active. `destroy_callback` will be invoked after the server socket listener is destroyed, and all associated connections and channels have finished shutting down.

### Prototype
```c
void aws_server_bootstrap_destroy_socket_listener( struct aws_server_bootstrap *bootstrap, struct aws_socket *listener);
```
"""
function aws_server_bootstrap_destroy_socket_listener(bootstrap, listener)
    ccall((:aws_server_bootstrap_destroy_socket_listener, libaws_c_io), Cvoid, (Ptr{aws_server_bootstrap}, Ptr{aws_socket}), bootstrap, listener)
end

"""
Documentation not found.
"""
mutable struct aws_event_loop_options end

# typedef void ( aws_event_loop_on_event_fn ) ( struct aws_event_loop * event_loop , struct aws_io_handle * handle , int events , void * user_data )
"""
```c++
 

```
"""
const aws_event_loop_on_event_fn = Cvoid

"""
    aws_event_loop_vtable

```c++
 

```
"""
struct aws_event_loop_vtable
    start_destroy::Ptr{Cvoid}
    complete_destroy::Ptr{Cvoid}
    run::Ptr{Cvoid}
    stop::Ptr{Cvoid}
    wait_for_stop_completion::Ptr{Cvoid}
    schedule_task_now::Ptr{Cvoid}
    schedule_task_future::Ptr{Cvoid}
    cancel_task::Ptr{Cvoid}
    connect_to_io_completion_port::Ptr{Cvoid}
    subscribe_to_io_events::Ptr{Cvoid}
    unsubscribe_from_io_events::Ptr{Cvoid}
    free_io_event_resources::Ptr{Cvoid}
    get_base_event_loop_group::Ptr{Cvoid}
    is_on_callers_thread::Ptr{Cvoid}
end

"""
    aws_event_loop_type

Event Loop Type. If set to `AWS_EVENT_LOOP_PLATFORM_DEFAULT`, the event loop will automatically use the platform’s default.

Default Event Loop Type Linux | AWS\\_EVENT\\_LOOP\\_EPOLL Windows | AWS\\_EVENT\\_LOOP\\_IOCP BSD Variants| AWS\\_EVENT\\_LOOP\\_KQUEUE macOS | AWS\\_EVENT\\_LOOP\\_KQUEUE iOS | AWS\\_EVENT\\_LOOP\\_DISPATCH\\_QUEUE
"""
@cenum aws_event_loop_type::UInt32 begin
    AWS_EVENT_LOOP_PLATFORM_DEFAULT = 0
    AWS_EVENT_LOOP_EPOLL = 1
    AWS_EVENT_LOOP_IOCP = 2
    AWS_EVENT_LOOP_KQUEUE = 3
    AWS_EVENT_LOOP_DISPATCH_QUEUE = 4
end

# typedef int ( aws_io_clock_fn ) ( uint64_t * timestamp )
"""
Documentation not found.
"""
const aws_io_clock_fn = Cvoid

"""
    aws_event_loop_group_options

Event loop group configuration options
"""
struct aws_event_loop_group_options
    loop_count::UInt16
    type::aws_event_loop_type
    shutdown_options::Ptr{aws_shutdown_callback_options}
    cpu_group::Ptr{UInt16}
    clock_override::Ptr{aws_io_clock_fn}
end

"""
    aws_event_loop_schedule_task_now(event_loop, task)

The event loop will schedule the task and run it on the event loop thread as soon as possible. Note that cancelled tasks may execute outside the event loop thread. This function may be called from outside or inside the event loop thread.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_event_loop_schedule_task_now(struct aws_event_loop *event_loop, struct aws_task *task);
```
"""
function aws_event_loop_schedule_task_now(event_loop, task)
    ccall((:aws_event_loop_schedule_task_now, libaws_c_io), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}), event_loop, task)
end

"""
    aws_event_loop_schedule_task_future(event_loop, task, run_at_nanos)

The event loop will schedule the task and run it at the specified time. Use [`aws_event_loop_current_clock_time`](@ref)() to query the current time in nanoseconds. Note that cancelled tasks may execute outside the event loop thread. This function may be called from outside or inside the event loop thread.

The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_event_loop_schedule_task_future( struct aws_event_loop *event_loop, struct aws_task *task, uint64_t run_at_nanos);
```
"""
function aws_event_loop_schedule_task_future(event_loop, task, run_at_nanos)
    ccall((:aws_event_loop_schedule_task_future, libaws_c_io), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}, UInt64), event_loop, task, run_at_nanos)
end

"""
    aws_event_loop_cancel_task(event_loop, task)

Cancels task. This function must be called from the event loop's thread, and is only guaranteed to work properly on tasks scheduled from within the event loop's thread. The task will be executed with the AWS\\_TASK\\_STATUS\\_CANCELED status inside this call.

### Prototype
```c
void aws_event_loop_cancel_task(struct aws_event_loop *event_loop, struct aws_task *task);
```
"""
function aws_event_loop_cancel_task(event_loop, task)
    ccall((:aws_event_loop_cancel_task, libaws_c_io), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}), event_loop, task)
end

"""
    aws_event_loop_thread_is_callers_thread(event_loop)

Returns true if the event loop's thread is the same thread that called this function, otherwise false.

### Prototype
```c
bool aws_event_loop_thread_is_callers_thread(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_thread_is_callers_thread(event_loop)
    ccall((:aws_event_loop_thread_is_callers_thread, libaws_c_io), Bool, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_current_clock_time(event_loop, time_nanos)

Gets the current timestamp for the event loop's clock, in nanoseconds. This function is thread-safe.

### Prototype
```c
int aws_event_loop_current_clock_time(const struct aws_event_loop *event_loop, uint64_t *time_nanos);
```
"""
function aws_event_loop_current_clock_time(event_loop, time_nanos)
    ccall((:aws_event_loop_current_clock_time, libaws_c_io), Cint, (Ptr{aws_event_loop}, Ptr{UInt64}), event_loop, time_nanos)
end

"""
    aws_event_loop_group_new(allocator, options)

Creation function for event loop groups.

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new( struct aws_allocator *allocator, const struct aws_event_loop_group_options *options);
```
"""
function aws_event_loop_group_new(allocator, options)
    ccall((:aws_event_loop_group_new, libaws_c_io), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, Ptr{aws_event_loop_group_options}), allocator, options)
end

"""
    aws_event_loop_group_acquire(el_group)

Increments the reference count on the event loop group, allowing the caller to take a reference to it.

Returns the same event loop group passed in.

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_acquire(struct aws_event_loop_group *el_group);
```
"""
function aws_event_loop_group_acquire(el_group)
    ccall((:aws_event_loop_group_acquire, libaws_c_io), Ptr{aws_event_loop_group}, (Ptr{aws_event_loop_group},), el_group)
end

"""
    aws_event_loop_group_release(el_group)

Decrements an event loop group's ref count. When the ref count drops to zero, the event loop group will be destroyed.

### Prototype
```c
void aws_event_loop_group_release(struct aws_event_loop_group *el_group);
```
"""
function aws_event_loop_group_release(el_group)
    ccall((:aws_event_loop_group_release, libaws_c_io), Cvoid, (Ptr{aws_event_loop_group},), el_group)
end

"""
    aws_event_loop_group_get_loop_at(el_group, index)

Returns the event loop at a particular index. If the index is out of bounds, null is returned.

### Prototype
```c
struct aws_event_loop *aws_event_loop_group_get_loop_at(struct aws_event_loop_group *el_group, size_t index);
```
"""
function aws_event_loop_group_get_loop_at(el_group, index)
    ccall((:aws_event_loop_group_get_loop_at, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_event_loop_group}, Csize_t), el_group, index)
end

"""
    aws_event_loop_group_get_loop_count(el_group)

Gets the number of event loops managed by an event loop group.

### Prototype
```c
size_t aws_event_loop_group_get_loop_count(const struct aws_event_loop_group *el_group);
```
"""
function aws_event_loop_group_get_loop_count(el_group)
    ccall((:aws_event_loop_group_get_loop_count, libaws_c_io), Csize_t, (Ptr{aws_event_loop_group},), el_group)
end

"""
    aws_event_loop_group_get_next_loop(el_group)

Fetches the next loop for use. The purpose is to enable load balancing across loops. You should not depend on how this load balancing is done as it is subject to change in the future. Currently it uses the "best-of-two" algorithm based on the load factor of each loop.

### Prototype
```c
struct aws_event_loop *aws_event_loop_group_get_next_loop(struct aws_event_loop_group *el_group);
```
"""
function aws_event_loop_group_get_next_loop(el_group)
    ccall((:aws_event_loop_group_get_next_loop, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_event_loop_group},), el_group)
end

"""
    aws_event_loop_group_new_default(alloc, max_threads, shutdown_options)

!!! compat "Deprecated"

    - use [`aws_event_loop_group_new`](@ref)() instead

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new_default( struct aws_allocator *alloc, uint16_t max_threads, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new_default(alloc, max_threads, shutdown_options)
    ccall((:aws_event_loop_group_new_default, libaws_c_io), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, UInt16, Ptr{aws_shutdown_callback_options}), alloc, max_threads, shutdown_options)
end

"""
    aws_event_loop_group_new_default_pinned_to_cpu_group(alloc, max_threads, cpu_group, shutdown_options)

!!! compat "Deprecated"

    - use [`aws_event_loop_group_new`](@ref)() instead

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new_default_pinned_to_cpu_group( struct aws_allocator *alloc, uint16_t max_threads, uint16_t cpu_group, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new_default_pinned_to_cpu_group(alloc, max_threads, cpu_group, shutdown_options)
    ccall((:aws_event_loop_group_new_default_pinned_to_cpu_group, libaws_c_io), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, UInt16, UInt16, Ptr{aws_shutdown_callback_options}), alloc, max_threads, cpu_group, shutdown_options)
end

"""
    aws_event_loop_get_impl(event_loop)

```c++
 - Don't use outside of testing.

 Returns the opaque internal user data of an event loop.  Can be cast into a specific implementation by
 privileged consumers.
 

```

### Prototype
```c
void *aws_event_loop_get_impl(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_get_impl(event_loop)
    ccall((:aws_event_loop_get_impl, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_new_base(allocator, clock, vtable, impl)

```c++
 - Don't use outside of testing.

 Initializes the base structure used by all event loop implementations with test-oriented overrides.
 

```

### Prototype
```c
struct aws_event_loop *aws_event_loop_new_base( struct aws_allocator *allocator, aws_io_clock_fn *clock, struct aws_event_loop_vtable *vtable, void *impl);
```
"""
function aws_event_loop_new_base(allocator, clock, vtable, impl)
    ccall((:aws_event_loop_new_base, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_allocator}, Ptr{aws_io_clock_fn}, Ptr{aws_event_loop_vtable}, Ptr{Cvoid}), allocator, clock, vtable, impl)
end

"""
    aws_event_loop_clean_up_base(event_loop)

```c++
 - Don't use outside of testing.

 Common cleanup code for all implementations.
 This is only called from the *destroy() function of event loop implementations.
 

```

### Prototype
```c
void aws_event_loop_clean_up_base(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_clean_up_base(event_loop)
    ccall((:aws_event_loop_clean_up_base, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_destroy(event_loop)

```c++
 - Don't use outside of testing.

 Destroys an event loop implementation.
 If the event loop is still in a running state, this function will block waiting on the event loop to shutdown.
 If the event loop is shared by multiple threads then destroy must be called by exactly one thread. All other threads
 must ensure their API calls to the event loop happen-before the call to destroy.

 Internally, this calls aws_event_loop_start_destroy() followed by aws_event_loop_complete_destroy()
 

```

### Prototype
```c
void aws_event_loop_destroy(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_destroy(event_loop)
    ccall((:aws_event_loop_destroy, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_start_destroy(event_loop)

```c++

 Signals an event loop to begin its destruction process.  If an event loop's implementation of this API does anything,
 it must be quick and non-blocking.  Most event loop implementations have an empty implementation for this function.
 

```

### Prototype
```c
void aws_event_loop_start_destroy(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_start_destroy(event_loop)
    ccall((:aws_event_loop_start_destroy, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_complete_destroy(event_loop)

```c++

 Waits for an event loop to complete its destruction process.  aws_event_loop_start_destroy() must have been called
 previously for this function to not deadlock.
 

```

### Prototype
```c
void aws_event_loop_complete_destroy(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_complete_destroy(event_loop)
    ccall((:aws_event_loop_complete_destroy, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

# typedef void ( aws_future_callback_fn ) ( void * user_data )
"""
Completion callback for aws\\_future<T>
"""
const aws_future_callback_fn = Cvoid

"""
Documentation not found.
"""
mutable struct aws_future_impl end

"""
    aws_future_impl_acquire(promise)

Documentation not found.
### Prototype
```c
struct aws_future_impl *aws_future_impl_acquire(struct aws_future_impl *promise);
```
"""
function aws_future_impl_acquire(promise)
    ccall((:aws_future_impl_acquire, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_future_impl},), promise)
end

"""
    aws_future_impl_release(promise)

Documentation not found.
### Prototype
```c
struct aws_future_impl *aws_future_impl_release(struct aws_future_impl *promise);
```
"""
function aws_future_impl_release(promise)
    ccall((:aws_future_impl_release, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_future_impl},), promise)
end

"""
    aws_future_impl_set_error(promise, error_code)

Documentation not found.
### Prototype
```c
void aws_future_impl_set_error(struct aws_future_impl *promise, int error_code);
```
"""
function aws_future_impl_set_error(promise, error_code)
    ccall((:aws_future_impl_set_error, libaws_c_io), Cvoid, (Ptr{aws_future_impl}, Cint), promise, error_code)
end

"""
    aws_future_impl_is_done(future)

Documentation not found.
### Prototype
```c
bool aws_future_impl_is_done(const struct aws_future_impl *future);
```
"""
function aws_future_impl_is_done(future)
    ccall((:aws_future_impl_is_done, libaws_c_io), Bool, (Ptr{aws_future_impl},), future)
end

"""
    aws_future_impl_get_error(future)

Documentation not found.
### Prototype
```c
int aws_future_impl_get_error(const struct aws_future_impl *future);
```
"""
function aws_future_impl_get_error(future)
    ccall((:aws_future_impl_get_error, libaws_c_io), Cint, (Ptr{aws_future_impl},), future)
end

"""
    aws_future_impl_register_callback(future, on_done, user_data)

Documentation not found.
### Prototype
```c
void aws_future_impl_register_callback( struct aws_future_impl *future, aws_future_callback_fn *on_done, void *user_data);
```
"""
function aws_future_impl_register_callback(future, on_done, user_data)
    ccall((:aws_future_impl_register_callback, libaws_c_io), Cvoid, (Ptr{aws_future_impl}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, on_done, user_data)
end

"""
    aws_future_impl_register_callback_if_not_done(future, on_done, user_data)

Documentation not found.
### Prototype
```c
bool aws_future_impl_register_callback_if_not_done( struct aws_future_impl *future, aws_future_callback_fn *on_done, void *user_data);
```
"""
function aws_future_impl_register_callback_if_not_done(future, on_done, user_data)
    ccall((:aws_future_impl_register_callback_if_not_done, libaws_c_io), Bool, (Ptr{aws_future_impl}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, on_done, user_data)
end

"""
    aws_future_impl_register_event_loop_callback(future, event_loop, on_done, user_data)

Documentation not found.
### Prototype
```c
void aws_future_impl_register_event_loop_callback( struct aws_future_impl *future, struct aws_event_loop *event_loop, aws_future_callback_fn *on_done, void *user_data);
```
"""
function aws_future_impl_register_event_loop_callback(future, event_loop, on_done, user_data)
    ccall((:aws_future_impl_register_event_loop_callback, libaws_c_io), Cvoid, (Ptr{aws_future_impl}, Ptr{aws_event_loop}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, event_loop, on_done, user_data)
end

"""
    aws_future_impl_register_channel_callback(future, channel, on_done, user_data)

Documentation not found.
### Prototype
```c
void aws_future_impl_register_channel_callback( struct aws_future_impl *future, struct aws_channel *channel, aws_future_callback_fn *on_done, void *user_data);
```
"""
function aws_future_impl_register_channel_callback(future, channel, on_done, user_data)
    ccall((:aws_future_impl_register_channel_callback, libaws_c_io), Cvoid, (Ptr{aws_future_impl}, Ptr{aws_channel}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, channel, on_done, user_data)
end

"""
    aws_future_impl_wait(future, timeout_ns)

Documentation not found.
### Prototype
```c
bool aws_future_impl_wait(const struct aws_future_impl *future, uint64_t timeout_ns);
```
"""
function aws_future_impl_wait(future, timeout_ns)
    ccall((:aws_future_impl_wait, libaws_c_io), Bool, (Ptr{aws_future_impl}, UInt64), future, timeout_ns)
end

"""
    aws_future_impl_new_by_value(alloc, sizeof_result)

Documentation not found.
### Prototype
```c
struct aws_future_impl *aws_future_impl_new_by_value(struct aws_allocator *alloc, size_t sizeof_result);
```
"""
function aws_future_impl_new_by_value(alloc, sizeof_result)
    ccall((:aws_future_impl_new_by_value, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_allocator}, Csize_t), alloc, sizeof_result)
end

"""
    aws_future_impl_set_result_by_move(promise, src_address)

Documentation not found.
### Prototype
```c
void aws_future_impl_set_result_by_move(struct aws_future_impl *promise, void *src_address);
```
"""
function aws_future_impl_set_result_by_move(promise, src_address)
    ccall((:aws_future_impl_set_result_by_move, libaws_c_io), Cvoid, (Ptr{aws_future_impl}, Ptr{Cvoid}), promise, src_address)
end

"""
    aws_future_impl_get_result_address(future)

Documentation not found.
### Prototype
```c
void *aws_future_impl_get_result_address(const struct aws_future_impl *future);
```
"""
function aws_future_impl_get_result_address(future)
    ccall((:aws_future_impl_get_result_address, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_future_impl},), future)
end

# typedef void ( aws_future_impl_result_clean_up_fn ) ( void * result_addr )
"""
Documentation not found.
"""
const aws_future_impl_result_clean_up_fn = Cvoid

"""
    aws_future_impl_new_by_value_with_clean_up(alloc, sizeof_result, result_clean_up)

Documentation not found.
### Prototype
```c
struct aws_future_impl *aws_future_impl_new_by_value_with_clean_up( struct aws_allocator *alloc, size_t sizeof_result, aws_future_impl_result_clean_up_fn *result_clean_up);
```
"""
function aws_future_impl_new_by_value_with_clean_up(alloc, sizeof_result, result_clean_up)
    ccall((:aws_future_impl_new_by_value_with_clean_up, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_allocator}, Csize_t, Ptr{aws_future_impl_result_clean_up_fn}), alloc, sizeof_result, result_clean_up)
end

"""
    aws_future_impl_get_result_by_move(future, dst_address)

Documentation not found.
### Prototype
```c
void aws_future_impl_get_result_by_move(struct aws_future_impl *future, void *dst_address);
```
"""
function aws_future_impl_get_result_by_move(future, dst_address)
    ccall((:aws_future_impl_get_result_by_move, libaws_c_io), Cvoid, (Ptr{aws_future_impl}, Ptr{Cvoid}), future, dst_address)
end

"""
    aws_future_impl_new_pointer(alloc)

Documentation not found.
### Prototype
```c
struct aws_future_impl *aws_future_impl_new_pointer(struct aws_allocator *alloc);
```
"""
function aws_future_impl_new_pointer(alloc)
    ccall((:aws_future_impl_new_pointer, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_allocator},), alloc)
end

# typedef void ( aws_future_impl_result_destroy_fn ) ( void * result )
"""
Documentation not found.
"""
const aws_future_impl_result_destroy_fn = Cvoid

"""
    aws_future_impl_new_pointer_with_destroy(alloc, result_destroy)

Documentation not found.
### Prototype
```c
struct aws_future_impl *aws_future_impl_new_pointer_with_destroy( struct aws_allocator *alloc, aws_future_impl_result_destroy_fn *result_destroy);
```
"""
function aws_future_impl_new_pointer_with_destroy(alloc, result_destroy)
    ccall((:aws_future_impl_new_pointer_with_destroy, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_allocator}, Ptr{aws_future_impl_result_destroy_fn}), alloc, result_destroy)
end

# typedef void * ( aws_future_impl_result_release_fn ) ( void * result )
"""
Documentation not found.
"""
const aws_future_impl_result_release_fn = Cvoid

"""
    aws_future_impl_new_pointer_with_release(alloc, result_release)

Documentation not found.
### Prototype
```c
struct aws_future_impl *aws_future_impl_new_pointer_with_release( struct aws_allocator *alloc, aws_future_impl_result_release_fn *result_release);
```
"""
function aws_future_impl_new_pointer_with_release(alloc, result_release)
    ccall((:aws_future_impl_new_pointer_with_release, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_allocator}, Ptr{aws_future_impl_result_release_fn}), alloc, result_release)
end

"""
Documentation not found.
"""
mutable struct aws_future_size end

"""
    aws_future_size_new(alloc)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_new(alloc)
    ccall((:aws_future_size_new, libaws_c_io), Ptr{aws_future_size}, (Ptr{aws_allocator},), alloc)
end

"""
    aws_future_size_set_result(future, result)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_set_result(future, result)
    ccall((:aws_future_size_set_result, libaws_c_io), Cvoid, (Ptr{aws_future_size}, Csize_t), future, result)
end

"""
    aws_future_size_get_result(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_get_result(future)
    ccall((:aws_future_size_get_result, libaws_c_io), Csize_t, (Ptr{aws_future_size},), future)
end

"""
    aws_future_size_acquire(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_acquire(future)
    ccall((:aws_future_size_acquire, libaws_c_io), Ptr{aws_future_size}, (Ptr{aws_future_size},), future)
end

"""
    aws_future_size_release(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_release(future)
    ccall((:aws_future_size_release, libaws_c_io), Ptr{aws_future_size}, (Ptr{aws_future_size},), future)
end

"""
    aws_future_size_set_error(future, error_code)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_set_error(future, error_code)
    ccall((:aws_future_size_set_error, libaws_c_io), Cvoid, (Ptr{aws_future_size}, Cint), future, error_code)
end

"""
    aws_future_size_is_done(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_is_done(future)
    ccall((:aws_future_size_is_done, libaws_c_io), Bool, (Ptr{aws_future_size},), future)
end

"""
    aws_future_size_get_error(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_get_error(future)
    ccall((:aws_future_size_get_error, libaws_c_io), Cint, (Ptr{aws_future_size},), future)
end

"""
    aws_future_size_register_callback(future, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_register_callback(future, on_done, user_data)
    ccall((:aws_future_size_register_callback, libaws_c_io), Cvoid, (Ptr{aws_future_size}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, on_done, user_data)
end

"""
    aws_future_size_register_callback_if_not_done(future, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_register_callback_if_not_done(future, on_done, user_data)
    ccall((:aws_future_size_register_callback_if_not_done, libaws_c_io), Bool, (Ptr{aws_future_size}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, on_done, user_data)
end

"""
    aws_future_size_register_event_loop_callback(future, event_loop, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_register_event_loop_callback(future, event_loop, on_done, user_data)
    ccall((:aws_future_size_register_event_loop_callback, libaws_c_io), Cvoid, (Ptr{aws_future_size}, Ptr{aws_event_loop}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, event_loop, on_done, user_data)
end

"""
    aws_future_size_register_channel_callback(future, channel, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_register_channel_callback(future, channel, on_done, user_data)
    ccall((:aws_future_size_register_channel_callback, libaws_c_io), Cvoid, (Ptr{aws_future_size}, Ptr{aws_channel}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, channel, on_done, user_data)
end

"""
    aws_future_size_wait(future, timeout_ns)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_size, size_t, AWS_IO_API);
```
"""
function aws_future_size_wait(future, timeout_ns)
    ccall((:aws_future_size_wait, libaws_c_io), Bool, (Ptr{aws_future_size}, UInt64), future, timeout_ns)
end

"""
    aws_future_bool_new(alloc)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_new(alloc)
    ccall((:aws_future_bool_new, libaws_c_io), Ptr{aws_future_bool}, (Ptr{aws_allocator},), alloc)
end

"""
    aws_future_bool_set_result(future, result)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_set_result(future, result)
    ccall((:aws_future_bool_set_result, libaws_c_io), Cvoid, (Ptr{aws_future_bool}, Bool), future, result)
end

"""
    aws_future_bool_get_result(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_get_result(future)
    ccall((:aws_future_bool_get_result, libaws_c_io), Bool, (Ptr{aws_future_bool},), future)
end

"""
    aws_future_bool_acquire(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_acquire(future)
    ccall((:aws_future_bool_acquire, libaws_c_io), Ptr{aws_future_bool}, (Ptr{aws_future_bool},), future)
end

"""
    aws_future_bool_release(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_release(future)
    ccall((:aws_future_bool_release, libaws_c_io), Ptr{aws_future_bool}, (Ptr{aws_future_bool},), future)
end

"""
    aws_future_bool_set_error(future, error_code)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_set_error(future, error_code)
    ccall((:aws_future_bool_set_error, libaws_c_io), Cvoid, (Ptr{aws_future_bool}, Cint), future, error_code)
end

"""
    aws_future_bool_is_done(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_is_done(future)
    ccall((:aws_future_bool_is_done, libaws_c_io), Bool, (Ptr{aws_future_bool},), future)
end

"""
    aws_future_bool_get_error(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_get_error(future)
    ccall((:aws_future_bool_get_error, libaws_c_io), Cint, (Ptr{aws_future_bool},), future)
end

"""
    aws_future_bool_register_callback(future, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_register_callback(future, on_done, user_data)
    ccall((:aws_future_bool_register_callback, libaws_c_io), Cvoid, (Ptr{aws_future_bool}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, on_done, user_data)
end

"""
    aws_future_bool_register_callback_if_not_done(future, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_register_callback_if_not_done(future, on_done, user_data)
    ccall((:aws_future_bool_register_callback_if_not_done, libaws_c_io), Bool, (Ptr{aws_future_bool}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, on_done, user_data)
end

"""
    aws_future_bool_register_event_loop_callback(future, event_loop, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_register_event_loop_callback(future, event_loop, on_done, user_data)
    ccall((:aws_future_bool_register_event_loop_callback, libaws_c_io), Cvoid, (Ptr{aws_future_bool}, Ptr{aws_event_loop}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, event_loop, on_done, user_data)
end

"""
    aws_future_bool_register_channel_callback(future, channel, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_register_channel_callback(future, channel, on_done, user_data)
    ccall((:aws_future_bool_register_channel_callback, libaws_c_io), Cvoid, (Ptr{aws_future_bool}, Ptr{aws_channel}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, channel, on_done, user_data)
end

"""
    aws_future_bool_wait(future, timeout_ns)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_wait(future, timeout_ns)
    ccall((:aws_future_bool_wait, libaws_c_io), Bool, (Ptr{aws_future_bool}, UInt64), future, timeout_ns)
end

"""
Documentation not found.
"""
mutable struct aws_future_void end

"""
    aws_future_void_new(alloc)

aws\\_future<void>

### Prototype
```c
struct aws_future_void *aws_future_void_new(struct aws_allocator *alloc);
```
"""
function aws_future_void_new(alloc)
    ccall((:aws_future_void_new, libaws_c_io), Ptr{aws_future_void}, (Ptr{aws_allocator},), alloc)
end

"""
    aws_future_void_set_result(future)

Documentation not found.
### Prototype
```c
void aws_future_void_set_result(struct aws_future_void *future);
```
"""
function aws_future_void_set_result(future)
    ccall((:aws_future_void_set_result, libaws_c_io), Cvoid, (Ptr{aws_future_void},), future)
end

"""
    aws_future_void_acquire(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_acquire(future)
    ccall((:aws_future_void_acquire, libaws_c_io), Ptr{aws_future_void}, (Ptr{aws_future_void},), future)
end

"""
    aws_future_void_release(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_release(future)
    ccall((:aws_future_void_release, libaws_c_io), Ptr{aws_future_void}, (Ptr{aws_future_void},), future)
end

"""
    aws_future_void_set_error(future, error_code)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_set_error(future, error_code)
    ccall((:aws_future_void_set_error, libaws_c_io), Cvoid, (Ptr{aws_future_void}, Cint), future, error_code)
end

"""
    aws_future_void_is_done(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_is_done(future)
    ccall((:aws_future_void_is_done, libaws_c_io), Bool, (Ptr{aws_future_void},), future)
end

"""
    aws_future_void_get_error(future)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_get_error(future)
    ccall((:aws_future_void_get_error, libaws_c_io), Cint, (Ptr{aws_future_void},), future)
end

"""
    aws_future_void_register_callback(future, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_register_callback(future, on_done, user_data)
    ccall((:aws_future_void_register_callback, libaws_c_io), Cvoid, (Ptr{aws_future_void}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, on_done, user_data)
end

"""
    aws_future_void_register_callback_if_not_done(future, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_register_callback_if_not_done(future, on_done, user_data)
    ccall((:aws_future_void_register_callback_if_not_done, libaws_c_io), Bool, (Ptr{aws_future_void}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, on_done, user_data)
end

"""
    aws_future_void_register_event_loop_callback(future, event_loop, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_register_event_loop_callback(future, event_loop, on_done, user_data)
    ccall((:aws_future_void_register_event_loop_callback, libaws_c_io), Cvoid, (Ptr{aws_future_void}, Ptr{aws_event_loop}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, event_loop, on_done, user_data)
end

"""
    aws_future_void_register_channel_callback(future, channel, on_done, user_data)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_register_channel_callback(future, channel, on_done, user_data)
    ccall((:aws_future_void_register_channel_callback, libaws_c_io), Cvoid, (Ptr{aws_future_void}, Ptr{aws_channel}, Ptr{aws_future_callback_fn}, Ptr{Cvoid}), future, channel, on_done, user_data)
end

"""
    aws_future_void_wait(future, timeout_ns)

Documentation not found.
### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_wait(future, timeout_ns)
    ccall((:aws_future_void_wait, libaws_c_io), Bool, (Ptr{aws_future_void}, UInt64), future, timeout_ns)
end

"""
    aws_address_record_type

Documentation not found.
"""
@cenum aws_address_record_type::UInt32 begin
    AWS_ADDRESS_RECORD_TYPE_A = 0
    AWS_ADDRESS_RECORD_TYPE_AAAA = 1
end

"""
    aws_get_host_address_flags

Documentation not found.
"""
@cenum aws_get_host_address_flags::UInt32 begin
    AWS_GET_HOST_ADDRESS_COUNT_RECORD_TYPE_A = 1
    AWS_GET_HOST_ADDRESS_COUNT_RECORD_TYPE_AAAA = 2
end

"""
    aws_host_address

Documentation not found.
"""
struct aws_host_address
    allocator::Ptr{aws_allocator}
    host::Ptr{aws_string}
    address::Ptr{aws_string}
    record_type::aws_address_record_type
    expiry::UInt64
    use_count::Csize_t
    connection_failure_count::Csize_t
    weight::UInt8
end

# typedef void ( aws_on_host_resolved_result_fn ) ( struct aws_host_resolver * resolver , const struct aws_string * host_name , int err_code , const struct aws_array_list * host_addresses , void * user_data )
"""
Invoked once an address has been resolved for host. The type in host\\_addresses is struct [`aws_host_address`](@ref) (by-value). The caller does not own this memory and you must copy the host address before returning from this function if you plan to use it later. For convenience, we've provided the [`aws_host_address_copy`](@ref)() and [`aws_host_address_clean_up`](@ref)() functions.
"""
const aws_on_host_resolved_result_fn = Cvoid

"""
    aws_host_resolver_purge_host_options

Documentation not found.
"""
struct aws_host_resolver_purge_host_options
    host::Ptr{aws_string}
    on_host_purge_complete_callback::Ptr{aws_simple_completion_callback}
    user_data::Ptr{Cvoid}
end

"""
    aws_host_resolver_default_options

Documentation not found.
"""
struct aws_host_resolver_default_options
    max_entries::Csize_t
    el_group::Ptr{aws_event_loop_group}
    shutdown_options::Ptr{aws_shutdown_callback_options}
    system_clock_override_fn::Ptr{aws_io_clock_fn}
end

"""
    aws_host_address_copy(from, to)

Copies `from` to `to`.

### Prototype
```c
int aws_host_address_copy(const struct aws_host_address *from, struct aws_host_address *to);
```
"""
function aws_host_address_copy(from, to)
    ccall((:aws_host_address_copy, libaws_c_io), Cint, (Ptr{aws_host_address}, Ptr{aws_host_address}), from, to)
end

"""
    aws_host_address_move(from, to)

Moves `from` to `to`. After this call, from is no longer usable. Though, it could be resused for another move or copy operation.

### Prototype
```c
void aws_host_address_move(struct aws_host_address *from, struct aws_host_address *to);
```
"""
function aws_host_address_move(from, to)
    ccall((:aws_host_address_move, libaws_c_io), Cvoid, (Ptr{aws_host_address}, Ptr{aws_host_address}), from, to)
end

"""
    aws_host_address_clean_up(address)

Cleans up the memory for `address`

### Prototype
```c
void aws_host_address_clean_up(struct aws_host_address *address);
```
"""
function aws_host_address_clean_up(address)
    ccall((:aws_host_address_clean_up, libaws_c_io), Cvoid, (Ptr{aws_host_address},), address)
end

"""
    aws_default_dns_resolve(allocator, host_name, output_addresses, user_data)

WARNING! do not call this function directly (getaddrinfo()): it blocks. Provide a pointer to this function for other resolution functions.

### Prototype
```c
int aws_default_dns_resolve( struct aws_allocator *allocator, const struct aws_string *host_name, struct aws_array_list *output_addresses, void *user_data);
```
"""
function aws_default_dns_resolve(allocator, host_name, output_addresses, user_data)
    ccall((:aws_default_dns_resolve, libaws_c_io), Cint, (Ptr{aws_allocator}, Ptr{aws_string}, Ptr{aws_array_list}, Ptr{Cvoid}), allocator, host_name, output_addresses, user_data)
end

"""
    aws_host_resolver_new_default(allocator, options)

Creates a host resolver with the default behavior. Here's the behavior:

Since there's not a reliable way to do non-blocking DNS without a ton of risky work that would need years of testing on every Unix system in existence, we work around it by doing a threaded implementation.

When you request an address, it checks the cache. If the entry isn't in the cache it creates a new one. Each entry has a potentially short lived back-ground thread based on ttl for the records. Once we've populated the cache and you keep the resolver active, the resolution callback will be invoked immediately. When it's idle, it will take a little while in the background thread to fetch more, evaluate TTLs etc... In that case your callback will be invoked from the background thread.

--------------------------------------------------------------------------------------------------------------------

A few things to note about TTLs and connection failures.

We attempt to honor your max ttl but will not honor it if dns queries are failing or all of your connections are marked as failed. Once we are able to query dns again, we will re-evaluate the TTLs.

Upon notification connection failures, we move them to a separate list. Eventually we retry them when it's likely that the endpoint is healthy again or we don't really have another choice, but we try to keep them out of your hot path.

---------------------------------------------------------------------------------------------------------------------

Finally, this entire design attempts to prevent problems where developers have to choose between large TTLs and thus sticky hosts or short TTLs and good fleet utilization but now higher latencies. In this design, we resolve every second in the background (only while you're actually using the record), but we do not expire the earlier resolved addresses until max ttl has passed.

This for example, should enable you to hit thousands of hosts in the Amazon S3 fleet instead of just one or two.

### Prototype
```c
struct aws_host_resolver *aws_host_resolver_new_default( struct aws_allocator *allocator, const struct aws_host_resolver_default_options *options);
```
"""
function aws_host_resolver_new_default(allocator, options)
    ccall((:aws_host_resolver_new_default, libaws_c_io), Ptr{aws_host_resolver}, (Ptr{aws_allocator}, Ptr{aws_host_resolver_default_options}), allocator, options)
end

"""
    aws_host_resolver_acquire(resolver)

Increments the reference count on the host resolver, allowing the caller to take a reference to it.

Returns the same host resolver passed in.

### Prototype
```c
struct aws_host_resolver *aws_host_resolver_acquire(struct aws_host_resolver *resolver);
```
"""
function aws_host_resolver_acquire(resolver)
    ccall((:aws_host_resolver_acquire, libaws_c_io), Ptr{aws_host_resolver}, (Ptr{aws_host_resolver},), resolver)
end

"""
    aws_host_resolver_release(resolver)

Decrements a host resolver's ref count. When the ref count drops to zero, the resolver will be destroyed.

### Prototype
```c
void aws_host_resolver_release(struct aws_host_resolver *resolver);
```
"""
function aws_host_resolver_release(resolver)
    ccall((:aws_host_resolver_release, libaws_c_io), Cvoid, (Ptr{aws_host_resolver},), resolver)
end

"""
    aws_host_resolver_resolve_host(resolver, host_name, res, config, user_data)

calls resolve\\_host on the vtable. config will be copied.

### Prototype
```c
int aws_host_resolver_resolve_host( struct aws_host_resolver *resolver, const struct aws_string *host_name, aws_on_host_resolved_result_fn *res, const struct aws_host_resolution_config *config, void *user_data);
```
"""
function aws_host_resolver_resolve_host(resolver, host_name, res, config, user_data)
    ccall((:aws_host_resolver_resolve_host, libaws_c_io), Cint, (Ptr{aws_host_resolver}, Ptr{aws_string}, Ptr{aws_on_host_resolved_result_fn}, Ptr{aws_host_resolution_config}, Ptr{Cvoid}), resolver, host_name, res, config, user_data)
end

"""
    aws_host_resolver_record_connection_failure(resolver, address)

calls record\\_connection\\_failure on the vtable.

### Prototype
```c
int aws_host_resolver_record_connection_failure( struct aws_host_resolver *resolver, const struct aws_host_address *address);
```
"""
function aws_host_resolver_record_connection_failure(resolver, address)
    ccall((:aws_host_resolver_record_connection_failure, libaws_c_io), Cint, (Ptr{aws_host_resolver}, Ptr{aws_host_address}), resolver, address)
end

"""
    aws_host_resolver_purge_cache(resolver)

!!! compat "Deprecated"

    Use purge\\_cache\\_with\\_callback instead calls purge\\_cache on the vtable.

### Prototype
```c
int aws_host_resolver_purge_cache(struct aws_host_resolver *resolver);
```
"""
function aws_host_resolver_purge_cache(resolver)
    ccall((:aws_host_resolver_purge_cache, libaws_c_io), Cint, (Ptr{aws_host_resolver},), resolver)
end

"""
    aws_host_resolver_purge_cache_with_callback(resolver, on_purge_cache_complete_callback, user_data)

Calls [`aws_host_resolver_purge_cache_with_callback`](@ref) on the vtable which will wipe out everything host resolver has cached.

### Prototype
```c
int aws_host_resolver_purge_cache_with_callback( struct aws_host_resolver *resolver, aws_simple_completion_callback *on_purge_cache_complete_callback, void *user_data);
```
"""
function aws_host_resolver_purge_cache_with_callback(resolver, on_purge_cache_complete_callback, user_data)
    ccall((:aws_host_resolver_purge_cache_with_callback, libaws_c_io), Cint, (Ptr{aws_host_resolver}, Ptr{aws_simple_completion_callback}, Ptr{Cvoid}), resolver, on_purge_cache_complete_callback, user_data)
end

"""
    aws_host_resolver_purge_host_cache(resolver, options)

Removes the cache for a host asynchronously.

### Prototype
```c
int aws_host_resolver_purge_host_cache( struct aws_host_resolver *resolver, const struct aws_host_resolver_purge_host_options *options);
```
"""
function aws_host_resolver_purge_host_cache(resolver, options)
    ccall((:aws_host_resolver_purge_host_cache, libaws_c_io), Cint, (Ptr{aws_host_resolver}, Ptr{aws_host_resolver_purge_host_options}), resolver, options)
end

"""
    aws_host_resolver_get_host_address_count(resolver, host_name, flags)

get number of addresses for a given host.

### Prototype
```c
size_t aws_host_resolver_get_host_address_count( struct aws_host_resolver *resolver, const struct aws_string *host_name, uint32_t flags);
```
"""
function aws_host_resolver_get_host_address_count(resolver, host_name, flags)
    ccall((:aws_host_resolver_get_host_address_count, libaws_c_io), Csize_t, (Ptr{aws_host_resolver}, Ptr{aws_string}, UInt32), resolver, host_name, flags)
end

"""
    aws_host_resolver_init_default_resolution_config()

Returns the default host resolution config used internally if none specified.

# Returns
default host resolution config
### Prototype
```c
struct aws_host_resolution_config aws_host_resolver_init_default_resolution_config(void);
```
"""
function aws_host_resolver_init_default_resolution_config()
    ccall((:aws_host_resolver_init_default_resolution_config, libaws_c_io), aws_host_resolution_config, ())
end

"""
    aws_io_errors

Documentation not found.
"""
@cenum aws_io_errors::UInt32 begin
    AWS_IO_CHANNEL_ERROR_ERROR_CANT_ACCEPT_INPUT = 1024
    AWS_IO_CHANNEL_UNKNOWN_MESSAGE_TYPE = 1025
    AWS_IO_CHANNEL_READ_WOULD_EXCEED_WINDOW = 1026
    AWS_IO_EVENT_LOOP_ALREADY_ASSIGNED = 1027
    AWS_IO_EVENT_LOOP_SHUTDOWN = 1028
    AWS_IO_MISSING_ALPN_MESSAGE = 1029
    AWS_IO_UNHANDLED_ALPN_PROTOCOL_MESSAGE = 1030
    AWS_IO_FILE_VALIDATION_FAILURE = 1031
    AWS_ERROR_IO_EVENT_LOOP_THREAD_ONLY = 1032
    AWS_ERROR_IO_ALREADY_SUBSCRIBED = 1033
    AWS_ERROR_IO_NOT_SUBSCRIBED = 1034
    AWS_ERROR_IO_OPERATION_CANCELLED = 1035
    AWS_IO_READ_WOULD_BLOCK = 1036
    AWS_IO_BROKEN_PIPE = 1037
    AWS_IO_SOCKET_UNSUPPORTED_ADDRESS_FAMILY = 1038
    AWS_IO_SOCKET_INVALID_OPERATION_FOR_TYPE = 1039
    AWS_IO_SOCKET_CONNECTION_REFUSED = 1040
    AWS_IO_SOCKET_TIMEOUT = 1041
    AWS_IO_SOCKET_NO_ROUTE_TO_HOST = 1042
    AWS_IO_SOCKET_NETWORK_DOWN = 1043
    AWS_IO_SOCKET_CLOSED = 1044
    AWS_IO_SOCKET_NOT_CONNECTED = 1045
    AWS_IO_SOCKET_INVALID_OPTIONS = 1046
    AWS_IO_SOCKET_ADDRESS_IN_USE = 1047
    AWS_IO_SOCKET_INVALID_ADDRESS = 1048
    AWS_IO_SOCKET_ILLEGAL_OPERATION_FOR_STATE = 1049
    AWS_IO_SOCKET_CONNECT_ABORTED = 1050
    AWS_IO_SOCKET_MISSING_EVENT_LOOP = 1051
    AWS_IO_DNS_QUERY_FAILED = 1052
    AWS_IO_DNS_INVALID_NAME = 1053
    AWS_IO_DNS_NO_ADDRESS_FOR_HOST = 1054
    AWS_IO_DNS_HOST_REMOVED_FROM_CACHE = 1055
    AWS_IO_STREAM_INVALID_SEEK_POSITION = 1056
    AWS_IO_STREAM_READ_FAILED = 1057
    DEPRECATED_AWS_IO_INVALID_FILE_HANDLE = 1058
    AWS_IO_SHARED_LIBRARY_LOAD_FAILURE = 1059
    AWS_IO_SHARED_LIBRARY_FIND_SYMBOL_FAILURE = 1060
    AWS_IO_MAX_RETRIES_EXCEEDED = 1061
    AWS_IO_RETRY_PERMISSION_DENIED = 1062
    AWS_IO_TLS_ERROR_NEGOTIATION_FAILURE = 1063
    AWS_IO_TLS_ERROR_NOT_NEGOTIATED = 1064
    AWS_IO_TLS_ERROR_WRITE_FAILURE = 1065
    AWS_IO_TLS_ERROR_ALERT_RECEIVED = 1066
    AWS_IO_TLS_CTX_ERROR = 1067
    AWS_IO_TLS_VERSION_UNSUPPORTED = 1068
    AWS_IO_TLS_CIPHER_PREF_UNSUPPORTED = 1069
    AWS_IO_TLS_NEGOTIATION_TIMEOUT = 1070
    AWS_IO_TLS_ALERT_NOT_GRACEFUL = 1071
    AWS_IO_TLS_DIGEST_ALGORITHM_UNSUPPORTED = 1072
    AWS_IO_TLS_SIGNATURE_ALGORITHM_UNSUPPORTED = 1073
    AWS_IO_TLS_ERROR_READ_FAILURE = 1074
    AWS_IO_TLS_UNKNOWN_ROOT_CERTIFICATE = 1075
    AWS_IO_TLS_NO_ROOT_CERTIFICATE_FOUND = 1076
    AWS_IO_TLS_CERTIFICATE_EXPIRED = 1077
    AWS_IO_TLS_CERTIFICATE_NOT_YET_VALID = 1078
    AWS_IO_TLS_BAD_CERTIFICATE = 1079
    AWS_IO_TLS_PEER_CERTIFICATE_EXPIRED = 1080
    AWS_IO_TLS_BAD_PEER_CERTIFICATE = 1081
    AWS_IO_TLS_PEER_CERTIFICATE_REVOKED = 1082
    AWS_IO_TLS_PEER_CERTIFICATE_UNKNOWN = 1083
    AWS_IO_TLS_INTERNAL_ERROR = 1084
    AWS_IO_TLS_CLOSED_GRACEFUL = 1085
    AWS_IO_TLS_CLOSED_ABORT = 1086
    AWS_IO_TLS_INVALID_CERTIFICATE_CHAIN = 1087
    AWS_IO_TLS_HOST_NAME_MISSMATCH = 1088
    AWS_ERROR_PKCS11_VERSION_UNSUPPORTED = 1089
    AWS_ERROR_PKCS11_TOKEN_NOT_FOUND = 1090
    AWS_ERROR_PKCS11_KEY_NOT_FOUND = 1091
    AWS_ERROR_PKCS11_KEY_TYPE_UNSUPPORTED = 1092
    AWS_ERROR_PKCS11_UNKNOWN_CRYPTOKI_RETURN_VALUE = 1093
    AWS_ERROR_PKCS11_CKR_CANCEL = 1094
    AWS_ERROR_PKCS11_CKR_HOST_MEMORY = 1095
    AWS_ERROR_PKCS11_CKR_SLOT_ID_INVALID = 1096
    AWS_ERROR_PKCS11_CKR_GENERAL_ERROR = 1097
    AWS_ERROR_PKCS11_CKR_FUNCTION_FAILED = 1098
    AWS_ERROR_PKCS11_CKR_ARGUMENTS_BAD = 1099
    AWS_ERROR_PKCS11_CKR_NO_EVENT = 1100
    AWS_ERROR_PKCS11_CKR_NEED_TO_CREATE_THREADS = 1101
    AWS_ERROR_PKCS11_CKR_CANT_LOCK = 1102
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_READ_ONLY = 1103
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_SENSITIVE = 1104
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_TYPE_INVALID = 1105
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_VALUE_INVALID = 1106
    AWS_ERROR_PKCS11_CKR_ACTION_PROHIBITED = 1107
    AWS_ERROR_PKCS11_CKR_DATA_INVALID = 1108
    AWS_ERROR_PKCS11_CKR_DATA_LEN_RANGE = 1109
    AWS_ERROR_PKCS11_CKR_DEVICE_ERROR = 1110
    AWS_ERROR_PKCS11_CKR_DEVICE_MEMORY = 1111
    AWS_ERROR_PKCS11_CKR_DEVICE_REMOVED = 1112
    AWS_ERROR_PKCS11_CKR_ENCRYPTED_DATA_INVALID = 1113
    AWS_ERROR_PKCS11_CKR_ENCRYPTED_DATA_LEN_RANGE = 1114
    AWS_ERROR_PKCS11_CKR_FUNCTION_CANCELED = 1115
    AWS_ERROR_PKCS11_CKR_FUNCTION_NOT_PARALLEL = 1116
    AWS_ERROR_PKCS11_CKR_FUNCTION_NOT_SUPPORTED = 1117
    AWS_ERROR_PKCS11_CKR_KEY_HANDLE_INVALID = 1118
    AWS_ERROR_PKCS11_CKR_KEY_SIZE_RANGE = 1119
    AWS_ERROR_PKCS11_CKR_KEY_TYPE_INCONSISTENT = 1120
    AWS_ERROR_PKCS11_CKR_KEY_NOT_NEEDED = 1121
    AWS_ERROR_PKCS11_CKR_KEY_CHANGED = 1122
    AWS_ERROR_PKCS11_CKR_KEY_NEEDED = 1123
    AWS_ERROR_PKCS11_CKR_KEY_INDIGESTIBLE = 1124
    AWS_ERROR_PKCS11_CKR_KEY_FUNCTION_NOT_PERMITTED = 1125
    AWS_ERROR_PKCS11_CKR_KEY_NOT_WRAPPABLE = 1126
    AWS_ERROR_PKCS11_CKR_KEY_UNEXTRACTABLE = 1127
    AWS_ERROR_PKCS11_CKR_MECHANISM_INVALID = 1128
    AWS_ERROR_PKCS11_CKR_MECHANISM_PARAM_INVALID = 1129
    AWS_ERROR_PKCS11_CKR_OBJECT_HANDLE_INVALID = 1130
    AWS_ERROR_PKCS11_CKR_OPERATION_ACTIVE = 1131
    AWS_ERROR_PKCS11_CKR_OPERATION_NOT_INITIALIZED = 1132
    AWS_ERROR_PKCS11_CKR_PIN_INCORRECT = 1133
    AWS_ERROR_PKCS11_CKR_PIN_INVALID = 1134
    AWS_ERROR_PKCS11_CKR_PIN_LEN_RANGE = 1135
    AWS_ERROR_PKCS11_CKR_PIN_EXPIRED = 1136
    AWS_ERROR_PKCS11_CKR_PIN_LOCKED = 1137
    AWS_ERROR_PKCS11_CKR_SESSION_CLOSED = 1138
    AWS_ERROR_PKCS11_CKR_SESSION_COUNT = 1139
    AWS_ERROR_PKCS11_CKR_SESSION_HANDLE_INVALID = 1140
    AWS_ERROR_PKCS11_CKR_SESSION_PARALLEL_NOT_SUPPORTED = 1141
    AWS_ERROR_PKCS11_CKR_SESSION_READ_ONLY = 1142
    AWS_ERROR_PKCS11_CKR_SESSION_EXISTS = 1143
    AWS_ERROR_PKCS11_CKR_SESSION_READ_ONLY_EXISTS = 1144
    AWS_ERROR_PKCS11_CKR_SESSION_READ_WRITE_SO_EXISTS = 1145
    AWS_ERROR_PKCS11_CKR_SIGNATURE_INVALID = 1146
    AWS_ERROR_PKCS11_CKR_SIGNATURE_LEN_RANGE = 1147
    AWS_ERROR_PKCS11_CKR_TEMPLATE_INCOMPLETE = 1148
    AWS_ERROR_PKCS11_CKR_TEMPLATE_INCONSISTENT = 1149
    AWS_ERROR_PKCS11_CKR_TOKEN_NOT_PRESENT = 1150
    AWS_ERROR_PKCS11_CKR_TOKEN_NOT_RECOGNIZED = 1151
    AWS_ERROR_PKCS11_CKR_TOKEN_WRITE_PROTECTED = 1152
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_HANDLE_INVALID = 1153
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_SIZE_RANGE = 1154
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_TYPE_INCONSISTENT = 1155
    AWS_ERROR_PKCS11_CKR_USER_ALREADY_LOGGED_IN = 1156
    AWS_ERROR_PKCS11_CKR_USER_NOT_LOGGED_IN = 1157
    AWS_ERROR_PKCS11_CKR_USER_PIN_NOT_INITIALIZED = 1158
    AWS_ERROR_PKCS11_CKR_USER_TYPE_INVALID = 1159
    AWS_ERROR_PKCS11_CKR_USER_ANOTHER_ALREADY_LOGGED_IN = 1160
    AWS_ERROR_PKCS11_CKR_USER_TOO_MANY_TYPES = 1161
    AWS_ERROR_PKCS11_CKR_WRAPPED_KEY_INVALID = 1162
    AWS_ERROR_PKCS11_CKR_WRAPPED_KEY_LEN_RANGE = 1163
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_HANDLE_INVALID = 1164
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_SIZE_RANGE = 1165
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_TYPE_INCONSISTENT = 1166
    AWS_ERROR_PKCS11_CKR_RANDOM_SEED_NOT_SUPPORTED = 1167
    AWS_ERROR_PKCS11_CKR_RANDOM_NO_RNG = 1168
    AWS_ERROR_PKCS11_CKR_DOMAIN_PARAMS_INVALID = 1169
    AWS_ERROR_PKCS11_CKR_CURVE_NOT_SUPPORTED = 1170
    AWS_ERROR_PKCS11_CKR_BUFFER_TOO_SMALL = 1171
    AWS_ERROR_PKCS11_CKR_SAVED_STATE_INVALID = 1172
    AWS_ERROR_PKCS11_CKR_INFORMATION_SENSITIVE = 1173
    AWS_ERROR_PKCS11_CKR_STATE_UNSAVEABLE = 1174
    AWS_ERROR_PKCS11_CKR_CRYPTOKI_NOT_INITIALIZED = 1175
    AWS_ERROR_PKCS11_CKR_CRYPTOKI_ALREADY_INITIALIZED = 1176
    AWS_ERROR_PKCS11_CKR_MUTEX_BAD = 1177
    AWS_ERROR_PKCS11_CKR_MUTEX_NOT_LOCKED = 1178
    AWS_ERROR_PKCS11_CKR_NEW_PIN_MODE = 1179
    AWS_ERROR_PKCS11_CKR_NEXT_OTP = 1180
    AWS_ERROR_PKCS11_CKR_EXCEEDED_MAX_ITERATIONS = 1181
    AWS_ERROR_PKCS11_CKR_FIPS_SELF_TEST_FAILED = 1182
    AWS_ERROR_PKCS11_CKR_LIBRARY_LOAD_FAILED = 1183
    AWS_ERROR_PKCS11_CKR_PIN_TOO_WEAK = 1184
    AWS_ERROR_PKCS11_CKR_PUBLIC_KEY_INVALID = 1185
    AWS_ERROR_PKCS11_CKR_FUNCTION_REJECTED = 1186
    AWS_ERROR_IO_PINNED_EVENT_LOOP_MISMATCH = 1187
    AWS_ERROR_PKCS11_ENCODING_ERROR = 1188
    AWS_IO_TLS_ERROR_DEFAULT_TRUST_STORE_NOT_FOUND = 1189
    AWS_IO_STREAM_SEEK_FAILED = 1190
    AWS_IO_STREAM_GET_LENGTH_FAILED = 1191
    AWS_IO_STREAM_SEEK_UNSUPPORTED = 1192
    AWS_IO_STREAM_GET_LENGTH_UNSUPPORTED = 1193
    AWS_ERROR_PEM_MALFORMED = 1194
    AWS_IO_ERROR_END_RANGE = 2047
    AWS_IO_INVALID_FILE_HANDLE = 50
end

"""
    aws_io_library_init(allocator)

Initializes internal datastructures used by aws-c-io. Must be called before using any functionality in aws-c-io.

### Prototype
```c
void aws_io_library_init(struct aws_allocator *allocator);
```
"""
function aws_io_library_init(allocator)
    ccall((:aws_io_library_init, libaws_c_io), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_io_library_clean_up()

Shuts down the internal datastructures used by aws-c-io.

### Prototype
```c
void aws_io_library_clean_up(void);
```
"""
function aws_io_library_clean_up()
    ccall((:aws_io_library_clean_up, libaws_c_io), Cvoid, ())
end

"""
    aws_io_fatal_assert_library_initialized()

Documentation not found.
### Prototype
```c
void aws_io_fatal_assert_library_initialized(void);
```
"""
function aws_io_fatal_assert_library_initialized()
    ccall((:aws_io_fatal_assert_library_initialized, libaws_c_io), Cvoid, ())
end

"""
    aws_io_log_subject

Documentation not found.
"""
@cenum aws_io_log_subject::UInt32 begin
    AWS_LS_IO_GENERAL = 1024
    AWS_LS_IO_EVENT_LOOP = 1025
    AWS_LS_IO_SOCKET = 1026
    AWS_LS_IO_SOCKET_HANDLER = 1027
    AWS_LS_IO_TLS = 1028
    AWS_LS_IO_ALPN = 1029
    AWS_LS_IO_DNS = 1030
    AWS_LS_IO_PKI = 1031
    AWS_LS_IO_CHANNEL = 1032
    AWS_LS_IO_CHANNEL_BOOTSTRAP = 1033
    AWS_LS_IO_FILE_UTILS = 1034
    AWS_LS_IO_SHARED_LIBRARY = 1035
    AWS_LS_IO_EXPONENTIAL_BACKOFF_RETRY_STRATEGY = 1036
    AWS_LS_IO_STANDARD_RETRY_STRATEGY = 1037
    AWS_LS_IO_PKCS11 = 1038
    AWS_LS_IO_PEM = 1039
    AWS_IO_LS_LAST = 2047
end

"""
    aws_memory_pool

Documentation not found.
"""
struct aws_memory_pool
    alloc::Ptr{aws_allocator}
    stack::aws_array_list
    ideal_segment_count::UInt16
    segment_size::Csize_t
    data_ptr::Ptr{Cvoid}
end

"""
    aws_message_pool

Documentation not found.
"""
struct aws_message_pool
    alloc::Ptr{aws_allocator}
    application_data_pool::aws_memory_pool
    small_block_pool::aws_memory_pool
end

"""
    aws_message_pool_creation_args

Documentation not found.
"""
struct aws_message_pool_creation_args
    application_data_msg_data_size::Csize_t
    application_data_msg_count::UInt8
    small_block_msg_data_size::Csize_t
    small_block_msg_count::UInt8
end

"""
    aws_memory_pool_init(mempool, alloc, ideal_segment_count, segment_size)

Documentation not found.
### Prototype
```c
int aws_memory_pool_init( struct aws_memory_pool *mempool, struct aws_allocator *alloc, uint16_t ideal_segment_count, size_t segment_size);
```
"""
function aws_memory_pool_init(mempool, alloc, ideal_segment_count, segment_size)
    ccall((:aws_memory_pool_init, libaws_c_io), Cint, (Ptr{aws_memory_pool}, Ptr{aws_allocator}, UInt16, Csize_t), mempool, alloc, ideal_segment_count, segment_size)
end

"""
    aws_memory_pool_clean_up(mempool)

Documentation not found.
### Prototype
```c
void aws_memory_pool_clean_up(struct aws_memory_pool *mempool);
```
"""
function aws_memory_pool_clean_up(mempool)
    ccall((:aws_memory_pool_clean_up, libaws_c_io), Cvoid, (Ptr{aws_memory_pool},), mempool)
end

"""
    aws_memory_pool_acquire(mempool)

Acquires memory from the pool if available, otherwise, it attempts to allocate and returns the result.

### Prototype
```c
void *aws_memory_pool_acquire(struct aws_memory_pool *mempool);
```
"""
function aws_memory_pool_acquire(mempool)
    ccall((:aws_memory_pool_acquire, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_memory_pool},), mempool)
end

"""
    aws_memory_pool_release(mempool, to_release)

Releases memory to the pool if space is available, otherwise frees `to_release`

### Prototype
```c
void aws_memory_pool_release(struct aws_memory_pool *mempool, void *to_release);
```
"""
function aws_memory_pool_release(mempool, to_release)
    ccall((:aws_memory_pool_release, libaws_c_io), Cvoid, (Ptr{aws_memory_pool}, Ptr{Cvoid}), mempool, to_release)
end

"""
    aws_message_pool_init(msg_pool, alloc, args)

Initializes message pool using 'msg\\_pool' as the backing pool, 'args' is copied.

### Prototype
```c
int aws_message_pool_init( struct aws_message_pool *msg_pool, struct aws_allocator *alloc, struct aws_message_pool_creation_args *args);
```
"""
function aws_message_pool_init(msg_pool, alloc, args)
    ccall((:aws_message_pool_init, libaws_c_io), Cint, (Ptr{aws_message_pool}, Ptr{aws_allocator}, Ptr{aws_message_pool_creation_args}), msg_pool, alloc, args)
end

"""
    aws_message_pool_clean_up(msg_pool)

Documentation not found.
### Prototype
```c
void aws_message_pool_clean_up(struct aws_message_pool *msg_pool);
```
"""
function aws_message_pool_clean_up(msg_pool)
    ccall((:aws_message_pool_clean_up, libaws_c_io), Cvoid, (Ptr{aws_message_pool},), msg_pool)
end

"""
    aws_message_pool_acquire(msg_pool, message_type, size_hint)

Acquires a message from the pool if available, otherwise, it attempts to allocate. If a message is acquired, note that size\\_hint is just a hint. the return value's capacity will be set to the actual buffer size.

### Prototype
```c
struct aws_io_message *aws_message_pool_acquire( struct aws_message_pool *msg_pool, enum aws_io_message_type message_type, size_t size_hint);
```
"""
function aws_message_pool_acquire(msg_pool, message_type, size_hint)
    ccall((:aws_message_pool_acquire, libaws_c_io), Ptr{aws_io_message}, (Ptr{aws_message_pool}, aws_io_message_type, Csize_t), msg_pool, message_type, size_hint)
end

"""
    aws_message_pool_release(msg_pool, message)

Releases message to the pool if space is available, otherwise frees `message`

# Arguments
* `message`:
### Prototype
```c
void aws_message_pool_release(struct aws_message_pool *msg_pool, struct aws_io_message *message);
```
"""
function aws_message_pool_release(msg_pool, message)
    ccall((:aws_message_pool_release, libaws_c_io), Cvoid, (Ptr{aws_message_pool}, Ptr{aws_io_message}), msg_pool, message)
end

"""
    aws_pem_object_type

Documentation not found.
"""
@cenum aws_pem_object_type::UInt32 begin
    AWS_PEM_TYPE_UNKNOWN = 0
    AWS_PEM_TYPE_X509_OLD = 1
    AWS_PEM_TYPE_X509 = 2
    AWS_PEM_TYPE_X509_TRUSTED = 3
    AWS_PEM_TYPE_X509_REQ_OLD = 4
    AWS_PEM_TYPE_X509_REQ = 5
    AWS_PEM_TYPE_X509_CRL = 6
    AWS_PEM_TYPE_EVP_PKEY = 7
    AWS_PEM_TYPE_PUBLIC_PKCS8 = 8
    AWS_PEM_TYPE_PRIVATE_RSA_PKCS1 = 9
    AWS_PEM_TYPE_PUBLIC_RSA_PKCS1 = 10
    AWS_PEM_TYPE_PRIVATE_DSA_PKCS1 = 11
    AWS_PEM_TYPE_PUBLIC_DSA_PKCS1 = 12
    AWS_PEM_TYPE_PKCS7 = 13
    AWS_PEM_TYPE_PKCS7_SIGNED_DATA = 14
    AWS_PEM_TYPE_PRIVATE_PKCS8_ENCRYPTED = 15
    AWS_PEM_TYPE_PRIVATE_PKCS8 = 16
    AWS_PEM_TYPE_DH_PARAMETERS = 17
    AWS_PEM_TYPE_DH_PARAMETERS_X942 = 18
    AWS_PEM_TYPE_SSL_SESSION_PARAMETERS = 19
    AWS_PEM_TYPE_DSA_PARAMETERS = 20
    AWS_PEM_TYPE_ECDSA_PUBLIC = 21
    AWS_PEM_TYPE_EC_PARAMETERS = 22
    AWS_PEM_TYPE_EC_PRIVATE = 23
    AWS_PEM_TYPE_PARAMETERS = 24
    AWS_PEM_TYPE_CMS = 25
    AWS_PEM_TYPE_SM2_PARAMETERS = 26
end

"""
    aws_pem_object

Documentation not found.
"""
struct aws_pem_object
    type::aws_pem_object_type
    type_string::Ptr{aws_string}
    data::aws_byte_buf
end

"""
    aws_pem_objects_clean_up(pem_objects)

Cleans up elements of pem\\_objects list '[`aws_pem_objects_init_from_file_contents`](@ref)()' and '[`aws_pem_objects_init_from_file_path`](@ref)()'.

### Prototype
```c
void aws_pem_objects_clean_up(struct aws_array_list *pem_objects);
```
"""
function aws_pem_objects_clean_up(pem_objects)
    ccall((:aws_pem_objects_clean_up, libaws_c_io), Cvoid, (Ptr{aws_array_list},), pem_objects)
end

"""
    aws_pem_objects_init_from_file_contents(pem_objects, alloc, pem_cursor)

Decodes PEM data and reads objects sequentially adding them to pem\\_objects. If it comes across an object it cannot read, list of all object read until that point is returned. If no objects can be read from PEM or objects could not be base 64 decoded, AWS\\_ERROR\\_PEM\\_MALFORMED is raised. out\\_pem\\_objects stores [`aws_pem_object`](@ref) struct by value. Function will initialize pem\\_objects list. This code is slow, and it allocates, so please try not to call this in the middle of something that needs to be fast or resource sensitive.

### Prototype
```c
int aws_pem_objects_init_from_file_contents( struct aws_array_list *pem_objects, struct aws_allocator *alloc, struct aws_byte_cursor pem_cursor);
```
"""
function aws_pem_objects_init_from_file_contents(pem_objects, alloc, pem_cursor)
    ccall((:aws_pem_objects_init_from_file_contents, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{aws_allocator}, aws_byte_cursor), pem_objects, alloc, pem_cursor)
end

"""
    aws_pem_objects_init_from_file_path(pem_objects, allocator, filename)

Decodes PEM data from file and reads objects sequentially adding them to pem\\_objects. If it comes across an object it cannot read, list of all object read until that point is returned. If no objects can be read from PEM or objects could not be base 64 decoded, AWS\\_ERROR\\_PEM\\_MALFORMED is raised. out\\_pem\\_objects stores [`aws_pem_object`](@ref) struct by value. Function will initialize pem\\_objects list. This code is slow, and it allocates, so please try not to call this in the middle of something that needs to be fast or resource sensitive.

### Prototype
```c
int aws_pem_objects_init_from_file_path( struct aws_array_list *pem_objects, struct aws_allocator *allocator, const char *filename);
```
"""
function aws_pem_objects_init_from_file_path(pem_objects, allocator, filename)
    ccall((:aws_pem_objects_init_from_file_path, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{aws_allocator}, Ptr{Cchar}), pem_objects, allocator, filename)
end

"""
    aws_pipe_read_end

Documentation not found.
"""
struct aws_pipe_read_end
    impl_data::Ptr{Cvoid}
end

"""
    aws_pipe_write_end

Documentation not found.
"""
struct aws_pipe_write_end
    impl_data::Ptr{Cvoid}
end

# typedef void ( aws_pipe_on_readable_fn ) ( struct aws_pipe_read_end * read_end , int error_code , void * user_data )
"""
Callback for when the pipe is readable (edge-triggered), or an error has occurred. Afer subscribing, the callback is invoked when the pipe has data to read, or the pipe has an error. The readable callback is invoked again any time the user reads all data, and then more data arrives. Note that it will not be invoked again if the pipe still has unread data when more data arrives. `error_code` of AWS\\_ERROR\\_SUCCESS indicates a readable event, and otherwise contains the value of the error. `user_data` corresponds to the `user_data` passed into aws\\_pipe\\_subscribe\\_to\\_read\\_events(). This callback is always invoked on the read-end's event-loop thread.
"""
const aws_pipe_on_readable_fn = Cvoid

# typedef void ( aws_pipe_on_write_completed_fn ) ( struct aws_pipe_write_end * write_end , int error_code , struct aws_byte_cursor src_buffer , void * user_data )
"""
Callback for when the asynchronous [`aws_pipe_write`](@ref)() operation has either completed or failed. `write_end` will be NULL if this callback is invoked after the the write-end has been cleaned up, this does not necessarily mean that the write operation failed. `error_code` will be AWS\\_ERROR\\_SUCCESS if all data was written, or a code corresponding to the error. `src_buffer` corresponds to the buffer passed into [`aws_pipe_write`](@ref)() `user_data` corresponds to the `user_data` passed into [`aws_pipe_write`](@ref)(). This callback is always invoked on the write-end's event-loop thread.
"""
const aws_pipe_on_write_completed_fn = Cvoid

"""
    aws_pipe_init(read_end, read_end_event_loop, write_end, write_end_event_loop, allocator)

Opens an OS specific bidirectional pipe. The read direction is stored in read\\_end. Write direction is stored in write\\_end. Each end must be connected to an event-loop, and further calls to each end must happen on that event-loop's thread.

### Prototype
```c
int aws_pipe_init( struct aws_pipe_read_end *read_end, struct aws_event_loop *read_end_event_loop, struct aws_pipe_write_end *write_end, struct aws_event_loop *write_end_event_loop, struct aws_allocator *allocator);
```
"""
function aws_pipe_init(read_end, read_end_event_loop, write_end, write_end_event_loop, allocator)
    ccall((:aws_pipe_init, libaws_c_io), Cint, (Ptr{aws_pipe_read_end}, Ptr{aws_event_loop}, Ptr{aws_pipe_write_end}, Ptr{aws_event_loop}, Ptr{aws_allocator}), read_end, read_end_event_loop, write_end, write_end_event_loop, allocator)
end

"""
    aws_pipe_clean_up_read_end(read_end)

Clean up the read-end of the pipe. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_clean_up_read_end(struct aws_pipe_read_end *read_end);
```
"""
function aws_pipe_clean_up_read_end(read_end)
    ccall((:aws_pipe_clean_up_read_end, libaws_c_io), Cint, (Ptr{aws_pipe_read_end},), read_end)
end

"""
    aws_pipe_clean_up_write_end(write_end)

Clean up the write-end of the pipe. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_clean_up_write_end(struct aws_pipe_write_end *write_end);
```
"""
function aws_pipe_clean_up_write_end(write_end)
    ccall((:aws_pipe_clean_up_write_end, libaws_c_io), Cint, (Ptr{aws_pipe_write_end},), write_end)
end

"""
    aws_pipe_get_read_end_event_loop(read_end)

Get the event-loop connected to the read-end of the pipe. This may be called on any thread.

### Prototype
```c
struct aws_event_loop *aws_pipe_get_read_end_event_loop(const struct aws_pipe_read_end *read_end);
```
"""
function aws_pipe_get_read_end_event_loop(read_end)
    ccall((:aws_pipe_get_read_end_event_loop, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_pipe_read_end},), read_end)
end

"""
    aws_pipe_get_write_end_event_loop(write_end)

Get the event-loop connected to the write-end of the pipe. This may be called on any thread.

### Prototype
```c
struct aws_event_loop *aws_pipe_get_write_end_event_loop(const struct aws_pipe_write_end *write_end);
```
"""
function aws_pipe_get_write_end_event_loop(write_end)
    ccall((:aws_pipe_get_write_end_event_loop, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_pipe_write_end},), write_end)
end

"""
    aws_pipe_write(write_end, src_buffer, on_completed, user_data)

Initiates an asynchrous write from the source buffer to the pipe. The data referenced by `src_buffer` must remain in memory until the operation completes. `on_complete` is called on the event-loop thread when the operation has either completed or failed. The callback's pipe argument will be NULL if the callback is invoked after the pipe has been cleaned up. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_write( struct aws_pipe_write_end *write_end, struct aws_byte_cursor src_buffer, aws_pipe_on_write_completed_fn *on_completed, void *user_data);
```
"""
function aws_pipe_write(write_end, src_buffer, on_completed, user_data)
    ccall((:aws_pipe_write, libaws_c_io), Cint, (Ptr{aws_pipe_write_end}, aws_byte_cursor, Ptr{aws_pipe_on_write_completed_fn}, Ptr{Cvoid}), write_end, src_buffer, on_completed, user_data)
end

"""
    aws_pipe_read(read_end, dst_buffer, num_bytes_read)

Read data from the pipe into the destination buffer. Attempts to read enough to fill all remaining space in the buffer, from `dst\\_buffer->len` to `dst\\_buffer->capacity`. `dst\\_buffer->len` is updated to reflect the buffer's new length. `num_bytes_read` (optional) is set to the total number of bytes read. This function never blocks. If no bytes could be read without blocking, then AWS\\_OP\\_ERR is returned and aws\\_last\\_error() code will be AWS\\_IO\\_READ\\_WOULD\\_BLOCK. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_read(struct aws_pipe_read_end *read_end, struct aws_byte_buf *dst_buffer, size_t *num_bytes_read);
```
"""
function aws_pipe_read(read_end, dst_buffer, num_bytes_read)
    ccall((:aws_pipe_read, libaws_c_io), Cint, (Ptr{aws_pipe_read_end}, Ptr{aws_byte_buf}, Ptr{Csize_t}), read_end, dst_buffer, num_bytes_read)
end

"""
    aws_pipe_subscribe_to_readable_events(read_end, on_readable, user_data)

Subscribe to be notified when the pipe becomes readable (edge-triggered), or an error occurs. `on_readable` is invoked on the event-loop's thread when the pipe has data to read, or the pipe has an error. `on_readable` is invoked again any time the user reads all data, and then more data arrives. Note that it will not be invoked again if the pipe still has unread data when more data arrives. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_subscribe_to_readable_events( struct aws_pipe_read_end *read_end, aws_pipe_on_readable_fn *on_readable, void *user_data);
```
"""
function aws_pipe_subscribe_to_readable_events(read_end, on_readable, user_data)
    ccall((:aws_pipe_subscribe_to_readable_events, libaws_c_io), Cint, (Ptr{aws_pipe_read_end}, Ptr{aws_pipe_on_readable_fn}, Ptr{Cvoid}), read_end, on_readable, user_data)
end

"""
    aws_pipe_unsubscribe_from_readable_events(read_end)

Stop receiving notifications about events on the read-end of the pipe. This must be called on the thread of the connected event-loop.

### Prototype
```c
int aws_pipe_unsubscribe_from_readable_events(struct aws_pipe_read_end *read_end);
```
"""
function aws_pipe_unsubscribe_from_readable_events(read_end)
    ccall((:aws_pipe_unsubscribe_from_readable_events, libaws_c_io), Cint, (Ptr{aws_pipe_read_end},), read_end)
end

"""
    aws_pipe_get_unique_name(dst, dst_size)

Generate a unique pipe name. The suggested dst\\_size is 256.

### Prototype
```c
int aws_pipe_get_unique_name(char *dst, size_t dst_size);
```
"""
function aws_pipe_get_unique_name(dst, dst_size)
    ccall((:aws_pipe_get_unique_name, libaws_c_io), Cint, (Ptr{Cchar}, Csize_t), dst, dst_size)
end

"""
    aws_pkcs11_lib_behavior

Controls how [`aws_pkcs11_lib`](@ref) calls C\\_Initialize() and C\\_Finalize() on the PKCS#11 library.
"""
@cenum aws_pkcs11_lib_behavior::UInt32 begin
    AWS_PKCS11_LIB_DEFAULT_BEHAVIOR = 0
    AWS_PKCS11_LIB_OMIT_INITIALIZE = 1
    AWS_PKCS11_LIB_STRICT_INITIALIZE_FINALIZE = 2
end

"""
    aws_pkcs11_lib_options

Options for [`aws_pkcs11_lib_new`](@ref)()
"""
struct aws_pkcs11_lib_options
    filename::aws_byte_cursor
    initialize_finalize_behavior::aws_pkcs11_lib_behavior
end

"""
Documentation not found.
"""
mutable struct aws_pkcs11_lib end

"""
    aws_pkcs11_lib_new(allocator, options)

Load and initialize a PKCS#11 library. See [`aws_pkcs11_lib_options`](@ref) for options.

If successful a valid pointer is returned. You must call [`aws_pkcs11_lib_release`](@ref)() when you are done with it. If unsuccessful, NULL is returned and an error is set.

### Prototype
```c
struct aws_pkcs11_lib *aws_pkcs11_lib_new( struct aws_allocator *allocator, const struct aws_pkcs11_lib_options *options);
```
"""
function aws_pkcs11_lib_new(allocator, options)
    ccall((:aws_pkcs11_lib_new, libaws_c_io), Ptr{aws_pkcs11_lib}, (Ptr{aws_allocator}, Ptr{aws_pkcs11_lib_options}), allocator, options)
end

"""
    aws_pkcs11_lib_acquire(pkcs11_lib)

Acquire a reference to a PKCS#11 library, preventing it from being cleaned up. You must call [`aws_pkcs11_lib_release`](@ref)() when you are done with it. This function returns whatever was passed in. It cannot fail.

### Prototype
```c
struct aws_pkcs11_lib *aws_pkcs11_lib_acquire(struct aws_pkcs11_lib *pkcs11_lib);
```
"""
function aws_pkcs11_lib_acquire(pkcs11_lib)
    ccall((:aws_pkcs11_lib_acquire, libaws_c_io), Ptr{aws_pkcs11_lib}, (Ptr{aws_pkcs11_lib},), pkcs11_lib)
end

"""
    aws_pkcs11_lib_release(pkcs11_lib)

Release a reference to the PKCS#11 library. When the last reference is released, the library is cleaned up.

### Prototype
```c
void aws_pkcs11_lib_release(struct aws_pkcs11_lib *pkcs11_lib);
```
"""
function aws_pkcs11_lib_release(pkcs11_lib)
    ccall((:aws_pkcs11_lib_release, libaws_c_io), Cvoid, (Ptr{aws_pkcs11_lib},), pkcs11_lib)
end

# typedef void ( aws_retry_strategy_on_retry_token_acquired_fn ) ( struct aws_retry_strategy * retry_strategy , int error_code , struct aws_retry_token * token , void * user_data )
"""
Invoked upon the acquisition, or failure to acquire a retry token. This function will always be invoked if and only if [`aws_retry_strategy_acquire_retry_token`](@ref)() returns AWS\\_OP\\_SUCCESS. It will never be invoked synchronously from [`aws_retry_strategy_acquire_retry_token`](@ref)(). Token will always be NULL if error\\_code is non-zero, and vice-versa. If token is non-null, it will have a reference count of 1, and you must call [`aws_retry_token_release`](@ref)() on it later. See the comments for [`aws_retry_strategy_on_retry_ready_fn`](@ref) for more info.
"""
const aws_retry_strategy_on_retry_token_acquired_fn = Cvoid

# typedef void ( aws_retry_strategy_on_retry_ready_fn ) ( struct aws_retry_token * token , int error_code , void * user_data )
"""
Invoked after a successful call to [`aws_retry_strategy_schedule_retry`](@ref)(). This function will always be invoked if and only if [`aws_retry_strategy_schedule_retry`](@ref)() returns AWS\\_OP\\_SUCCESS. It will never be invoked synchronously from [`aws_retry_strategy_schedule_retry`](@ref)(). After attempting the operation, either call [`aws_retry_strategy_schedule_retry`](@ref)() with an [`aws_retry_error_type`](@ref) or call [`aws_retry_token_record_success`](@ref)() and then release the token via. [`aws_retry_token_release`](@ref)().
"""
const aws_retry_strategy_on_retry_ready_fn = Cvoid

# typedef uint64_t ( aws_generate_random_fn ) ( void * user_data )
"""
Optional function to supply your own generate random implementation
"""
const aws_generate_random_fn = Cvoid

"""
    aws_retry_error_type

Documentation not found.
"""
@cenum aws_retry_error_type::UInt32 begin
    AWS_RETRY_ERROR_TYPE_TRANSIENT = 0
    AWS_RETRY_ERROR_TYPE_THROTTLING = 1
    AWS_RETRY_ERROR_TYPE_SERVER_ERROR = 2
    AWS_RETRY_ERROR_TYPE_CLIENT_ERROR = 3
end

"""
    aws_retry_strategy_vtable

Documentation not found.
"""
struct aws_retry_strategy_vtable
    destroy::Ptr{Cvoid}
    acquire_token::Ptr{Cvoid}
    schedule_retry::Ptr{Cvoid}
    record_success::Ptr{Cvoid}
    release_token::Ptr{Cvoid}
end

"""
    aws_retry_strategy

Documentation not found.
"""
struct aws_retry_strategy
    allocator::Ptr{aws_allocator}
    vtable::Ptr{aws_retry_strategy_vtable}
    ref_count::aws_atomic_var
    impl::Ptr{Cvoid}
end

"""
    aws_retry_token

Documentation not found.
"""
struct aws_retry_token
    allocator::Ptr{aws_allocator}
    retry_strategy::Ptr{aws_retry_strategy}
    ref_count::aws_atomic_var
    impl::Ptr{Cvoid}
end

"""
    aws_exponential_backoff_jitter_mode

Jitter mode for exponential backoff.

For a great writeup on these options see: https://aws.amazon.com/blogs/architecture/exponential-backoff-and-jitter/
"""
@cenum aws_exponential_backoff_jitter_mode::UInt32 begin
    AWS_EXPONENTIAL_BACKOFF_JITTER_DEFAULT = 0
    AWS_EXPONENTIAL_BACKOFF_JITTER_NONE = 1
    AWS_EXPONENTIAL_BACKOFF_JITTER_FULL = 2
    AWS_EXPONENTIAL_BACKOFF_JITTER_DECORRELATED = 3
end

"""
    aws_exponential_backoff_retry_options

Options for exponential backoff retry strategy. el\\_group must be set, any other option, if set to 0 will signify "use defaults"
"""
struct aws_exponential_backoff_retry_options
    el_group::Ptr{aws_event_loop_group}
    max_retries::Csize_t
    backoff_scale_factor_ms::UInt32
    max_backoff_secs::UInt32
    jitter_mode::aws_exponential_backoff_jitter_mode
    generate_random::Ptr{Cvoid}
    generate_random_impl::Ptr{aws_generate_random_fn}
    generate_random_user_data::Ptr{Cvoid}
    shutdown_options::Ptr{aws_shutdown_callback_options}
end

"""
    aws_no_retry_options

Documentation not found.
"""
struct aws_no_retry_options
    shutdown_options::Ptr{aws_shutdown_callback_options}
end

"""
    aws_standard_retry_options

Documentation not found.
"""
struct aws_standard_retry_options
    backoff_retry_options::aws_exponential_backoff_retry_options
    initial_bucket_capacity::Csize_t
end

"""
    aws_retry_strategy_acquire(retry_strategy)

Acquire a reference count on retry\\_strategy.

### Prototype
```c
void aws_retry_strategy_acquire(struct aws_retry_strategy *retry_strategy);
```
"""
function aws_retry_strategy_acquire(retry_strategy)
    ccall((:aws_retry_strategy_acquire, libaws_c_io), Cvoid, (Ptr{aws_retry_strategy},), retry_strategy)
end

"""
    aws_retry_strategy_release(retry_strategy)

Releases a reference count on retry\\_strategy.

### Prototype
```c
void aws_retry_strategy_release(struct aws_retry_strategy *retry_strategy);
```
"""
function aws_retry_strategy_release(retry_strategy)
    ccall((:aws_retry_strategy_release, libaws_c_io), Cvoid, (Ptr{aws_retry_strategy},), retry_strategy)
end

"""
    aws_retry_strategy_acquire_retry_token(retry_strategy, partition_id, on_acquired, user_data, timeout_ms)

Attempts to acquire a retry token for use with retries. On success, on\\_acquired will be invoked when a token is available, or an error will be returned if the timeout expires. partition\\_id identifies operations that should be grouped together. This allows for more sophisticated strategies such as AIMD and circuit breaker patterns. Pass NULL to use the global partition.

### Prototype
```c
int aws_retry_strategy_acquire_retry_token( struct aws_retry_strategy *retry_strategy, const struct aws_byte_cursor *partition_id, aws_retry_strategy_on_retry_token_acquired_fn *on_acquired, void *user_data, uint64_t timeout_ms);
```
"""
function aws_retry_strategy_acquire_retry_token(retry_strategy, partition_id, on_acquired, user_data, timeout_ms)
    ccall((:aws_retry_strategy_acquire_retry_token, libaws_c_io), Cint, (Ptr{aws_retry_strategy}, Ptr{aws_byte_cursor}, Ptr{aws_retry_strategy_on_retry_token_acquired_fn}, Ptr{Cvoid}, UInt64), retry_strategy, partition_id, on_acquired, user_data, timeout_ms)
end

"""
    aws_retry_strategy_schedule_retry(token, error_type, retry_ready, user_data)

Schedules a retry based on the backoff and token based strategies. retry\\_ready is invoked when the retry is either ready for execution or if it has been canceled due to application shutdown.

This function can return an error to reject the retry attempt if, for example, a circuit breaker has opened. If this occurs users should fail their calls back to their callers.

error\\_type is used for book keeping. See the comments above for [`aws_retry_error_type`](@ref).

### Prototype
```c
int aws_retry_strategy_schedule_retry( struct aws_retry_token *token, enum aws_retry_error_type error_type, aws_retry_strategy_on_retry_ready_fn *retry_ready, void *user_data);
```
"""
function aws_retry_strategy_schedule_retry(token, error_type, retry_ready, user_data)
    ccall((:aws_retry_strategy_schedule_retry, libaws_c_io), Cint, (Ptr{aws_retry_token}, aws_retry_error_type, Ptr{aws_retry_strategy_on_retry_ready_fn}, Ptr{Cvoid}), token, error_type, retry_ready, user_data)
end

"""
    aws_retry_token_record_success(token)

Records a successful retry. This is used for making future decisions to open up token buckets, AIMD breakers etc... some strategies such as exponential backoff will ignore this, but you should always call it after a successful operation or your system will never recover during an outage.

### Prototype
```c
int aws_retry_token_record_success(struct aws_retry_token *token);
```
"""
function aws_retry_token_record_success(token)
    ccall((:aws_retry_token_record_success, libaws_c_io), Cint, (Ptr{aws_retry_token},), token)
end

"""
    aws_retry_token_acquire(token)

Increments reference count for token. This should be called any time you seat the token to a pointer you own.

### Prototype
```c
void aws_retry_token_acquire(struct aws_retry_token *token);
```
"""
function aws_retry_token_acquire(token)
    ccall((:aws_retry_token_acquire, libaws_c_io), Cvoid, (Ptr{aws_retry_token},), token)
end

"""
    aws_retry_token_release(token)

Releases the reference count for token. This should always be invoked after either calling [`aws_retry_strategy_schedule_retry`](@ref)() and failing, or after calling [`aws_retry_token_record_success`](@ref)().

### Prototype
```c
void aws_retry_token_release(struct aws_retry_token *token);
```
"""
function aws_retry_token_release(token)
    ccall((:aws_retry_token_release, libaws_c_io), Cvoid, (Ptr{aws_retry_token},), token)
end

"""
    aws_retry_strategy_new_exponential_backoff(allocator, config)

Creates a retry strategy using exponential backoff. This strategy does not perform any bookkeeping on error types and success. There is no circuit breaker functionality in here. See the comments above for [`aws_exponential_backoff_retry_options`](@ref).

### Prototype
```c
struct aws_retry_strategy *aws_retry_strategy_new_exponential_backoff( struct aws_allocator *allocator, const struct aws_exponential_backoff_retry_options *config);
```
"""
function aws_retry_strategy_new_exponential_backoff(allocator, config)
    ccall((:aws_retry_strategy_new_exponential_backoff, libaws_c_io), Ptr{aws_retry_strategy}, (Ptr{aws_allocator}, Ptr{aws_exponential_backoff_retry_options}), allocator, config)
end

"""
    aws_retry_strategy_new_standard(allocator, config)

This is a retry implementation that cuts off traffic if it's detected that an endpoint partition is having availability problems. This is necessary to keep from making outages worse by scheduling work that's unlikely to succeed yet increases load on an already ailing system.

We do this by creating a bucket for each partition. A partition is an arbitrary specifier. It can be anything: a region, a service, a combination of region and service, a literal dns name.... doesn't matter.

Each bucket has a budget for maximum allowed retries. Different types of events carry different weights. Things that indicate an unhealthy partition such as transient errors (timeouts, unhealthy connection etc...) cost more. A retry for any other reason (service sending a 5xx response code) cost a bit less. When a retry is attempted this capacity is leased out to the retry. On success it is released back to the capacity pool. On failure, it remains leased. Operations that succeed without a retry slowly restore the capacity pool.

If a partition runs out of capacity it is assumed unhealthy and retries will be blocked until capacity returns to the pool. To prevent a partition from staying unhealthy after an outage has recovered, new requests that succeed without a retry will increase the capacity slowly ( a new request gets a payback lease of 1, but the lease is never actually deducted from the capacity pool).

### Prototype
```c
struct aws_retry_strategy *aws_retry_strategy_new_standard( struct aws_allocator *allocator, const struct aws_standard_retry_options *config);
```
"""
function aws_retry_strategy_new_standard(allocator, config)
    ccall((:aws_retry_strategy_new_standard, libaws_c_io), Ptr{aws_retry_strategy}, (Ptr{aws_allocator}, Ptr{aws_standard_retry_options}), allocator, config)
end

"""
    aws_retry_strategy_new_no_retry(allocator, config)

This retry strategy is used to disable retries. Passed config can be null. Calling [`aws_retry_strategy_acquire_retry_token`](@ref) will raise error `AWS_IO_RETRY_PERMISSION_DENIED`. Calling any function apart from the [`aws_retry_strategy_acquire_retry_token`](@ref) and [`aws_retry_strategy_release`](@ref) will result in a fatal error.

### Prototype
```c
struct aws_retry_strategy *aws_retry_strategy_new_no_retry( struct aws_allocator *allocator, const struct aws_no_retry_options *config);
```
"""
function aws_retry_strategy_new_no_retry(allocator, config)
    ccall((:aws_retry_strategy_new_no_retry, libaws_c_io), Ptr{aws_retry_strategy}, (Ptr{aws_allocator}, Ptr{aws_no_retry_options}), allocator, config)
end

"""
    aws_shared_library

Documentation not found.
"""
struct aws_shared_library
    library_handle::Ptr{Cvoid}
end

# typedef void ( * aws_generic_function ) ( void )
"""
Documentation not found.
"""
const aws_generic_function = Ptr{Cvoid}

"""
    aws_shared_library_init(library, library_path)

Documentation not found.
### Prototype
```c
int aws_shared_library_init(struct aws_shared_library *library, const char *library_path);
```
"""
function aws_shared_library_init(library, library_path)
    ccall((:aws_shared_library_init, libaws_c_io), Cint, (Ptr{aws_shared_library}, Ptr{Cchar}), library, library_path)
end

"""
    aws_shared_library_clean_up(library)

Documentation not found.
### Prototype
```c
void aws_shared_library_clean_up(struct aws_shared_library *library);
```
"""
function aws_shared_library_clean_up(library)
    ccall((:aws_shared_library_clean_up, libaws_c_io), Cvoid, (Ptr{aws_shared_library},), library)
end

"""
    aws_shared_library_find_function(library, symbol_name, function_address)

Documentation not found.
### Prototype
```c
int aws_shared_library_find_function( struct aws_shared_library *library, const char *symbol_name, aws_generic_function *function_address);
```
"""
function aws_shared_library_find_function(library, symbol_name, function_address)
    ccall((:aws_shared_library_find_function, libaws_c_io), Cint, (Ptr{aws_shared_library}, Ptr{Cchar}, Ptr{aws_generic_function}), library, symbol_name, function_address)
end

# typedef void ( aws_socket_on_shutdown_complete_fn ) ( void * user_data )
"""
Documentation not found.
"""
const aws_socket_on_shutdown_complete_fn = Cvoid

# typedef void ( aws_socket_on_accept_started_fn ) ( struct aws_socket * socket , int error_code , void * user_data )
"""
Called by a listening socket when a listener accept has successfully initialized or an error has occurred. If the listener was successful error\\_code will be AWS\\_ERROR\\_SUCCESS and the socket has already been assigned to the event loop specified in [`aws_socket_start_accept`](@ref)().

If an error occurred error\\_code will be non-zero.
"""
const aws_socket_on_accept_started_fn = Cvoid

# typedef void ( aws_socket_on_write_completed_fn ) ( struct aws_socket * socket , int error_code , size_t bytes_written , void * user_data )
"""
Callback for when the data passed to a call to [`aws_socket_write`](@ref)() has either completed or failed. On success, error\\_code will be AWS\\_ERROR\\_SUCCESS.

`socket` may be NULL in the callback if the socket is released and cleaned up before the callback is triggered.
"""
const aws_socket_on_write_completed_fn = Cvoid

"""
    aws_socket_connect_options

Documentation not found.
"""
struct aws_socket_connect_options
    remote_endpoint::Ptr{aws_socket_endpoint}
    event_loop::Ptr{aws_event_loop}
    on_connection_result::Ptr{aws_socket_on_connection_result_fn}
    user_data::Ptr{Cvoid}
    tls_connection_options::Ptr{aws_tls_connection_options}
end

"""
    aws_socket_listener_options

Documentation not found.
"""
struct aws_socket_listener_options
    on_accept_result::Ptr{aws_socket_on_accept_result_fn}
    on_accept_result_user_data::Ptr{Cvoid}
    on_accept_start::Ptr{aws_socket_on_accept_started_fn}
    on_accept_start_user_data::Ptr{Cvoid}
end

"""
    aws_socket_bind_options

Documentation not found.
"""
struct aws_socket_bind_options
    local_endpoint::Ptr{aws_socket_endpoint}
    user_data::Ptr{Cvoid}
    event_loop::Ptr{aws_event_loop}
    tls_connection_options::Ptr{aws_tls_connection_options}
end

"""
    aws_socket_init(socket, alloc, options)

Initializes a socket object with socket options. options will be copied.

### Prototype
```c
int aws_socket_init( struct aws_socket *socket, struct aws_allocator *alloc, const struct aws_socket_options *options);
```
"""
function aws_socket_init(socket, alloc, options)
    ccall((:aws_socket_init, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_allocator}, Ptr{aws_socket_options}), socket, alloc, options)
end

"""
    aws_socket_clean_up(socket)

Shuts down any pending operations on the socket, and cleans up state. The socket object can be re-initialized after this operation. This function calls [`aws_socket_close`](@ref). If you have not already called [`aws_socket_close`](@ref)() on the socket, all of the rules for [`aws_socket_close`](@ref)() apply here. In this case it will not fail if you use the function improperly, but on some platforms you will certainly leak memory.

If the socket has already been closed, you can safely, call this from any thread.

### Prototype
```c
void aws_socket_clean_up(struct aws_socket *socket);
```
"""
function aws_socket_clean_up(socket)
    ccall((:aws_socket_clean_up, libaws_c_io), Cvoid, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_connect(socket, socket_connect_options)

Connects to a remote endpoint. In UDP, this simply binds the socket to a remote address for use with `[`aws_socket_write`](@ref)()`, and if the operation is successful, the socket can immediately be used for write operations.

In TCP, LOCAL and VSOCK this function will not block. If the return value is successful, then you must wait on the `on\\_connection\\_result()` callback to be invoked before using the socket.

If an event\\_loop is provided for UDP sockets, a notification will be sent on on\\_connection\\_result in the event-loop's thread. Upon completion, the socket will already be assigned an event loop. If NULL is passed for UDP, it will immediately return upon success, but you must call [`aws_socket_assign_to_event_loop`](@ref) before use.

### Prototype
```c
int aws_socket_connect(struct aws_socket *socket, struct aws_socket_connect_options *socket_connect_options);
```
"""
function aws_socket_connect(socket, socket_connect_options)
    ccall((:aws_socket_connect, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_socket_connect_options}), socket, socket_connect_options)
end

"""
    aws_socket_bind(socket, socket_bind_options)

Binds the socket to a local address. In UDP mode, the socket is ready for `[`aws_socket_read`](@ref)()` operations. In connection oriented modes, you still must call `[`aws_socket_listen`](@ref)()` and `[`aws_socket_start_accept`](@ref)()` before using the socket. local\\_endpoint is copied.

### Prototype
```c
int aws_socket_bind(struct aws_socket *socket, struct aws_socket_bind_options *socket_bind_options);
```
"""
function aws_socket_bind(socket, socket_bind_options)
    ccall((:aws_socket_bind, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_socket_bind_options}), socket, socket_bind_options)
end

"""
    aws_socket_get_bound_address(socket, out_address)

Get the local address which the socket is bound to. Raises an error if no address is bound.

### Prototype
```c
int aws_socket_get_bound_address(const struct aws_socket *socket, struct aws_socket_endpoint *out_address);
```
"""
function aws_socket_get_bound_address(socket, out_address)
    ccall((:aws_socket_get_bound_address, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_socket_endpoint}), socket, out_address)
end

"""
    aws_socket_listen(socket, backlog_size)

TCP, LOCAL and VSOCK only. Sets up the socket to listen on the address bound to in `[`aws_socket_bind`](@ref)()`.

### Prototype
```c
int aws_socket_listen(struct aws_socket *socket, int backlog_size);
```
"""
function aws_socket_listen(socket, backlog_size)
    ccall((:aws_socket_listen, libaws_c_io), Cint, (Ptr{aws_socket}, Cint), socket, backlog_size)
end

"""
    aws_socket_start_accept(socket, accept_loop, options)

TCP, LOCAL and VSOCK only. The socket will begin accepting new connections. This is an asynchronous operation. New connections or errors will arrive via the `on_accept_result` callback.

[`aws_socket_bind`](@ref)() and [`aws_socket_listen`](@ref)() must be called before calling this function.

### Prototype
```c
int aws_socket_start_accept( struct aws_socket *socket, struct aws_event_loop *accept_loop, struct aws_socket_listener_options options);
```
"""
function aws_socket_start_accept(socket, accept_loop, options)
    ccall((:aws_socket_start_accept, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_event_loop}, aws_socket_listener_options), socket, accept_loop, options)
end

"""
    aws_socket_stop_accept(socket)

TCP, LOCAL and VSOCK only. The listening socket will stop accepting new connections. It is safe to call `[`aws_socket_start_accept`](@ref)()` again after this operation. This can be called from any thread but be aware, on some platforms, if you call this from outside of the current event loop's thread, it will block until the event loop finishes processing the request for unsubscribe in it's own thread.

### Prototype
```c
int aws_socket_stop_accept(struct aws_socket *socket);
```
"""
function aws_socket_stop_accept(socket)
    ccall((:aws_socket_stop_accept, libaws_c_io), Cint, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_close(socket)

Calls `close()` on the socket and unregisters all io operations from the event loop. This function must be called from the event-loop's thread unless this is a listening socket. If it's a listening socket it can be called from any non-event-loop thread or the event-loop the socket is currently assigned to. If called from outside the event-loop, this function will block waiting on the socket to close. If this is called from an event-loop thread other than the one it's assigned to, it presents the possibility of a deadlock, so don't do it.

If you are using Apple Network Framework, you should always call this function from an event-loop thread regardless it is a server or client socket.

### Prototype
```c
int aws_socket_close(struct aws_socket *socket);
```
"""
function aws_socket_close(socket)
    ccall((:aws_socket_close, libaws_c_io), Cint, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_shutdown_dir(socket, dir)

Calls `shutdown()` on the socket based on direction.

### Prototype
```c
int aws_socket_shutdown_dir(struct aws_socket *socket, enum aws_channel_direction dir);
```
"""
function aws_socket_shutdown_dir(socket, dir)
    ccall((:aws_socket_shutdown_dir, libaws_c_io), Cint, (Ptr{aws_socket}, aws_channel_direction), socket, dir)
end

"""
    aws_socket_set_options(socket, options)

Sets new socket options on the underlying socket.

### Prototype
```c
int aws_socket_set_options(struct aws_socket *socket, const struct aws_socket_options *options);
```
"""
function aws_socket_set_options(socket, options)
    ccall((:aws_socket_set_options, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_socket_options}), socket, options)
end

"""
    aws_socket_assign_to_event_loop(socket, event_loop)

Assigns the socket to the event-loop. The socket will begin receiving read/write/error notifications after this call.

Note: If you called connect for TCP or Unix Domain Sockets and received a connection\\_success callback, this has already happened. You only need to call this function when:

a.) This socket is a server socket (e.g. a result of a call to start\\_accept()) b.) This socket is a UDP socket.

### Prototype
```c
int aws_socket_assign_to_event_loop(struct aws_socket *socket, struct aws_event_loop *event_loop);
```
"""
function aws_socket_assign_to_event_loop(socket, event_loop)
    ccall((:aws_socket_assign_to_event_loop, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_event_loop}), socket, event_loop)
end

"""
    aws_socket_get_event_loop(socket)

Gets the event-loop the socket is assigned to.

### Prototype
```c
struct aws_event_loop *aws_socket_get_event_loop(struct aws_socket *socket);
```
"""
function aws_socket_get_event_loop(socket)
    ccall((:aws_socket_get_event_loop, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_subscribe_to_readable_events(socket, on_readable, user_data)

Subscribes on\\_readable to notifications when the socket goes readable (edge-triggered). Errors will also be received in the callback.

Note! This function is technically not thread safe, but we do not enforce which thread you call from. It's your responsibility to either call this in safely (e.g. just don't call it in parallel from multiple threads) or schedule a task to call it. If you call it before your first call to read, it will be fine.

### Prototype
```c
int aws_socket_subscribe_to_readable_events( struct aws_socket *socket, aws_socket_on_readable_fn *on_readable, void *user_data);
```
"""
function aws_socket_subscribe_to_readable_events(socket, on_readable, user_data)
    ccall((:aws_socket_subscribe_to_readable_events, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_socket_on_readable_fn}, Ptr{Cvoid}), socket, on_readable, user_data)
end

"""
    aws_socket_read(socket, buffer, amount_read)

Reads from the socket. This call is non-blocking and will return `AWS_IO_SOCKET_READ_WOULD_BLOCK` if no data is available. `read` is the amount of data read into `buffer`.

Attempts to read enough to fill all remaining space in the buffer, from `buffer->len` to `buffer->capacity`. `buffer->len` is updated to reflect the buffer's new length.

Use [`aws_socket_subscribe_to_readable_events`](@ref)() to receive notifications of when the socket goes readable.

NOTE! This function must be called from the event-loop used in [`aws_socket_assign_to_event_loop`](@ref)

### Prototype
```c
int aws_socket_read(struct aws_socket *socket, struct aws_byte_buf *buffer, size_t *amount_read);
```
"""
function aws_socket_read(socket, buffer, amount_read)
    ccall((:aws_socket_read, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_byte_buf}, Ptr{Csize_t}), socket, buffer, amount_read)
end

"""
    aws_socket_write(socket, cursor, written_fn, user_data)

Writes to the socket. This call is non-blocking and will attempt to write as much as it can, but will queue any remaining portion of the data for write when available. written\\_fn will be invoked once the entire cursor has been written, or the write failed or was cancelled.

NOTE! This function must be called from the event-loop used in [`aws_socket_assign_to_event_loop`](@ref)

For client sockets, connect() and [`aws_socket_assign_to_event_loop`](@ref)() must be called before calling this.

For incoming sockets from a listener, [`aws_socket_assign_to_event_loop`](@ref)() must be called first.

### Prototype
```c
int aws_socket_write( struct aws_socket *socket, const struct aws_byte_cursor *cursor, aws_socket_on_write_completed_fn *written_fn, void *user_data);
```
"""
function aws_socket_write(socket, cursor, written_fn, user_data)
    ccall((:aws_socket_write, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_byte_cursor}, Ptr{aws_socket_on_write_completed_fn}, Ptr{Cvoid}), socket, cursor, written_fn, user_data)
end

"""
    aws_socket_set_close_complete_callback(socket, fn, user_data)

Apple Network Framework only. The callback that will triggered when [`aws_socket_close`](@ref)() finished. The callback will be called from the socket event loop.

### Prototype
```c
int aws_socket_set_close_complete_callback( struct aws_socket *socket, aws_socket_on_shutdown_complete_fn fn, void *user_data);
```
"""
function aws_socket_set_close_complete_callback(socket, fn, user_data)
    ccall((:aws_socket_set_close_complete_callback, libaws_c_io), Cint, (Ptr{aws_socket}, aws_socket_on_shutdown_complete_fn, Ptr{Cvoid}), socket, fn, user_data)
end

"""
    aws_socket_set_cleanup_complete_callback(socket, fn, user_data)

Apple Network Framework only. The callback that will triggered when aws\\_socket\\_cleanup() finished. And it is only safe to release the socket afterwards. The callback will be called from the socket event loop.

### Prototype
```c
int aws_socket_set_cleanup_complete_callback( struct aws_socket *socket, aws_socket_on_shutdown_complete_fn fn, void *user_data);
```
"""
function aws_socket_set_cleanup_complete_callback(socket, fn, user_data)
    ccall((:aws_socket_set_cleanup_complete_callback, libaws_c_io), Cint, (Ptr{aws_socket}, aws_socket_on_shutdown_complete_fn, Ptr{Cvoid}), socket, fn, user_data)
end

"""
    aws_socket_get_error(socket)

Gets the latest error from the socket. If no error has occurred AWS\\_OP\\_SUCCESS will be returned. This function does not raise any errors to the installed error handlers.

### Prototype
```c
int aws_socket_get_error(struct aws_socket *socket);
```
"""
function aws_socket_get_error(socket)
    ccall((:aws_socket_get_error, libaws_c_io), Cint, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_is_open(socket)

Returns true if the socket is still open (doesn't mean connected or listening, only that it hasn't had close() called.

### Prototype
```c
bool aws_socket_is_open(struct aws_socket *socket);
```
"""
function aws_socket_is_open(socket)
    ccall((:aws_socket_is_open, libaws_c_io), Bool, (Ptr{aws_socket},), socket)
end

"""
    aws_socket_validate_port_for_connect(port, domain)

Raises AWS\\_IO\\_SOCKET\\_INVALID\\_ADDRESS and logs an error if connecting to this port is illegal. For example, port must be in range 1-65535 to connect with IPv4. These port values would fail eventually in [`aws_socket_connect`](@ref)(), but you can use this function to validate earlier.

### Prototype
```c
int aws_socket_validate_port_for_connect(uint32_t port, enum aws_socket_domain domain);
```
"""
function aws_socket_validate_port_for_connect(port, domain)
    ccall((:aws_socket_validate_port_for_connect, libaws_c_io), Cint, (UInt32, aws_socket_domain), port, domain)
end

"""
    aws_socket_validate_port_for_bind(port, domain)

Raises AWS\\_IO\\_SOCKET\\_INVALID\\_ADDRESS and logs an error if binding to this port is illegal. For example, port must in range 0-65535 to bind with IPv4. These port values would fail eventually in [`aws_socket_bind`](@ref)(), but you can use this function to validate earlier.

### Prototype
```c
int aws_socket_validate_port_for_bind(uint32_t port, enum aws_socket_domain domain);
```
"""
function aws_socket_validate_port_for_bind(port, domain)
    ccall((:aws_socket_validate_port_for_bind, libaws_c_io), Cint, (UInt32, aws_socket_domain), port, domain)
end

"""
    aws_socket_endpoint_init_local_address_for_test(endpoint)

Assigns a random address (UUID) for use with AWS\\_SOCKET\\_LOCAL (Unix Domain Sockets). For use in internal tests only.

### Prototype
```c
void aws_socket_endpoint_init_local_address_for_test(struct aws_socket_endpoint *endpoint);
```
"""
function aws_socket_endpoint_init_local_address_for_test(endpoint)
    ccall((:aws_socket_endpoint_init_local_address_for_test, libaws_c_io), Cvoid, (Ptr{aws_socket_endpoint},), endpoint)
end

"""
    aws_is_network_interface_name_valid(interface_name)

Validates whether the network interface name is valid. On Windows, it will always return false since we don't support network\\_interface\\_name on Windows

### Prototype
```c
bool aws_is_network_interface_name_valid(const char *interface_name);
```
"""
function aws_is_network_interface_name_valid(interface_name)
    ccall((:aws_is_network_interface_name_valid, libaws_c_io), Bool, (Ptr{Cchar},), interface_name)
end

"""
    aws_socket_get_default_impl_type()

Get default impl type based on the platform. For user in internal tests only.

### Prototype
```c
enum aws_socket_impl_type aws_socket_get_default_impl_type(void);
```
"""
function aws_socket_get_default_impl_type()
    ccall((:aws_socket_get_default_impl_type, libaws_c_io), aws_socket_impl_type, ())
end

"""
    aws_socket_handler_new(allocator, socket, slot, max_read_size)

Socket handlers should be the first slot/handler in a channel. It interacts directly with the channel's event loop for read and write notifications. max\\_read\\_size is the maximum amount of data it will read from the socket before a context switch (a continuation task will be scheduled).

### Prototype
```c
struct aws_channel_handler *aws_socket_handler_new( struct aws_allocator *allocator, struct aws_socket *socket, struct aws_channel_slot *slot, size_t max_read_size);
```
"""
function aws_socket_handler_new(allocator, socket, slot, max_read_size)
    ccall((:aws_socket_handler_new, libaws_c_io), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Ptr{aws_socket}, Ptr{aws_channel_slot}, Csize_t), allocator, socket, slot, max_read_size)
end

"""
    aws_socket_handler_get_socket(handler)

Documentation not found.
### Prototype
```c
const struct aws_socket *aws_socket_handler_get_socket(const struct aws_channel_handler *handler);
```
"""
function aws_socket_handler_get_socket(handler)
    ccall((:aws_socket_handler_get_socket, libaws_c_io), Ptr{aws_socket}, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_crt_io_statistics_category

Documentation not found.
"""
@cenum aws_crt_io_statistics_category::UInt32 begin
    AWSCRT_STAT_CAT_SOCKET = 256
    AWSCRT_STAT_CAT_TLS = 257
end

"""
    aws_crt_statistics_socket

Socket channel handler statistics record
"""
struct aws_crt_statistics_socket
    category::aws_crt_statistics_category_t
    bytes_read::UInt64
    bytes_written::UInt64
end

"""
    aws_tls_negotiation_status

An enum for the current state of tls negotiation within a tls channel handler
"""
@cenum aws_tls_negotiation_status::UInt32 begin
    AWS_TLS_NEGOTIATION_STATUS_NONE = 0
    AWS_TLS_NEGOTIATION_STATUS_ONGOING = 1
    AWS_TLS_NEGOTIATION_STATUS_SUCCESS = 2
    AWS_TLS_NEGOTIATION_STATUS_FAILURE = 3
end

"""
    aws_crt_statistics_tls

Tls channel handler statistics record
"""
struct aws_crt_statistics_tls
    category::aws_crt_statistics_category_t
    handshake_start_ns::UInt64
    handshake_end_ns::UInt64
    handshake_status::aws_tls_negotiation_status
end

"""
    aws_crt_statistics_socket_init(stats)

Initializes socket channel handler statistics

### Prototype
```c
int aws_crt_statistics_socket_init(struct aws_crt_statistics_socket *stats);
```
"""
function aws_crt_statistics_socket_init(stats)
    ccall((:aws_crt_statistics_socket_init, libaws_c_io), Cint, (Ptr{aws_crt_statistics_socket},), stats)
end

"""
    aws_crt_statistics_socket_cleanup(stats)

Cleans up socket channel handler statistics

### Prototype
```c
void aws_crt_statistics_socket_cleanup(struct aws_crt_statistics_socket *stats);
```
"""
function aws_crt_statistics_socket_cleanup(stats)
    ccall((:aws_crt_statistics_socket_cleanup, libaws_c_io), Cvoid, (Ptr{aws_crt_statistics_socket},), stats)
end

"""
    aws_crt_statistics_socket_reset(stats)

Resets socket channel handler statistics for the next gather interval. Calculate-once results are left alone.

### Prototype
```c
void aws_crt_statistics_socket_reset(struct aws_crt_statistics_socket *stats);
```
"""
function aws_crt_statistics_socket_reset(stats)
    ccall((:aws_crt_statistics_socket_reset, libaws_c_io), Cvoid, (Ptr{aws_crt_statistics_socket},), stats)
end

"""
    aws_crt_statistics_tls_init(stats)

Initializes tls channel handler statistics

### Prototype
```c
int aws_crt_statistics_tls_init(struct aws_crt_statistics_tls *stats);
```
"""
function aws_crt_statistics_tls_init(stats)
    ccall((:aws_crt_statistics_tls_init, libaws_c_io), Cint, (Ptr{aws_crt_statistics_tls},), stats)
end

"""
    aws_crt_statistics_tls_cleanup(stats)

Cleans up tls channel handler statistics

### Prototype
```c
void aws_crt_statistics_tls_cleanup(struct aws_crt_statistics_tls *stats);
```
"""
function aws_crt_statistics_tls_cleanup(stats)
    ccall((:aws_crt_statistics_tls_cleanup, libaws_c_io), Cvoid, (Ptr{aws_crt_statistics_tls},), stats)
end

"""
    aws_crt_statistics_tls_reset(stats)

Resets tls channel handler statistics for the next gather interval. Calculate-once results are left alone.

### Prototype
```c
void aws_crt_statistics_tls_reset(struct aws_crt_statistics_tls *stats);
```
"""
function aws_crt_statistics_tls_reset(stats)
    ccall((:aws_crt_statistics_tls_reset, libaws_c_io), Cvoid, (Ptr{aws_crt_statistics_tls},), stats)
end

"""
    aws_stream_seek_basis

Documentation not found.
"""
@cenum aws_stream_seek_basis::UInt32 begin
    AWS_SSB_BEGIN = 0
    AWS_SSB_END = 2
end

"""
    aws_stream_status

Documentation not found.
"""
struct aws_stream_status
    is_end_of_stream::Bool
    is_valid::Bool
end

"""
    aws_input_stream_vtable

Documentation not found.
"""
struct aws_input_stream_vtable
    seek::Ptr{Cvoid}
    read::Ptr{Cvoid}
    get_status::Ptr{Cvoid}
    get_length::Ptr{Cvoid}
    acquire::Ptr{Cvoid}
    release::Ptr{Cvoid}
end

"""
    aws_input_stream

Base class for input streams. Note: when you implement one input stream, the ref\\_count needs to be initialized to clean up the resource when reaches to zero.
"""
struct aws_input_stream
    impl::Ptr{Cvoid}
    vtable::Ptr{aws_input_stream_vtable}
    ref_count::aws_ref_count
end

"""
    aws_input_stream_acquire(stream)

Increments the reference count on the input stream, allowing the caller to take a reference to it.

Returns the same input stream passed in.

### Prototype
```c
struct aws_input_stream *aws_input_stream_acquire(struct aws_input_stream *stream);
```
"""
function aws_input_stream_acquire(stream)
    ccall((:aws_input_stream_acquire, libaws_c_io), Ptr{aws_input_stream}, (Ptr{aws_input_stream},), stream)
end

"""
    aws_input_stream_release(stream)

Decrements a input stream's ref count. When the ref count drops to zero, the input stream will be destroyed.

Returns NULL always.

### Prototype
```c
struct aws_input_stream *aws_input_stream_release(struct aws_input_stream *stream);
```
"""
function aws_input_stream_release(stream)
    ccall((:aws_input_stream_release, libaws_c_io), Ptr{aws_input_stream}, (Ptr{aws_input_stream},), stream)
end

"""
    aws_input_stream_seek(stream, offset, basis)

Documentation not found.
### Prototype
```c
int aws_input_stream_seek(struct aws_input_stream *stream, int64_t offset, enum aws_stream_seek_basis basis);
```
"""
function aws_input_stream_seek(stream, offset, basis)
    ccall((:aws_input_stream_seek, libaws_c_io), Cint, (Ptr{aws_input_stream}, Int64, aws_stream_seek_basis), stream, offset, basis)
end

"""
    aws_input_stream_read(stream, dest)

Documentation not found.
### Prototype
```c
int aws_input_stream_read(struct aws_input_stream *stream, struct aws_byte_buf *dest);
```
"""
function aws_input_stream_read(stream, dest)
    ccall((:aws_input_stream_read, libaws_c_io), Cint, (Ptr{aws_input_stream}, Ptr{aws_byte_buf}), stream, dest)
end

"""
    aws_input_stream_get_status(stream, status)

Documentation not found.
### Prototype
```c
int aws_input_stream_get_status(struct aws_input_stream *stream, struct aws_stream_status *status);
```
"""
function aws_input_stream_get_status(stream, status)
    ccall((:aws_input_stream_get_status, libaws_c_io), Cint, (Ptr{aws_input_stream}, Ptr{aws_stream_status}), stream, status)
end

"""
    aws_input_stream_get_length(stream, out_length)

Documentation not found.
### Prototype
```c
int aws_input_stream_get_length(struct aws_input_stream *stream, int64_t *out_length);
```
"""
function aws_input_stream_get_length(stream, out_length)
    ccall((:aws_input_stream_get_length, libaws_c_io), Cint, (Ptr{aws_input_stream}, Ptr{Int64}), stream, out_length)
end

"""
    aws_input_stream_destroy(stream)

Documentation not found.
### Prototype
```c
void aws_input_stream_destroy(struct aws_input_stream *stream);
```
"""
function aws_input_stream_destroy(stream)
    ccall((:aws_input_stream_destroy, libaws_c_io), Cvoid, (Ptr{aws_input_stream},), stream)
end

"""
    aws_input_stream_new_from_cursor(allocator, cursor)

Documentation not found.
### Prototype
```c
struct aws_input_stream *aws_input_stream_new_from_cursor( struct aws_allocator *allocator, const struct aws_byte_cursor *cursor);
```
"""
function aws_input_stream_new_from_cursor(allocator, cursor)
    ccall((:aws_input_stream_new_from_cursor, libaws_c_io), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, cursor)
end

"""
    aws_input_stream_new_from_file(allocator, file_name)

Documentation not found.
### Prototype
```c
struct aws_input_stream *aws_input_stream_new_from_file( struct aws_allocator *allocator, const char *file_name);
```
"""
function aws_input_stream_new_from_file(allocator, file_name)
    ccall((:aws_input_stream_new_from_file, libaws_c_io), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{Cchar}), allocator, file_name)
end

"""
    aws_input_stream_new_from_open_file(allocator, file)

Documentation not found.
### Prototype
```c
struct aws_input_stream *aws_input_stream_new_from_open_file(struct aws_allocator *allocator, FILE *file);
```
"""
function aws_input_stream_new_from_open_file(allocator, file)
    ccall((:aws_input_stream_new_from_open_file, libaws_c_io), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{Libc.FILE}), allocator, file)
end

"""
Documentation not found.
"""
mutable struct aws_pkcs11_session end

"""
    aws_tls_versions

Documentation not found.
"""
@cenum aws_tls_versions::UInt32 begin
    AWS_IO_SSLv3 = 0
    AWS_IO_TLSv1 = 1
    AWS_IO_TLSv1_1 = 2
    AWS_IO_TLSv1_2 = 3
    AWS_IO_TLSv1_3 = 4
    AWS_IO_TLS_VER_SYS_DEFAULTS = 128
end

"""
    aws_tls_cipher_pref

Documentation not found.
"""
@cenum aws_tls_cipher_pref::UInt32 begin
    AWS_IO_TLS_CIPHER_PREF_SYSTEM_DEFAULT = 0
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2019_06 = 1
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_SIKE_TLSv1_0_2019_11 = 2
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2020_02 = 3
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_SIKE_TLSv1_0_2020_02 = 4
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2020_07 = 5
    AWS_IO_TLS_CIPHER_PREF_PQ_TLSv1_0_2021_05 = 6
    AWS_IO_TLS_CIPHER_PREF_PQ_TLSV1_2_2024_10 = 7
    AWS_IO_TLS_CIPHER_PREF_PQ_DEFAULT = 8
    AWS_IO_TLS_CIPHER_PREF_END_RANGE = 65535
end

"""
    aws_tls_hash_algorithm

The hash algorithm of a TLS private key operation. Any custom private key operation handlers are expected to perform operations on the input TLS data using the correct hash algorithm or fail the operation.
"""
@cenum aws_tls_hash_algorithm::UInt32 begin
    AWS_TLS_HASH_UNKNOWN = 0
    AWS_TLS_HASH_SHA1 = 1
    AWS_TLS_HASH_SHA224 = 2
    AWS_TLS_HASH_SHA256 = 3
    AWS_TLS_HASH_SHA384 = 4
    AWS_TLS_HASH_SHA512 = 5
end

"""
    aws_tls_signature_algorithm

The signature of a TLS private key operation. Any custom private key operation handlers are expected to perform operations on the input TLS data using the correct signature algorithm or fail the operation.
"""
@cenum aws_tls_signature_algorithm::UInt32 begin
    AWS_TLS_SIGNATURE_UNKNOWN = 0
    AWS_TLS_SIGNATURE_RSA = 1
    AWS_TLS_SIGNATURE_ECDSA = 2
end

"""
    aws_tls_key_operation_type

The TLS private key operation that needs to be performed by a custom private key operation handler when making a connection using mutual TLS.
"""
@cenum aws_tls_key_operation_type::UInt32 begin
    AWS_TLS_KEY_OPERATION_UNKNOWN = 0
    AWS_TLS_KEY_OPERATION_SIGN = 1
    AWS_TLS_KEY_OPERATION_DECRYPT = 2
end

"""
A struct containing all of the data needed for a private key operation when making a mutual TLS connection. This struct contains the data that needs to be operated on, like performing a sign operation or a decrypt operation.
"""
mutable struct aws_tls_key_operation end

"""
    aws_secitem_options

A struct containing parameters used during import of Certificate and Private Key into a data protection keychain using Apple's SecItem API.
"""
struct aws_secitem_options
    cert_label::Ptr{aws_string}
    key_label::Ptr{aws_string}
end

"""
    aws_custom_key_op_handler_vtable

vtable for [`aws_custom_key_op_handler`](@ref).
"""
struct aws_custom_key_op_handler_vtable
    on_key_operation::Ptr{Cvoid}
end

"""
    aws_custom_key_op_handler

The custom key operation that is used when performing a mutual TLS handshake. This can be extended to provide custom private key operations, like PKCS11 or similar.
"""
struct aws_custom_key_op_handler
    impl::Ptr{Cvoid}
    vtable::Ptr{aws_custom_key_op_handler_vtable}
    ref_count::aws_ref_count
end

"""
    aws_tls_ctx_options

Documentation not found.
"""
struct aws_tls_ctx_options
    allocator::Ptr{aws_allocator}
    minimum_tls_version::aws_tls_versions
    cipher_pref::aws_tls_cipher_pref
    ca_file::aws_byte_buf
    ca_path::Ptr{aws_string}
    alpn_list::Ptr{aws_string}
    certificate::aws_byte_buf
    system_certificate_path::Ptr{Cchar}
    private_key::aws_byte_buf
    max_fragment_size::Csize_t
    verify_peer::Bool
    ctx_options_extension::Ptr{Cvoid}
    custom_key_op_handler::Ptr{aws_custom_key_op_handler}
end

"""
    aws_tls_negotiated_protocol_message

Documentation not found.
"""
struct aws_tls_negotiated_protocol_message
    protocol::aws_byte_buf
end

# typedef struct aws_channel_handler * ( * aws_tls_on_protocol_negotiated ) ( struct aws_channel_slot * new_slot , struct aws_byte_buf * protocol , void * user_data )
"""
Documentation not found.
"""
const aws_tls_on_protocol_negotiated = Ptr{Cvoid}

"""
    aws_tls_ctx_options_init_default_client(options, allocator)

****************************** tls options init stuff **********************

Initializes options with default client options

### Prototype
```c
void aws_tls_ctx_options_init_default_client( struct aws_tls_ctx_options *options, struct aws_allocator *allocator);
```
"""
function aws_tls_ctx_options_init_default_client(options, allocator)
    ccall((:aws_tls_ctx_options_init_default_client, libaws_c_io), Cvoid, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}), options, allocator)
end

"""
    aws_tls_ctx_options_clean_up(options)

Cleans up resources allocated by init\\_* functions

### Prototype
```c
void aws_tls_ctx_options_clean_up(struct aws_tls_ctx_options *options);
```
"""
function aws_tls_ctx_options_clean_up(options)
    ccall((:aws_tls_ctx_options_clean_up, libaws_c_io), Cvoid, (Ptr{aws_tls_ctx_options},), options)
end

"""
    aws_tls_ctx_options_init_client_mtls_from_path(options, allocator, cert_path, pkey_path)

Initializes options for use with mutual tls in client mode. cert\\_path and pkey\\_path are paths to files on disk. cert\\_path and pkey\\_path are treated as PKCS#7 PEM armored. They are loaded from disk and stored in buffers internally.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_from_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *cert_path, const char *pkey_path);
```
"""
function aws_tls_ctx_options_init_client_mtls_from_path(options, allocator, cert_path, pkey_path)
    ccall((:aws_tls_ctx_options_init_client_mtls_from_path, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}, Ptr{Cchar}), options, allocator, cert_path, pkey_path)
end

"""
    aws_tls_ctx_options_init_client_mtls(options, allocator, cert, pkey)

Initializes options for use with mutual tls in client mode. cert and pkey are copied. cert and pkey are treated as PKCS#7 PEM armored.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const struct aws_byte_cursor *cert, const struct aws_byte_cursor *pkey);
```
"""
function aws_tls_ctx_options_init_client_mtls(options, allocator, cert, pkey)
    ccall((:aws_tls_ctx_options_init_client_mtls, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), options, allocator, cert, pkey)
end

"""
    aws_custom_key_op_handler_acquire(key_op_handler)

Increases the reference count for the passed-in [`aws_custom_key_op_handler`](@ref) and returns it.

### Prototype
```c
struct aws_custom_key_op_handler *aws_custom_key_op_handler_acquire( struct aws_custom_key_op_handler *key_op_handler);
```
"""
function aws_custom_key_op_handler_acquire(key_op_handler)
    ccall((:aws_custom_key_op_handler_acquire, libaws_c_io), Ptr{aws_custom_key_op_handler}, (Ptr{aws_custom_key_op_handler},), key_op_handler)
end

"""
    aws_custom_key_op_handler_release(key_op_handler)

Decreases the reference count for the passed-in [`aws_custom_key_op_handler`](@ref) and returns NULL.

### Prototype
```c
struct aws_custom_key_op_handler *aws_custom_key_op_handler_release( struct aws_custom_key_op_handler *key_op_handler);
```
"""
function aws_custom_key_op_handler_release(key_op_handler)
    ccall((:aws_custom_key_op_handler_release, libaws_c_io), Ptr{aws_custom_key_op_handler}, (Ptr{aws_custom_key_op_handler},), key_op_handler)
end

"""
    aws_custom_key_op_handler_perform_operation(key_op_handler, operation)

Calls the on\\_key\\_operation vtable function. See [`aws_custom_key_op_handler_vtable`](@ref) for function details.

### Prototype
```c
void aws_custom_key_op_handler_perform_operation( struct aws_custom_key_op_handler *key_op_handler, struct aws_tls_key_operation *operation);
```
"""
function aws_custom_key_op_handler_perform_operation(key_op_handler, operation)
    ccall((:aws_custom_key_op_handler_perform_operation, libaws_c_io), Cvoid, (Ptr{aws_custom_key_op_handler}, Ptr{aws_tls_key_operation}), key_op_handler, operation)
end

"""
    aws_tls_ctx_options_init_client_mtls_with_custom_key_operations(options, allocator, custom, cert_file_contents)

Initializes options for use with mutual TLS in client mode, where private key operations are handled by custom code.

Note: cert\\_file\\_contents will be copied into a new buffer after this function is called, so you do not need to keep that data alive after calling this function.

# Arguments
* `options`: [`aws_tls_ctx_options`](@ref) to be initialized.
* `allocator`: Allocator to use.
* `custom`: Options for custom key operations.
* `cert_file_contents`: The contents of a certificate file.
### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_with_custom_key_operations( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, struct aws_custom_key_op_handler *custom, const struct aws_byte_cursor *cert_file_contents);
```
"""
function aws_tls_ctx_options_init_client_mtls_with_custom_key_operations(options, allocator, custom, cert_file_contents)
    ccall((:aws_tls_ctx_options_init_client_mtls_with_custom_key_operations, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_custom_key_op_handler}, Ptr{aws_byte_cursor}), options, allocator, custom, cert_file_contents)
end

"""
    aws_tls_ctx_pkcs11_options

This struct exists as a graceful way to pass many arguments when calling init-with-pkcs11 functions on [`aws_tls_ctx_options`](@ref) (this also makes it easy to introduce optional arguments in the future). Instances of this struct should only exist briefly on the stack.

Instructions for binding this to high-level languages: - Python: The members of this struct should be the keyword args to the init-with-pkcs11 functions. - JavaScript: This should be an options map passed to init-with-pkcs11 functions. - Java: This should be an options class passed to init-with-pkcs11 functions. - C++: Same as Java

Notes on integer types: PKCS#11 uses `unsigned long` for IDs, handles, etc but we expose them as `uint64_t` in public APIs. We do this because sizeof(long) is inconsistent across platform/arch/language (ex: always 64bit in Java, always 32bit in C on Windows, matches CPU in C on Linux and Apple). By using uint64\\_t in our public API, we can keep the careful bounds-checking all in one place, instead of expecting each high-level language binding to get it just right.
"""
struct aws_tls_ctx_pkcs11_options
    pkcs11_lib::Ptr{aws_pkcs11_lib}
    user_pin::aws_byte_cursor
    slot_id::Ptr{UInt64}
    token_label::aws_byte_cursor
    private_key_object_label::aws_byte_cursor
    cert_file_path::aws_byte_cursor
    cert_file_contents::aws_byte_cursor
end

"""
    aws_tls_ctx_options_init_client_mtls_with_pkcs11(options, allocator, pkcs11_options)

Initializes options for use with mutual TLS in client mode, where a PKCS#11 library provides access to the private key.

NOTE: This only works on Unix devices.

# Arguments
* `options`: [`aws_tls_ctx_options`](@ref) to be initialized.
* `allocator`: Allocator to use.
* `pkcs11_options`: Options for using PKCS#11 (contents are copied)
### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_with_pkcs11( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const struct aws_tls_ctx_pkcs11_options *pkcs11_options);
```
"""
function aws_tls_ctx_options_init_client_mtls_with_pkcs11(options, allocator, pkcs11_options)
    ccall((:aws_tls_ctx_options_init_client_mtls_with_pkcs11, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_tls_ctx_pkcs11_options}), options, allocator, pkcs11_options)
end

"""
    aws_tls_ctx_options_set_keychain_path(options, keychain_path_cursor)

!!! compat "Deprecated"

    

Sets a custom keychain path for storing the cert and pkey with mutual tls in client mode.

NOTE: This only works on MacOS.

### Prototype
```c
int aws_tls_ctx_options_set_keychain_path( struct aws_tls_ctx_options *options, struct aws_byte_cursor *keychain_path_cursor);
```
"""
function aws_tls_ctx_options_set_keychain_path(options, keychain_path_cursor)
    ccall((:aws_tls_ctx_options_set_keychain_path, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_byte_cursor}), options, keychain_path_cursor)
end

"""
    aws_tls_ctx_options_set_secitem_options(tls_ctx_options, secitem_options)

Applies provided SecItem options to certificate and private key being added to the iOS/tvOS KeyChain.

NOTE: Currently only supported on iOS and tvOS using SecItem.

# Arguments
* `options`: [`aws_tls_ctx_options`](@ref) to be modified.
* `secitem_options`: Options for SecItems
### Prototype
```c
int aws_tls_ctx_options_set_secitem_options( struct aws_tls_ctx_options *tls_ctx_options, const struct aws_secitem_options *secitem_options);
```
"""
function aws_tls_ctx_options_set_secitem_options(tls_ctx_options, secitem_options)
    ccall((:aws_tls_ctx_options_set_secitem_options, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_secitem_options}), tls_ctx_options, secitem_options)
end

"""
    aws_tls_secitem_options_clean_up(secitem_options)

Cleans up resources in secitem\\_options.

### Prototype
```c
void aws_tls_secitem_options_clean_up(struct aws_secitem_options *secitem_options);
```
"""
function aws_tls_secitem_options_clean_up(secitem_options)
    ccall((:aws_tls_secitem_options_clean_up, libaws_c_io), Cvoid, (Ptr{aws_secitem_options},), secitem_options)
end

"""
    aws_tls_ctx_options_init_default_server_from_path(options, allocator, cert_path, pkey_path)

Initializes options for use with in server mode. cert\\_path and pkey\\_path are paths to files on disk. cert\\_path and pkey\\_path are treated as PKCS#7 PEM armored. They are loaded from disk and stored in buffers internally.

### Prototype
```c
int aws_tls_ctx_options_init_default_server_from_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *cert_path, const char *pkey_path);
```
"""
function aws_tls_ctx_options_init_default_server_from_path(options, allocator, cert_path, pkey_path)
    ccall((:aws_tls_ctx_options_init_default_server_from_path, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}, Ptr{Cchar}), options, allocator, cert_path, pkey_path)
end

"""
    aws_tls_ctx_options_init_default_server(options, allocator, cert, pkey)

Initializes options for use with in server mode. cert and pkey are copied. cert and pkey are treated as PKCS#7 PEM armored.

### Prototype
```c
int aws_tls_ctx_options_init_default_server( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, struct aws_byte_cursor *cert, struct aws_byte_cursor *pkey);
```
"""
function aws_tls_ctx_options_init_default_server(options, allocator, cert, pkey)
    ccall((:aws_tls_ctx_options_init_default_server, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), options, allocator, cert, pkey)
end

"""
    aws_tls_ctx_options_init_client_mtls_from_system_path(options, allocator, cert_reg_path)

Initializes options for use with mutual tls in client mode. cert\\_reg\\_path is the path to a system installed certficate/private key pair. Example: CurrentUser\\MY\\<thumprint>

NOTE: This only works on Windows.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_from_system_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *cert_reg_path);
```
"""
function aws_tls_ctx_options_init_client_mtls_from_system_path(options, allocator, cert_reg_path)
    ccall((:aws_tls_ctx_options_init_client_mtls_from_system_path, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}), options, allocator, cert_reg_path)
end

"""
    aws_tls_ctx_options_init_default_server_from_system_path(options, allocator, cert_reg_path)

Initializes options for use with server mode. cert\\_reg\\_path is the path to a system installed certficate/private key pair. Example: CurrentUser\\MY\\<thumprint>

NOTE: This only works on Windows.

### Prototype
```c
int aws_tls_ctx_options_init_default_server_from_system_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *cert_reg_path);
```
"""
function aws_tls_ctx_options_init_default_server_from_system_path(options, allocator, cert_reg_path)
    ccall((:aws_tls_ctx_options_init_default_server_from_system_path, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}), options, allocator, cert_reg_path)
end

"""
    aws_tls_ctx_options_init_client_mtls_pkcs12_from_path(options, allocator, pkcs12_path, pkcs_pwd)

Initializes options for use with mutual tls in client mode. pkcs12\\_path is a path to a file on disk containing a pkcs#12 file. The file is loaded into an internal buffer. pkcs\\_pwd is the corresponding password for the pkcs#12 file; it is copied.

NOTE: This only works on Apple devices.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_pkcs12_from_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *pkcs12_path, const struct aws_byte_cursor *pkcs_pwd);
```
"""
function aws_tls_ctx_options_init_client_mtls_pkcs12_from_path(options, allocator, pkcs12_path, pkcs_pwd)
    ccall((:aws_tls_ctx_options_init_client_mtls_pkcs12_from_path, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}, Ptr{aws_byte_cursor}), options, allocator, pkcs12_path, pkcs_pwd)
end

"""
    aws_tls_ctx_options_init_client_mtls_pkcs12(options, allocator, pkcs12, pkcs_pwd)

Initializes options for use with mutual tls in client mode. pkcs12 is a buffer containing a pkcs#12 certificate and private key; it is copied. pkcs\\_pwd is the corresponding password for the pkcs#12 buffer; it is copied.

NOTE: This only works on Apple devices.

### Prototype
```c
int aws_tls_ctx_options_init_client_mtls_pkcs12( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, struct aws_byte_cursor *pkcs12, struct aws_byte_cursor *pkcs_pwd);
```
"""
function aws_tls_ctx_options_init_client_mtls_pkcs12(options, allocator, pkcs12, pkcs_pwd)
    ccall((:aws_tls_ctx_options_init_client_mtls_pkcs12, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), options, allocator, pkcs12, pkcs_pwd)
end

"""
    aws_tls_ctx_options_init_server_pkcs12_from_path(options, allocator, pkcs12_path, pkcs_password)

Initializes options for use in server mode. pkcs12\\_path is a path to a file on disk containing a pkcs#12 file. The file is loaded into an internal buffer. pkcs\\_pwd is the corresponding password for the pkcs#12 file; it is copied.

NOTE: This only works on Apple devices.

### Prototype
```c
int aws_tls_ctx_options_init_server_pkcs12_from_path( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, const char *pkcs12_path, struct aws_byte_cursor *pkcs_password);
```
"""
function aws_tls_ctx_options_init_server_pkcs12_from_path(options, allocator, pkcs12_path, pkcs_password)
    ccall((:aws_tls_ctx_options_init_server_pkcs12_from_path, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{Cchar}, Ptr{aws_byte_cursor}), options, allocator, pkcs12_path, pkcs_password)
end

"""
    aws_tls_ctx_options_init_server_pkcs12(options, allocator, pkcs12, pkcs_password)

Initializes options for use in server mode. pkcs12 is a buffer containing a pkcs#12 certificate and private key; it is copied. pkcs\\_pwd is the corresponding password for the pkcs#12 buffer; it is copied.

NOTE: This only works on Apple devices.

### Prototype
```c
int aws_tls_ctx_options_init_server_pkcs12( struct aws_tls_ctx_options *options, struct aws_allocator *allocator, struct aws_byte_cursor *pkcs12, struct aws_byte_cursor *pkcs_password);
```
"""
function aws_tls_ctx_options_init_server_pkcs12(options, allocator, pkcs12, pkcs_password)
    ccall((:aws_tls_ctx_options_init_server_pkcs12, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), options, allocator, pkcs12, pkcs_password)
end

"""
    aws_tls_ctx_options_set_alpn_list(options, alpn_list)

Sets alpn list in the form <protocol1;protocol2;...>. A maximum of 4 protocols are supported. alpn\\_list is copied.

### Prototype
```c
int aws_tls_ctx_options_set_alpn_list(struct aws_tls_ctx_options *options, const char *alpn_list);
```
"""
function aws_tls_ctx_options_set_alpn_list(options, alpn_list)
    ccall((:aws_tls_ctx_options_set_alpn_list, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{Cchar}), options, alpn_list)
end

"""
    aws_tls_ctx_options_set_verify_peer(options, verify_peer)

Enables or disables x.509 validation. Disable this only for testing. To enable mutual TLS in server mode, set verify\\_peer to true.

### Prototype
```c
void aws_tls_ctx_options_set_verify_peer(struct aws_tls_ctx_options *options, bool verify_peer);
```
"""
function aws_tls_ctx_options_set_verify_peer(options, verify_peer)
    ccall((:aws_tls_ctx_options_set_verify_peer, libaws_c_io), Cvoid, (Ptr{aws_tls_ctx_options}, Bool), options, verify_peer)
end

"""
    aws_tls_ctx_options_set_tls_cipher_preference(options, cipher_pref)

Sets preferred TLS Cipher List

### Prototype
```c
void aws_tls_ctx_options_set_tls_cipher_preference( struct aws_tls_ctx_options *options, enum aws_tls_cipher_pref cipher_pref);
```
"""
function aws_tls_ctx_options_set_tls_cipher_preference(options, cipher_pref)
    ccall((:aws_tls_ctx_options_set_tls_cipher_preference, libaws_c_io), Cvoid, (Ptr{aws_tls_ctx_options}, aws_tls_cipher_pref), options, cipher_pref)
end

"""
    aws_tls_ctx_options_set_minimum_tls_version(options, minimum_tls_version)

Sets the minimum TLS version to allow.

### Prototype
```c
void aws_tls_ctx_options_set_minimum_tls_version( struct aws_tls_ctx_options *options, enum aws_tls_versions minimum_tls_version);
```
"""
function aws_tls_ctx_options_set_minimum_tls_version(options, minimum_tls_version)
    ccall((:aws_tls_ctx_options_set_minimum_tls_version, libaws_c_io), Cvoid, (Ptr{aws_tls_ctx_options}, aws_tls_versions), options, minimum_tls_version)
end

"""
    aws_tls_ctx_options_override_default_trust_store(options, ca_file)

Override the default trust store. ca\\_file is a buffer containing a PEM armored chain of trusted CA certificates. ca\\_file is copied.

### Prototype
```c
int aws_tls_ctx_options_override_default_trust_store( struct aws_tls_ctx_options *options, const struct aws_byte_cursor *ca_file);
```
"""
function aws_tls_ctx_options_override_default_trust_store(options, ca_file)
    ccall((:aws_tls_ctx_options_override_default_trust_store, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{aws_byte_cursor}), options, ca_file)
end

"""
    aws_tls_ctx_options_override_default_trust_store_from_path(options, ca_path, ca_file)

Override the default trust store. ca\\_path is a path to a directory on disk containing trusted certificates. This is only supported on Unix systems (otherwise this parameter is ignored). ca\\_file is a path to a file on disk containing trusted certificates. ca\\_file is loaded from disk and stored in an internal buffer.

### Prototype
```c
int aws_tls_ctx_options_override_default_trust_store_from_path( struct aws_tls_ctx_options *options, const char *ca_path, const char *ca_file);
```
"""
function aws_tls_ctx_options_override_default_trust_store_from_path(options, ca_path, ca_file)
    ccall((:aws_tls_ctx_options_override_default_trust_store_from_path, libaws_c_io), Cint, (Ptr{aws_tls_ctx_options}, Ptr{Cchar}, Ptr{Cchar}), options, ca_path, ca_file)
end

"""
    aws_tls_ctx_options_set_extension_data(options, extension_data)

When implementing BYO\\_CRYPTO, if you need extra data to pass to your tls implementation, set it here. The lifetime of extension\\_data must outlive the options object and be cleaned up after options is cleaned up.

### Prototype
```c
void aws_tls_ctx_options_set_extension_data(struct aws_tls_ctx_options *options, void *extension_data);
```
"""
function aws_tls_ctx_options_set_extension_data(options, extension_data)
    ccall((:aws_tls_ctx_options_set_extension_data, libaws_c_io), Cvoid, (Ptr{aws_tls_ctx_options}, Ptr{Cvoid}), options, extension_data)
end

"""
    aws_tls_connection_options_init_from_ctx(conn_options, ctx)

Initializes default connection options from an instance ot [`aws_tls_ctx`](@ref).

### Prototype
```c
void aws_tls_connection_options_init_from_ctx( struct aws_tls_connection_options *conn_options, struct aws_tls_ctx *ctx);
```
"""
function aws_tls_connection_options_init_from_ctx(conn_options, ctx)
    ccall((:aws_tls_connection_options_init_from_ctx, libaws_c_io), Cvoid, (Ptr{aws_tls_connection_options}, Ptr{aws_tls_ctx}), conn_options, ctx)
end

"""
    aws_tls_connection_options_clean_up(connection_options)

Cleans up resources in [`aws_tls_connection_options`](@ref). This can be called immediately after initializing a tls handler, or if using the bootstrap api, immediately after asking for a channel.

### Prototype
```c
void aws_tls_connection_options_clean_up(struct aws_tls_connection_options *connection_options);
```
"""
function aws_tls_connection_options_clean_up(connection_options)
    ccall((:aws_tls_connection_options_clean_up, libaws_c_io), Cvoid, (Ptr{aws_tls_connection_options},), connection_options)
end

"""
    aws_tls_connection_options_copy(to, from)

Cleans up 'to' and copies 'from' to 'to'. 'to' must be initialized.

### Prototype
```c
int aws_tls_connection_options_copy( struct aws_tls_connection_options *to, const struct aws_tls_connection_options *from);
```
"""
function aws_tls_connection_options_copy(to, from)
    ccall((:aws_tls_connection_options_copy, libaws_c_io), Cint, (Ptr{aws_tls_connection_options}, Ptr{aws_tls_connection_options}), to, from)
end

"""
    aws_tls_connection_options_set_callbacks(conn_options, on_negotiation_result, on_data_read, on_error, user_data)

Sets callbacks for use with a tls connection.

### Prototype
```c
void aws_tls_connection_options_set_callbacks( struct aws_tls_connection_options *conn_options, aws_tls_on_negotiation_result_fn *on_negotiation_result, aws_tls_on_data_read_fn *on_data_read, aws_tls_on_error_fn *on_error, void *user_data);
```
"""
function aws_tls_connection_options_set_callbacks(conn_options, on_negotiation_result, on_data_read, on_error, user_data)
    ccall((:aws_tls_connection_options_set_callbacks, libaws_c_io), Cvoid, (Ptr{aws_tls_connection_options}, Ptr{aws_tls_on_negotiation_result_fn}, Ptr{aws_tls_on_data_read_fn}, Ptr{aws_tls_on_error_fn}, Ptr{Cvoid}), conn_options, on_negotiation_result, on_data_read, on_error, user_data)
end

"""
    aws_tls_connection_options_set_server_name(conn_options, allocator, server_name)

Sets server name to use for the SNI extension (supported everywhere), as well as x.509 validation. If you don't set this, your x.509 validation will likely fail.

### Prototype
```c
int aws_tls_connection_options_set_server_name( struct aws_tls_connection_options *conn_options, struct aws_allocator *allocator, const struct aws_byte_cursor *server_name);
```
"""
function aws_tls_connection_options_set_server_name(conn_options, allocator, server_name)
    ccall((:aws_tls_connection_options_set_server_name, libaws_c_io), Cint, (Ptr{aws_tls_connection_options}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}), conn_options, allocator, server_name)
end

"""
    aws_tls_connection_options_set_alpn_list(conn_options, allocator, alpn_list)

Sets alpn list in the form <protocol1;protocol2;...>. A maximum of 4 protocols are supported. alpn\\_list is copied. This value is already inherited from [`aws_tls_ctx`](@ref), but the [`aws_tls_ctx`](@ref) is expensive, and should be used across as many connections as possible. If you want to set this per connection, set it here.

### Prototype
```c
int aws_tls_connection_options_set_alpn_list( struct aws_tls_connection_options *conn_options, struct aws_allocator *allocator, const char *alpn_list);
```
"""
function aws_tls_connection_options_set_alpn_list(conn_options, allocator, alpn_list)
    ccall((:aws_tls_connection_options_set_alpn_list, libaws_c_io), Cint, (Ptr{aws_tls_connection_options}, Ptr{aws_allocator}, Ptr{Cchar}), conn_options, allocator, alpn_list)
end

"""
    aws_tls_is_alpn_available()

Returns true if alpn is available in the underlying tls implementation. This function should always be called before setting an alpn list.

### Prototype
```c
bool aws_tls_is_alpn_available(void);
```
"""
function aws_tls_is_alpn_available()
    ccall((:aws_tls_is_alpn_available, libaws_c_io), Bool, ())
end

"""
    aws_tls_is_cipher_pref_supported(cipher_pref)

Returns true if this Cipher Preference is available in the underlying TLS implementation. This function should always be called before setting a Cipher Preference

### Prototype
```c
bool aws_tls_is_cipher_pref_supported(enum aws_tls_cipher_pref cipher_pref);
```
"""
function aws_tls_is_cipher_pref_supported(cipher_pref)
    ccall((:aws_tls_is_cipher_pref_supported, libaws_c_io), Bool, (aws_tls_cipher_pref,), cipher_pref)
end

"""
    aws_tls_client_handler_new(allocator, options, slot)

Creates a new tls channel handler in client mode. Options will be copied. You must call [`aws_tls_client_handler_start_negotiation`](@ref) and wait on the [`aws_tls_on_negotiation_result_fn`](@ref) callback before the handler can begin processing application data.

### Prototype
```c
struct aws_channel_handler *aws_tls_client_handler_new( struct aws_allocator *allocator, struct aws_tls_connection_options *options, struct aws_channel_slot *slot);
```
"""
function aws_tls_client_handler_new(allocator, options, slot)
    ccall((:aws_tls_client_handler_new, libaws_c_io), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Ptr{aws_tls_connection_options}, Ptr{aws_channel_slot}), allocator, options, slot)
end

"""
    aws_tls_server_handler_new(allocator, options, slot)

Creates a new tls channel handler in server mode. Options will be copied. You must wait on the [`aws_tls_on_negotiation_result_fn`](@ref) callback before the handler can begin processing application data.

### Prototype
```c
struct aws_channel_handler *aws_tls_server_handler_new( struct aws_allocator *allocator, struct aws_tls_connection_options *options, struct aws_channel_slot *slot);
```
"""
function aws_tls_server_handler_new(allocator, options, slot)
    ccall((:aws_tls_server_handler_new, libaws_c_io), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Ptr{aws_tls_connection_options}, Ptr{aws_channel_slot}), allocator, options, slot)
end

"""
    aws_tls_alpn_handler_new(allocator, on_protocol_negotiated, user_data)

Creates a channel handler, for client or server mode, that handles alpn. This isn't necessarily required since you can always call [`aws_tls_handler_protocol`](@ref) in the [`aws_tls_on_negotiation_result_fn`](@ref) callback, but this makes channel bootstrap easier to handle.

### Prototype
```c
struct aws_channel_handler *aws_tls_alpn_handler_new( struct aws_allocator *allocator, aws_tls_on_protocol_negotiated on_protocol_negotiated, void *user_data);
```
"""
function aws_tls_alpn_handler_new(allocator, on_protocol_negotiated, user_data)
    ccall((:aws_tls_alpn_handler_new, libaws_c_io), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, aws_tls_on_protocol_negotiated, Ptr{Cvoid}), allocator, on_protocol_negotiated, user_data)
end

"""
    aws_tls_client_handler_start_negotiation(handler)

Kicks off the negotiation process. This function must be called when in client mode to initiate the TLS handshake. Once the handshake has completed the [`aws_tls_on_negotiation_result_fn`](@ref) will be invoked.

### Prototype
```c
int aws_tls_client_handler_start_negotiation(struct aws_channel_handler *handler);
```
"""
function aws_tls_client_handler_start_negotiation(handler)
    ccall((:aws_tls_client_handler_start_negotiation, libaws_c_io), Cint, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_tls_server_ctx_new(alloc, options)

Creates a new server ctx. This ctx can be used for the lifetime of the application assuming you want the same options for every incoming connection. Options will be copied.

### Prototype
```c
struct aws_tls_ctx *aws_tls_server_ctx_new( struct aws_allocator *alloc, const struct aws_tls_ctx_options *options);
```
"""
function aws_tls_server_ctx_new(alloc, options)
    ccall((:aws_tls_server_ctx_new, libaws_c_io), Ptr{aws_tls_ctx}, (Ptr{aws_allocator}, Ptr{aws_tls_ctx_options}), alloc, options)
end

"""
    aws_tls_client_ctx_new(alloc, options)

Creates a new client ctx. This ctx can be used for the lifetime of the application assuming you want the same options for every outgoing connection. Options will be copied.

### Prototype
```c
struct aws_tls_ctx *aws_tls_client_ctx_new( struct aws_allocator *alloc, const struct aws_tls_ctx_options *options);
```
"""
function aws_tls_client_ctx_new(alloc, options)
    ccall((:aws_tls_client_ctx_new, libaws_c_io), Ptr{aws_tls_ctx}, (Ptr{aws_allocator}, Ptr{aws_tls_ctx_options}), alloc, options)
end

"""
    aws_tls_ctx_acquire(ctx)

Increments the reference count on the tls context, allowing the caller to take a reference to it.

Returns the same tls context passed in.

### Prototype
```c
struct aws_tls_ctx *aws_tls_ctx_acquire(struct aws_tls_ctx *ctx);
```
"""
function aws_tls_ctx_acquire(ctx)
    ccall((:aws_tls_ctx_acquire, libaws_c_io), Ptr{aws_tls_ctx}, (Ptr{aws_tls_ctx},), ctx)
end

"""
    aws_tls_ctx_release(ctx)

Decrements a tls context's ref count. When the ref count drops to zero, the object will be destroyed.

### Prototype
```c
void aws_tls_ctx_release(struct aws_tls_ctx *ctx);
```
"""
function aws_tls_ctx_release(ctx)
    ccall((:aws_tls_ctx_release, libaws_c_io), Cvoid, (Ptr{aws_tls_ctx},), ctx)
end

"""
    aws_tls_handler_protocol(handler)

Returns a byte buffer by copy of the negotiated protocols. If there is no agreed upon protocol, len will be 0 and buffer will be NULL.

### Prototype
```c
struct aws_byte_buf aws_tls_handler_protocol(struct aws_channel_handler *handler);
```
"""
function aws_tls_handler_protocol(handler)
    ccall((:aws_tls_handler_protocol, libaws_c_io), aws_byte_buf, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_tls_handler_server_name(handler)

Client mode only. This is the server name that was used for SNI and host name validation.

### Prototype
```c
struct aws_byte_buf aws_tls_handler_server_name(struct aws_channel_handler *handler);
```
"""
function aws_tls_handler_server_name(handler)
    ccall((:aws_tls_handler_server_name, libaws_c_io), aws_byte_buf, (Ptr{aws_channel_handler},), handler)
end

"""
    aws_tls_key_operation_complete(operation, output)

Complete a successful TLS private key operation by providing its output. The output is copied into the TLS connection. The operation is freed by this call.

You MUST call this or [`aws_tls_key_operation_complete_with_error`](@ref)(). Failure to do so will stall the TLS connection indefinitely and leak memory.

### Prototype
```c
void aws_tls_key_operation_complete(struct aws_tls_key_operation *operation, struct aws_byte_cursor output);
```
"""
function aws_tls_key_operation_complete(operation, output)
    ccall((:aws_tls_key_operation_complete, libaws_c_io), Cvoid, (Ptr{aws_tls_key_operation}, aws_byte_cursor), operation, output)
end

"""
    aws_tls_key_operation_complete_with_error(operation, error_code)

Complete an failed TLS private key operation. The TLS connection will fail. The operation is freed by this call.

You MUST call this or [`aws_tls_key_operation_complete`](@ref)(). Failure to do so will stall the TLS connection indefinitely and leak memory.

### Prototype
```c
void aws_tls_key_operation_complete_with_error(struct aws_tls_key_operation *operation, int error_code);
```
"""
function aws_tls_key_operation_complete_with_error(operation, error_code)
    ccall((:aws_tls_key_operation_complete_with_error, libaws_c_io), Cvoid, (Ptr{aws_tls_key_operation}, Cint), operation, error_code)
end

"""
    aws_tls_key_operation_get_input(operation)

Returns the input data that needs to be operated on by the custom key operation.

### Prototype
```c
struct aws_byte_cursor aws_tls_key_operation_get_input(const struct aws_tls_key_operation *operation);
```
"""
function aws_tls_key_operation_get_input(operation)
    ccall((:aws_tls_key_operation_get_input, libaws_c_io), aws_byte_cursor, (Ptr{aws_tls_key_operation},), operation)
end

"""
    aws_tls_key_operation_get_type(operation)

Returns the type of operation that needs to be performed by the custom key operation. If the implementation cannot perform the operation, use [`aws_tls_key_operation_complete_with_error`](@ref)() to preventing stalling the TLS connection.

### Prototype
```c
enum aws_tls_key_operation_type aws_tls_key_operation_get_type(const struct aws_tls_key_operation *operation);
```
"""
function aws_tls_key_operation_get_type(operation)
    ccall((:aws_tls_key_operation_get_type, libaws_c_io), aws_tls_key_operation_type, (Ptr{aws_tls_key_operation},), operation)
end

"""
    aws_tls_key_operation_get_signature_algorithm(operation)

Returns the algorithm the operation is expected to be operated with. If the implementation does not support the signature algorithm, use [`aws_tls_key_operation_complete_with_error`](@ref)() to preventing stalling the TLS connection.

### Prototype
```c
enum aws_tls_signature_algorithm aws_tls_key_operation_get_signature_algorithm( const struct aws_tls_key_operation *operation);
```
"""
function aws_tls_key_operation_get_signature_algorithm(operation)
    ccall((:aws_tls_key_operation_get_signature_algorithm, libaws_c_io), aws_tls_signature_algorithm, (Ptr{aws_tls_key_operation},), operation)
end

"""
    aws_tls_key_operation_get_digest_algorithm(operation)

Returns the algorithm the operation digest is signed with. If the implementation does not support the digest algorithm, use [`aws_tls_key_operation_complete_with_error`](@ref)() to preventing stalling the TLS connection.

### Prototype
```c
enum aws_tls_hash_algorithm aws_tls_key_operation_get_digest_algorithm(const struct aws_tls_key_operation *operation);
```
"""
function aws_tls_key_operation_get_digest_algorithm(operation)
    ccall((:aws_tls_key_operation_get_digest_algorithm, libaws_c_io), aws_tls_hash_algorithm, (Ptr{aws_tls_key_operation},), operation)
end

"""
    aws_channel_setup_client_tls(right_of_slot, tls_options)

******************************* Misc TLS related ********************************

### Prototype
```c
int aws_channel_setup_client_tls( struct aws_channel_slot *right_of_slot, struct aws_tls_connection_options *tls_options);
```
"""
function aws_channel_setup_client_tls(right_of_slot, tls_options)
    ccall((:aws_channel_setup_client_tls, libaws_c_io), Cint, (Ptr{aws_channel_slot}, Ptr{aws_tls_connection_options}), right_of_slot, tls_options)
end

"""
    aws_tls_hash_algorithm_str(hash)

Given enum, return string like: AWS\\_TLS\\_HASH\\_SHA256 -> "SHA256"

### Prototype
```c
const char *aws_tls_hash_algorithm_str(enum aws_tls_hash_algorithm hash);
```
"""
function aws_tls_hash_algorithm_str(hash)
    ccall((:aws_tls_hash_algorithm_str, libaws_c_io), Ptr{Cchar}, (aws_tls_hash_algorithm,), hash)
end

"""
    aws_tls_signature_algorithm_str(signature)

Given enum, return string like: AWS\\_TLS\\_SIGNATURE\\_RSA -> "RSA"

### Prototype
```c
const char *aws_tls_signature_algorithm_str(enum aws_tls_signature_algorithm signature);
```
"""
function aws_tls_signature_algorithm_str(signature)
    ccall((:aws_tls_signature_algorithm_str, libaws_c_io), Ptr{Cchar}, (aws_tls_signature_algorithm,), signature)
end

"""
    aws_tls_key_operation_type_str(operation_type)

Given enum, return string like: AWS\\_TLS\\_SIGNATURE\\_RSA -> "RSA"

### Prototype
```c
const char *aws_tls_key_operation_type_str(enum aws_tls_key_operation_type operation_type);
```
"""
function aws_tls_key_operation_type_str(operation_type)
    ccall((:aws_tls_key_operation_type_str, libaws_c_io), Ptr{Cchar}, (aws_tls_key_operation_type,), operation_type)
end

"""
    aws_error_code_is_tls(error_code)

Returns true if error\\_code is a TLS Negotiation related error.

### Prototype
```c
bool aws_error_code_is_tls(int error_code);
```
"""
function aws_error_code_is_tls(error_code)
    ccall((:aws_error_code_is_tls, libaws_c_io), Bool, (Cint,), error_code)
end

"""
    aws_async_read_completion_strategy

Use [`aws_async_input_stream_tester`](@ref) to test edge cases in systems that take async streams. You can customize its behavior (e.g. fail on 3rd read, always complete async, always complete synchronously, etc)
"""
@cenum aws_async_read_completion_strategy::UInt32 begin
    AWS_ASYNC_READ_COMPLETES_ON_ANOTHER_THREAD = 0
    AWS_ASYNC_READ_COMPLETES_IMMEDIATELY = 1
    AWS_ASYNC_READ_COMPLETES_ON_RANDOM_THREAD = 2
end

"""
    aws_autogen_style

Use [`aws_input_stream`](@ref) tester to test edge cases in systems that take input streams. You can make it behave in specific weird ways (e.g. fail on 3rd read).

There are a few ways to set what gets streamed. - source\\_bytes: if set, stream these bytes. - source\\_stream: if set, wrap this stream (but insert weird behavior like failing on 3rd read). - autogen\\_length: autogen streaming content N bytes in length.
"""
@cenum aws_autogen_style::UInt32 begin
    AWS_AUTOGEN_LOREM_IPSUM = 0
    AWS_AUTOGEN_ALPHABET = 1
    AWS_AUTOGEN_NUMBERS = 2
end

"""
    aws_input_stream_tester_options

Documentation not found.
"""
struct aws_input_stream_tester_options
    source_bytes::aws_byte_cursor
    source_stream::Ptr{aws_input_stream}
    autogen_length::Csize_t
    autogen_style::aws_autogen_style
    max_bytes_per_read::Csize_t
    read_zero_bytes_on_nth_read::Csize_t
    eof_requires_extra_read::Bool
    fail_on_nth_read::Csize_t
    fail_with_error_code::Cint
end

"""
    aws_async_input_stream_tester_options

Documentation not found.
"""
struct aws_async_input_stream_tester_options
    base::aws_input_stream_tester_options
    completion_strategy::aws_async_read_completion_strategy
    read_duration_ns::UInt64
end

"""
    var"struct (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/testing/async_stream_tester.h:55:5)"

Documentation not found.
"""
struct var"struct (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/testing/async_stream_tester.h:55:5)"
    lock::aws_mutex
    cvar::aws_condition_variable
    read_dest::Ptr{aws_byte_buf}
    read_future::Ptr{aws_future_bool}
    do_shutdown::Bool
end

"""
    aws_async_input_stream_tester

Documentation not found.
"""
struct aws_async_input_stream_tester
    data::NTuple{256, UInt8}
end

function Base.getproperty(x::Ptr{aws_async_input_stream_tester}, f::Symbol)
    f === :base && return Ptr{aws_async_input_stream}(x + 0)
    f === :alloc && return Ptr{Ptr{aws_allocator}}(x + 48)
    f === :options && return Ptr{aws_async_input_stream_tester_options}(x + 56)
    f === :source_stream && return Ptr{Ptr{aws_input_stream}}(x + 152)
    f === :thread && return Ptr{aws_thread}(x + 160)
    f === :synced_data && return Ptr{var"struct (unnamed at /home/runner/.julia/artifacts/1278bb89c8c92abb24d33c3cca796cab58a037b1/include/aws/testing/async_stream_tester.h:55:5)"}(x + 192)
    f === :num_outstanding_reads && return Ptr{aws_atomic_var}(x + 248)
    return getfield(x, f)
end

function Base.getproperty(x::aws_async_input_stream_tester, f::Symbol)
    r = Ref{aws_async_input_stream_tester}(x)
    ptr = Base.unsafe_convert(Ptr{aws_async_input_stream_tester}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_async_input_stream_tester}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    s_async_input_stream_tester_do_actual_read(impl, dest, read_future)

Documentation not found.
### Prototype
```c
static inline void s_async_input_stream_tester_do_actual_read( struct aws_async_input_stream_tester *impl, struct aws_byte_buf *dest, struct aws_future_bool *read_future);
```
"""
function s_async_input_stream_tester_do_actual_read(impl, dest, read_future)
    ccall((:s_async_input_stream_tester_do_actual_read, libaws_c_io), Cvoid, (Ptr{aws_async_input_stream_tester}, Ptr{aws_byte_buf}, Ptr{aws_future_bool}), impl, dest, read_future)
end

"""
    s_async_input_stream_tester_read(stream, dest)

Documentation not found.
### Prototype
```c
static inline struct aws_future_bool *s_async_input_stream_tester_read( struct aws_async_input_stream *stream, struct aws_byte_buf *dest);
```
"""
function s_async_input_stream_tester_read(stream, dest)
    ccall((:s_async_input_stream_tester_read, libaws_c_io), Ptr{aws_future_bool}, (Ptr{aws_async_input_stream}, Ptr{aws_byte_buf}), stream, dest)
end

"""
    s_async_input_stream_tester_do_actual_destroy(impl)

Documentation not found.
### Prototype
```c
static inline void s_async_input_stream_tester_do_actual_destroy(struct aws_async_input_stream_tester *impl);
```
"""
function s_async_input_stream_tester_do_actual_destroy(impl)
    ccall((:s_async_input_stream_tester_do_actual_destroy, libaws_c_io), Cvoid, (Ptr{aws_async_input_stream_tester},), impl)
end

"""
    s_async_input_stream_tester_destroy(async_stream)

Documentation not found.
### Prototype
```c
static inline void s_async_input_stream_tester_destroy(struct aws_async_input_stream *async_stream);
```
"""
function s_async_input_stream_tester_destroy(async_stream)
    ccall((:s_async_input_stream_tester_destroy, libaws_c_io), Cvoid, (Ptr{aws_async_input_stream},), async_stream)
end

"""
    s_async_input_stream_tester_thread_pred(arg)

Documentation not found.
### Prototype
```c
static inline bool s_async_input_stream_tester_thread_pred(void *arg);
```
"""
function s_async_input_stream_tester_thread_pred(arg)
    ccall((:s_async_input_stream_tester_thread_pred, libaws_c_io), Bool, (Ptr{Cvoid},), arg)
end

"""
    s_async_input_stream_tester_thread(arg)

Documentation not found.
### Prototype
```c
static inline void s_async_input_stream_tester_thread(void *arg);
```
"""
function s_async_input_stream_tester_thread(arg)
    ccall((:s_async_input_stream_tester_thread, libaws_c_io), Cvoid, (Ptr{Cvoid},), arg)
end

"""
    aws_async_input_stream_tester_total_bytes_read(async_stream)

Documentation not found.
### Prototype
```c
static inline uint64_t aws_async_input_stream_tester_total_bytes_read( const struct aws_async_input_stream *async_stream);
```
"""
function aws_async_input_stream_tester_total_bytes_read(async_stream)
    ccall((:aws_async_input_stream_tester_total_bytes_read, libaws_c_io), UInt64, (Ptr{aws_async_input_stream},), async_stream)
end

"""
    aws_async_input_stream_new_tester(alloc, options)

Documentation not found.
### Prototype
```c
static inline struct aws_async_input_stream *aws_async_input_stream_new_tester( struct aws_allocator *alloc, const struct aws_async_input_stream_tester_options *options);
```
"""
function aws_async_input_stream_new_tester(alloc, options)
    ccall((:aws_async_input_stream_new_tester, libaws_c_io), Ptr{aws_async_input_stream}, (Ptr{aws_allocator}, Ptr{aws_async_input_stream_tester_options}), alloc, options)
end

"""
    testing_loop

Documentation not found.
"""
struct testing_loop
    allocator::Ptr{aws_allocator}
    scheduler::aws_task_scheduler
    mock_on_callers_thread::Bool
end

"""
    s_testing_loop_run(event_loop)

Documentation not found.
### Prototype
```c
static int s_testing_loop_run(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_run(event_loop)
    ccall((:s_testing_loop_run, libaws_c_io), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_stop(event_loop)

Documentation not found.
### Prototype
```c
static int s_testing_loop_stop(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_stop(event_loop)
    ccall((:s_testing_loop_stop, libaws_c_io), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_wait_for_stop_completion(event_loop)

Documentation not found.
### Prototype
```c
static int s_testing_loop_wait_for_stop_completion(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_wait_for_stop_completion(event_loop)
    ccall((:s_testing_loop_wait_for_stop_completion, libaws_c_io), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_schedule_task_now(event_loop, task)

Documentation not found.
### Prototype
```c
static void s_testing_loop_schedule_task_now(struct aws_event_loop *event_loop, struct aws_task *task);
```
"""
function s_testing_loop_schedule_task_now(event_loop, task)
    ccall((:s_testing_loop_schedule_task_now, libaws_c_io), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}), event_loop, task)
end

"""
    s_testing_loop_schedule_task_future(event_loop, task, run_at_nanos)

Documentation not found.
### Prototype
```c
static void s_testing_loop_schedule_task_future( struct aws_event_loop *event_loop, struct aws_task *task, uint64_t run_at_nanos);
```
"""
function s_testing_loop_schedule_task_future(event_loop, task, run_at_nanos)
    ccall((:s_testing_loop_schedule_task_future, libaws_c_io), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}, UInt64), event_loop, task, run_at_nanos)
end

"""
    s_testing_loop_cancel_task(event_loop, task)

Documentation not found.
### Prototype
```c
static void s_testing_loop_cancel_task(struct aws_event_loop *event_loop, struct aws_task *task);
```
"""
function s_testing_loop_cancel_task(event_loop, task)
    ccall((:s_testing_loop_cancel_task, libaws_c_io), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_task}), event_loop, task)
end

"""
    s_testing_loop_is_on_callers_thread(event_loop)

Documentation not found.
### Prototype
```c
static bool s_testing_loop_is_on_callers_thread(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_is_on_callers_thread(event_loop)
    ccall((:s_testing_loop_is_on_callers_thread, libaws_c_io), Bool, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_start_destroy(event_loop)

Documentation not found.
### Prototype
```c
static void s_testing_loop_start_destroy(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_start_destroy(event_loop)
    ccall((:s_testing_loop_start_destroy, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_complete_destroy(event_loop)

Documentation not found.
### Prototype
```c
static void s_testing_loop_complete_destroy(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_complete_destroy(event_loop)
    ccall((:s_testing_loop_complete_destroy, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_new(allocator, clock)

Documentation not found.
### Prototype
```c
static struct aws_event_loop *s_testing_loop_new(struct aws_allocator *allocator, aws_io_clock_fn clock);
```
"""
function s_testing_loop_new(allocator, clock)
    ccall((:s_testing_loop_new, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_allocator}, aws_io_clock_fn), allocator, clock)
end

# typedef void ( testing_channel_handler_on_shutdown_fn ) ( enum aws_channel_direction dir , int error_code , bool free_scarce_resources_immediately , void * user_data )
"""
Documentation not found.
"""
const testing_channel_handler_on_shutdown_fn = Cvoid

"""
    testing_channel_handler

Documentation not found.
"""
struct testing_channel_handler
    messages::aws_linked_list
    latest_window_update::Csize_t
    initial_window::Csize_t
    complete_write_immediately::Bool
    complete_write_error_code::Cint
    on_shutdown::Ptr{testing_channel_handler_on_shutdown_fn}
    on_shutdown_user_data::Ptr{Cvoid}
    stats::aws_crt_statistics_socket
end

"""
    s_testing_channel_handler_process_read_message(handler, slot, message)

Documentation not found.
### Prototype
```c
static int s_testing_channel_handler_process_read_message( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_io_message *message);
```
"""
function s_testing_channel_handler_process_read_message(handler, slot, message)
    ccall((:s_testing_channel_handler_process_read_message, libaws_c_io), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_io_message}), handler, slot, message)
end

"""
    s_testing_channel_handler_process_write_message(handler, slot, message)

Documentation not found.
### Prototype
```c
static int s_testing_channel_handler_process_write_message( struct aws_channel_handler *handler, struct aws_channel_slot *slot, struct aws_io_message *message);
```
"""
function s_testing_channel_handler_process_write_message(handler, slot, message)
    ccall((:s_testing_channel_handler_process_write_message, libaws_c_io), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Ptr{aws_io_message}), handler, slot, message)
end

"""
    s_testing_channel_handler_increment_read_window(handler, slot, size)

Documentation not found.
### Prototype
```c
static int s_testing_channel_handler_increment_read_window( struct aws_channel_handler *handler, struct aws_channel_slot *slot, size_t size);
```
"""
function s_testing_channel_handler_increment_read_window(handler, slot, size)
    ccall((:s_testing_channel_handler_increment_read_window, libaws_c_io), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, Csize_t), handler, slot, size)
end

"""
    s_testing_channel_handler_shutdown(handler, slot, dir, error_code, free_scarce_resources_immediately)

Documentation not found.
### Prototype
```c
static int s_testing_channel_handler_shutdown( struct aws_channel_handler *handler, struct aws_channel_slot *slot, enum aws_channel_direction dir, int error_code, bool free_scarce_resources_immediately);
```
"""
function s_testing_channel_handler_shutdown(handler, slot, dir, error_code, free_scarce_resources_immediately)
    ccall((:s_testing_channel_handler_shutdown, libaws_c_io), Cint, (Ptr{aws_channel_handler}, Ptr{aws_channel_slot}, aws_channel_direction, Cint, Bool), handler, slot, dir, error_code, free_scarce_resources_immediately)
end

"""
    s_testing_channel_handler_initial_window_size(handler)

Documentation not found.
### Prototype
```c
static size_t s_testing_channel_handler_initial_window_size(struct aws_channel_handler *handler);
```
"""
function s_testing_channel_handler_initial_window_size(handler)
    ccall((:s_testing_channel_handler_initial_window_size, libaws_c_io), Csize_t, (Ptr{aws_channel_handler},), handler)
end

"""
    s_testing_channel_handler_message_overhead(handler)

Documentation not found.
### Prototype
```c
static size_t s_testing_channel_handler_message_overhead(struct aws_channel_handler *handler);
```
"""
function s_testing_channel_handler_message_overhead(handler)
    ccall((:s_testing_channel_handler_message_overhead, libaws_c_io), Csize_t, (Ptr{aws_channel_handler},), handler)
end

"""
    s_testing_channel_handler_destroy(handler)

Documentation not found.
### Prototype
```c
static void s_testing_channel_handler_destroy(struct aws_channel_handler *handler);
```
"""
function s_testing_channel_handler_destroy(handler)
    ccall((:s_testing_channel_handler_destroy, libaws_c_io), Cvoid, (Ptr{aws_channel_handler},), handler)
end

"""
    s_testing_channel_handler_reset_statistics(handler)

Documentation not found.
### Prototype
```c
static void s_testing_channel_handler_reset_statistics(struct aws_channel_handler *handler);
```
"""
function s_testing_channel_handler_reset_statistics(handler)
    ccall((:s_testing_channel_handler_reset_statistics, libaws_c_io), Cvoid, (Ptr{aws_channel_handler},), handler)
end

"""
    s_testing_channel_handler_gather_statistics(handler, stats)

Documentation not found.
### Prototype
```c
static void s_testing_channel_handler_gather_statistics( struct aws_channel_handler *handler, struct aws_array_list *stats);
```
"""
function s_testing_channel_handler_gather_statistics(handler, stats)
    ccall((:s_testing_channel_handler_gather_statistics, libaws_c_io), Cvoid, (Ptr{aws_channel_handler}, Ptr{aws_array_list}), handler, stats)
end

"""
    s_new_testing_channel_handler(allocator, initial_window)

Documentation not found.
### Prototype
```c
static struct aws_channel_handler *s_new_testing_channel_handler( struct aws_allocator *allocator, size_t initial_window);
```
"""
function s_new_testing_channel_handler(allocator, initial_window)
    ccall((:s_new_testing_channel_handler, libaws_c_io), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Csize_t), allocator, initial_window)
end

"""
    testing_channel

Documentation not found.
"""
struct testing_channel
    loop::Ptr{aws_event_loop}
    loop_impl::Ptr{testing_loop}
    channel::Ptr{aws_channel}
    left_handler_impl::Ptr{testing_channel_handler}
    right_handler_impl::Ptr{testing_channel_handler}
    left_handler_slot::Ptr{aws_channel_slot}
    right_handler_slot::Ptr{aws_channel_slot}
    channel_shutdown::Ptr{Cvoid}
    channel_shutdown_user_data::Ptr{Cvoid}
    channel_setup_completed::Bool
    channel_shutdown_completed::Bool
    channel_shutdown_error_code::Cint
end

"""
    s_testing_channel_on_setup_completed(channel, error_code, user_data)

Documentation not found.
### Prototype
```c
static void s_testing_channel_on_setup_completed(struct aws_channel *channel, int error_code, void *user_data);
```
"""
function s_testing_channel_on_setup_completed(channel, error_code, user_data)
    ccall((:s_testing_channel_on_setup_completed, libaws_c_io), Cvoid, (Ptr{aws_channel}, Cint, Ptr{Cvoid}), channel, error_code, user_data)
end

"""
    s_testing_channel_on_shutdown_completed(channel, error_code, user_data)

Documentation not found.
### Prototype
```c
static void s_testing_channel_on_shutdown_completed(struct aws_channel *channel, int error_code, void *user_data);
```
"""
function s_testing_channel_on_shutdown_completed(channel, error_code, user_data)
    ccall((:s_testing_channel_on_shutdown_completed, libaws_c_io), Cvoid, (Ptr{aws_channel}, Cint, Ptr{Cvoid}), channel, error_code, user_data)
end

"""
    testing_channel_push_read_message(testing, message)

when you want to test the read path of your handler, call this with the message you want it to read.

### Prototype
```c
static inline int testing_channel_push_read_message(struct testing_channel *testing, struct aws_io_message *message);
```
"""
function testing_channel_push_read_message(testing, message)
    ccall((:testing_channel_push_read_message, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{aws_io_message}), testing, message)
end

"""
    testing_channel_push_write_message(testing, message)

when you want to test the write path of your handler, call this with the message you want it to write. A downstream handler must have been installed

### Prototype
```c
static inline int testing_channel_push_write_message(struct testing_channel *testing, struct aws_io_message *message);
```
"""
function testing_channel_push_write_message(testing, message)
    ccall((:testing_channel_push_write_message, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{aws_io_message}), testing, message)
end

"""
    testing_channel_get_written_message_queue(testing)

when you want to test the write output of your handler, call this, get the queue and iterate the messages.

### Prototype
```c
static inline struct aws_linked_list *testing_channel_get_written_message_queue(struct testing_channel *testing);
```
"""
function testing_channel_get_written_message_queue(testing)
    ccall((:testing_channel_get_written_message_queue, libaws_c_io), Ptr{aws_linked_list}, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_complete_written_messages_immediately(testing, complete_immediately, complete_error_code)

Set whether written messages have their on\\_complete callbacks invoked immediately. The on\\_complete callback will be cleared after it is invoked.

### Prototype
```c
static inline void testing_channel_complete_written_messages_immediately( struct testing_channel *testing, bool complete_immediately, int complete_error_code);
```
"""
function testing_channel_complete_written_messages_immediately(testing, complete_immediately, complete_error_code)
    ccall((:testing_channel_complete_written_messages_immediately, libaws_c_io), Cvoid, (Ptr{testing_channel}, Bool, Cint), testing, complete_immediately, complete_error_code)
end

"""
    testing_channel_get_read_message_queue(testing)

when you want to test the read output of your handler, call this, get the queue and iterate the messages. A downstream handler must have been installed

### Prototype
```c
static inline struct aws_linked_list *testing_channel_get_read_message_queue(struct testing_channel *testing);
```
"""
function testing_channel_get_read_message_queue(testing)
    ccall((:testing_channel_get_read_message_queue, libaws_c_io), Ptr{aws_linked_list}, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_last_window_update(testing)

When you want to see what the latest window update issues from your channel handler was, call this.

### Prototype
```c
static inline size_t testing_channel_last_window_update(struct testing_channel *testing);
```
"""
function testing_channel_last_window_update(testing)
    ccall((:testing_channel_last_window_update, libaws_c_io), Csize_t, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_increment_read_window(testing, size)

When you want the downstream handler to issue a window update

### Prototype
```c
static inline int testing_channel_increment_read_window(struct testing_channel *testing, size_t size);
```
"""
function testing_channel_increment_read_window(testing, size)
    ccall((:testing_channel_increment_read_window, libaws_c_io), Cint, (Ptr{testing_channel}, Csize_t), testing, size)
end

"""
    testing_channel_run_currently_queued_tasks(testing)

Executes all currently scheduled tasks whose time has come. Use [`testing_channel_drain_queued_tasks`](@ref)() to repeatedly run tasks until only future-tasks remain.

### Prototype
```c
static inline void testing_channel_run_currently_queued_tasks(struct testing_channel *testing);
```
"""
function testing_channel_run_currently_queued_tasks(testing)
    ccall((:testing_channel_run_currently_queued_tasks, libaws_c_io), Cvoid, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_drain_queued_tasks(testing)

Repeatedly executes scheduled tasks until only those in the future remain. This covers the common case where there's a chain reaction of now-tasks scheduling further now-tasks.

### Prototype
```c
static inline void testing_channel_drain_queued_tasks(struct testing_channel *testing);
```
"""
function testing_channel_drain_queued_tasks(testing)
    ccall((:testing_channel_drain_queued_tasks, libaws_c_io), Cvoid, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_set_is_on_users_thread(testing, on_users_thread)

When you want to force the "not on channel thread path" for your handler, set 'on\\_users\\_thread' to false. when you want to undo that, set it back to true. If you set it to false, you'll need to call 'testing\\_channel\\_execute\\_queued\\_tasks()' to invoke the tasks that ended up being scheduled.

### Prototype
```c
static inline void testing_channel_set_is_on_users_thread(struct testing_channel *testing, bool on_users_thread);
```
"""
function testing_channel_set_is_on_users_thread(testing, on_users_thread)
    ccall((:testing_channel_set_is_on_users_thread, libaws_c_io), Cvoid, (Ptr{testing_channel}, Bool), testing, on_users_thread)
end

"""
    aws_testing_channel_options

Documentation not found.
"""
struct aws_testing_channel_options
    clock_fn::Ptr{aws_io_clock_fn}
end

"""
    testing_channel_init(testing, allocator, options)

Documentation not found.
### Prototype
```c
static inline int testing_channel_init( struct testing_channel *testing, struct aws_allocator *allocator, struct aws_testing_channel_options *options);
```
"""
function testing_channel_init(testing, allocator, options)
    ccall((:testing_channel_init, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, Ptr{aws_testing_channel_options}), testing, allocator, options)
end

"""
    testing_channel_clean_up(testing)

Documentation not found.
### Prototype
```c
static inline int testing_channel_clean_up(struct testing_channel *testing);
```
"""
function testing_channel_clean_up(testing)
    ccall((:testing_channel_clean_up, libaws_c_io), Cint, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_install_downstream_handler(testing, initial_window)

When you want to test your handler with a downstream handler installed to the right.

### Prototype
```c
static inline int testing_channel_install_downstream_handler(struct testing_channel *testing, size_t initial_window);
```
"""
function testing_channel_install_downstream_handler(testing, initial_window)
    ccall((:testing_channel_install_downstream_handler, libaws_c_io), Cint, (Ptr{testing_channel}, Csize_t), testing, initial_window)
end

"""
    testing_channel_is_shutdown_completed(testing)

Return whether channel is completely shut down

### Prototype
```c
static inline bool testing_channel_is_shutdown_completed(const struct testing_channel *testing);
```
"""
function testing_channel_is_shutdown_completed(testing)
    ccall((:testing_channel_is_shutdown_completed, libaws_c_io), Bool, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_get_shutdown_error_code(testing)

Return channel's shutdown error\\_code

### Prototype
```c
static inline int testing_channel_get_shutdown_error_code(const struct testing_channel *testing);
```
"""
function testing_channel_get_shutdown_error_code(testing)
    ccall((:testing_channel_get_shutdown_error_code, libaws_c_io), Cint, (Ptr{testing_channel},), testing)
end

"""
    testing_channel_set_downstream_handler_shutdown_callback(testing, on_shutdown, user_data)

Set a callback which is invoked during the handler's shutdown, once in the read direction and again in the write direction. Use this to inject actions that might occur in the middle of channel shutdown.

### Prototype
```c
static inline void testing_channel_set_downstream_handler_shutdown_callback( struct testing_channel *testing, testing_channel_handler_on_shutdown_fn *on_shutdown, void *user_data);
```
"""
function testing_channel_set_downstream_handler_shutdown_callback(testing, on_shutdown, user_data)
    ccall((:testing_channel_set_downstream_handler_shutdown_callback, libaws_c_io), Cvoid, (Ptr{testing_channel}, Ptr{testing_channel_handler_on_shutdown_fn}, Ptr{Cvoid}), testing, on_shutdown, user_data)
end

"""
    testing_channel_check_written_message(channel, expected)

Documentation not found.
### Prototype
```c
static inline int testing_channel_check_written_message( struct testing_channel *channel, struct aws_byte_cursor expected);
```
"""
function testing_channel_check_written_message(channel, expected)
    ccall((:testing_channel_check_written_message, libaws_c_io), Cint, (Ptr{testing_channel}, aws_byte_cursor), channel, expected)
end

"""
    testing_channel_check_written_message_str(channel, expected)

Documentation not found.
### Prototype
```c
static inline int testing_channel_check_written_message_str(struct testing_channel *channel, const char *expected);
```
"""
function testing_channel_check_written_message_str(channel, expected)
    ccall((:testing_channel_check_written_message_str, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{Cchar}), channel, expected)
end

"""
    testing_channel_drain_messages(msgs, buffer)

Documentation not found.
### Prototype
```c
static inline int testing_channel_drain_messages(struct aws_linked_list *msgs, struct aws_byte_buf *buffer);
```
"""
function testing_channel_drain_messages(msgs, buffer)
    ccall((:testing_channel_drain_messages, libaws_c_io), Cint, (Ptr{aws_linked_list}, Ptr{aws_byte_buf}), msgs, buffer)
end

"""
    testing_channel_check_messages_ex(msgs, allocator, expected)

Documentation not found.
### Prototype
```c
static inline int testing_channel_check_messages_ex( struct aws_linked_list *msgs, struct aws_allocator *allocator, struct aws_byte_cursor expected);
```
"""
function testing_channel_check_messages_ex(msgs, allocator, expected)
    ccall((:testing_channel_check_messages_ex, libaws_c_io), Cint, (Ptr{aws_linked_list}, Ptr{aws_allocator}, aws_byte_cursor), msgs, allocator, expected)
end

"""
    testing_channel_check_written_messages(channel, allocator, expected)

Documentation not found.
### Prototype
```c
static inline int testing_channel_check_written_messages( struct testing_channel *channel, struct aws_allocator *allocator, struct aws_byte_cursor expected);
```
"""
function testing_channel_check_written_messages(channel, allocator, expected)
    ccall((:testing_channel_check_written_messages, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, aws_byte_cursor), channel, allocator, expected)
end

"""
    testing_channel_check_written_messages_str(channel, allocator, expected)

Documentation not found.
### Prototype
```c
static inline int testing_channel_check_written_messages_str( struct testing_channel *channel, struct aws_allocator *allocator, const char *expected);
```
"""
function testing_channel_check_written_messages_str(channel, allocator, expected)
    ccall((:testing_channel_check_written_messages_str, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, Ptr{Cchar}), channel, allocator, expected)
end

"""
    testing_channel_drain_written_messages(channel, output)

Documentation not found.
### Prototype
```c
static inline int testing_channel_drain_written_messages(struct testing_channel *channel, struct aws_byte_buf *output);
```
"""
function testing_channel_drain_written_messages(channel, output)
    ccall((:testing_channel_drain_written_messages, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{aws_byte_buf}), channel, output)
end

"""
    testing_channel_check_midchannel_read_messages(channel, allocator, expected)

Documentation not found.
### Prototype
```c
static inline int testing_channel_check_midchannel_read_messages( struct testing_channel *channel, struct aws_allocator *allocator, struct aws_byte_cursor expected);
```
"""
function testing_channel_check_midchannel_read_messages(channel, allocator, expected)
    ccall((:testing_channel_check_midchannel_read_messages, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, aws_byte_cursor), channel, allocator, expected)
end

"""
    testing_channel_check_midchannel_read_messages_str(channel, allocator, expected)

Documentation not found.
### Prototype
```c
static inline int testing_channel_check_midchannel_read_messages_str( struct testing_channel *channel, struct aws_allocator *allocator, const char *expected);
```
"""
function testing_channel_check_midchannel_read_messages_str(channel, allocator, expected)
    ccall((:testing_channel_check_midchannel_read_messages_str, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{aws_allocator}, Ptr{Cchar}), channel, allocator, expected)
end

"""
    testing_channel_send_data(channel, data, dir, ignore_send_message_errors)

Documentation not found.
### Prototype
```c
static inline int testing_channel_send_data( struct testing_channel *channel, struct aws_byte_cursor data, enum aws_channel_direction dir, bool ignore_send_message_errors);
```
"""
function testing_channel_send_data(channel, data, dir, ignore_send_message_errors)
    ccall((:testing_channel_send_data, libaws_c_io), Cint, (Ptr{testing_channel}, aws_byte_cursor, aws_channel_direction, Bool), channel, data, dir, ignore_send_message_errors)
end

"""
    testing_channel_push_read_data(channel, data)

Create an [`aws_io_message`](@ref), containing the following data, and pushes it up the channel in the read direction

### Prototype
```c
static inline int testing_channel_push_read_data(struct testing_channel *channel, struct aws_byte_cursor data);
```
"""
function testing_channel_push_read_data(channel, data)
    ccall((:testing_channel_push_read_data, libaws_c_io), Cint, (Ptr{testing_channel}, aws_byte_cursor), channel, data)
end

"""
    testing_channel_push_read_str(channel, str)

Create an [`aws_io_message`](@ref), containing the following data, and pushes it up the channel in the read direction

### Prototype
```c
static inline int testing_channel_push_read_str(struct testing_channel *channel, const char *str);
```
"""
function testing_channel_push_read_str(channel, str)
    ccall((:testing_channel_push_read_str, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{Cchar}), channel, str)
end

"""
    testing_channel_push_read_str_ignore_errors(channel, str)

Create an [`aws_io_message`](@ref), containing the following data. Tries to push it up the channel in the read direction, but don't assert if the message can't be sent. Useful for testing data that arrives during handler shutdown

### Prototype
```c
static inline int testing_channel_push_read_str_ignore_errors(struct testing_channel *channel, const char *str);
```
"""
function testing_channel_push_read_str_ignore_errors(channel, str)
    ccall((:testing_channel_push_read_str_ignore_errors, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{Cchar}), channel, str)
end

"""
    testing_channel_push_write_data(channel, data)

Create an [`aws_io_message`](@ref), containing the following data, and pushes it up the channel in the write direction

### Prototype
```c
static inline int testing_channel_push_write_data(struct testing_channel *channel, struct aws_byte_cursor data);
```
"""
function testing_channel_push_write_data(channel, data)
    ccall((:testing_channel_push_write_data, libaws_c_io), Cint, (Ptr{testing_channel}, aws_byte_cursor), channel, data)
end

"""
    testing_channel_push_write_str(channel, str)

Create an [`aws_io_message`](@ref), containing the following data, and pushes it up the channel in the write direction

### Prototype
```c
static inline int testing_channel_push_write_str(struct testing_channel *channel, const char *str);
```
"""
function testing_channel_push_write_str(channel, str)
    ccall((:testing_channel_push_write_str, libaws_c_io), Cint, (Ptr{testing_channel}, Ptr{Cchar}), channel, str)
end

"""
    aws_input_stream_tester

Documentation not found.
"""
struct aws_input_stream_tester
    base::aws_input_stream
    alloc::Ptr{aws_allocator}
    options::aws_input_stream_tester_options
    source_buf::aws_byte_buf
    source_stream::Ptr{aws_input_stream}
    read_count::Csize_t
    num_bytes_last_read::Bool
    total_bytes_read::UInt64
end

"""
    s_input_stream_tester_seek(stream, offset, basis)

Documentation not found.
### Prototype
```c
static inline int s_input_stream_tester_seek( struct aws_input_stream *stream, int64_t offset, enum aws_stream_seek_basis basis);
```
"""
function s_input_stream_tester_seek(stream, offset, basis)
    ccall((:s_input_stream_tester_seek, libaws_c_io), Cint, (Ptr{aws_input_stream}, Int64, aws_stream_seek_basis), stream, offset, basis)
end

"""
    s_input_stream_tester_read(stream, original_dest)

Documentation not found.
### Prototype
```c
static inline int s_input_stream_tester_read(struct aws_input_stream *stream, struct aws_byte_buf *original_dest);
```
"""
function s_input_stream_tester_read(stream, original_dest)
    ccall((:s_input_stream_tester_read, libaws_c_io), Cint, (Ptr{aws_input_stream}, Ptr{aws_byte_buf}), stream, original_dest)
end

"""
    s_input_stream_tester_get_status(stream, status)

Documentation not found.
### Prototype
```c
static inline int s_input_stream_tester_get_status(struct aws_input_stream *stream, struct aws_stream_status *status);
```
"""
function s_input_stream_tester_get_status(stream, status)
    ccall((:s_input_stream_tester_get_status, libaws_c_io), Cint, (Ptr{aws_input_stream}, Ptr{aws_stream_status}), stream, status)
end

"""
    s_input_stream_tester_get_length(stream, out_length)

Documentation not found.
### Prototype
```c
static inline int s_input_stream_tester_get_length(struct aws_input_stream *stream, int64_t *out_length);
```
"""
function s_input_stream_tester_get_length(stream, out_length)
    ccall((:s_input_stream_tester_get_length, libaws_c_io), Cint, (Ptr{aws_input_stream}, Ptr{Int64}), stream, out_length)
end

"""
    s_byte_buf_init_autogenned(buf, alloc, length, style)

Documentation not found.
### Prototype
```c
static inline void s_byte_buf_init_autogenned( struct aws_byte_buf *buf, struct aws_allocator *alloc, size_t length, enum aws_autogen_style style);
```
"""
function s_byte_buf_init_autogenned(buf, alloc, length, style)
    ccall((:s_byte_buf_init_autogenned, libaws_c_io), Cvoid, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Csize_t, aws_autogen_style), buf, alloc, length, style)
end

"""
    aws_input_stream_tester_total_bytes_read(stream)

Documentation not found.
### Prototype
```c
static inline uint64_t aws_input_stream_tester_total_bytes_read(const struct aws_input_stream *stream);
```
"""
function aws_input_stream_tester_total_bytes_read(stream)
    ccall((:aws_input_stream_tester_total_bytes_read, libaws_c_io), UInt64, (Ptr{aws_input_stream},), stream)
end

"""
    s_input_stream_tester_destroy(user_data)

Documentation not found.
### Prototype
```c
static inline void s_input_stream_tester_destroy(void *user_data);
```
"""
function s_input_stream_tester_destroy(user_data)
    ccall((:s_input_stream_tester_destroy, libaws_c_io), Cvoid, (Ptr{Cvoid},), user_data)
end

"""
    aws_input_stream_new_tester(alloc, options)

Documentation not found.
### Prototype
```c
static inline struct aws_input_stream *aws_input_stream_new_tester( struct aws_allocator *alloc, const struct aws_input_stream_tester_options *options);
```
"""
function aws_input_stream_new_tester(alloc, options)
    ccall((:aws_input_stream_new_tester, libaws_c_io), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{aws_input_stream_tester_options}), alloc, options)
end

"""
Documentation not found.
"""
const AWS_C_IO_PACKAGE_ID = 1

"""
Documentation not found.
"""
const aws_pcks11_lib_behavior = aws_pkcs11_lib_behavior

"""
Documentation not found.
"""
const AWS_NETWORK_INTERFACE_NAME_MAX = 16

"""
Documentation not found.
"""
const AWS_ADDRESS_MAX_LEN = 256

"""
Documentation not found.
"""
const AWS_TLS_NEGOTIATED_PROTOCOL_MESSAGE = 0x01

