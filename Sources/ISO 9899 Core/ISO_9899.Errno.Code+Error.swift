public import Error

extension ISO_9899.Errno.Code {

    @inlinable
    public var platformCode: Error::Error.Code {
        .posix(rawValue)
    }
}

extension ISO_9899.Errno.Code {

    @inlinable
    public init?(_ code: Error::Error.Code) {
        guard let posix = code.posix else { return nil }
        self.init(rawValue: posix)
    }

    @inlinable
    public init(posix code: Error::Error.Code) {
        precondition(code.isPosix, "Expected POSIX error code, got Windows error")
        self.init(rawValue: code.posix!)
    }
}

extension ISO_9899.Errno {

    public typealias PlatformCode = Error::Error.Code
}
