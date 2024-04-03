using CEnum

const __time64_t = Clonglong

const time_t = __time64_t

struct tm
    data::NTuple{36, UInt8}
end

function Base.getproperty(x::Ptr{tm}, f::Symbol)
    f === :tm_sec && return Ptr{Cint}(x + 0)
    f === :tm_min && return Ptr{Cint}(x + 4)
    f === :tm_hour && return Ptr{Cint}(x + 8)
    f === :tm_mday && return Ptr{Cint}(x + 12)
    f === :tm_mon && return Ptr{Cint}(x + 16)
    f === :tm_year && return Ptr{Cint}(x + 20)
    f === :tm_wday && return Ptr{Cint}(x + 24)
    f === :tm_yday && return Ptr{Cint}(x + 28)
    f === :tm_isdst && return Ptr{Cint}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::tm, f::Symbol)
    r = Ref{tm}(x)
    ptr = Base.unsafe_convert(Ptr{tm}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{tm}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const LONG = Clong

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
    ccall((:aws_allocator_is_valid, libaws_c_common), Bool, (Ptr{aws_allocator},), alloc)
end

"""
    aws_default_allocator()

### Prototype
```c
struct aws_allocator *aws_default_allocator(void);
```
"""
function aws_default_allocator()
    ccall((:aws_default_allocator, libaws_c_common), Ptr{aws_allocator}, ())
end

"""
    aws_aligned_allocator()

### Prototype
```c
struct aws_allocator *aws_aligned_allocator(void);
```
"""
function aws_aligned_allocator()
    ccall((:aws_aligned_allocator, libaws_c_common), Ptr{aws_allocator}, ())
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
    ccall((:aws_mem_acquire, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_allocator}, Csize_t), allocator, size)
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
    ccall((:aws_mem_calloc, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_allocator}, Csize_t, Csize_t), allocator, num, size)
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
    ccall((:aws_mem_release, libaws_c_common), Cvoid, (Ptr{aws_allocator}, Ptr{Cvoid}), allocator, ptr)
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
    ccall((:aws_mem_realloc, libaws_c_common), Cint, (Ptr{aws_allocator}, Ptr{Ptr{Cvoid}}, Csize_t, Csize_t), allocator, ptr, oldsize, newsize)
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
    ccall((:aws_mem_tracer_new, libaws_c_common), Ptr{aws_allocator}, (Ptr{aws_allocator}, Ptr{aws_allocator}, aws_mem_trace_level, Csize_t), allocator, deprecated, level, frames_per_stack)
end

"""
    aws_mem_tracer_destroy(trace_allocator)

### Prototype
```c
struct aws_allocator *aws_mem_tracer_destroy(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_destroy(trace_allocator)
    ccall((:aws_mem_tracer_destroy, libaws_c_common), Ptr{aws_allocator}, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_dump(trace_allocator)

### Prototype
```c
void aws_mem_tracer_dump(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_dump(trace_allocator)
    ccall((:aws_mem_tracer_dump, libaws_c_common), Cvoid, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_bytes(trace_allocator)

### Prototype
```c
size_t aws_mem_tracer_bytes(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_bytes(trace_allocator)
    ccall((:aws_mem_tracer_bytes, libaws_c_common), Csize_t, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_mem_tracer_count(trace_allocator)

### Prototype
```c
size_t aws_mem_tracer_count(struct aws_allocator *trace_allocator);
```
"""
function aws_mem_tracer_count(trace_allocator)
    ccall((:aws_mem_tracer_count, libaws_c_common), Csize_t, (Ptr{aws_allocator},), trace_allocator)
end

"""
    aws_small_block_allocator_new(allocator, multi_threaded)

### Prototype
```c
struct aws_allocator *aws_small_block_allocator_new(struct aws_allocator *allocator, bool multi_threaded);
```
"""
function aws_small_block_allocator_new(allocator, multi_threaded)
    ccall((:aws_small_block_allocator_new, libaws_c_common), Ptr{aws_allocator}, (Ptr{aws_allocator}, Bool), allocator, multi_threaded)
end

"""
    aws_small_block_allocator_destroy(sba_allocator)

### Prototype
```c
void aws_small_block_allocator_destroy(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_destroy(sba_allocator)
    ccall((:aws_small_block_allocator_destroy, libaws_c_common), Cvoid, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_bytes_active(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_bytes_active(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_bytes_active(sba_allocator)
    ccall((:aws_small_block_allocator_bytes_active, libaws_c_common), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_bytes_reserved(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_bytes_reserved(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_bytes_reserved(sba_allocator)
    ccall((:aws_small_block_allocator_bytes_reserved, libaws_c_common), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_page_size(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_page_size(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_page_size(sba_allocator)
    ccall((:aws_small_block_allocator_page_size, libaws_c_common), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_small_block_allocator_page_size_available(sba_allocator)

### Prototype
```c
size_t aws_small_block_allocator_page_size_available(struct aws_allocator *sba_allocator);
```
"""
function aws_small_block_allocator_page_size_available(sba_allocator)
    ccall((:aws_small_block_allocator_page_size_available, libaws_c_common), Csize_t, (Ptr{aws_allocator},), sba_allocator)
end

"""
    aws_raise_error(err)

### Prototype
```c
AWS_STATIC_IMPL int aws_raise_error(int err);
```
"""
function aws_raise_error(err)
    ccall((:aws_raise_error, libaws_c_common), Cint, (Cint,), err)
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
    ccall((:aws_is_mem_zeroed, libaws_c_common), Bool, (Ptr{Cvoid}, Csize_t), buf, bufsize)
end

"""
    aws_mul_u64_saturating(a, b)

Multiplies a * b. If the result overflows, returns 2^64 - 1.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_mul_u64_saturating(uint64_t a, uint64_t b);
```
"""
function aws_mul_u64_saturating(a, b)
    ccall((:aws_mul_u64_saturating, libaws_c_common), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_mul_u64_checked(a, b, r)

If a * b overflows, returns [`AWS_OP_ERR`](@ref); otherwise multiplies a * b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_mul_u64_checked(uint64_t a, uint64_t b, uint64_t *r);
```
"""
function aws_mul_u64_checked(a, b, r)
    ccall((:aws_mul_u64_checked, libaws_c_common), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
end

"""
    aws_mul_u32_saturating(a, b)

Multiplies a * b. If the result overflows, returns 2^32 - 1.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_mul_u32_saturating(uint32_t a, uint32_t b);
```
"""
function aws_mul_u32_saturating(a, b)
    ccall((:aws_mul_u32_saturating, libaws_c_common), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_mul_u32_checked(a, b, r)

If a * b overflows, returns [`AWS_OP_ERR`](@ref); otherwise multiplies a * b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_mul_u32_checked(uint32_t a, uint32_t b, uint32_t *r);
```
"""
function aws_mul_u32_checked(a, b, r)
    ccall((:aws_mul_u32_checked, libaws_c_common), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
end

"""
    aws_add_u64_checked(a, b, r)

If a + b overflows, returns [`AWS_OP_ERR`](@ref); otherwise adds a + b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_add_u64_checked(uint64_t a, uint64_t b, uint64_t *r);
```
"""
function aws_add_u64_checked(a, b, r)
    ccall((:aws_add_u64_checked, libaws_c_common), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
end

"""
    aws_add_u64_saturating(a, b)

Adds a + b. If the result overflows, returns 2^64 - 1.

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_add_u64_saturating(uint64_t a, uint64_t b);
```
"""
function aws_add_u64_saturating(a, b)
    ccall((:aws_add_u64_saturating, libaws_c_common), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_add_u32_checked(a, b, r)

If a + b overflows, returns [`AWS_OP_ERR`](@ref); otherwise adds a + b, returns the result in *r, and returns [`AWS_OP_SUCCESS`](@ref).

### Prototype
```c
AWS_STATIC_IMPL int aws_add_u32_checked(uint32_t a, uint32_t b, uint32_t *r);
```
"""
function aws_add_u32_checked(a, b, r)
    ccall((:aws_add_u32_checked, libaws_c_common), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
end

"""
    aws_add_u32_saturating(a, b)

Adds a + b. If the result overflows, returns 2^32 - 1.

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_add_u32_saturating(uint32_t a, uint32_t b);
```
"""
function aws_add_u32_saturating(a, b)
    ccall((:aws_add_u32_saturating, libaws_c_common), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_clz_u32(n)

Search from the MSB to LSB, looking for a 1

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_u32(uint32_t n);
```
"""
function aws_clz_u32(n)
    ccall((:aws_clz_u32, libaws_c_common), Csize_t, (UInt32,), n)
end

"""
    aws_clz_i32(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_i32(int32_t n);
```
"""
function aws_clz_i32(n)
    ccall((:aws_clz_i32, libaws_c_common), Csize_t, (Int32,), n)
end

"""
    aws_clz_u64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_u64(uint64_t n);
```
"""
function aws_clz_u64(n)
    ccall((:aws_clz_u64, libaws_c_common), Csize_t, (UInt64,), n)
end

"""
    aws_clz_i64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_i64(int64_t n);
```
"""
function aws_clz_i64(n)
    ccall((:aws_clz_i64, libaws_c_common), Csize_t, (Int64,), n)
end

"""
    aws_clz_size(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_clz_size(size_t n);
```
"""
function aws_clz_size(n)
    ccall((:aws_clz_size, libaws_c_common), Csize_t, (Csize_t,), n)
end

"""
    aws_ctz_u32(n)

Search from the LSB to MSB, looking for a 1

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_u32(uint32_t n);
```
"""
function aws_ctz_u32(n)
    ccall((:aws_ctz_u32, libaws_c_common), Csize_t, (UInt32,), n)
end

"""
    aws_ctz_i32(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_i32(int32_t n);
```
"""
function aws_ctz_i32(n)
    ccall((:aws_ctz_i32, libaws_c_common), Csize_t, (Int32,), n)
end

"""
    aws_ctz_u64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_u64(uint64_t n);
```
"""
function aws_ctz_u64(n)
    ccall((:aws_ctz_u64, libaws_c_common), Csize_t, (UInt64,), n)
end

"""
    aws_ctz_i64(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_i64(int64_t n);
```
"""
function aws_ctz_i64(n)
    ccall((:aws_ctz_i64, libaws_c_common), Csize_t, (Int64,), n)
end

"""
    aws_ctz_size(n)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_ctz_size(size_t n);
```
"""
function aws_ctz_size(n)
    ccall((:aws_ctz_size, libaws_c_common), Csize_t, (Csize_t,), n)
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
    ccall((:aws_sub_u64_saturating, libaws_c_common), UInt64, (UInt64, UInt64), a, b)
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
    ccall((:aws_sub_u64_checked, libaws_c_common), Cint, (UInt64, UInt64, Ptr{UInt64}), a, b, r)
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
    ccall((:aws_sub_u32_saturating, libaws_c_common), UInt32, (UInt32, UInt32), a, b)
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
    ccall((:aws_sub_u32_checked, libaws_c_common), Cint, (UInt32, UInt32, Ptr{UInt32}), a, b, r)
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
    ccall((:aws_mul_size_saturating, libaws_c_common), Csize_t, (Csize_t, Csize_t), a, b)
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
    ccall((:aws_mul_size_checked, libaws_c_common), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
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
    ccall((:aws_add_size_saturating, libaws_c_common), Csize_t, (Csize_t, Csize_t), a, b)
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
    ccall((:aws_add_size_checked, libaws_c_common), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
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
    ccall((:aws_sub_size_saturating, libaws_c_common), Csize_t, (Csize_t, Csize_t), a, b)
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
    ccall((:aws_sub_size_checked, libaws_c_common), Cint, (Csize_t, Csize_t, Ptr{Csize_t}), a, b, r)
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
    ccall((:aws_is_power_of_two, libaws_c_common), Bool, (Csize_t,), x)
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
    ccall((:aws_round_up_to_power_of_two, libaws_c_common), Cint, (Csize_t, Ptr{Csize_t}), n, result)
end

"""
    aws_min_u8(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint8_t aws_min_u8(uint8_t a, uint8_t b);
```
"""
function aws_min_u8(a, b)
    ccall((:aws_min_u8, libaws_c_common), UInt8, (UInt8, UInt8), a, b)
end

"""
    aws_max_u8(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint8_t aws_max_u8(uint8_t a, uint8_t b);
```
"""
function aws_max_u8(a, b)
    ccall((:aws_max_u8, libaws_c_common), UInt8, (UInt8, UInt8), a, b)
end

"""
    aws_min_i8(a, b)

### Prototype
```c
AWS_STATIC_IMPL int8_t aws_min_i8(int8_t a, int8_t b);
```
"""
function aws_min_i8(a, b)
    ccall((:aws_min_i8, libaws_c_common), Int8, (Int8, Int8), a, b)
end

"""
    aws_max_i8(a, b)

### Prototype
```c
AWS_STATIC_IMPL int8_t aws_max_i8(int8_t a, int8_t b);
```
"""
function aws_max_i8(a, b)
    ccall((:aws_max_i8, libaws_c_common), Int8, (Int8, Int8), a, b)
end

"""
    aws_min_u16(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_min_u16(uint16_t a, uint16_t b);
```
"""
function aws_min_u16(a, b)
    ccall((:aws_min_u16, libaws_c_common), UInt16, (UInt16, UInt16), a, b)
end

"""
    aws_max_u16(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_max_u16(uint16_t a, uint16_t b);
```
"""
function aws_max_u16(a, b)
    ccall((:aws_max_u16, libaws_c_common), UInt16, (UInt16, UInt16), a, b)
end

"""
    aws_min_i16(a, b)

### Prototype
```c
AWS_STATIC_IMPL int16_t aws_min_i16(int16_t a, int16_t b);
```
"""
function aws_min_i16(a, b)
    ccall((:aws_min_i16, libaws_c_common), Int16, (Int16, Int16), a, b)
end

"""
    aws_max_i16(a, b)

### Prototype
```c
AWS_STATIC_IMPL int16_t aws_max_i16(int16_t a, int16_t b);
```
"""
function aws_max_i16(a, b)
    ccall((:aws_max_i16, libaws_c_common), Int16, (Int16, Int16), a, b)
end

"""
    aws_min_u32(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_min_u32(uint32_t a, uint32_t b);
```
"""
function aws_min_u32(a, b)
    ccall((:aws_min_u32, libaws_c_common), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_max_u32(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_max_u32(uint32_t a, uint32_t b);
```
"""
function aws_max_u32(a, b)
    ccall((:aws_max_u32, libaws_c_common), UInt32, (UInt32, UInt32), a, b)
end

"""
    aws_min_i32(a, b)

### Prototype
```c
AWS_STATIC_IMPL int32_t aws_min_i32(int32_t a, int32_t b);
```
"""
function aws_min_i32(a, b)
    ccall((:aws_min_i32, libaws_c_common), Int32, (Int32, Int32), a, b)
end

"""
    aws_max_i32(a, b)

### Prototype
```c
AWS_STATIC_IMPL int32_t aws_max_i32(int32_t a, int32_t b);
```
"""
function aws_max_i32(a, b)
    ccall((:aws_max_i32, libaws_c_common), Int32, (Int32, Int32), a, b)
end

"""
    aws_min_u64(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_min_u64(uint64_t a, uint64_t b);
```
"""
function aws_min_u64(a, b)
    ccall((:aws_min_u64, libaws_c_common), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_max_u64(a, b)

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_max_u64(uint64_t a, uint64_t b);
```
"""
function aws_max_u64(a, b)
    ccall((:aws_max_u64, libaws_c_common), UInt64, (UInt64, UInt64), a, b)
end

"""
    aws_min_i64(a, b)

### Prototype
```c
AWS_STATIC_IMPL int64_t aws_min_i64(int64_t a, int64_t b);
```
"""
function aws_min_i64(a, b)
    ccall((:aws_min_i64, libaws_c_common), Int64, (Int64, Int64), a, b)
end

"""
    aws_max_i64(a, b)

### Prototype
```c
AWS_STATIC_IMPL int64_t aws_max_i64(int64_t a, int64_t b);
```
"""
function aws_max_i64(a, b)
    ccall((:aws_max_i64, libaws_c_common), Int64, (Int64, Int64), a, b)
end

"""
    aws_min_size(a, b)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_min_size(size_t a, size_t b);
```
"""
function aws_min_size(a, b)
    ccall((:aws_min_size, libaws_c_common), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_max_size(a, b)

### Prototype
```c
AWS_STATIC_IMPL size_t aws_max_size(size_t a, size_t b);
```
"""
function aws_max_size(a, b)
    ccall((:aws_max_size, libaws_c_common), Csize_t, (Csize_t, Csize_t), a, b)
end

"""
    aws_min_int(a, b)

### Prototype
```c
AWS_STATIC_IMPL int aws_min_int(int a, int b);
```
"""
function aws_min_int(a, b)
    ccall((:aws_min_int, libaws_c_common), Cint, (Cint, Cint), a, b)
end

"""
    aws_max_int(a, b)

### Prototype
```c
AWS_STATIC_IMPL int aws_max_int(int a, int b);
```
"""
function aws_max_int(a, b)
    ccall((:aws_max_int, libaws_c_common), Cint, (Cint, Cint), a, b)
end

"""
    aws_min_float(a, b)

### Prototype
```c
AWS_STATIC_IMPL float aws_min_float(float a, float b);
```
"""
function aws_min_float(a, b)
    ccall((:aws_min_float, libaws_c_common), Cfloat, (Cfloat, Cfloat), a, b)
end

"""
    aws_max_float(a, b)

### Prototype
```c
AWS_STATIC_IMPL float aws_max_float(float a, float b);
```
"""
function aws_max_float(a, b)
    ccall((:aws_max_float, libaws_c_common), Cfloat, (Cfloat, Cfloat), a, b)
end

"""
    aws_min_double(a, b)

### Prototype
```c
AWS_STATIC_IMPL double aws_min_double(double a, double b);
```
"""
function aws_min_double(a, b)
    ccall((:aws_min_double, libaws_c_common), Cdouble, (Cdouble, Cdouble), a, b)
end

"""
    aws_max_double(a, b)

### Prototype
```c
AWS_STATIC_IMPL double aws_max_double(double a, double b);
```
"""
function aws_max_double(a, b)
    ccall((:aws_max_double, libaws_c_common), Cdouble, (Cdouble, Cdouble), a, b)
end

@cenum __JL_Ctag_15::UInt32 begin
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
    ccall((:aws_array_list_init_dynamic, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{aws_allocator}, Csize_t, Csize_t), list, alloc, initial_item_allocation, item_size)
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
    ccall((:aws_array_list_init_static, libaws_c_common), Cvoid, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t, Csize_t), list, raw_array, item_count, item_size)
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
    ccall((:aws_array_list_init_static_from_initialized, libaws_c_common), Cvoid, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t, Csize_t), list, raw_array, item_count, item_size)
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
    ccall((:aws_array_list_is_valid, libaws_c_common), Bool, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_clean_up, libaws_c_common), Cvoid, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_clean_up_secure, libaws_c_common), Cvoid, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_push_back, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
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
    ccall((:aws_array_list_front, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
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
    ccall((:aws_array_list_push_front, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
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
    ccall((:aws_array_list_pop_front, libaws_c_common), Cint, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_pop_front_n, libaws_c_common), Cvoid, (Ptr{aws_array_list}, Csize_t), list, n)
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
    ccall((:aws_array_list_erase, libaws_c_common), Cint, (Ptr{aws_array_list}, Csize_t), list, index)
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
    ccall((:aws_array_list_back, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}), list, val)
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
    ccall((:aws_array_list_pop_back, libaws_c_common), Cint, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_clear, libaws_c_common), Cvoid, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_shrink_to_fit, libaws_c_common), Cint, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_copy, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{aws_array_list}), from, to)
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
    ccall((:aws_array_list_swap_contents, libaws_c_common), Cvoid, (Ptr{aws_array_list}, Ptr{aws_array_list}), list_a, list_b)
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
    ccall((:aws_array_list_capacity, libaws_c_common), Csize_t, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_length, libaws_c_common), Csize_t, (Ptr{aws_array_list},), list)
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
    ccall((:aws_array_list_get_at, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t), list, val, index)
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
    ccall((:aws_array_list_get_at_ptr, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{Ptr{Cvoid}}, Csize_t), list, val, index)
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
    ccall((:aws_array_list_ensure_capacity, libaws_c_common), Cint, (Ptr{aws_array_list}, Csize_t), list, index)
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
    ccall((:aws_array_list_set_at, libaws_c_common), Cint, (Ptr{aws_array_list}, Ptr{Cvoid}, Csize_t), list, val, index)
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
    ccall((:aws_array_list_swap, libaws_c_common), Cvoid, (Ptr{aws_array_list}, Csize_t, Csize_t), list, a, b)
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
    ccall((:aws_array_list_sort, libaws_c_common), Cvoid, (Ptr{aws_array_list}, Ptr{aws_array_list_comparator_fn}), list, compare_fn)
end

"""
    aws_fatal_assert(cond_str, file, line)

### Prototype
```c
void aws_fatal_assert(const char *cond_str, const char *file, int line) AWS_ATTRIBUTE_NORETURN;
```
"""
function aws_fatal_assert(cond_str, file, line)
    ccall((:aws_fatal_assert, libaws_c_common), Cvoid, (Ptr{Cchar}, Ptr{Cchar}, Cint), cond_str, file, line)
end

const aws_atomic_impl_int_t = Csize_t

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
    ccall((:aws_atomic_init_int, libaws_c_common), Cvoid, (Ptr{aws_atomic_var}, Csize_t), var, n)
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
    ccall((:aws_atomic_init_ptr, libaws_c_common), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
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
    ccall((:aws_atomic_load_int_explicit, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, aws_memory_order), var, memory_order)
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
    ccall((:aws_atomic_load_int, libaws_c_common), Csize_t, (Ptr{aws_atomic_var},), var)
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
    ccall((:aws_atomic_load_ptr_explicit, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_atomic_var}, aws_memory_order), var, memory_order)
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
    ccall((:aws_atomic_load_ptr, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_atomic_var},), var)
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
    ccall((:aws_atomic_store_int_explicit, libaws_c_common), Cvoid, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, memory_order)
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
    ccall((:aws_atomic_store_int, libaws_c_common), Cvoid, (Ptr{aws_atomic_var}, Csize_t), var, n)
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
    ccall((:aws_atomic_store_ptr_explicit, libaws_c_common), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}, aws_memory_order), var, p, memory_order)
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
    ccall((:aws_atomic_store_ptr, libaws_c_common), Cvoid, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
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
    ccall((:aws_atomic_exchange_int_explicit, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, memory_order)
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
    ccall((:aws_atomic_exchange_int, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
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
    ccall((:aws_atomic_exchange_ptr_explicit, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_atomic_var}, Ptr{Cvoid}, aws_memory_order), var, p, memory_order)
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
    ccall((:aws_atomic_exchange_ptr, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_atomic_var}, Ptr{Cvoid}), var, p)
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
    ccall((:aws_atomic_compare_exchange_int_explicit, libaws_c_common), Bool, (Ptr{aws_atomic_var}, Ptr{Csize_t}, Csize_t, aws_memory_order, aws_memory_order), var, expected, desired, order_success, order_failure)
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
    ccall((:aws_atomic_compare_exchange_int, libaws_c_common), Bool, (Ptr{aws_atomic_var}, Ptr{Csize_t}, Csize_t), var, expected, desired)
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
    ccall((:aws_atomic_compare_exchange_ptr_explicit, libaws_c_common), Bool, (Ptr{aws_atomic_var}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}, aws_memory_order, aws_memory_order), var, expected, desired, order_success, order_failure)
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
    ccall((:aws_atomic_compare_exchange_ptr, libaws_c_common), Bool, (Ptr{aws_atomic_var}, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), var, expected, desired)
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
    ccall((:aws_atomic_fetch_add_explicit, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
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
    ccall((:aws_atomic_fetch_sub_explicit, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
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
    ccall((:aws_atomic_fetch_or_explicit, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
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
    ccall((:aws_atomic_fetch_and_explicit, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
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
    ccall((:aws_atomic_fetch_xor_explicit, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t, aws_memory_order), var, n, order)
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
    ccall((:aws_atomic_fetch_add, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
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
    ccall((:aws_atomic_fetch_sub, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
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
    ccall((:aws_atomic_fetch_and, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
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
    ccall((:aws_atomic_fetch_or, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
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
    ccall((:aws_atomic_fetch_xor, libaws_c_common), Csize_t, (Ptr{aws_atomic_var}, Csize_t), var, n)
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
    ccall((:aws_atomic_thread_fence, libaws_c_common), Cvoid, (aws_memory_order,), order)
end

"""
    aws_atomic_priv_xlate_order(order)

### Prototype
```c
static inline int aws_atomic_priv_xlate_order(enum aws_memory_order order);
```
"""
function aws_atomic_priv_xlate_order(order)
    ccall((:aws_atomic_priv_xlate_order, libaws_c_common), Cint, (aws_memory_order,), order)
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
    ccall((:aws_is_big_endian, libaws_c_common), Cint, ())
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
    ccall((:aws_hton64, libaws_c_common), UInt64, (UInt64,), x)
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
    ccall((:aws_ntoh64, libaws_c_common), UInt64, (UInt64,), x)
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
    ccall((:aws_hton32, libaws_c_common), UInt32, (UInt32,), x)
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
    ccall((:aws_htonf32, libaws_c_common), Cfloat, (Cfloat,), x)
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
    ccall((:aws_htonf64, libaws_c_common), Cdouble, (Cdouble,), x)
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
    ccall((:aws_ntoh32, libaws_c_common), UInt32, (UInt32,), x)
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
    ccall((:aws_ntohf32, libaws_c_common), Cfloat, (Cfloat,), x)
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
    ccall((:aws_ntohf64, libaws_c_common), Cdouble, (Cdouble,), x)
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
    ccall((:aws_hton16, libaws_c_common), UInt16, (UInt16,), x)
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
    ccall((:aws_ntoh16, libaws_c_common), UInt16, (UInt16,), x)
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
    ccall((:aws_array_eq, libaws_c_common), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t), array_a, len_a, array_b, len_b)
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
    ccall((:aws_array_eq_ignore_case, libaws_c_common), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t), array_a, len_a, array_b, len_b)
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
    ccall((:aws_array_eq_c_str, libaws_c_common), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cchar}), array, array_len, c_str)
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
    ccall((:aws_array_eq_c_str_ignore_case, libaws_c_common), Bool, (Ptr{Cvoid}, Csize_t, Ptr{Cchar}), array, array_len, c_str)
end

"""
    aws_byte_buf_init(buf, allocator, capacity)

### Prototype
```c
int aws_byte_buf_init(struct aws_byte_buf *buf, struct aws_allocator *allocator, size_t capacity);
```
"""
function aws_byte_buf_init(buf, allocator, capacity)
    ccall((:aws_byte_buf_init, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Csize_t), buf, allocator, capacity)
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
    ccall((:aws_byte_buf_init_copy, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{aws_byte_buf}), dest, allocator, src)
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
    ccall((:aws_byte_buf_init_from_file, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{Cchar}), out_buf, alloc, filename)
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
    ccall((:aws_byte_buf_init_from_file_with_size_hint, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{Cchar}, Csize_t), out_buf, alloc, filename, size_hint)
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
    ccall((:aws_byte_buf_is_valid, libaws_c_common), Bool, (Ptr{aws_byte_buf},), buf)
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
    ccall((:aws_byte_cursor_is_valid, libaws_c_common), Bool, (Ptr{aws_byte_cursor},), cursor)
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
    ccall((:aws_byte_buf_init_copy_from_cursor, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, aws_byte_cursor), dest, allocator, src)
end

"""
    aws_byte_buf_clean_up(buf)

### Prototype
```c
void aws_byte_buf_clean_up(struct aws_byte_buf *buf);
```
"""
function aws_byte_buf_clean_up(buf)
    ccall((:aws_byte_buf_clean_up, libaws_c_common), Cvoid, (Ptr{aws_byte_buf},), buf)
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
    ccall((:aws_byte_buf_clean_up_secure, libaws_c_common), Cvoid, (Ptr{aws_byte_buf},), buf)
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
    ccall((:aws_byte_buf_reset, libaws_c_common), Cvoid, (Ptr{aws_byte_buf}, Bool), buf, zero_contents)
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
    ccall((:aws_byte_buf_secure_zero, libaws_c_common), Cvoid, (Ptr{aws_byte_buf},), buf)
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
    ccall((:aws_byte_buf_eq, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}), a, b)
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
    ccall((:aws_byte_buf_eq_ignore_case, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}), a, b)
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
    ccall((:aws_byte_buf_eq_c_str, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Ptr{Cchar}), buf, c_str)
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
    ccall((:aws_byte_buf_eq_c_str_ignore_case, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Ptr{Cchar}), buf, c_str)
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
    ccall((:aws_byte_cursor_next_split, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Cchar, Ptr{aws_byte_cursor}), input_str, split_on, substr)
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
    ccall((:aws_byte_cursor_split_on_char, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Cchar, Ptr{aws_array_list}), input_str, split_on, output)
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
    ccall((:aws_byte_cursor_split_on_char_n, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Cchar, Csize_t, Ptr{aws_array_list}), input_str, split_on, n, output)
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
    ccall((:aws_byte_cursor_find_exact, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), input_str, to_find, first_find)
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
    ccall((:aws_byte_cursor_right_trim_pred, libaws_c_common), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{aws_byte_predicate_fn}), source, predicate)
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
    ccall((:aws_byte_cursor_left_trim_pred, libaws_c_common), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{aws_byte_predicate_fn}), source, predicate)
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
    ccall((:aws_byte_cursor_trim_pred, libaws_c_common), aws_byte_cursor, (Ptr{aws_byte_cursor}, Ptr{aws_byte_predicate_fn}), source, predicate)
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
    ccall((:aws_byte_cursor_satisfies_pred, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_predicate_fn}), source, predicate)
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
    ccall((:aws_byte_buf_append, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
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
    ccall((:aws_byte_buf_append_with_lookup, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}, Ptr{UInt8}), to, from, lookup_table)
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
    ccall((:aws_byte_buf_append_dynamic, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
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
    ccall((:aws_byte_buf_append_dynamic_secure, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from)
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
    ccall((:aws_byte_buf_append_byte_dynamic, libaws_c_common), Cint, (Ptr{aws_byte_buf}, UInt8), buffer, value)
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
    ccall((:aws_byte_buf_append_byte_dynamic_secure, libaws_c_common), Cint, (Ptr{aws_byte_buf}, UInt8), buffer, value)
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
    ccall((:aws_byte_buf_append_and_update, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), to, from_and_update)
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
    ccall((:aws_byte_buf_append_null_terminator, libaws_c_common), Cint, (Ptr{aws_byte_buf},), buf)
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
    ccall((:aws_byte_buf_reserve, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Csize_t), buffer, requested_capacity)
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
    ccall((:aws_byte_buf_reserve_relative, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Csize_t), buffer, additional_length)
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
    ccall((:aws_byte_cursor_eq, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), a, b)
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
    ccall((:aws_byte_cursor_eq_ignore_case, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), a, b)
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
    ccall((:aws_byte_cursor_eq_byte_buf, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), a, b)
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
    ccall((:aws_byte_cursor_eq_byte_buf_ignore_case, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), a, b)
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
    ccall((:aws_byte_cursor_eq_c_str, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{Cchar}), cursor, c_str)
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
    ccall((:aws_byte_cursor_eq_c_str_ignore_case, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{Cchar}), cursor, c_str)
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
    ccall((:aws_byte_cursor_starts_with, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), input, prefix)
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
    ccall((:aws_byte_cursor_starts_with_ignore_case, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), input, prefix)
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
    ccall((:aws_hash_array_ignore_case, libaws_c_common), UInt64, (Ptr{Cvoid}, Csize_t), array, len)
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
    ccall((:aws_hash_byte_cursor_ptr_ignore_case, libaws_c_common), UInt64, (Ptr{Cvoid},), item)
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
    ccall((:aws_lookup_table_to_lower_get, libaws_c_common), Ptr{UInt8}, ())
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
    ccall((:aws_lookup_table_hex_to_num_get, libaws_c_common), Ptr{UInt8}, ())
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
    ccall((:aws_byte_cursor_compare_lexical, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}), lhs, rhs)
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
    ccall((:aws_byte_cursor_compare_lookup, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_cursor}, Ptr{UInt8}), lhs, rhs, lookup_table)
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
    ccall((:aws_byte_buf_from_c_str, libaws_c_common), aws_byte_buf, (Ptr{Cchar},), c_str)
end

"""
    aws_byte_buf_from_array(bytes, len)

### Prototype
```c
struct aws_byte_buf aws_byte_buf_from_array(const void *bytes, size_t len);
```
"""
function aws_byte_buf_from_array(bytes, len)
    ccall((:aws_byte_buf_from_array, libaws_c_common), aws_byte_buf, (Ptr{Cvoid}, Csize_t), bytes, len)
end

"""
    aws_byte_buf_from_empty_array(bytes, capacity)

### Prototype
```c
struct aws_byte_buf aws_byte_buf_from_empty_array(const void *bytes, size_t capacity);
```
"""
function aws_byte_buf_from_empty_array(bytes, capacity)
    ccall((:aws_byte_buf_from_empty_array, libaws_c_common), aws_byte_buf, (Ptr{Cvoid}, Csize_t), bytes, capacity)
end

"""
    aws_byte_cursor_from_buf(buf)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_buf(const struct aws_byte_buf *const buf);
```
"""
function aws_byte_cursor_from_buf(buf)
    ccall((:aws_byte_cursor_from_buf, libaws_c_common), aws_byte_cursor, (Ptr{aws_byte_buf},), buf)
end

"""
    aws_byte_cursor_from_c_str(c_str)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_c_str(const char *c_str);
```
"""
function aws_byte_cursor_from_c_str(c_str)
    ccall((:aws_byte_cursor_from_c_str, libaws_c_common), aws_byte_cursor, (Ptr{Cchar},), c_str)
end

"""
    aws_byte_cursor_from_array(bytes, len)

### Prototype
```c
struct aws_byte_cursor aws_byte_cursor_from_array(const void *const bytes, const size_t len);
```
"""
function aws_byte_cursor_from_array(bytes, len)
    ccall((:aws_byte_cursor_from_array, libaws_c_common), aws_byte_cursor, (Ptr{Cvoid}, Csize_t), bytes, len)
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
    ccall((:aws_byte_cursor_advance, libaws_c_common), aws_byte_cursor, (Ptr{aws_byte_cursor}, Csize_t), cursor, len)
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
    ccall((:aws_byte_cursor_advance_nospec, libaws_c_common), aws_byte_cursor, (Ptr{aws_byte_cursor}, Csize_t), cursor, len)
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
    ccall((:aws_byte_cursor_read, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{Cvoid}, Csize_t), cur, dest, len)
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
    ccall((:aws_byte_cursor_read_and_fill_buffer, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), cur, dest)
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
    ccall((:aws_byte_cursor_read_u8, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt8}), cur, var)
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
    ccall((:aws_byte_cursor_read_be16, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt16}), cur, var)
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
    ccall((:aws_byte_cursor_read_be24, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt32}), cur, var)
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
    ccall((:aws_byte_cursor_read_be32, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt32}), cur, var)
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
    ccall((:aws_byte_cursor_read_be64, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt64}), cur, var)
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
    ccall((:aws_byte_cursor_read_float_be32, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{Cfloat}), cur, var)
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
    ccall((:aws_byte_cursor_read_float_be64, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{Cdouble}), cur, var)
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
    ccall((:aws_byte_cursor_read_hex_u8, libaws_c_common), Bool, (Ptr{aws_byte_cursor}, Ptr{UInt8}), cur, var)
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
    ccall((:aws_byte_buf_advance, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Ptr{aws_byte_buf}, Csize_t), buffer, output, len)
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
    ccall((:aws_byte_buf_write, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Ptr{UInt8}, Csize_t), buf, src, len)
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
    ccall((:aws_byte_buf_write_from_whole_buffer, libaws_c_common), Bool, (Ptr{aws_byte_buf}, aws_byte_buf), buf, src)
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
    ccall((:aws_byte_buf_write_from_whole_cursor, libaws_c_common), Bool, (Ptr{aws_byte_buf}, aws_byte_cursor), buf, src)
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
    ccall((:aws_byte_buf_write_to_capacity, libaws_c_common), aws_byte_cursor, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buf, advancing_cursor)
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
    ccall((:aws_byte_buf_write_u8, libaws_c_common), Bool, (Ptr{aws_byte_buf}, UInt8), buf, c)
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
    ccall((:aws_byte_buf_write_u8_n, libaws_c_common), Bool, (Ptr{aws_byte_buf}, UInt8, Csize_t), buf, c, count)
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
    ccall((:aws_byte_buf_write_be16, libaws_c_common), Bool, (Ptr{aws_byte_buf}, UInt16), buf, x)
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
    ccall((:aws_byte_buf_write_be24, libaws_c_common), Bool, (Ptr{aws_byte_buf}, UInt32), buf, x)
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
    ccall((:aws_byte_buf_write_be32, libaws_c_common), Bool, (Ptr{aws_byte_buf}, UInt32), buf, x)
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
    ccall((:aws_byte_buf_write_float_be32, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Cfloat), buf, x)
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
    ccall((:aws_byte_buf_write_be64, libaws_c_common), Bool, (Ptr{aws_byte_buf}, UInt64), buf, x)
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
    ccall((:aws_byte_buf_write_float_be64, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Cdouble), buf, x)
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
    ccall((:aws_isalnum, libaws_c_common), Bool, (UInt8,), ch)
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
    ccall((:aws_isalpha, libaws_c_common), Bool, (UInt8,), ch)
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
    ccall((:aws_isdigit, libaws_c_common), Bool, (UInt8,), ch)
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
    ccall((:aws_isxdigit, libaws_c_common), Bool, (UInt8,), ch)
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
    ccall((:aws_isspace, libaws_c_common), Bool, (UInt8,), ch)
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
    ccall((:aws_byte_cursor_utf8_parse_u64, libaws_c_common), Cint, (aws_byte_cursor, Ptr{UInt64}), cursor, dst)
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
    ccall((:aws_byte_cursor_utf8_parse_u64_hex, libaws_c_common), Cint, (aws_byte_cursor, Ptr{UInt64}), cursor, dst)
end

struct aws_linked_list_node
    next::Ptr{aws_linked_list_node}
    prev::Ptr{aws_linked_list_node}
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
    ccall((:aws_linked_list_node_reset, libaws_c_common), Cvoid, (Ptr{aws_linked_list_node},), node)
end

struct aws_linked_list
    head::aws_linked_list_node
    tail::aws_linked_list_node
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
    ccall((:aws_linked_list_empty, libaws_c_common), Bool, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_is_valid, libaws_c_common), Bool, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_node_next_is_valid, libaws_c_common), Bool, (Ptr{aws_linked_list_node},), node)
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
    ccall((:aws_linked_list_node_prev_is_valid, libaws_c_common), Bool, (Ptr{aws_linked_list_node},), node)
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
    ccall((:aws_linked_list_is_valid_deep, libaws_c_common), Bool, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_init, libaws_c_common), Cvoid, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_begin, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_end, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_rbegin, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_rend, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_next, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list_node},), node)
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
    ccall((:aws_linked_list_prev, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list_node},), node)
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
    ccall((:aws_linked_list_insert_after, libaws_c_common), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), after, to_add)
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
    ccall((:aws_linked_list_swap_nodes, libaws_c_common), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), a, b)
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
    ccall((:aws_linked_list_insert_before, libaws_c_common), Cvoid, (Ptr{aws_linked_list_node}, Ptr{aws_linked_list_node}), before, to_add)
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
    ccall((:aws_linked_list_remove, libaws_c_common), Cvoid, (Ptr{aws_linked_list_node},), node)
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
    ccall((:aws_linked_list_push_back, libaws_c_common), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list_node}), list, node)
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
    ccall((:aws_linked_list_back, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_pop_back, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_push_front, libaws_c_common), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list_node}), list, node)
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
    ccall((:aws_linked_list_front, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
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
    ccall((:aws_linked_list_pop_front, libaws_c_common), Ptr{aws_linked_list_node}, (Ptr{aws_linked_list},), list)
end

"""
    aws_linked_list_swap_contents(a, b)

### Prototype
```c
AWS_STATIC_IMPL void aws_linked_list_swap_contents( struct aws_linked_list *AWS_RESTRICT a, struct aws_linked_list *AWS_RESTRICT b);
```
"""
function aws_linked_list_swap_contents(a, b)
    ccall((:aws_linked_list_swap_contents, libaws_c_common), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), a, b)
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
    ccall((:aws_linked_list_move_all_back, libaws_c_common), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), dst, src)
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
    ccall((:aws_linked_list_move_all_front, libaws_c_common), Cvoid, (Ptr{aws_linked_list}, Ptr{aws_linked_list}), dst, src)
