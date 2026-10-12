public import ISO_9899_String_Shims

extension ISO_9899 {

    @frozen @safe public struct String: ~Copyable {

        @usableFromInline
        internal let pointer: UnsafeMutablePointer<Char>

        public let count: Int

        @inlinable
        deinit {
            unsafe pointer.deallocate()
        }
    }
}

extension ISO_9899.String {

    @inlinable
    public init(adopting pointer: UnsafeMutablePointer<ISO_9899.String.Char>, count: Int) {
        #if DEBUG
            precondition(
                unsafe (pointer[count] == ISO_9899.String.terminator),
                "ISO_9899.String: adopted buffer must be null-terminated"
            )
        #endif
        unsafe (self.pointer = pointer)
        self.count = count
    }

    @inlinable
    public init(copying view: borrowing ISO_9899.String.Borrowed) {
        let length = view.count
        let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: length + 1)
        _ = unsafe iso9899_strcpy(buffer, view.pointer)
        unsafe self.init(adopting: buffer, count: length)
    }

    @inlinable
    public init(copying pointer: UnsafePointer<ISO_9899.String.Char>) {
        let length = unsafe ISO_9899.String.Length.strlen(pointer)
        let buffer = UnsafeMutablePointer<ISO_9899.String.Char>.allocate(capacity: length + 1)
        _ = unsafe iso9899_strcpy(buffer, pointer)
        unsafe self.init(adopting: buffer, count: length)
    }
}

extension ISO_9899.String {

    @inlinable
    public borrowing func withUnsafePointer<R: ~Copyable, E: Swift::Error>(
        _ body: (UnsafePointer<ISO_9899.String.Char>) throws(E) -> R
    ) throws(E) -> R {
        try unsafe body(pointer)
    }

    @inlinable
    public mutating func withUnsafeMutablePointer<R: ~Copyable, E: Swift::Error>(
        _ body: (UnsafeMutablePointer<ISO_9899.String.Char>) throws(E) -> R
    ) throws(E) -> R {
        try unsafe body(pointer)
    }

    @inlinable
    public var view: ISO_9899.String.Borrowed {
        @_lifetime(borrow self) borrowing get {
            let view = unsafe ISO_9899.String.Borrowed(UnsafePointer(pointer), count: count)
            return unsafe _overrideLifetime(view, borrowing: self)
        }
    }

    @inlinable
    public var span: Swift::Span<Char> {
        @_lifetime(borrow self) borrowing get {
            let span = unsafe Span(_unsafeStart: UnsafePointer(pointer), count: count)
            return unsafe _overrideLifetime(span, borrowing: self)
        }
    }
}

extension ISO_9899.String {

    @inlinable
    public consuming func take() -> (
        pointer: UnsafeMutablePointer<ISO_9899.String.Char>, count: Int
    ) {
        let result = unsafe (pointer, count)
        discard self
        return unsafe result
    }
}
