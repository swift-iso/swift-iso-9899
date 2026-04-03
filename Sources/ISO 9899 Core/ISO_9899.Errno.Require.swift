// ISO_9899.Errno.Require.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.5 - Typed-throws helpers for errno patterns

extension ISO_9899.Errno {
    /// Typed-throws helpers for common errno patterns.
    ///
    /// These helpers encode sentinel-checking logic once, avoiding
    /// repetition at every call site.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// // For APIs where NULL indicates failure
    /// let ptr = try C.Errno.Require.pointer { malloc(size) }
    ///
    /// // For APIs where -1 indicates failure
    /// let fd = try C.Errno.Require.int { open(path, flags) }
    ///
    /// // For APIs where 0 indicates failure
    /// let count = try C.Errno.Require.nonZero { fread(...) }
    /// ```
    public enum Require {}
}

extension ISO_9899.Errno.Require {
    /// Requires a non-NULL pointer result.
    ///
    /// For APIs where NULL indicates failure and errno is set.
    ///
    /// - Parameter operation: The operation that returns an optional pointer.
    /// - Returns: The non-NULL pointer.
    /// - Throws: `ISO_9899.Errno.Code` if the pointer is NULL.
    @inline(always)
    public static func pointer<T>(
        _ operation: () -> UnsafeMutablePointer<T>?
    ) throws(ISO_9899.Errno.Code) -> UnsafeMutablePointer<T> {
        ISO_9899.Errno.clear()
        guard let result = unsafe operation() else {
            throw ISO_9899.Errno.current
        }
        return unsafe result
    }

    /// Requires a non-NULL raw pointer result.
    ///
    /// For APIs where NULL indicates failure and errno is set.
    ///
    /// - Parameter operation: The operation that returns an optional raw pointer.
    /// - Returns: The non-NULL raw pointer.
    /// - Throws: `ISO_9899.Errno.Code` if the pointer is NULL.
    @inline(always)
    public static func pointer(
        _ operation: () -> UnsafeMutableRawPointer?
    ) throws(ISO_9899.Errno.Code) -> UnsafeMutableRawPointer {
        ISO_9899.Errno.clear()
        guard let result = unsafe operation() else {
            throw ISO_9899.Errno.current
        }
        return unsafe result
    }

    /// Requires a non-(-1) integer result.
    ///
    /// For APIs where -1 indicates failure and errno is set.
    ///
    /// - Parameter operation: The operation that returns an Int32.
    /// - Returns: The result (guaranteed not -1).
    /// - Throws: `ISO_9899.Errno.Code` if the result is -1.
    @inline(always)
    public static func int(
        _ operation: () -> Int32
    ) throws(ISO_9899.Errno.Code) -> Int32 {
        ISO_9899.Errno.clear()
        let result = operation()
        guard result != -1 else {
            throw ISO_9899.Errno.current
        }
        return result
    }

    /// Requires a non-zero result.
    ///
    /// For APIs where 0 indicates failure and errno is set.
    ///
    /// - Parameter operation: The operation that returns an Int32.
    /// - Returns: The non-zero result.
    /// - Throws: `ISO_9899.Errno.Code` if the result is 0.
    @inline(always)
    public static func nonZero(
        _ operation: () -> Int32
    ) throws(ISO_9899.Errno.Code) -> Int32 {
        ISO_9899.Errno.clear()
        let result = operation()
        guard result != 0 else {
            throw ISO_9899.Errno.current
        }
        return result
    }
}