end

struct aws_cache_vtable
    destroy::Ptr{Cvoid}
    find::Ptr{Cvoid}
    put::Ptr{Cvoid}
    remove::Ptr{Cvoid}
    clear::Ptr{Cvoid}
    get_element_count::Ptr{Cvoid}
end

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

# typedef void ( aws_hash_callback_destroy_fn ) ( void * key_or_value )
"""
Prototype for a hash table key or value destructor function pointer.

This function is used to destroy elements in the hash table when the table is cleared or cleaned up.

Note that functions which remove individual elements from the hash table provide options of whether or not to invoke the destructors on the key and value of a removed element.
"""
const aws_hash_callback_destroy_fn = Cvoid

"""
    aws_linked_hash_table

Simple linked hash table. Preserves insertion order, and can be iterated in insertion order.

You can also change the order safely without altering the shape of the underlying hash table.
"""
struct aws_linked_hash_table
    allocator::Ptr{aws_allocator}
    list::aws_linked_list
    table::aws_hash_table
    user_on_value_destroy::Ptr{aws_hash_callback_destroy_fn}
    user_on_key_destroy::Ptr{aws_hash_callback_destroy_fn}
end

"""
    aws_cache

Base stucture for caches, used the linked hash table implementation.
"""
struct aws_cache
    allocator::Ptr{aws_allocator}
    vtable::Ptr{aws_cache_vtable}
    table::aws_linked_hash_table
    max_items::Csize_t
    impl::Ptr{Cvoid}
end

"""
    aws_cache_base_default_destroy(cache)

### Prototype
```c
void aws_cache_base_default_destroy(struct aws_cache *cache);
```
"""
function aws_cache_base_default_destroy(cache)
    ccall((:aws_cache_base_default_destroy, libaws_c_common), Cvoid, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_base_default_find(cache, key, p_value)

### Prototype
```c
int aws_cache_base_default_find(struct aws_cache *cache, const void *key, void **p_value);
```
"""
function aws_cache_base_default_find(cache, key, p_value)
    ccall((:aws_cache_base_default_find, libaws_c_common), Cint, (Ptr{aws_cache}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), cache, key, p_value)
end

"""
    aws_cache_base_default_remove(cache, key)

### Prototype
```c
int aws_cache_base_default_remove(struct aws_cache *cache, const void *key);
```
"""
function aws_cache_base_default_remove(cache, key)
    ccall((:aws_cache_base_default_remove, libaws_c_common), Cint, (Ptr{aws_cache}, Ptr{Cvoid}), cache, key)
end

"""
    aws_cache_base_default_clear(cache)

### Prototype
```c
void aws_cache_base_default_clear(struct aws_cache *cache);
```
"""
function aws_cache_base_default_clear(cache)
    ccall((:aws_cache_base_default_clear, libaws_c_common), Cvoid, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_base_default_get_element_count(cache)

### Prototype
```c
size_t aws_cache_base_default_get_element_count(const struct aws_cache *cache);
```
"""
function aws_cache_base_default_get_element_count(cache)
    ccall((:aws_cache_base_default_get_element_count, libaws_c_common), Csize_t, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_destroy(cache)

Cleans up the cache. Elements in the cache will be evicted and cleanup callbacks will be invoked.

### Prototype
```c
void aws_cache_destroy(struct aws_cache *cache);
```
"""
function aws_cache_destroy(cache)
    ccall((:aws_cache_destroy, libaws_c_common), Cvoid, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_find(cache, key, p_value)

Finds element in the cache by key. If found, *p\\_value will hold the stored value, and [`AWS_OP_SUCCESS`](@ref) will be returned. If not found, [`AWS_OP_SUCCESS`](@ref) will be returned and *p\\_value will be NULL.

If any errors occur [`AWS_OP_ERR`](@ref) will be returned.

### Prototype
```c
int aws_cache_find(struct aws_cache *cache, const void *key, void **p_value);
```
"""
function aws_cache_find(cache, key, p_value)
    ccall((:aws_cache_find, libaws_c_common), Cint, (Ptr{aws_cache}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), cache, key, p_value)
end

"""
    aws_cache_put(cache, key, p_value)

Puts `p_value` at `key`. If an element is already stored at `key` it will be replaced. If the cache is already full, an item will be removed based on the cache policy.

### Prototype
```c
int aws_cache_put(struct aws_cache *cache, const void *key, void *p_value);
```
"""
function aws_cache_put(cache, key, p_value)
    ccall((:aws_cache_put, libaws_c_common), Cint, (Ptr{aws_cache}, Ptr{Cvoid}, Ptr{Cvoid}), cache, key, p_value)
end

"""
    aws_cache_remove(cache, key)

Removes item at `key` from the cache.

### Prototype
```c
int aws_cache_remove(struct aws_cache *cache, const void *key);
```
"""
function aws_cache_remove(cache, key)
    ccall((:aws_cache_remove, libaws_c_common), Cint, (Ptr{aws_cache}, Ptr{Cvoid}), cache, key)
end

"""
    aws_cache_clear(cache)

Clears all items from the cache.

### Prototype
```c
void aws_cache_clear(struct aws_cache *cache);
```
"""
function aws_cache_clear(cache)
    ccall((:aws_cache_clear, libaws_c_common), Cvoid, (Ptr{aws_cache},), cache)
end

"""
    aws_cache_get_element_count(cache)

Returns the number of elements in the cache.

### Prototype
```c
size_t aws_cache_get_element_count(const struct aws_cache *cache);
```
"""
function aws_cache_get_element_count(cache)
    ccall((:aws_cache_get_element_count, libaws_c_common), Csize_t, (Ptr{aws_cache},), cache)
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
    ccall((:aws_timestamp_convert, libaws_c_common), UInt64, (UInt64, aws_timestamp_unit, aws_timestamp_unit, Ptr{UInt64}), timestamp, convert_from, convert_to, remainder)
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
    ccall((:aws_timestamp_convert_u64, libaws_c_common), UInt64, (UInt64, UInt64, UInt64, Ptr{UInt64}), ticks, old_frequency, new_frequency, remainder)
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
    ccall((:aws_high_res_clock_get_ticks, libaws_c_common), Cint, (Ptr{UInt64},), timestamp)
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
    ccall((:aws_sys_clock_get_ticks, libaws_c_common), Cint, (Ptr{UInt64},), timestamp)
end

@cenum aws_cli_options_has_arg::UInt32 begin
    AWS_CLI_OPTIONS_NO_ARGUMENT = 0
    AWS_CLI_OPTIONS_REQUIRED_ARGUMENT = 1
    AWS_CLI_OPTIONS_OPTIONAL_ARGUMENT = 2
end

# typedef int ( aws_cli_options_subcommand_fn ) ( int argc , char * const argv [ ] , const char * command_name , void * user_data )
"""
Invoked when a subcommand is encountered. argc and argv[] begins at the command encountered. command\\_name is the name of the command being handled.
"""
const aws_cli_options_subcommand_fn = Cvoid

"""
    aws_cli_subcommand_dispatch

Dispatch table to dispatch cli commands from. command\\_name should be the exact string for the command you want to handle from the command line.
"""
struct aws_cli_subcommand_dispatch
    subcommand_fn::Ptr{aws_cli_options_subcommand_fn}
    command_name::Ptr{Cchar}
end

struct aws_cli_option
    name::Ptr{Cchar}
    has_arg::aws_cli_options_has_arg
    flag::Ptr{Cint}
    val::Cint
end

"""
    aws_cli_getopt_long(argc, argv, optstring, longopts, longindex)

A mostly compliant implementation of posix getopt\\_long(). Parses command-line arguments. argc is the number of command line arguments passed in argv. optstring contains the legitimate option characters. The option characters correspond to [`aws_cli_option`](@ref)::val. If the character is followed by a :, the option requires an argument. If it is followed by '::', the argument is optional (not implemented yet).

longopts, is an array of struct [`aws_cli_option`](@ref). These are the allowed options for the program. The last member of the array must be zero initialized.

If longindex is non-null, it will be set to the index in longopts, for the found option.

Returns option val if it was found, '?' if an option was encountered that was not specified in the option string, 0x02 (START\\_OF\\_TEXT) will be returned if a positional argument was encountered. returns -1 when all arguments that can be parsed have been parsed.

### Prototype
```c
int aws_cli_getopt_long( int argc, char *const argv[], const char *optstring, const struct aws_cli_option *longopts, int *longindex);
```
"""
function aws_cli_getopt_long(argc, argv, optstring, longopts, longindex)
    ccall((:aws_cli_getopt_long, libaws_c_common), Cint, (Cint, Ptr{Ptr{Cchar}}, Ptr{Cchar}, Ptr{aws_cli_option}, Ptr{Cint}), argc, argv, optstring, longopts, longindex)
end

"""
    aws_cli_reset_state()

Resets global parser state for use in another parser run for the application.

### Prototype
```c
void aws_cli_reset_state(void);
```
"""
function aws_cli_reset_state()
    ccall((:aws_cli_reset_state, libaws_c_common), Cvoid, ())
end

"""
    aws_cli_dispatch_on_subcommand(argc, argv, dispatch_table, table_length, user_data)

Dispatches the current command line arguments with a subcommand from the second input argument in argv[], if dispatch table contains a command that matches the argument. When the command is dispatched, argc and argv will be updated to reflect the new argument count. The cli options are required to come after the subcommand. If either, no dispatch was found or there was no argument passed to the program, this function will return [`AWS_OP_ERR`](@ref). Check [`aws_last_error`](@ref)() for details on the error.

### Parameters
* `argc`: number of arguments passed to int main()
* `argv`: the arguments passed to int main()
* `parse_cb,`: optional, specify NULL if you don't want to handle this. This argument is for parsing "meta" commands from the command line options prior to dispatch occurring.
* `dispatch_table`: table containing functions and command name to dispatch on.
* `table_length`: number of entries in dispatch\\_table.
### Returns
[`AWS_OP_SUCCESS`](@ref)(0) on success, [`AWS_OP_ERR`](@ref)(-1) on failure
### Prototype
```c
int aws_cli_dispatch_on_subcommand( int argc, char *const argv[], struct aws_cli_subcommand_dispatch *dispatch_table, int table_length, void *user_data);
```
"""
function aws_cli_dispatch_on_subcommand(argc, argv, dispatch_table, table_length, user_data)
    ccall((:aws_cli_dispatch_on_subcommand, libaws_c_common), Cint, (Cint, Ptr{Ptr{Cchar}}, Ptr{aws_cli_subcommand_dispatch}, Cint, Ptr{Cvoid}), argc, argv, dispatch_table, table_length, user_data)
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
    ccall((:aws_common_library_init, libaws_c_common), Cvoid, (Ptr{aws_allocator},), allocator)
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
    ccall((:aws_common_library_clean_up, libaws_c_common), Cvoid, ())
end

"""
    aws_common_fatal_assert_library_initialized()

### Prototype
```c
void aws_common_fatal_assert_library_initialized(void);
```
"""
function aws_common_fatal_assert_library_initialized()
    ccall((:aws_common_fatal_assert_library_initialized, libaws_c_common), Cvoid, ())
end

# typedef bool ( aws_condition_predicate_fn ) ( void * )
const aws_condition_predicate_fn = Cvoid

struct aws_condition_variable
    condition_handle::Ptr{Cvoid}
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
    ccall((:aws_condition_variable_init, libaws_c_common), Cint, (Ptr{aws_condition_variable},), condition_variable)
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
    ccall((:aws_condition_variable_clean_up, libaws_c_common), Cvoid, (Ptr{aws_condition_variable},), condition_variable)
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
    ccall((:aws_condition_variable_notify_one, libaws_c_common), Cint, (Ptr{aws_condition_variable},), condition_variable)
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
    ccall((:aws_condition_variable_notify_all, libaws_c_common), Cint, (Ptr{aws_condition_variable},), condition_variable)
end

struct aws_mutex
    mutex_handle::Ptr{Cvoid}
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
    ccall((:aws_condition_variable_wait, libaws_c_common), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}), condition_variable, mutex)
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
    ccall((:aws_condition_variable_wait_pred, libaws_c_common), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Ptr{aws_condition_predicate_fn}, Ptr{Cvoid}), condition_variable, mutex, pred, pred_ctx)
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
    ccall((:aws_condition_variable_wait_for, libaws_c_common), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Int64), condition_variable, mutex, time_to_wait)
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
    ccall((:aws_condition_variable_wait_for_pred, libaws_c_common), Cint, (Ptr{aws_condition_variable}, Ptr{aws_mutex}, Int64, Ptr{aws_condition_predicate_fn}, Ptr{Cvoid}), condition_variable, mutex, time_to_wait, pred, pred_ctx)
