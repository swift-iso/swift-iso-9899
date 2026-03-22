// ISO_9899.String.Length.swift
// swift-iso-9899
//
// Pure Swift strlen implementation

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
