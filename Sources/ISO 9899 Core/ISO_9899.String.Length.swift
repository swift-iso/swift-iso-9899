// ISO_9899.String.Length.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.24.6.3 - String length

public import CISO9899String

extension ISO_9899.String {
    /// String length functions
    ///
    /// ISO/IEC 9899:2018 Section 7.24.6.3
    public enum Length {}
}

extension ISO_9899.String.Length {
    /// Computes the length of a null-terminated string using C library.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.6.3 — The `strlen` function
    ///
    /// - Parameter string: Pointer to null-terminated string.
    /// - Returns: Number of characters before the null terminator.
    @inline(always)
    public static func strlen(_ string: UnsafePointer<ISO_9899.String.Char>) -> Int {
        unsafe iso9899_strlen(string)
    }
}