end

@cenum aws_cpu_feature_name::UInt32 begin
    AWS_CPU_FEATURE_CLMUL = 0
    AWS_CPU_FEATURE_SSE_4_1 = 1
    AWS_CPU_FEATURE_SSE_4_2 = 2
    AWS_CPU_FEATURE_AVX2 = 3
    AWS_CPU_FEATURE_AVX512 = 4
    AWS_CPU_FEATURE_ARM_CRC = 5
    AWS_CPU_FEATURE_BMI2 = 6
    AWS_CPU_FEATURE_VPCLMULQDQ = 7
    AWS_CPU_FEATURE_COUNT = 8
end

"""
    aws_cpu_has_feature(feature_name)

Returns true if a cpu feature is supported, false otherwise.

### Prototype
```c
bool aws_cpu_has_feature(enum aws_cpu_feature_name feature_name);
```
"""
function aws_cpu_has_feature(feature_name)
    ccall((:aws_cpu_has_feature, libaws_c_common), Bool, (aws_cpu_feature_name,), feature_name)
end

mutable struct aws_cross_process_lock end

"""
    aws_cross_process_lock_try_acquire(allocator, instance_nonce)

Attempts to acquire a system-wide (not per process or per user) lock scoped by instance\\_nonce. For any given unique nonce, a lock will be returned by the first caller. Subsequent calls will return NULL and raise AWS\\_ERROR\\_MUTEX\\_CALLER\\_NOT\\_OWNER until the either the process owning the lock exits or the program owning the lock calls [`aws_cross_process_lock_release`](@ref)() explicitly.

If the process exits before the lock is released, the kernel will unlock it for the next consumer.

### Prototype
```c
struct aws_cross_process_lock *aws_cross_process_lock_try_acquire( struct aws_allocator *allocator, struct aws_byte_cursor instance_nonce);
```
"""
function aws_cross_process_lock_try_acquire(allocator, instance_nonce)
    ccall((:aws_cross_process_lock_try_acquire, libaws_c_common), Ptr{aws_cross_process_lock}, (Ptr{aws_allocator}, aws_byte_cursor), allocator, instance_nonce)
end

"""
    aws_cross_process_lock_release(instance_lock)

Releases the lock so the next caller (may be another process) can get an instance of the lock.

### Prototype
```c
void aws_cross_process_lock_release(struct aws_cross_process_lock *instance_lock);
```
"""
function aws_cross_process_lock_release(instance_lock)
    ccall((:aws_cross_process_lock_release, libaws_c_common), Cvoid, (Ptr{aws_cross_process_lock},), instance_lock)
end

@cenum __JL_Ctag_93::UInt32 begin
    AWS_DATE_TIME_STR_MAX_LEN = 100
    AWS_DATE_TIME_STR_MAX_BASIC_LEN = 20
end

@cenum aws_date_format::UInt32 begin
    AWS_DATE_FORMAT_RFC822 = 0
    AWS_DATE_FORMAT_ISO_8601 = 1
    AWS_DATE_FORMAT_ISO_8601_BASIC = 2
    AWS_DATE_FORMAT_AUTO_DETECT = 3
end

@cenum aws_date_month::UInt32 begin
    AWS_DATE_MONTH_JANUARY = 0
    AWS_DATE_MONTH_FEBRUARY = 1
    AWS_DATE_MONTH_MARCH = 2
    AWS_DATE_MONTH_APRIL = 3
    AWS_DATE_MONTH_MAY = 4
    AWS_DATE_MONTH_JUNE = 5
    AWS_DATE_MONTH_JULY = 6
    AWS_DATE_MONTH_AUGUST = 7
    AWS_DATE_MONTH_SEPTEMBER = 8
    AWS_DATE_MONTH_OCTOBER = 9
    AWS_DATE_MONTH_NOVEMBER = 10
    AWS_DATE_MONTH_DECEMBER = 11
end

@cenum aws_date_day_of_week::UInt32 begin
    AWS_DATE_DAY_OF_WEEK_SUNDAY = 0
    AWS_DATE_DAY_OF_WEEK_MONDAY = 1
    AWS_DATE_DAY_OF_WEEK_TUESDAY = 2
    AWS_DATE_DAY_OF_WEEK_WEDNESDAY = 3
    AWS_DATE_DAY_OF_WEEK_THURSDAY = 4
    AWS_DATE_DAY_OF_WEEK_FRIDAY = 5
    AWS_DATE_DAY_OF_WEEK_SATURDAY = 6
end

struct aws_date_time
    data::NTuple{96, UInt8}
end

function Base.getproperty(x::Ptr{aws_date_time}, f::Symbol)
    f === :timestamp && return Ptr{time_t}(x + 0)
    f === :milliseconds && return Ptr{UInt16}(x + 8)
    f === :tz && return Ptr{NTuple{6, Cchar}}(x + 10)
    f === :gmt_time && return Ptr{tm}(x + 16)
    f === :local_time && return Ptr{tm}(x + 52)
    f === :utc_assumed && return Ptr{Bool}(x + 88)
    return getfield(x, f)
end

function Base.getproperty(x::aws_date_time, f::Symbol)
    r = Ref{aws_date_time}(x)
    ptr = Base.unsafe_convert(Ptr{aws_date_time}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_date_time}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    aws_date_time_init_now(dt)

Initializes dt to be the current system time.

### Prototype
```c
void aws_date_time_init_now(struct aws_date_time *dt);
```
"""
function aws_date_time_init_now(dt)
    ccall((:aws_date_time_init_now, libaws_c_common), Cvoid, (Ptr{aws_date_time},), dt)
end

"""
    aws_date_time_init_epoch_millis(dt, ms_since_epoch)

Initializes dt to be the time represented in milliseconds since unix epoch.

### Prototype
```c
void aws_date_time_init_epoch_millis(struct aws_date_time *dt, uint64_t ms_since_epoch);
```
"""
function aws_date_time_init_epoch_millis(dt, ms_since_epoch)
    ccall((:aws_date_time_init_epoch_millis, libaws_c_common), Cvoid, (Ptr{aws_date_time}, UInt64), dt, ms_since_epoch)
end

"""
    aws_date_time_init_epoch_secs(dt, sec_ms)

Initializes dt to be the time represented in seconds.millis since unix epoch.

### Prototype
```c
void aws_date_time_init_epoch_secs(struct aws_date_time *dt, double sec_ms);
```
"""
function aws_date_time_init_epoch_secs(dt, sec_ms)
    ccall((:aws_date_time_init_epoch_secs, libaws_c_common), Cvoid, (Ptr{aws_date_time}, Cdouble), dt, sec_ms)
end

"""
    aws_date_time_init_from_str(dt, date_str, fmt)

Initializes dt to be the time represented by date\\_str in format 'fmt'. Returns [`AWS_OP_SUCCESS`](@ref) if the string was successfully parsed, returns [`AWS_OP_ERR`](@ref) if parsing failed.

The parser is lenient regarding AWS\\_DATE\\_FORMAT\\_ISO\\_8601 vs AWS\\_DATE\\_FORMAT\\_ISO\\_8601\\_BASIC. Regardless of which you pass in, both "2002-10-02T08:05:09Z" and "20021002T080509Z" would be accepted.

