//
//  ISO_9899.Math.Comparison.swift
//  swift-iso-9899
//
//  Comparison macros (ISO/IEC 9899 Section 7.12.14)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Comparison macros (Section 7.12.14)

    /// Determine whether x > y (quiet comparison)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.1
    ///
    /// The isgreater macro determines whether its first argument is greater than its
    /// second argument. The value of isgreater(x, y) is always equal to (x) > (y);
    /// however, unlike (x) > (y), isgreater(x, y) does not raise the invalid
    /// floating-point exception when x and y are unordered.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x > y (and neither is NaN)
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.isgreater(5.0, 3.0)      // true
    /// ISO_9899.Math.isgreater(3.0, 5.0)      // false
    /// ISO_9899.Math.isgreater(.nan, 5.0)     // false (no exception)
    /// ```
    @inline(__always)
    public static func isgreater(_ x: Double, _ y: Double) -> Bool {
        return iso9899_isgreater_d(x, y) != 0
    }

    /// Determine whether x > y (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.1
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x > y (and neither is NaN)
    @inline(__always)
    public static func isgreater(_ x: Float, _ y: Float) -> Bool {
        return iso9899_isgreater_f(x, y) != 0
    }

    /// Determine whether x >= y (quiet comparison)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.2
    ///
    /// The isgreaterequal macro determines whether its first argument is greater than or
    /// equal to its second argument. The value of isgreaterequal(x, y) is always equal to
    /// (x) >= (y); however, unlike (x) >= (y), isgreaterequal(x, y) does not raise the
    /// invalid floating-point exception when x and y are unordered.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x >= y (and neither is NaN)
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.isgreaterequal(5.0, 5.0) // true
    /// ISO_9899.Math.isgreaterequal(5.0, 3.0) // true
    /// ISO_9899.Math.isgreaterequal(3.0, 5.0) // false
    /// ```
    @inline(__always)
    public static func isgreaterequal(_ x: Double, _ y: Double) -> Bool {
        return iso9899_isgreaterequal_d(x, y) != 0
    }

    /// Determine whether x >= y (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.2
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x >= y (and neither is NaN)
    @inline(__always)
    public static func isgreaterequal(_ x: Float, _ y: Float) -> Bool {
        return iso9899_isgreaterequal_f(x, y) != 0
    }

    /// Determine whether x < y (quiet comparison)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.3
    ///
    /// The isless macro determines whether its first argument is less than its second
    /// argument. The value of isless(x, y) is always equal to (x) < (y); however, unlike
    /// (x) < (y), isless(x, y) does not raise the invalid floating-point exception when
    /// x and y are unordered.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x < y (and neither is NaN)
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.isless(3.0, 5.0)         // true
    /// ISO_9899.Math.isless(5.0, 3.0)         // false
    /// ISO_9899.Math.isless(.nan, 5.0)        // false (no exception)
    /// ```
    @inline(__always)
    public static func isless(_ x: Double, _ y: Double) -> Bool {
        return iso9899_isless_d(x, y) != 0
    }

    /// Determine whether x < y (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.3
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x < y (and neither is NaN)
    @inline(__always)
    public static func isless(_ x: Float, _ y: Float) -> Bool {
        return iso9899_isless_f(x, y) != 0
    }

    /// Determine whether x <= y (quiet comparison)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.4
    ///
    /// The islessequal macro determines whether its first argument is less than or equal
    /// to its second argument. The value of islessequal(x, y) is always equal to
    /// (x) <= (y); however, unlike (x) <= (y), islessequal(x, y) does not raise the
    /// invalid floating-point exception when x and y are unordered.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x <= y (and neither is NaN)
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.islessequal(3.0, 3.0)    // true
    /// ISO_9899.Math.islessequal(3.0, 5.0)    // true
    /// ISO_9899.Math.islessequal(5.0, 3.0)    // false
    /// ```
    @inline(__always)
    public static func islessequal(_ x: Double, _ y: Double) -> Bool {
        return iso9899_islessequal_d(x, y) != 0
    }

    /// Determine whether x <= y (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.4
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x <= y (and neither is NaN)
    @inline(__always)
    public static func islessequal(_ x: Float, _ y: Float) -> Bool {
        return iso9899_islessequal_f(x, y) != 0
    }

    /// Determine whether x < y or x > y (quiet comparison)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.5
    ///
    /// The islessgreater macro determines whether its first argument is less than or
    /// greater than its second argument. The islessgreater(x, y) macro is similar to
    /// (x) < (y) || (x) > (y); however, islessgreater(x, y) does not raise the invalid
    /// floating-point exception when x and y are unordered (nor does it evaluate x and y
    /// twice).
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x < y or x > y (and neither is NaN)
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.islessgreater(3.0, 5.0)  // true (3 < 5)
    /// ISO_9899.Math.islessgreater(5.0, 3.0)  // true (5 > 3)
    /// ISO_9899.Math.islessgreater(3.0, 3.0)  // false (equal)
    /// ISO_9899.Math.islessgreater(.nan, 5.0) // false (unordered)
    /// ```
    @inline(__always)
    public static func islessgreater(_ x: Double, _ y: Double) -> Bool {
        return iso9899_islessgreater_d(x, y) != 0
    }

    /// Determine whether x < y or x > y (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.5
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x < y or x > y (and neither is NaN)
    @inline(__always)
    public static func islessgreater(_ x: Float, _ y: Float) -> Bool {
        return iso9899_islessgreater_f(x, y) != 0
    }

    /// Determine whether arguments are unordered
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.6
    ///
    /// The isunordered macro determines whether its arguments are unordered.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x or y is NaN
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.isunordered(.nan, 5.0)   // true
    /// ISO_9899.Math.isunordered(3.0, .nan)   // true
    /// ISO_9899.Math.isunordered(3.0, 5.0)    // false
    /// ```
    @inline(__always)
    public static func isunordered(_ x: Double, _ y: Double) -> Bool {
        return iso9899_isunordered_d(x, y) != 0
    }

    /// Determine whether arguments are unordered (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.14.6
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: True if x or y is NaN
    @inline(__always)
    public static func isunordered(_ x: Float, _ y: Float) -> Bool {
        return iso9899_isunordered_f(x, y) != 0
    }
}
