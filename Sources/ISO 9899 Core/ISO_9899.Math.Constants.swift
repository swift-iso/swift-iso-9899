//
//  ISO_9899.Math.Constants.swift
//  swift-iso-9899
//
//  Mathematical constants for common computations
//

extension ISO_9899.Math {
    /// Mathematical constants for common computations
    ///
    /// High-precision mathematical constants useful for scientific and engineering computations.
    /// All values are computed to maximum Double precision.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let circumference = 2 * ISO_9899.Math.Constants.pi * radius
    /// let naturalLog = ISO_9899.Math.Constants.e
    /// let rootTwo = ISO_9899.Math.Constants.sqrt2
    /// ```
    ///
    /// ## See Also
    ///
    /// These constants complement the ISO/IEC 9899:2018 Section 7.12 mathematical functions.
    public enum Constants {
        // MARK: - Fundamental Constants

        /// π (pi) - The ratio of a circle's circumference to its diameter
        ///
        /// Value: 3.14159265358979323846...
        ///
        /// ## Usage
        /// ```swift
        /// let radians = degrees * ISO_9899.Math.Constants.pi / 180
        /// let area = ISO_9899.Math.Constants.pi * radius * radius
        /// ```
        @inlinable
        public static var pi: Double { .pi }

        /// e - Euler's number, the base of natural logarithms
        ///
        /// Value: 2.71828182845904523536...
        ///
        /// ## Usage
        /// ```swift
        /// let growth = ISO_9899.Math.Constants.e
        /// ```
        @inlinable
        public static var e: Double {
            2.718281828459045235360287471352662497757247093699959574966
        }

        /// τ (tau) - The ratio of a circle's circumference to its radius (2π)
        ///
        /// Value: 6.28318530717958647692...
        ///
        /// ## Usage
        /// ```swift
        /// let fullCircle = ISO_9899.Math.Constants.tau
        /// ```
        @inlinable
        public static var tau: Double {
            6.283185307179586476925286766559005768394338798750211641949
        }

        // MARK: - Square Roots

        /// √2 - The square root of 2
        ///
        /// Value: 1.41421356237309504880...
        ///
        /// ## Usage
        /// ```swift
        /// let diagonal = side * ISO_9899.Math.Constants.sqrt2
        /// ```
        @inlinable
        public static var sqrt2: Double {
            1.414213562373095048801688724209698078569671875376948073176
        }

        /// √3 - The square root of 3
        ///
        /// Value: 1.73205080756887729352...
        @inlinable
        public static var sqrt3: Double {
            1.732050807568877293527446341505872366942805253810380628055
        }

        /// √5 - The square root of 5
        ///
        /// Value: 2.23606797749978969640...
        @inlinable
        public static var sqrt5: Double {
            2.236067977499789696409173668731276235440618359611525724270
        }

        /// 1/√2 - The reciprocal of the square root of 2
        ///
        /// Value: 0.70710678118654752440...
        @inlinable
        public static var oneOverSqrt2: Double {
            0.707106781186547524400844362104849039284835937688474036588
        }

        // MARK: - Logarithms

        /// ln(2) - Natural logarithm of 2
        ///
        /// Value: 0.69314718055994530941...
        ///
        /// ## Usage
        /// ```swift
        /// // Convert log base 2 to natural log
        /// let ln_x = log2_x * ISO_9899.Math.Constants.ln2
        /// ```
        @inlinable
        public static var ln2: Double {
            0.693147180559945309417232121458176568075500134360255254120
        }

        /// ln(10) - Natural logarithm of 10
        ///
        /// Value: 2.30258509299404568401...
        ///
        /// ## Usage
        /// ```swift
        /// // Convert log base 10 to natural log
        /// let ln_x = log10_x * ISO_9899.Math.Constants.ln10
        /// ```
        @inlinable
        public static var ln10: Double {
            2.302585092994045684017991454684364207601101488628772976033
        }

        /// log₂(e) - Logarithm base 2 of e
        ///
        /// Value: 1.44269504088896340735...
        @inlinable
        public static var log2e: Double {
            1.442695040888963407359924681001892137426645954152985934135
        }

        /// log₁₀(e) - Logarithm base 10 of e
        ///
        /// Value: 0.43429448190325182765...
        @inlinable
        public static var log10e: Double {
            0.434294481903251827651128918916605082294397005803666566114
        }

        /// log₂(10) - Logarithm base 2 of 10
        ///
        /// Value: 3.32192809488736234787...
        @inlinable
        public static var log210: Double {
            3.321928094887362347870319429489390175864831393024580612054
        }

        // MARK: - Golden Ratio and Fibonacci

        /// φ (phi) - The golden ratio
        ///
        /// Value: 1.61803398874989484820...
        ///
        /// φ = (1 + √5) / 2
        ///
        /// ## Usage
        /// ```swift
        /// let goldenRectangle = width * ISO_9899.Math.Constants.phi
        /// ```
        @inlinable
        public static var phi: Double {
            1.618033988749894848204586834365638117720309179805762862135
        }

        // MARK: - Angular Conversions

        /// Degrees to radians conversion factor (π/180)
        ///
        /// Value: 0.01745329251994329576...
        ///
        /// ## Usage
        /// ```swift
        /// let radians = degrees * ISO_9899.Math.Constants.degreesToRadians
        /// ```
        @inlinable
        public static var degreesToRadians: Double {
            0.017453292519943295769236907684886127134428718885417254560
        }

        /// Radians to degrees conversion factor (180/π)
        ///
        /// Value: 57.2957795130823208767...
        ///
        /// ## Usage
        /// ```swift
        /// let degrees = radians * ISO_9899.Math.Constants.radiansToDegrees
        /// ```
        @inlinable
        public static var radiansToDegrees: Double {
            57.29577951308232087679815481410517033240547246656432154916
        }

        // MARK: - Common Fractions of π

        /// π/2
        ///
        /// Value: 1.57079632679489661923...
        @inlinable
        public static var piOver2: Double {
            1.570796326794896619231321691639751442098584699687552910487
        }

        /// π/3
        ///
        /// Value: 1.04719755119659774615...
        @inlinable
        public static var piOver3: Double {
            1.047197551196597746154214461093167628065723133125035273657
        }

        /// π/4
        ///
        /// Value: 0.78539816339744830961...
        @inlinable
        public static var piOver4: Double {
            0.785398163397448309615660845819875721049292349843776455243
        }

        /// π/6
        ///
        /// Value: 0.52359877559829887307...
        @inlinable
        public static var piOver6: Double {
            0.523598775598298873077107230546583814032861566562517636829
        }

        /// 2π
        @inlinable
        public static var twoPi: Double {
            6.283185307179586476925286766559005768394338798750211641949
        }

        // MARK: - Euler-Mascheroni Constant

        /// γ (gamma) - Euler-Mascheroni constant
        ///
        /// Value: 0.57721566490153286060...
        ///
        /// The limiting difference between the harmonic series and the natural logarithm.
        @inlinable
        public static var eulerMascheroni: Double {
            0.577215664901532860606512090082402431042159335939923598805
        }
    }
}