Notes for AWS\\_DATE\\_FORMAT\\_RFC822: If no time zone information is provided, it is assumed to be local time (please don't do this).

Only time zones indicating Universal Time (e.g. Z, UT, UTC, or GMT), or offsets from UTC (e.g. +0100, -0700), are accepted.

Really, it's just better if you always use Universal Time.

### Prototype
```c
int aws_date_time_init_from_str( struct aws_date_time *dt, const struct aws_byte_buf *date_str, enum aws_date_format fmt);
```
"""
function aws_date_time_init_from_str(dt, date_str, fmt)
    ccall((:aws_date_time_init_from_str, libaws_c_common), Cint, (Ptr{aws_date_time}, Ptr{aws_byte_buf}, aws_date_format), dt, date_str, fmt)
end

"""
    aws_date_time_init_from_str_cursor(dt, date_str_cursor, fmt)

aws\\_date\\_time\\_init variant that takes a byte\\_cursor rather than a byte\\_buf

### Prototype
```c
int aws_date_time_init_from_str_cursor( struct aws_date_time *dt, const struct aws_byte_cursor *date_str_cursor, enum aws_date_format fmt);
```
"""
function aws_date_time_init_from_str_cursor(dt, date_str_cursor, fmt)
    ccall((:aws_date_time_init_from_str_cursor, libaws_c_common), Cint, (Ptr{aws_date_time}, Ptr{aws_byte_cursor}, aws_date_format), dt, date_str_cursor, fmt)
end

"""
    aws_date_time_to_local_time_str(dt, fmt, output_buf)

Copies the current time as a formatted date string in local time into output\\_buf. If buffer is too small, it will return [`AWS_OP_ERR`](@ref). A good size suggestion is AWS\\_DATE\\_TIME\\_STR\\_MAX\\_LEN bytes. AWS\\_DATE\\_FORMAT\\_AUTO\\_DETECT is not allowed.

### Prototype
```c
int aws_date_time_to_local_time_str( const struct aws_date_time *dt, enum aws_date_format fmt, struct aws_byte_buf *output_buf);
```
"""
function aws_date_time_to_local_time_str(dt, fmt, output_buf)
    ccall((:aws_date_time_to_local_time_str, libaws_c_common), Cint, (Ptr{aws_date_time}, aws_date_format, Ptr{aws_byte_buf}), dt, fmt, output_buf)
end

"""
    aws_date_time_to_utc_time_str(dt, fmt, output_buf)

Copies the current time as a formatted date string in utc time into output\\_buf. If buffer is too small, it will return [`AWS_OP_ERR`](@ref). A good size suggestion is AWS\\_DATE\\_TIME\\_STR\\_MAX\\_LEN bytes. AWS\\_DATE\\_FORMAT\\_AUTO\\_DETECT is not allowed.

### Prototype
```c
int aws_date_time_to_utc_time_str( const struct aws_date_time *dt, enum aws_date_format fmt, struct aws_byte_buf *output_buf);
```
"""
function aws_date_time_to_utc_time_str(dt, fmt, output_buf)
    ccall((:aws_date_time_to_utc_time_str, libaws_c_common), Cint, (Ptr{aws_date_time}, aws_date_format, Ptr{aws_byte_buf}), dt, fmt, output_buf)
end

"""
    aws_date_time_to_local_time_short_str(dt, fmt, output_buf)

Copies the current time as a formatted short date string in local time into output\\_buf. If buffer is too small, it will return [`AWS_OP_ERR`](@ref). A good size suggestion is AWS\\_DATE\\_TIME\\_STR\\_MAX\\_LEN bytes. AWS\\_DATE\\_FORMAT\\_AUTO\\_DETECT is not allowed.

### Prototype
```c
int aws_date_time_to_local_time_short_str( const struct aws_date_time *dt, enum aws_date_format fmt, struct aws_byte_buf *output_buf);
```
"""
function aws_date_time_to_local_time_short_str(dt, fmt, output_buf)
    ccall((:aws_date_time_to_local_time_short_str, libaws_c_common), Cint, (Ptr{aws_date_time}, aws_date_format, Ptr{aws_byte_buf}), dt, fmt, output_buf)
end

"""
    aws_date_time_to_utc_time_short_str(dt, fmt, output_buf)

Copies the current time as a formatted short date string in utc time into output\\_buf. If buffer is too small, it will return [`AWS_OP_ERR`](@ref). A good size suggestion is AWS\\_DATE\\_TIME\\_STR\\_MAX\\_LEN bytes. AWS\\_DATE\\_FORMAT\\_AUTO\\_DETECT is not allowed.

### Prototype
```c
int aws_date_time_to_utc_time_short_str( const struct aws_date_time *dt, enum aws_date_format fmt, struct aws_byte_buf *output_buf);
```
"""
function aws_date_time_to_utc_time_short_str(dt, fmt, output_buf)
    ccall((:aws_date_time_to_utc_time_short_str, libaws_c_common), Cint, (Ptr{aws_date_time}, aws_date_format, Ptr{aws_byte_buf}), dt, fmt, output_buf)
end

"""
    aws_date_time_as_epoch_secs(dt)

### Prototype
```c
double aws_date_time_as_epoch_secs(const struct aws_date_time *dt);
```
"""
function aws_date_time_as_epoch_secs(dt)
    ccall((:aws_date_time_as_epoch_secs, libaws_c_common), Cdouble, (Ptr{aws_date_time},), dt)
end

"""
    aws_date_time_as_nanos(dt)

### Prototype
```c
uint64_t aws_date_time_as_nanos(const struct aws_date_time *dt);
```
"""
function aws_date_time_as_nanos(dt)
    ccall((:aws_date_time_as_nanos, libaws_c_common), UInt64, (Ptr{aws_date_time},), dt)
end

"""
    aws_date_time_as_millis(dt)

### Prototype
```c
uint64_t aws_date_time_as_millis(const struct aws_date_time *dt);
```
"""
function aws_date_time_as_millis(dt)
    ccall((:aws_date_time_as_millis, libaws_c_common), UInt64, (Ptr{aws_date_time},), dt)
end

"""
    aws_date_time_year(dt, local_time)

### Prototype
```c
uint16_t aws_date_time_year(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_year(dt, local_time)
    ccall((:aws_date_time_year, libaws_c_common), UInt16, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_month(dt, local_time)

### Prototype
```c
enum aws_date_month aws_date_time_month(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_month(dt, local_time)
    ccall((:aws_date_time_month, libaws_c_common), aws_date_month, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_month_day(dt, local_time)

### Prototype
```c
uint8_t aws_date_time_month_day(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_month_day(dt, local_time)
    ccall((:aws_date_time_month_day, libaws_c_common), UInt8, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_day_of_week(dt, local_time)

### Prototype
```c
enum aws_date_day_of_week aws_date_time_day_of_week(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_day_of_week(dt, local_time)
    ccall((:aws_date_time_day_of_week, libaws_c_common), aws_date_day_of_week, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_hour(dt, local_time)

### Prototype
```c
uint8_t aws_date_time_hour(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_hour(dt, local_time)
    ccall((:aws_date_time_hour, libaws_c_common), UInt8, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_minute(dt, local_time)

### Prototype
```c
uint8_t aws_date_time_minute(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_minute(dt, local_time)
    ccall((:aws_date_time_minute, libaws_c_common), UInt8, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_second(dt, local_time)

### Prototype
```c
uint8_t aws_date_time_second(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_second(dt, local_time)
    ccall((:aws_date_time_second, libaws_c_common), UInt8, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_dst(dt, local_time)

### Prototype
```c
bool aws_date_time_dst(const struct aws_date_time *dt, bool local_time);
```
"""
function aws_date_time_dst(dt, local_time)
    ccall((:aws_date_time_dst, libaws_c_common), Bool, (Ptr{aws_date_time}, Bool), dt, local_time)
end

"""
    aws_date_time_diff(a, b)

returns the difference of a and b (a - b) in seconds.

### Prototype
```c
time_t aws_date_time_diff(const struct aws_date_time *a, const struct aws_date_time *b);
```
"""
function aws_date_time_diff(a, b)
    ccall((:aws_date_time_diff, libaws_c_common), time_t, (Ptr{aws_date_time}, Ptr{aws_date_time}), a, b)
end

"""
    aws_device_random_u64(output)

Get an unpredictably random 64bit number, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_u64(uint64_t *output);
```
"""
function aws_device_random_u64(output)
    ccall((:aws_device_random_u64, libaws_c_common), Cint, (Ptr{UInt64},), output)
end

"""
    aws_device_random_u32(output)

Get an unpredictably random 32bit number, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_u32(uint32_t *output);
```
"""
function aws_device_random_u32(output)
    ccall((:aws_device_random_u32, libaws_c_common), Cint, (Ptr{UInt32},), output)
end

"""
    aws_device_random_u16(output)

Get an unpredictably random 16bit number, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_u16(uint16_t *output);
```
"""
function aws_device_random_u16(output)
    ccall((:aws_device_random_u16, libaws_c_common), Cint, (Ptr{UInt16},), output)
end

"""
    aws_device_random_u8(output)

Get an unpredictably random 8bit number, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_u8(uint8_t *output);
```
"""
function aws_device_random_u8(output)
    ccall((:aws_device_random_u8, libaws_c_common), Cint, (Ptr{UInt8},), output)
end

"""
    aws_device_random_buffer(output)

Fill the rest of a buffer with unpredictably random bytes, suitable for cryptographic use.

### Prototype
```c
int aws_device_random_buffer(struct aws_byte_buf *output);
```
"""
function aws_device_random_buffer(output)
    ccall((:aws_device_random_buffer, libaws_c_common), Cint, (Ptr{aws_byte_buf},), output)
end

"""
    aws_device_random_buffer_append(output, n)

Write N unpredictably random bytes to a buffer, suitable for cryptographic use. If there is insufficient space in the buffer, AWS\\_ERROR\\_SHORT\\_BUFFER is raised and the buffer will be unchanged.

### Prototype
```c
int aws_device_random_buffer_append(struct aws_byte_buf *output, size_t n);
```
"""
function aws_device_random_buffer_append(output, n)
    ccall((:aws_device_random_buffer_append, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Csize_t), output, n)
end

"""
    aws_hex_compute_encoded_len(to_encode_len, encoded_length)

### Prototype
```c
int aws_hex_compute_encoded_len(size_t to_encode_len, size_t *encoded_length);
```
"""
function aws_hex_compute_encoded_len(to_encode_len, encoded_length)
    ccall((:aws_hex_compute_encoded_len, libaws_c_common), Cint, (Csize_t, Ptr{Csize_t}), to_encode_len, encoded_length)
end

"""
    aws_hex_encode(to_encode, output)

### Prototype
```c
int aws_hex_encode(const struct aws_byte_cursor *AWS_RESTRICT to_encode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_hex_encode(to_encode, output)
    ccall((:aws_hex_encode, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_encode, output)
end

"""
    aws_hex_encode_append_dynamic(to_encode, output)

### Prototype
```c
int aws_hex_encode_append_dynamic( const struct aws_byte_cursor *AWS_RESTRICT to_encode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_hex_encode_append_dynamic(to_encode, output)
    ccall((:aws_hex_encode_append_dynamic, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_encode, output)
end

"""
    aws_hex_compute_decoded_len(to_decode_len, decoded_len)

### Prototype
```c
int aws_hex_compute_decoded_len(size_t to_decode_len, size_t *decoded_len);
```
"""
function aws_hex_compute_decoded_len(to_decode_len, decoded_len)
    ccall((:aws_hex_compute_decoded_len, libaws_c_common), Cint, (Csize_t, Ptr{Csize_t}), to_decode_len, decoded_len)
end

"""
    aws_hex_decode(to_decode, output)

### Prototype
```c
int aws_hex_decode(const struct aws_byte_cursor *AWS_RESTRICT to_decode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_hex_decode(to_decode, output)
    ccall((:aws_hex_decode, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_decode, output)
end

"""
    aws_base64_compute_encoded_len(to_encode_len, encoded_len)

### Prototype
```c
int aws_base64_compute_encoded_len(size_t to_encode_len, size_t *encoded_len);
```
"""
function aws_base64_compute_encoded_len(to_encode_len, encoded_len)
    ccall((:aws_base64_compute_encoded_len, libaws_c_common), Cint, (Csize_t, Ptr{Csize_t}), to_encode_len, encoded_len)
end

"""
    aws_base64_encode(to_encode, output)

### Prototype
```c
int aws_base64_encode(const struct aws_byte_cursor *AWS_RESTRICT to_encode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_base64_encode(to_encode, output)
    ccall((:aws_base64_encode, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_encode, output)
end

"""
    aws_base64_compute_decoded_len(to_decode, decoded_len)

### Prototype
```c
int aws_base64_compute_decoded_len(const struct aws_byte_cursor *AWS_RESTRICT to_decode, size_t *decoded_len);
```
"""
function aws_base64_compute_decoded_len(to_decode, decoded_len)
    ccall((:aws_base64_compute_decoded_len, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{Csize_t}), to_decode, decoded_len)
end

"""
    aws_base64_decode(to_decode, output)

### Prototype
```c
int aws_base64_decode(const struct aws_byte_cursor *AWS_RESTRICT to_decode, struct aws_byte_buf *AWS_RESTRICT output);
```
"""
function aws_base64_decode(to_decode, output)
    ccall((:aws_base64_decode, libaws_c_common), Cint, (Ptr{aws_byte_cursor}, Ptr{aws_byte_buf}), to_decode, output)
end

"""
    aws_write_u64(value, buffer)

### Prototype
```c
AWS_STATIC_IMPL void aws_write_u64(uint64_t value, uint8_t *buffer);
```
"""
function aws_write_u64(value, buffer)
    ccall((:aws_write_u64, libaws_c_common), Cvoid, (UInt64, Ptr{UInt8}), value, buffer)
end

"""
    aws_read_u64(buffer)

### Prototype
```c
AWS_STATIC_IMPL uint64_t aws_read_u64(const uint8_t *buffer);
```
"""
function aws_read_u64(buffer)
    ccall((:aws_read_u64, libaws_c_common), UInt64, (Ptr{UInt8},), buffer)
end

"""
    aws_write_u32(value, buffer)

### Prototype
```c
AWS_STATIC_IMPL void aws_write_u32(uint32_t value, uint8_t *buffer);
```
"""
function aws_write_u32(value, buffer)
    ccall((:aws_write_u32, libaws_c_common), Cvoid, (UInt32, Ptr{UInt8}), value, buffer)
end

"""
    aws_read_u32(buffer)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_read_u32(const uint8_t *buffer);
```
"""
function aws_read_u32(buffer)
    ccall((:aws_read_u32, libaws_c_common), UInt32, (Ptr{UInt8},), buffer)
end

"""
    aws_write_u24(value, buffer)

### Prototype
```c
AWS_STATIC_IMPL void aws_write_u24(uint32_t value, uint8_t *buffer);
```
"""
function aws_write_u24(value, buffer)
    ccall((:aws_write_u24, libaws_c_common), Cvoid, (UInt32, Ptr{UInt8}), value, buffer)
end

"""
    aws_read_u24(buffer)

### Prototype
```c
AWS_STATIC_IMPL uint32_t aws_read_u24(const uint8_t *buffer);
```
"""
function aws_read_u24(buffer)
    ccall((:aws_read_u24, libaws_c_common), UInt32, (Ptr{UInt8},), buffer)
end

"""
    aws_write_u16(value, buffer)

### Prototype
```c
AWS_STATIC_IMPL void aws_write_u16(uint16_t value, uint8_t *buffer);
```
"""
function aws_write_u16(value, buffer)
    ccall((:aws_write_u16, libaws_c_common), Cvoid, (UInt16, Ptr{UInt8}), value, buffer)
end

"""
    aws_read_u16(buffer)

### Prototype
```c
AWS_STATIC_IMPL uint16_t aws_read_u16(const uint8_t *buffer);
```
"""
function aws_read_u16(buffer)
    ccall((:aws_read_u16, libaws_c_common), UInt16, (Ptr{UInt8},), buffer)
end

@cenum aws_text_encoding::UInt32 begin
    AWS_TEXT_UNKNOWN = 0
    AWS_TEXT_UTF8 = 1
    AWS_TEXT_UTF16 = 2
    AWS_TEXT_UTF32 = 3
    AWS_TEXT_ASCII = 4
end

"""
    aws_text_detect_encoding(bytes, size)

### Prototype
```c
AWS_STATIC_IMPL enum aws_text_encoding aws_text_detect_encoding(const uint8_t *bytes, size_t size);
```
"""
function aws_text_detect_encoding(bytes, size)
    ccall((:aws_text_detect_encoding, libaws_c_common), aws_text_encoding, (Ptr{UInt8}, Csize_t), bytes, size)
end

"""
    aws_text_is_utf8(bytes, size)

### Prototype
```c
AWS_STATIC_IMPL bool aws_text_is_utf8(const uint8_t *bytes, size_t size);
```
"""
function aws_text_is_utf8(bytes, size)
    ccall((:aws_text_is_utf8, libaws_c_common), Bool, (Ptr{UInt8}, Csize_t), bytes, size)
end

struct aws_utf8_decoder_options
    on_codepoint::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
end

"""
    aws_decode_utf8(bytes, options)

Decode a complete string of UTF8/ASCII text. Text is always validated according to RFC-3629 (you may perform additional validation in the on\\_codepoint callback). The text does not need to begin with a UTF8 BOM. If you need to decode text incrementally as you receive it, use [`aws_utf8_decoder_new`](@ref)() instead.

### Parameters
* `bytes`: Text to decode.
* `options`: Options for decoding. If NULL is passed, the text is simply validated.
### Returns
[`AWS_OP_SUCCESS`](@ref) if successful. An error is raised if the text is not valid, or the on\\_codepoint callback raises an error.
### Prototype
```c
int aws_decode_utf8(struct aws_byte_cursor bytes, const struct aws_utf8_decoder_options *options);
```
"""
function aws_decode_utf8(bytes, options)
    ccall((:aws_decode_utf8, libaws_c_common), Cint, (aws_byte_cursor, Ptr{aws_utf8_decoder_options}), bytes, options)
end

mutable struct aws_utf8_decoder end

"""
    aws_utf8_decoder_new(allocator, options)

Create a UTF8/ASCII decoder, which can process text incrementally as you receive it. Text is always validated according to RFC-3629 (you may perform additional validation in the on\\_codepoint callback). The text does not need to begin with a UTF8 BOM. To decode text all at once, simply use [`aws_decode_utf8`](@ref)().

Feed bytes into the decoder with [`aws_utf8_decoder_update`](@ref)(), and call [`aws_utf8_decoder_finalize`](@ref)() when the text is complete.

### Parameters
* `allocator`: Allocator
* `options`: Options for decoder. If NULL is passed, the text is simply validated.
### Prototype
```c
struct aws_utf8_decoder *aws_utf8_decoder_new( struct aws_allocator *allocator, const struct aws_utf8_decoder_options *options);
```
"""
function aws_utf8_decoder_new(allocator, options)
    ccall((:aws_utf8_decoder_new, libaws_c_common), Ptr{aws_utf8_decoder}, (Ptr{aws_allocator}, Ptr{aws_utf8_decoder_options}), allocator, options)
end

"""
    aws_utf8_decoder_destroy(decoder)

### Prototype
```c
void aws_utf8_decoder_destroy(struct aws_utf8_decoder *decoder);
```
"""
function aws_utf8_decoder_destroy(decoder)
    ccall((:aws_utf8_decoder_destroy, libaws_c_common), Cvoid, (Ptr{aws_utf8_decoder},), decoder)
end

"""
    aws_utf8_decoder_reset(decoder)

### Prototype
```c
void aws_utf8_decoder_reset(struct aws_utf8_decoder *decoder);
```
"""
function aws_utf8_decoder_reset(decoder)
    ccall((:aws_utf8_decoder_reset, libaws_c_common), Cvoid, (Ptr{aws_utf8_decoder},), decoder)
end

"""
    aws_utf8_decoder_update(decoder, bytes)

Update the decoder with more bytes of text. The on\\_codepoint callback will be invoked for each codepoint encountered. Raises an error if invalid UTF8 is encountered or the on\\_codepoint callback reports an error.

Note: You must call [`aws_utf8_decoder_finalize`](@ref)() when the text is 100% complete, to ensure the input was completely valid.

### Prototype
```c
int aws_utf8_decoder_update(struct aws_utf8_decoder *decoder, struct aws_byte_cursor bytes);
```
"""
function aws_utf8_decoder_update(decoder, bytes)
    ccall((:aws_utf8_decoder_update, libaws_c_common), Cint, (Ptr{aws_utf8_decoder}, aws_byte_cursor), decoder, bytes)
end

"""
    aws_utf8_decoder_finalize(decoder)

Tell the decoder that you've reached the end of your text. Raises AWS\\_ERROR\\_INVALID\\_UTF8 if the text did not end with a complete UTF8 codepoint. This also resets the decoder.

### Prototype
```c
int aws_utf8_decoder_finalize(struct aws_utf8_decoder *decoder);
```
"""
function aws_utf8_decoder_finalize(decoder)
    ccall((:aws_utf8_decoder_finalize, libaws_c_common), Cint, (Ptr{aws_utf8_decoder},), decoder)
end

struct aws_string
    allocator::Ptr{aws_allocator}
    len::Csize_t
    bytes::NTuple{1, UInt8}
end

"""
    aws_get_environment_value(allocator, variable_name, value_out)

### Prototype
```c
int aws_get_environment_value( struct aws_allocator *allocator, const struct aws_string *variable_name, struct aws_string **value_out);
```
"""
function aws_get_environment_value(allocator, variable_name, value_out)
    ccall((:aws_get_environment_value, libaws_c_common), Cint, (Ptr{aws_allocator}, Ptr{aws_string}, Ptr{Ptr{aws_string}}), allocator, variable_name, value_out)
end

"""
    aws_set_environment_value(variable_name, value)

### Prototype
```c
int aws_set_environment_value(const struct aws_string *variable_name, const struct aws_string *value);
```
"""
function aws_set_environment_value(variable_name, value)
    ccall((:aws_set_environment_value, libaws_c_common), Cint, (Ptr{aws_string}, Ptr{aws_string}), variable_name, value)
end

"""
    aws_unset_environment_value(variable_name)

### Prototype
```c
int aws_unset_environment_value(const struct aws_string *variable_name);
```
"""
function aws_unset_environment_value(variable_name)
    ccall((:aws_unset_environment_value, libaws_c_common), Cint, (Ptr{aws_string},), variable_name)
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
    ccall((:aws_last_error, libaws_c_common), Cint, ())
end

"""
    aws_error_str(err)

### Prototype
```c
const char *aws_error_str(int err);
```
"""
function aws_error_str(err)
    ccall((:aws_error_str, libaws_c_common), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_name(err)

### Prototype
```c
const char *aws_error_name(int err);
```
"""
function aws_error_name(err)
    ccall((:aws_error_name, libaws_c_common), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_lib_name(err)

### Prototype
```c
const char *aws_error_lib_name(int err);
```
"""
function aws_error_lib_name(err)
    ccall((:aws_error_lib_name, libaws_c_common), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_error_debug_str(err)

### Prototype
```c
const char *aws_error_debug_str(int err);
```
"""
function aws_error_debug_str(err)
    ccall((:aws_error_debug_str, libaws_c_common), Ptr{Cchar}, (Cint,), err)
end

"""
    aws_raise_error_private(err)

### Prototype
```c
void aws_raise_error_private(int err);
```
"""
function aws_raise_error_private(err)
    ccall((:aws_raise_error_private, libaws_c_common), Cvoid, (Cint,), err)
end

"""
    aws_reset_error()

### Prototype
```c
void aws_reset_error(void);
```
"""
function aws_reset_error()
    ccall((:aws_reset_error, libaws_c_common), Cvoid, ())
end

"""
    aws_restore_error(err)

### Prototype
```c
void aws_restore_error(int err);
```
"""
function aws_restore_error(err)
    ccall((:aws_restore_error, libaws_c_common), Cvoid, (Cint,), err)
end

"""
    aws_set_global_error_handler_fn(handler, ctx)

### Prototype
```c
aws_error_handler_fn *aws_set_global_error_handler_fn(aws_error_handler_fn *handler, void *ctx);
```
"""
function aws_set_global_error_handler_fn(handler, ctx)
    ccall((:aws_set_global_error_handler_fn, libaws_c_common), Ptr{aws_error_handler_fn}, (Ptr{aws_error_handler_fn}, Ptr{Cvoid}), handler, ctx)
end

"""
    aws_set_thread_local_error_handler_fn(handler, ctx)

### Prototype
```c
aws_error_handler_fn *aws_set_thread_local_error_handler_fn(aws_error_handler_fn *handler, void *ctx);
```
"""
function aws_set_thread_local_error_handler_fn(handler, ctx)
    ccall((:aws_set_thread_local_error_handler_fn, libaws_c_common), Ptr{aws_error_handler_fn}, (Ptr{aws_error_handler_fn}, Ptr{Cvoid}), handler, ctx)
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
    ccall((:aws_register_error_info, libaws_c_common), Cvoid, (Ptr{aws_error_info_list},), error_info)
end

"""
    aws_unregister_error_info(error_info)

### Prototype
```c
void aws_unregister_error_info(const struct aws_error_info_list *error_info);
```
"""
function aws_unregister_error_info(error_info)
    ccall((:aws_unregister_error_info, libaws_c_common), Cvoid, (Ptr{aws_error_info_list},), error_info)
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
    ccall((:aws_translate_and_raise_io_error_or, libaws_c_common), Cint, (Cint, Cint), error_no, fallback_aws_error_code)
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
    ccall((:aws_translate_and_raise_io_error, libaws_c_common), Cint, (Cint,), error_no)
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

"""
    aws_cache_new_fifo(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)

Initializes the first-in-first-out cache. Sets up the underlying linked hash table. Once `max_items` elements have been added, the oldest(first-in) item will be removed. For the other parameters, see aws/common/hash\\_table.h. Hash table semantics of these arguments are preserved.

### Prototype
```c
struct aws_cache *aws_cache_new_fifo( struct aws_allocator *allocator, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn, size_t max_items);
```
"""
function aws_cache_new_fifo(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
    ccall((:aws_cache_new_fifo, libaws_c_common), Ptr{aws_cache}, (Ptr{aws_allocator}, Ptr{aws_hash_fn}, Ptr{aws_hash_callback_eq_fn}, Ptr{aws_hash_callback_destroy_fn}, Ptr{aws_hash_callback_destroy_fn}, Csize_t), allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
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
    ccall((:aws_fopen, libaws_c_common), Ptr{Libc.FILE}, (Ptr{Cchar}, Ptr{Cchar}), file_path, mode)
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
    ccall((:aws_fopen_safe, libaws_c_common), Ptr{Libc.FILE}, (Ptr{aws_string}, Ptr{aws_string}), file_path, mode)
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
    ccall((:aws_directory_create, libaws_c_common), Cint, (Ptr{aws_string},), dir_path)
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
    ccall((:aws_directory_exists, libaws_c_common), Bool, (Ptr{aws_string},), dir_path)
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
    ccall((:aws_directory_delete, libaws_c_common), Cint, (Ptr{aws_string}, Bool), dir_path, recursive)
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
    ccall((:aws_file_delete, libaws_c_common), Cint, (Ptr{aws_string},), file_path)
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
    ccall((:aws_directory_or_file_move, libaws_c_common), Cint, (Ptr{aws_string}, Ptr{aws_string}), from, to)
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
    ccall((:aws_directory_traverse, libaws_c_common), Cint, (Ptr{aws_allocator}, Ptr{aws_string}, Bool, Ptr{aws_on_directory_entry}, Ptr{Cvoid}), allocator, path, recursive, on_entry, user_data)
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
    ccall((:aws_directory_entry_iterator_new, libaws_c_common), Ptr{aws_directory_iterator}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, path)
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
    ccall((:aws_directory_entry_iterator_next, libaws_c_common), Cint, (Ptr{aws_directory_iterator},), iterator)
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
    ccall((:aws_directory_entry_iterator_previous, libaws_c_common), Cint, (Ptr{aws_directory_iterator},), iterator)
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
    ccall((:aws_directory_entry_iterator_destroy, libaws_c_common), Cvoid, (Ptr{aws_directory_iterator},), iterator)
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
    ccall((:aws_directory_entry_iterator_get_value, libaws_c_common), Ptr{aws_directory_entry}, (Ptr{aws_directory_iterator},), iterator)
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
    ccall((:aws_is_any_directory_separator, libaws_c_common), Bool, (Cchar,), value)
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
    ccall((:aws_get_platform_directory_separator, libaws_c_common), Cchar, ())
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
    ccall((:aws_normalize_directory_separator, libaws_c_common), Cvoid, (Ptr{aws_byte_buf},), path)
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
    ccall((:aws_get_home_directory, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator},), allocator)
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
    ccall((:aws_path_exists, libaws_c_common), Bool, (Ptr{aws_string},), path)
end

"""
    aws_fseek(file, offset, whence)

### Prototype
```c
int aws_fseek(FILE *file, int64_t offset, int whence);
```
"""
function aws_fseek(file, offset, whence)
    ccall((:aws_fseek, libaws_c_common), Cint, (Ptr{Libc.FILE}, Int64, Cint), file, offset, whence)
end

"""
    aws_file_get_length(file, length)

### Prototype
```c
int aws_file_get_length(FILE *file, int64_t *length);
```
"""
function aws_file_get_length(file, length)
    ccall((:aws_file_get_length, libaws_c_common), Cint, (Ptr{Libc.FILE}, Ptr{Int64}), file, length)
end

@cenum __JL_Ctag_143::UInt32 begin
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

"""
    aws_hash_table_init(map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)

Initializes a hash map with initial capacity for 'size' elements without resizing. Uses hash\\_fn to compute the hash of each element. equals\\_fn to compute equality of two keys. Whenever an element is removed without being returned, destroy\\_key\\_fn is run on the pointer to the key and destroy\\_value\\_fn is run on the pointer to the value. Either or both may be NULL if a callback is not desired in this case.

### Prototype
```c
int aws_hash_table_init( struct aws_hash_table *map, struct aws_allocator *alloc, size_t size, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn);
```
"""
function aws_hash_table_init(map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)
    ccall((:aws_hash_table_init, libaws_c_common), Cint, (Ptr{aws_hash_table}, Ptr{aws_allocator}, Csize_t, Ptr{aws_hash_fn}, Ptr{aws_hash_callback_eq_fn}, Ptr{aws_hash_callback_destroy_fn}, Ptr{aws_hash_callback_destroy_fn}), map, alloc, size, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn)
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
    ccall((:aws_hash_table_clean_up, libaws_c_common), Cvoid, (Ptr{aws_hash_table},), map)
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
    ccall((:aws_hash_table_swap, libaws_c_common), Cvoid, (Ptr{aws_hash_table}, Ptr{aws_hash_table}), a, b)
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
    ccall((:aws_hash_table_move, libaws_c_common), Cvoid, (Ptr{aws_hash_table}, Ptr{aws_hash_table}), to, from)
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
    ccall((:aws_hash_table_get_entry_count, libaws_c_common), Csize_t, (Ptr{aws_hash_table},), map)
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
    ccall((:aws_hash_iter_begin, libaws_c_common), aws_hash_iter, (Ptr{aws_hash_table},), map)
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
    ccall((:aws_hash_iter_done, libaws_c_common), Bool, (Ptr{aws_hash_iter},), iter)
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
    ccall((:aws_hash_iter_next, libaws_c_common), Cvoid, (Ptr{aws_hash_iter},), iter)
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
    ccall((:aws_hash_iter_delete, libaws_c_common), Cvoid, (Ptr{aws_hash_iter}, Bool), iter, destroy_contents)
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
    ccall((:aws_hash_table_find, libaws_c_common), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Ptr{aws_hash_element}}), map, key, p_elem)
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
    ccall((:aws_hash_table_create, libaws_c_common), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Ptr{aws_hash_element}}, Ptr{Cint}), map, key, p_elem, was_created)
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
    ccall((:aws_hash_table_put, libaws_c_common), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cint}), map, key, value, was_created)
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
    ccall((:aws_hash_table_remove, libaws_c_common), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{aws_hash_element}, Ptr{Cint}), map, key, p_value, was_present)
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
    ccall((:aws_hash_table_remove_element, libaws_c_common), Cint, (Ptr{aws_hash_table}, Ptr{aws_hash_element}), map, p_value)
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
    ccall((:aws_hash_table_foreach, libaws_c_common), Cint, (Ptr{aws_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}), map, callback, context)
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
    ccall((:aws_hash_table_eq, libaws_c_common), Bool, (Ptr{aws_hash_table}, Ptr{aws_hash_table}, Ptr{aws_hash_callback_eq_fn}), a, b, value_eq)
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
    ccall((:aws_hash_table_clear, libaws_c_common), Cvoid, (Ptr{aws_hash_table},), map)
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
    ccall((:aws_hash_c_string, libaws_c_common), UInt64, (Ptr{Cvoid},), item)
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
    ccall((:aws_hash_string, libaws_c_common), UInt64, (Ptr{Cvoid},), item)
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
    ccall((:aws_hash_byte_cursor_ptr, libaws_c_common), UInt64, (Ptr{Cvoid},), item)
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
    ccall((:aws_hash_ptr, libaws_c_common), UInt64, (Ptr{Cvoid},), item)
end

"""
    aws_hash_combine(item1, item2)

### Prototype
```c
uint64_t aws_hash_combine(uint64_t item1, uint64_t item2);
```
"""
function aws_hash_combine(item1, item2)
    ccall((:aws_hash_combine, libaws_c_common), UInt64, (UInt64, UInt64), item1, item2)
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
    ccall((:aws_hash_callback_c_str_eq, libaws_c_common), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
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
    ccall((:aws_hash_callback_string_eq, libaws_c_common), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
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
    ccall((:aws_hash_callback_string_destroy, libaws_c_common), Cvoid, (Ptr{Cvoid},), a)
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
    ccall((:aws_ptr_eq, libaws_c_common), Bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
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
    ccall((:aws_hash_table_is_valid, libaws_c_common), Bool, (Ptr{aws_hash_table},), map)
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
    ccall((:aws_hash_iter_is_valid, libaws_c_common), Bool, (Ptr{aws_hash_iter},), iter)
end

mutable struct aws_json_value end

"""
    aws_json_value_new_string(allocator, string)

Creates a new string [`aws_json_value`](@ref) with the given string and returns a pointer to it.

Note: You will need to free the memory for the [`aws_json_value`](@ref) using aws\\_json\\_destroy on the [`aws_json_value`](@ref) or on the object/array containing the [`aws_json_value`](@ref).

### Parameters
* `string`: A byte pointer to the string you want to store in the [`aws_json_value`](@ref)
* `allocator`: The allocator to use when creating the value
### Returns
A new string [`aws_json_value`](@ref)
### Prototype
```c
struct aws_json_value *aws_json_value_new_string(struct aws_allocator *allocator, struct aws_byte_cursor string);
```
"""
function aws_json_value_new_string(allocator, string)
    ccall((:aws_json_value_new_string, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_allocator}, aws_byte_cursor), allocator, string)
end

"""
    aws_json_value_new_number(allocator, number)

Creates a new number [`aws_json_value`](@ref) with the given number and returns a pointer to it.

Note: You will need to free the memory for the [`aws_json_value`](@ref) using aws\\_json\\_destroy on the [`aws_json_value`](@ref) or on the object/array containing the [`aws_json_value`](@ref).

### Parameters
* `number`: The number you want to store in the [`aws_json_value`](@ref)
* `allocator`: The allocator to use when creating the value
### Returns
A new number [`aws_json_value`](@ref)
### Prototype
```c
struct aws_json_value *aws_json_value_new_number(struct aws_allocator *allocator, double number);
```
"""
function aws_json_value_new_number(allocator, number)
    ccall((:aws_json_value_new_number, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_allocator}, Cdouble), allocator, number)
end

"""
    aws_json_value_new_array(allocator)

Creates a new array [`aws_json_value`](@ref) and returns a pointer to it.

Note: You will need to free the memory for the [`aws_json_value`](@ref) using aws\\_json\\_destroy on the [`aws_json_value`](@ref) or on the object/array containing the [`aws_json_value`](@ref). Deleting this array will also destroy any aws\\_json\\_values it contains.

### Parameters
* `allocator`: The allocator to use when creating the value
### Returns
A new array [`aws_json_value`](@ref)
### Prototype
```c
struct aws_json_value *aws_json_value_new_array(struct aws_allocator *allocator);
```
"""
function aws_json_value_new_array(allocator)
    ccall((:aws_json_value_new_array, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_json_value_new_boolean(allocator, boolean)

Creates a new boolean [`aws_json_value`](@ref) with the given boolean and returns a pointer to it.

Note: You will need to free the memory for the [`aws_json_value`](@ref) using aws\\_json\\_destroy on the [`aws_json_value`](@ref) or on the object/array containing the [`aws_json_value`](@ref).

### Parameters
* `boolean`: The boolean you want to store in the [`aws_json_value`](@ref)
* `allocator`: The allocator to use when creating the value
### Returns
A new boolean [`aws_json_value`](@ref)
### Prototype
```c
struct aws_json_value *aws_json_value_new_boolean(struct aws_allocator *allocator, bool boolean);
```
"""
function aws_json_value_new_boolean(allocator, boolean)
    ccall((:aws_json_value_new_boolean, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_allocator}, Bool), allocator, boolean)
end

"""
    aws_json_value_new_null(allocator)

Creates a new null [`aws_json_value`](@ref) and returns a pointer to it.

Note: You will need to free the memory for the [`aws_json_value`](@ref) using aws\\_json\\_destroy on the [`aws_json_value`](@ref) or on the object/array containing the [`aws_json_value`](@ref).

### Parameters
* `allocator`: The allocator to use when creating the value
### Returns
A new null [`aws_json_value`](@ref)
### Prototype
```c
struct aws_json_value *aws_json_value_new_null(struct aws_allocator *allocator);
```
"""
function aws_json_value_new_null(allocator)
    ccall((:aws_json_value_new_null, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_json_value_new_object(allocator)

Creates a new object [`aws_json_value`](@ref) and returns a pointer to it.

Note: You will need to free the memory for the [`aws_json_value`](@ref) using aws\\_json\\_destroy on the [`aws_json_value`](@ref) or on the object/array containing the [`aws_json_value`](@ref). Deleting this object will also destroy any aws\\_json\\_values it contains.

### Parameters
* `allocator`: The allocator to use when creating the value
### Returns
A new object [`aws_json_value`](@ref)
### Prototype
```c
struct aws_json_value *aws_json_value_new_object(struct aws_allocator *allocator);
```
"""
function aws_json_value_new_object(allocator)
    ccall((:aws_json_value_new_object, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_json_value_get_string(value, output)

Gets the string of a string [`aws_json_value`](@ref).

### Parameters
* `value`: The string [`aws_json_value`](@ref).
* `output`: The string
### Returns
[`AWS_OP_SUCCESS`](@ref) if the value is a string, otherwise [`AWS_OP_ERR`](@ref).
### Prototype
```c
int aws_json_value_get_string(const struct aws_json_value *value, struct aws_byte_cursor *output);
```
"""
function aws_json_value_get_string(value, output)
    ccall((:aws_json_value_get_string, libaws_c_common), Cint, (Ptr{aws_json_value}, Ptr{aws_byte_cursor}), value, output)
end

"""
    aws_json_value_get_number(value, output)

Gets the number of a number [`aws_json_value`](@ref).

### Parameters
* `value`: The number [`aws_json_value`](@ref).
* `output`: The number
### Returns
[`AWS_OP_SUCCESS`](@ref) if the value is a number, otherwise [`AWS_OP_ERR`](@ref).
### Prototype
```c
int aws_json_value_get_number(const struct aws_json_value *value, double *output);
```
"""
function aws_json_value_get_number(value, output)
    ccall((:aws_json_value_get_number, libaws_c_common), Cint, (Ptr{aws_json_value}, Ptr{Cdouble}), value, output)
end

"""
    aws_json_value_get_boolean(value, output)

Gets the boolean of a boolean [`aws_json_value`](@ref).

### Parameters
* `value`: The boolean [`aws_json_value`](@ref).
* `output`: The boolean
### Returns
[`AWS_OP_SUCCESS`](@ref) if the value is a boolean, otherwise [`AWS_OP_ERR`](@ref).
### Prototype
```c
int aws_json_value_get_boolean(const struct aws_json_value *value, bool *output);
```
"""
function aws_json_value_get_boolean(value, output)
    ccall((:aws_json_value_get_boolean, libaws_c_common), Cint, (Ptr{aws_json_value}, Ptr{Bool}), value, output)
end

"""
    aws_json_value_add_to_object(object, key, value)

Adds a [`aws_json_value`](@ref) to a object [`aws_json_value`](@ref).

Note that the [`aws_json_value`](@ref) will be destroyed when the [`aws_json_value`](@ref) object is destroyed by calling "aws\\_json\\_destroy()"

### Parameters
* `object`: The object [`aws_json_value`](@ref) you want to add a value to.
* `key`: The key to add the [`aws_json_value`](@ref) at.
* `value`: The [`aws_json_value`](@ref) you want to add.
### Returns
[`AWS_OP_SUCCESS`](@ref) if adding was successful. Will return AWS\\_OP\\_ERROR if the object passed is invalid or if the passed key is already in use in the object.
### Prototype
```c
int aws_json_value_add_to_object( struct aws_json_value *object, struct aws_byte_cursor key, struct aws_json_value *value);
```
"""
function aws_json_value_add_to_object(object, key, value)
    ccall((:aws_json_value_add_to_object, libaws_c_common), Cint, (Ptr{aws_json_value}, aws_byte_cursor, Ptr{aws_json_value}), object, key, value)
end

"""
    aws_json_value_get_from_object(object, key)

Returns the [`aws_json_value`](@ref) at the given key.

### Parameters
* `object`: The object [`aws_json_value`](@ref) you want to get the value from.
* `key`: The key that the [`aws_json_value`](@ref) is at. Is case sensitive.
### Returns
The [`aws_json_value`](@ref) at the given key, otherwise NULL.
### Prototype
```c
struct aws_json_value *aws_json_value_get_from_object(const struct aws_json_value *object, struct aws_byte_cursor key);
```
"""
function aws_json_value_get_from_object(object, key)
    ccall((:aws_json_value_get_from_object, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_json_value}, aws_byte_cursor), object, key)
end

"""
    aws_json_value_has_key(object, key)

Checks if there is a [`aws_json_value`](@ref) at the given key.

### Parameters
* `object`: The value [`aws_json_value`](@ref) you want to check a key in.
* `key`: The key that you want to check. Is case sensitive.
### Returns
True if a [`aws_json_value`](@ref) is found.
### Prototype
```c
bool aws_json_value_has_key(const struct aws_json_value *object, struct aws_byte_cursor key);
```
"""
function aws_json_value_has_key(object, key)
    ccall((:aws_json_value_has_key, libaws_c_common), Bool, (Ptr{aws_json_value}, aws_byte_cursor), object, key)
end

"""
    aws_json_value_remove_from_object(object, key)

Removes the [`aws_json_value`](@ref) at the given key.

### Parameters
* `object`: The object [`aws_json_value`](@ref) you want to remove a [`aws_json_value`](@ref) in.
* `key`: The key that the [`aws_json_value`](@ref) is at. Is case sensitive.
### Returns
[`AWS_OP_SUCCESS`](@ref) if the [`aws_json_value`](@ref) was removed. Will return [`AWS_OP_ERR`](@ref) if the object passed is invalid or if the value at the key cannot be found.
### Prototype
```c
int aws_json_value_remove_from_object(struct aws_json_value *object, struct aws_byte_cursor key);
```
"""
function aws_json_value_remove_from_object(object, key)
    ccall((:aws_json_value_remove_from_object, libaws_c_common), Cint, (Ptr{aws_json_value}, aws_byte_cursor), object, key)
end

# typedef int ( aws_json_on_member_encountered_const_fn ) ( const struct aws_byte_cursor * key , const struct aws_json_value * value , bool * out_should_continue , void * user_data )
"""
callback for iterating members of an object Iteration can be controlled as follows: - return [`AWS_OP_SUCCESS`](@ref) and out\\_should\\_continue is set to true (default value) - continue iteration without error - return [`AWS_OP_SUCCESS`](@ref) and out\\_continue is set to false - stop iteration without error - return [`AWS_OP_ERR`](@ref) - stop iteration with error
"""
const aws_json_on_member_encountered_const_fn = Cvoid

"""
    aws_json_const_iterate_object(object, on_member, user_data)

iterates through members of the object. iteration is sequential in order fields were initially parsed.

### Parameters
* `object`: object to iterate over.
* `on_member`: callback for when member is encountered.
* `user_data`: user data to pass back in callback.
### Returns
[`AWS_OP_SUCCESS`](@ref) when iteration finishes completely or exits early, [`AWS_OP_ERR`](@ref) if value is not an object.
### Prototype
```c
int aws_json_const_iterate_object( const struct aws_json_value *object, aws_json_on_member_encountered_const_fn *on_member, void *user_data);
```
"""
function aws_json_const_iterate_object(object, on_member, user_data)
    ccall((:aws_json_const_iterate_object, libaws_c_common), Cint, (Ptr{aws_json_value}, Ptr{aws_json_on_member_encountered_const_fn}, Ptr{Cvoid}), object, on_member, user_data)
end

"""
    aws_json_value_add_array_element(array, value)

Adds a [`aws_json_value`](@ref) to the given array [`aws_json_value`](@ref).

Note that the [`aws_json_value`](@ref) will be destroyed when the [`aws_json_value`](@ref) array is destroyed by calling "aws\\_json\\_destroy()"

### Parameters
* `array`: The array [`aws_json_value`](@ref) you want to add an [`aws_json_value`](@ref) to.
* `value`: The [`aws_json_value`](@ref) you want to add.
### Returns
[`AWS_OP_SUCCESS`](@ref) if adding the [`aws_json_value`](@ref) was successful. Will return [`AWS_OP_ERR`](@ref) if the array passed is invalid.
### Prototype
```c
int aws_json_value_add_array_element(struct aws_json_value *array, const struct aws_json_value *value);
```
"""
function aws_json_value_add_array_element(array, value)
    ccall((:aws_json_value_add_array_element, libaws_c_common), Cint, (Ptr{aws_json_value}, Ptr{aws_json_value}), array, value)
end

"""
    aws_json_get_array_element(array, index)

Returns the [`aws_json_value`](@ref) at the given index in the array [`aws_json_value`](@ref).

### Parameters
* `array`: The array [`aws_json_value`](@ref).
* `index`: The index of the [`aws_json_value`](@ref) you want to access.
### Returns
A pointer to the [`aws_json_value`](@ref) at the given index in the array, otherwise NULL.
### Prototype
```c
struct aws_json_value *aws_json_get_array_element(const struct aws_json_value *array, size_t index);
```
"""
function aws_json_get_array_element(array, index)
    ccall((:aws_json_get_array_element, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_json_value}, Csize_t), array, index)
end

"""
    aws_json_get_array_size(array)

Returns the number of items in the array [`aws_json_value`](@ref).

### Parameters
* `array`: The array [`aws_json_value`](@ref).
### Returns
The number of items in the array\\_json\\_value.
### Prototype
```c
size_t aws_json_get_array_size(const struct aws_json_value *array);
```
"""
function aws_json_get_array_size(array)
    ccall((:aws_json_get_array_size, libaws_c_common), Csize_t, (Ptr{aws_json_value},), array)
end

"""
    aws_json_value_remove_array_element(array, index)

Removes the [`aws_json_value`](@ref) at the given index in the array [`aws_json_value`](@ref).

### Parameters
* `array`: The array [`aws_json_value`](@ref).
* `index`: The index containing the [`aws_json_value`](@ref) you want to remove.
### Returns
[`AWS_OP_SUCCESS`](@ref) if the [`aws_json_value`](@ref) at the index was removed. Will return [`AWS_OP_ERR`](@ref) if the array passed is invalid or if the index passed is out of range.
### Prototype
```c
int aws_json_value_remove_array_element(struct aws_json_value *array, size_t index);
```
"""
function aws_json_value_remove_array_element(array, index)
    ccall((:aws_json_value_remove_array_element, libaws_c_common), Cint, (Ptr{aws_json_value}, Csize_t), array, index)
end

# typedef int ( aws_json_on_value_encountered_const_fn ) ( size_t index , const struct aws_json_value * value , bool * out_should_continue , void * user_data )
"""
callback for iterating values of an array. Iteration can be controlled as follows: - return [`AWS_OP_SUCCESS`](@ref) and out\\_should\\_continue is set to true (default value) - continue iteration without error - return [`AWS_OP_SUCCESS`](@ref) and out\\_continue is set to false - stop iteration without error - return [`AWS_OP_ERR`](@ref) - stop iteration with error
"""
const aws_json_on_value_encountered_const_fn = Cvoid

"""
    aws_json_const_iterate_array(array, on_value, user_data)

iterates through values of an array. iteration is sequential starting with 0th element.

### Parameters
* `array`: array to iterate over.
* `on_value`: callback for when value is encountered.
* `user_data`: user data to pass back in callback.
### Returns
[`AWS_OP_SUCCESS`](@ref) when iteration finishes completely or exits early, [`AWS_OP_ERR`](@ref) if value is not an array.
### Prototype
```c
int aws_json_const_iterate_array( const struct aws_json_value *array, aws_json_on_value_encountered_const_fn *on_value, void *user_data);
```
"""
function aws_json_const_iterate_array(array, on_value, user_data)
    ccall((:aws_json_const_iterate_array, libaws_c_common), Cint, (Ptr{aws_json_value}, Ptr{aws_json_on_value_encountered_const_fn}, Ptr{Cvoid}), array, on_value, user_data)
end

"""
    aws_json_value_compare(a, b, is_case_sensitive)

Checks whether two json values are equivalent.

### Parameters
* `a`: first value to compare.
* `b`: second value to compare.
* `is_case_sensitive`: case sensitive compare or not.
### Returns
True is values are equal, false otherwise
### Prototype
```c
bool aws_json_value_compare(const struct aws_json_value *a, const struct aws_json_value *b, bool is_case_sensitive);
```
"""
function aws_json_value_compare(a, b, is_case_sensitive)
    ccall((:aws_json_value_compare, libaws_c_common), Bool, (Ptr{aws_json_value}, Ptr{aws_json_value}, Bool), a, b, is_case_sensitive)
end

"""
    aws_json_value_duplicate(value)

Duplicates json value.

### Parameters
* `value`: first value to compare.
### Returns
duplicated value. NULL and last error set if value cannot be duplicated.
### Prototype
```c
struct aws_json_value *aws_json_value_duplicate(const struct aws_json_value *value);
```
"""
function aws_json_value_duplicate(value)
    ccall((:aws_json_value_duplicate, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_json_value},), value)
end

"""
    aws_json_value_is_string(value)

Checks if the [`aws_json_value`](@ref) is a string.

### Parameters
* `value`: The [`aws_json_value`](@ref) to check.
### Returns
True if the [`aws_json_value`](@ref) is a string [`aws_json_value`](@ref), otherwise false.
### Prototype
```c
bool aws_json_value_is_string(const struct aws_json_value *value);
```
"""
function aws_json_value_is_string(value)
    ccall((:aws_json_value_is_string, libaws_c_common), Bool, (Ptr{aws_json_value},), value)
end

"""
    aws_json_value_is_number(value)

Checks if the [`aws_json_value`](@ref) is a number.

### Parameters
* `value`: The [`aws_json_value`](@ref) to check.
### Returns
True if the [`aws_json_value`](@ref) is a number [`aws_json_value`](@ref), otherwise false.
### Prototype
```c
bool aws_json_value_is_number(const struct aws_json_value *value);
```
"""
function aws_json_value_is_number(value)
    ccall((:aws_json_value_is_number, libaws_c_common), Bool, (Ptr{aws_json_value},), value)
end

"""
    aws_json_value_is_array(value)

Checks if the [`aws_json_value`](@ref) is a array.

### Parameters
* `value`: The [`aws_json_value`](@ref) to check.
### Returns
True if the [`aws_json_value`](@ref) is a array [`aws_json_value`](@ref), otherwise false.
### Prototype
```c
bool aws_json_value_is_array(const struct aws_json_value *value);
```
"""
function aws_json_value_is_array(value)
    ccall((:aws_json_value_is_array, libaws_c_common), Bool, (Ptr{aws_json_value},), value)
end

"""
    aws_json_value_is_boolean(value)

Checks if the [`aws_json_value`](@ref) is a boolean.

### Parameters
* `value`: The [`aws_json_value`](@ref) to check.
### Returns
True if the [`aws_json_value`](@ref) is a boolean [`aws_json_value`](@ref), otherwise false.
### Prototype
```c
bool aws_json_value_is_boolean(const struct aws_json_value *value);
```
"""
function aws_json_value_is_boolean(value)
    ccall((:aws_json_value_is_boolean, libaws_c_common), Bool, (Ptr{aws_json_value},), value)
end

"""
    aws_json_value_is_null(value)

Checks if the [`aws_json_value`](@ref) is a null [`aws_json_value`](@ref).

### Parameters
* `value`: The [`aws_json_value`](@ref) to check.
### Returns
True if the [`aws_json_value`](@ref) is a null [`aws_json_value`](@ref), otherwise false.
### Prototype
```c
bool aws_json_value_is_null(const struct aws_json_value *value);
```
"""
function aws_json_value_is_null(value)
    ccall((:aws_json_value_is_null, libaws_c_common), Bool, (Ptr{aws_json_value},), value)
end

"""
    aws_json_value_is_object(value)

Checks if the [`aws_json_value`](@ref) is a object [`aws_json_value`](@ref).

### Parameters
* `value`: The [`aws_json_value`](@ref) to check.
### Returns
True if the [`aws_json_value`](@ref) is a object [`aws_json_value`](@ref), otherwise false.
### Prototype
```c
bool aws_json_value_is_object(const struct aws_json_value *value);
```
"""
function aws_json_value_is_object(value)
    ccall((:aws_json_value_is_object, libaws_c_common), Bool, (Ptr{aws_json_value},), value)
end

"""
    aws_json_value_destroy(value)

Removes the [`aws_json_value`](@ref) from memory. If the [`aws_json_value`](@ref) is a object or array, it will also destroy attached aws\\_json\\_values as well.

For example, if you called "aws\\_json\\_array\\_add(b, a)" to add an object "a" to an array "b", if you call "aws\\_json\\_destroy(b)" then it will also free "a" automatically. All children/attached aws\\_json\\_values are freed when the parent/root [`aws_json_value`](@ref) is destroyed.

### Parameters
* `value`: The [`aws_json_value`](@ref) to destroy.
### Prototype
```c
void aws_json_value_destroy(struct aws_json_value *value);
```
"""
function aws_json_value_destroy(value)
    ccall((:aws_json_value_destroy, libaws_c_common), Cvoid, (Ptr{aws_json_value},), value)
end

"""
    aws_byte_buf_append_json_string(value, output)

Appends a unformatted JSON string representation of the [`aws_json_value`](@ref) into the passed byte buffer. The byte buffer is expected to be already initialized so the function can append the JSON into it.

Note: The byte buffer will automatically have its size extended if the JSON string is over the byte buffer capacity AND the byte buffer has an allocator associated with it. If the byte buffer does not have an allocator associated and the JSON string is over capacity, [`AWS_OP_ERR`](@ref) will be returned.

Note: When you are finished with the [`aws_byte_buf`](@ref), you must call "[`aws_byte_buf_clean_up_secure`](@ref)" to free the memory used, as it will NOT be called automatically.

### Parameters
* `value`: The [`aws_json_value`](@ref) to format.
* `output`: The destination for the JSON string
### Returns
[`AWS_OP_SUCCESS`](@ref) if the JSON string was allocated to output without any errors Will return [`AWS_OP_ERR`](@ref) if the value passed is not an [`aws_json_value`](@ref) or if there was an error appending the JSON into the byte buffer.
### Prototype
```c
int aws_byte_buf_append_json_string(const struct aws_json_value *value, struct aws_byte_buf *output);
```
"""
function aws_byte_buf_append_json_string(value, output)
    ccall((:aws_byte_buf_append_json_string, libaws_c_common), Cint, (Ptr{aws_json_value}, Ptr{aws_byte_buf}), value, output)
end

"""
    aws_byte_buf_append_json_string_formatted(value, output)

Appends a formatted JSON string representation of the [`aws_json_value`](@ref) into the passed byte buffer. The byte buffer is expected to already be initialized so the function can append the JSON into it.

Note: The byte buffer will automatically have its size extended if the JSON string is over the byte buffer capacity AND the byte buffer has an allocator associated with it. If the byte buffer does not have an allocator associated and the JSON string is over capacity, [`AWS_OP_ERR`](@ref) will be returned.

Note: When you are finished with the [`aws_byte_buf`](@ref), you must call "[`aws_byte_buf_clean_up_secure`](@ref)" to free the memory used, as it will NOT be called automatically.

### Parameters
* `value`: The [`aws_json_value`](@ref) to format.
* `output`: The destination for the JSON string
### Returns
[`AWS_OP_SUCCESS`](@ref) if the JSON string was allocated to output without any errors Will return [`AWS_OP_ERR`](@ref) if the value passed is not an [`aws_json_value`](@ref) or if there aws an error appending the JSON into the byte buffer.
### Prototype
```c
int aws_byte_buf_append_json_string_formatted(const struct aws_json_value *value, struct aws_byte_buf *output);
```
"""
function aws_byte_buf_append_json_string_formatted(value, output)
    ccall((:aws_byte_buf_append_json_string_formatted, libaws_c_common), Cint, (Ptr{aws_json_value}, Ptr{aws_byte_buf}), value, output)
end

"""
    aws_json_value_new_from_string(allocator, string)

Parses the JSON string and returns a [`aws_json_value`](@ref) containing the root of the JSON.

### Parameters
* `allocator`: The allocator used to create the value
* `string`: The string containing the JSON.
### Returns
The root [`aws_json_value`](@ref) of the JSON.
### Prototype
```c
struct aws_json_value *aws_json_value_new_from_string(struct aws_allocator *allocator, struct aws_byte_cursor string);
```
"""
function aws_json_value_new_from_string(allocator, string)
    ccall((:aws_json_value_new_from_string, libaws_c_common), Ptr{aws_json_value}, (Ptr{aws_allocator}, aws_byte_cursor), allocator, string)
end

"""
    aws_cache_new_lifo(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)

Initializes the last-in-first-out cache. Sets up the underlying linked hash table. Once `max_items` elements have been added, the latest(last-in) item will be removed. For the other parameters, see aws/common/hash\\_table.h. Hash table semantics of these arguments are preserved.

### Prototype
```c
struct aws_cache *aws_cache_new_lifo( struct aws_allocator *allocator, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn, size_t max_items);
```
"""
function aws_cache_new_lifo(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
    ccall((:aws_cache_new_lifo, libaws_c_common), Ptr{aws_cache}, (Ptr{aws_allocator}, Ptr{aws_hash_fn}, Ptr{aws_hash_callback_eq_fn}, Ptr{aws_hash_callback_destroy_fn}, Ptr{aws_hash_callback_destroy_fn}, Csize_t), allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
end

"""
    aws_linked_hash_table_node

Linked-List node stored in the table. This is the node type that will be returned in [`aws_linked_hash_table_get_iteration_list`](@ref)().
"""
struct aws_linked_hash_table_node
    node::aws_linked_list_node
    table::Ptr{aws_linked_hash_table}
    key::Ptr{Cvoid}
    value::Ptr{Cvoid}
end

"""
    aws_linked_hash_table_init(table, allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, initial_item_count)

Initializes the table. Sets up the underlying hash table and linked list. For the other parameters, see aws/common/hash\\_table.h. Hash table semantics of these arguments are preserved.

### Prototype
```c
int aws_linked_hash_table_init( struct aws_linked_hash_table *table, struct aws_allocator *allocator, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn, size_t initial_item_count);
```
"""
function aws_linked_hash_table_init(table, allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, initial_item_count)
    ccall((:aws_linked_hash_table_init, libaws_c_common), Cint, (Ptr{aws_linked_hash_table}, Ptr{aws_allocator}, Ptr{aws_hash_fn}, Ptr{aws_hash_callback_eq_fn}, Ptr{aws_hash_callback_destroy_fn}, Ptr{aws_hash_callback_destroy_fn}, Csize_t), table, allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, initial_item_count)
end

"""
    aws_linked_hash_table_clean_up(table)

Cleans up the table. Elements in the table will be evicted and cleanup callbacks will be invoked.

### Prototype
```c
void aws_linked_hash_table_clean_up(struct aws_linked_hash_table *table);
```
"""
function aws_linked_hash_table_clean_up(table)
    ccall((:aws_linked_hash_table_clean_up, libaws_c_common), Cvoid, (Ptr{aws_linked_hash_table},), table)
end

"""
    aws_linked_hash_table_find(table, key, p_value)

Finds element in the table by key. If found, [`AWS_OP_SUCCESS`](@ref) will be returned. If not found, [`AWS_OP_SUCCESS`](@ref) will be returned and *p\\_value will be NULL.

If any errors occur [`AWS_OP_ERR`](@ref) will be returned.

### Prototype
```c
int aws_linked_hash_table_find(struct aws_linked_hash_table *table, const void *key, void **p_value);
```
"""
function aws_linked_hash_table_find(table, key, p_value)
    ccall((:aws_linked_hash_table_find, libaws_c_common), Cint, (Ptr{aws_linked_hash_table}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), table, key, p_value)
end

"""
    aws_linked_hash_table_find_and_move_to_back(table, key, p_value)

Finds element in the table by key. If found, [`AWS_OP_SUCCESS`](@ref) will be returned and the item will be moved to the back of the list. If not found, [`AWS_OP_SUCCESS`](@ref) will be returned and *p\\_value will be NULL.

Note: this will change the order of elements

### Prototype
```c
int aws_linked_hash_table_find_and_move_to_back(struct aws_linked_hash_table *table, const void *key, void **p_value);
```
"""
function aws_linked_hash_table_find_and_move_to_back(table, key, p_value)
    ccall((:aws_linked_hash_table_find_and_move_to_back, libaws_c_common), Cint, (Ptr{aws_linked_hash_table}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), table, key, p_value)
end

"""
    aws_linked_hash_table_put(table, key, p_value)

Puts `p_value` at `key`. If an element is already stored at `key` it will be replaced.

### Prototype
```c
int aws_linked_hash_table_put(struct aws_linked_hash_table *table, const void *key, void *p_value);
```
"""
function aws_linked_hash_table_put(table, key, p_value)
    ccall((:aws_linked_hash_table_put, libaws_c_common), Cint, (Ptr{aws_linked_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}), table, key, p_value)
end

"""
    aws_linked_hash_table_remove(table, key)

Removes item at `key` from the table.

### Prototype
```c
int aws_linked_hash_table_remove(struct aws_linked_hash_table *table, const void *key);
```
"""
function aws_linked_hash_table_remove(table, key)
    ccall((:aws_linked_hash_table_remove, libaws_c_common), Cint, (Ptr{aws_linked_hash_table}, Ptr{Cvoid}), table, key)
end

"""
    aws_linked_hash_table_clear(table)

Clears all items from the table.

### Prototype
```c
void aws_linked_hash_table_clear(struct aws_linked_hash_table *table);
```
"""
function aws_linked_hash_table_clear(table)
    ccall((:aws_linked_hash_table_clear, libaws_c_common), Cvoid, (Ptr{aws_linked_hash_table},), table)
end

"""
    aws_linked_hash_table_get_element_count(table)

returns number of elements in the table.

### Prototype
```c
size_t aws_linked_hash_table_get_element_count(const struct aws_linked_hash_table *table);
```
"""
function aws_linked_hash_table_get_element_count(table)
    ccall((:aws_linked_hash_table_get_element_count, libaws_c_common), Csize_t, (Ptr{aws_linked_hash_table},), table)
end

"""
    aws_linked_hash_table_move_node_to_end_of_list(table, node)

Move the [`aws_linked_hash_table_node`](@ref) to the end of the list.

Note: this will change the order of elements

### Prototype
```c
void aws_linked_hash_table_move_node_to_end_of_list( struct aws_linked_hash_table *table, struct aws_linked_hash_table_node *node);
```
"""
function aws_linked_hash_table_move_node_to_end_of_list(table, node)
    ccall((:aws_linked_hash_table_move_node_to_end_of_list, libaws_c_common), Cvoid, (Ptr{aws_linked_hash_table}, Ptr{aws_linked_hash_table_node}), table, node)
end

"""
    aws_linked_hash_table_get_iteration_list(table)

returns the underlying linked list for iteration.

The returned list has nodes of the type: [`aws_linked_hash_table_node`](@ref). Use [`AWS_CONTAINER_OF`](@ref) for access to the element.

### Prototype
```c
const struct aws_linked_list *aws_linked_hash_table_get_iteration_list(const struct aws_linked_hash_table *table);
```
"""
function aws_linked_hash_table_get_iteration_list(table)
    ccall((:aws_linked_hash_table_get_iteration_list, libaws_c_common), Ptr{aws_linked_list}, (Ptr{aws_linked_hash_table},), table)
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
    ccall((:aws_string_bytes, libaws_c_common), Ptr{UInt8}, (Ptr{aws_string},), str)
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
    ccall((:aws_string_c_str, libaws_c_common), Ptr{Cchar}, (Ptr{aws_string},), str)
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
    ccall((:aws_string_is_valid, libaws_c_common), Bool, (Ptr{aws_string},), str)
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
    ccall((:aws_c_string_is_valid, libaws_c_common), Bool, (Ptr{Cchar},), str)
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
    ccall((:aws_char_is_space, libaws_c_common), Bool, (UInt8,), c)
end

# typedef int ( aws_log_channel_send_fn ) ( struct aws_log_channel * channel , struct aws_string * output )
const aws_log_channel_send_fn = Cvoid

# typedef void ( aws_log_channel_clean_up_fn ) ( struct aws_log_channel * channel )
const aws_log_channel_clean_up_fn = Cvoid

struct aws_log_channel_vtable
    send::Ptr{aws_log_channel_send_fn}
    clean_up::Ptr{aws_log_channel_clean_up_fn}
end

# typedef int ( aws_log_writer_write_fn ) ( struct aws_log_writer * writer , const struct aws_string * output )
const aws_log_writer_write_fn = Cvoid

# typedef void ( aws_log_writer_clean_up_fn ) ( struct aws_log_writer * writer )
const aws_log_writer_clean_up_fn = Cvoid

struct aws_log_writer_vtable
    write::Ptr{aws_log_writer_write_fn}
    clean_up::Ptr{aws_log_writer_clean_up_fn}
end

struct aws_log_writer
    vtable::Ptr{aws_log_writer_vtable}
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
end

struct aws_log_channel
    vtable::Ptr{aws_log_channel_vtable}
    allocator::Ptr{aws_allocator}
    writer::Ptr{aws_log_writer}
    impl::Ptr{Cvoid}
end

"""
    aws_log_channel_init_foreground(channel, allocator, writer)

### Prototype
```c
int aws_log_channel_init_foreground( struct aws_log_channel *channel, struct aws_allocator *allocator, struct aws_log_writer *writer);
```
"""
function aws_log_channel_init_foreground(channel, allocator, writer)
    ccall((:aws_log_channel_init_foreground, libaws_c_common), Cint, (Ptr{aws_log_channel}, Ptr{aws_allocator}, Ptr{aws_log_writer}), channel, allocator, writer)
end

"""
    aws_log_channel_init_background(channel, allocator, writer)

### Prototype
```c
int aws_log_channel_init_background( struct aws_log_channel *channel, struct aws_allocator *allocator, struct aws_log_writer *writer);
```
"""
function aws_log_channel_init_background(channel, allocator, writer)
    ccall((:aws_log_channel_init_background, libaws_c_common), Cint, (Ptr{aws_log_channel}, Ptr{aws_allocator}, Ptr{aws_log_writer}), channel, allocator, writer)
end

"""
    aws_log_channel_clean_up(channel)

### Prototype
```c
void aws_log_channel_clean_up(struct aws_log_channel *channel);
```
"""
function aws_log_channel_clean_up(channel)
    ccall((:aws_log_channel_clean_up, libaws_c_common), Cvoid, (Ptr{aws_log_channel},), channel)
end

# typedef int ( aws_log_formatter_format_fn ) ( struct aws_log_formatter * formatter , struct aws_string * * formatted_output , enum aws_log_level level , aws_log_subject_t subject , const char * format , va_list args )
const aws_log_formatter_format_fn = Cvoid

# typedef void ( aws_log_formatter_clean_up_fn ) ( struct aws_log_formatter * logger )
const aws_log_formatter_clean_up_fn = Cvoid

struct aws_log_formatter_vtable
    format::Ptr{aws_log_formatter_format_fn}
    clean_up::Ptr{aws_log_formatter_clean_up_fn}
end

struct aws_log_formatter
    vtable::Ptr{aws_log_formatter_vtable}
    allocator::Ptr{aws_allocator}
    impl::Ptr{Cvoid}
end

struct aws_log_formatter_standard_options
    date_format::aws_date_format
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

struct aws_logging_standard_formatting_data
    log_line_buffer::Ptr{Cchar}
    total_length::Csize_t
    level::aws_log_level
    subject_name::Ptr{Cchar}
    format::Ptr{Cchar}
    date_format::aws_date_format
    allocator::Ptr{aws_allocator}
    amount_written::Csize_t
end

"""
    aws_log_formatter_init_default(formatter, allocator, options)

### Prototype
```c
int aws_log_formatter_init_default( struct aws_log_formatter *formatter, struct aws_allocator *allocator, struct aws_log_formatter_standard_options *options);
```
"""
function aws_log_formatter_init_default(formatter, allocator, options)
    ccall((:aws_log_formatter_init_default, libaws_c_common), Cint, (Ptr{aws_log_formatter}, Ptr{aws_allocator}, Ptr{aws_log_formatter_standard_options}), formatter, allocator, options)
end

"""
    aws_log_formatter_clean_up(formatter)

### Prototype
```c
void aws_log_formatter_clean_up(struct aws_log_formatter *formatter);
```
"""
function aws_log_formatter_clean_up(formatter)
    ccall((:aws_log_formatter_clean_up, libaws_c_common), Cvoid, (Ptr{aws_log_formatter},), formatter)
end

struct aws_log_writer_file_options
    filename::Ptr{Cchar}
    file::Ptr{Libc.FILE}
end

"""
    aws_log_writer_init_stdout(writer, allocator)

### Prototype
```c
int aws_log_writer_init_stdout(struct aws_log_writer *writer, struct aws_allocator *allocator);
```
"""
function aws_log_writer_init_stdout(writer, allocator)
    ccall((:aws_log_writer_init_stdout, libaws_c_common), Cint, (Ptr{aws_log_writer}, Ptr{aws_allocator}), writer, allocator)
end

"""
    aws_log_writer_init_stderr(writer, allocator)

### Prototype
```c
int aws_log_writer_init_stderr(struct aws_log_writer *writer, struct aws_allocator *allocator);
```
"""
function aws_log_writer_init_stderr(writer, allocator)
    ccall((:aws_log_writer_init_stderr, libaws_c_common), Cint, (Ptr{aws_log_writer}, Ptr{aws_allocator}), writer, allocator)
end

"""
    aws_log_writer_init_file(writer, allocator, options)

### Prototype
```c
int aws_log_writer_init_file( struct aws_log_writer *writer, struct aws_allocator *allocator, struct aws_log_writer_file_options *options);
```
"""
function aws_log_writer_init_file(writer, allocator, options)
    ccall((:aws_log_writer_init_file, libaws_c_common), Cint, (Ptr{aws_log_writer}, Ptr{aws_allocator}, Ptr{aws_log_writer_file_options}), writer, allocator, options)
end

"""
    aws_log_writer_clean_up(writer)

### Prototype
```c
void aws_log_writer_clean_up(struct aws_log_writer *writer);
```
"""
function aws_log_writer_clean_up(writer)
    ccall((:aws_log_writer_clean_up, libaws_c_common), Cvoid, (Ptr{aws_log_writer},), writer)
end

"""
    aws_logger_vtable

We separate the log level function from the log call itself so that we can do the filter check in the macros (see below)

By doing so, we make it so that the variadic format arguments are not even evaluated if the filter check does not succeed.
"""
struct aws_logger_vtable
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{aws_logger_vtable}, f::Symbol)
    f === :log && return Ptr{Ptr{Cvoid}}(x + 0)
    f === :get_log_level && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :clean_up && return Ptr{Ptr{Cvoid}}(x + 16)
    f === :set_log_level && return Ptr{Ptr{Cvoid}}(x + 24)
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
    ccall((:aws_logger_get, libaws_c_common), Ptr{aws_logger}, ())
end

"""
Log subject is a way of designating the topic of logging.

The general idea is to support a finer-grained approach to log level control. The primary use case is for situations that require more detailed logging within a specific domain, where enabling that detail globally leads to an untenable flood of information.

For example, enable TRACE logging for tls-related log statements (handshake binary payloads), but only WARN logging everywhere else (because http payloads would blow up the log files).

Log subject is an enum similar to aws error: each library has its own value-space and someone is responsible for registering the value <-> string connections.
"""
const aws_log_subject_t = UInt32

@cenum __JL_Ctag_200::UInt32 begin
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
    ccall((:aws_logger_set, libaws_c_common), Cvoid, (Ptr{aws_logger},), logger)
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
    ccall((:aws_logger_get_conditional, libaws_c_common), Ptr{aws_logger}, (aws_log_subject_t, aws_log_level), subject, level)
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
    ccall((:aws_logger_clean_up, libaws_c_common), Cvoid, (Ptr{aws_logger},), logger)
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
    ccall((:aws_logger_set_log_level, libaws_c_common), Cint, (Ptr{aws_logger}, aws_log_level), logger, level)
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
    ccall((:aws_log_level_to_string, libaws_c_common), Cint, (aws_log_level, Ptr{Ptr{Cchar}}), log_level, level_string)
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
    ccall((:aws_string_to_log_level, libaws_c_common), Cint, (Ptr{Cchar}, Ptr{aws_log_level}), level_string, log_level)
end

const aws_thread_id_t = Culong

"""
    aws_thread_id_t_to_string(thread_id, buffer, bufsz)

Converts an [`aws_thread_id_t`](@ref) to a c-string. For portability, [`aws_thread_id_t`](@ref) must not be printed directly. Intended primarily to support building log lines that include the thread id in them. The parameter `buffer` must point-to a char buffer of length `bufsz == [`AWS_THREAD_ID_T_REPR_BUFSZ`](@ref)`. The thread id representation is returned in `buffer`.

### Prototype
```c
int aws_thread_id_t_to_string(aws_thread_id_t thread_id, char *buffer, size_t bufsz);
```
"""
function aws_thread_id_t_to_string(thread_id, buffer, bufsz)
    ccall((:aws_thread_id_t_to_string, libaws_c_common), Cint, (aws_thread_id_t, Ptr{Cchar}, Csize_t), thread_id, buffer, bufsz)
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
    ccall((:aws_log_subject_name, libaws_c_common), Ptr{Cchar}, (aws_log_subject_t,), subject)
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
    ccall((:aws_register_log_subject_info_list, libaws_c_common), Cvoid, (Ptr{aws_log_subject_info_list},), log_subject_list)
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
    ccall((:aws_unregister_log_subject_info_list, libaws_c_common), Cvoid, (Ptr{aws_log_subject_info_list},), log_subject_list)
end

"""
    aws_logger_init_standard(logger, allocator, options)

### Prototype
```c
int aws_logger_init_standard( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_logger_standard_options *options);
```
"""
function aws_logger_init_standard(logger, allocator, options)
    ccall((:aws_logger_init_standard, libaws_c_common), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_logger_standard_options}), logger, allocator, options)
end

"""
    aws_logger_init_from_external(logger, allocator, formatter, channel, writer, level)

### Prototype
```c
int aws_logger_init_from_external( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_log_formatter *formatter, struct aws_log_channel *channel, struct aws_log_writer *writer, enum aws_log_level level);
```
"""
function aws_logger_init_from_external(logger, allocator, formatter, channel, writer, level)
    ccall((:aws_logger_init_from_external, libaws_c_common), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_log_formatter}, Ptr{aws_log_channel}, Ptr{aws_log_writer}, aws_log_level), logger, allocator, formatter, channel, writer, level)
end

"""
    aws_logger_init_noalloc(logger, allocator, options)

### Prototype
```c
int aws_logger_init_noalloc( struct aws_logger *logger, struct aws_allocator *allocator, struct aws_logger_standard_options *options);
```
"""
function aws_logger_init_noalloc(logger, allocator, options)
    ccall((:aws_logger_init_noalloc, libaws_c_common), Cint, (Ptr{aws_logger}, Ptr{aws_allocator}, Ptr{aws_logger_standard_options}), logger, allocator, options)
end

"""
    aws_cache_new_lru(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)

Initializes the Least-recently-used cache. Sets up the underlying linked hash table. Once `max_items` elements have been added, the least recently used item will be removed. For the other parameters, see aws/common/hash\\_table.h. Hash table semantics of these arguments are preserved.(Yes the one that was the answer to that interview question that one time).

### Prototype
```c
struct aws_cache *aws_cache_new_lru( struct aws_allocator *allocator, aws_hash_fn *hash_fn, aws_hash_callback_eq_fn *equals_fn, aws_hash_callback_destroy_fn *destroy_key_fn, aws_hash_callback_destroy_fn *destroy_value_fn, size_t max_items);
```
"""
function aws_cache_new_lru(allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
    ccall((:aws_cache_new_lru, libaws_c_common), Ptr{aws_cache}, (Ptr{aws_allocator}, Ptr{aws_hash_fn}, Ptr{aws_hash_callback_eq_fn}, Ptr{aws_hash_callback_destroy_fn}, Ptr{aws_hash_callback_destroy_fn}, Csize_t), allocator, hash_fn, equals_fn, destroy_key_fn, destroy_value_fn, max_items)
end

"""
    aws_lru_cache_use_lru_element(cache)

Accesses the least-recently-used element, sets it to most-recently-used element, and returns the value.

### Prototype
```c
void *aws_lru_cache_use_lru_element(struct aws_cache *cache);
```
"""
function aws_lru_cache_use_lru_element(cache)
    ccall((:aws_lru_cache_use_lru_element, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_cache},), cache)
end

"""
    aws_lru_cache_get_mru_element(cache)

Accesses the most-recently-used element and returns its value.

### Prototype
```c
void *aws_lru_cache_get_mru_element(const struct aws_cache *cache);
```
"""
function aws_lru_cache_get_mru_element(cache)
    ccall((:aws_lru_cache_get_mru_element, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_cache},), cache)
end

const static_assertion_at_line_60 = NTuple{1, Cchar}

const static_assertion_at_line_61 = NTuple{1, Cchar}

const static_assertion_at_line_62 = NTuple{1, Cchar}

@cenum __JL_Ctag_208::UInt32 begin
    AWS_CACHE_LINE = 64
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
    ccall((:aws_mutex_init, libaws_c_common), Cint, (Ptr{aws_mutex},), mutex)
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
    ccall((:aws_mutex_clean_up, libaws_c_common), Cvoid, (Ptr{aws_mutex},), mutex)
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
    ccall((:aws_mutex_lock, libaws_c_common), Cint, (Ptr{aws_mutex},), mutex)
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
    ccall((:aws_mutex_try_lock, libaws_c_common), Cint, (Ptr{aws_mutex},), mutex)
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
    ccall((:aws_mutex_unlock, libaws_c_common), Cint, (Ptr{aws_mutex},), mutex)
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
    ccall((:aws_priority_queue_init_dynamic, libaws_c_common), Cint, (Ptr{aws_priority_queue}, Ptr{aws_allocator}, Csize_t, Csize_t, Ptr{aws_priority_queue_compare_fn}), queue, alloc, default_size, item_size, pred)
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
    ccall((:aws_priority_queue_init_static, libaws_c_common), Cvoid, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Csize_t, Csize_t, Ptr{aws_priority_queue_compare_fn}), queue, heap, item_count, item_size, pred)
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
    ccall((:aws_priority_queue_backpointer_index_valid, libaws_c_common), Bool, (Ptr{aws_priority_queue}, Csize_t), queue, index)
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
    ccall((:aws_priority_queue_backpointers_valid_deep, libaws_c_common), Bool, (Ptr{aws_priority_queue},), queue)
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
    ccall((:aws_priority_queue_backpointers_valid, libaws_c_common), Bool, (Ptr{aws_priority_queue},), queue)
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
    ccall((:aws_priority_queue_is_valid, libaws_c_common), Bool, (Ptr{aws_priority_queue},), queue)
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
    ccall((:aws_priority_queue_clean_up, libaws_c_common), Cvoid, (Ptr{aws_priority_queue},), queue)
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
    ccall((:aws_priority_queue_push, libaws_c_common), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}), queue, item)
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
    ccall((:aws_priority_queue_push_ref, libaws_c_common), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Ptr{aws_priority_queue_node}), queue, item, backpointer)
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
    ccall((:aws_priority_queue_pop, libaws_c_common), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}), queue, item)
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
    ccall((:aws_priority_queue_remove, libaws_c_common), Cint, (Ptr{aws_priority_queue}, Ptr{Cvoid}, Ptr{aws_priority_queue_node}), queue, item, node)
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
    ccall((:aws_priority_queue_top, libaws_c_common), Cint, (Ptr{aws_priority_queue}, Ptr{Ptr{Cvoid}}), queue, item)
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
    ccall((:aws_priority_queue_clear, libaws_c_common), Cvoid, (Ptr{aws_priority_queue},), queue)
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
    ccall((:aws_priority_queue_size, libaws_c_common), Csize_t, (Ptr{aws_priority_queue},), queue)
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
    ccall((:aws_priority_queue_capacity, libaws_c_common), Csize_t, (Ptr{aws_priority_queue},), queue)
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
    ccall((:aws_priority_queue_node_init, libaws_c_common), Cvoid, (Ptr{aws_priority_queue_node},), node)
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
    ccall((:aws_priority_queue_node_is_in_queue, libaws_c_common), Bool, (Ptr{aws_priority_queue_node},), node)
end

struct aws_run_command_result
    ret_code::Cint
    std_out::Ptr{aws_string}
    std_err::Ptr{aws_string}
end

struct aws_run_command_options
    command::Ptr{Cchar}
end

"""
    aws_get_pid()

Returns the current process's PID (process id).

### Returns
PID as int
### Prototype
```c
int aws_get_pid(void);
```
"""
function aws_get_pid()
    ccall((:aws_get_pid, libaws_c_common), Cint, ())
end

"""
    aws_get_soft_limit_io_handles()

Returns the soft limit for max io handles (max fds in unix terminology). This limit is one more than the actual limit. The soft limit can be changed up to the hard limit by any process regardless of permissions.

### Prototype
```c
size_t aws_get_soft_limit_io_handles(void);
```
"""
function aws_get_soft_limit_io_handles()
    ccall((:aws_get_soft_limit_io_handles, libaws_c_common), Csize_t, ())
end

"""
    aws_get_hard_limit_io_handles()

Returns the hard limit for max io handles (max fds in unix terminology). This limit is one more than the actual limit. This limit cannot be increased without sudo permissions.

### Prototype
```c
size_t aws_get_hard_limit_io_handles(void);
```
"""
function aws_get_hard_limit_io_handles()
    ccall((:aws_get_hard_limit_io_handles, libaws_c_common), Csize_t, ())
end

"""
    aws_set_soft_limit_io_handles(max_handles)

Sets the new soft limit for io\\_handles (max fds). This can be up to the hard limit but may not exceed it.

This operation will always fail with AWS\\_ERROR\\_UNIMPLEMENTED error code on Windows.

### Prototype
```c
int aws_set_soft_limit_io_handles(size_t max_handles);
```
"""
function aws_set_soft_limit_io_handles(max_handles)
    ccall((:aws_set_soft_limit_io_handles, libaws_c_common), Cint, (Csize_t,), max_handles)
end

"""
    aws_run_command_result_init(allocator, result)

### Prototype
```c
int aws_run_command_result_init(struct aws_allocator *allocator, struct aws_run_command_result *result);
```
"""
function aws_run_command_result_init(allocator, result)
    ccall((:aws_run_command_result_init, libaws_c_common), Cint, (Ptr{aws_allocator}, Ptr{aws_run_command_result}), allocator, result)
end

"""
    aws_run_command_result_cleanup(result)

### Prototype
```c
void aws_run_command_result_cleanup(struct aws_run_command_result *result);
```
"""
function aws_run_command_result_cleanup(result)
    ccall((:aws_run_command_result_cleanup, libaws_c_common), Cvoid, (Ptr{aws_run_command_result},), result)
end

"""
    aws_run_command(allocator, options, result)

Currently this API is implemented using popen on Posix system and \\_popen on Windows to capture output from running a command. Note that popen only captures stdout, and doesn't provide an option to capture stderr. We will add more options, such as acquire stderr in the future so probably will alter the underlying implementation as well.

### Prototype
```c
int aws_run_command( struct aws_allocator *allocator, struct aws_run_command_options *options, struct aws_run_command_result *result);
```
"""
function aws_run_command(allocator, options, result)
    ccall((:aws_run_command, libaws_c_common), Cint, (Ptr{aws_allocator}, Ptr{aws_run_command_options}, Ptr{aws_run_command_result}), allocator, options, result)
end

mutable struct aws_promise end

"""
    aws_promise_new(allocator)

### Prototype
```c
struct aws_promise *aws_promise_new(struct aws_allocator *allocator);
```
"""
function aws_promise_new(allocator)
    ccall((:aws_promise_new, libaws_c_common), Ptr{aws_promise}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_promise_acquire(promise)

### Prototype
```c
struct aws_promise *aws_promise_acquire(struct aws_promise *promise);
```
"""
function aws_promise_acquire(promise)
    ccall((:aws_promise_acquire, libaws_c_common), Ptr{aws_promise}, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_release(promise)

### Prototype
```c
void aws_promise_release(struct aws_promise *promise);
```
"""
function aws_promise_release(promise)
    ccall((:aws_promise_release, libaws_c_common), Cvoid, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_wait(promise)

### Prototype
```c
void aws_promise_wait(struct aws_promise *promise);
```
"""
function aws_promise_wait(promise)
    ccall((:aws_promise_wait, libaws_c_common), Cvoid, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_wait_for(promise, nanoseconds)

### Prototype
```c
bool aws_promise_wait_for(struct aws_promise *promise, size_t nanoseconds);
```
"""
function aws_promise_wait_for(promise, nanoseconds)
    ccall((:aws_promise_wait_for, libaws_c_common), Bool, (Ptr{aws_promise}, Csize_t), promise, nanoseconds)
end

"""
    aws_promise_complete(promise, value, dtor)

### Prototype
```c
void aws_promise_complete(struct aws_promise *promise, void *value, void (*dtor)(void *));
```
"""
function aws_promise_complete(promise, value, dtor)
    ccall((:aws_promise_complete, libaws_c_common), Cvoid, (Ptr{aws_promise}, Ptr{Cvoid}, Ptr{Cvoid}), promise, value, dtor)
end

"""
    aws_promise_fail(promise, error_code)

### Prototype
```c
void aws_promise_fail(struct aws_promise *promise, int error_code);
```
"""
function aws_promise_fail(promise, error_code)
    ccall((:aws_promise_fail, libaws_c_common), Cvoid, (Ptr{aws_promise}, Cint), promise, error_code)
end

"""
    aws_promise_is_complete(promise)

### Prototype
```c
bool aws_promise_is_complete(struct aws_promise *promise);
```
"""
function aws_promise_is_complete(promise)
    ccall((:aws_promise_is_complete, libaws_c_common), Bool, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_error_code(promise)

### Prototype
```c
int aws_promise_error_code(struct aws_promise *promise);
```
"""
function aws_promise_error_code(promise)
    ccall((:aws_promise_error_code, libaws_c_common), Cint, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_value(promise)

### Prototype
```c
void *aws_promise_value(struct aws_promise *promise);
```
"""
function aws_promise_value(promise)
    ccall((:aws_promise_value, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_promise},), promise)
end

"""
    aws_promise_take_value(promise)

### Prototype
```c
void *aws_promise_take_value(struct aws_promise *promise);
```
"""
function aws_promise_take_value(promise)
    ccall((:aws_promise_take_value, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_promise},), promise)
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
    ccall((:aws_ref_count_init, libaws_c_common), Cvoid, (Ptr{aws_ref_count}, Ptr{Cvoid}, Ptr{aws_simple_completion_callback}), ref_count, object, on_zero_fn)
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
    ccall((:aws_ref_count_acquire, libaws_c_common), Ptr{Cvoid}, (Ptr{aws_ref_count},), ref_count)
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
    ccall((:aws_ref_count_release, libaws_c_common), Csize_t, (Ptr{aws_ref_count},), ref_count)
end

"""
    aws_ring_buffer

Lockless ring buffer implementation that is thread safe assuming a single thread acquires and a single thread releases. For any other use case (other than the single-threaded use-case), you must manage thread-safety manually.

Also, a very important note: release must happen in the same order as acquire. If you do not your application, and possibly computers within a thousand mile radius, may die terrible deaths, and the local drinking water will be poisoned for generations with fragments of what is left of your radioactive corrupted memory.
"""
struct aws_ring_buffer
    allocator::Ptr{aws_allocator}
    allocation::Ptr{UInt8}
    head::aws_atomic_var
    tail::aws_atomic_var
    allocation_end::Ptr{UInt8}
end

"""
    aws_ring_buffer_init(ring_buf, allocator, size)

Initializes a ring buffer with an allocation of size `size`. Returns [`AWS_OP_SUCCESS`](@ref) on a successful initialization, [`AWS_OP_ERR`](@ref) otherwise.

### Prototype
```c
int aws_ring_buffer_init(struct aws_ring_buffer *ring_buf, struct aws_allocator *allocator, size_t size);
```
"""
function aws_ring_buffer_init(ring_buf, allocator, size)
    ccall((:aws_ring_buffer_init, libaws_c_common), Cint, (Ptr{aws_ring_buffer}, Ptr{aws_allocator}, Csize_t), ring_buf, allocator, size)
end

"""
    aws_ring_buffer_check_atomic_ptr(ring_buf, atomic_ptr)

### Prototype
```c
AWS_STATIC_IMPL bool aws_ring_buffer_check_atomic_ptr( const struct aws_ring_buffer *ring_buf, const uint8_t *atomic_ptr);
```
"""
function aws_ring_buffer_check_atomic_ptr(ring_buf, atomic_ptr)
    ccall((:aws_ring_buffer_check_atomic_ptr, libaws_c_common), Bool, (Ptr{aws_ring_buffer}, Ptr{UInt8}), ring_buf, atomic_ptr)
end

"""
    aws_ring_buffer_is_empty(ring_buf)

Checks whether the ring buffer is empty

### Prototype
```c
AWS_STATIC_IMPL bool aws_ring_buffer_is_empty(const struct aws_ring_buffer *ring_buf);
```
"""
function aws_ring_buffer_is_empty(ring_buf)
    ccall((:aws_ring_buffer_is_empty, libaws_c_common), Bool, (Ptr{aws_ring_buffer},), ring_buf)
end

"""
    aws_ring_buffer_is_valid(ring_buf)

Evaluates the set of properties that define the shape of all valid [`aws_ring_buffer`](@ref) structures. It is also a cheap check, in the sense it run in constant time (i.e., no loops or recursion).

### Prototype
```c
AWS_STATIC_IMPL bool aws_ring_buffer_is_valid(const struct aws_ring_buffer *ring_buf);
```
"""
function aws_ring_buffer_is_valid(ring_buf)
    ccall((:aws_ring_buffer_is_valid, libaws_c_common), Bool, (Ptr{aws_ring_buffer},), ring_buf)
end

"""
    aws_ring_buffer_clean_up(ring_buf)

Cleans up the ring buffer's resources.

### Prototype
```c
void aws_ring_buffer_clean_up(struct aws_ring_buffer *ring_buf);
```
"""
function aws_ring_buffer_clean_up(ring_buf)
    ccall((:aws_ring_buffer_clean_up, libaws_c_common), Cvoid, (Ptr{aws_ring_buffer},), ring_buf)
end

"""
    aws_ring_buffer_acquire(ring_buf, requested_size, dest)

Attempts to acquire `requested_size` buffer and stores the result in `dest` if successful. Returns [`AWS_OP_SUCCESS`](@ref) if the requested size was available for use, [`AWS_OP_ERR`](@ref) otherwise.

### Prototype
```c
int aws_ring_buffer_acquire( struct aws_ring_buffer *ring_buf, size_t requested_size, struct aws_byte_buf *dest);
```
"""
function aws_ring_buffer_acquire(ring_buf, requested_size, dest)
    ccall((:aws_ring_buffer_acquire, libaws_c_common), Cint, (Ptr{aws_ring_buffer}, Csize_t, Ptr{aws_byte_buf}), ring_buf, requested_size, dest)
end

"""
    aws_ring_buffer_acquire_up_to(ring_buf, minimum_size, requested_size, dest)

Attempts to acquire `requested_size` buffer and stores the result in `dest` if successful. If not available, it will attempt to acquire anywhere from 1 byte to `requested_size`. Returns [`AWS_OP_SUCCESS`](@ref) if some buffer space is available for use, [`AWS_OP_ERR`](@ref) otherwise.

### Prototype
```c
int aws_ring_buffer_acquire_up_to( struct aws_ring_buffer *ring_buf, size_t minimum_size, size_t requested_size, struct aws_byte_buf *dest);
```
"""
function aws_ring_buffer_acquire_up_to(ring_buf, minimum_size, requested_size, dest)
    ccall((:aws_ring_buffer_acquire_up_to, libaws_c_common), Cint, (Ptr{aws_ring_buffer}, Csize_t, Csize_t, Ptr{aws_byte_buf}), ring_buf, minimum_size, requested_size, dest)
end

"""
    aws_ring_buffer_release(ring_buffer, buf)

Releases `buf` back to the ring buffer for further use. RELEASE MUST HAPPEN in the SAME ORDER AS ACQUIRE. If you do not, your application, and possibly computers within a thousand mile radius, may die terrible deaths, and the local drinking water will be poisoned for generations with fragments of what is left of your radioactive corrupted memory.

### Prototype
```c
void aws_ring_buffer_release(struct aws_ring_buffer *ring_buffer, struct aws_byte_buf *buf);
```
"""
function aws_ring_buffer_release(ring_buffer, buf)
    ccall((:aws_ring_buffer_release, libaws_c_common), Cvoid, (Ptr{aws_ring_buffer}, Ptr{aws_byte_buf}), ring_buffer, buf)
end

"""
    aws_ring_buffer_buf_belongs_to_pool(ring_buffer, buf)

Returns true if the memory in `buf` was vended by this ring buffer, false otherwise. Make sure `buf->buffer` and `ring\\_buffer->allocation` refer to the same memory region.

### Prototype
```c
bool aws_ring_buffer_buf_belongs_to_pool( const struct aws_ring_buffer *ring_buffer, const struct aws_byte_buf *buf);
```
"""
function aws_ring_buffer_buf_belongs_to_pool(ring_buffer, buf)
    ccall((:aws_ring_buffer_buf_belongs_to_pool, libaws_c_common), Bool, (Ptr{aws_ring_buffer}, Ptr{aws_byte_buf}), ring_buffer, buf)
end

struct aws_rw_lock
    lock_handle::Ptr{Cvoid}
end

"""
    aws_rw_lock_init(lock)

Initializes a new platform instance of mutex.

### Prototype
```c
int aws_rw_lock_init(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_init(lock)
    ccall((:aws_rw_lock_init, libaws_c_common), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_clean_up(lock)

Cleans up internal resources.

### Prototype
```c
void aws_rw_lock_clean_up(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_clean_up(lock)
    ccall((:aws_rw_lock_clean_up, libaws_c_common), Cvoid, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_rlock(lock)

Blocks until it acquires the lock. While on some platforms such as Windows, this may behave as a reentrant mutex, you should not treat it like one. On platforms it is possible for it to be non-reentrant, it will be.

### Prototype
```c
int aws_rw_lock_rlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_rlock(lock)
    ccall((:aws_rw_lock_rlock, libaws_c_common), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_wlock(lock)

### Prototype
```c
int aws_rw_lock_wlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_wlock(lock)
    ccall((:aws_rw_lock_wlock, libaws_c_common), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_try_rlock(lock)

Attempts to acquire the lock but returns immediately if it can not. While on some platforms such as Windows, this may behave as a reentrant mutex, you should not treat it like one. On platforms it is possible for it to be non-reentrant, it will be. Note: For windows, minimum support server version is Windows Server 2008 R2 [desktop apps | UWP apps]

### Prototype
```c
int aws_rw_lock_try_rlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_try_rlock(lock)
    ccall((:aws_rw_lock_try_rlock, libaws_c_common), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_try_wlock(lock)

### Prototype
```c
int aws_rw_lock_try_wlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_try_wlock(lock)
    ccall((:aws_rw_lock_try_wlock, libaws_c_common), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_runlock(lock)

Releases the lock.

### Prototype
```c
int aws_rw_lock_runlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_runlock(lock)
    ccall((:aws_rw_lock_runlock, libaws_c_common), Cint, (Ptr{aws_rw_lock},), lock)
end

"""
    aws_rw_lock_wunlock(lock)

### Prototype
```c
int aws_rw_lock_wunlock(struct aws_rw_lock *lock);
```
"""
function aws_rw_lock_wunlock(lock)
    ccall((:aws_rw_lock_wunlock, libaws_c_common), Cint, (Ptr{aws_rw_lock},), lock)
end

const aws_crt_statistics_category_t = UInt32

@cenum __JL_Ctag_272::UInt32 begin
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
    ccall((:aws_crt_statistics_handler_process_statistics, libaws_c_common), Cvoid, (Ptr{aws_crt_statistics_handler}, Ptr{aws_crt_statistics_sample_interval}, Ptr{aws_array_list}, Ptr{Cvoid}), handler, interval, stats, context)
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
    ccall((:aws_crt_statistics_handler_get_report_interval_ms, libaws_c_common), UInt64, (Ptr{aws_crt_statistics_handler},), handler)
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
    ccall((:aws_crt_statistics_handler_destroy, libaws_c_common), Cvoid, (Ptr{aws_crt_statistics_handler},), handler)
end

"""
\\deprecated Use int64\\_t instead for offsets in public APIs.
"""
const aws_off_t = Int64

struct aws_wstring
    allocator::Ptr{aws_allocator}
    len::Csize_t
    bytes::NTuple{1, Cwchar_t}
end

"""
    aws_string_convert_to_wstring(allocator, to_convert)

For windows only. Converts `to_convert` to a windows whcar format (UTF-16) for use with windows OS interop.

Note: `to_convert` is assumed to be UTF-8 or ASCII.

returns NULL on failure.

### Prototype
```c
struct aws_wstring *aws_string_convert_to_wstring( struct aws_allocator *allocator, const struct aws_string *to_convert);
```
"""
function aws_string_convert_to_wstring(allocator, to_convert)
    ccall((:aws_string_convert_to_wstring, libaws_c_common), Ptr{aws_wstring}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, to_convert)
end

"""
    aws_string_convert_to_wchar_from_byte_cursor(allocator, to_convert)

For windows only. Converts `to_convert` to a windows whcar format (UTF-16) for use with windows OS interop.

Note: `to_convert` is assumed to be UTF-8 or ASCII.

returns NULL on failure.

### Prototype
```c
struct aws_wstring *aws_string_convert_to_wchar_from_byte_cursor( struct aws_allocator *allocator, const struct aws_byte_cursor *to_convert);
```
"""
function aws_string_convert_to_wchar_from_byte_cursor(allocator, to_convert)
    ccall((:aws_string_convert_to_wchar_from_byte_cursor, libaws_c_common), Ptr{aws_wstring}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, to_convert)
end

"""
    aws_wstring_destroy(str)

clean up str.

### Prototype
```c
void aws_wstring_destroy(struct aws_wstring *str);
```
"""
function aws_wstring_destroy(str)
    ccall((:aws_wstring_destroy, libaws_c_common), Cvoid, (Ptr{aws_wstring},), str)
end

"""
    aws_string_convert_from_wchar_str(allocator, to_convert)

For windows only. Converts `to_convert` from a windows whcar format (UTF-16) to UTF-8.

Note: `to_convert` is assumed to be wchar already.

returns NULL on failure.

### Prototype
```c
struct aws_string *aws_string_convert_from_wchar_str( struct aws_allocator *allocator, const struct aws_wstring *to_convert);
```
"""
function aws_string_convert_from_wchar_str(allocator, to_convert)
    ccall((:aws_string_convert_from_wchar_str, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_wstring}), allocator, to_convert)
end

"""
    aws_string_convert_from_wchar_byte_cursor(allocator, to_convert)

For windows only. Converts `to_convert` from a windows whcar format (UTF-16) to UTF-8.

Note: `to_convert` is assumed to be wchar already.

returns NULL on failure.

### Prototype
```c
struct aws_string *aws_string_convert_from_wchar_byte_cursor( struct aws_allocator *allocator, const struct aws_byte_cursor *to_convert);
```
"""
function aws_string_convert_from_wchar_byte_cursor(allocator, to_convert)
    ccall((:aws_string_convert_from_wchar_byte_cursor, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, to_convert)
end

"""
    aws_string_convert_from_wchar_c_str(allocator, to_convert)

For windows only. Converts `to_convert` from a windows whcar format (UTF-16) to UTF-8.

Note: `to_convert` is assumed to be wchar already.

returns NULL on failure.

### Prototype
```c
struct aws_string *aws_string_convert_from_wchar_c_str( struct aws_allocator *allocator, const wchar_t *to_convert);
```
"""
function aws_string_convert_from_wchar_c_str(allocator, to_convert)
    ccall((:aws_string_convert_from_wchar_c_str, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{Cwchar_t}), allocator, to_convert)
end

"""
    aws_wstring_new_from_cursor(allocator, w_str_cur)

Create a new wide string from a byte cursor. This assumes that w\\_str\\_cur is already in utf-16.

returns NULL on failure.

### Prototype
```c
struct aws_wstring *aws_wstring_new_from_cursor( struct aws_allocator *allocator, const struct aws_byte_cursor *w_str_cur);
```
"""
function aws_wstring_new_from_cursor(allocator, w_str_cur)
    ccall((:aws_wstring_new_from_cursor, libaws_c_common), Ptr{aws_wstring}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, w_str_cur)
end

"""
    aws_wstring_new_from_array(allocator, w_str, length)

Create a new wide string from a utf-16 string enclosing array. The length field is in number of characters not counting the null terminator.

returns NULL on failure.

### Prototype
```c
struct aws_wstring *aws_wstring_new_from_array( struct aws_allocator *allocator, const wchar_t *w_str, size_t length);
```
"""
function aws_wstring_new_from_array(allocator, w_str, length)
    ccall((:aws_wstring_new_from_array, libaws_c_common), Ptr{aws_wstring}, (Ptr{aws_allocator}, Ptr{Cwchar_t}, Csize_t), allocator, w_str, length)
end

"""
    aws_wstring_c_str(str)

Returns a wchar\\_t * pointer for use with windows OS interop.

### Prototype
```c
const wchar_t *aws_wstring_c_str(const struct aws_wstring *str);
```
"""
function aws_wstring_c_str(str)
    ccall((:aws_wstring_c_str, libaws_c_common), Ptr{Cwchar_t}, (Ptr{aws_wstring},), str)
end

"""
    aws_wstring_num_chars(str)

Returns the number of characters in the wchar string. NOTE: This is not the length in bytes or the buffer size.

### Prototype
```c
size_t aws_wstring_num_chars(const struct aws_wstring *str);
```
"""
function aws_wstring_num_chars(str)
    ccall((:aws_wstring_num_chars, libaws_c_common), Csize_t, (Ptr{aws_wstring},), str)
end

"""
    aws_wstring_size_bytes(str)

Returns the length in bytes for the buffer.

### Prototype
```c
size_t aws_wstring_size_bytes(const struct aws_wstring *str);
```
"""
function aws_wstring_size_bytes(str)
    ccall((:aws_wstring_size_bytes, libaws_c_common), Csize_t, (Ptr{aws_wstring},), str)
end

"""
    aws_wstring_is_valid(str)

Verifies that str is a valid string. Returns true if it's valid and false otherwise.

### Prototype
```c
bool aws_wstring_is_valid(const struct aws_wstring *str);
```
"""
function aws_wstring_is_valid(str)
    ccall((:aws_wstring_is_valid, libaws_c_common), Bool, (Ptr{aws_wstring},), str)
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
    ccall((:aws_string_eq, libaws_c_common), Bool, (Ptr{aws_string}, Ptr{aws_string}), a, b)
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
    ccall((:aws_string_eq_ignore_case, libaws_c_common), Bool, (Ptr{aws_string}, Ptr{aws_string}), a, b)
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
    ccall((:aws_string_eq_byte_cursor, libaws_c_common), Bool, (Ptr{aws_string}, Ptr{aws_byte_cursor}), str, cur)
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
    ccall((:aws_string_eq_byte_cursor_ignore_case, libaws_c_common), Bool, (Ptr{aws_string}, Ptr{aws_byte_cursor}), str, cur)
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
    ccall((:aws_string_eq_byte_buf, libaws_c_common), Bool, (Ptr{aws_string}, Ptr{aws_byte_buf}), str, buf)
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
    ccall((:aws_string_eq_byte_buf_ignore_case, libaws_c_common), Bool, (Ptr{aws_string}, Ptr{aws_byte_buf}), str, buf)
end

"""
    aws_string_eq_c_str(str, c_str)

### Prototype
```c
bool aws_string_eq_c_str(const struct aws_string *str, const char *c_str);
```
"""
function aws_string_eq_c_str(str, c_str)
    ccall((:aws_string_eq_c_str, libaws_c_common), Bool, (Ptr{aws_string}, Ptr{Cchar}), str, c_str)
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
    ccall((:aws_string_eq_c_str_ignore_case, libaws_c_common), Bool, (Ptr{aws_string}, Ptr{Cchar}), str, c_str)
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
    ccall((:aws_string_new_from_c_str, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{Cchar}), allocator, c_str)
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
    ccall((:aws_string_new_from_array, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{UInt8}, Csize_t), allocator, bytes, len)
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
    ccall((:aws_string_new_from_string, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, str)
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
    ccall((:aws_string_new_from_cursor, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_cursor}), allocator, cursor)
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
    ccall((:aws_string_new_from_buf, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_byte_buf}), allocator, buf)
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
    ccall((:aws_string_destroy, libaws_c_common), Cvoid, (Ptr{aws_string},), str)
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
    ccall((:aws_string_destroy_secure, libaws_c_common), Cvoid, (Ptr{aws_string},), str)
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
    ccall((:aws_string_compare, libaws_c_common), Cint, (Ptr{aws_string}, Ptr{aws_string}), a, b)
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
    ccall((:aws_array_list_comparator_string, libaws_c_common), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
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
    ccall((:aws_byte_buf_write_from_whole_string, libaws_c_common), Bool, (Ptr{aws_byte_buf}, Ptr{aws_string}), buf, src)
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
    ccall((:aws_byte_cursor_from_string, libaws_c_common), aws_byte_cursor, (Ptr{aws_string},), src)
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
    ccall((:aws_string_clone_or_reuse, libaws_c_common), Ptr{aws_string}, (Ptr{aws_allocator}, Ptr{aws_string}), allocator, str)
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
    ccall((:aws_secure_strlen, libaws_c_common), Cint, (Ptr{Cchar}, Csize_t, Ptr{Csize_t}), str, max_read_len, str_len)
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
    ccall((:aws_system_environment_load, libaws_c_common), Ptr{aws_system_environment}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_system_environment_acquire(env)

### Prototype
```c
struct aws_system_environment *aws_system_environment_acquire(struct aws_system_environment *env);
```
"""
function aws_system_environment_acquire(env)
    ccall((:aws_system_environment_acquire, libaws_c_common), Ptr{aws_system_environment}, (Ptr{aws_system_environment},), env)
end

"""
    aws_system_environment_release(env)

### Prototype
```c
void aws_system_environment_release(struct aws_system_environment *env);
```
"""
function aws_system_environment_release(env)
    ccall((:aws_system_environment_release, libaws_c_common), Cvoid, (Ptr{aws_system_environment},), env)
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
    ccall((:aws_system_environment_get_virtualization_vendor, libaws_c_common), aws_byte_cursor, (Ptr{aws_system_environment},), env)
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
    ccall((:aws_system_environment_get_virtualization_product_name, libaws_c_common), aws_byte_cursor, (Ptr{aws_system_environment},), env)
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
    ccall((:aws_system_environment_get_processor_count, libaws_c_common), Csize_t, (Ptr{aws_system_environment},), env)
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
    ccall((:aws_system_environment_get_cpu_group_count, libaws_c_common), Csize_t, (Ptr{aws_system_environment},), env)
end

"""
    aws_get_platform_build_os()

### Prototype
```c
enum aws_platform_os aws_get_platform_build_os(void);
```
"""
function aws_get_platform_build_os()
    ccall((:aws_get_platform_build_os, libaws_c_common), aws_platform_os, ())
end

"""
    aws_system_info_processor_count()

### Prototype
```c
size_t aws_system_info_processor_count(void);
```
"""
function aws_system_info_processor_count()
    ccall((:aws_system_info_processor_count, libaws_c_common), Csize_t, ())
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
    ccall((:aws_get_cpu_group_count, libaws_c_common), UInt16, ())
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
    ccall((:aws_get_cpu_count_for_group, libaws_c_common), Csize_t, (UInt16,), group_idx)
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
    ccall((:aws_get_cpu_ids_for_group, libaws_c_common), Cvoid, (UInt16, Ptr{aws_cpu_info}, Csize_t), group_idx, cpu_ids_array, cpu_ids_array_length)
end

"""
    aws_is_debugger_present()

### Prototype
```c
bool aws_is_debugger_present(void);
```
"""
function aws_is_debugger_present()
    ccall((:aws_is_debugger_present, libaws_c_common), Bool, ())
end

"""
    aws_debug_break()

### Prototype
```c
void aws_debug_break(void);
```
"""
function aws_debug_break()
    ccall((:aws_debug_break, libaws_c_common), Cvoid, ())
end

"""
    aws_backtrace(stack_frames, num_frames)

### Prototype
```c
size_t aws_backtrace(void **stack_frames, size_t num_frames);
```
"""
function aws_backtrace(stack_frames, num_frames)
    ccall((:aws_backtrace, libaws_c_common), Csize_t, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, num_frames)
end

"""
    aws_backtrace_symbols(stack_frames, stack_depth)

### Prototype
```c
char **aws_backtrace_symbols(void *const *stack_frames, size_t stack_depth);
```
"""
function aws_backtrace_symbols(stack_frames, stack_depth)
    ccall((:aws_backtrace_symbols, libaws_c_common), Ptr{Ptr{Cchar}}, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, stack_depth)
end

"""
    aws_backtrace_addr2line(stack_frames, stack_depth)

### Prototype
```c
char **aws_backtrace_addr2line(void *const *stack_frames, size_t stack_depth);
```
"""
function aws_backtrace_addr2line(stack_frames, stack_depth)
    ccall((:aws_backtrace_addr2line, libaws_c_common), Ptr{Ptr{Cchar}}, (Ptr{Ptr{Cvoid}}, Csize_t), stack_frames, stack_depth)
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
    ccall((:aws_backtrace_print, libaws_c_common), Cvoid, (Ptr{Libc.FILE}, Ptr{Cvoid}), fp, call_site_data)
end

"""
    aws_backtrace_log(log_level)

### Prototype
```c
void aws_backtrace_log(int log_level);
```
"""
function aws_backtrace_log(log_level)
    ccall((:aws_backtrace_log, libaws_c_common), Cvoid, (Cint,), log_level)
end

struct aws_memory_usage_stats
    maxrss::Csize_t
    page_faults::Csize_t
    _reserved::NTuple{8, Csize_t}
end

"""
    aws_init_memory_usage_for_current_process(memory_usage)

### Prototype
```c
int aws_init_memory_usage_for_current_process(struct aws_memory_usage_stats *memory_usage);
```
"""
function aws_init_memory_usage_for_current_process(memory_usage)
    ccall((:aws_init_memory_usage_for_current_process, libaws_c_common), Cint, (Ptr{aws_memory_usage_stats},), memory_usage)
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

struct __JL_Ctag_479
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_479}, f::Symbol)
    f === :scheduled && return Ptr{Bool}(x + 0)
    f === :reserved && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_479, f::Symbol)
    r = Ref{__JL_Ctag_479}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_479}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_479}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_task
    data::NTuple{64, UInt8}
