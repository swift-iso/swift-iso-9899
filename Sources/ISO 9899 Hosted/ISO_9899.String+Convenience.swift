// ISO_9899.String+Convenience.swift
// swift-iso-9899
//
// Convenience initializers that allocate (Hosted only)

import CISO9899String

// MARK: - Copying Initializers

extension ISO_9899.String {
    /// Creates an owned string by copying from a view.
    ///
    /// Allocates new storage and copies the content.
    @inlinable
    public init(copying view: borrowing ISO_9899.String.View) {
        let length = view.length
        let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: length + 1)
        _ = iso9899_strcpy(buffer, view.pointer)
        self.init(adopting: buffer, count: length)
    }

    /// Creates an owned string by copying from a pointer.
    ///
    /// Allocates new storage and copies the content.
    ///
    /// - Precondition: `pointer` must point to a null-terminated sequence.
    @inlinable
    public init(copying pointer: UnsafePointer<ISO_9899.String.Char>) {
        let length = ISO_9899.String.length(of: pointer)
        let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: length + 1)
        _ = iso9899_strcpy(buffer, pointer)
        self.init(adopting: buffer, count: length)
    }
}
