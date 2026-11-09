extension ISO_9899.Errno {

    public enum Require {}
}

extension ISO_9899.Errno.Require {

    @inline(always)
    public static func pointer<T>(
        _ operation: () -> UnsafeMutablePointer<T>?
    ) throws(ISO_9899.Errno.Require.Error) -> UnsafeMutablePointer<T> {
        ISO_9899.Errno.clear()
        guard let result = unsafe operation() else {
            throw Error.current
        }
        return unsafe result
    }

    @inline(always)
    public static func rawPointer(
        _ operation: () -> UnsafeMutableRawPointer?
    ) throws(ISO_9899.Errno.Require.Error) -> UnsafeMutableRawPointer {
        ISO_9899.Errno.clear()
        guard let result = unsafe operation() else {
            throw Error.current
        }
        return unsafe result
    }

    @inline(always)
    public static func int(
        _ operation: () -> Int32
    ) throws(ISO_9899.Errno.Require.Error) -> Int32 {
        ISO_9899.Errno.clear()
        let result = operation()
        guard result != -1 else {
            throw Error.current
        }
        return result
    }

    @inline(always)
    public static func nonZero(
        _ operation: () -> Int32
    ) throws(ISO_9899.Errno.Require.Error) -> Int32 {
        ISO_9899.Errno.clear()
        let result = operation()
        guard result != 0 else {
            throw Error.current
        }
        return result
    }
}
