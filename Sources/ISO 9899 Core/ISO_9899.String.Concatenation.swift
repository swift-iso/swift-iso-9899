// ISO_9899.String.Concatenation.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.24.3 - Concatenation functions

public import CISO9899String

extension ISO_9899.String {
    /// String concatenation functions from `<string.h>`
    ///
    /// ISO/IEC 9899:2018 Section 7.24.3
    ///
    /// ## Safety Note
    ///
    /// These functions do not perform bounds checking. The caller is
    /// responsible for ensuring the destination buffer is large enough.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// ISO_9899.String.Concatenation.append(to: dest, from: src)
    /// ISO_9899.String.Concatenation.append(to: dest, from: src, count: n)
    /// ```
    public enum Concatenation {}
}

extension ISO_9899.String.Concatenation {
    /// Appends a string to another string.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.3.1 — The `strcat` function
    ///
    /// - Parameters:
    ///   - destination: Pointer to null-terminated destination string.
    ///   - source: Pointer to null-terminated source string.
    /// - Returns: The `destination` pointer.
    @inline(always)
    @discardableResult
    public static func append(
        to destination: UnsafeMutablePointer<ISO_9899.String.Char>,
        from source: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafeMutablePointer<ISO_9899.String.Char> {
        unsafe iso9899_strcat(destination, source)
    }

    /// Appends up to n characters from a string to another string.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.3.2 — The `strncat` function
    ///
    /// - Parameters:
    ///   - destination: Pointer to null-terminated destination string.
    ///   - source: Pointer to source string.
    ///   - count: Maximum number of characters to append.
    /// - Returns: The `destination` pointer.
    @inline(always)
    @discardableResult
    public static func append(
        to destination: UnsafeMutablePointer<ISO_9899.String.Char>,
        from source: UnsafePointer<ISO_9899.String.Char>,
        count: Int
    ) -> UnsafeMutablePointer<ISO_9899.String.Char> {
        precondition(count >= 0, "count must be non-negative")
        return unsafe iso9899_strncat(destination, source, count)
    }
}
