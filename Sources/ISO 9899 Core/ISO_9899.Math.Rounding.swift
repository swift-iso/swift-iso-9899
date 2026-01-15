// ISO_9899.Math.Rounding.swift
// swift-iso-9899
//
// ISO/IEC 9899 Section 7.12.9 - Rounding functions
//
// IMPORTANT: These functions implement IEEE 754 roundToIntegral operations
// per ISO/IEC 9899 Annex F (IEC 60559 floating-point arithmetic compliance).
// Platform <math.h> is assumed to provide IEEE 754-compliant implementations.

import CISO9899Math

extension ISO_9899.Math {

    // MARK: - Section 7.12.9: Rounding functions

    /// 7.12.9.1: The ceil function
    ///
    /// Computes the smallest integer value not less than x (rounds toward positive infinity).
    ///
    /// Special values (per Annex F):
    /// - ceil(±0) returns ±0
    /// - ceil(±∞) returns ±∞
    /// - ceil(NaN) returns NaN
    ///
    /// This implements IEEE 754-2019 roundToIntegralTowardPositive.
    ///
    /// - Parameter x: A floating-point value
    /// - Returns: The smallest integer value not less than x, expressed as a floating-point number
    @inlinable
    public static func ceil(_ x: Double) -> Double {
        iso9899_ceil(x)
    }

    /// 7.12.9.1: The ceil function (float variant)
    ///
    /// Computes the smallest integer value not less than x (rounds toward positive infinity).
    ///
    /// - Parameter x: A floating-point value
    /// - Returns: The smallest integer value not less than x, expressed as a floating-point number
    @inlinable
    public static func ceil(_ x: Float) -> Float {
        iso9899_ceilf(x)
    }

    /// 7.12.9.2: The floor function
    ///
    /// Computes the largest integer value not greater than x (rounds toward negative infinity).
    ///
    /// Special values (per Annex F):
    /// - floor(±0) returns ±0
    /// - floor(±∞) returns ±∞
    /// - floor(NaN) returns NaN
    ///
    /// This implements IEEE 754-2019 roundToIntegralTowardNegative.
    ///
    /// - Parameter x: A floating-point value
    /// - Returns: The largest integer value not greater than x, expressed as a floating-point number
    @inlinable
    public static func floor(_ x: Double) -> Double {
        iso9899_floor(x)
    }

    /// 7.12.9.2: The floor function (float variant)
    ///
    /// Computes the largest integer value not greater than x (rounds toward negative infinity).
    ///
    /// - Parameter x: A floating-point value
    /// - Returns: The largest integer value not greater than x, expressed as a floating-point number
    @inlinable
    public static func floor(_ x: Float) -> Float {
        iso9899_floorf(x)
    }

    /// 7.12.9.6: The round function
    ///
    /// Rounds x to the nearest integer value in floating-point format.
    /// Halfway cases are rounded away from zero.
    ///
    /// Special values (per Annex F):
    /// - round(±0) returns ±0
    /// - round(±∞) returns ±∞
    /// - round(NaN) returns NaN
    ///
    /// This implements IEEE 754-2019 roundToIntegralTiesToAway.
    ///
    /// Note: This differs from IEEE 754's default rounding mode (roundTiesToEven).
    /// The round() function always rounds halfway cases away from zero, regardless
    /// of the current rounding mode.
    ///
    /// - Parameter x: A floating-point value
    /// - Returns: The nearest integer value, with halfway cases rounded away from zero
    @inlinable
    public static func round(_ x: Double) -> Double {
        iso9899_round(x)
    }

    /// 7.12.9.6: The round function (float variant)
    ///
    /// Rounds x to the nearest integer value in floating-point format.
    /// Halfway cases are rounded away from zero.
    ///
    /// - Parameter x: A floating-point value
    /// - Returns: The nearest integer value, with halfway cases rounded away from zero
    @inlinable
    public static func round(_ x: Float) -> Float {
        iso9899_roundf(x)
    }

    /// 7.12.9.8: The trunc function
    ///
    /// Rounds x to the integer value nearest to but no greater in magnitude than x
    /// (rounds toward zero).
    ///
    /// Special values (per Annex F):
    /// - trunc(±0) returns ±0
    /// - trunc(±∞) returns ±∞
    /// - trunc(NaN) returns NaN
    ///
    /// This implements IEEE 754-2019 roundToIntegralTowardZero.
    ///
    /// - Parameter x: A floating-point value
    /// - Returns: The integer value nearest to but no greater in magnitude than x
    @inlinable
    public static func trunc(_ x: Double) -> Double {
        iso9899_trunc(x)
    }

    /// 7.12.9.8: The trunc function (float variant)
    ///
    /// Rounds x to the integer value nearest to but no greater in magnitude than x
    /// (rounds toward zero).
    ///
    /// - Parameter x: A floating-point value
    /// - Returns: The integer value nearest to but no greater in magnitude than x
    @inlinable
    public static func trunc(_ x: Float) -> Float {
        iso9899_truncf(x)
    }
}
