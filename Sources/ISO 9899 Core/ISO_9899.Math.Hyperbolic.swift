//
//  ISO_9899.Math.Hyperbolic.swift
//  swift-iso-9899
//
//  Hyperbolic functions (ISO/IEC 9899 Section 7.12.5)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Hyperbolic functions (Section 7.12.5)

    /// Compute hyperbolic sine
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.3
    ///
    /// The sinh functions compute the hyperbolic sine of x. A range error occurs if the
    /// magnitude of x is too large.
    ///
    /// - Parameter x: The value
    /// - Returns: The hyperbolic sine of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.sinh(0.0)  // 0.0
    /// let result2 = ISO_9899.Math.sinh(1.0) // 1.17520119...
    /// ```
    @inline(__always)
    public static func sinh(_ x: Double) -> Double {
        return iso9899_sinh(x)
    }

    /// Compute hyperbolic sine (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.3
    ///
    /// - Parameter x: The value
    /// - Returns: The hyperbolic sine of x
    @inline(__always)
    public static func sinh(_ x: Float) -> Float {
        return iso9899_sinhf(x)
    }

    /// Compute hyperbolic cosine
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.2
    ///
    /// The cosh functions compute the hyperbolic cosine of x. A range error occurs if the
    /// magnitude of x is too large.
    ///
    /// - Parameter x: The value
    /// - Returns: The hyperbolic cosine of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.cosh(0.0)  // 1.0
    /// let result2 = ISO_9899.Math.cosh(1.0) // 1.54308063...
    /// ```
    @inline(__always)
    public static func cosh(_ x: Double) -> Double {
        return iso9899_cosh(x)
    }

    /// Compute hyperbolic cosine (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.2
    ///
    /// - Parameter x: The value
    /// - Returns: The hyperbolic cosine of x
    @inline(__always)
    public static func cosh(_ x: Float) -> Float {
        return iso9899_coshf(x)
    }

    /// Compute hyperbolic tangent
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.4
    ///
    /// The tanh functions compute the hyperbolic tangent of x.
    ///
    /// - Parameter x: The value
    /// - Returns: The hyperbolic tangent of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.tanh(0.0)  // 0.0
    /// let result2 = ISO_9899.Math.tanh(1.0) // 0.76159415...
    /// ```
    @inline(__always)
    public static func tanh(_ x: Double) -> Double {
        return iso9899_tanh(x)
    }

    /// Compute hyperbolic tangent (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.4
    ///
    /// - Parameter x: The value
    /// - Returns: The hyperbolic tangent of x
    @inline(__always)
    public static func tanh(_ x: Float) -> Float {
        return iso9899_tanhf(x)
    }

    // MARK: - Inverse hyperbolic functions (Section 7.12.5)

    /// Compute inverse hyperbolic sine (arc hyperbolic sine)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.1
    ///
    /// The asinh functions compute the (principal) arc hyperbolic sine of x.
    ///
    /// - Parameter x: The value
    /// - Returns: The arc hyperbolic sine of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.asinh(0.0)  // 0.0
    /// let result2 = ISO_9899.Math.asinh(1.0) // 0.88137358...
    /// ```
    @inline(__always)
    public static func asinh(_ x: Double) -> Double {
        return iso9899_asinh(x)
    }

    /// Compute inverse hyperbolic sine (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.1
    ///
    /// - Parameter x: The value
    /// - Returns: The arc hyperbolic sine of x
    @inline(__always)
    public static func asinh(_ x: Float) -> Float {
        return iso9899_asinhf(x)
    }

    /// Compute inverse hyperbolic cosine (arc hyperbolic cosine)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.0
    ///
    /// The acosh functions compute the (nonnegative) arc hyperbolic cosine of x.
    /// A domain error occurs for arguments less than 1.
    ///
    /// - Parameter x: The value (must be >= 1)
    /// - Returns: The arc hyperbolic cosine of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.acosh(1.0)  // 0.0
    /// let result2 = ISO_9899.Math.acosh(2.0) // 1.31695789...
    /// ```
    @inline(__always)
    public static func acosh(_ x: Double) -> Double {
        return iso9899_acosh(x)
    }

    /// Compute inverse hyperbolic cosine (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.0
    ///
    /// - Parameter x: The value (must be >= 1)
    /// - Returns: The arc hyperbolic cosine of x
    @inline(__always)
    public static func acosh(_ x: Float) -> Float {
        return iso9899_acoshf(x)
    }

    /// Compute inverse hyperbolic tangent (arc hyperbolic tangent)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.0 (extended)
    ///
    /// The atanh functions compute the (principal) arc hyperbolic tangent of x.
    /// A domain error occurs for arguments not in the interval [−1, +1].
    /// A pole error may occur if the argument equals −1 or +1.
    ///
    /// - Parameter x: The value (must be in [-1, 1])
    /// - Returns: The arc hyperbolic tangent of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.atanh(0.0)  // 0.0
    /// let result2 = ISO_9899.Math.atanh(0.5) // 0.54930614...
    /// ```
    @inline(__always)
    public static func atanh(_ x: Double) -> Double {
        return iso9899_atanh(x)
    }

    /// Compute inverse hyperbolic tangent (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.5.0 (extended)
    ///
    /// - Parameter x: The value (must be in [-1, 1])
    /// - Returns: The arc hyperbolic tangent of x
    @inline(__always)
    public static func atanh(_ x: Float) -> Float {
        return iso9899_atanhf(x)
    }
}
