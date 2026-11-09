extension ISO_9899.Errno.Require {

    public enum Error: Swift::Error, Equatable, Hashable, Sendable {
        case code(ISO_9899.Errno.Code)
        case unset
    }
}

extension ISO_9899.Errno.Require.Error {

    @inline(always)
    public static var current: Self {
        let code = ISO_9899.Errno.current
        return code == .success ? .unset : .code(code)
    }
}