end

function Base.getproperty(x::Ptr{aws_task}, f::Symbol)
    f === :fn && return Ptr{Ptr{aws_task_fn}}(x + 0)
    f === :arg && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :timestamp && return Ptr{UInt64}(x + 16)
    f === :node && return Ptr{aws_linked_list_node}(x + 24)
    f === :priority_queue_node && return Ptr{aws_priority_queue_node}(x + 40)
    f === :type_tag && return Ptr{Ptr{Cchar}}(x + 48)
    f === :abi_extension && return Ptr{__JL_Ctag_479}(x + 56)
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
    ccall((:aws_task_init, libaws_c_common), Cvoid, (Ptr{aws_task}, Ptr{aws_task_fn}, Ptr{Cvoid}, Ptr{Cchar}), task, fn, arg, type_tag)
end

"""
    aws_task_run(task, status)

### Prototype
```c
void aws_task_run(struct aws_task *task, enum aws_task_status status);
```
"""
function aws_task_run(task, status)
    ccall((:aws_task_run, libaws_c_common), Cvoid, (Ptr{aws_task}, aws_task_status), task, status)
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
    ccall((:aws_task_scheduler_init, libaws_c_common), Cint, (Ptr{aws_task_scheduler}, Ptr{aws_allocator}), scheduler, alloc)
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
    ccall((:aws_task_scheduler_clean_up, libaws_c_common), Cvoid, (Ptr{aws_task_scheduler},), scheduler)
