// ISO_9899.Stdlib.Memory.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.22.3 - Memory management functions

public import CISO9899Stdlib

extension ISO_9899.Stdlib {
    /// Memory allocation functions.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.3
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let ptr = try C.Stdlib.Memory.allocate(count: 100)
    /// defer { C.Stdlib.Memory.deallocate(ptr) }
    /// ```
    ///
    /// ## Note
    ///
    /// Prefer Swift's built-in allocation when possible. These functions
    /// are provided for C interoperability.
    public enum Memory {}
}

extension ISO_9899.Stdlib.Memory {
    /// Allocates memory.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.3.4 — The `malloc` function
    ///
    /// Allocates space for an object whose size is specified by `count`.
    /// The allocated memory is not initialized.
    ///
    /// - Parameter count: Number of bytes to allocate.
    /// - Returns: Pointer to the allocated memory.
    /// - Throws: `ISO_9899.Errno.Code` if allocation fails.
    @inline(always)
    public static func allocate(
        count: Int
    ) throws(ISO_9899.Errno.Code) -> UnsafeMutableRawPointer {
        try unsafe ISO_9899.Errno.Require.pointer {
            unsafe iso9899_malloc(count)
        }
    }

    /// Allocates zero-initialized memory for an array.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.3.2 — The `calloc` function
    ///
    /// Allocates space for an array of `count` objects, each of size `size`.
    /// The allocated memory is initialized to zero.
    ///
    /// - Parameters:
    ///   - count: Number of elements.
    ///   - size: Size of each element in bytes.
    /// - Returns: Pointer to the allocated memory.
    /// - Throws: `ISO_9899.Errno.Code` if allocation fails.
    @inline(always)
    public static func allocateZeroed(
        count: Int,
        size: Int
    ) throws(ISO_9899.Errno.Code) -> UnsafeMutableRawPointer {
        try unsafe ISO_9899.Errno.Require.pointer {
            unsafe iso9899_calloc(count, size)
        }
    }

    /// Reallocates memory.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.3.5 — The `realloc` function
    ///
    /// Changes the size of the memory block pointed to by `pointer` to `count` bytes.
    /// The contents are preserved up to the minimum of old and new sizes.
    ///
    /// - Parameters:
    ///   - pointer: Pointer to previously allocated memory, or NULL.
    ///   - count: New size in bytes.
    /// - Returns: Pointer to the reallocated memory.
    /// - Throws: `ISO_9899.Errno.Code` if reallocation fails.
    ///
    /// - Note: If reallocation fails, the original memory is not freed.
    @inline(always)
    public static func reallocate(
        _ pointer: UnsafeMutableRawPointer?,
        count: Int
    ) throws(ISO_9899.Errno.Code) -> UnsafeMutableRawPointer {
        try unsafe ISO_9899.Errno.Require.pointer {
            unsafe iso9899_realloc(pointer, count)
        }
    }

    /// Allocates aligned memory.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.3.1 — The `aligned_alloc` function
    ///
    /// Allocates space for an object whose alignment is specified by `alignment`,
    /// whose size is specified by `size`, and whose value is indeterminate.
    ///
    /// - Parameters:
    ///   - alignment: Alignment requirement (must be a power of 2).
    ///   - size: Size in bytes (must be a multiple of alignment).
    /// - Returns: Pointer to the allocated memory.
    /// - Throws: `ISO_9899.Errno.Code` if allocation fails.
    @inline(always)
    public static func allocateAligned(
        alignment: Int,
        size: Int
    ) throws(ISO_9899.Errno.Code) -> UnsafeMutableRawPointer {
        try unsafe ISO_9899.Errno.Require.pointer {
            unsafe iso9899_aligned_alloc(alignment, size)
        }
    }

    /// Deallocates memory.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.3.3 — The `free` function
    ///
    /// Causes the space pointed to by `pointer` to be deallocated.
    /// If `pointer` is NULL, no operation is performed.
    ///
    /// - Parameter pointer: Pointer to memory to deallocate, or NULL.
    @inline(always)
    public static func deallocate(_ pointer: UnsafeMutableRawPointer?) {
        unsafe iso9899_free(pointer)
    }
}
