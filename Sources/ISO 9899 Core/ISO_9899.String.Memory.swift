// ISO_9899.String.Memory.swift
// swift-iso-9899
//
// Memory functions (ISO/IEC 9899:2018 Section 7.24.2, 7.24.4, 7.24.5, 7.24.6)

internal import CISO9899String

extension ISO_9899.String {
    /// Memory operations from `<string.h>`
    ///
    /// Low-level memory manipulation functions for copying, moving, filling,
    /// and comparing raw bytes.
    ///
    /// ## Performance
    ///
    /// These functions delegate directly to the platform's optimized C library
    /// implementations, which typically use SIMD instructions internally.
    ///
    /// ## Safety
    ///
    /// These are unsafe operations that work with raw pointers. Callers are
    /// responsible for ensuring:
    /// - Pointers are valid and properly aligned
    /// - Count does not exceed allocated memory
    /// - For `copy`: source and destination do not overlap
    ///
    /// ## See Also
    ///
    /// - ``copy(to:from:count:)``
    /// - ``move(to:from:count:)``
    /// - ``fill(_:with:count:)``
    /// - ``compare(_:_:count:)``
    /// - ``find(in:byte:count:)``
    public enum Memory {}
}

// MARK: - Copying Functions (Section 7.24.2)

extension ISO_9899.String.Memory {
    /// Copies bytes from source to destination (non-overlapping).
    ///
    /// ISO/IEC 9899:2018 Section 7.24.2.1 — The `memcpy` function
    ///
    /// Copies `count` bytes from the object pointed to by `source` to the object
    /// pointed to by `destination`. If the objects overlap, the behavior is undefined.
    ///
    /// - Parameters:
    ///   - destination: Pointer to the destination buffer.
    ///   - source: Pointer to the source buffer.
    ///   - count: Number of bytes to copy.
    ///
    /// - Precondition: Source and destination must not overlap.
    ///   Use ``move(to:from:count:)`` for overlapping regions.
    ///
    /// ## Example
    ///
    /// ```swift
    /// var dest = [UInt8](repeating: 0, count: 16)
    /// let src: [UInt8] = [1, 2, 3, 4, 5, 6, 7, 8]
    /// dest.withUnsafeMutableBytes { destBuf in
    ///     src.withUnsafeBytes { srcBuf in
    ///         ISO_9899.String.Memory.copy(
    ///             to: destBuf.baseAddress!,
    ///             from: srcBuf.baseAddress!,
    ///             count: src.count
    ///         )
    ///     }
    /// }
    /// ```
    @inline(__always)
    public static func copy(
        to destination: UnsafeMutableRawPointer,
        from source: UnsafeRawPointer,
        count: Int
    ) {
        _ = unsafe iso9899_memcpy(destination, source, count)
    }

    /// Copies bytes from source to destination (overlapping safe).
    ///
    /// ISO/IEC 9899:2018 Section 7.24.2.2 — The `memmove` function
    ///
    /// Copies `count` bytes from the object pointed to by `source` to the object
    /// pointed to by `destination`. Copying takes place as if the bytes are first
    /// copied to a temporary buffer, so overlapping is handled correctly.
    ///
    /// - Parameters:
    ///   - destination: Pointer to the destination buffer.
    ///   - source: Pointer to the source buffer.
    ///   - count: Number of bytes to copy.
    ///
    /// ## Example
    ///
    /// ```swift
    /// var buffer: [UInt8] = [1, 2, 3, 4, 5, 6, 7, 8]
    /// buffer.withUnsafeMutableBytes { buf in
    ///     // Safe even though source and dest overlap
    ///     ISO_9899.String.Memory.move(
    ///         to: buf.baseAddress!,
    ///         from: buf.baseAddress! + 2,
    ///         count: 4
    ///     )
    /// }
    /// ```
    @inline(__always)
    public static func move(
        to destination: UnsafeMutableRawPointer,
        from source: UnsafeRawPointer,
        count: Int
    ) {
        _ = unsafe iso9899_memmove(destination, source, count)
    }
}

// MARK: - Comparison Functions (Section 7.24.4)

