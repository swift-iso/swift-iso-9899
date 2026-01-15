//
//  ISO_9899.Math.Classification.swift
//  swift-iso-9899
//
//  Classification functions (ISO/IEC 9899 Section 7.12.3)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Classification functions (Section 7.12.3)

    /// Floating-point classification values
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3
    ///
    /// These values are returned by the `fpclassify` function to indicate
    /// the classification of a floating-point value.
    public enum FloatingPointClass: Int32 {
        /// Indicates a finite number that is neither zero, subnormal, nor infinite
        case normal = 0  // FP_NORMAL
        /// Indicates positive or negative zero
        case zero = 1  // FP_ZERO
        /// Indicates a subnormal (denormalized) number
        case subnormal = 2  // FP_SUBNORMAL
        /// Indicates positive or negative infinity
        case infinite = 3  // FP_INFINITE
        /// Indicates Not-a-Number (NaN)
        case nan = 4  // FP_NAN
    }

    /// Classify floating-point value
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.1
    ///
    /// The fpclassify macro classifies its argument value as NaN, infinite, normal,
    /// subnormal, zero, or into another implementation-defined category.
    ///
    /// - Parameter x: Value to classify
    /// - Returns: Classification of the value
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.fpclassify(0.0)        // .zero
    /// ISO_9899.Math.fpclassify(1.0)        // .normal
    /// ISO_9899.Math.fpclassify(.infinity)  // .infinite
    /// ISO_9899.Math.fpclassify(.nan)       // .nan
    /// ```
    @inline(__always)
    public static func fpclassify(_ x: Double) -> FloatingPointClass {
        _ = iso9899_fpclassify_d(x)
        // Map C macro values to our enum
        // Note: C constants vary by platform, so we use our Swift classification
        if x.isNaN {
            return .nan
        } else if x.isInfinite {
            return .infinite
        } else if x == 0 {
            return .zero
        } else if abs(x) < Double.leastNormalMagnitude {
            return .subnormal
        } else {
            return .normal
        }
    }

    /// Classify floating-point value (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.1
    ///
    /// - Parameter x: Value to classify
    /// - Returns: Classification of the value
    @inline(__always)
    public static func fpclassify(_ x: Float) -> FloatingPointClass {
        _ = iso9899_fpclassify_f(x)
        // Map C macro values to our enum
        if x.isNaN {
            return .nan
        } else if x.isInfinite {
            return .infinite
        } else if x == 0 {
            return .zero
        } else if abs(x) < Float.leastNormalMagnitude {
            return .subnormal
        } else {
            return .normal
        }
    }

    /// Test for finite value
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.2
    ///
    /// The isfinite macro determines whether its argument has a finite value
    /// (zero, subnormal, or normal, and not infinite or NaN).
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if x is finite (not infinite or NaN)
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.isfinite(1.0)        // true
    /// ISO_9899.Math.isfinite(.infinity)  // false
    /// ISO_9899.Math.isfinite(.nan)       // false
    /// ```
    @inline(__always)
    public static func isfinite(_ x: Double) -> Bool {
        return iso9899_isfinite_d(x) != 0
    }

    /// Test for finite value (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.2
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if x is finite (not infinite or NaN)
    @inline(__always)
    public static func isfinite(_ x: Float) -> Bool {
        return iso9899_isfinite_f(x) != 0
    }

    /// Test for infinity
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.3
    ///
    /// The isinf macro determines whether its argument value is an infinity
    /// (positive or negative).
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if x is positive or negative infinity
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.isinf(.infinity)   // true
    /// ISO_9899.Math.isinf(-.infinity)  // true
    /// ISO_9899.Math.isinf(1.0)         // false
    /// ```
    @inline(__always)
    public static func isinf(_ x: Double) -> Bool {
        return iso9899_isinf_d(x) != 0
    }

    /// Test for infinity (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.3
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if x is positive or negative infinity
    @inline(__always)
    public static func isinf(_ x: Float) -> Bool {
        return iso9899_isinf_f(x) != 0
    }

    /// Test for NaN
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.4
    ///
    /// The isnan macro determines whether its argument value is a NaN.
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if x is NaN
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.isnan(.nan)      // true
    /// ISO_9899.Math.isnan(0.0 / 0.0) // true
    /// ISO_9899.Math.isnan(1.0)       // false
    /// ```
    @inline(__always)
    public static func isnan(_ x: Double) -> Bool {
        return iso9899_isnan_d(x) != 0
    }

    /// Test for NaN (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.4
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if x is NaN
    @inline(__always)
    public static func isnan(_ x: Float) -> Bool {
        return iso9899_isnan_f(x) != 0
    }

    /// Test for normal value
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.5
    ///
    /// The isnormal macro determines whether its argument value is normal
    /// (not zero, subnormal, infinite, or NaN).
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if x is a normal value
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.isnormal(1.0)    // true
    /// ISO_9899.Math.isnormal(0.0)    // false
    /// ISO_9899.Math.isnormal(.nan)   // false
    /// ```
    @inline(__always)
    public static func isnormal(_ x: Double) -> Bool {
        return iso9899_isnormal_d(x) != 0
    }

    /// Test for normal value (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.5
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if x is a normal value
    @inline(__always)
    public static func isnormal(_ x: Float) -> Bool {
        return iso9899_isnormal_f(x) != 0
    }

    /// Test sign bit
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.6
    ///
    /// The signbit macro determines whether the sign of its argument value is negative.
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if the sign bit is set (negative)
    ///
    /// ## Example
    /// ```swift
    /// ISO_9899.Math.signbit(-1.0)   // true
    /// ISO_9899.Math.signbit(1.0)    // false
    /// ISO_9899.Math.signbit(-0.0)   // true
    /// ISO_9899.Math.signbit(0.0)    // false
    /// ```
    @inline(__always)
    public static func signbit(_ x: Double) -> Bool {
        return iso9899_signbit_d(x) != 0
    }

    /// Test sign bit (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.3.6
    ///
    /// - Parameter x: Value to test
    /// - Returns: True if the sign bit is set (negative)
    @inline(__always)
    public static func signbit(_ x: Float) -> Bool {
        return iso9899_signbit_f(x) != 0
    }
}
