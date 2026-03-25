// ISO_9899.Stdlib.Conversion.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.22.1 - Numeric conversion functions

import CISO9899Stdlib

extension ISO_9899.Stdlib {
    /// String-to-number conversion functions.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let i = C.Stdlib.Conversion.toInt("42")
    /// let d = C.Stdlib.Conversion.toDouble("3.14")
    /// let (value, end) = C.Stdlib.Conversion.toLong("123abc", base: 10)
    /// ```
    public enum Conversion {}
}

// MARK: - Simple Conversions (Section 7.22.1.2)

extension ISO_9899.Stdlib.Conversion {
    /// Converts a string to a double.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.1 — The `atof` function
    ///
    /// Equivalent to `strtod(nptr, NULL)`.
    ///
    /// - Parameter string: Pointer to null-terminated string.
    /// - Returns: The converted value.
    @inline(always)
    public static func toDouble(_ string: UnsafePointer<CChar>) -> Double {
        unsafe iso9899_atof(string)
    }

    /// Converts a string to an int.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.2 — The `atoi` function
    ///
    /// - Parameter string: Pointer to null-terminated string.
    /// - Returns: The converted value.
    @inline(always)
    public static func toInt(_ string: UnsafePointer<CChar>) -> Int32 {
        unsafe iso9899_atoi(string)
    }

    /// Converts a string to a long.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.2 — The `atol` function
    ///
    /// - Parameter string: Pointer to null-terminated string.
    /// - Returns: The converted value.
    @inline(always)
    public static func toLong(_ string: UnsafePointer<CChar>) -> Int {
        unsafe iso9899_atol(string)
    }

    /// Converts a string to a long long.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.2 — The `atoll` function
    ///
    /// - Parameter string: Pointer to null-terminated string.
    /// - Returns: The converted value.
    @inline(always)
    public static func toLongLong(_ string: UnsafePointer<CChar>) -> Int64 {
        unsafe iso9899_atoll(string)
    }
}

// MARK: - Detailed Conversions (Section 7.22.1.3, 7.22.1.4)

extension ISO_9899.Stdlib.Conversion {
    /// Converts a string to a double with end pointer.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.3 — The `strtod` function
    ///
    /// - Parameter string: Pointer to null-terminated string.
    /// - Returns: Tuple of (converted value, pointer to first unconverted character).
    @inline(always)
    public static func parseDouble(
        _ string: UnsafePointer<CChar>
    ) -> (value: Double, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtod(string, &end)
        return unsafe (value, end)
    }

    /// Converts a string to a float with end pointer.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.3 — The `strtof` function
    ///
    /// - Parameter string: Pointer to null-terminated string.
    /// - Returns: Tuple of (converted value, pointer to first unconverted character).
    @inline(always)
    public static func parseFloat(
        _ string: UnsafePointer<CChar>
    ) -> (value: Float, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtof(string, &end)
        return unsafe (value, end)
    }

    /// Converts a string to a long with end pointer and base.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.4 — The `strtol` function
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string.
    ///   - base: Number base (0, or 2-36). 0 means auto-detect.
    /// - Returns: Tuple of (converted value, pointer to first unconverted character).
    @inline(always)
    public static func parseLong(
        _ string: UnsafePointer<CChar>,
        base: Int32 = 10
    ) -> (value: Int, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtol(string, &end, base)
        return unsafe (value, end)
    }

    /// Converts a string to a long long with end pointer and base.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.4 — The `strtoll` function
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string.
    ///   - base: Number base (0, or 2-36). 0 means auto-detect.
    /// - Returns: Tuple of (converted value, pointer to first unconverted character).
    @inline(always)
    public static func parseLongLong(
        _ string: UnsafePointer<CChar>,
        base: Int32 = 10
    ) -> (value: Int64, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtoll(string, &end, base)
        return unsafe (value, end)
    }

    /// Converts a string to an unsigned long with end pointer and base.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.4 — The `strtoul` function
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string.
    ///   - base: Number base (0, or 2-36). 0 means auto-detect.
    /// - Returns: Tuple of (converted value, pointer to first unconverted character).
    @inline(always)
    public static func parseUnsignedLong(
        _ string: UnsafePointer<CChar>,
        base: Int32 = 10
    ) -> (value: UInt, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtoul(string, &end, base)
        return unsafe (value, end)
    }

    /// Converts a string to an unsigned long long with end pointer and base.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.1.4 — The `strtoull` function
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string.
    ///   - base: Number base (0, or 2-36). 0 means auto-detect.
    /// - Returns: Tuple of (converted value, pointer to first unconverted character).
    @inline(always)
    public static func parseUnsignedLongLong(
        _ string: UnsafePointer<CChar>,
        base: Int32 = 10
    ) -> (value: UInt64, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtoull(string, &end, base)
        return unsafe (value, end)
    }
}
