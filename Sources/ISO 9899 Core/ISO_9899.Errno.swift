// ISO_9899.Errno.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.5 - Errors <errno.h>

public import CISO9899Errno

extension ISO_9899 {
    /// Section 7.5: Errors `<errno.h>`
    ///
    /// Thread-safe access to the C error reporting mechanism.
    ///
    /// ## Overview
    ///
    /// The `errno` mechanism provides error reporting for C library functions.
    /// This namespace provides type-safe Swift access to errno values.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// // Check current errno
    /// let code = C.Errno.current
    ///
    /// // Clear errno before operation
    /// C.Errno.clear()
    ///
    /// // Capture errno from operation
    /// let (result, error) = C.Errno.capture {
    ///     someCFunction()
    /// }
    /// ```
    ///
    /// ## Thread Safety
    ///
    /// On modern platforms, `errno` is thread-local. Each thread has its own
    /// independent errno value.
    public enum Errno {}
}

// MARK: - Current Value Access

extension ISO_9899.Errno {
    /// The current thread-local errno value.
    @inline(always)
    public static var current: Code {
        Code(rawValue: iso9899_get_errno())
    }

    /// Sets the thread-local errno value.
    @inline(always)
    public static func set(_ code: Code) {
        iso9899_set_errno(code.rawValue)
    }

    /// Clears errno (sets to zero).
    @inline(always)
    public static func clear() {
        iso9899_set_errno(0)
    }

    /// Executes an operation and captures the resulting errno.
    ///
    /// Clears errno before the operation, then returns both the result
    /// and the errno value after the operation completes.
    ///
    /// - Parameter operation: The operation to execute.
    /// - Returns: A tuple of (result, errno code).
    @inline(always)
    public static func capture<T>(_ operation: () -> T) -> (result: T, error: Code) {
        clear()
        let result = operation()
        return (result, current)
    }
}

// MARK: - Error Code Type

extension ISO_9899.Errno {
    /// An errno error code.
    ///
    /// Wraps the raw integer errno value with type safety.
    /// Conforms to `Error` for use with Swift's error handling.
    public struct Code: RawRepresentable, Equatable, Hashable, Sendable, Swift.Error {
        public let rawValue: Int32

        @inline(always)
        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
    }
}

// MARK: - ISO C Standard Codes (Section 7.5)

extension ISO_9899.Errno.Code {
    /// No error (errno == 0).
    public static let success = Self(rawValue: 0)

    /// Mathematics argument out of domain of function.
    public static let dom = Self(rawValue: iso9899_EDOM())

    /// Illegal byte sequence.
    public static let ilseq = Self(rawValue: iso9899_EILSEQ())

    /// Result too large.
    public static let range = Self(rawValue: iso9899_ERANGE())
}

// MARK: - Common POSIX Codes

extension ISO_9899.Errno.Code {
    /// Permission denied.
    public static let acces = Self(rawValue: iso9899_EACCES())

    /// Resource temporarily unavailable.
    public static let again = Self(rawValue: iso9899_EAGAIN())

    /// Bad file descriptor.
    public static let badf = Self(rawValue: iso9899_EBADF())

    /// Device or resource busy.
    public static let busy = Self(rawValue: iso9899_EBUSY())

    /// File exists.
    public static let exist = Self(rawValue: iso9899_EEXIST())

    /// Bad address.
    public static let fault = Self(rawValue: iso9899_EFAULT())

    /// Interrupted system call.
    public static let intr = Self(rawValue: iso9899_EINTR())

    /// Invalid argument.
    public static let inval = Self(rawValue: iso9899_EINVAL())

    /// Input/output error.
    public static let io = Self(rawValue: iso9899_EIO())

    /// Is a directory.
    public static let isdir = Self(rawValue: iso9899_EISDIR())

    /// Too many open files.
    public static let mfile = Self(rawValue: iso9899_EMFILE())

    /// Too many open files in system.
    public static let nfile = Self(rawValue: iso9899_ENFILE())

    /// No such file or directory.
    public static let noent = Self(rawValue: iso9899_ENOENT())

    /// Not enough memory.
    public static let nomem = Self(rawValue: iso9899_ENOMEM())

    /// No space left on device.
    public static let nospc = Self(rawValue: iso9899_ENOSPC())

    /// Not a directory.
    public static let notdir = Self(rawValue: iso9899_ENOTDIR())

    /// Directory not empty.
    public static let notempty = Self(rawValue: iso9899_ENOTEMPTY())

    /// Function not implemented.
    public static let nosys = Self(rawValue: iso9899_ENOSYS())

    /// Inappropriate ioctl for device.
    public static let notty = Self(rawValue: iso9899_ENOTTY())

    /// Operation not permitted.
    public static let perm = Self(rawValue: iso9899_EPERM())

    /// Broken pipe.
    public static let pipe = Self(rawValue: iso9899_EPIPE())

    /// Read-only file system.
    public static let rofs = Self(rawValue: iso9899_EROFS())

    /// Illegal seek.
    public static let spipe = Self(rawValue: iso9899_ESPIPE())

    /// No such process.
    public static let srch = Self(rawValue: iso9899_ESRCH())

    /// Connection timed out.
    public static let timedout = Self(rawValue: iso9899_ETIMEDOUT())

    /// Cross-device link.
    public static let xdev = Self(rawValue: iso9899_EXDEV())

    /// Operation would block.
    public static let wouldblock = Self(rawValue: iso9899_EWOULDBLOCK())

    /// Too many symbolic links encountered.
    public static let loop = Self(rawValue: iso9899_ELOOP())

    /// File name too long.
    public static let nametoolong = Self(rawValue: iso9899_ENAMETOOLONG())

    /// Value too large for defined data type.
    public static let overflow = Self(rawValue: iso9899_EOVERFLOW())
}

