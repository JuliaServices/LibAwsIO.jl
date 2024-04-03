using CEnum

@cenum aws_socket_domain::UInt32 begin
    AWS_SOCKET_IPV4 = 0
    AWS_SOCKET_IPV6 = 1
    AWS_SOCKET_LOCAL = 2
    AWS_SOCKET_VSOCK = 3
end


struct __JL_Ctag_210
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_210}, f::Symbol)
    f === :__i && return Ptr{NTuple{6, Cint}}(x + 0)
    f === :__vi && return Ptr{NTuple{6, Cint}}(x + 0)
    f === :__p && return Ptr{NTuple{6, Ptr{Cvoid}}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_210, f::Symbol)
    r = Ref{__JL_Ctag_210}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_210}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_210}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct pthread_mutex_t
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{pthread_mutex_t}, f::Symbol)
    f === :__u && return Ptr{__JL_Ctag_210}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::pthread_mutex_t, f::Symbol)
    r = Ref{pthread_mutex_t}(x)
    ptr = Base.unsafe_convert(Ptr{pthread_mutex_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{pthread_mutex_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_206
    data::NTuple{48, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_206}, f::Symbol)
    f === :__i && return Ptr{NTuple{12, Cint}}(x + 0)
    f === :__vi && return Ptr{NTuple{12, Cint}}(x + 0)
    f === :__p && return Ptr{NTuple{12, Ptr{Cvoid}}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_206, f::Symbol)
    r = Ref{__JL_Ctag_206}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_206}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_206}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct pthread_cond_t
    data::NTuple{48, UInt8}
end

