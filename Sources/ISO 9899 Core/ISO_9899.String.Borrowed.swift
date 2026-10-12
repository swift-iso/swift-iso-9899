public import Ownership

extension ISO_9899.String: Ownership.Borrow.`Protocol` {}

extension ISO_9899.String {

    @safe public struct Borrowed: ~Copyable, ~Escapable {

        public let pointer: UnsafePointer<Char>

        public let count: Int

        @inlinable
        @_lifetime(borrow pointer)
        public init(_ pointer: UnsafePointer<ISO_9899.String.Char>, count: Int) {
            #if DEBUG
                precondition(
                    unsafe (pointer[count] == ISO_9899.String.terminator),
                    "ISO_9899.String.Borrowed: pointer[count] must be the null terminator"
                )
            #endif
            unsafe (self.pointer = pointer)
            self.count = count
        }
    }
}

extension ISO_9899.String.Borrowed {

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

#if DEBUG
    extension ISO_9899.String.Borrowed {

        @usableFromInline
        internal static let maxDebugScanLength = 16 * 1024 * 1024

        @usableFromInline
        internal static func debugValidateTermination(
            _ pointer: UnsafePointer<ISO_9899.String.Char>
        ) {
            var current = unsafe pointer
            var scanned = 0
            while scanned < maxDebugScanLength {
                if unsafe (current.pointee == ISO_9899.String.terminator) {
                    return
                }
                unsafe (current = current.successor())
                scanned += 1
            }
            assertionFailure(
                "ISO_9899.String.Borrowed: pointer does not appear to be null-terminated within \(maxDebugScanLength) bytes"
            )
        }
    }
#endif

extension ISO_9899.String.Borrowed {

    @inlinable
    public borrowing func withUnsafePointer<R: ~Copyable, E: Swift::Error>(
        _ body: (UnsafePointer<ISO_9899.String.Char>) throws(E) -> R
    ) throws(E) -> R {
        try unsafe body(pointer)
    }

    @inlinable
    public var length: Int {
        count
    }

    @inlinable
    public var span: Swift::Span<ISO_9899.String.Char> {
        @_lifetime(copy self) borrowing get {
            let span = unsafe Span(_unsafeStart: pointer, count: count)
            return unsafe _overrideLifetime(span, copying: self)
        }
    }
}
