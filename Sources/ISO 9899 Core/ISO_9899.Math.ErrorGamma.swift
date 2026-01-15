//
//  ISO_9899.Math.ErrorGamma.swift
//  swift-iso-9899
//
//  Error and gamma functions (ISO/IEC 9899 Section 7.12.8)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Error functions (Section 7.12.8)

    /// Compute error function
    ///
    /// ISO/IEC 9899:2018 Section 7.12.8.1
    ///
    /// The erf functions compute the error function of x.
    ///
    /// - Parameter x: The value
    /// - Returns: The error function of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.erf(0.0)  // 0.0
    /// let result2 = ISO_9899.Math.erf(1.0) // 0.84270079...
    /// ```
    @inline(__always)
    public static func erf(_ x: Double) -> Double {
        return iso9899_erf(x)
    }

    /// Compute error function (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.8.1
    ///
    /// - Parameter x: The value
    /// - Returns: The error function of x
    @inline(__always)
    public static func erf(_ x: Float) -> Float {
        return iso9899_erff(x)
    }

    /// Compute complementary error function
    ///
    /// ISO/IEC 9899:2018 Section 7.12.8.2
    ///
    /// The erfc functions compute the complementary error function of x.
    /// A range error occurs if x is too large.
    ///
    /// - Parameter x: The value
    /// - Returns: The complementary error function of x (1 - erf(x))
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.erfc(0.0)  // 1.0
    /// let result2 = ISO_9899.Math.erfc(1.0) // 0.15729920...
    /// ```
    @inline(__always)
    public static func erfc(_ x: Double) -> Double {
        return iso9899_erfc(x)
    }

    /// Compute complementary error function (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.8.2
    ///
    /// - Parameter x: The value
    /// - Returns: The complementary error function of x
    @inline(__always)
    public static func erfc(_ x: Float) -> Float {
        return iso9899_erfcf(x)
    }

    // MARK: - Gamma functions (Section 7.12.8)

    /// Compute gamma function
    ///
    /// ISO/IEC 9899:2018 Section 7.12.8.4
    ///
    /// The tgamma functions compute the gamma function of x.
    /// A domain error or pole error may occur if x is a negative integer or zero.
    /// A range error occurs if the magnitude of x is too large or too small.
    ///
    /// - Parameter x: The value
    /// - Returns: The gamma function of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.tgamma(1.0)  // 1.0
    /// let result2 = ISO_9899.Math.tgamma(5.0) // 24.0 (4!)
    /// ```
    @inline(__always)
    public static func tgamma(_ x: Double) -> Double {
        return iso9899_tgamma(x)
    }

    /// Compute gamma function (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.8.4
    ///
    /// - Parameter x: The value
    /// - Returns: The gamma function of x
    @inline(__always)
    public static func tgamma(_ x: Float) -> Float {
        return iso9899_tgammaf(x)
    }

    /// Compute natural logarithm of gamma function
    ///
    /// ISO/IEC 9899:2018 Section 7.12.8.3
    ///
    /// The lgamma functions compute the natural logarithm of the absolute value of
    /// gamma of x. A range error occurs if x is too large. A pole error may occur if
    /// x is a negative integer or zero.
    ///
    /// - Parameter x: The value
    /// - Returns: The natural logarithm of |gamma(x)|
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.lgamma(1.0)  // 0.0
    /// let result2 = ISO_9899.Math.lgamma(5.0) // 3.17805383... (log(24))
    /// ```
    @inline(__always)
    public static func lgamma(_ x: Double) -> Double {
        return iso9899_lgamma(x)
    }

    /// Compute natural logarithm of gamma function (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.8.3
    ///
    /// - Parameter x: The value
    /// - Returns: The natural logarithm of |gamma(x)|
    @inline(__always)
    public static func lgamma(_ x: Float) -> Float {
        return iso9899_lgammaf(x)
    }
}