function Base.getproperty(x::Ptr{pthread_cond_t}, f::Symbol)
    f === :__u && return Ptr{__JL_Ctag_206}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::pthread_cond_t, f::Symbol)
    r = Ref{pthread_cond_t}(x)
    ptr = Base.unsafe_convert(Ptr{pthread_cond_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{pthread_cond_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

mutable struct __pthread end

const pthread_t = Ptr{__pthread}

const pthread_once_t = Cint

"""
    aws_fatal_assert(cond_str, file, line)

### Prototype
```c
void aws_fatal_assert(const char *cond_str, const char *file, int line) AWS_ATTRIBUTE_NORETURN;
```
"""
function aws_fatal_assert(cond_str, file, line)
    ccall((:aws_fatal_assert, libaws_c_io), Cvoid, (Ptr{Cchar}, Ptr{Cchar}, Cint), cond_str, file, line)
end

"""
    aws_raise_error(err)

### Prototype
```c
AWS_STATIC_IMPL int aws_raise_error(int err);
```
"""
function aws_raise_error(err)
    ccall((:aws_raise_error, libaws_c_io), Cint, (Cint,), err)
end

"""
    aws_is_mem_zeroed(buf, bufsize)

Returns whether each byte is zero.

### Prototype
```c
AWS_STATIC_IMPL bool aws_is_mem_zeroed(const void *buf, size_t bufsize);
```
"""
function aws_is_mem_zeroed(buf, bufsize)
    ccall((:aws_is_mem_zeroed, libaws_c_io), Bool, (Ptr{Cvoid}, Csize_t), buf, bufsize)
end

const aws_atomic_impl_int_t = Csize_t

const static_assertion_at_line_60 = NTuple{1, Cchar}

const static_assertion_at_line_61 = NTuple{1, Cchar}

const static_assertion_at_line_62 = NTuple{1, Cchar}

@cenum __JL_Ctag_1::UInt32 begin
    AWS_CACHE_LINE = 64
end

"""
\\deprecated Use int64\\_t instead for offsets in public APIs.
"""
const aws_off_t = Int64

struct aws_allocator
    mem_acquire::Ptr{Cvoid}
    mem_release::Ptr{Cvoid}
    mem_realloc::Ptr{Cvoid}
    mem_calloc::Ptr{Cvoid}
    impl::Ptr{Cvoid}
end

"""
    aws_allocator_is_valid(alloc)

Inexpensive (constant time) check of data-structure invariants.

### Prototype
```c
bool aws_allocator_is_valid(const struct aws_allocator *alloc);
```
"""
function aws_allocator_is_valid(alloc)
    ccall((:aws_allocator_is_valid, libaws_c_io), Bool, (Ptr{aws_allocator},), alloc)
end

"""
    aws_default_allocator()

### Prototype
```c
struct aws_allocator *aws_default_allocator(void);
```
"""
function aws_default_allocator()
    ccall((:aws_default_allocator, libaws_c_io), Ptr{aws_allocator}, ())
end

"""
    aws_aligned_allocator()

### Prototype
```c
struct aws_allocator *aws_aligned_allocator(void);
```
"""
function aws_aligned_allocator()
    ccall((:aws_aligned_allocator, libaws_c_io), Ptr{aws_allocator}, ())
end

"""
    aws_mem_acquire(allocator, size)

Returns at least `size` of memory ready for usage. In versions v0.6.8 and prior, this function was allowed to return NULL. In later versions, if allocator->mem\\_acquire() returns NULL, this function will assert and exit. To handle conditions where OOM is not a fatal error, allocator->mem\\_acquire() is responsible for finding/reclaiming/running a GC etc...before returning.

### Prototype
```c
void *aws_mem_acquire(struct aws_allocator *allocator, size_t size);
```
"""
function aws_mem_acquire(allocator, size)
    ccall((:aws_mem_acquire, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_allocator}, Csize_t), allocator, size)
end

"""
    aws_mem_calloc(allocator, num, size)

Allocates a block of memory for an array of num elements, each of them size bytes long, and initializes all its bits to zero. In versions v0.6.8 and prior, this function was allowed to return NULL. In later versions, if allocator->mem\\_calloc() returns NULL, this function will assert and exit. To handle conditions where OOM is not a fatal error, allocator->mem\\_calloc() is responsible for finding/reclaiming/running a GC etc...before returning.

### Prototype
```c
void *aws_mem_calloc(struct aws_allocator *allocator, size_t num, size_t size);
```
"""
function aws_mem_calloc(allocator, num, size)
    ccall((:aws_mem_calloc, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_allocator}, Csize_t, Csize_t), allocator, num, size)
end

"""
    aws_mem_release(allocator, ptr)

Releases ptr back to whatever allocated it. Nothing happens if ptr is NULL.

### Prototype
```c
void aws_mem_release(struct aws_allocator *allocator, void *ptr);
```
"""
function aws_mem_release(allocator, ptr)
    ccall((:aws_mem_release, libaws_c_io), Cvoid, (Ptr{aws_allocator}, Ptr{Cvoid}), allocator, ptr)
end

"""
    aws_mem_realloc(allocator, ptr, oldsize, newsize)

Attempts to adjust the size of the pointed-to memory buffer from oldsize to newsize. The pointer (*ptr) may be changed if the memory needs to be reallocated.

In versions v0.6.8 and prior, this function was allowed to return NULL. In later versions, if allocator->mem\\_realloc() returns NULL, this function will assert and exit. To handle conditions where OOM is not a fatal error, allocator->mem\\_realloc() is responsible for finding/reclaiming/running a GC etc...before returning.

### Prototype
```c
int aws_mem_realloc(struct aws_allocator *allocator, void **ptr, size_t oldsize, size_t newsize);
```
"""
function aws_mem_realloc(allocator, ptr, oldsize, newsize)
    ccall((:aws_mem_realloc, libaws_c_io), Cint, (Ptr{aws_allocator}, Ptr{Ptr{Cvoid}}, Csize_t, Csize_t), allocator, ptr, oldsize, newsize)
end

@cenum aws_mem_trace_level::UInt32 begin
    AWS_MEMTRACE_NONE = 0
    AWS_MEMTRACE_BYTES = 1
    AWS_MEMTRACE_STACKS = 2
end

"""
    aws_mem_tracer_new(allocator, deprecated, level, frames_per_stack)

### Prototype
```c
struct aws_allocator *aws_mem_tracer_new( struct aws_allocator *allocator, struct aws_allocator *deprecated, enum aws_mem_trace_level level, size_t frames_per_stack);
```
"""
function aws_mem_tracer_new(allocator, deprecated, level, frames_per_stack)
    ccall((:aws_mem_tracer_new, libaws_c_io), Ptr{aws_allocator}, (Ptr{aws_allocator}, Ptr{aws_allocator}, aws_mem_trace_level, Csize_t), allocator, deprecated, level, frames_per_stack)
end

"""
    aws_mem_tracer_destroy(trace_allocator)

### Prototype
```c
struct aws_allocator *aws_mem_tracer_destroy(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_destroy(trace_allocator)
    ccall((:aws_mem_tracer_destroy, libaws_c_io), Ptr{aws_allocator}, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_dump(trace_allocator)

### Prototype
```c
void aws_mem_tracer_dump(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_dump(trace_allocator)
    ccall((:aws_mem_tracer_dump, libaws_c_io), Cvoid, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_bytes(trace_allocator)

### Prototype
```c
size_t aws_mem_tracer_bytes(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_bytes(trace_allocator)
    ccall((:aws_mem_tracer_bytes, libaws_c_io), Csize_t, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_count(trace_allocator)

### Prototype
```c
size_t aws_mem_tracer_count(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_count(trace_allocator)
    ccall((:aws_mem_tracer_count, libaws_c_io), Csize_t, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_small_block_allocator_new(allocator, multi_threaded)

### Prototype
```c
struct aws_allocator *aws_small_block_allocator_new(struct aws_allocator *allocator, bool multi_threaded);
```
"""
function aws_small_block_allocator_new(allocator, multi_threaded)
    ccall((:aws_small_block_allocator_new, libaws_c_io), Ptr{aws_allocator}, (Ptr{aws_allocator}, Bool), allocator, multi_threaded)
end

"""
    aws_small_block_allocator_destroy(sba_allocator)

### Prototype
```c
void aws_small_block_allocator_destroy(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_destroy(sba_allocator)
    ccall((:aws_small_block_allocator_destroy, libaws_c_io), Cvoid, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_bytes_active(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_bytes_active(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_bytes_active(sba_allocator)
    ccall((:aws_small_block_allocator_bytes_active, libaws_c_io), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_bytes_reserved(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_bytes_reserved(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_bytes_reserved(sba_allocator)
    ccall((:aws_small_block_allocator_bytes_reserved, libaws_c_io), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_page_size(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_page_size(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_page_size(sba_allocator)
    ccall((:aws_small_block_allocator_page_size, libaws_c_io), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_page_size_available(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_page_size_available(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_page_size_available(sba_allocator)
    ccall((:aws_small_block_allocator_page_size_available, libaws_c_io), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

struct aws_error_info
    error_code::Cint
    literal_name::Ptr{Cchar}
    error_str::Ptr{Cchar}
    lib_name::Ptr{Cchar}
    formatted_name::Ptr{Cchar}
end

struct aws_error_info_list
    error_list::Ptr{aws_error_info}
    count::UInt16
end

# typedef void ( aws_error_handler_fn ) ( int err , void * ctx )
const aws_error_handler_fn = Cvoid

"""
    aws_last_error()

### Prototype
```c
int aws_last_error(void);
```
"""
function aws_last_error()
    ccall((:aws_last_error, libaws_c_io), Cint, ())
end

"""
    aws_error_str(err)

### Prototype
```c
const char *aws_error_str(int err);
```
"""
function aws_error_str(err)
    ccall((:aws_error_str, libaws_c_io), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_name(err)

### Prototype
```c
const char *aws_error_name(int err);
```
"""
function aws_error_name(err)
    ccall((:aws_error_name, libaws_c_io), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_lib_name(err)

### Prototype
```c
const char *aws_error_lib_name(int err);
```
"""
function aws_error_lib_name(err)
    ccall((:aws_error_lib_name, libaws_c_io), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_debug_str(err)

### Prototype
```c
const char *aws_error_debug_str(int err);
```
"""
function aws_error_debug_str(err)
    ccall((:aws_error_debug_str, libaws_c_io), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_raise_error_private(err)

### Prototype
```c
void aws_raise_error_private(int err);
```
"""
function aws_raise_error_private(err)
    ccall((:aws_raise_error_private, libaws_c_io), Cvoid, (Cint,), err)
end

"""
    aws_reset_error()

### Prototype
```c
void aws_reset_error(void);
```
"""
function aws_reset_error()
    ccall((:aws_reset_error, libaws_c_io), Cvoid, ())
end

"""
    aws_restore_error(err)

### Prototype
```c
void aws_restore_error(int err);
```
"""
function aws_restore_error(err)
    ccall((:aws_restore_error, libaws_c_io), Cvoid, (Cint,), err)
end

"""
    aws_set_global_error_handler_fn(handler, ctx)

### Prototype
```c
aws_error_handler_fn *aws_set_global_error_handler_fn(aws_error_handler_fn *handler, void *ctx);
```
"""
function aws_set_global_error_handler_fn(handler, ctx)
    ccall((:aws_set_global_error_handler_fn, libaws_c_io), Ptr{aws_error_handler_fn}, (Ptr{aws_error_handler_fn}, Ptr{Cvoid}), handler, ctx)
end

"""
    aws_set_thread_local_error_handler_fn(handler, ctx)

### Prototype
```c
aws_error_handler_fn *aws_set_thread_local_error_handler_fn(aws_error_handler_fn *handler, void *ctx);
```
"""
function aws_set_thread_local_error_handler_fn(handler, ctx)
    ccall((:aws_set_thread_local_error_handler_fn, libaws_c_io), Ptr{aws_error_handler_fn}, (Ptr{aws_error_handler_fn}, Ptr{Cvoid}), handler, ctx)
end

"""
    aws_register_error_info(error_info)

TODO: this needs to be a private function (wait till we have the cmake story better before moving it though). It should be external for the purpose of other libs we own, but customers should not be able to hit it without going out of their way to do so.

### Prototype
```c
void aws_register_error_info(const struct aws_error_info_list *error_info);
```
"""
function aws_register_error_info(error_info)
    ccall((:aws_register_error_info, libaws_c_io), Cvoid, (Ptr{aws_error_info_list},), error_info)
end

"""
    aws_unregister_error_info(error_info)

### Prototype
```c
void aws_unregister_error_info(const struct aws_error_info_list *error_info);
```
"""
function aws_unregister_error_info(error_info)
    ccall((:aws_unregister_error_info, libaws_c_io), Cvoid, (Ptr{aws_error_info_list},), error_info)
end

"""
    aws_translate_and_raise_io_error_or(error_no, fallback_aws_error_code)

Convert a c library io error into an aws error, and raise it. If no conversion is found, fallback\\_aws\\_error\\_code is raised. Always returns [`AWS_OP_ERR`](@ref).

### Prototype
```c
int aws_translate_and_raise_io_error_or(int error_no, int fallback_aws_error_code);
```
"""
function aws_translate_and_raise_io_error_or(error_no, fallback_aws_error_code)
    ccall((:aws_translate_and_raise_io_error_or, libaws_c_io), Cint, (Cint, Cint), error_no, fallback_aws_error_code)
end

"""
    aws_translate_and_raise_io_error(error_no)

Convert a c library io error into an aws error, and raise it. If no conversion is found, AWS\\_ERROR\\_SYS\\_CALL\\_FAILURE is raised. Always returns [`AWS_OP_ERR`](@ref).

### Prototype
```c
int aws_translate_and_raise_io_error(int error_no);
```
"""
function aws_translate_and_raise_io_error(error_no)
    ccall((:aws_translate_and_raise_io_error, libaws_c_io), Cint, (Cint,), error_no)
end

@cenum aws_common_error::UInt32 begin
    AWS_ERROR_SUCCESS = 0
    AWS_ERROR_OOM = 1
    AWS_ERROR_NO_SPACE = 2
    AWS_ERROR_UNKNOWN = 3
    AWS_ERROR_SHORT_BUFFER = 4
    AWS_ERROR_OVERFLOW_DETECTED = 5
    AWS_ERROR_UNSUPPORTED_OPERATION = 6
    AWS_ERROR_INVALID_BUFFER_SIZE = 7
    AWS_ERROR_INVALID_HEX_STR = 8
    AWS_ERROR_INVALID_BASE64_STR = 9
    AWS_ERROR_INVALID_INDEX = 10
    AWS_ERROR_THREAD_INVALID_SETTINGS = 11
    AWS_ERROR_THREAD_INSUFFICIENT_RESOURCE = 12
    AWS_ERROR_THREAD_NO_PERMISSIONS = 13
    AWS_ERROR_THREAD_NOT_JOINABLE = 14
    AWS_ERROR_THREAD_NO_SUCH_THREAD_ID = 15
    AWS_ERROR_THREAD_DEADLOCK_DETECTED = 16
    AWS_ERROR_MUTEX_NOT_INIT = 17
    AWS_ERROR_MUTEX_TIMEOUT = 18
    AWS_ERROR_MUTEX_CALLER_NOT_OWNER = 19
    AWS_ERROR_MUTEX_FAILED = 20
    AWS_ERROR_COND_VARIABLE_INIT_FAILED = 21
    AWS_ERROR_COND_VARIABLE_TIMED_OUT = 22
    AWS_ERROR_COND_VARIABLE_ERROR_UNKNOWN = 23
    AWS_ERROR_CLOCK_FAILURE = 24
    AWS_ERROR_LIST_EMPTY = 25
    AWS_ERROR_DEST_COPY_TOO_SMALL = 26
    AWS_ERROR_LIST_EXCEEDS_MAX_SIZE = 27
    AWS_ERROR_LIST_STATIC_MODE_CANT_SHRINK = 28
    AWS_ERROR_PRIORITY_QUEUE_FULL = 29
    AWS_ERROR_PRIORITY_QUEUE_EMPTY = 30
    AWS_ERROR_PRIORITY_QUEUE_BAD_NODE = 31
    AWS_ERROR_HASHTBL_ITEM_NOT_FOUND = 32
    AWS_ERROR_INVALID_DATE_STR = 33
    AWS_ERROR_INVALID_ARGUMENT = 34
    AWS_ERROR_RANDOM_GEN_FAILED = 35
    AWS_ERROR_MALFORMED_INPUT_STRING = 36
    AWS_ERROR_UNIMPLEMENTED = 37
    AWS_ERROR_INVALID_STATE = 38
    AWS_ERROR_ENVIRONMENT_GET = 39
    AWS_ERROR_ENVIRONMENT_SET = 40
    AWS_ERROR_ENVIRONMENT_UNSET = 41
    AWS_ERROR_STREAM_UNSEEKABLE = 42
    AWS_ERROR_NO_PERMISSION = 43
    AWS_ERROR_FILE_INVALID_PATH = 44
    AWS_ERROR_MAX_FDS_EXCEEDED = 45
    AWS_ERROR_SYS_CALL_FAILURE = 46
    AWS_ERROR_C_STRING_BUFFER_NOT_NULL_TERMINATED = 47
    AWS_ERROR_STRING_MATCH_NOT_FOUND = 48
    AWS_ERROR_DIVIDE_BY_ZERO = 49
    AWS_ERROR_INVALID_FILE_HANDLE = 50
    AWS_ERROR_OPERATION_INTERUPTED = 51
    AWS_ERROR_DIRECTORY_NOT_EMPTY = 52
    AWS_ERROR_PLATFORM_NOT_SUPPORTED = 53
    AWS_ERROR_INVALID_UTF8 = 54
    AWS_ERROR_GET_HOME_DIRECTORY_FAILED = 55
    AWS_ERROR_INVALID_XML = 56
    AWS_ERROR_FILE_OPEN_FAILURE = 57
    AWS_ERROR_FILE_READ_FAILURE = 58
    AWS_ERROR_FILE_WRITE_FAILURE = 59
    AWS_ERROR_END_COMMON_RANGE = 1023
end

"""
    aws_secure_zero(pBuf, bufsize)

Securely zeroes a memory buffer. This function will attempt to ensure that the compiler will not optimize away this zeroing operation.

### Prototype
```c
void aws_secure_zero(void *pBuf, size_t bufsize);
```
"""
function aws_secure_zero(pBuf, bufsize)
    ccall((:aws_secure_zero, libaws_c_io), Cvoid, (Ptr{Cvoid}, Csize_t), pBuf, bufsize)
end

"""
    aws_common_library_init(allocator)

Initializes internal data structures used by aws-c-common. Must be called before using any functionality in aws-c-common.

### Prototype
```c
void aws_common_library_init(struct aws_allocator *allocator);
```
"""
function aws_common_library_init(allocator)
    ccall((:aws_common_library_init, libaws_c_io), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_common_library_clean_up()

Shuts down the internal data structures used by aws-c-common.

### Prototype
```c
void aws_common_library_clean_up(void);
```
"""
function aws_common_library_clean_up()
    ccall((:aws_common_library_clean_up, libaws_c_io), Cvoid, ())
end

"""
    aws_common_fatal_assert_library_initialized()

### Prototype
```c
void aws_common_fatal_assert_library_initialized(void);
```
"""
function aws_common_fatal_assert_library_initialized()
    ccall((:aws_common_fatal_assert_library_initialized, libaws_c_io), Cvoid, ())
end

"""
    aws_mul_u64_saturating(a, b)

Multiplies a * b. If the result overflows, returns 2^64 - 1.

### Prototype
```c
AWS_COMMON_MATH_API uint64_t aws_mul_u64_saturating(uint64_t a, uint64_t b);
```
"""
function aws_mul_u64_saturating(a, b)
    ccall((:aws_mul_u64_saturating, libaws_c_io), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_mul_u64_checked(a, b, r)

If a * b overflows, returns [`AWS_OP_ERR`](@ref); otherwise multiplies a * b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_COMMON_MATH_API int aws_mul_u64_checked(uint64_t a, uint64_t b, uint64_t *r);
```
"""
function aws_mul_u64_checked(a, b, r)
    ccall((:aws_mul_u64_checked, libaws_c_io), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
end

"""
    aws_mul_u32_saturating(a, b)

Multiplies a * b. If the result overflows, returns 2^32 - 1.

### Prototype
```c
AWS_COMMON_MATH_API uint32_t aws_mul_u32_saturating(uint32_t a, uint32_t b);
```
"""
function aws_mul_u32_saturating(a, b)
    ccall((:aws_mul_u32_saturating, libaws_c_io), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_mul_u32_checked(a, b, r)

If a * b overflows, returns [`AWS_OP_ERR`](@ref); otherwise multiplies a * b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_COMMON_MATH_API int aws_mul_u32_checked(uint32_t a, uint32_t b, uint32_t *r);
```
"""
function aws_mul_u32_checked(a, b, r)
    ccall((:aws_mul_u32_checked, libaws_c_io), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
end

"""
    aws_add_u64_saturating(a, b)

Adds a + b. If the result overflows returns 2^64 - 1.

### Prototype
```c
AWS_COMMON_MATH_API uint64_t aws_add_u64_saturating(uint64_t a, uint64_t b);
```
"""
function aws_add_u64_saturating(a, b)
    ccall((:aws_add_u64_saturating, libaws_c_io), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_add_u64_checked(a, b, r)

If a + b overflows, returns [`AWS_OP_ERR`](@ref); otherwise adds a + b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_COMMON_MATH_API int aws_add_u64_checked(uint64_t a, uint64_t b, uint64_t *r);
```
"""
function aws_add_u64_checked(a, b, r)
    ccall((:aws_add_u64_checked, libaws_c_io), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
end

"""
    aws_add_u32_saturating(a, b)

Adds a + b. If the result overflows returns 2^32 - 1.

### Prototype
```c
AWS_COMMON_MATH_API uint32_t aws_add_u32_saturating(uint32_t a, uint32_t b);
```
"""
function aws_add_u32_saturating(a, b)
    ccall((:aws_add_u32_saturating, libaws_c_io), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_add_u32_checked(a, b, r)

If a + b overflows, returns [`AWS_OP_ERR`](@ref); otherwise adds a + b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_COMMON_MATH_API int aws_add_u32_checked(uint32_t a, uint32_t b, uint32_t *r);
```
"""
function aws_add_u32_checked(a, b, r)
    ccall((:aws_add_u32_checked, libaws_c_io), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
end

"""
    aws_sub_u64_saturating(a, b)

Subtracts a - b. If the result overflows returns 0.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_sub_u64_saturating(uint64_t a, uint64_t b);
```
"""
function aws_sub_u64_saturating(a, b)
    ccall((:aws_sub_u64_saturating, libaws_c_io), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_sub_u64_checked(a, b, r)

If a - b overflows, returns [`AWS_OP_ERR`](@ref); otherwise subtracts a - b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_sub_u64_checked(uint64_t a, uint64_t b, uint64_t *r);
```
"""
function aws_sub_u64_checked(a, b, r)
    ccall((:aws_sub_u64_checked, libaws_c_io), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
end

"""
    aws_sub_u32_saturating(a, b)

Subtracts a - b. If the result overflows returns 0.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_sub_u32_saturating(uint32_t a, uint32_t b);
```
"""
function aws_sub_u32_saturating(a, b)
    ccall((:aws_sub_u32_saturating, libaws_c_io), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_sub_u32_checked(a, b, r)

If a - b overflows, returns [`AWS_OP_ERR`](@ref); otherwise subtracts a - b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_sub_u32_checked(uint32_t a, uint32_t b, uint32_t *r);
```
"""
function aws_sub_u32_checked(a, b, r)
    ccall((:aws_sub_u32_checked, libaws_c_io), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
end

"""
    aws_mul_size_saturating(a, b)

Multiplies a * b. If the result overflows, returns SIZE\\_MAX.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_mul_size_saturating(size_t a, size_t b);
```
"""
function aws_mul_size_saturating(a, b)
    ccall((:aws_mul_size_saturating, libaws_c_io), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_mul_size_checked(a, b, r)

Multiplies a * b and returns the result in *r. If the result overflows, returns [`AWS_OP_ERR`](@ref); otherwise returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_mul_size_checked(size_t a, size_t b, size_t *r);
```
"""
function aws_mul_size_checked(a, b, r)
    ccall((:aws_mul_size_checked, libaws_c_io), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
end

"""
    aws_add_size_saturating(a, b)

Adds a + b. If the result overflows returns SIZE\\_MAX.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_add_size_saturating(size_t a, size_t b);
```
"""
function aws_add_size_saturating(a, b)
    ccall((:aws_add_size_saturating, libaws_c_io), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_add_size_checked(a, b, r)

Adds a + b and returns the result in *r. If the result overflows, returns [`AWS_OP_ERR`](@ref); otherwise returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_add_size_checked(size_t a, size_t b, size_t *r);
```
"""
function aws_add_size_checked(a, b, r)
    ccall((:aws_add_size_checked, libaws_c_io), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
end

"""
    aws_sub_size_saturating(a, b)

Subtracts a - b. If the result overflows returns 0.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_sub_size_saturating(size_t a, size_t b);
```
"""
function aws_sub_size_saturating(a, b)
    ccall((:aws_sub_size_saturating, libaws_c_io), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_sub_size_checked(a, b, r)

If a - b overflows, returns [`AWS_OP_ERR`](@ref); otherwise subtracts a - b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_sub_size_checked(size_t a, size_t b, size_t *r);
```
"""
function aws_sub_size_checked(a, b, r)
    ccall((:aws_sub_size_checked, libaws_c_io), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
end

"""
    aws_is_power_of_two(x)

Function to check if x is power of 2

### Prototype
```c
AWS_STATIC_IMPL bool aws_is_power_of_two(const size_t x);
```
"""
function aws_is_power_of_two(x)
    ccall((:aws_is_power_of_two, libaws_c_io), Bool, (Csize_t,), x)
end

"""
    aws_round_up_to_power_of_two(n, result)

Function to find the smallest result that is power of 2 >= n. Returns [`AWS_OP_ERR`](@ref) if this cannot be done without overflow

### Prototype
```c
AWS_STATIC_IMPL int aws_round_up_to_power_of_two(size_t n, size_t *result);
```
"""
function aws_round_up_to_power_of_two(n, result)
    ccall((:aws_round_up_to_power_of_two, libaws_c_io), Cint, (Csize_t, Ptr{Csize_t}), n, result)
end

"""
    aws_clz_u32(n)

Counts the number of leading 0 bits in an integer. 0 will return the size of the integer in bits.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_u32(uint32_t n);
```
"""
function aws_clz_u32(n)
    ccall((:aws_clz_u32, libaws_c_io), Csize_t, (UInt32,), n)
end

"""
    aws_clz_i32(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_i32(int32_t n);
```
"""
function aws_clz_i32(n)
    ccall((:aws_clz_i32, libaws_c_io), Csize_t, (Int32,), n)
end

"""
    aws_clz_u64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_u64(uint64_t n);
```
"""
function aws_clz_u64(n)
    ccall((:aws_clz_u64, libaws_c_io), Csize_t, (UInt64,), n)
end

"""
    aws_clz_i64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_i64(int64_t n);
```
"""
function aws_clz_i64(n)
    ccall((:aws_clz_i64, libaws_c_io), Csize_t, (Int64,), n)
end

"""
    aws_clz_size(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_size(size_t n);
```
"""
function aws_clz_size(n)
    ccall((:aws_clz_size, libaws_c_io), Csize_t, (Csize_t,), n)
end

"""
    aws_ctz_u32(n)

Counts the number of trailing 0 bits in an integer. 0 will return the size of the integer in bits.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_u32(uint32_t n);
```
"""
function aws_ctz_u32(n)
    ccall((:aws_ctz_u32, libaws_c_io), Csize_t, (UInt32,), n)
end

"""
    aws_ctz_i32(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_i32(int32_t n);
```
"""
function aws_ctz_i32(n)
    ccall((:aws_ctz_i32, libaws_c_io), Csize_t, (Int32,), n)
end

"""
    aws_ctz_u64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_u64(uint64_t n);
```
"""
function aws_ctz_u64(n)
    ccall((:aws_ctz_u64, libaws_c_io), Csize_t, (UInt64,), n)
end

"""
    aws_ctz_i64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_i64(int64_t n);
```
"""
function aws_ctz_i64(n)
    ccall((:aws_ctz_i64, libaws_c_io), Csize_t, (Int64,), n)
end

"""
    aws_ctz_size(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_size(size_t n);
```
"""
function aws_ctz_size(n)
    ccall((:aws_ctz_size, libaws_c_io), Csize_t, (Csize_t,), n)
end

"""
    aws_min_u8(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint8_t aws_min_u8(uint8_t a, uint8_t b);
```
"""
function aws_min_u8(a, b)
    ccall((:aws_min_u8, libaws_c_io), UInt8, (UInt8, UInt8), a, b)
end

"""
    aws_max_u8(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint8_t aws_max_u8(uint8_t a, uint8_t b);
```
"""
function aws_max_u8(a, b)
    ccall((:aws_max_u8, libaws_c_io), UInt8, (UInt8, UInt8), a, b)
end

"""
    aws_min_i8(a, b)

### Prototype
```c
AWS_STATIC_IMPL int8_t aws_min_i8(int8_t a, int8_t b);
```
"""
function aws_min_i8(a, b)
    ccall((:aws_min_i8, libaws_c_io), Int8, (Int8, Int8), a, b)
end

"""
    aws_max_i8(a, b)

### Prototype
```c
AWS_STATIC_IMPL int8_t aws_max_i8(int8_t a, int8_t b);
```
"""
function aws_max_i8(a, b)
    ccall((:aws_max_i8, libaws_c_io), Int8, (Int8, Int8), a, b)
end

"""
    aws_min_u16(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_min_u16(uint16_t a, uint16_t b);
```
"""
function aws_min_u16(a, b)
    ccall((:aws_min_u16, libaws_c_io), UInt16, (UInt16, UInt16), a, b)
end

"""
    aws_max_u16(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_max_u16(uint16_t a, uint16_t b);
```
"""
function aws_max_u16(a, b)
    ccall((:aws_max_u16, libaws_c_io), UInt16, (UInt16, UInt16), a, b)
end

"""
    aws_min_i16(a, b)

### Prototype
```c
AWS_STATIC_IMPL int16_t aws_min_i16(int16_t a, int16_t b);
```
"""
function aws_min_i16(a, b)
    ccall((:aws_min_i16, libaws_c_io), Int16, (Int16, Int16), a, b)
end

"""
    aws_max_i16(a, b)

### Prototype
```c
AWS_STATIC_IMPL int16_t aws_max_i16(int16_t a, int16_t b);
```
"""
function aws_max_i16(a, b)
    ccall((:aws_max_i16, libaws_c_io), Int16, (Int16, Int16), a, b)
end

"""
    aws_min_u32(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_min_u32(uint32_t a, uint32_t b);
```
"""
function aws_min_u32(a, b)
    ccall((:aws_min_u32, libaws_c_io), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_max_u32(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_max_u32(uint32_t a, uint32_t b);
```
"""
function aws_max_u32(a, b)
    ccall((:aws_max_u32, libaws_c_io), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_min_i32(a, b)

### Prototype
```c
AWS_STATIC_IMPL int32_t aws_min_i32(int32_t a, int32_t b);
```
"""
function aws_min_i32(a, b)
    ccall((:aws_min_i32, libaws_c_io), Int32, (Int32, Int32), a, b)
end

"""
    aws_max_i32(a, b)

### Prototype
```c
AWS_STATIC_IMPL int32_t aws_max_i32(int32_t a, int32_t b);
```
"""
function aws_max_i32(a, b)
    ccall((:aws_max_i32, libaws_c_io), Int32, (Int32, Int32), a, b)
end

"""
    aws_min_u64(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_min_u64(uint64_t a, uint64_t b);
```
"""
function aws_min_u64(a, b)
    ccall((:aws_min_u64, libaws_c_io), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_max_u64(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_max_u64(uint64_t a, uint64_t b);
```
"""
function aws_max_u64(a, b)
    ccall((:aws_max_u64, libaws_c_io), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_min_i64(a, b)

### Prototype
```c
AWS_STATIC_IMPL int64_t aws_min_i64(int64_t a, int64_t b);
```
"""
function aws_min_i64(a, b)
    ccall((:aws_min_i64, libaws_c_io), Int64, (Int64, Int64), a, b)
end

"""
    aws_max_i64(a, b)

### Prototype
```c
AWS_STATIC_IMPL int64_t aws_max_i64(int64_t a, int64_t b);
```
"""
function aws_max_i64(a, b)
    ccall((:aws_max_i64, libaws_c_io), Int64, (Int64, Int64), a, b)
end

"""
    aws_min_size(a, b)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_min_size(size_t a, size_t b);
```
"""
function aws_min_size(a, b)
    ccall((:aws_min_size, libaws_c_io), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_max_size(a, b)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_max_size(size_t a, size_t b);
```
"""
function aws_max_size(a, b)
    ccall((:aws_max_size, libaws_c_io), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_min_int(a, b)

### Prototype
```c
AWS_STATIC_IMPL int aws_min_int(int a, int b);
```
"""
function aws_min_int(a, b)
    ccall((:aws_min_int, libaws_c_io), Cint, (Cint, Cint), a, b)
end

"""
    aws_max_int(a, b)

### Prototype
```c
AWS_STATIC_IMPL int aws_max_int(int a, int b);
```
"""
function aws_max_int(a, b)
    ccall((:aws_max_int, libaws_c_io), Cint, (Cint, Cint), a, b)
end

"""
    aws_min_float(a, b)

### Prototype
```c
AWS_STATIC_IMPL float aws_min_float(float a, float b);
```
"""
function aws_min_float(a, b)
    ccall((:aws_min_float, libaws_c_io), Cfloat, (Cfloat, Cfloat), a, b)
end

"""
    aws_max_float(a, b)

### Prototype
```c
AWS_STATIC_IMPL float aws_max_float(float a, float b);
```
"""
function aws_max_float(a, b)
    ccall((:aws_max_float, libaws_c_io), Cfloat, (Cfloat, Cfloat), a, b)
end

"""
    aws_min_double(a, b)

### Prototype
```c
AWS_STATIC_IMPL double aws_min_double(double a, double b);
```
"""
function aws_min_double(a, b)
    ccall((:aws_min_double, libaws_c_io), Cdouble, (Cdouble, Cdouble), a, b)
end

"""
    aws_max_double(a, b)

### Prototype
```c
AWS_STATIC_IMPL double aws_max_double(double a, double b);
```
"""
function aws_max_double(a, b)
    ccall((:aws_max_double, libaws_c_io), Cdouble, (Cdouble, Cdouble), a, b)
end

@cenum __JL_Ctag_6::UInt32 begin
    AWS_ARRAY_LIST_DEBUG_FILL = 221
end

struct aws_array_list
    alloc::Ptr{aws_allocator}
    current_size::Csize_t
    length::Csize_t
    item_size::Csize_t
    data::Ptr{Cvoid}
end

# typedef int ( aws_array_list_comparator_fn ) ( const void * a , const void * b )
"""
Prototype for a comparator function for sorting elements.

a and b should be cast to pointers to the element type held in the list before being dereferenced. The function should compare the elements and return a positive number if a > b, zero if a = b, and a negative number if a < b.
"""
const aws_array_list_comparator_fn = Cvoid

"""
    aws_array_list_init_dynamic(list, alloc, initial_item_allocation, item_size)

Initializes an array list with an array of size initial\\_item\\_allocation * item\\_size. In this mode, the array size will grow by a factor of 2 upon insertion if space is not available. initial\\_item\\_allocation is the number of elements you want space allocated for. item\\_size is the size of each element in bytes. Mixing items types is not supported by this API.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_init_dynamic( struct aws_array_list *AWS_RESTRICT list, struct aws_allocator *alloc, size_t initial_item_allocation, size_t item_size);
```
"""
function aws_array_list_init_dynamic(list, alloc, initial_item_allocation, item_size)
    ccall((:aws_array_list_init_dynamic, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{aws_allocator}, Csize_t, Csize_t), list, alloc, initial_item_allocation, item_size)
end

"""
    aws_array_list_init_static(list, raw_array, item_count, item_size)

Initializes an array list with a preallocated array of void *. item\\_count is the number of elements in the array, and item\\_size is the size in bytes of each element. Mixing items types is not supported by this API. Once this list is full, new items will be rejected.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_init_static( struct aws_array_list *AWS_RESTRICT list, void *raw_array, size_t item_count, size_t item_size);
```
"""
function aws_array_list_init_static(list, raw_array, item_count, item_size)
    ccall((:aws_array_list_init_static, libaws_c_io), Cvoid, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t, Csize_t), list, raw_array, item_count, item_size)
end

"""
    aws_array_list_init_static_from_initialized(list, raw_array, item_count, item_size)

Initializes an array list with a preallocated array of *already-initialized* elements. item\\_count is the number of elements in the array, and item\\_size is the size in bytes of each element.

Once initialized, nothing further can be added to the list, since it will be full and cannot resize.

Primary use case is to treat an already-initialized C array as an array list.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_init_static_from_initialized( struct aws_array_list *AWS_RESTRICT list, void *raw_array, size_t item_count, size_t item_size);
```
"""
function aws_array_list_init_static_from_initialized(list, raw_array, item_count, item_size)
    ccall((:aws_array_list_init_static_from_initialized, libaws_c_io), Cvoid, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t, Csize_t), list, raw_array, item_count, item_size)
end

"""
    aws_array_list_is_valid(list)

Set of properties of a valid [`aws_array_list`](@ref).

### Prototype
```c
AWS_STATIC_IMPL bool aws_array_list_is_valid(const struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_is_valid(list)
    ccall((:aws_array_list_is_valid, libaws_c_io), Bool, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_clean_up(list)

Deallocates any memory that was allocated for this list, and resets list for reuse or deletion.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_clean_up(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_clean_up(list)
    ccall((:aws_array_list_clean_up, libaws_c_io), Cvoid, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_clean_up_secure(list)

Erases and then deallocates any memory that was allocated for this list, and resets list for reuse or deletion.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_clean_up_secure(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_clean_up_secure(list)
    ccall((:aws_array_list_clean_up_secure, libaws_c_io), Cvoid, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_push_back(list, val)

Pushes the memory pointed to by val onto the end of internal list

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_push_back(struct aws_array_list *AWS_RESTRICT list, const void *val);
```
"""
function aws_array_list_push_back(list, val)
    ccall((:aws_array_list_push_back, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
end

"""
    aws_array_list_front(list, val)

Copies the element at the front of the list if it exists. If list is empty, AWS\\_ERROR\\_LIST\\_EMPTY will be raised

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_front(const struct aws_array_list *AWS_RESTRICT list, void *val);
```
"""
function aws_array_list_front(list, val)
    ccall((:aws_array_list_front, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
end

"""
    aws_array_list_push_front(list, val)

Pushes the memory pointed to by val onto the front of internal list. This call results in shifting all of the elements in the list. Avoid this call unless that is intended behavior.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_push_front(struct aws_array_list *AWS_RESTRICT list, const void *val);
```
"""
function aws_array_list_push_front(list, val)
    ccall((:aws_array_list_push_front, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
end

"""
    aws_array_list_pop_front(list)

Deletes the element at the front of the list if it exists. If list is empty, AWS\\_ERROR\\_LIST\\_EMPTY will be raised. This call results in shifting all of the elements at the end of the array to the front. Avoid this call unless that is intended behavior.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_pop_front(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_pop_front(list)
    ccall((:aws_array_list_pop_front, libaws_c_io), Cint, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_pop_front_n(list, n)

Delete N elements from the front of the list. Remaining elements are shifted to the front of the list. If the list has less than N elements, the list is cleared. This call is more efficient than calling [`aws_array_list_pop_front`](@ref)() N times.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_pop_front_n(struct aws_array_list *AWS_RESTRICT list, size_t n);
```
"""
function aws_array_list_pop_front_n(list, n)
    ccall((:aws_array_list_pop_front_n, libaws_c_io), Cvoid, (Ptr{aws_array_list}, Csize_t), list, n)
end

"""
    aws_array_list_erase(list, index)

Deletes the element this index in the list if it exists. If element does not exist, AWS\\_ERROR\\_INVALID\\_INDEX will be raised. This call results in shifting all remaining elements towards the front. Avoid this call unless that is intended behavior.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_erase(struct aws_array_list *AWS_RESTRICT list, size_t index);
```
"""
function aws_array_list_erase(list, index)
    ccall((:aws_array_list_erase, libaws_c_io), Cint, (Ptr{aws_array_list}, Csize_t), list, index)
end

"""
    aws_array_list_back(list, val)

Copies the element at the end of the list if it exists. If list is empty, AWS\\_ERROR\\_LIST\\_EMPTY will be raised.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_back(const struct aws_array_list *AWS_RESTRICT list, void *val);
```
"""
function aws_array_list_back(list, val)
    ccall((:aws_array_list_back, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
end

"""
    aws_array_list_pop_back(list)

Deletes the element at the end of the list if it exists. If list is empty, AWS\\_ERROR\\_LIST\\_EMPTY will be raised.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_pop_back(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_pop_back(list)
    ccall((:aws_array_list_pop_back, libaws_c_io), Cint, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_clear(list)

Clears all elements in the array and resets length to zero. Size does not change in this operation.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_clear(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_clear(list)
    ccall((:aws_array_list_clear, libaws_c_io), Cvoid, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_shrink_to_fit(list)

If in dynamic mode, shrinks the allocated array size to the minimum amount necessary to store its elements.

### Prototype
```c
int aws_array_list_shrink_to_fit(struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_shrink_to_fit(list)
    ccall((:aws_array_list_shrink_to_fit, libaws_c_io), Cint, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_copy(from, to)

Copies the elements from from to to. If to is in static mode, it must at least be the same length as from. Any data in to will be overwritten in this copy.

### Prototype
```c
int aws_array_list_copy(const struct aws_array_list *AWS_RESTRICT from, struct aws_array_list *AWS_RESTRICT to);
```
"""
function aws_array_list_copy(from, to)
    ccall((:aws_array_list_copy, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{aws_array_list}), from, to)
end

"""
    aws_array_list_swap_contents(list_a, list_b)

Swap contents between two dynamic lists. Both lists must use the same allocator.

### Prototype
```c
AWS_STATIC_IMPL void aws_array_list_swap_contents( struct aws_array_list *AWS_RESTRICT list_a, struct aws_array_list *AWS_RESTRICT list_b);
```
"""
function aws_array_list_swap_contents(list_a, list_b)
    ccall((:aws_array_list_swap_contents, libaws_c_io), Cvoid, (Ptr{aws_array_list}, Ptr{aws_array_list}), list_a, list_b)
end

"""
    aws_array_list_capacity(list)

Returns the number of elements that can fit in the internal array. If list is initialized in dynamic mode, the capacity changes over time.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_array_list_capacity(const struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_capacity(list)
    ccall((:aws_array_list_capacity, libaws_c_io), Csize_t, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_length(list)

Returns the number of elements in the internal array.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_array_list_length(const struct aws_array_list *AWS_RESTRICT list);
```
"""
function aws_array_list_length(list)
    ccall((:aws_array_list_length, libaws_c_io), Csize_t, (Ptr{aws_array_list},), list)
end

"""
    aws_array_list_get_at(list, val, index)

Copies the memory at index to val. If element does not exist, AWS\\_ERROR\\_INVALID\\_INDEX will be raised.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_get_at(const struct aws_array_list *AWS_RESTRICT list, void *val, size_t index);
```
"""
function aws_array_list_get_at(list, val, index)
    ccall((:aws_array_list_get_at, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t), list, val, index)
end

"""
    aws_array_list_get_at_ptr(list, val, index)

Copies the memory address of the element at index to *val. If element does not exist, AWS\\_ERROR\\_INVALID\\_INDEX will be raised.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_get_at_ptr(const struct aws_array_list *AWS_RESTRICT list, void **val, size_t index);
```
"""
function aws_array_list_get_at_ptr(list, val, index)
    ccall((:aws_array_list_get_at_ptr, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{Ptr{Cvoid}}, Csize_t), list, val, index)
end

"""
    aws_array_list_ensure_capacity(list, index)

Ensures that the array list has enough capacity to store a value at the specified index. If there is not already enough capacity, and the list is in dynamic mode, this function will attempt to allocate more memory, expanding the list. In static mode, if 'index' is beyond the maximum index, AWS\\_ERROR\\_INVALID\\_INDEX will be raised.

### Prototype
```c
int aws_array_list_ensure_capacity(struct aws_array_list *AWS_RESTRICT list, size_t index);
```
"""
function aws_array_list_ensure_capacity(list, index)
    ccall((:aws_array_list_ensure_capacity, libaws_c_io), Cint, (Ptr{aws_array_list}, Csize_t), list, index)
end

"""
    aws_array_list_set_at(list, val, index)

Copies the the memory pointed to by val into the array at index. If in dynamic mode, the size will grow by a factor of two when the array is full. In static mode, AWS\\_ERROR\\_INVALID\\_INDEX will be raised if the index is past the bounds of the array.

### Prototype
```c
AWS_STATIC_IMPL int aws_array_list_set_at(struct aws_array_list *AWS_RESTRICT list, const void *val, size_t index);
```
"""
function aws_array_list_set_at(list, val, index)
    ccall((:aws_array_list_set_at, libaws_c_io), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t), list, val, index)
end

"""
    aws_array_list_swap(list, a, b)

Swap elements at the specified indices, which must be within the bounds of the array.

### Prototype
```c
void aws_array_list_swap(struct aws_array_list *AWS_RESTRICT list, size_t a, size_t b);
```
"""
function aws_array_list_swap(list, a, b)
    ccall((:aws_array_list_swap, libaws_c_io), Cvoid, (Ptr{aws_array_list}, Csize_t, Csize_t), list, a, b)
end

"""
    aws_array_list_sort(list, compare_fn)

Sort elements in the list in-place according to the comparator function.

### Prototype
```c
void aws_array_list_sort(struct aws_array_list *AWS_RESTRICT list, aws_array_list_comparator_fn *compare_fn);
```
"""
function aws_array_list_sort(list, compare_fn)
    ccall((:aws_array_list_sort, libaws_c_io), Cvoid, (Ptr{aws_array_list}, Ptr{aws_array_list_comparator_fn}), list, compare_fn)
end

"""
    aws_is_big_endian()

Returns 1 if machine is big endian, 0 if little endian. If you compile with even -O1 optimization, this check is completely optimized out at compile time and code which calls "if ([`aws_is_big_endian`](@ref)())" will do the right thing without branching.

### Prototype
```c
AWS_STATIC_IMPL int aws_is_big_endian(void);
```
"""
function aws_is_big_endian()
    ccall((:aws_is_big_endian, libaws_c_io), Cint, ())
end

"""
    aws_hton64(x)

Convert 64 bit integer from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_hton64(uint64_t x);
```
"""
function aws_hton64(x)
    ccall((:aws_hton64, libaws_c_io), UInt64, (UInt64,), x)
end

"""
    aws_ntoh64(x)

Convert 64 bit integer from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_ntoh64(uint64_t x);
```
"""
function aws_ntoh64(x)
    ccall((:aws_ntoh64, libaws_c_io), UInt64, (UInt64,), x)
end

"""
    aws_hton32(x)

Convert 32 bit integer from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_hton32(uint32_t x);
```
"""
function aws_hton32(x)
    ccall((:aws_hton32, libaws_c_io), UInt32, (UInt32,), x)
end

"""
    aws_htonf32(x)

Convert 32 bit float from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL float aws_htonf32(float x);
```
"""
function aws_htonf32(x)
    ccall((:aws_htonf32, libaws_c_io), Cfloat, (Cfloat,), x)
end

"""
    aws_htonf64(x)

Convert 64 bit double from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL double aws_htonf64(double x);
```
"""
function aws_htonf64(x)
    ccall((:aws_htonf64, libaws_c_io), Cdouble, (Cdouble,), x)
end

"""
    aws_ntoh32(x)

Convert 32 bit integer from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_ntoh32(uint32_t x);
```
"""
function aws_ntoh32(x)
    ccall((:aws_ntoh32, libaws_c_io), UInt32, (UInt32,), x)
end

"""
    aws_ntohf32(x)

Convert 32 bit float from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL float aws_ntohf32(float x);
```
"""
function aws_ntohf32(x)
    ccall((:aws_ntohf32, libaws_c_io), Cfloat, (Cfloat,), x)
end

"""
    aws_ntohf64(x)

Convert 32 bit float from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL double aws_ntohf64(double x);
```
"""
function aws_ntohf64(x)
    ccall((:aws_ntohf64, libaws_c_io), Cdouble, (Cdouble,), x)
end

"""
    aws_hton16(x)

Convert 16 bit integer from host to network byte order.

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_hton16(uint16_t x);
```
"""
function aws_hton16(x)
    ccall((:aws_hton16, libaws_c_io), UInt16, (UInt16,), x)
end

"""
    aws_ntoh16(x)

Convert 16 bit integer from network to host byte order.

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_ntoh16(uint16_t x);
```
"""
function aws_ntoh16(x)
    ccall((:aws_ntoh16, libaws_c_io), UInt16, (UInt16,), x)
end

"""
    aws_byte_buf

Represents a length-delimited binary string or buffer. If byte buffer points to constant memory or memory that should otherwise not be freed by this struct, set allocator to NULL and free function will be a no-op.

This structure used to define the output for all functions that write to a buffer.

Note that this structure allocates memory at the buffer pointer only. The struct itself does not get dynamically allocated and must be either maintained or copied to avoid losing access to the memory.
"""
struct aws_byte_buf
    len::Csize_t
    buffer::Ptr{UInt8}
    capacity::Csize_t
    allocator::Ptr{aws_allocator}
end

"""
    aws_byte_cursor

Represents a movable pointer within a larger binary string or buffer.

This structure is used to define buffers for reading.
"""
struct aws_byte_cursor
    len::Csize_t
    ptr::Ptr{UInt8}
end

# typedef bool ( aws_byte_predicate_fn ) ( uint8_t value )
"""
Signature for function argument to trim APIs
"""
const aws_byte_predicate_fn = Cvoid

"""
    aws_array_eq(array_a, len_a, array_b, len_b)

Compare two arrays. Return whether their contents are equivalent. NULL may be passed as the array pointer if its length is declared to be 0.

### Prototype
```c
bool aws_array_eq(const void *const array_a, const size_t len_a, const void *array_b, const size_t len_b);
```
"""
function aws_array_eq(array_a, len_a, array_b, len_b)
    ccall((:aws_array_eq, libaws_c_io), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t), array_a, len_a, array_b, len_b)
end

"""
    aws_array_eq_ignore_case(array_a, len_a, array_b, len_b)

Perform a case-insensitive string comparison of two arrays. Return whether their contents are equivalent. NULL may be passed as the array pointer if its length is declared to be 0. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_array_eq_ignore_case( const void *const array_a, const size_t len_a, const void *const array_b, const size_t len_b);
```
"""
function aws_array_eq_ignore_case(array_a, len_a, array_b, len_b)
    ccall((:aws_array_eq_ignore_case, libaws_c_io), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t), array_a, len_a, array_b, len_b)
end

"""
    aws_array_eq_c_str(array, array_len, c_str)

Compare an array and a null-terminated string. Returns true if their contents are equivalent. The array should NOT contain a null-terminator, or the comparison will always return false. NULL may be passed as the array pointer if its length is declared to be 0.

### Prototype
```c
bool aws_array_eq_c_str(const void *const array, const size_t array_len, const char *const c_str);
```
"""
function aws_array_eq_c_str(array, array_len, c_str)
    ccall((:aws_array_eq_c_str, libaws_c_io), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cchar}), array, array_len, c_str)
end

"""
    aws_array_eq_c_str_ignore_case(array, array_len, c_str)

Perform a case-insensitive string comparison of an array and a null-terminated string. Return whether their contents are equivalent. The array should NOT contain a null-terminator, or the comparison will always return false. NULL may be passed as the array pointer if its length is declared to be 0. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_array_eq_c_str_ignore_case(const void *const array, const size_t array_len, const char *const c_str);
```
"""
function aws_array_eq_c_str_ignore_case(array, array_len, c_str)
    ccall((:aws_array_eq_c_str_ignore_case, libaws_c_io), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cchar}), array, array_len, c_str)
end

"""
    aws_byte_buf_init(buf, allocator, capacity)

### Prototype
```c
int aws_byte_buf_init(struct aws_byte_buf *buf, struct aws_allocator *allocator, size_t capacity);
```
"""
function aws_byte_buf_init(buf, allocator, capacity)
    ccall((:aws_byte_buf_init, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Csize_t), buf, allocator, capacity)
end

"""
    aws_byte_buf_init_copy(dest, allocator, src)

Initializes an [`aws_byte_buf`](@ref) structure base on another valid one. Requires: *src and *allocator are valid objects. Ensures: *dest is a valid [`aws_byte_buf`](@ref) with a new backing array dest->buffer which is a copy of the elements from src->buffer.

### Prototype
```c
int aws_byte_buf_init_copy( struct aws_byte_buf *dest, struct aws_allocator *allocator, const struct aws_byte_buf *src);
```
"""
function aws_byte_buf_init_copy(dest, allocator, src)
    ccall((:aws_byte_buf_init_copy, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{aws_byte_buf}), dest, allocator, src)
end

"""
    aws_byte_buf_init_from_file(out_buf, alloc, filename)

Reads 'filename' into 'out\\_buf'. If successful, 'out\\_buf' is allocated and filled with the data; It is your responsibility to call '[`aws_byte_buf_clean_up`](@ref)()' on it. Otherwise, 'out\\_buf' remains unused. In the very unfortunate case where some API needs to treat out\\_buf as a c\\_string, a null terminator is appended, but is not included as part of the length field.

### Prototype
```c
int aws_byte_buf_init_from_file(struct aws_byte_buf *out_buf, struct aws_allocator *alloc, const char *filename);
```
"""
function aws_byte_buf_init_from_file(out_buf, alloc, filename)
    ccall((:aws_byte_buf_init_from_file, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{Cchar}), out_buf, alloc, filename)
end

"""
    aws_byte_buf_init_from_file_with_size_hint(out_buf, alloc, filename, size_hint)

Same as [`aws_byte_buf_init_from_file`](@ref)(), but for reading "special files" like /proc/cpuinfo. These files don't accurately report their size, so size\\_hint is used as initial buffer size, and the buffer grows until the while file is read.

### Prototype
```c
int aws_byte_buf_init_from_file_with_size_hint( struct aws_byte_buf *out_buf, struct aws_allocator *alloc, const char *filename, size_t size_hint);
```
"""
function aws_byte_buf_init_from_file_with_size_hint(out_buf, alloc, filename, size_hint)
    ccall((:aws_byte_buf_init_from_file_with_size_hint, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{Cchar}, Csize_t), out_buf, alloc, filename, size_hint)
end

"""
    aws_byte_buf_is_valid(buf)

Evaluates the set of properties that define the shape of all valid [`aws_byte_buf`](@ref) structures. It is also a cheap check, in the sense it run in constant time (i.e., no loops or recursion).

### Prototype
```c
bool aws_byte_buf_is_valid(const struct aws_byte_buf *const buf);
```
"""
function aws_byte_buf_is_valid(buf)
    ccall((:aws_byte_buf_is_valid, libaws_c_io), Bool, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_cursor_is_valid(cursor)

Evaluates the set of properties that define the shape of all valid [`aws_byte_cursor`](@ref) structures. It is also a cheap check, in the sense it runs in constant time (i.e., no loops or recursion).

### Prototype
```c
bool aws_byte_cursor_is_valid(const struct aws_byte_cursor *cursor);
```
"""
function aws_byte_cursor_is_valid(cursor)
    ccall((:aws_byte_cursor_is_valid, libaws_c_io), Bool, (Ptr{aws_byte_cursor},), cursor)
end

"""
    aws_byte_buf_init_copy_from_cursor(dest, allocator, src)

Copies src buffer into dest and sets the correct len and capacity. A new memory zone is allocated for dest->buffer. When dest is no longer needed it will have to be cleaned-up using [`aws_byte_buf_clean_up`](@ref)(dest). Dest capacity and len will be equal to the src len. Allocator of the dest will be identical with parameter allocator. If src buffer is null the dest will have a null buffer with a len and a capacity of 0 Returns [`AWS_OP_SUCCESS`](@ref) in case of success or [`AWS_OP_ERR`](@ref) when memory can't be allocated.

### Prototype
```c
int aws_byte_buf_init_copy_from_cursor( struct aws_byte_buf *dest, struct aws_allocator *allocator, struct aws_byte_cursor src);
```
"""
function aws_byte_buf_init_copy_from_cursor(dest, allocator, src)
    ccall((:aws_byte_buf_init_copy_from_cursor, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, aws_byte_cursor), dest, allocator, src)
end

"""
    aws_byte_buf_clean_up(buf)

### Prototype
```c
void aws_byte_buf_clean_up(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_clean_up(buf)
    ccall((:aws_byte_buf_clean_up, libaws_c_io), Cvoid, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_buf_clean_up_secure(buf)

Equivalent to calling [`aws_byte_buf_secure_zero`](@ref) and then [`aws_byte_buf_clean_up`](@ref) on the buffer.

### Prototype
```c
void aws_byte_buf_clean_up_secure(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_clean_up_secure(buf)
    ccall((:aws_byte_buf_clean_up_secure, libaws_c_io), Cvoid, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_buf_reset(buf, zero_contents)

Resets the len of the buffer to 0, but does not free the memory. The buffer can then be reused. Optionally zeroes the contents, if the "zero\\_contents" flag is true.

### Prototype
```c
void aws_byte_buf_reset(struct aws_byte_buf *buf, bool zero_contents);
```
"""
function aws_byte_buf_reset(buf, zero_contents)
    ccall((:aws_byte_buf_reset, libaws_c_io), Cvoid, (Ptr{aws_byte_buf}, Bool), buf, zero_contents)
end

"""
    aws_byte_buf_secure_zero(buf)

Sets all bytes of buffer to zero and resets len to zero.

### Prototype
```c
void aws_byte_buf_secure_zero(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_secure_zero(buf)
    ccall((:aws_byte_buf_secure_zero, libaws_c_io), Cvoid, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_buf_eq(a, b)

Compare two [`aws_byte_buf`](@ref) structures. Return whether their contents are equivalent.

### Prototype
```c
bool aws_byte_buf_eq(const struct aws_byte_buf *const a, const struct aws_byte_buf *const b);
```
"""
function aws_byte_buf_eq(a, b)
    ccall((:aws_byte_buf_eq, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}), a, b)
end

"""
    aws_byte_buf_eq_ignore_case(a, b)

Perform a case-insensitive string comparison of two [`aws_byte_buf`](@ref) structures. Return whether their contents are equivalent. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_buf_eq_ignore_case(const struct aws_byte_buf *const a, const struct aws_byte_buf *const b);
```
"""
function aws_byte_buf_eq_ignore_case(a, b)
    ccall((:aws_byte_buf_eq_ignore_case, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}), a, b)
end

"""
    aws_byte_buf_eq_c_str(buf, c_str)

Compare an [`aws_byte_buf`](@ref) and a null-terminated string. Returns true if their contents are equivalent. The buffer should NOT contain a null-terminator, or the comparison will always return false.

### Prototype
```c
bool aws_byte_buf_eq_c_str(const struct aws_byte_buf *const buf, const char *const c_str);
```
"""
function aws_byte_buf_eq_c_str(buf, c_str)
    ccall((:aws_byte_buf_eq_c_str, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Ptr{Cchar}), buf, c_str)
end

"""
    aws_byte_buf_eq_c_str_ignore_case(buf, c_str)

Perform a case-insensitive string comparison of an [`aws_byte_buf`](@ref) and a null-terminated string. Return whether their contents are equivalent. The buffer should NOT contain a null-terminator, or the comparison will always return false. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_buf_eq_c_str_ignore_case(const struct aws_byte_buf *const buf, const char *const c_str);
```
"""
function aws_byte_buf_eq_c_str_ignore_case(buf, c_str)
    ccall((:aws_byte_buf_eq_c_str_ignore_case, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Ptr{Cchar}), buf, c_str)
end

"""
    aws_byte_cursor_next_split(input_str, split_on, substr)

No copies, no buffer allocations. Iterates over input\\_str, and returns the next substring between split\\_on instances relative to previous substr. Behaves similar to strtok with substr being used as state for next split.

Returns true each time substr is set and false when there is no more splits (substr is set to empty in that case).

Example usage. struct [`aws_byte_cursor`](@ref) substr = {0}; while ([`aws_byte_cursor_next_split`](@ref)(&input\\_str, ';', &substr)) { // ...use substr... }

Note: It is the user's responsibility zero-initialize substr before the first call.

Edge case rules are as follows: empty input will have single empty split. ex. "" splits into "" if input starts with split\\_on then first split is empty. ex ";A" splits into "", "A" adjacent split tokens result in empty split. ex "A;;B" splits into "A", "", "B" If the input ends with split\\_on, last split is empty. ex. "A;" splits into "A", ""

It is the user's responsibility to make sure the input buffer stays in memory long enough to use the results.

### Prototype
```c
bool aws_byte_cursor_next_split( const struct aws_byte_cursor *AWS_RESTRICT input_str, char split_on, struct aws_byte_cursor *AWS_RESTRICT substr);
```
"""
function aws_byte_cursor_next_split(input_str, split_on, substr)
    ccall((:aws_byte_cursor_next_split, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Cchar, Ptr{aws_byte_cursor}), input_str, split_on, substr)
end

"""
    aws_byte_cursor_split_on_char(input_str, split_on, output)

No copies, no buffer allocations. Fills in output with a list of [`aws_byte_cursor`](@ref) instances where buffer is an offset into the input\\_str and len is the length of that string in the original buffer.

Edge case rules are as follows: if the input begins with split\\_on, an empty cursor will be the first entry in output. if the input has two adjacent split\\_on tokens, an empty cursor will be inserted into the output. if the input ends with split\\_on, an empty cursor will be appended to the output.

It is the user's responsibility to properly initialize output. Recommended number of preallocated elements from output is your most likely guess for the upper bound of the number of elements resulting from the split.

The type that will be stored in output is struct [`aws_byte_cursor`](@ref) (you'll need this for the item size param).

It is the user's responsibility to make sure the input buffer stays in memory long enough to use the results.

### Prototype
```c
int aws_byte_cursor_split_on_char( const struct aws_byte_cursor *AWS_RESTRICT input_str, char split_on, struct aws_array_list *AWS_RESTRICT output);
```
"""
function aws_byte_cursor_split_on_char(input_str, split_on, output)
    ccall((:aws_byte_cursor_split_on_char, libaws_c_io), Cint, (Ptr{aws_byte_cursor}, Cchar, Ptr{aws_array_list}), input_str, split_on, output)
end

"""
    aws_byte_cursor_split_on_char_n(input_str, split_on, n, output)

No copies, no buffer allocations. Fills in output with a list of [`aws_byte_cursor`](@ref) instances where buffer is an offset into the input\\_str and len is the length of that string in the original buffer. N is the max number of splits, if this value is zero, it will add all splits to the output.

Edge case rules are as follows: if the input begins with split\\_on, an empty cursor will be the first entry in output if the input has two adjacent split\\_on tokens, an empty cursor will be inserted into the output. if the input ends with split\\_on, an empty cursor will be appended to the output.

It is the user's responsibility to properly initialize output. Recommended number of preallocated elements from output is your most likely guess for the upper bound of the number of elements resulting from the split.

If the output array is not large enough, input\\_str will be updated to point to the first character after the last processed split\\_on instance.

The type that will be stored in output is struct [`aws_byte_cursor`](@ref) (you'll need this for the item size param).

It is the user's responsibility to make sure the input buffer stays in memory long enough to use the results.

### Prototype
```c
int aws_byte_cursor_split_on_char_n( const struct aws_byte_cursor *AWS_RESTRICT input_str, char split_on, size_t n, struct aws_array_list *AWS_RESTRICT output);
```
"""
function aws_byte_cursor_split_on_char_n(input_str, split_on, n, output)
    ccall((:aws_byte_cursor_split_on_char_n, libaws_c_io), Cint, (Ptr{aws_byte_cursor}, Cchar, Csize_t, Ptr{aws_array_list}), input_str, split_on, n, output)
end

"""
    aws_byte_cursor_find_exact(input_str, to_find, first_find)

Search for an exact byte match inside a cursor. The first match will be returned. Returns [`AWS_OP_SUCCESS`](@ref) on successful match and first\\_find will be set to the offset in input\\_str, and length will be the remaining length from input\\_str past the returned offset. If the match was not found, [`AWS_OP_ERR`](@ref) will be returned and AWS\\_ERROR\\_STRING\\_MATCH\\_NOT\\_FOUND will be raised.

### Prototype
```c
int aws_byte_cursor_find_exact( const struct aws_byte_cursor *AWS_RESTRICT input_str, const struct aws_byte_cursor *AWS_RESTRICT to_find, struct aws_byte_cursor *first_find);
```
"""
function aws_byte_cursor_find_exact(input_str, to_find, first_find)
    ccall((:aws_byte_cursor_find_exact, libaws_c_io), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), input_str, to_find, first_find)
end

"""
    aws_byte_cursor_right_trim_pred(source, predicate)

Shrinks a byte cursor from the right for as long as the supplied predicate is true

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_right_trim_pred( const struct aws_byte_cursor *source, aws_byte_predicate_fn *predicate);
```
"""
function aws_byte_cursor_right_trim_pred(source, predicate)
    ccall((:aws_byte_cursor_right_trim_pred, libaws_c_io), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{aws_byte_predicate_fn}), source, predicate)
end

"""
    aws_byte_cursor_left_trim_pred(source, predicate)

Shrinks a byte cursor from the left for as long as the supplied predicate is true

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_left_trim_pred( const struct aws_byte_cursor *source, aws_byte_predicate_fn *predicate);
```
"""
function aws_byte_cursor_left_trim_pred(source, predicate)
    ccall((:aws_byte_cursor_left_trim_pred, libaws_c_io), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{aws_byte_predicate_fn}), source, predicate)
end

"""
    aws_byte_cursor_trim_pred(source, predicate)

Shrinks a byte cursor from both sides for as long as the supplied predicate is true

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_trim_pred( const struct aws_byte_cursor *source, aws_byte_predicate_fn *predicate);
```
"""
function aws_byte_cursor_trim_pred(source, predicate)
    ccall((:aws_byte_cursor_trim_pred, libaws_c_io), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{aws_byte_predicate_fn}), source, predicate)
end

"""
    aws_byte_cursor_satisfies_pred(source, predicate)

Returns true if the byte cursor's range of bytes all satisfy the predicate

### Prototype
```c
bool aws_byte_cursor_satisfies_pred(const struct aws_byte_cursor *source, aws_byte_predicate_fn *predicate);
```
"""
function aws_byte_cursor_satisfies_pred(source, predicate)
    ccall((:aws_byte_cursor_satisfies_pred, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_predicate_fn}), source, predicate)
end

"""
    aws_byte_buf_append(to, from)

Copies from to to. If to is too small, AWS\\_ERROR\\_DEST\\_COPY\\_TOO\\_SMALL will be returned. dest->len will contain the amount of data actually copied to dest.

from and to may be the same buffer, permitting copying a buffer into itself.

### Prototype
```c
int aws_byte_buf_append(struct aws_byte_buf *to, const struct aws_byte_cursor *from);
```
"""
function aws_byte_buf_append(to, from)
    ccall((:aws_byte_buf_append, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
end

"""
    aws_byte_buf_append_with_lookup(to, from, lookup_table)

Copies from to to while converting bytes via the passed in lookup table. If to is too small, AWS\\_ERROR\\_DEST\\_COPY\\_TOO\\_SMALL will be returned. to->len will contain its original size plus the amount of data actually copied to to.

from and to should not be the same buffer (overlap is not handled) lookup\\_table must be at least 256 bytes

### Prototype
```c
int aws_byte_buf_append_with_lookup( struct aws_byte_buf *AWS_RESTRICT to, const struct aws_byte_cursor *AWS_RESTRICT from, const uint8_t *lookup_table);
```
"""
function aws_byte_buf_append_with_lookup(to, from, lookup_table)
    ccall((:aws_byte_buf_append_with_lookup, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}, Ptr{UInt8}), to, from, lookup_table)
end

"""
    aws_byte_buf_append_dynamic(to, from)

Copies from to to. If to is too small, the buffer will be grown appropriately and the old contents copied to, before the new contents are appended.

If the grow fails (overflow or OOM), then an error will be returned.

from and to may be the same buffer, permitting copying a buffer into itself.

### Prototype
```c
int aws_byte_buf_append_dynamic(struct aws_byte_buf *to, const struct aws_byte_cursor *from);
```
"""
function aws_byte_buf_append_dynamic(to, from)
    ccall((:aws_byte_buf_append_dynamic, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
end

"""
    aws_byte_buf_append_dynamic_secure(to, from)

Copies `from` to `to`. If `to` is too small, the buffer will be grown appropriately and the old contents copied over, before the new contents are appended.

If the grow fails (overflow or OOM), then an error will be returned.

If the buffer is grown, the old buffer will be securely cleared before getting freed.

`from` and `to` may be the same buffer, permitting copying a buffer into itself.

### Prototype
```c
int aws_byte_buf_append_dynamic_secure(struct aws_byte_buf *to, const struct aws_byte_cursor *from);
```
"""
function aws_byte_buf_append_dynamic_secure(to, from)
    ccall((:aws_byte_buf_append_dynamic_secure, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
end

"""
    aws_byte_buf_append_byte_dynamic(buffer, value)

Copies a single byte into `to`. If `to` is too small, the buffer will be grown appropriately and the old contents copied over, before the byte is appended.

If the grow fails (overflow or OOM), then an error will be returned.

### Prototype
```c
int aws_byte_buf_append_byte_dynamic(struct aws_byte_buf *buffer, uint8_t value);
```
"""
function aws_byte_buf_append_byte_dynamic(buffer, value)
    ccall((:aws_byte_buf_append_byte_dynamic, libaws_c_io), Cint, (Ptr{aws_byte_buf}, UInt8), buffer, value)
end

"""
    aws_byte_buf_append_byte_dynamic_secure(buffer, value)

Copies a single byte into `to`. If `to` is too small, the buffer will be grown appropriately and the old contents copied over, before the byte is appended.

If the grow fails (overflow or OOM), then an error will be returned.

If the buffer is grown, the old buffer will be securely cleared before getting freed.

### Prototype
```c
int aws_byte_buf_append_byte_dynamic_secure(struct aws_byte_buf *buffer, uint8_t value);
```
"""
function aws_byte_buf_append_byte_dynamic_secure(buffer, value)
    ccall((:aws_byte_buf_append_byte_dynamic_secure, libaws_c_io), Cint, (Ptr{aws_byte_buf}, UInt8), buffer, value)
end

"""
    aws_byte_buf_append_and_update(to, from_and_update)

Copy contents of cursor to buffer, then update cursor to reference the memory stored in the buffer. If buffer is too small, AWS\\_ERROR\\_DEST\\_COPY\\_TOO\\_SMALL will be returned.

The cursor is permitted to reference memory from earlier in the buffer.

### Prototype
```c
int aws_byte_buf_append_and_update(struct aws_byte_buf *to, struct aws_byte_cursor *from_and_update);
```
"""
function aws_byte_buf_append_and_update(to, from_and_update)
    ccall((:aws_byte_buf_append_and_update, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from_and_update)
end

"""
    aws_byte_buf_append_null_terminator(buf)

Appends '\\0' at the end of the buffer.

### Prototype
```c
int aws_byte_buf_append_null_terminator(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_append_null_terminator(buf)
    ccall((:aws_byte_buf_append_null_terminator, libaws_c_io), Cint, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_buf_reserve(buffer, requested_capacity)

Attempts to increase the capacity of a buffer to the requested capacity

If the the buffer's capacity is currently larger than the request capacity, the function does nothing (no shrink is performed).

### Prototype
```c
int aws_byte_buf_reserve(struct aws_byte_buf *buffer, size_t requested_capacity);
```
"""
function aws_byte_buf_reserve(buffer, requested_capacity)
    ccall((:aws_byte_buf_reserve, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Csize_t), buffer, requested_capacity)
end

"""
    aws_byte_buf_reserve_relative(buffer, additional_length)

Convenience function that attempts to increase the capacity of a buffer relative to the current length.

[`aws_byte_buf_reserve_relative`](@ref)(buf, x) ~~ [`aws_byte_buf_reserve`](@ref)(buf, buf->len + x)

### Prototype
```c
int aws_byte_buf_reserve_relative(struct aws_byte_buf *buffer, size_t additional_length);
```
"""
function aws_byte_buf_reserve_relative(buffer, additional_length)
    ccall((:aws_byte_buf_reserve_relative, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Csize_t), buffer, additional_length)
end

"""
    aws_byte_cursor_eq(a, b)

Compare two [`aws_byte_cursor`](@ref) structures. Return whether their contents are equivalent.

### Prototype
```c
bool aws_byte_cursor_eq(const struct aws_byte_cursor *a, const struct aws_byte_cursor *b);
```
"""
function aws_byte_cursor_eq(a, b)
    ccall((:aws_byte_cursor_eq, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), a, b)
end

"""
    aws_byte_cursor_eq_ignore_case(a, b)

Perform a case-insensitive string comparison of two [`aws_byte_cursor`](@ref) structures. Return whether their contents are equivalent. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_cursor_eq_ignore_case(const struct aws_byte_cursor *a, const struct aws_byte_cursor *b);
```
"""
function aws_byte_cursor_eq_ignore_case(a, b)
    ccall((:aws_byte_cursor_eq_ignore_case, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), a, b)
end

"""
    aws_byte_cursor_eq_byte_buf(a, b)

Compare an [`aws_byte_cursor`](@ref) and an [`aws_byte_buf`](@ref). Return whether their contents are equivalent.

### Prototype
```c
bool aws_byte_cursor_eq_byte_buf(const struct aws_byte_cursor *const a, const struct aws_byte_buf *const b);
```
"""
function aws_byte_cursor_eq_byte_buf(a, b)
    ccall((:aws_byte_cursor_eq_byte_buf, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), a, b)
end

"""
    aws_byte_cursor_eq_byte_buf_ignore_case(a, b)

Perform a case-insensitive string comparison of an [`aws_byte_cursor`](@ref) and an [`aws_byte_buf`](@ref). Return whether their contents are equivalent. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_cursor_eq_byte_buf_ignore_case(const struct aws_byte_cursor *const a, const struct aws_byte_buf *const b);
```
"""
function aws_byte_cursor_eq_byte_buf_ignore_case(a, b)
    ccall((:aws_byte_cursor_eq_byte_buf_ignore_case, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), a, b)
end

"""
    aws_byte_cursor_eq_c_str(cursor, c_str)

Compare an [`aws_byte_cursor`](@ref) and a null-terminated string. Returns true if their contents are equivalent. The cursor should NOT contain a null-terminator, or the comparison will always return false.

### Prototype
```c
bool aws_byte_cursor_eq_c_str(const struct aws_byte_cursor *const cursor, const char *const c_str);
```
"""
function aws_byte_cursor_eq_c_str(cursor, c_str)
    ccall((:aws_byte_cursor_eq_c_str, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{Cchar}), cursor, c_str)
end

"""
    aws_byte_cursor_eq_c_str_ignore_case(cursor, c_str)

Perform a case-insensitive string comparison of an [`aws_byte_cursor`](@ref) and a null-terminated string. Return whether their contents are equivalent. The cursor should NOT contain a null-terminator, or the comparison will always return false. The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_cursor_eq_c_str_ignore_case(const struct aws_byte_cursor *const cursor, const char *const c_str);
```
"""
function aws_byte_cursor_eq_c_str_ignore_case(cursor, c_str)
    ccall((:aws_byte_cursor_eq_c_str_ignore_case, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{Cchar}), cursor, c_str)
end

"""
    aws_byte_cursor_starts_with(input, prefix)

Return true if the input starts with the prefix (exact byte comparison).

### Prototype
```c
bool aws_byte_cursor_starts_with(const struct aws_byte_cursor *input, const struct aws_byte_cursor *prefix);
```
"""
function aws_byte_cursor_starts_with(input, prefix)
    ccall((:aws_byte_cursor_starts_with, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), input, prefix)
end

"""
    aws_byte_cursor_starts_with_ignore_case(input, prefix)

Return true if the input starts with the prefix (case-insensitive). The "C" locale is used for comparing upper and lowercase letters. Data is assumed to be ASCII text, UTF-8 will work fine too.

### Prototype
```c
bool aws_byte_cursor_starts_with_ignore_case(const struct aws_byte_cursor *input, const struct aws_byte_cursor *prefix);
```
"""
function aws_byte_cursor_starts_with_ignore_case(input, prefix)
    ccall((:aws_byte_cursor_starts_with_ignore_case, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), input, prefix)
end

"""
    aws_hash_array_ignore_case(array, len)

Case-insensitive hash function for array containing ASCII or UTF-8 text.

### Prototype
```c
uint64_t aws_hash_array_ignore_case(const void *array, const size_t len);
```
"""
function aws_hash_array_ignore_case(array, len)
    ccall((:aws_hash_array_ignore_case, libaws_c_io), UInt64, (Ptr{Cvoid}, Csize_t), array, len)
end

"""
    aws_hash_byte_cursor_ptr_ignore_case(item)

Case-insensitive hash function for aws\\_byte\\_cursors stored in an [`aws_hash_table`](@ref). For case-sensitive hashing, use [`aws_hash_byte_cursor_ptr`](@ref)().

### Prototype
```c
uint64_t aws_hash_byte_cursor_ptr_ignore_case(const void *item);
```
"""
function aws_hash_byte_cursor_ptr_ignore_case(item)
    ccall((:aws_hash_byte_cursor_ptr_ignore_case, libaws_c_io), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_lookup_table_to_lower_get()

Returns a lookup table for bytes that is the identity transformation with the exception of uppercase ascii characters getting replaced with lowercase characters. Used in caseless comparisons.

### Prototype
```c
const uint8_t *aws_lookup_table_to_lower_get(void);
```
"""
function aws_lookup_table_to_lower_get()
    ccall((:aws_lookup_table_to_lower_get, libaws_c_io), Ptr{UInt8}, ())
end

"""
    aws_lookup_table_hex_to_num_get()

Returns lookup table to go from ASCII/UTF-8 hex character to a number (0-15). Non-hex characters map to 255. Valid examples: '0' -> 0 'F' -> 15 'f' -> 15 Invalid examples: ' ' -> 255 'Z' -> 255 '\\0' -> 255

### Prototype
```c
const uint8_t *aws_lookup_table_hex_to_num_get(void);
```
"""
function aws_lookup_table_hex_to_num_get()
    ccall((:aws_lookup_table_hex_to_num_get, libaws_c_io), Ptr{UInt8}, ())
end

"""
    aws_byte_cursor_compare_lexical(lhs, rhs)

Lexical (byte value) comparison of two byte cursors

### Prototype
```c
int aws_byte_cursor_compare_lexical(const struct aws_byte_cursor *lhs, const struct aws_byte_cursor *rhs);
```
"""
function aws_byte_cursor_compare_lexical(lhs, rhs)
    ccall((:aws_byte_cursor_compare_lexical, libaws_c_io), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), lhs, rhs)
end

"""
    aws_byte_cursor_compare_lookup(lhs, rhs, lookup_table)

Lexical (byte value) comparison of two byte cursors where the raw values are sent through a lookup table first

### Prototype
```c
int aws_byte_cursor_compare_lookup( const struct aws_byte_cursor *lhs, const struct aws_byte_cursor *rhs, const uint8_t *lookup_table);
```
"""
function aws_byte_cursor_compare_lookup(lhs, rhs, lookup_table)
    ccall((:aws_byte_cursor_compare_lookup, libaws_c_io), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}, Ptr{UInt8}), lhs, rhs, lookup_table)
end

"""
    aws_byte_buf_from_c_str(c_str)

For creating a byte buffer from a null-terminated string literal.

### Prototype
```c
struct aws_byte_buf aws_byte_buf_from_c_str(const char *c_str);
```
"""
function aws_byte_buf_from_c_str(c_str)
    ccall((:aws_byte_buf_from_c_str, libaws_c_io), aws_byte_buf, (Ptr{Cchar},), c_str)
end

"""
    aws_byte_buf_from_array(bytes, len)

### Prototype
```c
struct aws_byte_buf aws_byte_buf_from_array(const void *bytes, size_t len);
```
"""
function aws_byte_buf_from_array(bytes, len)
    ccall((:aws_byte_buf_from_array, libaws_c_io), aws_byte_buf, (Ptr{Cvoid}, Csize_t), bytes, len)
end

"""
    aws_byte_buf_from_empty_array(bytes, capacity)

### Prototype
```c
struct aws_byte_buf aws_byte_buf_from_empty_array(const void *bytes, size_t capacity);
```
"""
function aws_byte_buf_from_empty_array(bytes, capacity)
    ccall((:aws_byte_buf_from_empty_array, libaws_c_io), aws_byte_buf, (Ptr{Cvoid}, Csize_t), bytes, capacity)
end

"""
    aws_byte_cursor_from_buf(buf)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_buf(const struct aws_byte_buf *const buf);
```
"""
function aws_byte_cursor_from_buf(buf)
    ccall((:aws_byte_cursor_from_buf, libaws_c_io), aws_byte_cursor, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_cursor_from_c_str(c_str)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_c_str(const char *c_str);
```
"""
function aws_byte_cursor_from_c_str(c_str)
    ccall((:aws_byte_cursor_from_c_str, libaws_c_io), aws_byte_cursor, (Ptr{Cchar},), c_str)
end

"""
    aws_byte_cursor_from_array(bytes, len)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_array(const void *const bytes, const size_t len);
```
"""
function aws_byte_cursor_from_array(bytes, len)
    ccall((:aws_byte_cursor_from_array, libaws_c_io), aws_byte_cursor, (Ptr{Cvoid}, Csize_t), bytes, len)
end

"""
    aws_byte_cursor_advance(cursor, len)

Tests if the given [`aws_byte_cursor`](@ref) has at least len bytes remaining. If so, *buf is advanced by len bytes (incrementing ->ptr and decrementing ->len), and an [`aws_byte_cursor`](@ref) referring to the first len bytes of the original *buf is returned. Otherwise, an [`aws_byte_cursor`](@ref) with ->ptr = NULL, ->len = 0 is returned.

Note that if len is above (SIZE\\_MAX / 2), this function will also treat it as a buffer overflow, and return NULL without changing *buf.

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_advance(struct aws_byte_cursor *const cursor, const size_t len);
```
"""
function aws_byte_cursor_advance(cursor, len)
    ccall((:aws_byte_cursor_advance, libaws_c_io), aws_byte_cursor, (Ptr{aws_byte_cursor}, Csize_t), cursor, len)
end

"""
    aws_byte_cursor_advance_nospec(cursor, len)

Behaves identically to [`aws_byte_cursor_advance`](@ref), but avoids speculative execution potentially reading out-of-bounds pointers (by returning an empty ptr in such speculated paths).

This should generally be done when using an untrusted or data-dependent value for 'len', to avoid speculating into a path where cursor->ptr points outside the true ptr length.

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_advance_nospec(struct aws_byte_cursor *const cursor, size_t len);
```
"""
function aws_byte_cursor_advance_nospec(cursor, len)
    ccall((:aws_byte_cursor_advance_nospec, libaws_c_io), aws_byte_cursor, (Ptr{aws_byte_cursor}, Csize_t), cursor, len)
end

"""
    aws_byte_cursor_read(cur, dest, len)

Reads specified length of data from byte cursor and copies it to the destination array.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read( struct aws_byte_cursor *AWS_RESTRICT cur, void *AWS_RESTRICT dest, const size_t len);
```
"""
function aws_byte_cursor_read(cur, dest, len)
    ccall((:aws_byte_cursor_read, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{Cvoid}, Csize_t), cur, dest, len)
end

"""
    aws_byte_cursor_read_and_fill_buffer(cur, dest)

Reads as many bytes from cursor as size of buffer, and copies them to buffer.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_and_fill_buffer( struct aws_byte_cursor *AWS_RESTRICT cur, struct aws_byte_buf *AWS_RESTRICT dest);
```
"""
function aws_byte_cursor_read_and_fill_buffer(cur, dest)
    ccall((:aws_byte_cursor_read_and_fill_buffer, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), cur, dest)
end

"""
    aws_byte_cursor_read_u8(cur, var)

Reads a single byte from cursor, placing it in *var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_u8(struct aws_byte_cursor *AWS_RESTRICT cur, uint8_t *AWS_RESTRICT var);
```
"""
function aws_byte_cursor_read_u8(cur, var)
    ccall((:aws_byte_cursor_read_u8, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt8}), cur, var)
end

"""
    aws_byte_cursor_read_be16(cur, var)

Reads a 16-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_be16(struct aws_byte_cursor *cur, uint16_t *var);
```
"""
function aws_byte_cursor_read_be16(cur, var)
    ccall((:aws_byte_cursor_read_be16, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt16}), cur, var)
end

"""
    aws_byte_cursor_read_be24(cur, var)

Reads an unsigned 24-bit value (3 bytes) in network byte order from cur, and places it in host byte order into 32-bit var. Ex: if cur's next 3 bytes are {0xAA, 0xBB, 0xCC}, then var becomes 0x00AABBCC.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_be24(struct aws_byte_cursor *cur, uint32_t *var);
```
"""
function aws_byte_cursor_read_be24(cur, var)
    ccall((:aws_byte_cursor_read_be24, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt32}), cur, var)
end

"""
    aws_byte_cursor_read_be32(cur, var)

Reads a 32-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_be32(struct aws_byte_cursor *cur, uint32_t *var);
```
"""
function aws_byte_cursor_read_be32(cur, var)
    ccall((:aws_byte_cursor_read_be32, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt32}), cur, var)
end

"""
    aws_byte_cursor_read_be64(cur, var)

Reads a 64-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_be64(struct aws_byte_cursor *cur, uint64_t *var);
```
"""
function aws_byte_cursor_read_be64(cur, var)
    ccall((:aws_byte_cursor_read_be64, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt64}), cur, var)
end

"""
    aws_byte_cursor_read_float_be32(cur, var)

Reads a 32-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_float_be32(struct aws_byte_cursor *cur, float *var);
```
"""
function aws_byte_cursor_read_float_be32(cur, var)
    ccall((:aws_byte_cursor_read_float_be32, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{Cfloat}), cur, var)
end

"""
    aws_byte_cursor_read_float_be64(cur, var)

Reads a 64-bit value in network byte order from cur, and places it in host byte order into var.

On success, returns true and updates the cursor pointer/length accordingly. If there is insufficient space in the cursor, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_float_be64(struct aws_byte_cursor *cur, double *var);
```
"""
function aws_byte_cursor_read_float_be64(cur, var)
    ccall((:aws_byte_cursor_read_float_be64, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{Cdouble}), cur, var)
end

"""
    aws_byte_cursor_read_hex_u8(cur, var)

Reads 2 hex characters from ASCII/UTF-8 text to produce an 8-bit number. Accepts both lowercase 'a'-'f' and uppercase 'A'-'F'. For example: "0F" produces 15.

On success, returns true and advances the cursor by 2. If there is insufficient space in the cursor or an invalid character is encountered, returns false, leaving the cursor unchanged.

### Prototype
```c
bool aws_byte_cursor_read_hex_u8(struct aws_byte_cursor *cur, uint8_t *var);
```
"""
function aws_byte_cursor_read_hex_u8(cur, var)
    ccall((:aws_byte_cursor_read_hex_u8, libaws_c_io), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt8}), cur, var)
end

"""
    aws_byte_buf_advance(buffer, output, len)

Appends a sub-buffer to the specified buffer.

If the buffer has at least `len' bytes remaining (buffer->capacity - buffer->len >= len), then buffer->len is incremented by len, and an [`aws_byte_buf`](@ref) is assigned to *output corresponding to the last len bytes of the input buffer. The [`aws_byte_buf`](@ref) at *output will have a null allocator, a zero initial length, and a capacity of 'len'. The function then returns true.

If there is insufficient space, then this function nulls all fields in *output and returns false.

### Prototype
```c
bool aws_byte_buf_advance( struct aws_byte_buf *const AWS_RESTRICT buffer, struct aws_byte_buf *const AWS_RESTRICT output, const size_t len);
```
"""
function aws_byte_buf_advance(buffer, output, len)
    ccall((:aws_byte_buf_advance, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}, Csize_t), buffer, output, len)
end

"""
    aws_byte_buf_write(buf, src, len)

Write specified number of bytes from array to byte buffer.

On success, returns true and updates the buffer length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write( struct aws_byte_buf *AWS_RESTRICT buf, const uint8_t *AWS_RESTRICT src, size_t len);
```
"""
function aws_byte_buf_write(buf, src, len)
    ccall((:aws_byte_buf_write, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Ptr{UInt8}, Csize_t), buf, src, len)
end

"""
    aws_byte_buf_write_from_whole_buffer(buf, src)

Copies all bytes from buffer to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_from_whole_buffer( struct aws_byte_buf *AWS_RESTRICT buf, struct aws_byte_buf src);
```
"""
function aws_byte_buf_write_from_whole_buffer(buf, src)
    ccall((:aws_byte_buf_write_from_whole_buffer, libaws_c_io), Bool, (Ptr{aws_byte_buf}, aws_byte_buf), buf, src)
end

"""
    aws_byte_buf_write_from_whole_cursor(buf, src)

Copies all bytes from buffer to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_from_whole_cursor( struct aws_byte_buf *AWS_RESTRICT buf, struct aws_byte_cursor src);
```
"""
function aws_byte_buf_write_from_whole_cursor(buf, src)
    ccall((:aws_byte_buf_write_from_whole_cursor, libaws_c_io), Bool, (Ptr{aws_byte_buf}, aws_byte_cursor), buf, src)
end

"""
    aws_byte_buf_write_to_capacity(buf, advancing_cursor)

Without increasing buf's capacity, write as much as possible from advancing\\_cursor into buf.

buf's len is updated accordingly. advancing\\_cursor is advanced so it contains the remaining unwritten parts. Returns the section of advancing\\_cursor which was written.

This function cannot fail. If buf is full (len == capacity) or advancing\\_len has 0 length, then buf and advancing\\_cursor are not altered and a cursor with 0 length is returned.

Example: Given a buf with 2 bytes of space available and advancing\\_cursor with contents "abc". "ab" will be written to buf and buf->len will increase 2 and become equal to buf->capacity. advancing\\_cursor will advance so its contents become the unwritten "c". The returned cursor's contents will be the "ab" from the original advancing\\_cursor.

### Prototype
```c
struct aws_byte_cursor aws_byte_buf_write_to_capacity( struct aws_byte_buf *buf, struct aws_byte_cursor *advancing_cursor);
```
"""
function aws_byte_buf_write_to_capacity(buf, advancing_cursor)
    ccall((:aws_byte_buf_write_to_capacity, libaws_c_io), aws_byte_cursor, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buf, advancing_cursor)
end

"""
    aws_byte_buf_write_u8(buf, c)

Copies one byte to buffer.

On success, returns true and updates the cursor /length accordingly.

If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_u8(struct aws_byte_buf *AWS_RESTRICT buf, uint8_t c);
```
"""
function aws_byte_buf_write_u8(buf, c)
    ccall((:aws_byte_buf_write_u8, libaws_c_io), Bool, (Ptr{aws_byte_buf}, UInt8), buf, c)
end

"""
    aws_byte_buf_write_u8_n(buf, c, count)

Writes one byte repeatedly to buffer (like memset)

If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_u8_n(struct aws_byte_buf *buf, uint8_t c, size_t count);
```
"""
function aws_byte_buf_write_u8_n(buf, c, count)
    ccall((:aws_byte_buf_write_u8_n, libaws_c_io), Bool, (Ptr{aws_byte_buf}, UInt8, Csize_t), buf, c, count)
end

"""
    aws_byte_buf_write_be16(buf, x)

Writes a 16-bit integer in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_be16(struct aws_byte_buf *buf, uint16_t x);
```
"""
function aws_byte_buf_write_be16(buf, x)
    ccall((:aws_byte_buf_write_be16, libaws_c_io), Bool, (Ptr{aws_byte_buf}, UInt16), buf, x)
end

"""
    aws_byte_buf_write_be24(buf, x)

Writes low 24-bits (3 bytes) of an unsigned integer in network byte order (big endian) to buffer. Ex: If x is 0x00AABBCC then {0xAA, 0xBB, 0xCC} is written to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, or x's value cannot fit in 3 bytes, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_be24(struct aws_byte_buf *buf, uint32_t x);
```
"""
function aws_byte_buf_write_be24(buf, x)
    ccall((:aws_byte_buf_write_be24, libaws_c_io), Bool, (Ptr{aws_byte_buf}, UInt32), buf, x)
end

"""
    aws_byte_buf_write_be32(buf, x)

Writes a 32-bit integer in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_be32(struct aws_byte_buf *buf, uint32_t x);
```
"""
function aws_byte_buf_write_be32(buf, x)
    ccall((:aws_byte_buf_write_be32, libaws_c_io), Bool, (Ptr{aws_byte_buf}, UInt32), buf, x)
end

"""
    aws_byte_buf_write_float_be32(buf, x)

Writes a 32-bit float in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_float_be32(struct aws_byte_buf *buf, float x);
```
"""
function aws_byte_buf_write_float_be32(buf, x)
    ccall((:aws_byte_buf_write_float_be32, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Cfloat), buf, x)
end

"""
    aws_byte_buf_write_be64(buf, x)

Writes a 64-bit integer in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_be64(struct aws_byte_buf *buf, uint64_t x);
```
"""
function aws_byte_buf_write_be64(buf, x)
    ccall((:aws_byte_buf_write_be64, libaws_c_io), Bool, (Ptr{aws_byte_buf}, UInt64), buf, x)
end

"""
    aws_byte_buf_write_float_be64(buf, x)

Writes a 64-bit float in network byte order (big endian) to buffer.

On success, returns true and updates the buffer /length accordingly. If there is insufficient space in the buffer, returns false, leaving the buffer unchanged.

### Prototype
```c
bool aws_byte_buf_write_float_be64(struct aws_byte_buf *buf, double x);
```
"""
function aws_byte_buf_write_float_be64(buf, x)
    ccall((:aws_byte_buf_write_float_be64, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Cdouble), buf, x)
end

"""
    aws_isalnum(ch)

Like isalnum(), but ignores C locale. Returns true if ch has the value of ASCII/UTF-8: 'a'-'z', 'A'-'Z', or '0'-'9'.

### Prototype
```c
bool aws_isalnum(uint8_t ch);
```
"""
function aws_isalnum(ch)
    ccall((:aws_isalnum, libaws_c_io), Bool, (UInt8,), ch)
end

"""
    aws_isalpha(ch)

Like isalpha(), but ignores C locale. Returns true if ch has the value of ASCII/UTF-8: 'a'-'z' or 'A'-'Z'.

### Prototype
```c
bool aws_isalpha(uint8_t ch);
```
"""
function aws_isalpha(ch)
    ccall((:aws_isalpha, libaws_c_io), Bool, (UInt8,), ch)
end

"""
    aws_isdigit(ch)

Like isdigit(). Returns true if ch has the value of ASCII/UTF-8: '0'-'9'.

Note: C's built-in isdigit() is also supposed to ignore the C locale, but cppreference.com claims "some implementations (e.g. Microsoft in 1252 codepage) may classify additional single-byte characters as digits"

### Prototype
```c
bool aws_isdigit(uint8_t ch);
```
"""
function aws_isdigit(ch)
    ccall((:aws_isdigit, libaws_c_io), Bool, (UInt8,), ch)
end

"""
    aws_isxdigit(ch)

Like isxdigit(). Returns true if ch has the value of ASCII/UTF-8: '0'-'9', 'a'-'f', or 'A'-'F'.

Note: C's built-in isxdigit() is also supposed to ignore the C locale, but cppreference.com claims "some implementations (e.g. Microsoft in 1252 codepage) may classify additional single-byte characters as digits"

### Prototype
```c
bool aws_isxdigit(uint8_t ch);
```
"""
function aws_isxdigit(ch)
    ccall((:aws_isxdigit, libaws_c_io), Bool, (UInt8,), ch)
end

"""
    aws_isspace(ch)

Like isspace(), but ignores C locale. Return true if ch has the value of ASCII/UTF-8: space (0x20), form feed (0x0C), line feed (0x0A), carriage return (0x0D), horizontal tab (0x09), or vertical tab (0x0B).

### Prototype
```c
bool aws_isspace(uint8_t ch);
```
"""
function aws_isspace(ch)
    ccall((:aws_isspace, libaws_c_io), Bool, (UInt8,), ch)
end

"""
    aws_byte_cursor_utf8_parse_u64(cursor, dst)

Read entire cursor as ASCII/UTF-8 unsigned base-10 number. Stricter than strtoull(), which allows whitespace and inputs that start with "0x"

Examples: "0" -> 0 "123" -> 123 "00004" -> 4 // leading zeros ok

Rejects things like: "-1" // negative numbers not allowed "1,000" // only characters 0-9 allowed "" // blank string not allowed " 0 " // whitespace not allowed "0x0" // hex not allowed "FF" // hex not allowed "999999999999999999999999999999999999999999" // larger than max u64

### Prototype
```c
int aws_byte_cursor_utf8_parse_u64(struct aws_byte_cursor cursor, uint64_t *dst);
```
"""
function aws_byte_cursor_utf8_parse_u64(cursor, dst)
    ccall((:aws_byte_cursor_utf8_parse_u64, libaws_c_io), Cint, (aws_byte_cursor, Ptr{UInt64}), cursor, dst)
end

"""
    aws_byte_cursor_utf8_parse_u64_hex(cursor, dst)

Read entire cursor as ASCII/UTF-8 unsigned base-16 number with NO "0x" prefix.

Examples: "F" -> 15 "000000ff" -> 255 // leading zeros ok "Ff" -> 255 // mixed case ok "123" -> 291 "FFFFFFFFFFFFFFFF" -> 18446744073709551616 // max u64

Rejects things like: "0x0" // 0x prefix not allowed "" // blank string not allowed " F " // whitespace not allowed "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" // larger than max u64

### Prototype
```c
int aws_byte_cursor_utf8_parse_u64_hex(struct aws_byte_cursor cursor, uint64_t *dst);
```
"""
function aws_byte_cursor_utf8_parse_u64_hex(cursor, dst)
    ccall((:aws_byte_cursor_utf8_parse_u64_hex, libaws_c_io), Cint, (aws_byte_cursor, Ptr{UInt64}), cursor, dst)
end

struct aws_linked_list_node
    next::Ptr{aws_linked_list_node}
    prev::Ptr{aws_linked_list_node}
end

struct aws_linked_list
    head::aws_linked_list_node
    tail::aws_linked_list_node
end

"""
    aws_linked_list_node_reset(node)

Set node's next and prev pointers to NULL.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_node_reset(struct aws_linked_list_node *node);
```
"""
function aws_linked_list_node_reset(node)
    ccall((:aws_linked_list_node_reset, libaws_c_io), Cvoid, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_empty(list)

Tests if the list is empty.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_empty(const struct aws_linked_list *list);
```
"""
function aws_linked_list_empty(list)
    ccall((:aws_linked_list_empty, libaws_c_io), Bool, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_is_valid(list)

Checks that a linked list is valid.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_is_valid(const struct aws_linked_list *list);
```
"""
function aws_linked_list_is_valid(list)
    ccall((:aws_linked_list_is_valid, libaws_c_io), Bool, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_node_next_is_valid(node)

Checks that the prev of the next pointer of a node points to the node. As this checks whether the [next] connection of a node is bidirectional, it returns false if used for the list tail.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_node_next_is_valid(const struct aws_linked_list_node *node);
```
"""
function aws_linked_list_node_next_is_valid(node)
    ccall((:aws_linked_list_node_next_is_valid, libaws_c_io), Bool, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_node_prev_is_valid(node)

Checks that the next of the prev pointer of a node points to the node. Similarly to the above, this returns false if used for the head of a list.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_node_prev_is_valid(const struct aws_linked_list_node *node);
```
"""
function aws_linked_list_node_prev_is_valid(node)
    ccall((:aws_linked_list_node_prev_is_valid, libaws_c_io), Bool, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_is_valid_deep(list)

Checks that a linked list satisfies double linked list connectivity constraints. This check is O(n) as it traverses the whole linked list to ensure that tail is reachable from head (and vice versa) and that every connection is bidirectional.

Note: This check *cannot* go into an infinite loop, because we ensure that the connection to the next node is bidirectional. Therefore, if a node's [a] a.next is a previous node [b] in the list, b.prev != &a and so this check would fail, thus terminating the loop.

### Prototype
```c
AWS_STATIC_IMPL bool aws_linked_list_is_valid_deep(const struct aws_linked_list *list);
```
"""
function aws_linked_list_is_valid_deep(list)
    ccall((:aws_linked_list_is_valid_deep, libaws_c_io), Bool, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_init(list)

Initializes the list. List will be empty after this call.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_init(struct aws_linked_list *list);
```
"""
function aws_linked_list_init(list)
    ccall((:aws_linked_list_init, libaws_c_io), Cvoid, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_begin(list)

Returns an iteration pointer for the first element in the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_begin(const struct aws_linked_list *list);
```
"""
function aws_linked_list_begin(list)
    ccall((:aws_linked_list_begin, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_end(list)

Returns an iteration pointer for one past the last element in the list.

### Prototype
```c
AWS_STATIC_IMPL const struct aws_linked_list_node *aws_linked_list_end(const struct aws_linked_list *list);
```
"""
function aws_linked_list_end(list)
    ccall((:aws_linked_list_end, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_rbegin(list)

Returns a pointer for the last element in the list. Used to begin iterating the list in reverse. Ex: for (i = [`aws_linked_list_rbegin`](@ref)(list); i != [`aws_linked_list_rend`](@ref)(list); i = [`aws_linked_list_prev`](@ref)(i)) {...}

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_rbegin(const struct aws_linked_list *list);
```
"""
function aws_linked_list_rbegin(list)
    ccall((:aws_linked_list_rbegin, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_rend(list)

Returns the pointer to one before the first element in the list. Used to end iterating the list in reverse.

### Prototype
```c
AWS_STATIC_IMPL const struct aws_linked_list_node *aws_linked_list_rend(const struct aws_linked_list *list);
```
"""
function aws_linked_list_rend(list)
    ccall((:aws_linked_list_rend, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_next(node)

Returns the next element in the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_next(const struct aws_linked_list_node *node);
```
"""
function aws_linked_list_next(node)
    ccall((:aws_linked_list_next, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_prev(node)

Returns the previous element in the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_prev(const struct aws_linked_list_node *node);
```
"""
function aws_linked_list_prev(node)
    ccall((:aws_linked_list_prev, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_insert_after(after, to_add)

Inserts to\\_add immediately after after.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_insert_after( struct aws_linked_list_node *after, struct aws_linked_list_node *to_add);
```
"""
function aws_linked_list_insert_after(after, to_add)
    ccall((:aws_linked_list_insert_after, libaws_c_io), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), after, to_add)
end

"""
    aws_linked_list_swap_nodes(a, b)

Swaps the order two nodes in the linked list.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_swap_nodes(struct aws_linked_list_node *a, struct aws_linked_list_node *b);
```
"""
function aws_linked_list_swap_nodes(a, b)
    ccall((:aws_linked_list_swap_nodes, libaws_c_io), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), a, b)
end

"""
    aws_linked_list_insert_before(before, to_add)

Inserts to\\_add immediately before before.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_insert_before( struct aws_linked_list_node *before, struct aws_linked_list_node *to_add);
```
"""
function aws_linked_list_insert_before(before, to_add)
    ccall((:aws_linked_list_insert_before, libaws_c_io), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), before, to_add)
end

"""
    aws_linked_list_remove(node)

Removes the specified node from the list (prev/next point to each other) and returns the next node in the list.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_remove(struct aws_linked_list_node *node);
```
"""
function aws_linked_list_remove(node)
    ccall((:aws_linked_list_remove, libaws_c_io), Cvoid, (Ptr{aws_linked_list_node},), node)
end

"""
    aws_linked_list_push_back(list, node)

Append new\\_node.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_push_back(struct aws_linked_list *list, struct aws_linked_list_node *node);
```
"""
function aws_linked_list_push_back(list, node)
    ccall((:aws_linked_list_push_back, libaws_c_io), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list_node}), list, node)
end

"""
    aws_linked_list_back(list)

Returns the element in the back of the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_back(const struct aws_linked_list *list);
```
"""
function aws_linked_list_back(list)
    ccall((:aws_linked_list_back, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_pop_back(list)

Returns the element in the back of the list and removes it

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_pop_back(struct aws_linked_list *list);
```
"""
function aws_linked_list_pop_back(list)
    ccall((:aws_linked_list_pop_back, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_push_front(list, node)

Prepend new\\_node.

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_push_front(struct aws_linked_list *list, struct aws_linked_list_node *node);
```
"""
function aws_linked_list_push_front(list, node)
    ccall((:aws_linked_list_push_front, libaws_c_io), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list_node}), list, node)
end

"""
    aws_linked_list_front(list)

Returns the element in the front of the list.

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_front(const struct aws_linked_list *list);
```
"""
function aws_linked_list_front(list)
    ccall((:aws_linked_list_front, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_pop_front(list)

Returns the element in the front of the list and removes it

### Prototype
```c
AWS_STATIC_IMPL struct aws_linked_list_node *aws_linked_list_pop_front(struct aws_linked_list *list);
```
"""
function aws_linked_list_pop_front(list)
    ccall((:aws_linked_list_pop_front, libaws_c_io), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_swap_contents(a, b)

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_swap_contents( struct aws_linked_list *AWS_RESTRICT a, struct aws_linked_list *AWS_RESTRICT b);
```
"""
function aws_linked_list_swap_contents(a, b)
    ccall((:aws_linked_list_swap_contents, libaws_c_io), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), a, b)
end

"""
    aws_linked_list_move_all_back(dst, src)

Remove all nodes from one list, and add them to the back of another.

Example: if dst={1,2} and src={3,4}, they become dst={1,2,3,4} and src={}

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_move_all_back( struct aws_linked_list *AWS_RESTRICT dst, struct aws_linked_list *AWS_RESTRICT src);
```
"""
function aws_linked_list_move_all_back(dst, src)
    ccall((:aws_linked_list_move_all_back, libaws_c_io), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), dst, src)
end

"""
    aws_linked_list_move_all_front(dst, src)

Remove all nodes from one list, and add them to the front of another.

Example: if dst={2,1} and src={4,3}, they become dst={4,3,2,1} and src={}

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_move_all_front( struct aws_linked_list *AWS_RESTRICT dst, struct aws_linked_list *AWS_RESTRICT src);
```
"""
function aws_linked_list_move_all_front(dst, src)
    ccall((:aws_linked_list_move_all_front, libaws_c_io), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), dst, src)
end

"""
    aws_atomic_var

struct [`aws_atomic_var`](@ref) represents an atomic variable - a value which can hold an integer or pointer that can be manipulated atomically. struct aws\\_atomic\\_vars should normally only be manipulated with atomics methods defined in this header.
"""
struct aws_atomic_var
    value::Ptr{Cvoid}
end

@cenum aws_memory_order::UInt32 begin
    aws_memory_order_relaxed = 0
    aws_memory_order_acquire = 2
    aws_memory_order_release = 3
    aws_memory_order_acq_rel = 4
    aws_memory_order_seq_cst = 5
end

"""
    aws_atomic_init_int(var, n)

Initializes an atomic variable with an integer value. This operation should be done before any other operations on this atomic variable, and must be done before attempting any parallel operations.

This operation does not imply a barrier. Ensure that you use an acquire-release barrier (or stronger) when communicating the fact that initialization is complete to the other thread. Launching the thread implies a sufficiently strong barrier.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_init_int(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_init_int(var, n)
    ccall((:aws_atomic_init_int, libaws_c_io), Cvoid, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_init_ptr(var, p)

Initializes an atomic variable with a pointer value. This operation should be done before any other operations on this atomic variable, and must be done before attempting any parallel operations.

This operation does not imply a barrier. Ensure that you use an acquire-release barrier (or stronger) when communicating the fact that initialization is complete to the other thread. Launching the thread implies a sufficiently strong barrier.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_init_ptr(volatile struct aws_atomic_var *var, void *p);
```
"""
function aws_atomic_init_ptr(var, p)
    ccall((:aws_atomic_init_ptr, libaws_c_io), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
end

"""
    aws_atomic_load_int_explicit(var, memory_order)

Reads an atomic var as an integer, using the specified ordering, and returns the result.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_load_int_explicit(volatile const struct aws_atomic_var *var, enum aws_memory_order memory_order);
```
"""
function aws_atomic_load_int_explicit(var, memory_order)
    ccall((:aws_atomic_load_int_explicit, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, aws_memory_order), var, memory_order)
end

"""
    aws_atomic_load_int(var)

Reads an atomic var as an integer, using sequentially consistent ordering, and returns the result.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_load_int(volatile const struct aws_atomic_var *var);
```
"""
function aws_atomic_load_int(var)
    ccall((:aws_atomic_load_int, libaws_c_io), Csize_t, (Ptr{aws_atomic_var},), var)
end

"""
    aws_atomic_load_ptr_explicit(var, memory_order)

Reads an atomic var as a pointer, using the specified ordering, and returns the result.

### Prototype
```c
AWS_STATIC_IMPL void *aws_atomic_load_ptr_explicit(volatile const struct aws_atomic_var *var, enum aws_memory_order memory_order);
```
"""
function aws_atomic_load_ptr_explicit(var, memory_order)
    ccall((:aws_atomic_load_ptr_explicit, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_atomic_var}, aws_memory_order), var, memory_order)
end

"""
    aws_atomic_load_ptr(var)

Reads an atomic var as a pointer, using sequentially consistent ordering, and returns the result.

### Prototype
```c
AWS_STATIC_IMPL void *aws_atomic_load_ptr(volatile const struct aws_atomic_var *var);
```
"""
function aws_atomic_load_ptr(var)
    ccall((:aws_atomic_load_ptr, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_atomic_var},), var)
end

"""
    aws_atomic_store_int_explicit(var, n, memory_order)

Stores an integer into an atomic var, using the specified ordering.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_store_int_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order memory_order);
```
"""
function aws_atomic_store_int_explicit(var, n, memory_order)
    ccall((:aws_atomic_store_int_explicit, libaws_c_io), Cvoid, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, memory_order)
end

"""
    aws_atomic_store_int(var, n)

Stores an integer into an atomic var, using sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_store_int(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_store_int(var, n)
    ccall((:aws_atomic_store_int, libaws_c_io), Cvoid, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_store_ptr_explicit(var, p, memory_order)

Stores a pointer into an atomic var, using the specified ordering.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_store_ptr_explicit(volatile struct aws_atomic_var *var, void *p, enum aws_memory_order memory_order);
```
"""
function aws_atomic_store_ptr_explicit(var, p, memory_order)
    ccall((:aws_atomic_store_ptr_explicit, libaws_c_io), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}, aws_memory_order), var, p, memory_order)
end

"""
    aws_atomic_store_ptr(var, p)

Stores a pointer into an atomic var, using sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_store_ptr(volatile struct aws_atomic_var *var, void *p);
```
"""
function aws_atomic_store_ptr(var, p)
    ccall((:aws_atomic_store_ptr, libaws_c_io), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
end

"""
    aws_atomic_exchange_int_explicit(var, n, memory_order)

Exchanges an integer with the value in an atomic\\_var, using the specified ordering. Returns the value that was previously in the atomic\\_var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_exchange_int_explicit( volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order memory_order);
```
"""
function aws_atomic_exchange_int_explicit(var, n, memory_order)
    ccall((:aws_atomic_exchange_int_explicit, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, memory_order)
end

"""
    aws_atomic_exchange_int(var, n)

Exchanges an integer with the value in an atomic\\_var, using sequentially consistent ordering. Returns the value that was previously in the atomic\\_var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_exchange_int(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_exchange_int(var, n)
    ccall((:aws_atomic_exchange_int, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_exchange_ptr_explicit(var, p, memory_order)

Exchanges a pointer with the value in an atomic\\_var, using the specified ordering. Returns the value that was previously in the atomic\\_var.

### Prototype
```c
AWS_STATIC_IMPL void *aws_atomic_exchange_ptr_explicit( volatile struct aws_atomic_var *var, void *p, enum aws_memory_order memory_order);
```
"""
function aws_atomic_exchange_ptr_explicit(var, p, memory_order)
    ccall((:aws_atomic_exchange_ptr_explicit, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_atomic_var}, Ptr{Cvoid}, aws_memory_order), var, p, memory_order)
end

"""
    aws_atomic_exchange_ptr(var, p)

Exchanges an integer with the value in an atomic\\_var, using sequentially consistent ordering. Returns the value that was previously in the atomic\\_var.

### Prototype
```c
AWS_STATIC_IMPL void *aws_atomic_exchange_ptr(volatile struct aws_atomic_var *var, void *p);
```
"""
function aws_atomic_exchange_ptr(var, p)
    ccall((:aws_atomic_exchange_ptr, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
end

"""
    aws_atomic_compare_exchange_int_explicit(var, expected, desired, order_success, order_failure)

Atomically compares *var to *expected; if they are equal, atomically sets *var = desired. Otherwise, *expected is set to the value in *var. On success, the memory ordering used was order\\_success; otherwise, it was order\\_failure. order\\_failure must be no stronger than order\\_success, and must not be release or acq\\_rel. Returns true if the compare was successful and the variable updated to desired.

### Prototype
```c
AWS_STATIC_IMPL bool aws_atomic_compare_exchange_int_explicit( volatile struct aws_atomic_var *var, size_t *expected, size_t desired, enum aws_memory_order order_success, enum aws_memory_order order_failure);
```
"""
function aws_atomic_compare_exchange_int_explicit(var, expected, desired, order_success, order_failure)
    ccall((:aws_atomic_compare_exchange_int_explicit, libaws_c_io), Bool, (Ptr{aws_atomic_var}, Ptr{Csize_t}, Csize_t, aws_memory_order, aws_memory_order), var, expected, desired, order_success, order_failure)
end

"""
    aws_atomic_compare_exchange_int(var, expected, desired)

Atomically compares *var to *expected; if they are equal, atomically sets *var = desired. Otherwise, *expected is set to the value in *var. Uses sequentially consistent memory ordering, regardless of success or failure. Returns true if the compare was successful and the variable updated to desired.

### Prototype
```c
AWS_STATIC_IMPL bool aws_atomic_compare_exchange_int(volatile struct aws_atomic_var *var, size_t *expected, size_t desired);
```
"""
function aws_atomic_compare_exchange_int(var, expected, desired)
    ccall((:aws_atomic_compare_exchange_int, libaws_c_io), Bool, (Ptr{aws_atomic_var}, Ptr{Csize_t}, Csize_t), var, expected, desired)
end

"""
    aws_atomic_compare_exchange_ptr_explicit(var, expected, desired, order_success, order_failure)

Atomically compares *var to *expected; if they are equal, atomically sets *var = desired. Otherwise, *expected is set to the value in *var. On success, the memory ordering used was order\\_success; otherwise, it was order\\_failure. order\\_failure must be no stronger than order\\_success, and must not be release or acq\\_rel. Returns true if the compare was successful and the variable updated to desired.

### Prototype
```c
AWS_STATIC_IMPL bool aws_atomic_compare_exchange_ptr_explicit( volatile struct aws_atomic_var *var, void **expected, void *desired, enum aws_memory_order order_success, enum aws_memory_order order_failure);
```
"""
function aws_atomic_compare_exchange_ptr_explicit(var, expected, desired, order_success, order_failure)
    ccall((:aws_atomic_compare_exchange_ptr_explicit, libaws_c_io), Bool, (Ptr{aws_atomic_var}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, aws_memory_order, aws_memory_order), var, expected, desired, order_success, order_failure)
end

"""
    aws_atomic_compare_exchange_ptr(var, expected, desired)

Atomically compares *var to *expected; if they are equal, atomically sets *var = desired. Otherwise, *expected is set to the value in *var. Uses sequentially consistent memory ordering, regardless of success or failure. Returns true if the compare was successful and the variable updated to desired.

### Prototype
```c
AWS_STATIC_IMPL bool aws_atomic_compare_exchange_ptr(volatile struct aws_atomic_var *var, void **expected, void *desired);
```
"""
function aws_atomic_compare_exchange_ptr(var, expected, desired)
    ccall((:aws_atomic_compare_exchange_ptr, libaws_c_io), Bool, (Ptr{aws_atomic_var}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), var, expected, desired)
end

"""
    aws_atomic_fetch_add_explicit(var, n, order)

Atomically adds n to *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_add_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_add_explicit(var, n, order)
    ccall((:aws_atomic_fetch_add_explicit, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_sub_explicit(var, n, order)

Atomically subtracts n from *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_sub_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_sub_explicit(var, n, order)
    ccall((:aws_atomic_fetch_sub_explicit, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_or_explicit(var, n, order)

Atomically ORs n with *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_or_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_or_explicit(var, n, order)
    ccall((:aws_atomic_fetch_or_explicit, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_and_explicit(var, n, order)

Atomically ANDs n with *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_and_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_and_explicit(var, n, order)
    ccall((:aws_atomic_fetch_and_explicit, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_xor_explicit(var, n, order)

Atomically XORs n with *var, and returns the previous value of *var.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_xor_explicit(volatile struct aws_atomic_var *var, size_t n, enum aws_memory_order order);
```
"""
function aws_atomic_fetch_xor_explicit(var, n, order)
    ccall((:aws_atomic_fetch_xor_explicit, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
end

"""
    aws_atomic_fetch_add(var, n)

Atomically adds n to *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_add(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_add(var, n)
    ccall((:aws_atomic_fetch_add, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_fetch_sub(var, n)

Atomically subtracts n from *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_sub(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_sub(var, n)
    ccall((:aws_atomic_fetch_sub, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_fetch_and(var, n)

Atomically ands n into *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_and(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_and(var, n)
    ccall((:aws_atomic_fetch_and, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_fetch_or(var, n)

Atomically ors n into *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_or(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_or(var, n)
    ccall((:aws_atomic_fetch_or, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_fetch_xor(var, n)

Atomically xors n into *var, and returns the previous value of *var. Uses sequentially consistent ordering.

### Prototype
```c
AWS_STATIC_IMPL size_t aws_atomic_fetch_xor(volatile struct aws_atomic_var *var, size_t n);
```
"""
function aws_atomic_fetch_xor(var, n)
    ccall((:aws_atomic_fetch_xor, libaws_c_io), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
end

"""
    aws_atomic_thread_fence(order)

Provides the same reordering guarantees as an atomic operation with the specified memory order, without needing to actually perform an atomic operation.

### Prototype
```c
AWS_STATIC_IMPL void aws_atomic_thread_fence(enum aws_memory_order order);
```
"""
function aws_atomic_thread_fence(order)
    ccall((:aws_atomic_thread_fence, libaws_c_io), Cvoid, (aws_memory_order,), order)
end

"""
    aws_atomic_priv_xlate_order(order)

### Prototype
```c
static inline int aws_atomic_priv_xlate_order(enum aws_memory_order order);
```
"""
function aws_atomic_priv_xlate_order(order)
    ccall((:aws_atomic_priv_xlate_order, libaws_c_io), Cint, (aws_memory_order,), order)
end

# typedef void ( aws_simple_completion_callback ) ( void * )
const aws_simple_completion_callback = Cvoid

struct aws_ref_count
    ref_count::aws_atomic_var
    object::Ptr{Cvoid}
    on_zero_fn::Ptr{aws_simple_completion_callback}
end

struct aws_shutdown_callback_options
    shutdown_callback_fn::Ptr{aws_simple_completion_callback}
    shutdown_callback_user_data::Ptr{Cvoid}
end

"""
    aws_ref_count_init(ref_count, object, on_zero_fn)

Initializes a ref-counter structure. After initialization, the ref count will be 1.

### Parameters
* `ref_count`: ref-counter to initialize
* `object`: object being ref counted
* `on_zero_fn`: function to invoke when the ref count reaches zero
### Prototype
```c
void aws_ref_count_init( struct aws_ref_count *ref_count, void *object, aws_simple_completion_callback *on_zero_fn);
```
"""
function aws_ref_count_init(ref_count, object, on_zero_fn)
    ccall((:aws_ref_count_init, libaws_c_io), Cvoid, (Ptr{aws_ref_count}, Ptr{Cvoid}, Ptr{aws_simple_completion_callback}), ref_count, object, on_zero_fn)
end

"""
    aws_ref_count_acquire(ref_count)

Increments a ref-counter's ref count

### Parameters
* `ref_count`: ref-counter to increment the count for
### Returns
the object being ref-counted
### Prototype
```c
void *aws_ref_count_acquire(struct aws_ref_count *ref_count);
```
"""
function aws_ref_count_acquire(ref_count)
    ccall((:aws_ref_count_acquire, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_ref_count},), ref_count)
end

"""
    aws_ref_count_release(ref_count)

Decrements a ref-counter's ref count. Invokes the on\\_zero callback if the ref count drops to zero

### Parameters
* `ref_count`: ref-counter to decrement the count for
### Returns
the value of the decremented ref count
### Prototype
```c
size_t aws_ref_count_release(struct aws_ref_count *ref_count);
```
"""
function aws_ref_count_release(ref_count)
    ccall((:aws_ref_count_release, libaws_c_io), Csize_t, (Ptr{aws_ref_count},), ref_count)
end

struct aws_async_input_stream_vtable
    destroy::Ptr{Cvoid}
    read::Ptr{Cvoid}
end

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

const aws_crt_statistics_category_t = UInt32

@cenum __JL_Ctag_15::UInt32 begin
    AWS_CRT_STATISTICS_CATEGORY_STRIDE_BITS = 8
end

"""
    aws_crt_common_statistics_category

The common-specific range of the aws\\_crt\\_statistics\\_category cross-library enum.

This enum functions as an RTTI value that lets statistics handler's interpret (via cast) a specific statistics structure if the RTTI value is understood.

Common doesn't have any statistics structures presently, so its range is essentially empty.
"""
@cenum aws_crt_common_statistics_category::UInt32 begin
    AWSCRT_STAT_CAT_INVALID = 0
end

"""
    aws_crt_statistics_base

Pattern-struct that functions as a base "class" for all statistics structures. To conform to the pattern, a statistics structure must have its first member be the category. In that case it becomes "safe" to cast from [`aws_crt_statistics_base`](@ref) to the specific statistics structure based on the category value.
"""
struct aws_crt_statistics_base
    category::aws_crt_statistics_category_t
end

"""
    aws_crt_statistics_sample_interval

The start and end time, in milliseconds-since-epoch, that a set of statistics was gathered over.
"""
struct aws_crt_statistics_sample_interval
    begin_time_ms::UInt64
    end_time_ms::UInt64
end

# typedef void ( aws_crt_statistics_handler_process_statistics_fn ) ( struct aws_crt_statistics_handler * handler , struct aws_crt_statistics_sample_interval * interval , struct aws_array_list * stats , void * context )
const aws_crt_statistics_handler_process_statistics_fn = Cvoid

# typedef void ( aws_crt_statistics_handler_destroy_fn ) ( struct aws_crt_statistics_handler * handler )
const aws_crt_statistics_handler_destroy_fn = Cvoid

# typedef uint64_t ( aws_crt_statistics_handler_get_report_interval_ms_fn ) ( struct aws_crt_statistics_handler * )
const aws_crt_statistics_handler_get_report_interval_ms_fn = Cvoid

"""
    aws_crt_statistics_handler_vtable

Vtable for functions that all statistics handlers must implement
"""
struct aws_crt_statistics_handler_vtable
    process_statistics::Ptr{aws_crt_statistics_handler_process_statistics_fn}
    destroy::Ptr{aws_crt_statistics_handler_destroy_fn}
    get_report_interval_ms::Ptr{aws_crt_statistics_handler_get_report_interval_ms_fn}
end

"""
    aws_crt_statistics_handler

Base structure for all statistics handler implementations.

A statistics handler is an object that listens to a stream of polymorphic (via the category RTTI enum) statistics structures emitted from some arbitrary source. In the initial implementation, statistics handlers are primarily attached to channels, where they monitor IO throughput and state data (from channel handlers) to determine a connection's health.

Statistics handlers are a generalization of the timeout and bandwidth filters that are often associated with SDK network connections. Configurable, default implementations are defined at the protocol level (http, etc...) where they can be attached at connection (channel) creation time.
"""
struct aws_crt_statistics_handler
    vtable::Ptr{aws_crt_statistics_handler_vtable}
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
end

"""
    aws_crt_statistics_handler_process_statistics(handler, interval, stats, context)

Submits a list of statistics objects to a statistics handler for processing

handler - the statistics handler that will process the statistics objects interval - time period over which the statistics were gathered stats - list of pointers to structures that can be case to [`aws_crt_statistics_base`](@ref) (i.e. have category as a first member) context - (optional) additional context specific to where the statistics handler has been attached

### Prototype
```c
void aws_crt_statistics_handler_process_statistics( struct aws_crt_statistics_handler *handler, struct aws_crt_statistics_sample_interval *interval, struct aws_array_list *stats, void *context);
```
"""
function aws_crt_statistics_handler_process_statistics(handler, interval, stats, context)
    ccall((:aws_crt_statistics_handler_process_statistics, libaws_c_io), Cvoid, (Ptr{aws_crt_statistics_handler}, Ptr{aws_crt_statistics_sample_interval}, Ptr{aws_array_list}, Ptr{Cvoid}), handler, interval, stats, context)
end

"""
    aws_crt_statistics_handler_get_report_interval_ms(handler)

Queries the frequency (via an interval in milliseconds) which a statistics handler would like to be informed of statistics.

### Prototype
```c
uint64_t aws_crt_statistics_handler_get_report_interval_ms(struct aws_crt_statistics_handler *handler);
```
"""
function aws_crt_statistics_handler_get_report_interval_ms(handler)
    ccall((:aws_crt_statistics_handler_get_report_interval_ms, libaws_c_io), UInt64, (Ptr{aws_crt_statistics_handler},), handler)
end

"""
    aws_crt_statistics_handler_destroy(handler)

completely destroys a statistics handler. The handler's cleanup function must clean up the impl portion completely (including its allocation, if done separately).

### Prototype
```c
void aws_crt_statistics_handler_destroy(struct aws_crt_statistics_handler *handler);
```
"""
function aws_crt_statistics_handler_destroy(handler)
    ccall((:aws_crt_statistics_handler_destroy, libaws_c_io), Cvoid, (Ptr{aws_crt_statistics_handler},), handler)
end

# typedef int ( aws_priority_queue_compare_fn ) ( const void * a , const void * b )
const aws_priority_queue_compare_fn = Cvoid

struct aws_priority_queue
    pred::Ptr{aws_priority_queue_compare_fn}
    container::aws_array_list
    backpointers::aws_array_list
end

struct aws_priority_queue_node
    current_index::Csize_t
end

"""
    aws_priority_queue_init_dynamic(queue, alloc, default_size, item_size, pred)

Initializes a priority queue struct for use. This mode will grow memory automatically (exponential model) Default size is the inital size of the queue item\\_size is the size of each element in bytes. Mixing items types is not supported by this API. pred is the function that will be used to determine priority.

### Prototype
```c
int aws_priority_queue_init_dynamic( struct aws_priority_queue *queue, struct aws_allocator *alloc, size_t default_size, size_t item_size, aws_priority_queue_compare_fn *pred);
```
"""
function aws_priority_queue_init_dynamic(queue, alloc, default_size, item_size, pred)
    ccall((:aws_priority_queue_init_dynamic, libaws_c_io), Cint, (Ptr{aws_priority_queue}, Ptr{aws_allocator}, Csize_t, Csize_t, Ptr{aws_priority_queue_compare_fn}), queue, alloc, default_size, item_size, pred)
end

"""
    aws_priority_queue_init_static(queue, heap, item_count, item_size, pred)

Initializes a priority queue struct for use. This mode will not allocate any additional memory. When the heap fills new enqueue operations will fail with AWS\\_ERROR\\_PRIORITY\\_QUEUE\\_FULL.

Heaps initialized using this call do not support the [`aws_priority_queue_push_ref`](@ref) call with a non-NULL backpointer parameter.

heap is the raw memory allocated for this priority\\_queue item\\_count is the maximum number of elements the raw heap can contain item\\_size is the size of each element in bytes. Mixing items types is not supported by this API. pred is the function that will be used to determine priority.

### Prototype
```c
void aws_priority_queue_init_static( struct aws_priority_queue *queue, void *heap, size_t item_count, size_t item_size, aws_priority_queue_compare_fn *pred);
```
"""
function aws_priority_queue_init_static(queue, heap, item_count, item_size, pred)
    ccall((:aws_priority_queue_init_static, libaws_c_io), Cvoid, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Csize_t, Csize_t, Ptr{aws_priority_queue_compare_fn}), queue, heap, item_count, item_size, pred)
end

"""
    aws_priority_queue_backpointer_index_valid(queue, index)

Checks that the backpointer at a specific index of the queue is NULL or points to a correctly allocated [`aws_priority_queue_node`](@ref).

### Prototype
```c
bool aws_priority_queue_backpointer_index_valid(const struct aws_priority_queue *const queue, size_t index);
```
"""
function aws_priority_queue_backpointer_index_valid(queue, index)
    ccall((:aws_priority_queue_backpointer_index_valid, libaws_c_io), Bool, (Ptr{aws_priority_queue}, Csize_t), queue, index)
end

"""
    aws_priority_queue_backpointers_valid_deep(queue)

Checks that the backpointers of the priority queue are either NULL or correctly allocated to point at aws\\_priority\\_queue\\_nodes. This check is O(n), as it accesses every backpointer in a loop, and thus shouldn't be used carelessly.

### Prototype
```c
bool aws_priority_queue_backpointers_valid_deep(const struct aws_priority_queue *const queue);
```
"""
function aws_priority_queue_backpointers_valid_deep(queue)
    ccall((:aws_priority_queue_backpointers_valid_deep, libaws_c_io), Bool, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_backpointers_valid(queue)

Checks that the backpointers of the priority queue satisfy validity constraints.

### Prototype
```c
bool aws_priority_queue_backpointers_valid(const struct aws_priority_queue *const queue);
```
"""
function aws_priority_queue_backpointers_valid(queue)
    ccall((:aws_priority_queue_backpointers_valid, libaws_c_io), Bool, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_is_valid(queue)

Set of properties of a valid [`aws_priority_queue`](@ref).

### Prototype
```c
bool aws_priority_queue_is_valid(const struct aws_priority_queue *const queue);
```
"""
function aws_priority_queue_is_valid(queue)
    ccall((:aws_priority_queue_is_valid, libaws_c_io), Bool, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_clean_up(queue)

Cleans up any internally allocated memory and resets the struct for reuse or deletion.

### Prototype
```c
void aws_priority_queue_clean_up(struct aws_priority_queue *queue);
```
"""
function aws_priority_queue_clean_up(queue)
    ccall((:aws_priority_queue_clean_up, libaws_c_io), Cvoid, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_push(queue, item)

Copies item into the queue and places it in the proper priority order. Complexity: O(log(n)).

### Prototype
```c
int aws_priority_queue_push(struct aws_priority_queue *queue, void *item);
```
"""
function aws_priority_queue_push(queue, item)
    ccall((:aws_priority_queue_push, libaws_c_io), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}), queue, item)
end

"""
    aws_priority_queue_push_ref(queue, item, backpointer)

Copies item into the queue and places it in the proper priority order. Complexity: O(log(n)).

If the backpointer parameter is non-null, the heap will continually update the pointed-to field with information needed to remove the node later on. *backpointer must remain valid until the node is removed from the heap, and may be updated on any mutating operation on the priority queue.

If the node is removed, the backpointer will be set to a sentinel value that indicates that the node has already been removed. It is safe (and a no-op) to call [`aws_priority_queue_remove`](@ref) with such a sentinel value.

### Prototype
```c
int aws_priority_queue_push_ref( struct aws_priority_queue *queue, void *item, struct aws_priority_queue_node *backpointer);
```
"""
function aws_priority_queue_push_ref(queue, item, backpointer)
    ccall((:aws_priority_queue_push_ref, libaws_c_io), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Ptr{aws_priority_queue_node}), queue, item, backpointer)
end

"""
    aws_priority_queue_pop(queue, item)

Copies the element of the highest priority, and removes it from the queue.. Complexity: O(log(n)). If queue is empty, AWS\\_ERROR\\_PRIORITY\\_QUEUE\\_EMPTY will be raised.

### Prototype
```c
int aws_priority_queue_pop(struct aws_priority_queue *queue, void *item);
```
"""
function aws_priority_queue_pop(queue, item)
    ccall((:aws_priority_queue_pop, libaws_c_io), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}), queue, item)
end

"""
    aws_priority_queue_remove(queue, item, node)

Removes a specific node from the priority queue. Complexity: O(log(n)) After removing a node (using either \\_remove or \\_pop), the backpointer set at push\\_ref time is set to a sentinel value. If this sentinel value is passed to [`aws_priority_queue_remove`](@ref), AWS\\_ERROR\\_PRIORITY\\_QUEUE\\_BAD\\_NODE will be raised. Note, however, that passing uninitialized aws\\_priority\\_queue\\_nodes, or ones from different priority queues, results in undefined behavior.

### Prototype
```c
int aws_priority_queue_remove(struct aws_priority_queue *queue, void *item, const struct aws_priority_queue_node *node);
```
"""
function aws_priority_queue_remove(queue, item, node)
    ccall((:aws_priority_queue_remove, libaws_c_io), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Ptr{aws_priority_queue_node}), queue, item, node)
end

"""
    aws_priority_queue_top(queue, item)

Obtains a pointer to the element of the highest priority. Complexity: constant time. If queue is empty, AWS\\_ERROR\\_PRIORITY\\_QUEUE\\_EMPTY will be raised.

### Prototype
```c
int aws_priority_queue_top(const struct aws_priority_queue *queue, void **item);
```
"""
function aws_priority_queue_top(queue, item)
    ccall((:aws_priority_queue_top, libaws_c_io), Cint, (Ptr{aws_priority_queue}, Ptr{Ptr{Cvoid}}), queue, item)
end

"""
    aws_priority_queue_clear(queue)

Removes all elements from the queue, but does not free internal memory.

### Prototype
```c
void aws_priority_queue_clear(struct aws_priority_queue *queue);
```
"""
function aws_priority_queue_clear(queue)
    ccall((:aws_priority_queue_clear, libaws_c_io), Cvoid, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_size(queue)

Current number of elements in the queue

### Prototype
```c
size_t aws_priority_queue_size(const struct aws_priority_queue *queue);
```
"""
function aws_priority_queue_size(queue)
    ccall((:aws_priority_queue_size, libaws_c_io), Csize_t, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_capacity(queue)

Current allocated capacity for the queue, in dynamic mode this grows over time, in static mode, this will never change.

### Prototype
```c
size_t aws_priority_queue_capacity(const struct aws_priority_queue *queue);
```
"""
function aws_priority_queue_capacity(queue)
    ccall((:aws_priority_queue_capacity, libaws_c_io), Csize_t, (Ptr{aws_priority_queue},), queue)
end

"""
    aws_priority_queue_node_init(node)

Initializes a queue node to a default value that indicates the node is not in the queue.

### Parameters
* `node`: priority queue node to initialize with a default value
### Prototype
```c
void aws_priority_queue_node_init(struct aws_priority_queue_node *node);
```
"""
function aws_priority_queue_node_init(node)
    ccall((:aws_priority_queue_node_init, libaws_c_io), Cvoid, (Ptr{aws_priority_queue_node},), node)
end

"""
    aws_priority_queue_node_is_in_queue(node)

Checks if a priority queue node is currently in a priority queue.

### Parameters
* `node`: priority queue node to check usage for
### Returns
true if the node is in a queue, false otherwise
### Prototype
```c
bool aws_priority_queue_node_is_in_queue(const struct aws_priority_queue_node *node);
```
"""
function aws_priority_queue_node_is_in_queue(node)
    ccall((:aws_priority_queue_node_is_in_queue, libaws_c_io), Bool, (Ptr{aws_priority_queue_node},), node)
end

@cenum aws_task_status::UInt32 begin
    AWS_TASK_STATUS_RUN_READY = 0
    AWS_TASK_STATUS_CANCELED = 1
end

# typedef void ( aws_task_fn ) ( struct aws_task * task , void * arg , enum aws_task_status )
"""
A scheduled function.
"""
const aws_task_fn = Cvoid

struct __JL_Ctag_207
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_207}, f::Symbol)
    f === :scheduled && return Ptr{Bool}(x + 0)
    f === :reserved && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_207, f::Symbol)
    r = Ref{__JL_Ctag_207}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_207}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_207}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_task
    data::NTuple{36, UInt8}
end

function Base.getproperty(x::Ptr{aws_task}, f::Symbol)
    f === :fn && return Ptr{Ptr{aws_task_fn}}(x + 0)
    f === :arg && return Ptr{Ptr{Cvoid}}(x + 4)
    f === :timestamp && return Ptr{UInt64}(x + 8)
    f === :node && return Ptr{aws_linked_list_node}(x + 16)
    f === :priority_queue_node && return Ptr{aws_priority_queue_node}(x + 24)
    f === :type_tag && return Ptr{Ptr{Cchar}}(x + 28)
    f === :abi_extension && return Ptr{__JL_Ctag_207}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::aws_task, f::Symbol)
    r = Ref{aws_task}(x)
    ptr = Base.unsafe_convert(Ptr{aws_task}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_task}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_task_scheduler
    alloc::Ptr{aws_allocator}
    timed_queue::aws_priority_queue
    timed_list::aws_linked_list
    asap_list::aws_linked_list
end

"""
    aws_task_init(task, fn, arg, type_tag)

Init an [`aws_task`](@ref)

### Prototype
```c
void aws_task_init(struct aws_task *task, aws_task_fn *fn, void *arg, const char *type_tag);
```
"""
function aws_task_init(task, fn, arg, type_tag)
    ccall((:aws_task_init, libaws_c_io), Cvoid, (Ptr{aws_task}, Ptr{aws_task_fn}, Ptr{Cvoid}, Ptr{Cchar}), task, fn, arg, type_tag)
end

"""
    aws_task_run(task, status)

### Prototype
```c
void aws_task_run(struct aws_task *task, enum aws_task_status status);
```
"""
function aws_task_run(task, status)
    ccall((:aws_task_run, libaws_c_io), Cvoid, (Ptr{aws_task}, aws_task_status), task, status)
end

"""
    aws_task_scheduler_init(scheduler, alloc)

Initializes a task scheduler instance.

### Prototype
```c
int aws_task_scheduler_init(struct aws_task_scheduler *scheduler, struct aws_allocator *alloc);
```
"""
function aws_task_scheduler_init(scheduler, alloc)
    ccall((:aws_task_scheduler_init, libaws_c_io), Cint, (Ptr{aws_task_scheduler}, Ptr{aws_allocator}), scheduler, alloc)
end

"""
    aws_task_scheduler_clean_up(scheduler)

Empties and executes all queued tasks, passing the AWS\\_TASK\\_STATUS\\_CANCELED status to the task function. Cleans up any memory allocated, and prepares the instance for reuse or deletion.

### Prototype
```c
void aws_task_scheduler_clean_up(struct aws_task_scheduler *scheduler);
```
"""
function aws_task_scheduler_clean_up(scheduler)
    ccall((:aws_task_scheduler_clean_up, libaws_c_io), Cvoid, (Ptr{aws_task_scheduler},), scheduler)
end

"""
    aws_task_scheduler_is_valid(scheduler)

### Prototype
```c
bool aws_task_scheduler_is_valid(const struct aws_task_scheduler *scheduler);
```
"""
function aws_task_scheduler_is_valid(scheduler)
    ccall((:aws_task_scheduler_is_valid, libaws_c_io), Bool, (Ptr{aws_task_scheduler},), scheduler)
end

"""
    aws_task_scheduler_has_tasks(scheduler, next_task_time)

Returns whether the scheduler has any scheduled tasks. next\\_task\\_time (optional) will be set to time of the next task, note that 0 will be set if tasks were added via [`aws_task_scheduler_schedule_now`](@ref)() and UINT64\\_MAX will be set if no tasks are scheduled at all.

### Prototype
```c
bool aws_task_scheduler_has_tasks(const struct aws_task_scheduler *scheduler, uint64_t *next_task_time);
```
"""
function aws_task_scheduler_has_tasks(scheduler, next_task_time)
    ccall((:aws_task_scheduler_has_tasks, libaws_c_io), Bool, (Ptr{aws_task_scheduler}, Ptr{UInt64}), scheduler, next_task_time)
end

"""
    aws_task_scheduler_schedule_now(scheduler, task)

Schedules a task to run immediately. The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_task_scheduler_schedule_now(struct aws_task_scheduler *scheduler, struct aws_task *task);
```
"""
function aws_task_scheduler_schedule_now(scheduler, task)
    ccall((:aws_task_scheduler_schedule_now, libaws_c_io), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}), scheduler, task)
end

"""
    aws_task_scheduler_schedule_future(scheduler, task, time_to_run)

Schedules a task to run at time\\_to\\_run. The task should not be cleaned up or modified until its function is executed.

### Prototype
```c
void aws_task_scheduler_schedule_future( struct aws_task_scheduler *scheduler, struct aws_task *task, uint64_t time_to_run);
```
"""
function aws_task_scheduler_schedule_future(scheduler, task, time_to_run)
    ccall((:aws_task_scheduler_schedule_future, libaws_c_io), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}, UInt64), scheduler, task, time_to_run)
end

"""
    aws_task_scheduler_cancel_task(scheduler, task)

Removes task from the scheduler and invokes the task with the AWS\\_TASK\\_STATUS\\_CANCELED status.

### Prototype
```c
void aws_task_scheduler_cancel_task(struct aws_task_scheduler *scheduler, struct aws_task *task);
```
"""
function aws_task_scheduler_cancel_task(scheduler, task)
    ccall((:aws_task_scheduler_cancel_task, libaws_c_io), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}), scheduler, task)
end

"""
    aws_task_scheduler_run_all(scheduler, current_time)

Sequentially execute all tasks scheduled to run at, or before current\\_time. AWS\\_TASK\\_STATUS\\_RUN\\_READY will be passed to the task function as the task status.

If a task schedules another task, the new task will not be executed until the next call to this function.

### Prototype
```c
void aws_task_scheduler_run_all(struct aws_task_scheduler *scheduler, uint64_t current_time);
```
"""
function aws_task_scheduler_run_all(scheduler, current_time)
    ccall((:aws_task_scheduler_run_all, libaws_c_io), Cvoid, (Ptr{aws_task_scheduler}, UInt64), scheduler, current_time)
end

"""
    aws_task_status_to_c_str(status)

Convert a status value to a c-string suitable for logging

### Prototype
```c
const char *aws_task_status_to_c_str(enum aws_task_status status);
```
"""
function aws_task_status_to_c_str(status)
    ccall((:aws_task_status_to_c_str, libaws_c_io), Ptr{Cchar}, (aws_task_status,), status)
end

@cenum aws_channel_direction::UInt32 begin
    AWS_CHANNEL_DIR_READ = 0
    AWS_CHANNEL_DIR_WRITE = 1
end

# typedef void ( aws_channel_on_setup_completed_fn ) ( struct aws_channel * channel , int error_code , void * user_data )
const aws_channel_on_setup_completed_fn = Cvoid

# typedef void ( aws_channel_on_shutdown_completed_fn ) ( struct aws_channel * channel , int error_code , void * user_data )
const aws_channel_on_shutdown_completed_fn = Cvoid

mutable struct aws_channel end

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
const aws_channel_task_fn = Cvoid

struct aws_channel_task
    data::NTuple{56, UInt8}
end

function Base.getproperty(x::Ptr{aws_channel_task}, f::Symbol)
    f === :wrapper_task && return Ptr{aws_task}(x + 0)
    f === :task_fn && return Ptr{Ptr{aws_channel_task_fn}}(x + 36)
    f === :arg && return Ptr{Ptr{Cvoid}}(x + 40)
    f === :type_tag && return Ptr{Ptr{Cchar}}(x + 44)
    f === :node && return Ptr{aws_linked_list_node}(x + 48)
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

struct aws_event_loop_vtable
    destroy::Ptr{Cvoid}
    run::Ptr{Cvoid}
    stop::Ptr{Cvoid}
    wait_for_stop_completion::Ptr{Cvoid}
    schedule_task_now::Ptr{Cvoid}
    schedule_task_future::Ptr{Cvoid}
    cancel_task::Ptr{Cvoid}
    subscribe_to_io_events::Ptr{Cvoid}
    unsubscribe_from_io_events::Ptr{Cvoid}
    free_io_event_resources::Ptr{Cvoid}
    is_on_callers_thread::Ptr{Cvoid}
end

# typedef int ( aws_io_clock_fn ) ( uint64_t * timestamp )
const aws_io_clock_fn = Cvoid

"""
Hash table data structure. This module provides an automatically resizing hash table implementation for general purpose use. The hash table stores a mapping between void * keys and values; it is expected that in most cases, these will point to a structure elsewhere in the heap, instead of inlining a key or value into the hash table element itself.

Currently, this hash table implements a variant of robin hood hashing, but we do not guarantee that this won't change in the future.

Associated with each hash function are four callbacks:

hash\\_fn - A hash function from the keys to a uint64\\_t. It is critical that the hash function for a key does not change while the key is in the hash table; violating this results in undefined behavior. Collisions are tolerated, though naturally with reduced performance.

equals\\_fn - An equality comparison function. This function must be reflexive and consistent with hash\\_fn.

destroy\\_key\\_fn, destroy\\_value\\_fn - Optional callbacks invoked when the table is cleared or cleaned up and at the caller's option when an element is removed from the table. Either or both may be set to NULL, which has the same effect as a no-op destroy function.

This datastructure can be safely moved between threads, subject to the requirements of the underlying allocator. It is also safe to invoke non-mutating operations on the hash table from multiple threads. A suitable memory barrier must be used when transitioning from single-threaded mutating usage to multithreaded usage.
"""
mutable struct hash_table_state end

struct aws_hash_table
    p_impl::Ptr{hash_table_state}
end

struct aws_event_loop
    vtable::Ptr{aws_event_loop_vtable}
    alloc::Ptr{aws_allocator}
    clock::Ptr{aws_io_clock_fn}
    local_data::aws_hash_table
    current_load_factor::aws_atomic_var
    latest_tick_start::UInt64
    current_tick_latency_sum::Csize_t
    next_flush_time::aws_atomic_var
    impl_data::Ptr{Cvoid}
end

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

# typedef void ( aws_event_loop_on_local_object_removed_fn ) ( struct aws_event_loop_local_object * )
const aws_event_loop_on_local_object_removed_fn = Cvoid

struct aws_event_loop_local_object
    key::Ptr{Cvoid}
    object::Ptr{Cvoid}
    on_object_removed::Ptr{aws_event_loop_on_local_object_removed_fn}
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

@cenum aws_io_message_type::UInt32 begin
    AWS_IO_MESSAGE_APPLICATION_DATA = 0
end

# typedef void ( aws_channel_on_message_write_completed_fn ) ( struct aws_channel * channel , struct aws_io_message * message , int err_code , void * user_data )
const aws_channel_on_message_write_completed_fn = Cvoid

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

Acquires a message from the event loop's message pool. size\\_hint is merely a hint, it may be smaller than you requested and you are responsible for checking the bounds of it. If the returned message is not large enough, you must send multiple messages.

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
    ccall((:aws_channel_set_statistics_handler, libaws_c_io), Cint, (Ptr{aws_channel}, Ptr{aws_crt_statistics_handler}), channel, handler)
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

NOTE: if this function returns an error code, it is the caller's responsibility to release message back to the pool. If this function returns [`AWS_OP_SUCCESS`](@ref), the recipient of the message has taken ownership of the message. So, for example, don't release a message to the pool and then return an error. If you encounter an error condition in this case, shutdown the channel with the appropriate error code.

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

Convenience function that invokes [`aws_channel_acquire_message_from_pool`](@ref)(), asking for the largest reasonable DATA message that can be sent in the write direction, with upstream overhead accounted for.

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

This function does NOT always imply "success" -- if error\\_code is [`AWS_OP_SUCCESS`](@ref) then everything was successful, otherwise an error condition occurred.
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

struct aws_event_loop_group
    allocator::Ptr{aws_allocator}
    event_loops::aws_array_list
    ref_count::aws_ref_count
    shutdown_options::aws_shutdown_callback_options
end

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

This function does NOT mean "success", if error\\_code is [`AWS_OP_SUCCESS`](@ref) then everything was successful, otherwise an error condition occurred.

If an error occurred, you do not need to shutdown the channel. The `aws_channel_client_shutdown_callback` will be invoked once the channel has finished shutting down.
"""
const aws_server_bootstrap_on_accept_channel_setup_fn = Cvoid

# typedef void ( aws_server_bootstrap_on_accept_channel_shutdown_fn ) ( struct aws_server_bootstrap * bootstrap , int error_code , struct aws_channel * channel , void * user_data )
"""
Once the channel shuts down, this function will be invoked within the thread of the event-loop that the channel is assigned to.

Note: this function is only invoked if the channel was successfully setup, e.g. [`aws_server_bootstrap_on_accept_channel_setup_fn`](@ref)() was invoked without an error code.
"""
const aws_server_bootstrap_on_accept_channel_shutdown_fn = Cvoid

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

@cenum aws_socket_type::UInt32 begin
    AWS_SOCKET_STREAM = 0
    AWS_SOCKET_DGRAM = 1
end

@cenum aws_socket_domain::UInt32 begin
    AWS_SOCKET_IPV4 = 0
    AWS_SOCKET_IPV6 = 1
    AWS_SOCKET_LOCAL = 2
    AWS_SOCKET_VSOCK = 3
end

struct aws_socket_options
    type::aws_socket_type
    domain::aws_socket_domain
    connect_timeout_ms::UInt32
    keep_alive_interval_sec::UInt16
    keep_alive_timeout_sec::UInt16
    keep_alive_max_failed_probes::UInt16
    keepalive::Bool
end

struct aws_string
    allocator::Ptr{aws_allocator}
    len::Csize_t
    bytes::NTuple{1, UInt8}
end

# typedef void ( aws_tls_on_negotiation_result_fn ) ( struct aws_channel_handler * handler , struct aws_channel_slot * slot , int error_code , void * user_data )
"""
Invoked upon completion of the TLS handshake. If successful error\\_code will be [`AWS_OP_SUCCESS`](@ref), otherwise the negotiation failed and immediately after this function is invoked, the channel will be shutting down.
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

struct aws_tls_ctx
    alloc::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
    ref_count::aws_ref_count
end

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

struct aws_socket_endpoint
    address::NTuple{108, Cchar}
    port::UInt32
end

struct __JL_Ctag_211
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_211}, f::Symbol)
    f === :fd && return Ptr{Cint}(x + 0)
    f === :handle && return Ptr{Ptr{Cvoid}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_211, f::Symbol)
    r = Ref{__JL_Ctag_211}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_211}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_211}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_io_handle
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{aws_io_handle}, f::Symbol)
    f === :data && return Ptr{__JL_Ctag_211}(x + 0)
    f === :additional_data && return Ptr{Ptr{Cvoid}}(x + 4)
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

new\\_socket is not yet assigned to an event-loop. The user should call [`aws_socket_assign_to_event_loop`](@ref)() before performing IO operations.

When error\\_code is AWS\\_ERROR\\_SUCCESS, new\\_socket is the recently accepted connection. If error\\_code is non-zero, an error occurred and you should [`aws_socket_close`](@ref)() the socket.

Do not call [`aws_socket_clean_up`](@ref)() from this callback.
"""
const aws_socket_on_accept_result_fn = Cvoid

struct aws_socket
    data::NTuple{292, UInt8}
end

function Base.getproperty(x::Ptr{aws_socket}, f::Symbol)
    f === :allocator && return Ptr{Ptr{aws_allocator}}(x + 0)
    f === :local_endpoint && return Ptr{aws_socket_endpoint}(x + 4)
    f === :remote_endpoint && return Ptr{aws_socket_endpoint}(x + 116)
    f === :options && return Ptr{aws_socket_options}(x + 228)
    f === :io_handle && return Ptr{aws_io_handle}(x + 248)
    f === :event_loop && return Ptr{Ptr{aws_event_loop}}(x + 256)
    f === :handler && return Ptr{Ptr{aws_channel_handler}}(x + 260)
    f === :state && return Ptr{Cint}(x + 264)
    f === :readable_fn && return Ptr{Ptr{aws_socket_on_readable_fn}}(x + 268)
    f === :readable_user_data && return Ptr{Ptr{Cvoid}}(x + 272)
    f === :connection_result_fn && return Ptr{Ptr{aws_socket_on_connection_result_fn}}(x + 276)
    f === :accept_result_fn && return Ptr{Ptr{aws_socket_on_accept_result_fn}}(x + 280)
    f === :connect_accept_user_data && return Ptr{Ptr{Cvoid}}(x + 284)
    f === :impl && return Ptr{Ptr{Cvoid}}(x + 288)
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

@cenum __JL_Ctag_29::UInt32 begin
    AWS_COMMON_HASH_TABLE_ITER_CONTINUE = 1
    AWS_COMMON_HASH_TABLE_ITER_DELETE = 2
    AWS_COMMON_HASH_TABLE_ITER_ERROR = 4
end

"""
    aws_hash_element

Represents an element in the hash table. Various operations on the hash table may provide pointers to elements stored within the hash table; generally, calling code may alter value, but must not alter key (or any information used to compute key's hash code).

Pointers to elements within the hash are invalidated whenever an operation which may change the number of elements in the hash is invoked (i.e. put, delete, clear, and clean\\_up), regardless of whether the number of elements actually changes.
"""
struct aws_hash_element
    key::Ptr{Cvoid}
    value::Ptr{Cvoid}
end

@cenum aws_hash_iter_status::UInt32 begin
    AWS_HASH_ITER_STATUS_DONE = 0
    AWS_HASH_ITER_STATUS_DELETE_CALLED = 1
    AWS_HASH_ITER_STATUS_READY_FOR_USE = 2
end

struct aws_hash_iter
    map::Ptr{aws_hash_table}
    element::aws_hash_element
    slot::Csize_t
    limit::Csize_t
    status::aws_hash_iter_status
    unused_0::Cint
    unused_1::Ptr{Cvoid}
    unused_2::Ptr{Cvoid}
end

# typedef uint64_t ( aws_hash_fn ) ( const void * key )
"""
Prototype for a key hashing function pointer.
"""
const aws_hash_fn = Cvoid

# typedef bool ( aws_hash_callback_eq_fn ) ( const void * a , const void * b )
"""
Prototype for a hash table equality check function pointer.

This type is usually used for a function that compares two hash table keys, but note that the same type is used for a function that compares two hash table values in [`aws_hash_table_eq`](@ref).

Equality functions used in a hash table must be be reflexive (a == a), symmetric (a == b => b == a), transitive (a == b, b == c => a == c) and consistent (result does not change with time).
"""
const aws_hash_callback_eq_fn = Cvoid

# typedef void ( aws_hash_callback_destroy_fn ) ( void * key_or_value )
"""
Prototype for a hash table key or value destructor function pointer.

This function is used to destroy elements in the hash table when the table is cleared or cleaned up.

Note that functions which remove individual elements from the hash table provide options of whether or not to invoke the destructors on the key and value of a removed element.
"""
const aws_hash_callback_destroy_fn = Cvoid

"""
    aws_hash_table_init(map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)

Initializes a hash map with initial capacity for 'size' elements without resizing. Uses hash\\_fn to compute the hash of each element. equals\\_fn to compute equality of two keys. Whenever an element is removed without being returned, destroy\\_key\\_fn is run on the pointer to the key and destroy\\_value\\_fn is run on the pointer to the value. Either or both may be NULL if a callback is not desired in this case.

### Prototype
```c
int aws_hash_table_init( struct aws_hash_table *map, struct aws_allocator *alloc, size_t size, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn);
```
"""
function aws_hash_table_init(map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)
    ccall((:aws_hash_table_init, libaws_c_io), Cint, (Ptr{aws_hash_table}, Ptr{aws_allocator}, Csize_t, Ptr{aws_hash_fn}, Ptr{aws_hash_callback_eq_fn}, Ptr{aws_hash_callback_destroy_fn}, Ptr{aws_hash_callback_destroy_fn}), map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)
end

"""
    aws_hash_table_clean_up(map)

Deletes every element from map and frees all associated memory. destroy\\_fn will be called for each element. [`aws_hash_table_init`](@ref) must be called before reusing the hash table.

This method is idempotent.

### Prototype
```c
void aws_hash_table_clean_up(struct aws_hash_table *map);
```
"""
function aws_hash_table_clean_up(map)
    ccall((:aws_hash_table_clean_up, libaws_c_io), Cvoid, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_table_swap(a, b)

Safely swaps two hash tables. Note that we swap the entirety of the hash table, including which allocator is associated.

Neither hash table is required to be initialized; if one or both is uninitialized, then the uninitialized state is also swapped.

### Prototype
```c
void aws_hash_table_swap(struct aws_hash_table *AWS_RESTRICT a, struct aws_hash_table *AWS_RESTRICT b);
```
"""
function aws_hash_table_swap(a, b)
    ccall((:aws_hash_table_swap, libaws_c_io), Cvoid, (Ptr{aws_hash_table}, Ptr{aws_hash_table}), a, b)
end

"""
    aws_hash_table_move(to, from)

Moves the hash table in 'from' to 'to'. After this move, 'from' will be identical to the state of the original 'to' hash table, and 'to' will be in the same state as if it had been passed to [`aws_hash_table_clean_up`](@ref) (that is, it will have no memory allocated, and it will be safe to either discard it or call [`aws_hash_table_clean_up`](@ref) again).

Note that 'to' will not be cleaned up. You should make sure that 'to' is either uninitialized or cleaned up before moving a hashtable into it.

### Prototype
```c
void aws_hash_table_move(struct aws_hash_table *AWS_RESTRICT to, struct aws_hash_table *AWS_RESTRICT from);
```
"""
function aws_hash_table_move(to, from)
    ccall((:aws_hash_table_move, libaws_c_io), Cvoid, (Ptr{aws_hash_table}, Ptr{aws_hash_table}), to, from)
end

"""
    aws_hash_table_get_entry_count(map)

Returns the current number of entries in the table.

### Prototype
```c
size_t aws_hash_table_get_entry_count(const struct aws_hash_table *map);
```
"""
function aws_hash_table_get_entry_count(map)
    ccall((:aws_hash_table_get_entry_count, libaws_c_io), Csize_t, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_iter_begin(map)

Returns an iterator to be used for iterating through a hash table. Iterator will already point to the first element of the table it finds, which can be accessed as iter.element.

This function cannot fail, but if there are no elements in the table, the returned iterator will return true for [`aws_hash_iter_done`](@ref)(&iter).

### Prototype
```c
struct aws_hash_iter aws_hash_iter_begin(const struct aws_hash_table *map);
```
"""
function aws_hash_iter_begin(map)
    ccall((:aws_hash_iter_begin, libaws_c_io), aws_hash_iter, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_iter_done(iter)

Returns true if iterator is done iterating through table, false otherwise. If this is true, the iterator will not include an element of the table.

### Prototype
```c
bool aws_hash_iter_done(const struct aws_hash_iter *iter);
```
"""
function aws_hash_iter_done(iter)
    ccall((:aws_hash_iter_done, libaws_c_io), Bool, (Ptr{aws_hash_iter},), iter)
end

"""
    aws_hash_iter_next(iter)

Updates iterator so that it points to next element of hash table.

This and the two previous functions are designed to be used together with the following idiom:

for (struct [`aws_hash_iter`](@ref) iter = [`aws_hash_iter_begin`](@ref)(&map); ![`aws_hash_iter_done`](@ref)(&iter); [`aws_hash_iter_next`](@ref)(&iter)) { const key\\_type key = *(const key\\_type *)iter.element.key; value\\_type value = *(value\\_type *)iter.element.value; // etc. }

Note that calling this on an iter which is "done" is idempotent: i.e. it will return another iter which is "done".

### Prototype
```c
void aws_hash_iter_next(struct aws_hash_iter *iter);
```
"""
function aws_hash_iter_next(iter)
    ccall((:aws_hash_iter_next, libaws_c_io), Cvoid, (Ptr{aws_hash_iter},), iter)
end

"""
    aws_hash_iter_delete(iter, destroy_contents)

Deletes the element currently pointed-to by the hash iterator. After calling this method, the element member of the iterator should not be accessed until the next call to [`aws_hash_iter_next`](@ref).

### Parameters
* `destroy_contents`: If true, the destructors for the key and value will be called.
### Prototype
```c
void aws_hash_iter_delete(struct aws_hash_iter *iter, bool destroy_contents);
```
"""
function aws_hash_iter_delete(iter, destroy_contents)
    ccall((:aws_hash_iter_delete, libaws_c_io), Cvoid, (Ptr{aws_hash_iter}, Bool), iter, destroy_contents)
end

"""
    aws_hash_table_find(map, key, p_elem)

Attempts to locate an element at key. If the element is found, a pointer to the value is placed in *p\\_elem; if it is not found, *pElem is set to NULL. Either way, [`AWS_OP_SUCCESS`](@ref) is returned.

This method does not change the state of the hash table. Therefore, it is safe to call \\_find from multiple threads on the same hash table, provided no mutating operations happen in parallel.

Calling code may update the value in the hash table by modifying **pElem after a successful find. However, this pointer is not guaranteed to remain usable after a subsequent call to \\_put, \\_delete, \\_clear, or \\_clean\\_up.

### Prototype
```c
int aws_hash_table_find(const struct aws_hash_table *map, const void *key, struct aws_hash_element **p_elem);
```
"""
function aws_hash_table_find(map, key, p_elem)
    ccall((:aws_hash_table_find, libaws_c_io), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Ptr{aws_hash_element}}), map, key, p_elem)
end

"""
    aws_hash_table_create(map, key, p_elem, was_created)

Attempts to locate an element at key. If no such element was found, creates a new element, with value initialized to NULL. In either case, a pointer to the element is placed in *p\\_elem.

If was\\_created is non-NULL, *was\\_created is set to 0 if an existing element was found, or 1 is a new element was created.

Returns [`AWS_OP_SUCCESS`](@ref) if an item was found or created. Raises AWS\\_ERROR\\_OOM if hash table expansion was required and memory allocation failed.

### Prototype
```c
int aws_hash_table_create( struct aws_hash_table *map, const void *key, struct aws_hash_element **p_elem, int *was_created);
```
"""
function aws_hash_table_create(map, key, p_elem, was_created)
    ccall((:aws_hash_table_create, libaws_c_io), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Ptr{aws_hash_element}}, Ptr{Cint}), map, key, p_elem, was_created)
end

"""
    aws_hash_table_put(map, key, value, was_created)

Inserts a new element at key, with the given value. If another element exists at that key, the old element will be overwritten; both old key and value objects will be destroyed.

If was\\_created is non-NULL, *was\\_created is set to 0 if an existing element was found, or 1 is a new element was created.

Returns [`AWS_OP_SUCCESS`](@ref) if an item was found or created. Raises AWS\\_ERROR\\_OOM if hash table expansion was required and memory allocation failed.

### Prototype
```c
int aws_hash_table_put(struct aws_hash_table *map, const void *key, void *value, int *was_created);
```
"""
function aws_hash_table_put(map, key, value, was_created)
    ccall((:aws_hash_table_put, libaws_c_io), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}), map, key, value, was_created)
end

"""
    aws_hash_table_remove(map, key, p_value, was_present)

Removes element at key. Always returns [`AWS_OP_SUCCESS`](@ref).

If pValue is non-NULL, the existing value (if any) is moved into (*value) before removing from the table, and destroy\\_fn is \\_not\\_ invoked. If pValue is NULL, then (if the element existed) destroy\\_fn will be invoked on the element being removed.

If was\\_present is non-NULL, it is set to 0 if the element was not present, or 1 if it was present (and is now removed).

### Prototype
```c
int aws_hash_table_remove( struct aws_hash_table *map, const void *key, struct aws_hash_element *p_value, int *was_present);
```
"""
function aws_hash_table_remove(map, key, p_value, was_present)
    ccall((:aws_hash_table_remove, libaws_c_io), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{aws_hash_element}, Ptr{Cint}), map, key, p_value, was_present)
end

"""
    aws_hash_table_remove_element(map, p_value)

Removes element already known (typically by find()).

p\\_value should point to a valid element returned by create() or find().

NOTE: DO NOT call this method from inside of a [`aws_hash_table_foreach`](@ref) callback, return AWS\\_COMMON\\_HASH\\_TABLE\\_ITER\\_DELETE instead.

### Prototype
```c
int aws_hash_table_remove_element(struct aws_hash_table *map, struct aws_hash_element *p_value);
```
"""
function aws_hash_table_remove_element(map, p_value)
    ccall((:aws_hash_table_remove_element, libaws_c_io), Cint, (Ptr{aws_hash_table}, Ptr{aws_hash_element}), map, p_value)
end

"""
    aws_hash_table_foreach(map, callback, context)

Iterates through every element in the map and invokes the callback on that item. Iteration is performed in an arbitrary, implementation-defined order, and is not guaranteed to be consistent across invocations.

The callback may change the value associated with the key by overwriting the value pointed-to by value. In this case, the on\\_element\\_removed callback will not be invoked, unless the callback invokes AWS\\_COMMON\\_HASH\\_TABLE\\_ITER\\_DELETE (in which case the on\\_element\\_removed is given the updated value).

The callback must return a bitmask of zero or more of the following values ORed together:

# AWS\\_COMMON\\_HASH\\_TABLE\\_ITER\\_CONTINUE - Continues iteration to the next element (if not set, iteration stops) # AWS\\_COMMON\\_HASH\\_TABLE\\_ITER\\_DELETE - Deletes the current value and continues iteration. destroy\\_fn will NOT be invoked. # AWS\\_COMMON\\_HASH\\_TABLE\\_ITER\\_ERROR - Stop iteration with error. No action will be taken for the current value and the value before this. No rolling back. The deleted value before will NOT be back. [`aws_hash_table_foreach`](@ref) returns [`AWS_OP_ERR`](@ref) after stropping the iteration.

Invoking any method which may change the contents of the hashtable during iteration results in undefined behavior. However, you may safely invoke non-mutating operations during an iteration.

This operation is mutating only if AWS\\_COMMON\\_HASH\\_TABLE\\_ITER\\_DELETE is returned at some point during iteration. Otherwise, it is non-mutating and is safe to invoke in parallel with other non-mutating operations.

### Prototype
```c
int aws_hash_table_foreach( struct aws_hash_table *map, int (*callback)(void *context, struct aws_hash_element *p_element), void *context);
```
"""
function aws_hash_table_foreach(map, callback, context)
    ccall((:aws_hash_table_foreach, libaws_c_io), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}), map, callback, context)
end

"""
    aws_hash_table_eq(a, b, value_eq)

Compares two hash tables for equality. Both hash tables must have equivalent key comparators; values will be compared using the comparator passed into this function. The key hash function does not need to be equivalent between the two hash tables.

### Prototype
```c
bool aws_hash_table_eq( const struct aws_hash_table *a, const struct aws_hash_table *b, aws_hash_callback_eq_fn *value_eq);
```
"""
function aws_hash_table_eq(a, b, value_eq)
    ccall((:aws_hash_table_eq, libaws_c_io), Bool, (Ptr{aws_hash_table}, Ptr{aws_hash_table}, Ptr{aws_hash_callback_eq_fn}), a, b, value_eq)
end

"""
    aws_hash_table_clear(map)

Removes every element from the hash map. destroy\\_fn will be called for each element.

### Prototype
```c
void aws_hash_table_clear(struct aws_hash_table *map);
```
"""
function aws_hash_table_clear(map)
    ccall((:aws_hash_table_clear, libaws_c_io), Cvoid, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_c_string(item)

Convenience hash function for NULL-terminated C-strings

### Prototype
```c
uint64_t aws_hash_c_string(const void *item);
```
"""
function aws_hash_c_string(item)
    ccall((:aws_hash_c_string, libaws_c_io), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_string(item)

Convenience hash function for struct aws\\_strings. Hash is same as used on the string bytes by [`aws_hash_c_string`](@ref).

### Prototype
```c
uint64_t aws_hash_string(const void *item);
```
"""
function aws_hash_string(item)
    ccall((:aws_hash_string, libaws_c_io), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_byte_cursor_ptr(item)

Convenience hash function for struct [`aws_byte_cursor`](@ref). Hash is same as used on the string bytes by [`aws_hash_c_string`](@ref).

### Prototype
```c
uint64_t aws_hash_byte_cursor_ptr(const void *item);
```
"""
function aws_hash_byte_cursor_ptr(item)
    ccall((:aws_hash_byte_cursor_ptr, libaws_c_io), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_ptr(item)

Convenience hash function which hashes the pointer value directly, without dereferencing. This can be used in cases where pointer identity is desired, or where a uintptr\\_t is encoded into a const void *.

### Prototype
```c
uint64_t aws_hash_ptr(const void *item);
```
"""
function aws_hash_ptr(item)
    ccall((:aws_hash_ptr, libaws_c_io), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_combine(item1, item2)

### Prototype
```c
uint64_t aws_hash_combine(uint64_t item1, uint64_t item2);
```
"""
function aws_hash_combine(item1, item2)
    ccall((:aws_hash_combine, libaws_c_io), UInt64, (UInt64, UInt64), item1, item2)
end

"""
    aws_hash_callback_c_str_eq(a, b)

Convenience eq callback for NULL-terminated C-strings

### Prototype
```c
bool aws_hash_callback_c_str_eq(const void *a, const void *b);
```
"""
function aws_hash_callback_c_str_eq(a, b)
    ccall((:aws_hash_callback_c_str_eq, libaws_c_io), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end

"""
    aws_hash_callback_string_eq(a, b)

Convenience eq callback for AWS strings

### Prototype
```c
bool aws_hash_callback_string_eq(const void *a, const void *b);
```
"""
function aws_hash_callback_string_eq(a, b)
    ccall((:aws_hash_callback_string_eq, libaws_c_io), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end

"""
    aws_hash_callback_string_destroy(a)

Convenience destroy callback for AWS strings

### Prototype
```c
void aws_hash_callback_string_destroy(void *a);
```
"""
function aws_hash_callback_string_destroy(a)
    ccall((:aws_hash_callback_string_destroy, libaws_c_io), Cvoid, (Ptr{Cvoid},), a)
end

"""
    aws_ptr_eq(a, b)

Equality function which compares pointer equality.

### Prototype
```c
bool aws_ptr_eq(const void *a, const void *b);
```
"""
function aws_ptr_eq(a, b)
    ccall((:aws_ptr_eq, libaws_c_io), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end

"""
    aws_hash_table_is_valid(map)

Best-effort check of [`hash_table_state`](@ref) data-structure invariants

### Prototype
```c
bool aws_hash_table_is_valid(const struct aws_hash_table *map);
```
"""
function aws_hash_table_is_valid(map)
    ccall((:aws_hash_table_is_valid, libaws_c_io), Bool, (Ptr{aws_hash_table},), map)
end

"""
    aws_hash_iter_is_valid(iter)

Given a pointer to a hash\\_iter, checks that it is well-formed, with all data-structure invariants.

### Prototype
```c
bool aws_hash_iter_is_valid(const struct aws_hash_iter *iter);
```
"""
function aws_hash_iter_is_valid(iter)
    ccall((:aws_hash_iter_is_valid, libaws_c_io), Bool, (Ptr{aws_hash_iter},), iter)
end

@cenum aws_io_event_type::UInt32 begin
    AWS_IO_EVENT_TYPE_READABLE = 1
    AWS_IO_EVENT_TYPE_WRITABLE = 2
    AWS_IO_EVENT_TYPE_REMOTE_HANG_UP = 4
    AWS_IO_EVENT_TYPE_CLOSED = 8
    AWS_IO_EVENT_TYPE_ERROR = 16
end

# typedef void ( aws_event_loop_on_event_fn ) ( struct aws_event_loop * event_loop , struct aws_io_handle * handle , int events , void * user_data )
const aws_event_loop_on_event_fn = Cvoid

"""
    aws_thread_join_strategy

Specifies the join strategy used on an [`aws_thread`](@ref), which in turn controls whether or not a thread participates in the managed thread system. The managed thread system provides logic to guarantee a join on all participating threads at the cost of laziness (the user cannot control when joins happen).

Manual - thread does not participate in the managed thread system; any joins must be done by the user. This is the default. The user must call [`aws_thread_clean_up`](@ref)(), but only after any desired join operation has completed. Not doing so will cause the windows handle to leak.

Managed - the managed thread system will automatically perform a join some time after the thread's run function has completed. It is an error to call [`aws_thread_join`](@ref) on a thread configured with the managed join strategy. The managed thread system will call [`aws_thread_clean_up`](@ref)() on the thread after the background join has completed.

Additionally, an API exists, [`aws_thread_join_all_managed`](@ref)(), which blocks and returns when all outstanding threads with the managed strategy have fully joined. This API is useful for tests (rather than waiting for many individual signals) and program shutdown or DLL unload. This API is automatically invoked by the common library clean up function. If the common library clean up is called from a managed thread, this will cause deadlock.

Lazy thread joining is done only when threads finish their run function or when the user calls [`aws_thread_join_all_managed`](@ref)(). This means it may be a long time between thread function completion and the join being applied, but the queue of unjoined threads is always one or fewer so there is no critical resource backlog.

Currently, only event loop group async cleanup and host resolver threads participate in the managed thread system. Additionally, event loop threads will increment and decrement the pending join count (they are manually joined internally) in order to have an accurate view of internal thread usage and also to prevent failure to release an event loop group fully from allowing [`aws_thread_join_all_managed`](@ref)() from running to completion when its intent is such that it should block instead.
"""
@cenum aws_thread_join_strategy::UInt32 begin
    AWS_TJS_MANUAL = 0
    AWS_TJS_MANAGED = 1
end

struct aws_thread_options
    stack_size::Csize_t
    cpu_id::Int32
    join_strategy::aws_thread_join_strategy
    name::aws_byte_cursor
end

struct aws_event_loop_options
    clock::Ptr{aws_io_clock_fn}
    thread_options::Ptr{aws_thread_options}
end

# typedef struct aws_event_loop * ( aws_new_event_loop_fn ) ( struct aws_allocator * alloc , const struct aws_event_loop_options * options , void * new_loop_user_data )
const aws_new_event_loop_fn = Cvoid

"""
    aws_event_loop_new_default(alloc, clock)

Creates an instance of the default event loop implementation for the current architecture and operating system.

### Prototype
```c
struct aws_event_loop *aws_event_loop_new_default(struct aws_allocator *alloc, aws_io_clock_fn *clock);
```
"""
function aws_event_loop_new_default(alloc, clock)
    ccall((:aws_event_loop_new_default, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_allocator}, Ptr{aws_io_clock_fn}), alloc, clock)
end

"""
    aws_event_loop_new_default_with_options(alloc, options)

Creates an instance of the default event loop implementation for the current architecture and operating system using extendable options.

### Prototype
```c
struct aws_event_loop *aws_event_loop_new_default_with_options( struct aws_allocator *alloc, const struct aws_event_loop_options *options);
```
"""
function aws_event_loop_new_default_with_options(alloc, options)
    ccall((:aws_event_loop_new_default_with_options, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_allocator}, Ptr{aws_event_loop_options}), alloc, options)
end

"""
    aws_event_loop_destroy(event_loop)

Invokes the destroy() fn for the event loop implementation. If the event loop is still in a running state, this function will block waiting on the event loop to shutdown. If you do not want this function to block, call [`aws_event_loop_stop`](@ref)() manually first. If the event loop is shared by multiple threads then destroy must be called by exactly one thread. All other threads must ensure their API calls to the event loop happen-before the call to destroy.

### Prototype
```c
void aws_event_loop_destroy(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_destroy(event_loop)
    ccall((:aws_event_loop_destroy, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_init_base(event_loop, alloc, clock)

Initializes common event-loop data structures. This is only called from the *new() function of event loop implementations.

### Prototype
```c
int aws_event_loop_init_base(struct aws_event_loop *event_loop, struct aws_allocator *alloc, aws_io_clock_fn *clock);
```
"""
function aws_event_loop_init_base(event_loop, alloc, clock)
    ccall((:aws_event_loop_init_base, libaws_c_io), Cint, (Ptr{aws_event_loop}, Ptr{aws_allocator}, Ptr{aws_io_clock_fn}), event_loop, alloc, clock)
end

"""
    aws_event_loop_clean_up_base(event_loop)

Common cleanup code for all implementations. This is only called from the *destroy() function of event loop implementations.

### Prototype
```c
void aws_event_loop_clean_up_base(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_clean_up_base(event_loop)
    ccall((:aws_event_loop_clean_up_base, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_fetch_local_object(event_loop, key, obj)

Fetches an object from the event-loop's data store. Key will be taken as the memory address of the memory pointed to by key. This function is not thread safe and should be called inside the event-loop's thread.

### Prototype
```c
int aws_event_loop_fetch_local_object( struct aws_event_loop *event_loop, void *key, struct aws_event_loop_local_object *obj);
```
"""
function aws_event_loop_fetch_local_object(event_loop, key, obj)
    ccall((:aws_event_loop_fetch_local_object, libaws_c_io), Cint, (Ptr{aws_event_loop}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), event_loop, key, obj)
end

"""
    aws_event_loop_put_local_object(event_loop, obj)

Puts an item object the event-loop's data store. Key will be taken as the memory address of the memory pointed to by key. The lifetime of item must live until remove or a put item overrides it. This function is not thread safe and should be called inside the event-loop's thread.

### Prototype
```c
int aws_event_loop_put_local_object(struct aws_event_loop *event_loop, struct aws_event_loop_local_object *obj);
```
"""
function aws_event_loop_put_local_object(event_loop, obj)
    ccall((:aws_event_loop_put_local_object, libaws_c_io), Cint, (Ptr{aws_event_loop}, Ptr{aws_event_loop_local_object}), event_loop, obj)
end

"""
    aws_event_loop_remove_local_object(event_loop, key, removed_obj)

Removes an object from the event-loop's data store. Key will be taken as the memory address of the memory pointed to by key. If removed\\_item is not null, the removed item will be moved to it if it exists. Otherwise, the default deallocation strategy will be used. This function is not thread safe and should be called inside the event-loop's thread.

### Prototype
```c
int aws_event_loop_remove_local_object( struct aws_event_loop *event_loop, void *key, struct aws_event_loop_local_object *removed_obj);
```
"""
function aws_event_loop_remove_local_object(event_loop, key, removed_obj)
    ccall((:aws_event_loop_remove_local_object, libaws_c_io), Cint, (Ptr{aws_event_loop}, Ptr{Cvoid}, Ptr{aws_event_loop_local_object}), event_loop, key, removed_obj)
end

"""
    aws_event_loop_run(event_loop)

Triggers the running of the event loop. This function must not block. The event loop is not active until this function is invoked. This function can be called again on an event loop after calling [`aws_event_loop_stop`](@ref)() and [`aws_event_loop_wait_for_stop_completion`](@ref)().

### Prototype
```c
int aws_event_loop_run(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_run(event_loop)
    ccall((:aws_event_loop_run, libaws_c_io), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_stop(event_loop)

Triggers the event loop to stop, but does not wait for the loop to stop completely. This function may be called from outside or inside the event loop thread. It is safe to call multiple times. This function is called from destroy().

If you do not call destroy(), an event loop can be run again by calling stop(), wait\\_for\\_stop\\_completion(), run().

### Prototype
```c
int aws_event_loop_stop(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_stop(event_loop)
    ccall((:aws_event_loop_stop, libaws_c_io), Cint, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_register_tick_start(event_loop)

For event-loop implementations to use for providing metrics info to the base event-loop. This enables the event-loop load balancer to take into account load when vending another event-loop to a caller.

Call this function at the beginning of your event-loop tick: after wake-up, but before processing any IO or tasks.

### Prototype
```c
void aws_event_loop_register_tick_start(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_register_tick_start(event_loop)
    ccall((:aws_event_loop_register_tick_start, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_register_tick_end(event_loop)

For event-loop implementations to use for providing metrics info to the base event-loop. This enables the event-loop load balancer to take into account load when vending another event-loop to a caller.

Call this function at the end of your event-loop tick: after processing IO and tasks.

### Prototype
```c
void aws_event_loop_register_tick_end(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_register_tick_end(event_loop)
    ccall((:aws_event_loop_register_tick_end, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_get_load_factor(event_loop)

Returns the current load factor (however that may be calculated). If the event-loop is not invoking [`aws_event_loop_register_tick_start`](@ref)() and [`aws_event_loop_register_tick_end`](@ref)(), this value will always be 0.

### Prototype
```c
size_t aws_event_loop_get_load_factor(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_get_load_factor(event_loop)
    ccall((:aws_event_loop_get_load_factor, libaws_c_io), Csize_t, (Ptr{aws_event_loop},), event_loop)
end

"""
    aws_event_loop_wait_for_stop_completion(event_loop)

Blocks until the event loop stops completely. If you want to call [`aws_event_loop_run`](@ref)() again, you must call this after [`aws_event_loop_stop`](@ref)(). It is not safe to call this function from inside the event loop thread.

### Prototype
```c
int aws_event_loop_wait_for_stop_completion(struct aws_event_loop *event_loop);
```
"""
function aws_event_loop_wait_for_stop_completion(event_loop)
    ccall((:aws_event_loop_wait_for_stop_completion, libaws_c_io), Cint, (Ptr{aws_event_loop},), event_loop)
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
    aws_event_loop_subscribe_to_io_events(event_loop, handle, events, on_event, user_data)

Subscribes on\\_event to events on the event-loop for handle. events is a bitwise concatenation of the events that were received. The definition for these values can be found in [`aws_io_event_type`](@ref). Currently, only AWS\\_IO\\_EVENT\\_TYPE\\_READABLE and AWS\\_IO\\_EVENT\\_TYPE\\_WRITABLE are honored. You always are registered for error conditions and closure. This function may be called from outside or inside the event loop thread. However, the unsubscribe function must be called inside the event-loop's thread.

### Prototype
```c
int aws_event_loop_subscribe_to_io_events( struct aws_event_loop *event_loop, struct aws_io_handle *handle, int events, aws_event_loop_on_event_fn *on_event, void *user_data);
```
"""
function aws_event_loop_subscribe_to_io_events(event_loop, handle, events, on_event, user_data)
    ccall((:aws_event_loop_subscribe_to_io_events, libaws_c_io), Cint, (Ptr{aws_event_loop}, Ptr{aws_io_handle}, Cint, Ptr{aws_event_loop_on_event_fn}, Ptr{Cvoid}), event_loop, handle, events, on_event, user_data)
end

"""
    aws_event_loop_unsubscribe_from_io_events(event_loop, handle)

Unsubscribes handle from event-loop notifications. This function is not thread safe and should be called inside the event-loop's thread.

NOTE: if you are using io completion ports, this is a risky call. We use it in places, but only when we're certain there's no pending events. If you want to use it, it's your job to make sure you don't have pending events before calling it.

### Prototype
```c
int aws_event_loop_unsubscribe_from_io_events(struct aws_event_loop *event_loop, struct aws_io_handle *handle);
```
"""
function aws_event_loop_unsubscribe_from_io_events(event_loop, handle)
    ccall((:aws_event_loop_unsubscribe_from_io_events, libaws_c_io), Cint, (Ptr{aws_event_loop}, Ptr{aws_io_handle}), event_loop, handle)
end

"""
    aws_event_loop_free_io_event_resources(event_loop, handle)

Cleans up resources (user\\_data) associated with the I/O eventing subsystem for a given handle. This should only ever be necessary in the case where you are cleaning up an event loop during shutdown and its thread has already been joined.

### Prototype
```c
void aws_event_loop_free_io_event_resources(struct aws_event_loop *event_loop, struct aws_io_handle *handle);
```
"""
function aws_event_loop_free_io_event_resources(event_loop, handle)
    ccall((:aws_event_loop_free_io_event_resources, libaws_c_io), Cvoid, (Ptr{aws_event_loop}, Ptr{aws_io_handle}), event_loop, handle)
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
int aws_event_loop_current_clock_time(struct aws_event_loop *event_loop, uint64_t *time_nanos);
```
"""
function aws_event_loop_current_clock_time(event_loop, time_nanos)
    ccall((:aws_event_loop_current_clock_time, libaws_c_io), Cint, (Ptr{aws_event_loop}, Ptr{UInt64}), event_loop, time_nanos)
end

"""
    aws_event_loop_group_new(alloc, clock, el_count, new_loop_fn, new_loop_user_data, shutdown_options)

Creates an event loop group, with clock, number of loops to manage, and the function to call for creating a new event loop.

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new( struct aws_allocator *alloc, aws_io_clock_fn *clock, uint16_t el_count, aws_new_event_loop_fn *new_loop_fn, void *new_loop_user_data, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new(alloc, clock, el_count, new_loop_fn, new_loop_user_data, shutdown_options)
    ccall((:aws_event_loop_group_new, libaws_c_io), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, Ptr{aws_io_clock_fn}, UInt16, Ptr{aws_new_event_loop_fn}, Ptr{Cvoid}, Ptr{aws_shutdown_callback_options}), alloc, clock, el_count, new_loop_fn, new_loop_user_data, shutdown_options)
end

"""
    aws_event_loop_group_new_pinned_to_cpu_group(alloc, clock, el_count, cpu_group, new_loop_fn, new_loop_user_data, shutdown_options)

Creates an event loop group, with clock, number of loops to manage, the function to call for creating a new event loop, and also pins all loops to hw threads on the same cpu\\_group (e.g. NUMA nodes). Note: If el\\_count exceeds the number of hw threads in the cpu\\_group it will be ignored on the assumption that if you care about NUMA, you don't want hyper-threads doing your IO and you especially don't want IO on a different node.

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new_pinned_to_cpu_group( struct aws_allocator *alloc, aws_io_clock_fn *clock, uint16_t el_count, uint16_t cpu_group, aws_new_event_loop_fn *new_loop_fn, void *new_loop_user_data, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new_pinned_to_cpu_group(alloc, clock, el_count, cpu_group, new_loop_fn, new_loop_user_data, shutdown_options)
    ccall((:aws_event_loop_group_new_pinned_to_cpu_group, libaws_c_io), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, Ptr{aws_io_clock_fn}, UInt16, UInt16, Ptr{aws_new_event_loop_fn}, Ptr{Cvoid}, Ptr{aws_shutdown_callback_options}), alloc, clock, el_count, cpu_group, new_loop_fn, new_loop_user_data, shutdown_options)
end

"""
    aws_event_loop_group_new_default(alloc, max_threads, shutdown_options)

Initializes an event loop group with platform defaults. If max\\_threads == 0, then the loop count will be the number of available processors on the machine / 2 (to exclude hyper-threads). Otherwise, max\\_threads will be the number of event loops in the group.

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

Creates an event loop group, with clock, number of loops to manage, the function to call for creating a new event loop, and also pins all loops to hw threads on the same cpu\\_group (e.g. NUMA nodes). Note: If el\\_count exceeds the number of hw threads in the cpu\\_group it will be clamped to the number of hw threads on the assumption that if you care about NUMA, you don't want hyper-threads doing your IO and you especially don't want IO on a different node.

If max\\_threads == 0, then the loop count will be the number of available processors in the cpu\\_group / 2 (to exclude hyper-threads)

### Prototype
```c
struct aws_event_loop_group *aws_event_loop_group_new_default_pinned_to_cpu_group( struct aws_allocator *alloc, uint16_t max_threads, uint16_t cpu_group, const struct aws_shutdown_callback_options *shutdown_options);
```
"""
function aws_event_loop_group_new_default_pinned_to_cpu_group(alloc, max_threads, cpu_group, shutdown_options)
    ccall((:aws_event_loop_group_new_default_pinned_to_cpu_group, libaws_c_io), Ptr{aws_event_loop_group}, (Ptr{aws_allocator}, UInt16, UInt16, Ptr{aws_shutdown_callback_options}), alloc, max_threads, cpu_group, shutdown_options)
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

### Prototype
```c
size_t aws_event_loop_group_get_loop_count(struct aws_event_loop_group *el_group);
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

mutable struct aws_directory_iterator end

@cenum aws_file_type::UInt32 begin
    AWS_FILE_TYPE_FILE = 1
    AWS_FILE_TYPE_SYM_LINK = 2
    AWS_FILE_TYPE_DIRECTORY = 4
end

struct aws_directory_entry
    path::aws_byte_cursor
    relative_path::aws_byte_cursor
    file_type::Cint
    file_size::Int64
end

# typedef bool ( aws_on_directory_entry ) ( const struct aws_directory_entry * entry , void * user_data )
"""
Invoked during calls to [`aws_directory_traverse`](@ref)() as an entry is encountered. entry will contain the parsed directory entry info.

Return true to continue the traversal, or alternatively, if you have a reason to abort the traversal, return false.
"""
const aws_on_directory_entry = Cvoid

"""
    aws_fopen(file_path, mode)

Deprecated - Use [`aws_fopen_safe`](@ref)() instead, avoid const char * in public APIs. Opens file at file\\_path using mode. Returns the FILE pointer if successful. Otherwise, [`aws_last_error`](@ref)() will contain the error that occurred

### Prototype
```c
FILE *aws_fopen(const char *file_path, const char *mode);
```
"""
function aws_fopen(file_path, mode)
    ccall((:aws_fopen, libaws_c_io), Ptr{Libc.FILE}, (Ptr{Cchar}, Ptr{Cchar}), file_path, mode)
end

"""
    aws_fopen_safe(file_path, mode)

Opens file at file\\_path using mode. Returns the FILE pointer if successful. Otherwise, [`aws_last_error`](@ref)() will contain the error that occurred

### Prototype
```c
FILE *aws_fopen_safe(const struct aws_string *file_path, const struct aws_string *mode);
```
"""
function aws_fopen_safe(file_path, mode)
    ccall((:aws_fopen_safe, libaws_c_io), Ptr{Libc.FILE}, (Ptr{aws_string}, Ptr{aws_string}), file_path, mode)
end

"""
    aws_directory_create(dir_path)

Creates a directory if it doesn't currently exist. If the directory already exists, it's ignored and assumed successful.

Returns [`AWS_OP_SUCCESS`](@ref) on success. Otherwise, check [`aws_last_error`](@ref)().

### Prototype
```c
int aws_directory_create(const struct aws_string *dir_path);
```
"""
function aws_directory_create(dir_path)
    ccall((:aws_directory_create, libaws_c_io), Cint, (Ptr{aws_string},), dir_path)
end

"""
    aws_directory_exists(dir_path)

Returns true if the directory currently exists. Otherwise, it returns false.

### Prototype
```c
bool aws_directory_exists(const struct aws_string *dir_path);
```
"""
function aws_directory_exists(dir_path)
    ccall((:aws_directory_exists, libaws_c_io), Bool, (Ptr{aws_string},), dir_path)
end

"""
    aws_directory_delete(dir_path, recursive)

Deletes a directory. If the directory is not empty, this will fail unless the recursive parameter is set to true. If recursive is true then the entire directory and all of its contents will be deleted. If it is set to false, the directory will be deleted only if it is empty. Returns [`AWS_OP_SUCCESS`](@ref) if the operation was successful. Otherwise, [`aws_last_error`](@ref)() will contain the error that occurred. If the directory doesn't exist, [`AWS_OP_SUCCESS`](@ref) is still returned.

### Prototype
```c
int aws_directory_delete(const struct aws_string *dir_path, bool recursive);
```
"""
function aws_directory_delete(dir_path, recursive)
    ccall((:aws_directory_delete, libaws_c_io), Cint, (Ptr{aws_string}, Bool), dir_path, recursive)
end

"""
    aws_file_delete(file_path)

Deletes a file. Returns [`AWS_OP_SUCCESS`](@ref) if the operation was successful. Otherwise, [`aws_last_error`](@ref)() will contain the error that occurred. If the file doesn't exist, [`AWS_OP_SUCCESS`](@ref) is still returned.

### Prototype
```c
int aws_file_delete(const struct aws_string *file_path);
```
"""
function aws_file_delete(file_path)
    ccall((:aws_file_delete, libaws_c_io), Cint, (Ptr{aws_string},), file_path)
end

"""
    aws_directory_or_file_move(from, to)

Moves directory at from to to. Returns [`AWS_OP_SUCCESS`](@ref) if the operation was successful. Otherwise, [`aws_last_error`](@ref)() will contain the error that occurred.

### Prototype
```c
int aws_directory_or_file_move(const struct aws_string *from, const struct aws_string *to);
```
"""
function aws_directory_or_file_move(from, to)
    ccall((:aws_directory_or_file_move, libaws_c_io), Cint, (Ptr{aws_string}, Ptr{aws_string}), from, to)
end

"""
    aws_directory_traverse(allocator, path, recursive, on_entry, user_data)

Traverse a directory starting at path.

If you want the traversal to recurse the entire directory, pass recursive as true. Passing false for this parameter will only iterate the contents of the directory, but will not descend into any directories it encounters.

If recursive is set to true, the traversal is performed post-order, depth-first (for practical reasons such as deleting a directory that contains subdirectories or files).

returns [`AWS_OP_SUCCESS`](@ref)(0) on success.

### Prototype
```c
int aws_directory_traverse( struct aws_allocator *allocator, const struct aws_string *path, bool recursive, aws_on_directory_entry *on_entry, void *user_data);
```
"""
function aws_directory_traverse(allocator, path, recursive, on_entry, user_data)
    ccall((:aws_directory_traverse, libaws_c_io), Cint, (Ptr{aws_allocator}, Ptr{aws_string}, Bool, Ptr{aws_on_directory_entry}, Ptr{Cvoid}), allocator, path, recursive, on_entry, user_data)
end

"""
    aws_directory_entry_iterator_new(allocator, path)

Creates a read-only iterator of a directory starting at path. If path is invalid or there's any other error condition, NULL will be returned. Call [`aws_last_error`](@ref)() for the exact error in that case.

### Prototype
```c
struct aws_directory_iterator *aws_directory_entry_iterator_new( struct aws_allocator *allocator, const struct aws_string *path);
```
"""
function aws_directory_entry_iterator_new(allocator, path)
    ccall((:aws_directory_entry_iterator_new, libaws_c_io), Ptr{aws_directory_iterator}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, path)
end

"""
    aws_directory_entry_iterator_next(iterator)

Moves the iterator to the next entry. Returns [`AWS_OP_SUCCESS`](@ref) if another entry is available, or [`AWS_OP_ERR`](@ref) with AWS\\_ERROR\\_LIST\\_EMPTY as the value for [`aws_last_error`](@ref)() if no more entries are available.

### Prototype
```c
int aws_directory_entry_iterator_next(struct aws_directory_iterator *iterator);
```
"""
function aws_directory_entry_iterator_next(iterator)
    ccall((:aws_directory_entry_iterator_next, libaws_c_io), Cint, (Ptr{aws_directory_iterator},), iterator)
end

"""
    aws_directory_entry_iterator_previous(iterator)

Moves the iterator to the previous entry. Returns [`AWS_OP_SUCCESS`](@ref) if another entry is available, or [`AWS_OP_ERR`](@ref) with AWS\\_ERROR\\_LIST\\_EMPTY as the value for [`aws_last_error`](@ref)() if no more entries are available.

### Prototype
```c
int aws_directory_entry_iterator_previous(struct aws_directory_iterator *iterator);
```
"""
function aws_directory_entry_iterator_previous(iterator)
    ccall((:aws_directory_entry_iterator_previous, libaws_c_io), Cint, (Ptr{aws_directory_iterator},), iterator)
end

"""
    aws_directory_entry_iterator_destroy(iterator)

Cleanup and deallocate iterator

### Prototype
```c
void aws_directory_entry_iterator_destroy(struct aws_directory_iterator *iterator);
```
"""
function aws_directory_entry_iterator_destroy(iterator)
    ccall((:aws_directory_entry_iterator_destroy, libaws_c_io), Cvoid, (Ptr{aws_directory_iterator},), iterator)
end

"""
    aws_directory_entry_iterator_get_value(iterator)

Gets the [`aws_directory_entry`](@ref) value for iterator at the current position. Returns NULL if the iterator contains no entries.

### Prototype
```c
const struct aws_directory_entry *aws_directory_entry_iterator_get_value( const struct aws_directory_iterator *iterator);
```
"""
function aws_directory_entry_iterator_get_value(iterator)
    ccall((:aws_directory_entry_iterator_get_value, libaws_c_io), Ptr{aws_directory_entry}, (Ptr{aws_directory_iterator},), iterator)
end

"""
    aws_is_any_directory_separator(value)

Returns true iff the character is a directory separator on ANY supported platform.

### Prototype
```c
bool aws_is_any_directory_separator(char value);
```
"""
function aws_is_any_directory_separator(value)
    ccall((:aws_is_any_directory_separator, libaws_c_io), Bool, (Cchar,), value)
end

"""
    aws_get_platform_directory_separator()

Returns the directory separator used by the local platform

### Prototype
```c
char aws_get_platform_directory_separator(void);
```
"""
function aws_get_platform_directory_separator()
    ccall((:aws_get_platform_directory_separator, libaws_c_io), Cchar, ())
end

"""
    aws_normalize_directory_separator(path)

Normalizes the path by replacing any directory separator with the local platform's directory separator.

### Parameters
* `path`: path to normalize. Must be writeable.
### Prototype
```c
void aws_normalize_directory_separator(struct aws_byte_buf *path);
```
"""
function aws_normalize_directory_separator(path)
    ccall((:aws_normalize_directory_separator, libaws_c_io), Cvoid, (Ptr{aws_byte_buf},), path)
end

"""
    aws_get_home_directory(allocator)

Returns the current user's home directory.

### Prototype
```c
struct aws_string *aws_get_home_directory(struct aws_allocator *allocator);
```
"""
function aws_get_home_directory(allocator)
    ccall((:aws_get_home_directory, libaws_c_io), Ptr{aws_string}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_path_exists(path)

Returns true if a file or path exists, otherwise, false.

### Prototype
```c
bool aws_path_exists(const struct aws_string *path);
```
"""
function aws_path_exists(path)
    ccall((:aws_path_exists, libaws_c_io), Bool, (Ptr{aws_string},), path)
end

"""
    aws_fseek(file, offset, whence)

### Prototype
```c
int aws_fseek(FILE *file, int64_t offset, int whence);
```
"""
function aws_fseek(file, offset, whence)
    ccall((:aws_fseek, libaws_c_io), Cint, (Ptr{Libc.FILE}, Int64, Cint), file, offset, whence)
end

"""
    aws_file_get_length(file, length)

### Prototype
```c
int aws_file_get_length(FILE *file, int64_t *length);
```
"""
function aws_file_get_length(file, length)
    ccall((:aws_file_get_length, libaws_c_io), Cint, (Ptr{Libc.FILE}, Ptr{Int64}), file, length)
end

# typedef void ( aws_future_callback_fn ) ( void * user_data )
"""
Completion callback for aws\\_future<T>
"""
const aws_future_callback_fn = Cvoid

mutable struct aws_future_impl end

"""
    aws_future_impl_acquire(promise)

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

### Prototype
```c
void *aws_future_impl_get_result_address(const struct aws_future_impl *future);
```
"""
function aws_future_impl_get_result_address(future)
    ccall((:aws_future_impl_get_result_address, libaws_c_io), Ptr{Cvoid}, (Ptr{aws_future_impl},), future)
end

# typedef void ( aws_future_impl_result_clean_up_fn ) ( void * result_addr )
const aws_future_impl_result_clean_up_fn = Cvoid

"""
    aws_future_impl_new_by_value_with_clean_up(alloc, sizeof_result, result_clean_up)

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

### Prototype
```c
struct aws_future_impl *aws_future_impl_new_pointer(struct aws_allocator *alloc);
```
"""
function aws_future_impl_new_pointer(alloc)
    ccall((:aws_future_impl_new_pointer, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_allocator},), alloc)
end

# typedef void ( aws_future_impl_result_destroy_fn ) ( void * result )
const aws_future_impl_result_destroy_fn = Cvoid

"""
    aws_future_impl_new_pointer_with_destroy(alloc, result_destroy)

### Prototype
```c
struct aws_future_impl *aws_future_impl_new_pointer_with_destroy( struct aws_allocator *alloc, aws_future_impl_result_destroy_fn *result_destroy);
```
"""
function aws_future_impl_new_pointer_with_destroy(alloc, result_destroy)
    ccall((:aws_future_impl_new_pointer_with_destroy, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_allocator}, Ptr{aws_future_impl_result_destroy_fn}), alloc, result_destroy)
end

# typedef void * ( aws_future_impl_result_release_fn ) ( void * result )
const aws_future_impl_result_release_fn = Cvoid

"""
    aws_future_impl_new_pointer_with_release(alloc, result_release)

### Prototype
```c
struct aws_future_impl *aws_future_impl_new_pointer_with_release( struct aws_allocator *alloc, aws_future_impl_result_release_fn *result_release);
```
"""
function aws_future_impl_new_pointer_with_release(alloc, result_release)
    ccall((:aws_future_impl_new_pointer_with_release, libaws_c_io), Ptr{aws_future_impl}, (Ptr{aws_allocator}, Ptr{aws_future_impl_result_release_fn}), alloc, result_release)
end

mutable struct aws_future_size end

"""
    aws_future_size_new(alloc)

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

### Prototype
```c
AWS_FUTURE_T_BY_VALUE_DECLARATION(aws_future_bool, bool, AWS_IO_API);
```
"""
function aws_future_bool_wait(future, timeout_ns)
    ccall((:aws_future_bool_wait, libaws_c_io), Bool, (Ptr{aws_future_bool}, UInt64), future, timeout_ns)
end

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

### Prototype
```c
AWS_FUTURE_T_DECLARATION_END(aws_future_void, AWS_IO_API);
```
"""
function aws_future_void_wait(future, timeout_ns)
    ccall((:aws_future_void_wait, libaws_c_io), Bool, (Ptr{aws_future_void}, UInt64), future, timeout_ns)
end

@cenum aws_address_record_type::UInt32 begin
    AWS_ADDRESS_RECORD_TYPE_A = 0
    AWS_ADDRESS_RECORD_TYPE_AAAA = 1
end

@cenum aws_get_host_address_flags::UInt32 begin
    AWS_GET_HOST_ADDRESS_COUNT_RECORD_TYPE_A = 1
    AWS_GET_HOST_ADDRESS_COUNT_RECORD_TYPE_AAAA = 2
end

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

mutable struct aws_host_listener end

mutable struct aws_host_listener_options end

struct aws_host_resolver_purge_host_options
    host::Ptr{aws_string}
    on_host_purge_complete_callback::Ptr{aws_simple_completion_callback}
    user_data::Ptr{Cvoid}
end

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

\\deprecated Use purge\\_cache\\_with\\_callback instead calls purge\\_cache on the vtable.

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

### Returns
default host resolution config
### Prototype
```c
struct aws_host_resolution_config aws_host_resolver_init_default_resolution_config(void);
```
"""
function aws_host_resolver_init_default_resolution_config()
    ccall((:aws_host_resolver_init_default_resolution_config, libaws_c_io), aws_host_resolution_config, ())
end

@cenum aws_io_errors::UInt32 begin
    AWS_IO_CHANNEL_ERROR_ERROR_CANT_ACCEPT_INPUT = 1024
    AWS_IO_CHANNEL_UNKNOWN_MESSAGE_TYPE = 1025
    AWS_IO_CHANNEL_READ_WOULD_EXCEED_WINDOW = 1026
    AWS_IO_EVENT_LOOP_ALREADY_ASSIGNED = 1027
    AWS_IO_EVENT_LOOP_SHUTDOWN = 1028
    AWS_IO_TLS_ERROR_NEGOTIATION_FAILURE = 1029
    AWS_IO_TLS_ERROR_NOT_NEGOTIATED = 1030
    AWS_IO_TLS_ERROR_WRITE_FAILURE = 1031
    AWS_IO_TLS_ERROR_ALERT_RECEIVED = 1032
    AWS_IO_TLS_CTX_ERROR = 1033
    AWS_IO_TLS_VERSION_UNSUPPORTED = 1034
    AWS_IO_TLS_CIPHER_PREF_UNSUPPORTED = 1035
    AWS_IO_MISSING_ALPN_MESSAGE = 1036
    AWS_IO_UNHANDLED_ALPN_PROTOCOL_MESSAGE = 1037
    AWS_IO_FILE_VALIDATION_FAILURE = 1038
    AWS_ERROR_IO_EVENT_LOOP_THREAD_ONLY = 1039
    AWS_ERROR_IO_ALREADY_SUBSCRIBED = 1040
    AWS_ERROR_IO_NOT_SUBSCRIBED = 1041
    AWS_ERROR_IO_OPERATION_CANCELLED = 1042
    AWS_IO_READ_WOULD_BLOCK = 1043
    AWS_IO_BROKEN_PIPE = 1044
    AWS_IO_SOCKET_UNSUPPORTED_ADDRESS_FAMILY = 1045
    AWS_IO_SOCKET_INVALID_OPERATION_FOR_TYPE = 1046
    AWS_IO_SOCKET_CONNECTION_REFUSED = 1047
    AWS_IO_SOCKET_TIMEOUT = 1048
    AWS_IO_SOCKET_NO_ROUTE_TO_HOST = 1049
    AWS_IO_SOCKET_NETWORK_DOWN = 1050
    AWS_IO_SOCKET_CLOSED = 1051
    AWS_IO_SOCKET_NOT_CONNECTED = 1052
    AWS_IO_SOCKET_INVALID_OPTIONS = 1053
    AWS_IO_SOCKET_ADDRESS_IN_USE = 1054
    AWS_IO_SOCKET_INVALID_ADDRESS = 1055
    AWS_IO_SOCKET_ILLEGAL_OPERATION_FOR_STATE = 1056
    AWS_IO_SOCKET_CONNECT_ABORTED = 1057
    AWS_IO_DNS_QUERY_FAILED = 1058
    AWS_IO_DNS_INVALID_NAME = 1059
    AWS_IO_DNS_NO_ADDRESS_FOR_HOST = 1060
    AWS_IO_DNS_HOST_REMOVED_FROM_CACHE = 1061
    AWS_IO_STREAM_INVALID_SEEK_POSITION = 1062
    AWS_IO_STREAM_READ_FAILED = 1063
    DEPRECATED_AWS_IO_INVALID_FILE_HANDLE = 1064
    AWS_IO_SHARED_LIBRARY_LOAD_FAILURE = 1065
    AWS_IO_SHARED_LIBRARY_FIND_SYMBOL_FAILURE = 1066
    AWS_IO_TLS_NEGOTIATION_TIMEOUT = 1067
    AWS_IO_TLS_ALERT_NOT_GRACEFUL = 1068
    AWS_IO_MAX_RETRIES_EXCEEDED = 1069
    AWS_IO_RETRY_PERMISSION_DENIED = 1070
    AWS_IO_TLS_DIGEST_ALGORITHM_UNSUPPORTED = 1071
    AWS_IO_TLS_SIGNATURE_ALGORITHM_UNSUPPORTED = 1072
    AWS_ERROR_PKCS11_VERSION_UNSUPPORTED = 1073
    AWS_ERROR_PKCS11_TOKEN_NOT_FOUND = 1074
    AWS_ERROR_PKCS11_KEY_NOT_FOUND = 1075
    AWS_ERROR_PKCS11_KEY_TYPE_UNSUPPORTED = 1076
    AWS_ERROR_PKCS11_UNKNOWN_CRYPTOKI_RETURN_VALUE = 1077
    AWS_ERROR_PKCS11_CKR_CANCEL = 1078
    AWS_ERROR_PKCS11_CKR_HOST_MEMORY = 1079
    AWS_ERROR_PKCS11_CKR_SLOT_ID_INVALID = 1080
    AWS_ERROR_PKCS11_CKR_GENERAL_ERROR = 1081
    AWS_ERROR_PKCS11_CKR_FUNCTION_FAILED = 1082
    AWS_ERROR_PKCS11_CKR_ARGUMENTS_BAD = 1083
    AWS_ERROR_PKCS11_CKR_NO_EVENT = 1084
    AWS_ERROR_PKCS11_CKR_NEED_TO_CREATE_THREADS = 1085
    AWS_ERROR_PKCS11_CKR_CANT_LOCK = 1086
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_READ_ONLY = 1087
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_SENSITIVE = 1088
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_TYPE_INVALID = 1089
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_VALUE_INVALID = 1090
    AWS_ERROR_PKCS11_CKR_ACTION_PROHIBITED = 1091
    AWS_ERROR_PKCS11_CKR_DATA_INVALID = 1092
    AWS_ERROR_PKCS11_CKR_DATA_LEN_RANGE = 1093
    AWS_ERROR_PKCS11_CKR_DEVICE_ERROR = 1094
    AWS_ERROR_PKCS11_CKR_DEVICE_MEMORY = 1095
    AWS_ERROR_PKCS11_CKR_DEVICE_REMOVED = 1096
    AWS_ERROR_PKCS11_CKR_ENCRYPTED_DATA_INVALID = 1097
    AWS_ERROR_PKCS11_CKR_ENCRYPTED_DATA_LEN_RANGE = 1098
    AWS_ERROR_PKCS11_CKR_FUNCTION_CANCELED = 1099
    AWS_ERROR_PKCS11_CKR_FUNCTION_NOT_PARALLEL = 1100
    AWS_ERROR_PKCS11_CKR_FUNCTION_NOT_SUPPORTED = 1101
    AWS_ERROR_PKCS11_CKR_KEY_HANDLE_INVALID = 1102
    AWS_ERROR_PKCS11_CKR_KEY_SIZE_RANGE = 1103
    AWS_ERROR_PKCS11_CKR_KEY_TYPE_INCONSISTENT = 1104
    AWS_ERROR_PKCS11_CKR_KEY_NOT_NEEDED = 1105
    AWS_ERROR_PKCS11_CKR_KEY_CHANGED = 1106
    AWS_ERROR_PKCS11_CKR_KEY_NEEDED = 1107
    AWS_ERROR_PKCS11_CKR_KEY_INDIGESTIBLE = 1108
    AWS_ERROR_PKCS11_CKR_KEY_FUNCTION_NOT_PERMITTED = 1109
    AWS_ERROR_PKCS11_CKR_KEY_NOT_WRAPPABLE = 1110
    AWS_ERROR_PKCS11_CKR_KEY_UNEXTRACTABLE = 1111
    AWS_ERROR_PKCS11_CKR_MECHANISM_INVALID = 1112
    AWS_ERROR_PKCS11_CKR_MECHANISM_PARAM_INVALID = 1113
    AWS_ERROR_PKCS11_CKR_OBJECT_HANDLE_INVALID = 1114
    AWS_ERROR_PKCS11_CKR_OPERATION_ACTIVE = 1115
    AWS_ERROR_PKCS11_CKR_OPERATION_NOT_INITIALIZED = 1116
    AWS_ERROR_PKCS11_CKR_PIN_INCORRECT = 1117
    AWS_ERROR_PKCS11_CKR_PIN_INVALID = 1118
    AWS_ERROR_PKCS11_CKR_PIN_LEN_RANGE = 1119
    AWS_ERROR_PKCS11_CKR_PIN_EXPIRED = 1120
    AWS_ERROR_PKCS11_CKR_PIN_LOCKED = 1121
    AWS_ERROR_PKCS11_CKR_SESSION_CLOSED = 1122
    AWS_ERROR_PKCS11_CKR_SESSION_COUNT = 1123
    AWS_ERROR_PKCS11_CKR_SESSION_HANDLE_INVALID = 1124
    AWS_ERROR_PKCS11_CKR_SESSION_PARALLEL_NOT_SUPPORTED = 1125
    AWS_ERROR_PKCS11_CKR_SESSION_READ_ONLY = 1126
    AWS_ERROR_PKCS11_CKR_SESSION_EXISTS = 1127
    AWS_ERROR_PKCS11_CKR_SESSION_READ_ONLY_EXISTS = 1128
    AWS_ERROR_PKCS11_CKR_SESSION_READ_WRITE_SO_EXISTS = 1129
    AWS_ERROR_PKCS11_CKR_SIGNATURE_INVALID = 1130
    AWS_ERROR_PKCS11_CKR_SIGNATURE_LEN_RANGE = 1131
    AWS_ERROR_PKCS11_CKR_TEMPLATE_INCOMPLETE = 1132
    AWS_ERROR_PKCS11_CKR_TEMPLATE_INCONSISTENT = 1133
    AWS_ERROR_PKCS11_CKR_TOKEN_NOT_PRESENT = 1134
    AWS_ERROR_PKCS11_CKR_TOKEN_NOT_RECOGNIZED = 1135
    AWS_ERROR_PKCS11_CKR_TOKEN_WRITE_PROTECTED = 1136
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_HANDLE_INVALID = 1137
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_SIZE_RANGE = 1138
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_TYPE_INCONSISTENT = 1139
    AWS_ERROR_PKCS11_CKR_USER_ALREADY_LOGGED_IN = 1140
    AWS_ERROR_PKCS11_CKR_USER_NOT_LOGGED_IN = 1141
    AWS_ERROR_PKCS11_CKR_USER_PIN_NOT_INITIALIZED = 1142
    AWS_ERROR_PKCS11_CKR_USER_TYPE_INVALID = 1143
    AWS_ERROR_PKCS11_CKR_USER_ANOTHER_ALREADY_LOGGED_IN = 1144
    AWS_ERROR_PKCS11_CKR_USER_TOO_MANY_TYPES = 1145
    AWS_ERROR_PKCS11_CKR_WRAPPED_KEY_INVALID = 1146
    AWS_ERROR_PKCS11_CKR_WRAPPED_KEY_LEN_RANGE = 1147
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_HANDLE_INVALID = 1148
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_SIZE_RANGE = 1149
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_TYPE_INCONSISTENT = 1150
    AWS_ERROR_PKCS11_CKR_RANDOM_SEED_NOT_SUPPORTED = 1151
    AWS_ERROR_PKCS11_CKR_RANDOM_NO_RNG = 1152
    AWS_ERROR_PKCS11_CKR_DOMAIN_PARAMS_INVALID = 1153
    AWS_ERROR_PKCS11_CKR_CURVE_NOT_SUPPORTED = 1154
    AWS_ERROR_PKCS11_CKR_BUFFER_TOO_SMALL = 1155
    AWS_ERROR_PKCS11_CKR_SAVED_STATE_INVALID = 1156
    AWS_ERROR_PKCS11_CKR_INFORMATION_SENSITIVE = 1157
    AWS_ERROR_PKCS11_CKR_STATE_UNSAVEABLE = 1158
    AWS_ERROR_PKCS11_CKR_CRYPTOKI_NOT_INITIALIZED = 1159
    AWS_ERROR_PKCS11_CKR_CRYPTOKI_ALREADY_INITIALIZED = 1160
    AWS_ERROR_PKCS11_CKR_MUTEX_BAD = 1161
    AWS_ERROR_PKCS11_CKR_MUTEX_NOT_LOCKED = 1162
    AWS_ERROR_PKCS11_CKR_NEW_PIN_MODE = 1163
    AWS_ERROR_PKCS11_CKR_NEXT_OTP = 1164
    AWS_ERROR_PKCS11_CKR_EXCEEDED_MAX_ITERATIONS = 1165
    AWS_ERROR_PKCS11_CKR_FIPS_SELF_TEST_FAILED = 1166
    AWS_ERROR_PKCS11_CKR_LIBRARY_LOAD_FAILED = 1167
    AWS_ERROR_PKCS11_CKR_PIN_TOO_WEAK = 1168
    AWS_ERROR_PKCS11_CKR_PUBLIC_KEY_INVALID = 1169
    AWS_ERROR_PKCS11_CKR_FUNCTION_REJECTED = 1170
    AWS_ERROR_IO_PINNED_EVENT_LOOP_MISMATCH = 1171
    AWS_ERROR_PKCS11_ENCODING_ERROR = 1172
    AWS_IO_TLS_ERROR_DEFAULT_TRUST_STORE_NOT_FOUND = 1173
    AWS_IO_STREAM_SEEK_FAILED = 1174
    AWS_IO_STREAM_GET_LENGTH_FAILED = 1175
    AWS_IO_STREAM_SEEK_UNSUPPORTED = 1176
    AWS_IO_STREAM_GET_LENGTH_UNSUPPORTED = 1177
    AWS_IO_TLS_ERROR_READ_FAILURE = 1178
    AWS_ERROR_PEM_MALFORMED = 1179
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

### Prototype
```c
void aws_io_fatal_assert_library_initialized(void);
```
"""
function aws_io_fatal_assert_library_initialized()
    ccall((:aws_io_fatal_assert_library_initialized, libaws_c_io), Cvoid, ())
end

const aws_thread_id_t = pthread_t

"""
    aws_logger_vtable

We separate the log level function from the log call itself so that we can do the filter check in the macros (see below)

By doing so, we make it so that the variadic format arguments are not even evaluated if the filter check does not succeed.
"""
struct aws_logger_vtable
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{aws_logger_vtable}, f::Symbol)
    f === :log && return Ptr{Ptr{Cvoid}}(x + 0)
    f === :get_log_level && return Ptr{Ptr{Cvoid}}(x + 4)
    f === :clean_up && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :set_log_level && return Ptr{Ptr{Cvoid}}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::aws_logger_vtable, f::Symbol)
    r = Ref{aws_logger_vtable}(x)
    ptr = Base.unsafe_convert(Ptr{aws_logger_vtable}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_logger_vtable}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_logger
    vtable::Ptr{aws_logger_vtable}
    allocator::Ptr{aws_allocator}
    p_impl::Ptr{Cvoid}
end

"""
    aws_logger_get()

Gets the aws logger used globally across the process.

### Prototype
```c
struct aws_logger *aws_logger_get(void);
```
"""
function aws_logger_get()
    ccall((:aws_logger_get, libaws_c_io), Ptr{aws_logger}, ())
end

"""
    aws_string_eq(a, b)

Returns true if bytes of string are the same, false otherwise.

### Prototype
```c
bool aws_string_eq(const struct aws_string *a, const struct aws_string *b);
```
"""
function aws_string_eq(a, b)
    ccall((:aws_string_eq, libaws_c_io), Bool, (Ptr{aws_string}, Ptr{aws_string}), a, b)
end

"""
    aws_string_eq_ignore_case(a, b)

Returns true if bytes of string are equivalent, using a case-insensitive comparison.

### Prototype
```c
bool aws_string_eq_ignore_case(const struct aws_string *a, const struct aws_string *b);
```
"""
function aws_string_eq_ignore_case(a, b)
    ccall((:aws_string_eq_ignore_case, libaws_c_io), Bool, (Ptr{aws_string}, Ptr{aws_string}), a, b)
end

"""
    aws_string_eq_byte_cursor(str, cur)

Returns true if bytes of string and cursor are the same, false otherwise.

### Prototype
```c
bool aws_string_eq_byte_cursor(const struct aws_string *str, const struct aws_byte_cursor *cur);
```
"""
function aws_string_eq_byte_cursor(str, cur)
    ccall((:aws_string_eq_byte_cursor, libaws_c_io), Bool, (Ptr{aws_string}, Ptr{aws_byte_cursor}), str, cur)
end

"""
    aws_string_eq_byte_cursor_ignore_case(str, cur)

Returns true if bytes of string and cursor are equivalent, using a case-insensitive comparison.

### Prototype
```c
bool aws_string_eq_byte_cursor_ignore_case(const struct aws_string *str, const struct aws_byte_cursor *cur);
```
"""
function aws_string_eq_byte_cursor_ignore_case(str, cur)
    ccall((:aws_string_eq_byte_cursor_ignore_case, libaws_c_io), Bool, (Ptr{aws_string}, Ptr{aws_byte_cursor}), str, cur)
end

"""
    aws_string_eq_byte_buf(str, buf)

Returns true if bytes of string and buffer are the same, false otherwise.

### Prototype
```c
bool aws_string_eq_byte_buf(const struct aws_string *str, const struct aws_byte_buf *buf);
```
"""
function aws_string_eq_byte_buf(str, buf)
    ccall((:aws_string_eq_byte_buf, libaws_c_io), Bool, (Ptr{aws_string}, Ptr{aws_byte_buf}), str, buf)
end

"""
    aws_string_eq_byte_buf_ignore_case(str, buf)

Returns true if bytes of string and buffer are equivalent, using a case-insensitive comparison.

### Prototype
```c
bool aws_string_eq_byte_buf_ignore_case(const struct aws_string *str, const struct aws_byte_buf *buf);
```
"""
function aws_string_eq_byte_buf_ignore_case(str, buf)
    ccall((:aws_string_eq_byte_buf_ignore_case, libaws_c_io), Bool, (Ptr{aws_string}, Ptr{aws_byte_buf}), str, buf)
end

"""
    aws_string_eq_c_str(str, c_str)

### Prototype
```c
bool aws_string_eq_c_str(const struct aws_string *str, const char *c_str);
```
"""
function aws_string_eq_c_str(str, c_str)
    ccall((:aws_string_eq_c_str, libaws_c_io), Bool, (Ptr{aws_string}, Ptr{Cchar}), str, c_str)
end

"""
    aws_string_eq_c_str_ignore_case(str, c_str)

Returns true if bytes of strings are equivalent, using a case-insensitive comparison.

### Prototype
```c
bool aws_string_eq_c_str_ignore_case(const struct aws_string *str, const char *c_str);
```
"""
function aws_string_eq_c_str_ignore_case(str, c_str)
    ccall((:aws_string_eq_c_str_ignore_case, libaws_c_io), Bool, (Ptr{aws_string}, Ptr{Cchar}), str, c_str)
end

"""
    aws_string_new_from_c_str(allocator, c_str)

Constructor functions which copy data from null-terminated C-string or array of bytes.

### Prototype
```c
struct aws_string *aws_string_new_from_c_str(struct aws_allocator *allocator, const char *c_str);
```
"""
function aws_string_new_from_c_str(allocator, c_str)
    ccall((:aws_string_new_from_c_str, libaws_c_io), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{Cchar}), allocator, c_str)
end

"""
    aws_string_new_from_array(allocator, bytes, len)

Allocate a new string with the same contents as array.

### Prototype
```c
struct aws_string *aws_string_new_from_array(struct aws_allocator *allocator, const uint8_t *bytes, size_t len);
```
"""
function aws_string_new_from_array(allocator, bytes, len)
    ccall((:aws_string_new_from_array, libaws_c_io), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{UInt8}, Csize_t), allocator, bytes, len)
end

"""
    aws_string_new_from_string(allocator, str)

Allocate a new string with the same contents as another string.

### Prototype
```c
struct aws_string *aws_string_new_from_string(struct aws_allocator *allocator, const struct aws_string *str);
```
"""
function aws_string_new_from_string(allocator, str)
    ccall((:aws_string_new_from_string, libaws_c_io), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, str)
end

"""
    aws_string_new_from_cursor(allocator, cursor)

Allocate a new string with the same contents as cursor.

### Prototype
```c
struct aws_string *aws_string_new_from_cursor(struct aws_allocator *allocator, const struct aws_byte_cursor *cursor);
```
"""
function aws_string_new_from_cursor(allocator, cursor)
    ccall((:aws_string_new_from_cursor, libaws_c_io), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, cursor)
end

"""
    aws_string_new_from_buf(allocator, buf)

Allocate a new string with the same contents as buf.

### Prototype
```c
struct aws_string *aws_string_new_from_buf(struct aws_allocator *allocator, const struct aws_byte_buf *buf);
```
"""
function aws_string_new_from_buf(allocator, buf)
    ccall((:aws_string_new_from_buf, libaws_c_io), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_buf}), allocator, buf)
end

"""
    aws_string_destroy(str)

Deallocate string.

### Prototype
```c
void aws_string_destroy(struct aws_string *str);
```
"""
function aws_string_destroy(str)
    ccall((:aws_string_destroy, libaws_c_io), Cvoid, (Ptr{aws_string},), str)
end

"""
    aws_string_destroy_secure(str)

Zeroes out the data bytes of string and then deallocates the memory. Not safe to run on a string created with [`AWS_STATIC_STRING_FROM_LITERAL`](@ref).

### Prototype
```c
void aws_string_destroy_secure(struct aws_string *str);
```
"""
function aws_string_destroy_secure(str)
    ccall((:aws_string_destroy_secure, libaws_c_io), Cvoid, (Ptr{aws_string},), str)
end

"""
    aws_string_compare(a, b)

Compares lexicographical ordering of two strings. This is a binary byte-by-byte comparison, treating bytes as unsigned integers. It is suitable for either textual or binary data and is unaware of unicode or any other byte encoding. If both strings are identical in the bytes of the shorter string, then the longer string is lexicographically after the shorter.

Returns a positive number if string a > string b. (i.e., string a is lexicographically after string b.) Returns zero if string a = string b. Returns negative number if string a < string b.

### Prototype
```c
int aws_string_compare(const struct aws_string *a, const struct aws_string *b);
```
"""
function aws_string_compare(a, b)
    ccall((:aws_string_compare, libaws_c_io), Cint, (Ptr{aws_string}, Ptr{aws_string}), a, b)
end

"""
    aws_array_list_comparator_string(a, b)

A convenience function for sorting lists of (const struct [`aws_string`](@ref) *) elements. This can be used as a comparator for [`aws_array_list_sort`](@ref). It is just a simple wrapper around [`aws_string_compare`](@ref).

### Prototype
```c
int aws_array_list_comparator_string(const void *a, const void *b);
```
"""
function aws_array_list_comparator_string(a, b)
    ccall((:aws_array_list_comparator_string, libaws_c_io), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end

"""
    aws_byte_buf_write_from_whole_string(buf, src)

Copies all bytes from string to buf.

On success, returns true and updates the buf pointer/length accordingly. If there is insufficient space in the buf, returns false, leaving the buf unchanged.

### Prototype
```c
bool aws_byte_buf_write_from_whole_string( struct aws_byte_buf *AWS_RESTRICT buf, const struct aws_string *AWS_RESTRICT src);
```
"""
function aws_byte_buf_write_from_whole_string(buf, src)
    ccall((:aws_byte_buf_write_from_whole_string, libaws_c_io), Bool, (Ptr{aws_byte_buf}, Ptr{aws_string}), buf, src)
end

"""
    aws_byte_cursor_from_string(src)

Creates an [`aws_byte_cursor`](@ref) from an existing string.

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_string(const struct aws_string *src);
```
"""
function aws_byte_cursor_from_string(src)
    ccall((:aws_byte_cursor_from_string, libaws_c_io), aws_byte_cursor, (Ptr{aws_string},), src)
end

"""
    aws_string_clone_or_reuse(allocator, str)

If the string was dynamically allocated, clones it. If the string was statically allocated (i.e. has no allocator), returns the original string.

### Prototype
```c
struct aws_string *aws_string_clone_or_reuse(struct aws_allocator *allocator, const struct aws_string *str);
```
"""
function aws_string_clone_or_reuse(allocator, str)
    ccall((:aws_string_clone_or_reuse, libaws_c_io), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, str)
end

"""
    aws_secure_strlen(str, max_read_len, str_len)

Computes the length of a c string in bytes assuming the character set is either ASCII or UTF-8. If no NULL character is found within max\\_read\\_len of str, AWS\\_ERROR\\_C\\_STRING\\_BUFFER\\_NOT\\_NULL\\_TERMINATED is raised. Otherwise, str\\_len will contain the string length minus the NULL character, and [`AWS_OP_SUCCESS`](@ref) will be returned.

### Prototype
```c
int aws_secure_strlen(const char *str, size_t max_read_len, size_t *str_len);
```
"""
function aws_secure_strlen(str, max_read_len, str_len)
    ccall((:aws_secure_strlen, libaws_c_io), Cint, (Ptr{Cchar}, Csize_t, Ptr{Csize_t}), str, max_read_len, str_len)
end

"""
    aws_string_bytes(str)

Equivalent to str->bytes.

### Prototype
```c
AWS_STATIC_IMPL const uint8_t *aws_string_bytes(const struct aws_string *str);
```
"""
function aws_string_bytes(str)
    ccall((:aws_string_bytes, libaws_c_io), Ptr{UInt8}, (Ptr{aws_string},), str)
end

"""
    aws_string_c_str(str)

Equivalent to `(const char *)str->bytes`.

### Prototype
```c
AWS_STATIC_IMPL const char *aws_string_c_str(const struct aws_string *str);
```
"""
function aws_string_c_str(str)
    ccall((:aws_string_c_str, libaws_c_io), Ptr{Cchar}, (Ptr{aws_string},), str)
end

"""
    aws_string_is_valid(str)

Evaluates the set of properties that define the shape of all valid [`aws_string`](@ref) structures. It is also a cheap check, in the sense it run in constant time (i.e., no loops or recursion).

### Prototype
```c
AWS_STATIC_IMPL bool aws_string_is_valid(const struct aws_string *str);
```
"""
function aws_string_is_valid(str)
    ccall((:aws_string_is_valid, libaws_c_io), Bool, (Ptr{aws_string},), str)
end

"""
    aws_c_string_is_valid(str)

Best-effort checks [`aws_string`](@ref) invariants, when the str->len is unknown

### Prototype
```c
AWS_STATIC_IMPL bool aws_c_string_is_valid(const char *str);
```
"""
function aws_c_string_is_valid(str)
    ccall((:aws_c_string_is_valid, libaws_c_io), Bool, (Ptr{Cchar},), str)
end

"""
    aws_char_is_space(c)

Evaluates if a char is a white character.

### Prototype
```c
AWS_STATIC_IMPL bool aws_char_is_space(uint8_t c);
```
"""
function aws_char_is_space(c)
    ccall((:aws_char_is_space, libaws_c_io), Bool, (UInt8,), c)
end

@cenum aws_thread_detach_state::UInt32 begin
    AWS_THREAD_NOT_CREATED = 1
    AWS_THREAD_JOINABLE = 2
    AWS_THREAD_JOIN_COMPLETED = 3
    AWS_THREAD_MANAGED = 4
end

const aws_thread_once = pthread_once_t

struct aws_thread
    allocator::Ptr{aws_allocator}
    detach_state::aws_thread_detach_state
    thread_id::aws_thread_id_t
end

"""
    aws_default_thread_options()

Returns an instance of system default thread options.

### Prototype
```c
const struct aws_thread_options *aws_default_thread_options(void);
```
"""
function aws_default_thread_options()
    ccall((:aws_default_thread_options, libaws_c_io), Ptr{aws_thread_options}, ())
end

"""
    aws_thread_call_once(flag, call_once, user_data)

### Prototype
```c
void aws_thread_call_once(aws_thread_once *flag, void (*call_once)(void *), void *user_data);
```
"""
function aws_thread_call_once(flag, call_once, user_data)
    ccall((:aws_thread_call_once, libaws_c_io), Cvoid, (Ptr{aws_thread_once}, Ptr{Cvoid}, Ptr{Cvoid}), flag, call_once, user_data)
end

"""
    aws_thread_init(thread, allocator)

Initializes a new platform specific thread object struct (not the os-level thread itself).

### Prototype
```c
int aws_thread_init(struct aws_thread *thread, struct aws_allocator *allocator);
```
"""
function aws_thread_init(thread, allocator)
    ccall((:aws_thread_init, libaws_c_io), Cint, (Ptr{aws_thread}, Ptr{aws_allocator}), thread, allocator)
end

"""
    aws_thread_launch(thread, func, arg, options)

Creates an OS level thread and associates it with func. context will be passed to func when it is executed. options will be applied to the thread if they are applicable for the platform.

After launch, you may join on the thread. A successfully launched thread must have clean\\_up called on it in order to avoid a handle leak. If you do not join before calling clean\\_up, the thread will become detached.

Managed threads must not have join or clean\\_up called on them by external code.

### Prototype
```c
int aws_thread_launch( struct aws_thread *thread, void (*func)(void *arg), void *arg, const struct aws_thread_options *options);
```
"""
function aws_thread_launch(thread, func, arg, options)
    ccall((:aws_thread_launch, libaws_c_io), Cint, (Ptr{aws_thread}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{aws_thread_options}), thread, func, arg, options)
end

"""
    aws_thread_get_id(thread)

Gets the id of thread

### Prototype
```c
aws_thread_id_t aws_thread_get_id(struct aws_thread *thread);
```
"""
function aws_thread_get_id(thread)
    ccall((:aws_thread_get_id, libaws_c_io), aws_thread_id_t, (Ptr{aws_thread},), thread)
end

"""
    aws_thread_get_detach_state(thread)

Gets the detach state of the thread. For example, is it safe to call join on this thread? Has it been detached()?

### Prototype
```c
enum aws_thread_detach_state aws_thread_get_detach_state(struct aws_thread *thread);
```
"""
function aws_thread_get_detach_state(thread)
    ccall((:aws_thread_get_detach_state, libaws_c_io), aws_thread_detach_state, (Ptr{aws_thread},), thread)
end

"""
    aws_thread_join(thread)

Joins the calling thread to a thread instance. Returns when thread is finished. Calling this from the associated OS thread will cause a deadlock.

### Prototype
```c
int aws_thread_join(struct aws_thread *thread);
```
"""
function aws_thread_join(thread)
    ccall((:aws_thread_join, libaws_c_io), Cint, (Ptr{aws_thread},), thread)
end

"""
    aws_thread_join_all_managed()

Blocking call that waits for all managed threads to complete their join call. This can only be called from the main thread or a non-managed thread.

This gets called automatically from library cleanup.

By default the wait is unbounded, but that default can be overridden via [`aws_thread_set_managed_join_timeout_ns`](@ref)()

### Prototype
```c
int aws_thread_join_all_managed(void);
```
"""
function aws_thread_join_all_managed()
    ccall((:aws_thread_join_all_managed, libaws_c_io), Cint, ())
end

"""
    aws_thread_set_managed_join_timeout_ns(timeout_in_ns)

Overrides how long, in nanoseconds, that [`aws_thread_join_all_managed`](@ref) will wait for threads to complete. A value of zero will result in an unbounded wait.

### Prototype
```c
void aws_thread_set_managed_join_timeout_ns(uint64_t timeout_in_ns);
```
"""
function aws_thread_set_managed_join_timeout_ns(timeout_in_ns)
    ccall((:aws_thread_set_managed_join_timeout_ns, libaws_c_io), Cvoid, (UInt64,), timeout_in_ns)
end

"""
    aws_thread_clean_up(thread)

Cleans up the thread handle. Don't call this on a managed thread. If you wish to join the thread, you must join before calling this function.

### Prototype
```c
void aws_thread_clean_up(struct aws_thread *thread);
```
"""
function aws_thread_clean_up(thread)
    ccall((:aws_thread_clean_up, libaws_c_io), Cvoid, (Ptr{aws_thread},), thread)
end

"""
    aws_thread_current_thread_id()

Returns the thread id of the calling thread.

### Prototype
```c
aws_thread_id_t aws_thread_current_thread_id(void);
```
"""
function aws_thread_current_thread_id()
    ccall((:aws_thread_current_thread_id, libaws_c_io), aws_thread_id_t, ())
end

"""
    aws_thread_thread_id_equal(t1, t2)

Compare thread ids.

### Prototype
```c
bool aws_thread_thread_id_equal(aws_thread_id_t t1, aws_thread_id_t t2);
```
"""
function aws_thread_thread_id_equal(t1, t2)
    ccall((:aws_thread_thread_id_equal, libaws_c_io), Bool, (aws_thread_id_t, aws_thread_id_t), t1, t2)
end

"""
    aws_thread_current_sleep(nanos)

Sleeps the current thread by nanos.

### Prototype
```c
void aws_thread_current_sleep(uint64_t nanos);
```
"""
function aws_thread_current_sleep(nanos)
    ccall((:aws_thread_current_sleep, libaws_c_io), Cvoid, (UInt64,), nanos)
end

# typedef void ( aws_thread_atexit_fn ) ( void * user_data )
const aws_thread_atexit_fn = Cvoid

"""
    aws_thread_current_at_exit(callback, user_data)

Adds a callback to the chain to be called when the current thread joins. Callbacks are called from the current thread, in the reverse order they were added, after the thread function returns. If not called from within an [`aws_thread`](@ref), has no effect.

### Prototype
```c
int aws_thread_current_at_exit(aws_thread_atexit_fn *callback, void *user_data);
```
"""
function aws_thread_current_at_exit(callback, user_data)
    ccall((:aws_thread_current_at_exit, libaws_c_io), Cint, (Ptr{aws_thread_atexit_fn}, Ptr{Cvoid}), callback, user_data)
end

"""
    aws_thread_increment_unjoined_count()

Increments the count of unjoined threads in the managed thread system. Used by managed threads and event loop threads. Additional usage requires the user to join corresponding threads themselves and correctly increment/decrement even in the face of launch/join errors.

[`aws_thread_join_all_managed`](@ref)() will not return until this count has gone to zero.

### Prototype
```c
void aws_thread_increment_unjoined_count(void);
```
"""
function aws_thread_increment_unjoined_count()
    ccall((:aws_thread_increment_unjoined_count, libaws_c_io), Cvoid, ())
end

"""
    aws_thread_decrement_unjoined_count()

Decrements the count of unjoined threads in the managed thread system. Used by managed threads and event loop threads. Additional usage requires the user to join corresponding threads themselves and correctly increment/decrement even in the face of launch/join errors.

[`aws_thread_join_all_managed`](@ref)() will not return until this count has gone to zero.

### Prototype
```c
void aws_thread_decrement_unjoined_count(void);
```
"""
function aws_thread_decrement_unjoined_count()
    ccall((:aws_thread_decrement_unjoined_count, libaws_c_io), Cvoid, ())
end

"""
    aws_thread_current_name(allocator, out_name)

Gets name of the current thread. Caller is responsible for destroying returned string. If thread does not have a name, [`AWS_OP_SUCCESS`](@ref) is returned and out\\_name is set to NULL. If underlying OS call fails, AWS\\_ERROR\\_SYS\\_CALL\\_FAILURE will be raised If OS does not support getting thread name, AWS\\_ERROR\\_PLATFORM\\_NOT\\_SUPPORTED will be raised

### Prototype
```c
int aws_thread_current_name(struct aws_allocator *allocator, struct aws_string **out_name);
```
"""
function aws_thread_current_name(allocator, out_name)
    ccall((:aws_thread_current_name, libaws_c_io), Cint, (Ptr{aws_allocator}, Ptr{Ptr{aws_string}}), allocator, out_name)
end

"""
    aws_thread_name(allocator, thread_id, out_name)

Gets name of the thread. Caller is responsible for destroying returned string. If thread does not have a name, [`AWS_OP_SUCCESS`](@ref) is returned and out\\_name is set to NULL. If underlying OS call fails, AWS\\_ERROR\\_SYS\\_CALL\\_FAILURE will be raised If OS does not support getting thread name, AWS\\_ERROR\\_PLATFORM\\_NOT\\_SUPPORTED will be raised

### Prototype
```c
int aws_thread_name( struct aws_allocator *allocator, aws_thread_id_t thread_id, struct aws_string **out_name);
```
"""
function aws_thread_name(allocator, thread_id, out_name)
    ccall((:aws_thread_name, libaws_c_io), Cint, (Ptr{aws_allocator}, aws_thread_id_t, Ptr{Ptr{aws_string}}), allocator, thread_id, out_name)
end

"""
    aws_log_level

Controls what log calls pass through the logger and what log calls get filtered out. If a log level has a value of X, then all log calls using a level <= X will appear, while those using a value > X will not occur.

You can filter both dynamically (by setting the log level on the logger object) or statically (by defining AWS\\_STATIC\\_LOG\\_LEVEL to be an appropriate integer module-wide). Statically filtered log calls will be completely compiled out but require a rebuild if you want to get more detail about what's happening.
"""
@cenum aws_log_level::UInt32 begin
    AWS_LL_NONE = 0
    AWS_LL_FATAL = 1
    AWS_LL_ERROR = 2
    AWS_LL_WARN = 3
    AWS_LL_INFO = 4
    AWS_LL_DEBUG = 5
    AWS_LL_TRACE = 6
    AWS_LL_COUNT = 7
end

"""
Log subject is a way of designating the topic of logging.

The general idea is to support a finer-grained approach to log level control. The primary use case is for situations that require more detailed logging within a specific domain, where enabling that detail globally leads to an untenable flood of information.

For example, enable TRACE logging for tls-related log statements (handshake binary payloads), but only WARN logging everywhere else (because http payloads would blow up the log files).

Log subject is an enum similar to aws error: each library has its own value-space and someone is responsible for registering the value <-> string connections.
"""
const aws_log_subject_t = UInt32

@cenum __JL_Ctag_76::UInt32 begin
    AWS_LOG_SUBJECT_STRIDE_BITS = 10
end

struct aws_log_subject_info
    subject_id::aws_log_subject_t
    subject_name::Ptr{Cchar}
    subject_description::Ptr{Cchar}
end

struct aws_log_subject_info_list
    subject_list::Ptr{aws_log_subject_info}
    count::Csize_t
end

@cenum aws_common_log_subject::UInt32 begin
    AWS_LS_COMMON_GENERAL = 0
    AWS_LS_COMMON_TASK_SCHEDULER = 1
    AWS_LS_COMMON_THREAD = 2
    AWS_LS_COMMON_MEMTRACE = 3
    AWS_LS_COMMON_XML_PARSER = 4
    AWS_LS_COMMON_IO = 5
    AWS_LS_COMMON_BUS = 6
    AWS_LS_COMMON_TEST = 7
    AWS_LS_COMMON_JSON_PARSER = 8
    AWS_LS_COMMON_LAST = 1023
end

mutable struct aws_log_formatter end

mutable struct aws_log_channel end

mutable struct aws_log_writer end

struct aws_logger_pipeline
    formatter::Ptr{aws_log_formatter}
    channel::Ptr{aws_log_channel}
    writer::Ptr{aws_log_writer}
    allocator::Ptr{aws_allocator}
    level::aws_atomic_var
end

"""
    aws_logger_standard_options

Options for [`aws_logger_init_standard`](@ref)(). Set `filename` to open a file for logging and close it when the logger cleans up. Set `file` to use a file that is already open, such as `stderr` or `stdout`.
"""
struct aws_logger_standard_options
    level::aws_log_level
    filename::Ptr{Cchar}
    file::Ptr{Libc.FILE}
end

"""
    aws_logger_set(logger)

Sets the aws logger used globally across the process. Not thread-safe. Must only be called once.

### Prototype
```c
void aws_logger_set(struct aws_logger *logger);
```
"""
function aws_logger_set(logger)
    ccall((:aws_logger_set, libaws_c_io), Cvoid, (Ptr{aws_logger},), logger)
end

"""
    aws_logger_get_conditional(subject, level)

Gets the aws logger used globally across the process if the logging level is at least the inputted level.

### Parameters
* `subject`: log subject to perform the level check versus, not currently used
* `level`: logging level to check against in order to return the logger
### Returns
the current logger if the current logging level is at or more detailed then the supplied logging level
### Prototype
```c
struct aws_logger *aws_logger_get_conditional(aws_log_subject_t subject, enum aws_log_level level);
```
"""
function aws_logger_get_conditional(subject, level)
    ccall((:aws_logger_get_conditional, libaws_c_io), Ptr{aws_logger}, (aws_log_subject_t, aws_log_level), subject, level)
end

"""
    aws_logger_clean_up(logger)

Cleans up all resources used by the logger; simply invokes the clean\\_up v-function

### Prototype
```c
void aws_logger_clean_up(struct aws_logger *logger);
```
"""
function aws_logger_clean_up(logger)
    ccall((:aws_logger_clean_up, libaws_c_io), Cvoid, (Ptr{aws_logger},), logger)
end

"""
    aws_logger_set_log_level(logger, level)

Sets the current logging level for the logger. Loggers are not require to support this.

### Parameters
* `logger`: logger to set the log level for
* `level`: new log level for the logger
### Returns
[`AWS_OP_SUCCESS`](@ref) if the level was successfully set, [`AWS_OP_ERR`](@ref) otherwise
### Prototype
```c
int aws_logger_set_log_level(struct aws_logger *logger, enum aws_log_level level);
```
"""
function aws_logger_set_log_level(logger, level)
    ccall((:aws_logger_set_log_level, libaws_c_io), Cint, (Ptr{aws_logger}, aws_log_level), logger, level)
end

"""
    aws_log_level_to_string(log_level, level_string)

Converts a log level to a c-string constant. Intended primarily to support building log lines that include the level in them, i.e.

[ERROR] 10:34:54.642 01-31-19 - Json parse error....

### Prototype
```c
int aws_log_level_to_string(enum aws_log_level log_level, const char **level_string);
```
"""
function aws_log_level_to_string(log_level, level_string)
    ccall((:aws_log_level_to_string, libaws_c_io), Cint, (aws_log_level, Ptr{Ptr{Cchar}}), log_level, level_string)
end

"""
    aws_string_to_log_level(level_string, log_level)

Converts a c-string constant to a log level value. Uses case-insensitive comparison and simply iterates all possibilities until a match or nothing remains. If no match is found, [`AWS_OP_ERR`](@ref) is returned.

### Prototype
```c
int aws_string_to_log_level(const char *level_string, enum aws_log_level *log_level);
```
"""
function aws_string_to_log_level(level_string, log_level)
    ccall((:aws_string_to_log_level, libaws_c_io), Cint, (Ptr{Cchar}, Ptr{aws_log_level}), level_string, log_level)
end

"""
    aws_thread_id_t_to_string(thread_id, buffer, bufsz)

Converts an [`aws_thread_id_t`](@ref) to a c-string. For portability, [`aws_thread_id_t`](@ref) must not be printed directly. Intended primarily to support building log lines that include the thread id in them. The parameter `buffer` must point-to a char buffer of length `bufsz == [`AWS_THREAD_ID_T_REPR_BUFSZ`](@ref)`. The thread id representation is returned in `buffer`.

### Prototype
```c
int aws_thread_id_t_to_string(aws_thread_id_t thread_id, char *buffer, size_t bufsz);
```
"""
function aws_thread_id_t_to_string(thread_id, buffer, bufsz)
    ccall((:aws_thread_id_t_to_string, libaws_c_io), Cint, (aws_thread_id_t, Ptr{Cchar}, Csize_t), thread_id, buffer, bufsz)
end

"""
    aws_log_subject_name(subject)

Get subject name from log subject.

### Prototype
```c
const char *aws_log_subject_name(aws_log_subject_t subject);
```
"""
function aws_log_subject_name(subject)
    ccall((:aws_log_subject_name, libaws_c_io), Ptr{Cchar}, (aws_log_subject_t,), subject)
end

"""
    aws_register_log_subject_info_list(log_subject_list)

Connects log subject strings with log subject integer values

### Prototype
```c
void aws_register_log_subject_info_list(struct aws_log_subject_info_list *log_subject_list);
```
"""
function aws_register_log_subject_info_list(log_subject_list)
    ccall((:aws_register_log_subject_info_list, libaws_c_io), Cvoid, (Ptr{aws_log_subject_info_list},), log_subject_list)
end

"""
    aws_unregister_log_subject_info_list(log_subject_list)

Disconnects log subject strings with log subject integer values

### Prototype
```c
void aws_unregister_log_subject_info_list(struct aws_log_subject_info_list *log_subject_list);
```
"""
function aws_unregister_log_subject_info_list(log_subject_list)
    ccall((:aws_unregister_log_subject_info_list, libaws_c_io), Cvoid, (Ptr{aws_log_subject_info_list},), log_subject_list)
end

"""
    aws_logger_init_standard(logger, allocator, options)

### Prototype
```c
int aws_logger_init_standard( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_logger_standard_options *options);
```
"""
function aws_logger_init_standard(logger, allocator, options)
    ccall((:aws_logger_init_standard, libaws_c_io), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_logger_standard_options}), logger, allocator, options)
end

"""
    aws_logger_init_from_external(logger, allocator, formatter, channel, writer, level)

### Prototype
```c
int aws_logger_init_from_external( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_log_formatter *formatter, struct aws_log_channel *channel, struct aws_log_writer *writer, enum aws_log_level level);
```
"""
function aws_logger_init_from_external(logger, allocator, formatter, channel, writer, level)
    ccall((:aws_logger_init_from_external, libaws_c_io), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_log_formatter}, Ptr{aws_log_channel}, Ptr{aws_log_writer}, aws_log_level), logger, allocator, formatter, channel, writer, level)
end

"""
    aws_logger_init_noalloc(logger, allocator, options)

### Prototype
```c
int aws_logger_init_noalloc( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_logger_standard_options *options);
```
"""
function aws_logger_init_noalloc(logger, allocator, options)
    ccall((:aws_logger_init_noalloc, libaws_c_io), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_logger_standard_options}), logger, allocator, options)
end

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

struct aws_memory_pool
    alloc::Ptr{aws_allocator}
    stack::aws_array_list
    ideal_segment_count::UInt16
    segment_size::Csize_t
    data_ptr::Ptr{Cvoid}
end

struct aws_message_pool
    alloc::Ptr{aws_allocator}
    application_data_pool::aws_memory_pool
    small_block_pool::aws_memory_pool
end

struct aws_message_pool_creation_args
    application_data_msg_data_size::Csize_t
    application_data_msg_count::UInt8
    small_block_msg_data_size::Csize_t
    small_block_msg_count::UInt8
end

"""
    aws_memory_pool_init(mempool, alloc, ideal_segment_count, segment_size)

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

### Parameters
* `message`:
### Prototype
```c
void aws_message_pool_release(struct aws_message_pool *msg_pool, struct aws_io_message *message);
```
"""
function aws_message_pool_release(msg_pool, message)
    ccall((:aws_message_pool_release, libaws_c_io), Cvoid, (Ptr{aws_message_pool}, Ptr{aws_io_message}), msg_pool, message)
end

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

struct aws_pipe_read_end
    impl_data::Ptr{Cvoid}
end

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

Read data from the pipe into the destination buffer. Attempts to read enough to fill all remaining space in the buffer, from `dst\\_buffer->len` to `dst\\_buffer->capacity`. `dst\\_buffer->len` is updated to reflect the buffer's new length. `num_bytes_read` (optional) is set to the total number of bytes read. This function never blocks. If no bytes could be read without blocking, then [`AWS_OP_ERR`](@ref) is returned and [`aws_last_error`](@ref)() code will be AWS\\_IO\\_READ\\_WOULD\\_BLOCK. This must be called on the thread of the connected event-loop.

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
Invoked upon the acquisition, or failure to acquire a retry token. This function will always be invoked if and only if [`aws_retry_strategy_acquire_retry_token`](@ref)() returns [`AWS_OP_SUCCESS`](@ref). It will never be invoked synchronously from [`aws_retry_strategy_acquire_retry_token`](@ref)(). Token will always be NULL if error\\_code is non-zero, and vice-versa. If token is non-null, it will have a reference count of 1, and you must call [`aws_retry_token_release`](@ref)() on it later. See the comments for [`aws_retry_strategy_on_retry_ready_fn`](@ref) for more info.
"""
const aws_retry_strategy_on_retry_token_acquired_fn = Cvoid

# typedef void ( aws_retry_strategy_on_retry_ready_fn ) ( struct aws_retry_token * token , int error_code , void * user_data )
"""
Invoked after a successful call to [`aws_retry_strategy_schedule_retry`](@ref)(). This function will always be invoked if and only if [`aws_retry_strategy_schedule_retry`](@ref)() returns [`AWS_OP_SUCCESS`](@ref). It will never be invoked synchronously from [`aws_retry_strategy_schedule_retry`](@ref)(). After attempting the operation, either call [`aws_retry_strategy_schedule_retry`](@ref)() with an [`aws_retry_error_type`](@ref) or call [`aws_retry_token_record_success`](@ref)() and then release the token via. [`aws_retry_token_release`](@ref)().
"""
const aws_retry_strategy_on_retry_ready_fn = Cvoid

# typedef uint64_t ( aws_generate_random_fn ) ( void * user_data )
"""
Optional function to supply your own generate random implementation
"""
const aws_generate_random_fn = Cvoid

@cenum aws_retry_error_type::UInt32 begin
    AWS_RETRY_ERROR_TYPE_TRANSIENT = 0
    AWS_RETRY_ERROR_TYPE_THROTTLING = 1
    AWS_RETRY_ERROR_TYPE_SERVER_ERROR = 2
    AWS_RETRY_ERROR_TYPE_CLIENT_ERROR = 3
end

struct aws_retry_strategy_vtable
    destroy::Ptr{Cvoid}
    acquire_token::Ptr{Cvoid}
    schedule_retry::Ptr{Cvoid}
    record_success::Ptr{Cvoid}
    release_token::Ptr{Cvoid}
end

struct aws_retry_strategy
    allocator::Ptr{aws_allocator}
    vtable::Ptr{aws_retry_strategy_vtable}
    ref_count::aws_atomic_var
    impl::Ptr{Cvoid}
end

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

struct aws_shared_library
    library_handle::Ptr{Cvoid}
end

# typedef void ( * aws_generic_function ) ( void )
const aws_generic_function = Ptr{Cvoid}

"""
    aws_shared_library_init(library, library_path)

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

### Prototype
```c
int aws_shared_library_find_function( struct aws_shared_library *library, const char *symbol_name, aws_generic_function *function_address);
```
"""
function aws_shared_library_find_function(library, symbol_name, function_address)
    ccall((:aws_shared_library_find_function, libaws_c_io), Cint, (Ptr{aws_shared_library}, Ptr{Cchar}, Ptr{aws_generic_function}), library, symbol_name, function_address)
end

# typedef void ( aws_socket_on_write_completed_fn ) ( struct aws_socket * socket , int error_code , size_t bytes_written , void * user_data )
"""
Callback for when the data passed to a call to [`aws_socket_write`](@ref)() has either completed or failed. On success, error\\_code will be AWS\\_ERROR\\_SUCCESS.
"""
const aws_socket_on_write_completed_fn = Cvoid

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
    aws_socket_connect(socket, remote_endpoint, event_loop, on_connection_result, user_data)

Connects to a remote endpoint. In UDP, this simply binds the socket to a remote address for use with `[`aws_socket_write`](@ref)()`, and if the operation is successful, the socket can immediately be used for write operations.

In TCP, LOCAL and VSOCK this function will not block. If the return value is successful, then you must wait on the `on\\_connection\\_result()` callback to be invoked before using the socket.

If an event\\_loop is provided for UDP sockets, a notification will be sent on on\\_connection\\_result in the event-loop's thread. Upon completion, the socket will already be assigned an event loop. If NULL is passed for UDP, it will immediately return upon success, but you must call [`aws_socket_assign_to_event_loop`](@ref) before use.

### Prototype
```c
int aws_socket_connect( struct aws_socket *socket, const struct aws_socket_endpoint *remote_endpoint, struct aws_event_loop *event_loop, aws_socket_on_connection_result_fn *on_connection_result, void *user_data);
```
"""
function aws_socket_connect(socket, remote_endpoint, event_loop, on_connection_result, user_data)
    ccall((:aws_socket_connect, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_socket_endpoint}, Ptr{aws_event_loop}, Ptr{aws_socket_on_connection_result_fn}, Ptr{Cvoid}), socket, remote_endpoint, event_loop, on_connection_result, user_data)
end

"""
    aws_socket_bind(socket, local_endpoint)

Binds the socket to a local address. In UDP mode, the socket is ready for `[`aws_socket_read`](@ref)()` operations. In connection oriented modes, you still must call `[`aws_socket_listen`](@ref)()` and `[`aws_socket_start_accept`](@ref)()` before using the socket. local\\_endpoint is copied.

### Prototype
```c
int aws_socket_bind(struct aws_socket *socket, const struct aws_socket_endpoint *local_endpoint);
```
"""
function aws_socket_bind(socket, local_endpoint)
    ccall((:aws_socket_bind, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_socket_endpoint}), socket, local_endpoint)
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
    aws_socket_start_accept(socket, accept_loop, on_accept_result, user_data)

TCP, LOCAL and VSOCK only. The socket will begin accepting new connections. This is an asynchronous operation. New connections or errors will arrive via the `on_accept_result` callback.

[`aws_socket_bind`](@ref)() and [`aws_socket_listen`](@ref)() must be called before calling this function.

### Prototype
```c
int aws_socket_start_accept( struct aws_socket *socket, struct aws_event_loop *accept_loop, aws_socket_on_accept_result_fn *on_accept_result, void *user_data);
```
"""
function aws_socket_start_accept(socket, accept_loop, on_accept_result, user_data)
    ccall((:aws_socket_start_accept, libaws_c_io), Cint, (Ptr{aws_socket}, Ptr{aws_event_loop}, Ptr{aws_socket_on_accept_result_fn}, Ptr{Cvoid}), socket, accept_loop, on_accept_result, user_data)
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

Sets new socket options on the underlying socket. This is mainly useful in context of accepting a new connection via: `on\\_incoming\\_connection()`. options is copied.

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

Subscribes on\\_readable to notifications when the socket goes readable (edge-triggered). Errors will also be recieved in the callback.

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
    aws_socket_get_error(socket)

Gets the latest error from the socket. If no error has occurred [`AWS_OP_SUCCESS`](@ref) will be returned. This function does not raise any errors to the installed error handlers.

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

### Prototype
```c
const struct aws_socket *aws_socket_handler_get_socket(const struct aws_channel_handler *handler);
```
"""
function aws_socket_handler_get_socket(handler)
    ccall((:aws_socket_handler_get_socket, libaws_c_io), Ptr{aws_socket}, (Ptr{aws_channel_handler},), handler)
end

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

@cenum aws_stream_seek_basis::UInt32 begin
    AWS_SSB_BEGIN = 0
    AWS_SSB_END = 2
end

struct aws_stream_status
    is_end_of_stream::Bool
    is_valid::Bool
end

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

### Prototype
```c
struct aws_input_stream *aws_input_stream_new_from_open_file(struct aws_allocator *allocator, FILE *file);
```
"""
function aws_input_stream_new_from_open_file(allocator, file)
    ccall((:aws_input_stream_new_from_open_file, libaws_c_io), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{Libc.FILE}), allocator, file)
end

mutable struct aws_pkcs11_session end

@cenum aws_tls_versions::UInt32 begin
    AWS_IO_SSLv3 = 0
    AWS_IO_TLSv1 = 1
    AWS_IO_TLSv1_1 = 2
    AWS_IO_TLSv1_2 = 3
    AWS_IO_TLSv1_3 = 4
    AWS_IO_TLS_VER_SYS_DEFAULTS = 128
end

@cenum aws_tls_cipher_pref::UInt32 begin
    AWS_IO_TLS_CIPHER_PREF_SYSTEM_DEFAULT = 0
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2019_06 = 1
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_SIKE_TLSv1_0_2019_11 = 2
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2020_02 = 3
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_SIKE_TLSv1_0_2020_02 = 4
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2020_07 = 5
    AWS_IO_TLS_CIPHER_PREF_PQ_TLSv1_0_2021_05 = 6
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

struct aws_tls_ctx_options
    allocator::Ptr{aws_allocator}
    minimum_tls_version::aws_tls_versions
    cipher_pref::aws_tls_cipher_pref
    ca_file::aws_byte_buf
    ca_path::Ptr{aws_string}
    alpn_list::Ptr{aws_string}
    certificate::aws_byte_buf
    private_key::aws_byte_buf
    max_fragment_size::Csize_t
    verify_peer::Bool
    ctx_options_extension::Ptr{Cvoid}
    custom_key_op_handler::Ptr{aws_custom_key_op_handler}
end

struct aws_tls_negotiated_protocol_message
    protocol::aws_byte_buf
end

# typedef struct aws_channel_handler * ( * aws_tls_on_protocol_negotiated ) ( struct aws_channel_slot * new_slot , struct aws_byte_buf * protocol , void * user_data )
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

NOTE: This is unsupported on iOS.

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

NOTE: This is unsupported on iOS.

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

### Parameters
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

### Parameters
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

\\deprecated 

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

Copies 'from' to 'to'

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
    aws_uri

Data representing a URI. uri\\_str is always allocated and filled in. The other portions are merely storing offsets into uri\\_str.
"""
struct aws_uri
    self_size::Csize_t
    allocator::Ptr{aws_allocator}
    uri_str::aws_byte_buf
    scheme::aws_byte_cursor
    authority::aws_byte_cursor
    userinfo::aws_byte_cursor
    user::aws_byte_cursor
    password::aws_byte_cursor
    host_name::aws_byte_cursor
    port::UInt32
    path::aws_byte_cursor
    query_string::aws_byte_cursor
    path_and_query::aws_byte_cursor
end

"""
    aws_uri_param

key/value pairs for a query string. If the query fragment was not in format key=value, the fragment value will be stored in key
"""
struct aws_uri_param
    key::aws_byte_cursor
    value::aws_byte_cursor
end

"""
    aws_uri_builder_options

Arguments for building a URI instance. All members must be initialized before passing them to aws\\_uri\\_init().

query\\_string and query\\_params are exclusive to each other. If you set query\\_string, do not prepend it with '?'
"""
struct aws_uri_builder_options
    scheme::aws_byte_cursor
    path::aws_byte_cursor
    host_name::aws_byte_cursor
    port::UInt32
    query_params::Ptr{aws_array_list}
    query_string::aws_byte_cursor
end

"""
    aws_uri_init_parse(uri, allocator, uri_str)

Parses 'uri\\_str' and initializes uri. Returns [`AWS_OP_SUCCESS`](@ref), on success, [`AWS_OP_ERR`](@ref) on failure. After calling this function, the parts can be accessed.

### Prototype
```c
int aws_uri_init_parse( struct aws_uri *uri, struct aws_allocator *allocator, const struct aws_byte_cursor *uri_str);
```
"""
function aws_uri_init_parse(uri, allocator, uri_str)
    ccall((:aws_uri_init_parse, libaws_c_io), Cint, (Ptr{aws_uri}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}), uri, allocator, uri_str)
end

"""
    aws_uri_init_from_builder_options(uri, allocator, options)

Initializes uri to values specified in options. Returns [`AWS_OP_SUCCESS`](@ref), on success, [`AWS_OP_ERR`](@ref) on failure. After calling this function, the parts can be accessed.

### Prototype
```c
int aws_uri_init_from_builder_options( struct aws_uri *uri, struct aws_allocator *allocator, struct aws_uri_builder_options *options);
```
"""
function aws_uri_init_from_builder_options(uri, allocator, options)
    ccall((:aws_uri_init_from_builder_options, libaws_c_io), Cint, (Ptr{aws_uri}, Ptr{aws_allocator}, Ptr{aws_uri_builder_options}), uri, allocator, options)
end

"""
    aws_uri_clean_up(uri)

### Prototype
```c
void aws_uri_clean_up(struct aws_uri *uri);
```
"""
function aws_uri_clean_up(uri)
    ccall((:aws_uri_clean_up, libaws_c_io), Cvoid, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_scheme(uri)

Returns the scheme portion of the uri (e.g. http, https, ftp, ftps, etc...). If the scheme was not present in the uri, the returned value will be empty. It is the users job to determine the appropriate defaults if this field is empty, based on protocol, port, etc...

### Prototype
```c
const struct aws_byte_cursor *aws_uri_scheme(const struct aws_uri *uri);
```
"""
function aws_uri_scheme(uri)
    ccall((:aws_uri_scheme, libaws_c_io), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_authority(uri)

Returns the authority portion of the uri (host[:port]). If it was not present, this was a request uri. In that case, the value will be empty.

### Prototype
```c
const struct aws_byte_cursor *aws_uri_authority(const struct aws_uri *uri);
```
"""
function aws_uri_authority(uri)
    ccall((:aws_uri_authority, libaws_c_io), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_path(uri)

Returns the path portion of the uri, including any leading '/'. If not present, this value will be empty.

### Prototype
```c
const struct aws_byte_cursor *aws_uri_path(const struct aws_uri *uri);
```
"""
function aws_uri_path(uri)
    ccall((:aws_uri_path, libaws_c_io), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_query_string(uri)

Returns the query string portion of the uri, minus the '?'. If not present, this value will be empty.

### Prototype
```c
const struct aws_byte_cursor *aws_uri_query_string(const struct aws_uri *uri);
```
"""
function aws_uri_query_string(uri)
    ccall((:aws_uri_query_string, libaws_c_io), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_host_name(uri)

Returns the 'host\\_name' portion of the authority. If no authority was present, this value will be empty.

### Prototype
```c
const struct aws_byte_cursor *aws_uri_host_name(const struct aws_uri *uri);
```
"""
function aws_uri_host_name(uri)
    ccall((:aws_uri_host_name, libaws_c_io), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_port(uri)

Returns the port portion of the authority if it was present, otherwise, returns 0. If this is 0, it is the users job to determine the correct port based on scheme and protocol.

### Prototype
```c
uint32_t aws_uri_port(const struct aws_uri *uri);
```
"""
function aws_uri_port(uri)
    ccall((:aws_uri_port, libaws_c_io), UInt32, (Ptr{aws_uri},), uri)
end

"""
    aws_uri_path_and_query(uri)

Returns the path and query portion of the uri (i.e., the thing you send across the wire).

### Prototype
```c
const struct aws_byte_cursor *aws_uri_path_and_query(const struct aws_uri *uri);
```
"""
function aws_uri_path_and_query(uri)
    ccall((:aws_uri_path_and_query, libaws_c_io), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
end

"""
    aws_query_string_next_param(query_string, param)

For iterating over the params in the query string. `param` is an in/out argument used to track progress, it MUST be zeroed out to start. If true is returned, `param` contains the value of the next param. If false is returned, there are no further params.

Edge cases: 1) Entries without '=' sign are treated as having a key and no value. Example: First param in query string "a&b=c" has key="a" value=""

2) Blank entries are skipped. Example: The only param in query string "&&a=b" is key="a" value="b"

### Prototype
```c
bool aws_query_string_next_param(struct aws_byte_cursor query_string, struct aws_uri_param *param);
```
"""
function aws_query_string_next_param(query_string, param)
    ccall((:aws_query_string_next_param, libaws_c_io), Bool, (aws_byte_cursor, Ptr{aws_uri_param}), query_string, param)
end

"""
    aws_query_string_params(query_string, out_params)

Parses query string and stores the parameters in 'out\\_params'. Returns [`AWS_OP_SUCCESS`](@ref) on success and [`AWS_OP_ERR`](@ref) on failure. The user is responsible for initializing out\\_params with item size of struct aws\\_query\\_param. The user is also responsible for cleaning up out\\_params when finished.

### Prototype
```c
int aws_query_string_params(struct aws_byte_cursor query_string, struct aws_array_list *out_params);
```
"""
function aws_query_string_params(query_string, out_params)
    ccall((:aws_query_string_params, libaws_c_io), Cint, (aws_byte_cursor, Ptr{aws_array_list}), query_string, out_params)
end

"""
    aws_uri_query_string_next_param(uri, param)

For iterating over the params in the uri query string. `param` is an in/out argument used to track progress, it MUST be zeroed out to start. If true is returned, `param` contains the value of the next param. If false is returned, there are no further params.

Edge cases: 1) Entries without '=' sign are treated as having a key and no value. Example: First param in query string "a&b=c" has key="a" value=""

2) Blank entries are skipped. Example: The only param in query string "&&a=b" is key="a" value="b"

### Prototype
```c
bool aws_uri_query_string_next_param(const struct aws_uri *uri, struct aws_uri_param *param);
```
"""
function aws_uri_query_string_next_param(uri, param)
    ccall((:aws_uri_query_string_next_param, libaws_c_io), Bool, (Ptr{aws_uri}, Ptr{aws_uri_param}), uri, param)
end

"""
    aws_uri_query_string_params(uri, out_params)

Parses query string and stores the parameters in 'out\\_params'. Returns [`AWS_OP_SUCCESS`](@ref) on success and [`AWS_OP_ERR`](@ref) on failure. The user is responsible for initializing out\\_params with item size of struct aws\\_query\\_param. The user is also responsible for cleaning up out\\_params when finished.

### Prototype
```c
int aws_uri_query_string_params(const struct aws_uri *uri, struct aws_array_list *out_params);
```
"""
function aws_uri_query_string_params(uri, out_params)
    ccall((:aws_uri_query_string_params, libaws_c_io), Cint, (Ptr{aws_uri}, Ptr{aws_array_list}), uri, out_params)
end

"""
    aws_byte_buf_append_encoding_uri_path(buffer, cursor)

Writes the uri path encoding of a cursor to a buffer. This is the modified version of rfc3986 used by sigv4 signing.

### Prototype
```c
int aws_byte_buf_append_encoding_uri_path( struct aws_byte_buf *buffer, const struct aws_byte_cursor *cursor);
```
"""
function aws_byte_buf_append_encoding_uri_path(buffer, cursor)
    ccall((:aws_byte_buf_append_encoding_uri_path, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
end

"""
    aws_byte_buf_append_encoding_uri_param(buffer, cursor)

Writes the uri query param encoding (passthrough alnum + '-' '\\_' '~' '.') of a UTF-8 cursor to a buffer For example, reading "a b\\_c" would write "a20b\\_c".

### Prototype
```c
int aws_byte_buf_append_encoding_uri_param( struct aws_byte_buf *buffer, const struct aws_byte_cursor *cursor);
```
"""
function aws_byte_buf_append_encoding_uri_param(buffer, cursor)
    ccall((:aws_byte_buf_append_encoding_uri_param, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
end

"""
    aws_byte_buf_append_decoding_uri(buffer, cursor)

Writes the uri decoding of a UTF-8 cursor to a buffer, replacing xx escapes by their single byte equivalent. For example, reading "a20b\\_c" would write "a b\\_c".

### Prototype
```c
int aws_byte_buf_append_decoding_uri(struct aws_byte_buf *buffer, const struct aws_byte_cursor *cursor);
```
"""
function aws_byte_buf_append_decoding_uri(buffer, cursor)
    ccall((:aws_byte_buf_append_decoding_uri, libaws_c_io), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
end

# typedef bool ( aws_condition_predicate_fn ) ( void * )
const aws_condition_predicate_fn = Cvoid

struct aws_condition_variable
    condition_handle::pthread_cond_t
    initialized::Bool
end

"""
    aws_condition_variable_init(condition_variable)

Initializes a condition variable.

### Prototype
```c
int aws_condition_variable_init(struct aws_condition_variable *condition_variable);
```
"""
function aws_condition_variable_init(condition_variable)
    ccall((:aws_condition_variable_init, libaws_c_io), Cint, (Ptr{aws_condition_variable},), condition_variable)
end

"""
    aws_condition_variable_clean_up(condition_variable)

Cleans up a condition variable.

### Prototype
```c
void aws_condition_variable_clean_up(struct aws_condition_variable *condition_variable);
```
"""
function aws_condition_variable_clean_up(condition_variable)
    ccall((:aws_condition_variable_clean_up, libaws_c_io), Cvoid, (Ptr{aws_condition_variable},), condition_variable)
end

"""
    aws_condition_variable_notify_one(condition_variable)

Notifies/Wakes one waiting thread

### Prototype
```c
int aws_condition_variable_notify_one(struct aws_condition_variable *condition_variable);
```
"""
function aws_condition_variable_notify_one(condition_variable)
    ccall((:aws_condition_variable_notify_one, libaws_c_io), Cint, (Ptr{aws_condition_variable},), condition_variable)
end

"""
    aws_condition_variable_notify_all(condition_variable)

Notifies/Wakes all waiting threads.

### Prototype
```c
int aws_condition_variable_notify_all(struct aws_condition_variable *condition_variable);
```
"""
function aws_condition_variable_notify_all(condition_variable)
    ccall((:aws_condition_variable_notify_all, libaws_c_io), Cint, (Ptr{aws_condition_variable},), condition_variable)
end

struct aws_mutex
    mutex_handle::pthread_mutex_t
    initialized::Bool
end

"""
    aws_condition_variable_wait(condition_variable, mutex)

Waits the calling thread on a notification from another thread.

### Prototype
```c
int aws_condition_variable_wait(struct aws_condition_variable *condition_variable, struct aws_mutex *mutex);
```
"""
function aws_condition_variable_wait(condition_variable, mutex)
    ccall((:aws_condition_variable_wait, libaws_c_io), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}), condition_variable, mutex)
end

"""
    aws_condition_variable_wait_pred(condition_variable, mutex, pred, pred_ctx)

Waits the calling thread on a notification from another thread. If predicate returns false, the wait is reentered, otherwise control returns to the caller.

### Prototype
```c
int aws_condition_variable_wait_pred( struct aws_condition_variable *condition_variable, struct aws_mutex *mutex, aws_condition_predicate_fn *pred, void *pred_ctx);
```
"""
function aws_condition_variable_wait_pred(condition_variable, mutex, pred, pred_ctx)
    ccall((:aws_condition_variable_wait_pred, libaws_c_io), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Ptr{aws_condition_predicate_fn}, Ptr{Cvoid}), condition_variable, mutex, pred, pred_ctx)
end

"""
    aws_condition_variable_wait_for(condition_variable, mutex, time_to_wait)

Waits the calling thread on a notification from another thread. Times out after time\\_to\\_wait. time\\_to\\_wait is in nanoseconds.

### Prototype
```c
int aws_condition_variable_wait_for( struct aws_condition_variable *condition_variable, struct aws_mutex *mutex, int64_t time_to_wait);
```
"""
function aws_condition_variable_wait_for(condition_variable, mutex, time_to_wait)
    ccall((:aws_condition_variable_wait_for, libaws_c_io), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Int64), condition_variable, mutex, time_to_wait)
end

"""
    aws_condition_variable_wait_for_pred(condition_variable, mutex, time_to_wait, pred, pred_ctx)

Waits the calling thread on a notification from another thread. Times out after time\\_to\\_wait. time\\_to\\_wait is in nanoseconds. If predicate returns false, the wait is reentered, otherwise control returns to the caller.

### Prototype
```c
int aws_condition_variable_wait_for_pred( struct aws_condition_variable *condition_variable, struct aws_mutex *mutex, int64_t time_to_wait, aws_condition_predicate_fn *pred, void *pred_ctx);
```
"""
function aws_condition_variable_wait_for_pred(condition_variable, mutex, time_to_wait, pred, pred_ctx)
    ccall((:aws_condition_variable_wait_for_pred, libaws_c_io), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Int64, Ptr{aws_condition_predicate_fn}, Ptr{Cvoid}), condition_variable, mutex, time_to_wait, pred, pred_ctx)
end

"""
    aws_mutex_init(mutex)

Initializes a new platform instance of mutex.

### Prototype
```c
int aws_mutex_init(struct aws_mutex *mutex);
```
"""
function aws_mutex_init(mutex)
    ccall((:aws_mutex_init, libaws_c_io), Cint, (Ptr{aws_mutex},), mutex)
end

"""
    aws_mutex_clean_up(mutex)

Cleans up internal resources.

### Prototype
```c
void aws_mutex_clean_up(struct aws_mutex *mutex);
```
"""
function aws_mutex_clean_up(mutex)
    ccall((:aws_mutex_clean_up, libaws_c_io), Cvoid, (Ptr{aws_mutex},), mutex)
end

"""
    aws_mutex_lock(mutex)

Blocks until it acquires the lock. While on some platforms such as Windows, this may behave as a reentrant mutex, you should not treat it like one. On platforms it is possible for it to be non-reentrant, it will be.

### Prototype
```c
int aws_mutex_lock(struct aws_mutex *mutex);
```
"""
function aws_mutex_lock(mutex)
    ccall((:aws_mutex_lock, libaws_c_io), Cint, (Ptr{aws_mutex},), mutex)
end

"""
    aws_mutex_try_lock(mutex)

Attempts to acquire the lock but returns immediately if it can not. While on some platforms such as Windows, this may behave as a reentrant mutex, you should not treat it like one. On platforms it is possible for it to be non-reentrant, it will be. Note: For windows, minimum support server version is Windows Server 2008 R2 [desktop apps | UWP apps]

### Prototype
```c
int aws_mutex_try_lock(struct aws_mutex *mutex);
```
"""
function aws_mutex_try_lock(mutex)
    ccall((:aws_mutex_try_lock, libaws_c_io), Cint, (Ptr{aws_mutex},), mutex)
end

"""
    aws_mutex_unlock(mutex)

Releases the lock.

### Prototype
```c
int aws_mutex_unlock(struct aws_mutex *mutex);
```
"""
function aws_mutex_unlock(mutex)
    ccall((:aws_mutex_unlock, libaws_c_io), Cint, (Ptr{aws_mutex},), mutex)
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

struct aws_async_input_stream_tester_options
    base::aws_input_stream_tester_options
    completion_strategy::aws_async_read_completion_strategy
    read_duration_ns::UInt64
end

struct __JL_Ctag_205
    lock::aws_mutex
    cvar::aws_condition_variable
    read_dest::Ptr{aws_byte_buf}
    read_future::Ptr{aws_future_bool}
    do_shutdown::Bool
end
function Base.getproperty(x::Ptr{__JL_Ctag_205}, f::Symbol)
    f === :lock && return Ptr{aws_mutex}(x + 0)
    f === :cvar && return Ptr{aws_condition_variable}(x + 28)
    f === :read_dest && return Ptr{Ptr{aws_byte_buf}}(x + 80)
    f === :read_future && return Ptr{Ptr{aws_future_bool}}(x + 84)
    f === :do_shutdown && return Ptr{Bool}(x + 88)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_205, f::Symbol)
    r = Ref{__JL_Ctag_205}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_205}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_205}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct aws_async_input_stream_tester
    data::NTuple{192, UInt8}
end

function Base.getproperty(x::Ptr{aws_async_input_stream_tester}, f::Symbol)
    f === :base && return Ptr{aws_async_input_stream}(x + 0)
    f === :alloc && return Ptr{Ptr{aws_allocator}}(x + 24)
    f === :options && return Ptr{aws_async_input_stream_tester_options}(x + 28)
    f === :source_stream && return Ptr{Ptr{aws_input_stream}}(x + 80)
    f === :thread && return Ptr{aws_thread}(x + 84)
    f === :synced_data && return Ptr{__JL_Ctag_205}(x + 96)
    f === :num_outstanding_reads && return Ptr{aws_atomic_var}(x + 188)
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

### Prototype
```c
static inline struct aws_async_input_stream *aws_async_input_stream_new_tester( struct aws_allocator *alloc, const struct aws_async_input_stream_tester_options *options);
```
"""
function aws_async_input_stream_new_tester(alloc, options)
    ccall((:aws_async_input_stream_new_tester, libaws_c_io), Ptr{aws_async_input_stream}, (Ptr{aws_allocator}, Ptr{aws_async_input_stream_tester_options}), alloc, options)
end

# typedef int ( aws_test_before_fn ) ( struct aws_allocator * allocator , void * ctx )
const aws_test_before_fn = Cvoid

# typedef int ( aws_test_run_fn ) ( struct aws_allocator * allocator , void * ctx )
const aws_test_run_fn = Cvoid

# typedef int ( aws_test_after_fn ) ( struct aws_allocator * allocator , int setup_result , void * ctx )
const aws_test_after_fn = Cvoid

struct aws_test_harness
    on_before::Ptr{aws_test_before_fn}
    run::Ptr{aws_test_run_fn}
    on_after::Ptr{aws_test_after_fn}
    ctx::Ptr{Cvoid}
    test_name::Ptr{Cchar}
    suppress_memcheck::Cint
end

"""
    s_aws_run_test_case(harness)

### Prototype
```c
static inline int s_aws_run_test_case(struct aws_test_harness *harness);
```
"""
function s_aws_run_test_case(harness)
    ccall((:s_aws_run_test_case, libaws_c_io), Cint, (Ptr{aws_test_harness},), harness)
end

@cenum aws_timestamp_unit::UInt32 begin
    AWS_TIMESTAMP_SECS = 1
    AWS_TIMESTAMP_MILLIS = 1000
    AWS_TIMESTAMP_MICROS = 1000000
    AWS_TIMESTAMP_NANOS = 1000000000
end

"""
    aws_timestamp_convert(timestamp, convert_from, convert_to, remainder)

Converts 'timestamp' from unit 'convert\\_from' to unit 'convert\\_to', if the units are the same then 'timestamp' is returned. If 'remainder' is NOT NULL, it will be set to the remainder if convert\\_from is a more precise unit than convert\\_to. To avoid unnecessary branching, 'remainder' is not zero initialized in this function, be sure to set it to 0 first if you care about that kind of thing. If conversion would lead to integer overflow, the timestamp returned will be the highest possible time that is representable, i.e. UINT64\\_MAX.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_timestamp_convert( uint64_t timestamp, enum aws_timestamp_unit convert_from, enum aws_timestamp_unit convert_to, uint64_t *remainder);
```
"""
function aws_timestamp_convert(timestamp, convert_from, convert_to, remainder)
    ccall((:aws_timestamp_convert, libaws_c_io), UInt64, (UInt64, aws_timestamp_unit, aws_timestamp_unit, Ptr{UInt64}), timestamp, convert_from, convert_to, remainder)
end

"""
    aws_timestamp_convert_u64(ticks, old_frequency, new_frequency, remainder)

More general form of [`aws_timestamp_convert`](@ref) that takes arbitrary frequencies rather than the timestamp enum.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_timestamp_convert_u64(uint64_t ticks, uint64_t old_frequency, uint64_t new_frequency, uint64_t *remainder);
```
"""
function aws_timestamp_convert_u64(ticks, old_frequency, new_frequency, remainder)
    ccall((:aws_timestamp_convert_u64, libaws_c_io), UInt64, (UInt64, UInt64, UInt64, Ptr{UInt64}), ticks, old_frequency, new_frequency, remainder)
end

"""
    aws_high_res_clock_get_ticks(timestamp)

Get ticks in nanoseconds (usually 100 nanosecond precision) on the high resolution clock (most-likely TSC). This clock has no bearing on the actual system time. On success, timestamp will be set.

### Prototype
```c
int aws_high_res_clock_get_ticks(uint64_t *timestamp);
```
"""
function aws_high_res_clock_get_ticks(timestamp)
    ccall((:aws_high_res_clock_get_ticks, libaws_c_io), Cint, (Ptr{UInt64},), timestamp)
end

"""
    aws_sys_clock_get_ticks(timestamp)

Get ticks in nanoseconds (usually 100 nanosecond precision) on the system clock. Reflects actual system time via nanoseconds since unix epoch. Use with care since an inaccurately set clock will probably cause bugs. On success, timestamp will be set.

### Prototype
```c
int aws_sys_clock_get_ticks(uint64_t *timestamp);
```
"""
function aws_sys_clock_get_ticks(timestamp)
    ccall((:aws_sys_clock_get_ticks, libaws_c_io), Cint, (Ptr{UInt64},), timestamp)
end

@cenum aws_platform_os::UInt32 begin
    AWS_PLATFORM_OS_WINDOWS = 0
    AWS_PLATFORM_OS_MAC = 1
    AWS_PLATFORM_OS_UNIX = 2
end

struct aws_cpu_info
    cpu_id::Int32
    suspected_hyper_thread::Bool
end

mutable struct aws_system_environment end

"""
    aws_system_environment_load(allocator)

Allocates and initializes information about the system the current process is executing on. If successful returns an instance of [`aws_system_environment`](@ref). If it fails, it will return NULL.

Note: This api is used internally and is still early in its evolution. It may change in incompatible ways in the future.

### Prototype
```c
struct aws_system_environment *aws_system_environment_load(struct aws_allocator *allocator);
```
"""
function aws_system_environment_load(allocator)
    ccall((:aws_system_environment_load, libaws_c_io), Ptr{aws_system_environment}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_system_environment_acquire(env)

### Prototype
```c
struct aws_system_environment *aws_system_environment_acquire(struct aws_system_environment *env);
```
"""
function aws_system_environment_acquire(env)
    ccall((:aws_system_environment_acquire, libaws_c_io), Ptr{aws_system_environment}, (Ptr{aws_system_environment},), env)
end

"""
    aws_system_environment_release(env)

### Prototype
```c
void aws_system_environment_release(struct aws_system_environment *env);
```
"""
function aws_system_environment_release(env)
    ccall((:aws_system_environment_release, libaws_c_io), Cvoid, (Ptr{aws_system_environment},), env)
end

"""
    aws_system_environment_get_virtualization_vendor(env)

Returns the virtualization vendor for the specified compute environment, e.g. "Xen, Amazon EC2, etc..."

The return value may be empty and in that case no vendor was detected.

### Prototype
```c
struct aws_byte_cursor aws_system_environment_get_virtualization_vendor(const struct aws_system_environment *env);
```
"""
function aws_system_environment_get_virtualization_vendor(env)
    ccall((:aws_system_environment_get_virtualization_vendor, libaws_c_io), aws_byte_cursor, (Ptr{aws_system_environment},), env)
end

"""
    aws_system_environment_get_virtualization_product_name(env)

Returns the product name for the specified compute environment. For example, the Amazon EC2 Instance type.

The return value may be empty and in that case no vendor was detected.

### Prototype
```c
struct aws_byte_cursor aws_system_environment_get_virtualization_product_name(const struct aws_system_environment *env);
```
"""
function aws_system_environment_get_virtualization_product_name(env)
    ccall((:aws_system_environment_get_virtualization_product_name, libaws_c_io), aws_byte_cursor, (Ptr{aws_system_environment},), env)
end

"""
    aws_system_environment_get_processor_count(env)

Returns the number of processors for the specified compute environment.

### Prototype
```c
size_t aws_system_environment_get_processor_count(struct aws_system_environment *env);
```
"""
function aws_system_environment_get_processor_count(env)
    ccall((:aws_system_environment_get_processor_count, libaws_c_io), Csize_t, (Ptr{aws_system_environment},), env)
end

"""
    aws_system_environment_get_cpu_group_count(env)

Returns the number of separate cpu groupings (multi-socket configurations or NUMA).

### Prototype
```c
size_t aws_system_environment_get_cpu_group_count(const struct aws_system_environment *env);
```
"""
function aws_system_environment_get_cpu_group_count(env)
    ccall((:aws_system_environment_get_cpu_group_count, libaws_c_io), Csize_t, (Ptr{aws_system_environment},), env)
end

"""
    aws_get_platform_build_os()

### Prototype
```c
enum aws_platform_os aws_get_platform_build_os(void);
```
"""
function aws_get_platform_build_os()
    ccall((:aws_get_platform_build_os, libaws_c_io), aws_platform_os, ())
end

"""
    aws_system_info_processor_count()

### Prototype
```c
size_t aws_system_info_processor_count(void);
```
"""
function aws_system_info_processor_count()
    ccall((:aws_system_info_processor_count, libaws_c_io), Csize_t, ())
end

"""
    aws_get_cpu_group_count()

Returns the logical processor groupings on the system (such as multiple numa nodes).

### Prototype
```c
uint16_t aws_get_cpu_group_count(void);
```
"""
function aws_get_cpu_group_count()
    ccall((:aws_get_cpu_group_count, libaws_c_io), UInt16, ())
end

"""
    aws_get_cpu_count_for_group(group_idx)

For a group, returns the number of CPUs it contains.

### Prototype
```c
size_t aws_get_cpu_count_for_group(uint16_t group_idx);
```
"""
function aws_get_cpu_count_for_group(group_idx)
    ccall((:aws_get_cpu_count_for_group, libaws_c_io), Csize_t, (UInt16,), group_idx)
end

"""
    aws_get_cpu_ids_for_group(group_idx, cpu_ids_array, cpu_ids_array_length)

Fills in cpu\\_ids\\_array with the cpu\\_id's for the group. To obtain the size to allocate for cpu\\_ids\\_array and the value for argument for cpu\\_ids\\_array\\_length, call [`aws_get_cpu_count_for_group`](@ref)().

### Prototype
```c
void aws_get_cpu_ids_for_group(uint16_t group_idx, struct aws_cpu_info *cpu_ids_array, size_t cpu_ids_array_length);
```
"""
function aws_get_cpu_ids_for_group(group_idx, cpu_ids_array, cpu_ids_array_length)
    ccall((:aws_get_cpu_ids_for_group, libaws_c_io), Cvoid, (UInt16, Ptr{aws_cpu_info}, Csize_t), group_idx, cpu_ids_array, cpu_ids_array_length)
end

"""
    aws_is_debugger_present()

### Prototype
```c
bool aws_is_debugger_present(void);
```
"""
function aws_is_debugger_present()
    ccall((:aws_is_debugger_present, libaws_c_io), Bool, ())
end

"""
    aws_debug_break()

### Prototype
```c
void aws_debug_break(void);
```
"""
function aws_debug_break()
    ccall((:aws_debug_break, libaws_c_io), Cvoid, ())
end

"""
    aws_backtrace(stack_frames, num_frames)

### Prototype
```c
size_t aws_backtrace(void **stack_frames, size_t num_frames);
```
"""
function aws_backtrace(stack_frames, num_frames)
    ccall((:aws_backtrace, libaws_c_io), Csize_t, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, num_frames)
end

"""
    aws_backtrace_symbols(stack_frames, stack_depth)

### Prototype
```c
char **aws_backtrace_symbols(void *const *stack_frames, size_t stack_depth);
```
"""
function aws_backtrace_symbols(stack_frames, stack_depth)
    ccall((:aws_backtrace_symbols, libaws_c_io), Ptr{Ptr{Cchar}}, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, stack_depth)
end

"""
    aws_backtrace_addr2line(stack_frames, stack_depth)

### Prototype
```c
char **aws_backtrace_addr2line(void *const *stack_frames, size_t stack_depth);
```
"""
function aws_backtrace_addr2line(stack_frames, stack_depth)
    ccall((:aws_backtrace_addr2line, libaws_c_io), Ptr{Ptr{Cchar}}, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, stack_depth)
end

"""
    aws_backtrace_print(fp, call_site_data)

Print a backtrace from either the current stack, or (if provided) the current exception/signal call\\_site\\_data is siginfo\\_t* on POSIX, and LPEXCEPTION\\_POINTERS on Windows, and can be null

### Prototype
```c
void aws_backtrace_print(FILE *fp, void *call_site_data);
```
"""
function aws_backtrace_print(fp, call_site_data)
    ccall((:aws_backtrace_print, libaws_c_io), Cvoid, (Ptr{Libc.FILE}, Ptr{Cvoid}), fp, call_site_data)
end

"""
    aws_backtrace_log(log_level)

### Prototype
```c
void aws_backtrace_log(int log_level);
```
"""
function aws_backtrace_log(log_level)
    ccall((:aws_backtrace_log, libaws_c_io), Cvoid, (Cint,), log_level)
end

"""
    enable_vt_mode()

### Prototype
```c
static inline int enable_vt_mode(void);
```
"""
function enable_vt_mode()
    ccall((:enable_vt_mode, libaws_c_io), Cint, ())
end

struct testing_loop
    scheduler::aws_task_scheduler
    mock_on_callers_thread::Bool
end

"""
    s_testing_loop_run(event_loop)

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

### Prototype
```c
static bool s_testing_loop_is_on_callers_thread(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_is_on_callers_thread(event_loop)
    ccall((:s_testing_loop_is_on_callers_thread, libaws_c_io), Bool, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_destroy(event_loop)

### Prototype
```c
static void s_testing_loop_destroy(struct aws_event_loop *event_loop);
```
"""
function s_testing_loop_destroy(event_loop)
    ccall((:s_testing_loop_destroy, libaws_c_io), Cvoid, (Ptr{aws_event_loop},), event_loop)
end

"""
    s_testing_loop_new(allocator, clock)

### Prototype
```c
static struct aws_event_loop *s_testing_loop_new(struct aws_allocator *allocator, aws_io_clock_fn clock);
```
"""
function s_testing_loop_new(allocator, clock)
    ccall((:s_testing_loop_new, libaws_c_io), Ptr{aws_event_loop}, (Ptr{aws_allocator}, aws_io_clock_fn), allocator, clock)
end

# typedef void ( testing_channel_handler_on_shutdown_fn ) ( enum aws_channel_direction dir , int error_code , bool free_scarce_resources_immediately , void * user_data )
const testing_channel_handler_on_shutdown_fn = Cvoid

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

### Prototype
```c
static struct aws_channel_handler *s_new_testing_channel_handler( struct aws_allocator *allocator, size_t initial_window);
```
"""
function s_new_testing_channel_handler(allocator, initial_window)
    ccall((:s_new_testing_channel_handler, libaws_c_io), Ptr{aws_channel_handler}, (Ptr{aws_allocator}, Csize_t), allocator, initial_window)
end

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

struct aws_testing_channel_options
    clock_fn::Ptr{aws_io_clock_fn}
end

"""
    testing_channel_init(testing, allocator, options)

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

### Prototype
```c
static inline struct aws_input_stream *aws_input_stream_new_tester( struct aws_allocator *alloc, const struct aws_input_stream_tester_options *options);
```
"""
function aws_input_stream_new_tester(alloc, options)
    ccall((:aws_input_stream_new_tester, libaws_c_io), Ptr{aws_input_stream}, (Ptr{aws_allocator}, Ptr{aws_input_stream_tester_options}), alloc, options)
end

# Skipping MacroDefinition: AWS_STATIC_IMPL static inline

const PRInSTR = "%.*s"

# Skipping MacroDefinition: AWS_FORCE_INLINE __attribute__ ( ( always_inline ) )

# Skipping MacroDefinition: AWS_NO_INLINE __attribute__ ( ( noinline ) )

# Skipping MacroDefinition: AWS_ATTRIBUTE_NORETURN __attribute__ ( ( noreturn ) )

const AWS_OP_SUCCESS = 0

const AWS_PACKAGE_SLOTS = 16

const AWS_C_COMMON_PACKAGE_ID = 0

const AWS_OP_ERR = -1

const AWS_ERROR_ENUM_STRIDE_BITS = 10

const AWS_ERROR_ENUM_STRIDE = Cuint(1) << AWS_ERROR_ENUM_STRIDE_BITS

const SIZE_BITS = 32

const AWS_CRT_STATISTICS_CATEGORY_STRIDE = Cuint(1) << AWS_CRT_STATISTICS_CATEGORY_STRIDE_BITS

const AWS_PATH_DELIM = Cchar('/')

const AWS_PATH_DELIM_STR = "/"

const AWS_C_IO_PACKAGE_ID = 1

const AWS_THREAD_NAME_RECOMMENDED_STRLEN = 15

# Skipping MacroDefinition: AWS_THREAD_ID_T_REPR_BUFSZ ( sizeof ( aws_thread_id_t ) * 2 + 1 )

const AWS_LOG_LEVEL_NONE = 0

const AWS_LOG_LEVEL_FATAL = 1

const AWS_LOG_LEVEL_ERROR = 2

const AWS_LOG_LEVEL_WARN = 3

const AWS_LOG_LEVEL_INFO = 4

const AWS_LOG_LEVEL_DEBUG = 5

const AWS_LOG_LEVEL_TRACE = 6

const AWS_LOG_SUBJECT_STRIDE = Cuint(1) << AWS_LOG_SUBJECT_STRIDE_BITS

const aws_pcks11_lib_behavior = aws_pkcs11_lib_behavior

# Skipping MacroDefinition: AWS_ADDRESS_MAX_LEN sizeof ( ( ( struct sockaddr_un * ) 0 ) -> sun_path )

const AWS_TLS_NEGOTIATED_PROTOCOL_MESSAGE = 0x01

# Skipping MacroDefinition: AWS_CONDITION_VARIABLE_INIT { . condition_handle = PTHREAD_COND_INITIALIZER , . initialized = true }

# Skipping MacroDefinition: AWS_MUTEX_INIT { . mutex_handle = PTHREAD_MUTEX_INITIALIZER , . initialized = true }

const AWS_OP_SKIP = -2

const AWS_TESTING_REPORT_FD = stderr

const FAIL_PREFIX = "***FAILURE*** "

const SUCCESS = 0

const FAILURE = -1

const SKIP = 103

# exports
const PREFIXES = ["AWS_", "aws_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

