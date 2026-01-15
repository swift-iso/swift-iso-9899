// ISO_9899.String.View.swift
// swift-iso-9899
//
// Non-escapable view of ISO C byte string

extension ISO_9899.String {
    /// Non-escapable view of a null-terminated ISO C byte string.
    ///
    /// Does not own storage. Valid only for the duration of the borrowing scope.
    /// The referenced memory must remain valid and unmodified while borrowed.
    ///
    /// `~Escapable` enforces at compile time that this value cannot escape
    /// the scope where it was created — preventing use-after-free bugs.
    ///
    /// Invariant: Points to a null-terminated byte sequence.
    public struct View: ~Copyable, ~Escapable {
        /// The underlying pointer to the null-terminated byte sequence.
        public let pointer: UnsafePointer<Char>
    }
}

// MARK: - Initialization

extension ISO_9899.String.View {
    /// Creates a view from a pointer.
    ///
    /// The lifetime of this `View` value is tied to the lifetime of `pointer`.
    ///
    /// - Precondition: `pointer` must point to a null-terminated sequence.
    @inlinable
    @_lifetime(borrow pointer)
    public init(_ pointer: UnsafePointer<ISO_9899.String.Char>) {
        #if DEBUG
        Self.debugValidateTermination(pointer)
        #endif
        self.pointer = pointer
    }
}

// MARK: - Debug Validation

#if DEBUG
extension ISO_9899.String.View {
    /// Maximum bytes to scan when validating termination in debug builds.
    @usableFromInline
    internal static let maxDebugScanLength = 16 * 1024 * 1024 // 16 MiB

    @usableFromInline
    internal static func debugValidateTermination(_ pointer: UnsafePointer<ISO_9899.String.Char>) {
        var current = pointer
        var scanned = 0
        while scanned < maxDebugScanLength {
            if current.pointee == ISO_9899.String.terminator {
                return // Valid: found terminator
            }
            current = current.successor()
            scanned += 1
        }
        assertionFailure("ISO_9899.String.View: pointer does not appear to be null-terminated within \(maxDebugScanLength) bytes")
    }
}
#endif

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