end

"""
    aws_task_scheduler_is_valid(scheduler)

### Prototype
```c
bool aws_task_scheduler_is_valid(const struct aws_task_scheduler *scheduler);
```
"""
function aws_task_scheduler_is_valid(scheduler)
    ccall((:aws_task_scheduler_is_valid, libaws_c_common), Bool, (Ptr{aws_task_scheduler},), scheduler)
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
    ccall((:aws_task_scheduler_has_tasks, libaws_c_common), Bool, (Ptr{aws_task_scheduler}, Ptr{UInt64}), scheduler, next_task_time)
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
    ccall((:aws_task_scheduler_schedule_now, libaws_c_common), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}), scheduler, task)
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
    ccall((:aws_task_scheduler_schedule_future, libaws_c_common), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}, UInt64), scheduler, task, time_to_run)
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
    ccall((:aws_task_scheduler_cancel_task, libaws_c_common), Cvoid, (Ptr{aws_task_scheduler}, Ptr{aws_task}), scheduler, task)
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
    ccall((:aws_task_scheduler_run_all, libaws_c_common), Cvoid, (Ptr{aws_task_scheduler}, UInt64), scheduler, current_time)
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
    ccall((:aws_task_status_to_c_str, libaws_c_common), Ptr{Cchar}, (aws_task_status,), status)
