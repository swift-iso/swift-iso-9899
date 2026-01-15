// ISO_9899.String.swift
// swift-iso-9899
//
// Owned ISO C byte string

import CISO9899String

extension ISO_9899 {
    /// Owned, null-terminated ISO C byte string.
    ///
    /// Owns its storage and deallocates on deinit.
    /// The stored sequence is always null-terminated.
    ///
    /// `~Copyable` enforces unique ownership — preventing double-free bugs.
    ///
    /// Invariant: `pointer` points to `count + 1` allocated bytes,
    /// where the final byte is the null terminator.
    ///
    /// ## Character Type
    ///
    /// `ISO_9899.String.Char` is always `UInt8` on all platforms,
    /// faithful to ISO C's byte-oriented model.
    ///
    /// ## Relationship to String Primitives
    ///
    /// - `ISO_9899.String`: ISO C byte strings (`Char = UInt8` always)
    /// - `String_Primitives.String`: OS-native path strings (`Char` varies by platform)
    ///
    /// These are different domains with different semantics.
    public struct String: ~Copyable {
        /// The underlying pointer to the null-terminated byte sequence.
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

extension ISO_9899.String {
    /// Creates an owned string by adopting an existing allocation.
    ///
    /// Takes ownership of `pointer`. The caller must not deallocate it.
    ///
    /// - Parameters:
    ///   - pointer: A pointer to a null-terminated byte sequence. Ownership is transferred.
    ///   - count: The length in bytes, excluding the null terminator.
    ///
    /// - Precondition: `pointer` must point to at least `count + 1` allocated bytes.
    /// - Precondition: `pointer[count]` must be the null terminator.
    @inlinable
    public init(adopting pointer: UnsafeMutablePointer<ISO_9899.String.Char>, count: Int) {
        #if DEBUG
        precondition(pointer[count] == ISO_9899.String.terminator, "ISO_9899.String: adopted buffer must be null-terminated")
        #endif
        self.pointer = pointer
        self.count = count
    }

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

// MARK: - Access

extension ISO_9899.String {
    /// Executes a closure with the underlying pointer.
    @inlinable
    public borrowing func withUnsafePointer<R: ~Copyable, E: Swift.Error>(
        _ body: (UnsafePointer<ISO_9899.String.Char>) throws(E) -> R
    ) throws(E) -> R {
        try body(pointer)
    }

    /// Executes a closure with the underlying mutable pointer.
    @inlinable
    public mutating func withUnsafeMutablePointer<R: ~Copyable, E: Swift.Error>(
        _ body: (UnsafeMutablePointer<ISO_9899.String.Char>) throws(E) -> R
    ) throws(E) -> R {
        try body(pointer)
    }

    /// Returns a view of this string.
    ///
    /// The lifetime of the returned `View` is tied to `self`.
    @inlinable
    public var view: ISO_9899.String.View {
        @_lifetime(borrow self) borrowing get {
            let view = unsafe ISO_9899.String.View(UnsafePointer(pointer))
            return unsafe _overrideLifetime(view, borrowing: self)
        }
    }
}

// MARK: - Ownership Transfer

extension ISO_9899.String {
    /// Transfers ownership of the underlying buffer to the caller.
    ///
    /// Returns the pointer and count. The caller is responsible for deallocation.
    /// This instance is consumed and will not deallocate the buffer.
    ///
    /// - Returns: A tuple of (pointer, count) where count excludes the null terminator.
    @inlinable
    public consuming func take() -> (pointer: UnsafeMutablePointer<ISO_9899.String.Char>, count: Int) {
        let result = (pointer, count)
        discard self
        return result
    }
}
