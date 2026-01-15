// ISO_9899.String.View.swift
// swift-iso-9899
//
// Non-escapable view of ISO C byte string

extension ISO_9899.String {
    /// Non-escapable view of a null-terminated ISO C byte string.
    ///
    /// Does not own storage. Valid only for the duration of the borrowing scope.
    /// `~Escapable` enforces at compile time that this value cannot escape.
    public struct View: ~Copyable, ~Escapable {
        /// The underlying pointer to the null-terminated byte sequence.
        public let pointer: UnsafePointer<Char>

        /// Creates a view from a pointer.
        ///
        /// - Precondition: `pointer` must point to a null-terminated sequence.
        @inlinable
        @_lifetime(borrow pointer)
        public init(_ pointer: UnsafePointer<ISO_9899.String.Char>) {
            self.pointer = pointer
        }
    }
}

// MARK: - Access

extension ISO_9899.String.View {
    /// Executes a closure with the underlying pointer.
    @inlinable
    public borrowing func withUnsafePointer<R: ~Copyable, E: Swift.Error>(
        _ body: (UnsafePointer<ISO_9899.String.Char>) throws(E) -> R
    ) throws(E) -> R {
        try body(pointer)
    }

    /// The length in bytes, excluding the null terminator.
    @inlinable
    public var length: Int {
        ISO_9899.String.length(of: pointer)
    }
}
