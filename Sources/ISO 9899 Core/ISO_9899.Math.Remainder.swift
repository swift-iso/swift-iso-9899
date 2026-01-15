//
//  ISO_9899.Math.Remainder.swift
//  swift-iso-9899
//
//  Remainder functions (ISO/IEC 9899 Section 7.12.10)
//

import CISO9899Math

extension ISO_9899.Math {
    // MARK: - Remainder functions (Section 7.12.10)

    /// Compute floating-point remainder
    ///
    /// ISO/IEC 9899:2018 Section 7.12.10.1
    ///
    /// The fmod functions compute the floating-point remainder of x/y.
    ///
    /// - Parameters:
    ///   - x: The dividend
    ///   - y: The divisor
    /// - Returns: The value x - n*y, for some integer n such that, if y is nonzero,
    ///            the result has the same sign as x and magnitude less than the magnitude of y
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.fmod(5.3, 2.0)   // 1.3
    /// let result2 = ISO_9899.Math.fmod(-5.3, 2.0) // -1.3
    /// ```
    @inline(__always)
    public static func fmod(_ x: Double, _ y: Double) -> Double {
        return iso9899_fmod(x, y)
    }

    /// Compute floating-point remainder (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.10.1
    ///
    /// - Parameters:
    ///   - x: The dividend
    ///   - y: The divisor
    /// - Returns: The floating-point remainder of x/y
    @inline(__always)
    public static func fmod(_ x: Float, _ y: Float) -> Float {
        return iso9899_fmodf(x, y)
    }

    /// Compute IEEE remainder
    ///
    /// ISO/IEC 9899:2018 Section 7.12.10.2
    ///
    /// The remainder functions compute the remainder x REM y required by IEC 60559.
    ///
    /// - Parameters:
    ///   - x: The dividend
    ///   - y: The divisor
    /// - Returns: The value x - n*y, where n is the integer nearest the exact value x/y.
    ///            When |n - x/y| = 1/2, n is chosen to be even
    ///
    /// ## Example
    /// ```swift
    /// let result = ISO_9899.Math.remainder(5.3, 2.0)  // 1.3 or -0.7 depending on rounding
    /// ```
    @inline(__always)
    public static func remainder(_ x: Double, _ y: Double) -> Double {
        return iso9899_remainder(x, y)
    }

    /// Compute IEEE remainder (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.10.2
    ///
    /// - Parameters:
    ///   - x: The dividend
    ///   - y: The divisor
    /// - Returns: The IEEE remainder of x/y
    @inline(__always)
    public static func remainder(_ x: Float, _ y: Float) -> Float {
        return iso9899_remainderf(x, y)
    }

    /// Compute remainder and quotient
    ///
    /// ISO/IEC 9899:2018 Section 7.12.10.3
    ///
    /// The remquo functions compute the same remainder as the remainder functions.
    /// In the object pointed to by quo, they store a value whose sign is the sign of x/y
    /// and whose magnitude is congruent modulo 2^n to the magnitude of the integral
    /// quotient of x/y, where n is an implementation-defined integer greater than or equal to 3.
    ///
    /// - Parameters:
    ///   - x: The dividend
    ///   - y: The divisor
    ///   - quo: Pointer to store the quotient bits
    /// - Returns: The remainder, with quotient stored in quo
    @inline(__always)
    public static func remquo(_ x: Double, _ y: Double, _ quo: UnsafeMutablePointer<Int32>) -> Double {
        return iso9899_remquo(x, y, quo)
    }

    /// Compute remainder and quotient (Float variant)
    ///
    /// ISO/IEC 9899:2018 Section 7.12.10.3
    ///
    /// - Parameters:
    ///   - x: The dividend
    ///   - y: The divisor
    ///   - quo: Pointer to store the quotient bits
    /// - Returns: The remainder, with quotient stored in quo
    @inline(__always)
    public static func remquo(_ x: Float, _ y: Float, _ quo: UnsafeMutablePointer<Int32>) -> Float {
        return iso9899_remquof(x, y, quo)
    }
}
