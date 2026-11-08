public import ISO_9899_Errno_Shims

extension ISO_9899 {

    public enum Errno {}
}

extension ISO_9899.Errno {

    @inline(always)
    public static var current: Code {
        Code(rawValue: iso9899_get_errno())
    }

    @inline(always)
    public static func set(_ code: Code) {
        iso9899_set_errno(code.rawValue)
    }

    @inline(always)
    public static func clear() {
        iso9899_set_errno(0)
    }

    @inline(always)
    public static func capture<T>(_ operation: () -> T) -> (result: T, error: Code) {
        clear()
        let result = operation()
        return (result, current)
    }
}

extension ISO_9899.Errno {

    public struct Code: RawRepresentable, Equatable, Hashable, Sendable, Swift::Error {
        public let rawValue: Int32

        @inline(always)
        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
    }
}

extension ISO_9899.Errno.Code {

    public static let success = Self(rawValue: 0)

    public static let dom = Self(rawValue: iso9899_EDOM())

    public static let ilseq = Self(rawValue: iso9899_EILSEQ())

    public static let range = Self(rawValue: iso9899_ERANGE())
}

extension ISO_9899.Errno.Code {

    public static let acces = Self(rawValue: iso9899_EACCES())

    public static let again = Self(rawValue: iso9899_EAGAIN())

    public static let badf = Self(rawValue: iso9899_EBADF())

    public static let busy = Self(rawValue: iso9899_EBUSY())

    public static let exist = Self(rawValue: iso9899_EEXIST())

    public static let fault = Self(rawValue: iso9899_EFAULT())

    public static let intr = Self(rawValue: iso9899_EINTR())

    public static let inval = Self(rawValue: iso9899_EINVAL())

    public static let io = Self(rawValue: iso9899_EIO())

    public static let isdir = Self(rawValue: iso9899_EISDIR())

    public static let mfile = Self(rawValue: iso9899_EMFILE())

    public static let nfile = Self(rawValue: iso9899_ENFILE())

    public static let noent = Self(rawValue: iso9899_ENOENT())

    public static let nomem = Self(rawValue: iso9899_ENOMEM())

    public static let nospc = Self(rawValue: iso9899_ENOSPC())

    public static let notdir = Self(rawValue: iso9899_ENOTDIR())

    public static let notempty = Self(rawValue: iso9899_ENOTEMPTY())

    public static let nosys = Self(rawValue: iso9899_ENOSYS())

    public static let notty = Self(rawValue: iso9899_ENOTTY())

    public static let perm = Self(rawValue: iso9899_EPERM())

    public static let pipe = Self(rawValue: iso9899_EPIPE())

    public static let rofs = Self(rawValue: iso9899_EROFS())

    public static let spipe = Self(rawValue: iso9899_ESPIPE())

    public static let srch = Self(rawValue: iso9899_ESRCH())

    public static let timedout = Self(rawValue: iso9899_ETIMEDOUT())

    public static let xdev = Self(rawValue: iso9899_EXDEV())

    public static let wouldblock = Self(rawValue: iso9899_EWOULDBLOCK())

    public static let loop = Self(rawValue: iso9899_ELOOP())

    public static let nametoolong = Self(rawValue: iso9899_ENAMETOOLONG())

    public static let overflow = Self(rawValue: iso9899_EOVERFLOW())
}
