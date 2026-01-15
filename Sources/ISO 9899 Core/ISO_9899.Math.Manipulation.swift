//
//  ISO_9899.Math.Manipulation.swift
//  swift-iso-9899
//
//  Manipulation functions (ISO/IEC 9899 Section 7.12.11)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Manipulation functions (Section 7.12.11)

    /// Copy sign of one value to another
    ///
    /// ISO/IEC 9899:2018 Section 7.12.11.1
    ///
    /// The copysign functions produce a value with the magnitude of x and the sign of y.
    /// They produce a NaN (with the sign of y) if x is a NaN. On implementations that
    /// represent a signed zero but do not treat negative zero consistently in arithmetic
    /// operations, the copysign functions regard the sign of zero as positive.
    ///
    /// - Parameters:
    ///   - x: The value providing the magnitude
    ///   - y: The value providing the sign
    /// - Returns: A value with magnitude of x and sign of y
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.copysign(5.0, -1.0)   // -5.0
    /// let result2 = ISO_9899.Math.copysign(-3.0, 2.0)  // 3.0
    /// ```
    @inline(__always)
    public static func copysign(_ x: Double, _ y: Double) -> Double {
        return iso9899_copysign(x, y)
    }

    /// Copy sign of one value to another (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.11.1
    ///
    /// - Parameters:
    ///   - x: The value providing the magnitude
    ///   - y: The value providing the sign
    /// - Returns: A value with magnitude of x and sign of y
    @inline(__always)
    public static func copysign(_ x: Float, _ y: Float) -> Float {
        return iso9899_copysignf(x, y)
    }

    /// Create a quiet NaN with optional payload
    ///
    /// ISO/IEC 9899:2018 Section 7.12.11.2
    ///
    /// The nan functions return a quiet NaN, if available, with content indicated through
    /// tagp. If the implementation does not support quiet NaNs, the functions return zero.
    ///
    /// - Parameter tag: Optional string tag for NaN payload
    /// - Returns: A quiet NaN value
    @inline(__always)
    public static func nan(_ tag: UnsafePointer<CChar>) -> Double {
        return iso9899_nan(tag)
    }

    /// Create a quiet NaN with optional payload (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.11.2
    ///
    /// - Parameter tag: Optional string tag for NaN payload
    /// - Returns: A quiet NaN value
    @inline(__always)
    public static func nanf(_ tag: UnsafePointer<CChar>) -> Float {
        return iso9899_nanf(tag)
    }

    /// Get next representable floating-point value
    ///
    /// ISO/IEC 9899:2018 Section 7.12.11.3
    ///
    /// The nextafter functions determine the next representable value, in the type of the
    /// function, after x in the direction of y, where x and y are first converted to the
    /// type of the function. The nextafter functions return y if x equals y.
    ///
    /// - Parameters:
    ///   - x: The starting value
    ///   - y: The direction value
    /// - Returns: The next representable value after x toward y
    ///
    /// ## Example
    /// ```swift
    /// let next = ISO_9899.Math.nextafter(1.0, 2.0)  // Next Double after 1.0 toward 2.0
    /// ```
    @inline(__always)
    public static func nextafter(_ x: Double, _ y: Double) -> Double {
        return iso9899_nextafter(x, y)
    }

    /// Get next representable floating-point value (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.11.3
    ///
    /// - Parameters:
    ///   - x: The starting value
    ///   - y: The direction value
    /// - Returns: The next representable value after x toward y
    @inline(__always)
    public static func nextafter(_ x: Float, _ y: Float) -> Float {
        return iso9899_nextafterf(x, y)
    }

    /// Get next representable value toward long double
    ///
    /// ISO/IEC 9899:2018 Section 7.12.11.4
    ///
    /// The nexttoward functions are equivalent to the nextafter functions except that
    /// the second parameter has type long double and the functions return y converted
    /// to the type of the function if x equals y.
    ///
    /// - Parameters:
    ///   - x: The starting value
    ///   - y: The direction value (long double)
    /// - Returns: The next representable value after x toward y
    @inline(__always)
    public static func nexttoward(_ x: Double, _ y: Double) -> Double {
        return iso9899_nexttoward(x, y)
    }

    /// Get next representable value toward long double (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.11.4
    ///
    /// - Parameters:
    ///   - x: The starting value
    ///   - y: The direction value (long double)
    /// - Returns: The next representable value after x toward y
    @inline(__always)
    public static func nexttoward(_ x: Float, _ y: Double) -> Float {
        return iso9899_nexttowardf(x, y)
    }
}
