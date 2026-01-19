// ISO_9899.Errno.Code+ErrorPrimitives.swift
// swift-iso-9899
//
// Conversions between ISO_9899.Errno.Code and Error_Primitives.Error.Code

public import Error_Primitives

// MARK: - Conversion to Error Primitives

extension ISO_9899.Errno.Code {
    /// Converts this errno code to the platform-agnostic error code type.
    ///
    /// Creates a `.posix` error code wrapping the raw errno value.
    @inlinable
    public var platformCode: Error_Primitives.Error.Code {
        .posix(rawValue)
    }
}

// MARK: - Conversion from Error Primitives

extension ISO_9899.Errno.Code {
    /// Creates an errno code from a platform-agnostic error code.
    ///
    /// - Parameter code: The platform error code.
    /// - Returns: The errno code if the error is POSIX, `nil` if Windows.
    @inlinable
    public init?(_ code: Error_Primitives.Error.Code) {
        guard let posix = code.posix else { return nil }
        self.init(rawValue: posix)
    }

    /// Creates an errno code from a platform-agnostic error code.
    ///
    /// - Parameter code: The platform error code.
    /// - Precondition: The code must be a POSIX error.
    @inlinable
    public init(posix code: Error_Primitives.Error.Code) {
        precondition(code.isPosix, "Expected POSIX error code, got Windows error")
        self.init(rawValue: code.posix!)
    }
}

// MARK: - Error Primitives Type Alias

extension ISO_9899.Errno {
    /// Platform-agnostic error code type from Error Primitives.
    ///
    /// Use this when you need to work with both POSIX and Windows errors.
    /// For POSIX-only code, prefer `ISO_9899.Errno.Code`.
    public typealias PlatformCode = Error_Primitives.Error.Code
}
