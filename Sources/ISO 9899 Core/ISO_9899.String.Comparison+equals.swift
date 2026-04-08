// ISO_9899.String.Comparison+equals.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.24.4 - Equality against compile-time literal

extension ISO_9899.String.Comparison {
    /// Checks whether a null-terminated string equals an ASCII literal.
    ///
    /// Performs a byte-by-byte comparison without allocating memory or
    /// constructing Swift strings. The comparison succeeds if and only if:
    /// - All bytes in the literal match the corresponding bytes at `pointer`
    /// - The byte following the matched prefix is the null terminator
    ///
    /// This is a specialized form of `strcmp` (ISO/IEC 9899:2018 §7.24.4.2)
    /// optimized for comparison against compile-time literals.
    ///
    /// - Parameters:
    ///   - pointer: Pointer to a null-terminated byte sequence.
    ///   - literal: Compile-time ASCII literal to compare against.
    ///
    /// - Returns: `true` if the null-terminated sequence equals the literal.
    ///
    /// - Precondition: `pointer` must point to a valid null-terminated sequence.
    /// - Precondition: `literal` must contain only ASCII characters (bytes < 0x80).
    ///
    /// ## Example
    ///
    /// ```swift
    /// // Checking filesystem type from statfs
    /// if unsafe ISO_9899.String.Comparison.equals(fsTypePointer, "apfs") {
    ///     // Handle APFS filesystem
    /// }
    /// ```
    @inlinable
    public static func equals(
        _ pointer: UnsafePointer<ISO_9899.String.Char>,
        _ literal: StaticString
    ) -> Bool {
        let count = literal.utf8CodeUnitCount

        return literal.withUTF8Buffer { buffer in
            for i in 0..<count {
                let byte = unsafe pointer[i]
                guard byte != ISO_9899.String.terminator,
                      unsafe (byte == buffer[i])
                else { return false }
            }
            return unsafe pointer[count] == ISO_9899.String.terminator
        }
    }
}
