// ISO_9899.String.Borrowed.swift
// swift-iso-9899
//
// Non-escapable borrowed view of ISO C byte string

public import Ownership_Primitives

// MARK: - Ownership.Borrow.`Protocol` Conformance

extension ISO_9899.String: Ownership.Borrow.`Protocol` {}

// MARK: - Borrowed

extension ISO_9899.String {
    /// Non-escapable borrowed view of a null-terminated ISO C byte string.
    ///
    /// Does not own storage. Valid only for the duration of the borrowing scope.
    /// The referenced memory must remain valid and unmodified while borrowed.
    ///
    /// `~Escapable` enforces at compile time that this value cannot escape
    /// the scope where it was created — preventing use-after-free bugs.
    ///
    /// Invariant: Points to a null-terminated byte sequence.
    @safe public struct Borrowed: ~Copyable, ~Escapable {
        /// The underlying pointer to the null-terminated byte sequence.
        public let pointer: UnsafePointer<Char>

        /// The length in bytes, excluding the null terminator.
        public let count: Int

        /// Creates a borrowed view from a pointer with a known length.
        ///
        /// The lifetime of this `Borrowed` value is tied to the lifetime of `pointer`.
        ///
        /// - Precondition: `pointer` must point to at least `count + 1` bytes,
        ///   with `pointer[count]` equal to the null terminator.
        @inlinable
        @_lifetime(borrow pointer)
        public init(_ pointer: UnsafePointer<ISO_9899.String.Char>, count: Int) {
            #if DEBUG
            precondition(unsafe (pointer[count] == ISO_9899.String.terminator), "ISO_9899.String.Borrowed: pointer[count] must be the null terminator")
            #endif
            unsafe (self.pointer = pointer)
            self.count = count
        }
    }
}

// MARK: - Initialization

extension ISO_9899.String.Borrowed {
    /// Creates a borrowed view from a pointer of unknown length.
    ///
    /// Scans the byte sequence to compute the length. Use this when adopting
    /// a raw `char *` returned by a C API where the length is not available.
    /// Prefer the `init(_:count:)` overload when count is known.
    ///
    /// The lifetime of this `Borrowed` value is tied to the lifetime of `pointer`.
    ///
    /// - Precondition: `pointer` must point to a null-terminated sequence.
    @inlinable
    @_lifetime(borrow pointer)
    public init(_ pointer: UnsafePointer<ISO_9899.String.Char>) {
        #if DEBUG
        unsafe Self.debugValidateTermination(pointer)
        #endif
        let count = unsafe ISO_9899.String.Length.strlen(pointer)
        unsafe self.init(pointer, count: count)
    }
}

// MARK: - Debug Validation

#if DEBUG
extension ISO_9899.String.Borrowed {
    /// Maximum bytes to scan when validating termination in debug builds.
    @usableFromInline
    internal static let maxDebugScanLength = 16 * 1024 * 1024 // 16 MiB

    @usableFromInline
    internal static func debugValidateTermination(_ pointer: UnsafePointer<ISO_9899.String.Char>) {
        var current = unsafe pointer
        var scanned = 0
        while scanned < maxDebugScanLength {
            if unsafe (current.pointee == ISO_9899.String.terminator) {
                return // Valid: found terminator
            }
            unsafe (current = current.successor())
            scanned += 1
        }
        assertionFailure("ISO_9899.String.Borrowed: pointer does not appear to be null-terminated within \(maxDebugScanLength) bytes")
    }
}
#endif

// MARK: - Access

extension ISO_9899.String.Borrowed {
    /// Executes a closure with the underlying pointer.
    @inlinable
    public borrowing func withUnsafePointer<R: ~Copyable, E: Swift.Error>(
        _ body: (UnsafePointer<ISO_9899.String.Char>) throws(E) -> R
    ) throws(E) -> R {
        try unsafe body(pointer)
    }

    /// The length in bytes, excluding the null terminator.
    @inlinable
    public var length: Int {
        count
    }

    /// Returns a `Span` view of the string content, excluding the null terminator.
    ///
    /// Mirrors `String_Primitives.String.Borrowed.span`. O(1) — uses the stored count.
    @inlinable
    public var span: Span<ISO_9899.String.Char> {
        @_lifetime(copy self) borrowing get {
            let span = unsafe Span(_unsafeStart: pointer, count: count)
            return unsafe _overrideLifetime(span, copying: self)
        }
    }
}