extension ISO_9899.String.Memory {
    /// Compares bytes in two memory regions.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.4.1 — The `memcmp` function
    ///
    /// Compares the first `count` bytes of the objects pointed to by `lhs` and `rhs`.
    ///
    /// - Parameters:
    ///   - lhs: Pointer to the first memory region.
    ///   - rhs: Pointer to the second memory region.
    ///   - count: Number of bytes to compare.
    ///
    /// - Returns: An integer less than, equal to, or greater than zero if the first
    ///   `count` bytes of `lhs` is found to be less than, equal to, or greater than
    ///   the first `count` bytes of `rhs`, respectively.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let a: [UInt8] = [1, 2, 3, 4]
    /// let b: [UInt8] = [1, 2, 3, 5]
    /// let result = a.withUnsafeBytes { aBuf in
    ///     b.withUnsafeBytes { bBuf in
    ///         ISO_9899.String.Memory.compare(
    ///             aBuf.baseAddress!,
    ///             bBuf.baseAddress!,
    ///             count: 4
    ///         )
    ///     }
    /// }
    /// // result < 0 because a[3] (4) < b[3] (5)
    /// ```
    @inline(__always)
    public static func compare(
        _ lhs: UnsafeRawPointer,
        _ rhs: UnsafeRawPointer,
        count: Int
    ) -> Int {
        unsafe Int(iso9899_memcmp(lhs, rhs, count))
    }
}

// MARK: - Search Functions (Section 7.24.5)

extension ISO_9899.String.Memory {
    /// Searches for a byte value in a memory region.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.1 — The `memchr` function
    ///
    /// Locates the first occurrence of `byte` (converted to `unsigned char`) in the
    /// first `count` bytes of the object pointed to by `buffer`.
    ///
    /// - Parameters:
    ///   - buffer: Pointer to the memory region to search.
    ///   - byte: The byte value to search for.
    ///   - count: Number of bytes to search.
    ///
    /// - Returns: A pointer to the located byte, or `nil` if not found.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let data: [UInt8] = [1, 2, 3, 4, 5]
    /// let found = data.withUnsafeBytes { buf in
    ///     ISO_9899.String.Memory.find(
    ///         in: buf.baseAddress!,
    ///         byte: 3,
    ///         count: data.count
    ///     )
    /// }
    /// // found points to data[2]
    /// ```
    @inline(__always)
    public static func find(
        in buffer: UnsafeRawPointer,
        byte: UInt8,
        count: Int
    ) -> UnsafeRawPointer? {
        unsafe iso9899_memchr_const(buffer, Int32(byte), count)
    }

    /// Searches for a byte value in a memory region (mutable).
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.1 — The `memchr` function
    ///
    /// - Parameters:
    ///   - buffer: Mutable pointer to the memory region to search.
    ///   - byte: The byte value to search for.
    ///   - count: Number of bytes to search.
    ///
    /// - Returns: A mutable pointer to the located byte, or `nil` if not found.
    @inline(__always)
    public static func find(
        in buffer: UnsafeMutableRawPointer,
        byte: UInt8,
        count: Int
    ) -> UnsafeMutableRawPointer? {
        unsafe iso9899_memchr(buffer, Int32(byte), count)
    }
}

// MARK: - Miscellaneous Functions (Section 7.24.6)

extension ISO_9899.String.Memory {
    /// Fills a memory region with a byte value.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.6.1 — The `memset` function
    ///
    /// Copies the value of `byte` (converted to `unsigned char`) into each of the
    /// first `count` bytes of the object pointed to by `destination`.
    ///
    /// - Parameters:
    ///   - destination: Pointer to the memory region to fill.
    ///   - byte: The byte value to fill with.
    ///   - count: Number of bytes to fill.
    ///
    /// ## Example
    ///
    /// ```swift
    /// var buffer = [UInt8](repeating: 0xFF, count: 16)
    /// buffer.withUnsafeMutableBytes { buf in
    ///     ISO_9899.String.Memory.fill(
    ///         buf.baseAddress!,
    ///         with: 0,
    ///         count: buf.count
    ///     )
    /// }
    /// // buffer is now all zeros
    /// ```
    @inline(__always)
    public static func fill(
        _ destination: UnsafeMutableRawPointer,
        with byte: UInt8,
        count: Int
    ) {
        _ = unsafe iso9899_memset(destination, Int32(byte), count)
    }
}
