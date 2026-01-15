//
//  ISO_9899.Math.Trigonometric.swift
//  swift-iso-9899
//
//  Trigonometric functions (ISO/IEC 9899 Section 7.12.4)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Trigonometric functions (Section 7.12.4)

    /// Compute sine
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.6
    ///
    /// The sin functions compute the sine of x (measured in radians).
    ///
    /// - Parameter x: The angle in radians
    /// - Returns: The sine of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.sin(.pi / 2)  // 1.0
    /// let angle = ISO_9899.Math.sin(30 * .pi / 180)  // 0.5 (30 degrees)
    /// ```
    @inline(__always)
    public static func sin(_ x: Double) -> Double {
        return iso9899_sin(x)
    }

    /// Compute sine (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.6
    ///
    /// - Parameter x: The angle in radians
    /// - Returns: The sine of x
    @inline(__always)
    public static func sin(_ x: Float) -> Float {
        return iso9899_sinf(x)
    }

    /// Compute cosine
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.5
    ///
    /// The cos functions compute the cosine of x (measured in radians).
    ///
    /// - Parameter x: The angle in radians
    /// - Returns: The cosine of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.cos(0)  // 1.0
    /// let angle = ISO_9899.Math.cos(60 * .pi / 180)  // 0.5 (60 degrees)
    /// ```
    @inline(__always)
    public static func cos(_ x: Double) -> Double {
        return iso9899_cos(x)
    }

    /// Compute cosine (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.5
    ///
    /// - Parameter x: The angle in radians
    /// - Returns: The cosine of x
    @inline(__always)
    public static func cos(_ x: Float) -> Float {
        return iso9899_cosf(x)
    }

    /// Compute tangent
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.7
    ///
    /// The tan functions compute the tangent of x (measured in radians).
    ///
    /// - Parameter x: The angle in radians
    /// - Returns: The tangent of x
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.tan(.pi / 4)  // 1.0 (45 degrees)
    /// ```
    @inline(__always)
    public static func tan(_ x: Double) -> Double {
        return iso9899_tan(x)
    }

    /// Compute tangent (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.7
    ///
    /// - Parameter x: The angle in radians
    /// - Returns: The tangent of x
    @inline(__always)
    public static func tan(_ x: Float) -> Float {
        return iso9899_tanf(x)
    }

    // MARK: - Inverse trigonometric functions (Section 7.12.4)

    /// Compute arc sine
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.2
    ///
    /// The asin functions compute the principal value of the arc sine of x.
    /// A domain error occurs for arguments not in the interval [−1, +1].
    ///
    /// - Parameter x: The value (must be in range [-1, 1])
    /// - Returns: The arc sine of x in radians, in the range [−π/2, +π/2]
    @inline(__always)
    public static func asin(_ x: Double) -> Double {
        return iso9899_asin(x)
    }

    /// Compute arc sine (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.2
    ///
    /// - Parameter x: The value (must be in range [-1, 1])
    /// - Returns: The arc sine of x in radians
    @inline(__always)
    public static func asin(_ x: Float) -> Float {
        return iso9899_asinf(x)
    }

    /// Compute arc cosine
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.1
    ///
    /// The acos functions compute the principal value of the arc cosine of x.
    /// A domain error occurs for arguments not in the interval [−1, +1].
    ///
    /// - Parameter x: The value (must be in range [-1, 1])
    /// - Returns: The arc cosine of x in radians, in the range [0, +π]
    @inline(__always)
    public static func acos(_ x: Double) -> Double {
        return iso9899_acos(x)
    }

    /// Compute arc cosine (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.1
    ///
    /// - Parameter x: The value (must be in range [-1, 1])
    /// - Returns: The arc cosine of x in radians
    @inline(__always)
    public static func acos(_ x: Float) -> Float {
        return iso9899_acosf(x)
    }

    /// Compute arc tangent
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.3
    ///
    /// The atan functions compute the principal value of the arc tangent of x.
    ///
    /// - Parameter x: The value
    /// - Returns: The arc tangent of x in radians, in the range [−π/2, +π/2]
    @inline(__always)
    public static func atan(_ x: Double) -> Double {
        return iso9899_atan(x)
    }

    /// Compute arc tangent (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.3
    ///
    /// - Parameter x: The value
    /// - Returns: The arc tangent of x in radians
    @inline(__always)
    public static func atan(_ x: Float) -> Float {
        return iso9899_atanf(x)
    }

    /// Compute arc tangent of y/x
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.4
    ///
    /// The atan2 functions compute the value of the arc tangent of y/x, using the signs of both
    /// arguments to determine the quadrant of the return value. A domain error may occur if both
    /// arguments are zero.
    ///
    /// - Parameters:
    ///   - y: The y coordinate
    ///   - x: The x coordinate
    /// - Returns: The arc tangent of y/x in radians, in the range [−π, +π]
    @inline(__always)
    public static func atan2(_ y: Double, _ x: Double) -> Double {
        return iso9899_atan2(y, x)
    }

    /// Compute arc tangent of y/x (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.4.4
    ///
    /// - Parameters:
    ///   - y: The y coordinate
    ///   - x: The x coordinate
    /// - Returns: The arc tangent of y/x in radians
    @inline(__always)
    public static func atan2(_ y: Float, _ x: Float) -> Float {
        return iso9899_atan2f(y, x)
    }
}
