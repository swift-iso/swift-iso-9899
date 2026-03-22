// ISO_9899.String.Comparison.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.24.4 - Comparison functions

internal import CISO9899String

extension ISO_9899.String {
    /// String comparison functions from `<string.h>`
    ///
    /// ISO/IEC 9899:2018 Section 7.24.4
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let order = ISO_9899.String.Comparison.compare(s1, s2)
    /// if order == .equal {
    ///     print("strings are equal")
    /// }
    /// ```
    public enum Comparison {}
}

extension ISO_9899.String.Comparison {
    /// Compares two null-terminated strings.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.4.2 — The `strcmp` function
    ///
    /// Compares the strings pointed to by `lhs` and `rhs`.
    ///
    /// - Parameters:
    ///   - lhs: Pointer to first null-terminated string.
    ///   - rhs: Pointer to second null-terminated string.
    /// - Returns: Ordering relationship between the strings.
    @inline(__always)
    public static func compare(
        _ lhs: UnsafePointer<ISO_9899.String.Char>,
        _ rhs: UnsafePointer<ISO_9899.String.Char>
    ) -> ISO_9899.String.Order {
        unsafe ISO_9899.String.Order(cResult: iso9899_strcmp(lhs, rhs))
    }

    /// Compares up to n characters of two null-terminated strings.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.4.4 — The `strncmp` function
    ///
    /// Compares not more than `count` characters from the strings
    /// pointed to by `lhs` and `rhs`.
    ///
    /// - Parameters:
    ///   - lhs: Pointer to first null-terminated string.
    ///   - rhs: Pointer to second null-terminated string.
    ///   - count: Maximum number of characters to compare.
    /// - Returns: Ordering relationship between the strings.
    /// - Precondition: `count >= 0`
    @inline(__always)
    public static func compare(
        _ lhs: UnsafePointer<ISO_9899.String.Char>,
        _ rhs: UnsafePointer<ISO_9899.String.Char>,
        count: Int
    ) -> ISO_9899.String.Order {
        precondition(count >= 0, "count must be non-negative")
        return unsafe ISO_9899.String.Order(cResult: iso9899_strncmp(lhs, rhs, count))
    }
}
