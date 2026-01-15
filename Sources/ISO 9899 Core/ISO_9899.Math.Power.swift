//
//  ISO_9899.Math.Power.swift
//  swift-iso-9899
//
//  Power and absolute-value functions (ISO/IEC 9899 Section 7.12.7)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Power functions (Section 7.12.7)

    /// Compute x raised to the power y
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.4
    ///
    /// The pow functions compute x raised to the power y. A domain error occurs if x is finite
    /// and negative and y is finite and not an integer value. A range error may occur.
    /// A domain error may occur if x is zero and y is zero. A domain error or pole error may
    /// occur if x is zero and y is less than zero.
    ///
    /// - Parameters:
    ///   - x: The base value
    ///   - y: The exponent
    /// - Returns: The value of x raised to the power y
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.pow(2.0, 3.0)  // 8.0
    /// let gamma = ISO_9899.Math.pow(c, 1.0/2.4)  // Gamma correction
    /// ```
    @inline(__always)
    public static func pow(_ x: Double, _ y: Double) -> Double {
        return iso9899_pow(x, y)
    }

    /// Compute x raised to the power y (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.4
    ///
    /// - Parameters:
    ///   - x: The base value
    ///   - y: The exponent
    /// - Returns: The value of x raised to the power y
    @inline(__always)
    public static func pow(_ x: Float, _ y: Float) -> Float {
        return iso9899_powf(x, y)
    }

    /// Compute square root
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.5
    ///
    /// The sqrt functions compute the nonnegative square root of x.
    /// A domain error occurs if the argument is less than zero.
    ///
    /// - Parameter x: The value
    /// - Returns: The square root of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.sqrt(16.0)  // 4.0
    /// ```
    @inline(__always)
    public static func sqrt(_ x: Double) -> Double {
        return iso9899_sqrt(x)
    }

    /// Compute square root (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.5
    ///
    /// - Parameter x: The value
    /// - Returns: The square root of x
    @inline(__always)
    public static func sqrt(_ x: Float) -> Float {
        return iso9899_sqrtf(x)
    }
}