end

@cenum aws_thread_detach_state::UInt32 begin
    AWS_THREAD_NOT_CREATED = 1
    AWS_THREAD_JOINABLE = 2
    AWS_THREAD_JOIN_COMPLETED = 3
    AWS_THREAD_MANAGED = 4
end

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

struct aws_thread_once
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{aws_thread_once}, f::Symbol)
    f === :ptr && return Ptr{Ptr{Cvoid}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::aws_thread_once, f::Symbol)
    r = Ref{aws_thread_once}(x)
    ptr = Base.unsafe_convert(Ptr{aws_thread_once}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_thread_once}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct aws_thread
    allocator::Ptr{aws_allocator}
    detach_state::aws_thread_detach_state
    thread_handle::Ptr{Cvoid}
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
    ccall((:aws_default_thread_options, libaws_c_common), Ptr{aws_thread_options}, ())
end

"""
    aws_thread_call_once(flag, call_once, user_data)

### Prototype
```c
void aws_thread_call_once(aws_thread_once *flag, void (*call_once)(void *), void *user_data);
```
"""
function aws_thread_call_once(flag, call_once, user_data)
    ccall((:aws_thread_call_once, libaws_c_common), Cvoid, (Ptr{aws_thread_once}, Ptr{Cvoid}, Ptr{Cvoid}), flag, call_once, user_data)
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
    ccall((:aws_thread_init, libaws_c_common), Cint, (Ptr{aws_thread}, Ptr{aws_allocator}), thread, allocator)
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
    ccall((:aws_thread_launch, libaws_c_common), Cint, (Ptr{aws_thread}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{aws_thread_options}), thread, func, arg, options)
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
    ccall((:aws_thread_get_id, libaws_c_common), aws_thread_id_t, (Ptr{aws_thread},), thread)
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
    ccall((:aws_thread_get_detach_state, libaws_c_common), aws_thread_detach_state, (Ptr{aws_thread},), thread)
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
    ccall((:aws_thread_join, libaws_c_common), Cint, (Ptr{aws_thread},), thread)
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
    ccall((:aws_thread_join_all_managed, libaws_c_common), Cint, ())
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
    ccall((:aws_thread_set_managed_join_timeout_ns, libaws_c_common), Cvoid, (UInt64,), timeout_in_ns)
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
    ccall((:aws_thread_clean_up, libaws_c_common), Cvoid, (Ptr{aws_thread},), thread)
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
    ccall((:aws_thread_current_thread_id, libaws_c_common), aws_thread_id_t, ())
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
    ccall((:aws_thread_thread_id_equal, libaws_c_common), Bool, (aws_thread_id_t, aws_thread_id_t), t1, t2)
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
    ccall((:aws_thread_current_sleep, libaws_c_common), Cvoid, (UInt64,), nanos)
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
    ccall((:aws_thread_current_at_exit, libaws_c_common), Cint, (Ptr{aws_thread_atexit_fn}, Ptr{Cvoid}), callback, user_data)
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
    ccall((:aws_thread_increment_unjoined_count, libaws_c_common), Cvoid, ())
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
    ccall((:aws_thread_decrement_unjoined_count, libaws_c_common), Cvoid, ())
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
    ccall((:aws_thread_current_name, libaws_c_common), Cint, (Ptr{aws_allocator}, Ptr{Ptr{aws_string}}), allocator, out_name)
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
    ccall((:aws_thread_name, libaws_c_common), Cint, (Ptr{aws_allocator}, aws_thread_id_t, Ptr{Ptr{aws_string}}), allocator, thread_id, out_name)
