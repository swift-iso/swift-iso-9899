// ISO_9899.String.Copy.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.24.2 - Copying functions (string portion)
// ISO/IEC 9899:2018 Section 7.24.3 - Concatenation functions
// ISO/IEC 9899:2018 Section 7.24.6.3 - The strlen function

public import CISO9899String

extension ISO_9899.String {
    /// String copying functions from `<string.h>`
    ///
    /// ISO/IEC 9899:2018 Section 7.24.2.3, 7.24.2.4
    ///
    /// ## Safety Note
    ///
    /// These functions do not perform bounds checking. The caller is
    /// responsible for ensuring the destination buffer is large enough.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// ISO_9899.String.Copy.copy(to: dest, from: src)
    /// ISO_9899.String.Copy.copy(to: dest, from: src, count: n)
    /// ```
    public enum Copy {}
}

extension ISO_9899.String.Copy {
    /// Copies a string to a destination buffer.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.2.3 — The `strcpy` function
    ///
    /// Copies the string pointed to by `source` (including the terminating
    /// null character) into the array pointed to by `destination`.
    ///
    /// - Parameters:
    ///   - destination: Pointer to destination buffer.
    ///   - source: Pointer to null-terminated source string.
    /// - Returns: The `destination` pointer.
    ///
    /// - Precondition: `destination` must have enough space for the source string.
    /// - Precondition: Source and destination must not overlap.
    @inline(always)
    @discardableResult
    public static func copy(
        to destination: UnsafeMutablePointer<ISO_9899.String.Char>,
        from source: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafeMutablePointer<ISO_9899.String.Char> {
        unsafe iso9899_strcpy(destination, source)
    }

    /// Copies up to n characters from a string to a destination buffer.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.2.4 — The `strncpy` function
    ///
    /// Copies not more than `count` characters from the string pointed to
    /// by `source` to the array pointed to by `destination`. If the source
    /// string is shorter than `count`, null characters are appended until
    /// exactly `count` characters have been written.
    ///
    /// - Parameters:
    ///   - destination: Pointer to destination buffer.
    ///   - source: Pointer to source string.
    ///   - count: Maximum number of characters to copy.
    /// - Returns: The `destination` pointer.
    ///
    /// - Precondition: `count >= 0`
    /// - Precondition: `destination` must have space for at least `count` characters.
    /// - Precondition: Source and destination must not overlap.
    ///
    /// - Warning: If `source` is longer than `count`, the result will NOT
    ///   be null-terminated.
    @inline(always)
    @discardableResult
    public static func copy(
        to destination: UnsafeMutablePointer<ISO_9899.String.Char>,
        from source: UnsafePointer<ISO_9899.String.Char>,
        count: Int
    ) -> UnsafeMutablePointer<ISO_9899.String.Char> {
        precondition(count >= 0, "count must be non-negative")
        return unsafe iso9899_strncpy(destination, source, count)
    }
}
