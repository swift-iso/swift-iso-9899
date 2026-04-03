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

extension ISO_9899.String {
    /// Computes the length of a null-terminated byte string.
    ///
    /// Pure Swift implementation, no C dependency.
    ///
    /// - Parameter pointer: Pointer to null-terminated byte sequence.
    /// - Returns: Number of bytes before the null terminator.
    @inlinable
    public static func length(of pointer: UnsafePointer<Char>) -> Int {
        var current = unsafe pointer
        while unsafe (current.pointee != terminator) {
            unsafe (current = current.successor())
        }
        return unsafe (current - pointer)
    }
}
