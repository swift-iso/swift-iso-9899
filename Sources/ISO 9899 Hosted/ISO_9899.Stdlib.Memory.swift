public import ISO_9899_Stdlib_Shims

extension ISO_9899.Stdlib {

    public enum Memory {}
}

extension ISO_9899.Stdlib.Memory {

    @inline(always)
    public static func allocate(
        count: Int
    ) throws(ISO_9899.Errno.Require.Error) -> UnsafeMutableRawPointer {
        try unsafe ISO_9899.Errno.Require.rawPointer {
            unsafe iso9899_malloc(count)
        }
    }

    @inline(always)
    public static func allocateZeroed(
        count: Int,
        size: Int
    ) throws(ISO_9899.Errno.Require.Error) -> UnsafeMutableRawPointer {
        try unsafe ISO_9899.Errno.Require.rawPointer {
            unsafe iso9899_calloc(count, size)
        }
    }

    @inline(always)
    public static func reallocate(
        _ pointer: UnsafeMutableRawPointer?,
        count: Int
    ) throws(ISO_9899.Errno.Require.Error) -> UnsafeMutableRawPointer {
        try unsafe ISO_9899.Errno.Require.rawPointer {
            unsafe iso9899_realloc(pointer, count)
        }
    }

    @inline(always)
    public static func allocateAligned(
        alignment: Int,
        size: Int
    ) throws(ISO_9899.Errno.Require.Error) -> UnsafeMutableRawPointer {
        try unsafe ISO_9899.Errno.Require.rawPointer {
            unsafe iso9899_aligned_alloc(alignment, size)
        }
    }

    @inline(always)
    public static func deallocate(_ pointer: UnsafeMutableRawPointer?) {
        unsafe iso9899_free(pointer)
    }
}
