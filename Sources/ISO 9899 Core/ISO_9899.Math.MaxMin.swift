//
//  ISO_9899.Math.MaxMin.swift
//  swift-iso-9899
//
//  Maximum, minimum, positive difference, and fused multiply-add functions
//  (ISO/IEC 9899 Sections 7.12.12 and 7.12.13)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Maximum, minimum, and positive difference (Section 7.12.12)

    /// Compute positive difference
    ///
    /// ISO/IEC 9899:2018 Section 7.12.12.1
    ///
    /// The fdim functions determine the positive difference between their arguments:
    /// - x - y if x > y
    /// - +0 if x ≤ y
    ///
    /// A range error may occur.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: The positive difference between x and y
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.fdim(5.0, 3.0)   // 2.0
    /// let result2 = ISO_9899.Math.fdim(3.0, 5.0)  // 0.0
    /// ```
    @inline(__always)
    public static func fdim(_ x: Double, _ y: Double) -> Double {
        return iso9899_fdim(x, y)
    }

    /// Compute positive difference (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.12.1
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: The positive difference between x and y
    @inline(__always)
    public static func fdim(_ x: Float, _ y: Float) -> Float {
        return iso9899_fdimf(x, y)
    }

    /// Determine maximum value
    ///
    /// ISO/IEC 9899:2018 Section 7.12.12.2
    ///
    /// The fmax functions determine the maximum numeric value of their arguments.
    /// If one argument is a NaN, the fmax functions return the other argument.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: The maximum of x and y
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.fmax(5.0, 3.0)   // 5.0
    /// let result2 = ISO_9899.Math.fmax(3.0, 5.0)  // 5.0
    /// ```
    @inline(__always)
    public static func fmax(_ x: Double, _ y: Double) -> Double {
        return iso9899_fmax(x, y)
    }

    /// Determine maximum value (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.12.2
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: The maximum of x and y
    @inline(__always)
    public static func fmax(_ x: Float, _ y: Float) -> Float {
        return iso9899_fmaxf(x, y)
    }

    /// Determine minimum value
    ///
    /// ISO/IEC 9899:2018 Section 7.12.12.3
    ///
    /// The fmin functions determine the minimum numeric value of their arguments.
    /// If one argument is a NaN, the fmin functions return the other argument.
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: The minimum of x and y
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.fmin(5.0, 3.0)   // 3.0
    /// let result2 = ISO_9899.Math.fmin(3.0, 5.0)  // 3.0
    /// ```
    @inline(__always)
    public static func fmin(_ x: Double, _ y: Double) -> Double {
        return iso9899_fmin(x, y)
    }

    /// Determine minimum value (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.12.3
    ///
    /// - Parameters:
    ///   - x: First value
    ///   - y: Second value
    /// - Returns: The minimum of x and y
    @inline(__always)
    public static func fmin(_ x: Float, _ y: Float) -> Float {
        return iso9899_fminf(x, y)
    }

    // MARK: - Floating multiply-add (Section 7.12.13)

    /// Compute (x × y) + z as single ternary operation
    ///
    /// ISO/IEC 9899:2018 Section 7.12.13.1
    ///
    /// The fma functions compute (x × y) + z, rounded as one ternary operation: they compute
    /// the value (as if) to infinite precision and round once to the result format, according
    /// to the current rounding mode. A range error may occur.
    ///
    /// This operation is more accurate than performing the multiplication and addition separately.
    ///
    /// - Parameters:
    ///   - x: First multiplicand
    ///   - y: Second multiplicand
    ///   - z: Addend
    /// - Returns: The value of (x × y) + z, computed with only one rounding
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.fma(2.0, 3.0, 4.0)  // 10.0 (more accurate than 2*3+4)
    /// ```
    @inline(__always)
    public static func fma(_ x: Double, _ y: Double, _ z: Double) -> Double {
        return iso9899_fma(x, y, z)
    }

    /// Compute (x × y) + z as single ternary operation (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.13.1
    ///
    /// - Parameters:
    ///   - x: First multiplicand
    ///   - y: Second multiplicand
    ///   - z: Addend
    /// - Returns: The value of (x × y) + z, computed with only one rounding
    @inline(__always)
    public static func fma(_ x: Float, _ y: Float, _ z: Float) -> Float {
        return iso9899_fmaf(x, y, z)
    }
}
