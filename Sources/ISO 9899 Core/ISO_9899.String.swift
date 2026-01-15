// ISO_9899.String.swift
// swift-iso-9899
//
// ISO C byte string namespace

extension ISO_9899 {
    /// ISO C byte string domain.
    ///
    /// Provides null-terminated byte string types and operations
    /// per ISO/IEC 9899:2018 Section 7.24.
    ///
    /// ## Relationship to String Primitives
    ///
    /// - `ISO_9899.String`: ISO C byte strings (`Char = UInt8` always)
    /// - `String_Primitives.String`: OS-native path strings (`Char` varies by platform)
    ///
    /// These are different domains with different semantics. ISO C byte strings
    /// use `UInt8` on all platforms, while OS-native path strings use `CChar` on
    /// POSIX and `UInt16` on Windows.
    ///
    /// ## Nested Types
    ///
    /// - `Char`: Byte character type (`UInt8`)
    /// - `View`: Non-escapable borrowed view (~Copyable, ~Escapable)
    /// - `Owned`: Owned string with allocation (Hosted only)
    ///
    /// ## Namespaces
    ///
    /// - `Memory`: Raw byte operations (memcpy, memmove, memset, memcmp, memchr)
    /// - `Copy`: String copying (strcpy, strncpy)
    /// - `Concatenation`: String appending (strcat, strncat)
    /// - `Comparison`: String comparison (strcmp, strncmp)
    /// - `Search`: String searching (strchr, strrchr, strstr, strpbrk, strspn, strcspn)
    ///
    /// ## Usage
    ///
    /// ```swift
    /// // Access byte type
    /// let byte: ISO_9899.String.Char = 65  // 'A'
    ///
    /// // Pure Swift length calculation
    /// let len = ISO_9899.String.length(of: pointer)
    ///
    /// // Copy bytes
    /// ISO_9899.String.Copy.copy(to: dest, from: src)
    /// ```
    public enum String {}
}
