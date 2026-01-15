//
//  ISO_9899.Math.AbsoluteValue.swift
//  swift-iso-9899
//
//  Additional power and absolute-value functions (ISO/IEC 9899 Section 7.12.7)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Absolute value functions (Section 7.12.7)

    /// Compute absolute value
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.2
    ///
    /// The fabs functions compute the absolute value of a floating-point number x.
    ///
    /// - Parameter x: The value
    /// - Returns: The absolute value of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.fabs(-3.14)  // 3.14
    /// let result2 = ISO_9899.Math.fabs(2.5)   // 2.5
    /// ```
    @inline(__always)
    public static func fabs(_ x: Double) -> Double {
        return iso9899_fabs(x)
    }

    /// Compute absolute value (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.2
    ///
    /// - Parameter x: The value
    /// - Returns: The absolute value of x
    @inline(__always)
    public static func fabs(_ x: Float) -> Float {
        return iso9899_fabsf(x)
    }

    // MARK: - Additional power functions (Section 7.12.7)

    /// Compute Euclidean distance (sqrt(x² + y²))
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.3
    ///
    /// The hypot functions compute the square root of the sum of the squares of x and y,
    /// without undue overflow or underflow. A range error may occur.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: The value of sqrt(x² + y²)
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.hypot(3.0, 4.0)  // 5.0
    /// let distance = ISO_9899.Math.hypot(dx, dy)  // Euclidean distance
    /// ```
    @inline(__always)
    public static func hypot(_ x: Double, _ y: Double) -> Double {
        return iso9899_hypot(x, y)
    }

    /// Compute Euclidean distance (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.3
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: The value of sqrt(x² + y²)
    @inline(__always)
    public static func hypot(_ x: Float, _ y: Float) -> Float {
        return iso9899_hypotf(x, y)
    }

    /// Compute cube root
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.1
    ///
    /// The cbrt functions compute the real cube root of x.
    ///
    /// - Parameter x: The value
    /// - Returns: The cube root of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.cbrt(8.0)   // 2.0
    /// let result2 = ISO_9899.Math.cbrt(27.0) // 3.0
    /// let result3 = ISO_9899.Math.cbrt(-8.0) // -2.0
    /// ```
    @inline(__always)
    public static func cbrt(_ x: Double) -> Double {
        return iso9899_cbrt(x)
    }

    /// Compute cube root (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.7.1
    ///
    /// - Parameter x: The value
    /// - Returns: The cube root of x
    @inline(__always)
    public static func cbrt(_ x: Float) -> Float {
        return iso9899_cbrtf(x)
    }
}
