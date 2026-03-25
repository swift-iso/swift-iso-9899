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

// MARK: - Concatenation

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
    /// Appends a copy of the string pointed to by `source` (including the
    /// terminating null character) to the end of the string pointed to by
    /// `destination`. The initial character of `source` overwrites the null
    /// character at the end of `destination`.
    ///
    /// - Parameters:
    ///   - destination: Pointer to null-terminated destination string.
    ///   - source: Pointer to null-terminated source string.
    /// - Returns: The `destination` pointer.
    ///
    /// - Precondition: `destination` must have enough space for the concatenated result.
    /// - Precondition: Source and destination must not overlap.
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
    /// Appends not more than `count` characters from the string pointed to
    /// by `source` to the end of the string pointed to by `destination`.
    /// A terminating null character is always appended.
    ///
    /// - Parameters:
    ///   - destination: Pointer to null-terminated destination string.
    ///   - source: Pointer to source string.
    ///   - count: Maximum number of characters to append.
    /// - Returns: The `destination` pointer.
    ///
    /// - Precondition: `count >= 0`
    /// - Precondition: `destination` must have enough space for the result.
    /// - Precondition: Source and destination must not overlap.
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

// MARK: - strlen

extension ISO_9899.String {
    /// String length function from `<string.h>`
    ///
    /// ISO/IEC 9899:2018 Section 7.24.6.3
    public enum Length {}
}

extension ISO_9899.String.Length {
    /// Computes the length of a null-terminated string using C library.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.6.3 — The `strlen` function
    ///
    /// Computes the length of the string pointed to by `string`.
    ///
    /// - Parameter string: Pointer to null-terminated string.
    /// - Returns: Number of characters before the null terminator.
    ///
    /// - Note: This uses the C library's `strlen`. For a pure Swift
    ///   implementation, use `ISO_9899.String.length(of:)` directly.
    @inline(always)
    public static func strlen(_ string: UnsafePointer<ISO_9899.String.Char>) -> Int {
        unsafe iso9899_strlen(string)
    }
}
