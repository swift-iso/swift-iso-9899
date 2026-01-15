//
//  ISO_9899.Math.Exponential.swift
//  swift-iso-9899
//
//  Exponential and logarithmic functions (ISO/IEC 9899 Section 7.12.6)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Exponential functions (Section 7.12.6)

    /// Compute exponential (e raised to the power x)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.1
    ///
    /// The exp functions compute the base-e exponential of x. A range error occurs if the
    /// magnitude of x is too large.
    ///
    /// - Parameter x: The exponent
    /// - Returns: The value of e raised to the power x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.exp(1.0)  // e (≈ 2.71828)
    /// let result2 = ISO_9899.Math.exp(0.0) // 1.0
    /// ```
    @inline(__always)
    public static func exp(_ x: Double) -> Double {
        return iso9899_exp(x)
    }

    /// Compute exponential (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.1
    ///
    /// - Parameter x: The exponent
    /// - Returns: The value of e raised to the power x
    @inline(__always)
    public static func exp(_ x: Float) -> Float {
        return iso9899_expf(x)
    }

    /// Compute 2 raised to the power x
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.3
    ///
    /// The exp2 functions compute the base-2 exponential of x. A range error occurs if the
    /// magnitude of x is too large.
    ///
    /// - Parameter x: The exponent
    /// - Returns: The value of 2 raised to the power x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.exp2(10.0)  // 1024.0
    /// let result2 = ISO_9899.Math.exp2(0.0)  // 1.0
    /// ```
    @inline(__always)
    public static func exp2(_ x: Double) -> Double {
        return iso9899_exp2(x)
    }

    /// Compute 2 raised to the power x (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.3
    ///
    /// - Parameter x: The exponent
    /// - Returns: The value of 2 raised to the power x
    @inline(__always)
    public static func exp2(_ x: Float) -> Float {
        return iso9899_exp2f(x)
    }

    // MARK: - Logarithmic functions (Section 7.12.6)

    /// Compute natural logarithm (base e)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.7
    ///
    /// The log functions compute the base-e (natural) logarithm of x. A domain error occurs
    /// if the argument is negative. A pole error may occur if the argument is zero.
    ///
    /// - Parameter x: The value (must be positive)
    /// - Returns: The natural logarithm of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.log(2.71828)  // ≈ 1.0
    /// let result2 = ISO_9899.Math.log(1.0)     // 0.0
    /// ```
    @inline(__always)
    public static func log(_ x: Double) -> Double {
        return iso9899_log(x)
    }

    /// Compute natural logarithm (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.7
    ///
    /// - Parameter x: The value (must be positive)
    /// - Returns: The natural logarithm of x
    @inline(__always)
    public static func log(_ x: Float) -> Float {
        return iso9899_logf(x)
    }

    /// Compute base-2 logarithm
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.9
    ///
    /// The log2 functions compute the base-2 logarithm of x. A domain error occurs if the
    /// argument is negative. A pole error may occur if the argument is zero.
    ///
    /// - Parameter x: The value (must be positive)
    /// - Returns: The base-2 logarithm of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.log2(1024.0)  // 10.0
    /// let result2 = ISO_9899.Math.log2(2.0)    // 1.0
    /// ```
    @inline(__always)
    public static func log2(_ x: Double) -> Double {
        return iso9899_log2(x)
    }

    /// Compute base-2 logarithm (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.9
    ///
    /// - Parameter x: The value (must be positive)
    /// - Returns: The base-2 logarithm of x
    @inline(__always)
    public static func log2(_ x: Float) -> Float {
        return iso9899_log2f(x)
    }

    /// Compute base-10 logarithm
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.8
    ///
    /// The log10 functions compute the base-10 (common) logarithm of x. A domain error occurs
    /// if the argument is negative. A pole error may occur if the argument is zero.
    ///
    /// - Parameter x: The value (must be positive)
    /// - Returns: The base-10 logarithm of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.log10(1000.0)  // 3.0
    /// let result2 = ISO_9899.Math.log10(10.0)   // 1.0
    /// ```
    @inline(__always)
    public static func log10(_ x: Double) -> Double {
        return iso9899_log10(x)
    }

    /// Compute base-10 logarithm (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.8
    ///
    /// - Parameter x: The value (must be positive)
    /// - Returns: The base-10 logarithm of x
    @inline(__always)
    public static func log10(_ x: Float) -> Float {
        return iso9899_log10f(x)
    }

    /// Compute exp(x) - 1
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.2
    ///
    /// The expm1 functions compute the base-e exponential of the argument, minus 1.
    /// A range error occurs if x is too large.
    ///
    /// This function is more accurate than computing exp(x) - 1 when x is near zero.
    ///
    /// - Parameter x: The value
    /// - Returns: The value of e^x - 1
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.expm1(0.0)      // 0.0
    /// let result2 = ISO_9899.Math.expm1(0.0001)  // 0.00010000500... (accurate for small x)
    /// ```
    @inline(__always)
    public static func expm1(_ x: Double) -> Double {
        return iso9899_expm1(x)
    }

    /// Compute exp(x) - 1 (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.2
    ///
    /// - Parameter x: The value
    /// - Returns: The value of e^x - 1
    @inline(__always)
    public static func expm1(_ x: Float) -> Float {
        return iso9899_expm1f(x)
    }

    /// Compute log(1 + x)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.6
    ///
    /// The log1p functions compute the base-e (natural) logarithm of 1 plus the argument.
    /// A domain error occurs if the argument is less than −1. A pole error may occur if
    /// the argument equals −1. A range error may occur.
    ///
    /// This function is more accurate than computing log(1 + x) when x is near zero.
    ///
    /// - Parameter x: The value (must be > -1)
    /// - Returns: The natural logarithm of (1 + x)
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.log1p(0.0)      // 0.0
    /// let result2 = ISO_9899.Math.log1p(0.0001)  // 0.00009999500... (accurate for small x)
    /// ```
    @inline(__always)
    public static func log1p(_ x: Double) -> Double {
        return iso9899_log1p(x)
    }

    /// Compute log(1 + x) (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.6.6
    ///
    /// - Parameter x: The value (must be > -1)
    /// - Returns: The natural logarithm of (1 + x)
    @inline(__always)
    public static func log1p(_ x: Float) -> Float {
        return iso9899_log1pf(x)
    }
}
