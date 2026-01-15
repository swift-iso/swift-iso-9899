//
//  ISO_9899.Math.Rounding.Additional.swift
//  swift-iso-9899
//
//  Additional rounding and nearest integer functions (ISO/IEC 9899 Section 7.12.9)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Nearest integer floating functions (Section 7.12.9)

    /// Round to nearest integer using current rounding direction
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.6
    ///
    /// The rint functions differ from the nearbyint functions only in that the rint
    /// functions may raise the inexact floating-point exception if the result differs
    /// in value from the argument.
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a floating-point number
    @inline(__always)
    public static func rint(_ x: Double) -> Double {
        return iso9899_rint(x)
    }

    /// Round to nearest integer using current rounding direction (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.6
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a floating-point number
    @inline(__always)
    public static func rint(_ x: Float) -> Float {
        return iso9899_rintf(x)
    }

    /// Round to nearest integer without raising inexact exception
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.4
    ///
    /// The nearbyint functions round their argument to an integer value in floating-point
    /// format, using the current rounding direction and without raising the inexact
    /// floating-point exception.
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a floating-point number
    @inline(__always)
    public static func nearbyint(_ x: Double) -> Double {
        return iso9899_nearbyint(x)
    }

    /// Round to nearest integer without raising inexact exception (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.4
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a floating-point number
    @inline(__always)
    public static func nearbyint(_ x: Float) -> Float {
        return iso9899_nearbyintf(x)
    }

    // MARK: - Nearest integer conversion functions (Section 7.12.9)

    /// Round to nearest integer and return as long
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.5
    ///
    /// The lrint functions round their argument to the nearest integer value, rounding
    /// according to the current rounding direction. If the rounded value is outside the
    /// range of the return type, the numeric result is unspecified and a domain error or
    /// range error may occur.
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a long integer
    @inline(__always)
    public static func lrint(_ x: Double) -> Int {
        return Int(iso9899_lrint(x))
    }

    /// Round to nearest integer and return as long (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.5
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a long integer
    @inline(__always)
    public static func lrint(_ x: Float) -> Int {
        return Int(iso9899_lrintf(x))
    }

    /// Round to nearest integer and return as long long
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.5
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a long long integer
    @inline(__always)
    public static func llrint(_ x: Double) -> Int64 {
        return iso9899_llrint(x)
    }

    /// Round to nearest integer and return as long long (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.5
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a long long integer
    @inline(__always)
    public static func llrint(_ x: Float) -> Int64 {
        return iso9899_llrintf(x)
    }

    /// Round to nearest integer (ties away from zero) and return as long
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.7
    ///
    /// The lround functions round their argument to the nearest integer value, rounding
    /// halfway cases away from zero, regardless of the current rounding direction.
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a long integer
    @inline(__always)
    public static func lround(_ x: Double) -> Int {
        return Int(iso9899_lround(x))
    }

    /// Round to nearest integer (ties away from zero) and return as long (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.7
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a long integer
    @inline(__always)
    public static func lround(_ x: Float) -> Int {
        return Int(iso9899_lroundf(x))
    }

    /// Round to nearest integer (ties away from zero) and return as long long
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.7
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a long long integer
    @inline(__always)
    public static func llround(_ x: Double) -> Int64 {
        return iso9899_llround(x)
    }

    /// Round to nearest integer (ties away from zero) and return as long long (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.9.7
    ///
    /// - Parameter x: The value to round
    /// - Returns: The rounded value as a long long integer
    @inline(__always)
    public static func llround(_ x: Float) -> Int64 {
        return iso9899_llroundf(x)
    }
}