end

mutable struct aws_thread_scheduler end

"""
    aws_thread_scheduler_new(allocator, thread_options)

Creates a new instance of a thread scheduler. This object receives scheduled tasks and executes them inside a background thread. On success, this function returns an instance with a ref-count of 1. On failure it returns NULL.

thread\\_options are optional.

The semantics of this interface conform to the semantics of [`aws_task_scheduler`](@ref).

### Prototype
```c
struct aws_thread_scheduler *aws_thread_scheduler_new( struct aws_allocator *allocator, const struct aws_thread_options *thread_options);
```
"""
function aws_thread_scheduler_new(allocator, thread_options)
    ccall((:aws_thread_scheduler_new, libaws_c_common), Ptr{aws_thread_scheduler}, (Ptr{aws_allocator}, Ptr{aws_thread_options}), allocator, thread_options)
end

"""
    aws_thread_scheduler_acquire(scheduler)

Acquire a reference to the scheduler.

### Prototype
```c
void aws_thread_scheduler_acquire(struct aws_thread_scheduler *scheduler);
```
"""
function aws_thread_scheduler_acquire(scheduler)
    ccall((:aws_thread_scheduler_acquire, libaws_c_common), Cvoid, (Ptr{aws_thread_scheduler},), scheduler)
end

"""
    aws_thread_scheduler_release(scheduler)

Release a reference to the scheduler.

### Prototype
```c
void aws_thread_scheduler_release(const struct aws_thread_scheduler *scheduler);
```
"""
function aws_thread_scheduler_release(scheduler)
    ccall((:aws_thread_scheduler_release, libaws_c_common), Cvoid, (Ptr{aws_thread_scheduler},), scheduler)
end

"""
    aws_thread_scheduler_schedule_future(scheduler, task, time_to_run)

Schedules a task to run in the future. time\\_to\\_run is the absolute time from the system hw\\_clock.

### Prototype
```c
void aws_thread_scheduler_schedule_future( struct aws_thread_scheduler *scheduler, struct aws_task *task, uint64_t time_to_run);
```
"""
function aws_thread_scheduler_schedule_future(scheduler, task, time_to_run)
    ccall((:aws_thread_scheduler_schedule_future, libaws_c_common), Cvoid, (Ptr{aws_thread_scheduler}, Ptr{aws_task}, UInt64), scheduler, task, time_to_run)
end

"""
    aws_thread_scheduler_schedule_now(scheduler, task)

Schedules a task to run as soon as possible.

### Prototype
```c
void aws_thread_scheduler_schedule_now(struct aws_thread_scheduler *scheduler, struct aws_task *task);
```
"""
function aws_thread_scheduler_schedule_now(scheduler, task)
    ccall((:aws_thread_scheduler_schedule_now, libaws_c_common), Cvoid, (Ptr{aws_thread_scheduler}, Ptr{aws_task}), scheduler, task)
end

"""
    aws_thread_scheduler_cancel_task(scheduler, task)

Cancel a task that has been scheduled. The cancellation callback will be invoked in the background thread. This function is slow, so please don't do it in the hot path for your code.

### Prototype
```c
void aws_thread_scheduler_cancel_task(struct aws_thread_scheduler *scheduler, struct aws_task *task);
```
"""
function aws_thread_scheduler_cancel_task(scheduler, task)
    ccall((:aws_thread_scheduler_cancel_task, libaws_c_common), Cvoid, (Ptr{aws_thread_scheduler}, Ptr{aws_task}), scheduler, task)
end

"""
    aws_timegm(t)

Cross platform friendly version of timegm

### Prototype
```c
time_t aws_timegm(struct tm *const t);
```
"""
function aws_timegm(t)
    ccall((:aws_timegm, libaws_c_common), time_t, (Ptr{tm},), t)
end

"""
    aws_localtime(time, t)

Cross platform friendly version of localtime\\_r

### Prototype
```c
void aws_localtime(time_t time, struct tm *t);
```
"""
function aws_localtime(time, t)
    ccall((:aws_localtime, libaws_c_common), Cvoid, (time_t, Ptr{tm}), time, t)
end

"""
    aws_gmtime(time, t)

Cross platform friendly version of gmtime\\_r

### Prototype
```c
void aws_gmtime(time_t time, struct tm *t);
```
"""
function aws_gmtime(time, t)
    ccall((:aws_gmtime, libaws_c_common), Cvoid, (time_t, Ptr{tm}), time, t)
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
    ccall((:aws_uri_init_parse, libaws_c_common), Cint, (Ptr{aws_uri}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}), uri, allocator, uri_str)
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
    ccall((:aws_uri_init_from_builder_options, libaws_c_common), Cint, (Ptr{aws_uri}, Ptr{aws_allocator}, Ptr{aws_uri_builder_options}), uri, allocator, options)
end

"""
    aws_uri_clean_up(uri)

### Prototype
```c
void aws_uri_clean_up(struct aws_uri *uri);
```
"""
function aws_uri_clean_up(uri)
    ccall((:aws_uri_clean_up, libaws_c_common), Cvoid, (Ptr{aws_uri},), uri)
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
    ccall((:aws_uri_scheme, libaws_c_common), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
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
    ccall((:aws_uri_authority, libaws_c_common), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
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
    ccall((:aws_uri_path, libaws_c_common), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
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
    ccall((:aws_uri_query_string, libaws_c_common), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
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
    ccall((:aws_uri_host_name, libaws_c_common), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
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
    ccall((:aws_uri_port, libaws_c_common), UInt32, (Ptr{aws_uri},), uri)
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
    ccall((:aws_uri_path_and_query, libaws_c_common), Ptr{aws_byte_cursor}, (Ptr{aws_uri},), uri)
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
    ccall((:aws_query_string_next_param, libaws_c_common), Bool, (aws_byte_cursor, Ptr{aws_uri_param}), query_string, param)
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
    ccall((:aws_query_string_params, libaws_c_common), Cint, (aws_byte_cursor, Ptr{aws_array_list}), query_string, out_params)
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
    ccall((:aws_uri_query_string_next_param, libaws_c_common), Bool, (Ptr{aws_uri}, Ptr{aws_uri_param}), uri, param)
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
    ccall((:aws_uri_query_string_params, libaws_c_common), Cint, (Ptr{aws_uri}, Ptr{aws_array_list}), uri, out_params)
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
    ccall((:aws_byte_buf_append_encoding_uri_path, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
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
    ccall((:aws_byte_buf_append_encoding_uri_param, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
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
    ccall((:aws_byte_buf_append_decoding_uri, libaws_c_common), Cint, (Ptr{aws_byte_buf}, Ptr{aws_byte_cursor}), buffer, cursor)
end

struct aws_uuid
    uuid_data::NTuple{16, UInt8}
end

@cenum __JL_Ctag_344::UInt32 begin
    AWS_UUID_STR_LEN = 37
end

"""
    aws_uuid_init(uuid)

### Prototype
```c
int aws_uuid_init(struct aws_uuid *uuid);
```
"""
function aws_uuid_init(uuid)
    ccall((:aws_uuid_init, libaws_c_common), Cint, (Ptr{aws_uuid},), uuid)
end

"""
    aws_uuid_init_from_str(uuid, uuid_str)

### Prototype
```c
int aws_uuid_init_from_str(struct aws_uuid *uuid, const struct aws_byte_cursor *uuid_str);
```
"""
function aws_uuid_init_from_str(uuid, uuid_str)
    ccall((:aws_uuid_init_from_str, libaws_c_common), Cint, (Ptr{aws_uuid}, Ptr{aws_byte_cursor}), uuid, uuid_str)
end

"""
    aws_uuid_to_str(uuid, output)

### Prototype
```c
int aws_uuid_to_str(const struct aws_uuid *uuid, struct aws_byte_buf *output);
```
"""
function aws_uuid_to_str(uuid, output)
    ccall((:aws_uuid_to_str, libaws_c_common), Cint, (Ptr{aws_uuid}, Ptr{aws_byte_buf}), uuid, output)
end

"""
    aws_uuid_equals(a, b)

### Prototype
```c
bool aws_uuid_equals(const struct aws_uuid *a, const struct aws_uuid *b);
```
"""
function aws_uuid_equals(a, b)
    ccall((:aws_uuid_equals, libaws_c_common), Bool, (Ptr{aws_uuid}, Ptr{aws_uuid}), a, b)
end

mutable struct aws_xml_node end

struct aws_xml_attribute
    name::aws_byte_cursor
    value::aws_byte_cursor
end

# typedef int ( aws_xml_parser_on_node_encountered_fn ) ( struct aws_xml_node * node , void * user_data )
"""
Callback for when an xml node is encountered in the document. As a user you have a few options:

1. fail the parse by returning [`AWS_OP_ERR`](@ref) (after an error has been raised). This will stop any further parsing. 2. call [`aws_xml_node_traverse`](@ref)() on the node to descend into the node with a new callback and user\\_data. 3. call [`aws_xml_node_as_body`](@ref)() to retrieve the contents of the node as text.

You MUST NOT call both [`aws_xml_node_traverse`](@ref)() and [`aws_xml_node_as_body`](@ref)() on the same node.

return true to continue the parsing operation.
"""
const aws_xml_parser_on_node_encountered_fn = Cvoid

struct aws_xml_parser_options
    doc::aws_byte_cursor
    max_depth::Csize_t
    on_root_encountered::Ptr{aws_xml_parser_on_node_encountered_fn}
    user_data::Ptr{Cvoid}
end

"""
    aws_xml_parse(allocator, options)

Parse an XML document. WARNING: This is not a public API. It is only intended for use within the aws-c libraries.

### Prototype
```c
int aws_xml_parse(struct aws_allocator *allocator, const struct aws_xml_parser_options *options);
```
"""
function aws_xml_parse(allocator, options)
    ccall((:aws_xml_parse, libaws_c_common), Cint, (Ptr{aws_allocator}, Ptr{aws_xml_parser_options}), allocator, options)
end

"""
    aws_xml_node_as_body(node, out_body)

Writes the contents of the body of node into out\\_body. out\\_body is an output parameter in this case. Upon success, out\\_body will contain the body of the node.

### Prototype
```c
int aws_xml_node_as_body(struct aws_xml_node *node, struct aws_byte_cursor *out_body);
```
"""
function aws_xml_node_as_body(node, out_body)
    ccall((:aws_xml_node_as_body, libaws_c_common), Cint, (Ptr{aws_xml_node}, Ptr{aws_byte_cursor}), node, out_body)
end

"""
    aws_xml_node_traverse(node, on_node_encountered, user_data)

Traverse node and invoke on\\_node\\_encountered when a nested node is encountered.

### Prototype
```c
int aws_xml_node_traverse( struct aws_xml_node *node, aws_xml_parser_on_node_encountered_fn *on_node_encountered, void *user_data);
```
"""
function aws_xml_node_traverse(node, on_node_encountered, user_data)
    ccall((:aws_xml_node_traverse, libaws_c_common), Cint, (Ptr{aws_xml_node}, Ptr{aws_xml_parser_on_node_encountered_fn}, Ptr{Cvoid}), node, on_node_encountered, user_data)
end

"""
    aws_xml_node_get_name(node)

### Prototype
```c
struct aws_byte_cursor aws_xml_node_get_name(const struct aws_xml_node *node);
```
"""
function aws_xml_node_get_name(node)
    ccall((:aws_xml_node_get_name, libaws_c_common), aws_byte_cursor, (Ptr{aws_xml_node},), node)
end

"""
    aws_xml_node_get_num_attributes(node)

### Prototype
```c
size_t aws_xml_node_get_num_attributes(const struct aws_xml_node *node);
```
"""
function aws_xml_node_get_num_attributes(node)
    ccall((:aws_xml_node_get_num_attributes, libaws_c_common), Csize_t, (Ptr{aws_xml_node},), node)
end

"""
    aws_xml_node_get_attribute(node, attribute_index)

### Prototype
```c
struct aws_xml_attribute aws_xml_node_get_attribute(const struct aws_xml_node *node, size_t attribute_index);
```
"""
function aws_xml_node_get_attribute(node, attribute_index)
    ccall((:aws_xml_node_get_attribute, libaws_c_common), aws_xml_attribute, (Ptr{aws_xml_node}, Csize_t), node, attribute_index)
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
    ccall((:aws_secure_zero, libaws_c_common), Cvoid, (Ptr{Cvoid}, Csize_t), pBuf, bufsize)
end

"""
    __itt_collection_scope

` __itt_collection_scope`

Enumerator for collection scopes
"""
@cenum __itt_collection_scope::UInt32 begin
    __itt_collection_scope_host = 1
    __itt_collection_scope_offload = 2
    __itt_collection_scope_all = 2147483647
end

"""
    __itt_suppress_mode

` __itt_suppress_mode`

Enumerator for the suppressing modes
"""
@cenum __itt_suppress_mode::UInt32 begin
    __itt_unsuppress_range = 0
    __itt_suppress_range = 1
end

"""
    __itt_collection_state

` __itt_collection_state`

Enumerator for collection state.
"""
@cenum __itt_collection_state::UInt32 begin
    __itt_collection_uninitialized = 0
    __itt_collection_init_fail = 1
    __itt_collection_collector_absent = 2
    __itt_collection_collector_exists = 3
    __itt_collection_init_successful = 4
end

"""
    __itt_model_disable

` __itt_model_disable`

Enumerator for the disable methods
"""
@cenum __itt_model_disable::UInt32 begin
    __itt_model_disable_observation = 0
    __itt_model_disable_collection = 1
end

"""
    __itt_scope

Describes the scope of an event object in the trace.
"""
@cenum __itt_scope::UInt32 begin
    __itt_scope_unknown = 0
    __itt_scope_global = 1
    __itt_scope_track_group = 2
    __itt_scope_track = 3
    __itt_scope_task = 4
    __itt_scope_marker = 5
end

"""
    __itt_metadata_type

` parameters`

describes the type of metadata
"""
@cenum __itt_metadata_type::UInt32 begin
    __itt_metadata_unknown = 0
    __itt_metadata_u64 = 1
    __itt_metadata_s64 = 2
    __itt_metadata_u32 = 3
    __itt_metadata_s32 = 4
    __itt_metadata_u16 = 5
    __itt_metadata_s16 = 6
    __itt_metadata_float = 7
    __itt_metadata_double = 8
end

"""
    __itt_relation

` relations`

The kind of relation between two instances is specified by the enumerated type [`__itt_relation`](@ref). Relations between instances can be added with an API call. The relation API uses instance IDs. Relations can be added before or after the actual instances are created and persist independently of the instances. This is the motivation for having different lifetimes for instance IDs and the actual instances.
"""
@cenum __itt_relation::UInt32 begin
    __itt_relation_is_unknown = 0
    __itt_relation_is_dependent_on = 1
    __itt_relation_is_sibling_of = 2
    __itt_relation_is_parent_of = 3
    __itt_relation_is_continuation_of = 4
    __itt_relation_is_child_of = 5
    __itt_relation_is_continued_by = 6
    __itt_relation_is_predecessor_to = 7
end

"""
    ___itt_track_group_type

` exclude_from_documentation `
"""
@cenum ___itt_track_group_type::UInt32 begin
    __itt_track_group_type_normal = 0
end

"""
    ___itt_track_type

Placeholder for custom track types. Currently, "normal" custom track is the only available track type.
"""
@cenum ___itt_track_type::UInt32 begin
    __itt_track_type_normal = 0
end

"""
    __itt_av_data_type

` __itt_av_data_type`

Defines types of arrays data (for C/C++ intrinsic types)
"""
@cenum __itt_av_data_type::UInt32 begin
    __itt_e_first = 0
    __itt_e_char = 0
    __itt_e_uchar = 1
    __itt_e_int16 = 2
    __itt_e_uint16 = 3
    __itt_e_int32 = 4
    __itt_e_uint32 = 5
    __itt_e_int64 = 6
    __itt_e_uint64 = 7
    __itt_e_float = 8
    __itt_e_double = 9
    __itt_e_last = 9
end

"""
    __itt_module_type

` exclude_from_documentation `
"""
@cenum __itt_module_type::UInt32 begin
    __itt_module_type_unknown = 0
    __itt_module_type_elf = 1
    __itt_module_type_coff = 2
end

"""
    __itt_section_type

` exclude_from_documentation `
"""
@cenum __itt_section_type::UInt32 begin
    itt_section_type_unknown = 0
    itt_section_type_bss = 1
    itt_section_type_data = 2
    itt_section_type_text = 3
end

"""
    __itt_context_type

describes the type of context metadata
"""
@cenum __itt_context_type::UInt32 begin
    __itt_context_unknown = 0
    __itt_context_nameA = 1
    __itt_context_nameW = 2
    __itt_context_deviceA = 3
    __itt_context_deviceW = 4
    __itt_context_unitsA = 5
    __itt_context_unitsW = 6
    __itt_context_pci_addrA = 7
    __itt_context_pci_addrW = 8
    __itt_context_tid = 9
    __itt_context_max_val = 10
    __itt_context_bandwidth_flag = 11
    __itt_context_latency_flag = 12
    __itt_context_occupancy_flag = 13
    __itt_context_on_thread_flag = 14
    __itt_context_is_abs_val_flag = 15
    __itt_context_cpu_instructions_flag = 16
    __itt_context_cpu_cycles_flag = 17
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
    ccall((:s_aws_run_test_case, libaws_c_common), Cint, (Ptr{aws_test_harness},), harness)
end

"""
    s_test_print_stack_trace(exception_pointers)

### Prototype
```c
static LONG WINAPI s_test_print_stack_trace(struct _EXCEPTION_POINTERS *exception_pointers);
```
"""
function s_test_print_stack_trace(exception_pointers)
    ccall((:s_test_print_stack_trace, libaws_c_common), LONG, (Ptr{Cvoid},), exception_pointers)
end

"""
    enable_vt_mode()

### Prototype
```c
static inline int enable_vt_mode(void);
```
"""
function enable_vt_mode()
    ccall((:enable_vt_mode, libaws_c_common), Cint, ())
end

const AWS_OP_SUCCESS = 0

# Skipping MacroDefinition: AWS_CONDITION_VARIABLE_INIT { . condition_handle = NULL , . initialized = true }

const AWS_OP_ERR = -1

const AWS_ERROR_ENUM_STRIDE_BITS = 10

const AWS_ERROR_ENUM_STRIDE = Cuint(1) << AWS_ERROR_ENUM_STRIDE_BITS

# Skipping MacroDefinition: AWS_STATIC_IMPL static inline

const AWS_PATH_DELIM = Cchar('\\')

const AWS_PATH_DELIM_STR = "\\"

const AWS_LOG_LEVEL_NONE = 0

const AWS_LOG_LEVEL_FATAL = 1

const AWS_LOG_LEVEL_ERROR = 2

const AWS_LOG_LEVEL_WARN = 3

const AWS_LOG_LEVEL_INFO = 4

const AWS_LOG_LEVEL_DEBUG = 5

const AWS_LOG_LEVEL_TRACE = 6

const AWS_LOG_SUBJECT_STRIDE = Cuint(1) << AWS_LOG_SUBJECT_STRIDE_BITS

const PRInSTR = "%.*s"

# Skipping MacroDefinition: AWS_FORCE_INLINE __attribute__ ( ( always_inline ) )

# Skipping MacroDefinition: AWS_NO_INLINE __attribute__ ( ( noinline ) )

# Skipping MacroDefinition: AWS_ATTRIBUTE_NORETURN __attribute__ ( ( noreturn ) )

const SIZE_BITS = 64

# Skipping MacroDefinition: AWS_MUTEX_INIT { . mutex_handle = NULL , . initialized = true }

const AWS_PACKAGE_SLOTS = 16

const AWS_C_COMMON_PACKAGE_ID = 0

# Skipping MacroDefinition: AWS_RW_LOCK_INIT { . lock_handle = NULL }

const AWS_CRT_STATISTICS_CATEGORY_STRIDE = Cuint(1) << AWS_CRT_STATISTICS_CATEGORY_STRIDE_BITS

const AWS_THREAD_NAME_RECOMMENDED_STRLEN = 15

# Skipping MacroDefinition: AWS_THREAD_ID_T_REPR_BUFSZ ( sizeof ( aws_thread_id_t ) * 2 + 1 )

# Skipping MacroDefinition: ITTAPI_CDECL __cdecl

# Skipping MacroDefinition: ITT_INLINE static __inline__ __attribute__ ( ( __always_inline__ , __gnu_inline__ ) )

const AWS_OP_SKIP = -2

const AWS_TESTING_REPORT_FD = stderr

const FAIL_PREFIX = "***FAILURE*** "

const SUCCESS = 0

const FAILURE = -1

const SKIP = 103

