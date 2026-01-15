// ISO_9899.String.Char.swift
// swift-iso-9899
//
// ISO C byte character type

extension ISO_9899.String {
    /// ISO C byte character type.
    ///
    /// Always `UInt8` on all platforms — faithful to ISO C's byte-oriented model.
    ///
    /// ## Why UInt8?
    ///
    /// - **No C leakage**: Pure Swift type, not platform-dependent `CChar`
    /// - **Consistent signedness**: `CChar` varies (`Int8`/`UInt8`); `UInt8` is always unsigned
    /// - **Matches ISO C**: Byte operations use `unsigned char` semantics
    ///
    /// ## Relationship to String Primitives
    ///
    /// - `String_Primitives.String.Char`: OS-native (`CChar` on POSIX, `UInt16` on Windows)
    /// - `ISO_9899.String.Char`: Always bytes — these are different domains
    public typealias Char = UInt8

    /// The null terminator value (0x00).
    @inlinable
    public static var terminator: Char { 0 }
}
