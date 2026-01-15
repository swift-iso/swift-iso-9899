// ISO_9899.String.Owned.swift
// swift-iso-9899
//
// Owned ISO C byte string (requires allocation)

import CISO9899String

extension ISO_9899.String {
    /// Owned, null-terminated ISO C byte string.
    ///
    /// Owns its storage and deallocates on deinit.
    /// `~Copyable` enforces unique ownership.
    ///
    /// - Note: This type is in Hosted because it requires heap allocation.
    ///   Core provides only `View` for borrowed access.
    public struct Owned: ~Copyable {
        @usableFromInline
        internal let pointer: UnsafeMutablePointer<Char>

        /// The length in bytes, excluding the null terminator.
        public let count: Int

        @inlinable
        deinit {
            pointer.deallocate()
        }
    }
}

// MARK: - Initialization

extension ISO_9899.String.Owned {
    /// Creates an owned string by adopting an existing allocation.
    ///
    /// Takes ownership of `pointer`. The caller must not deallocate it.
    @inlinable
    public init(adopting pointer: UnsafeMutablePointer<ISO_9899.String.Char>, count: Int) {
        self.pointer = pointer
        self.count = count
    }

    /// Creates an owned string by copying from a view.
    @inlinable
    public init(copying view: borrowing ISO_9899.String.View) {
        let length = view.length
        let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: length + 1)
        _ = iso9899_strcpy(buffer, view.pointer)
        self.pointer = buffer
        self.count = length
    }

    /// Creates an owned string by copying from a pointer.
    @inlinable
    public init(copying pointer: UnsafePointer<ISO_9899.String.Char>) {
        let length = ISO_9899.String.length(of: pointer)
        let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: length + 1)
        _ = iso9899_strcpy(buffer, pointer)
        self.pointer = buffer
        self.count = length
    }
}

// MARK: - Access

extension ISO_9899.String.Owned {
    /// Executes a closure with the underlying pointer.
    @inlinable
    public borrowing func withUnsafePointer<R: ~Copyable, E: Swift.Error>(
        _ body: (UnsafePointer<ISO_9899.String.Char>) throws(E) -> R
    ) throws(E) -> R {
        try body(pointer)
    }

    /// Executes a closure with a view of this string.
    @inlinable
    public borrowing func withView<R: ~Copyable, E: Swift.Error>(
        _ body: (borrowing ISO_9899.String.View) throws(E) -> R
    ) throws(E) -> R {
        try body(ISO_9899.String.View(UnsafePointer(pointer)))
    }
}
