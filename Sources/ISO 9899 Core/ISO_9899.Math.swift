// ISO_9899.Math.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.12 - Mathematics <math.h>

extension ISO_9899 {
    /// Section 7.12: Mathematics `<math.h>`
    ///
    /// Mathematical functions from the ISO/IEC 9899:2018 C standard library.
    ///
    /// ## Overview
    ///
    /// This namespace provides Foundation-free access to standard mathematical operations
    /// including trigonometric, exponential, power, and rounding functions.
    ///
    /// All functions follow ISO/IEC 9899:2018 Section 7.12 specifications and provide
    /// IEEE 754 semantics per Annex F (IEC 60559 floating-point arithmetic).
    ///
    /// ## Implemented Sections
    ///
    /// - Section 7.12.4: Trigonometric functions
    /// - Section 7.12.6: Exponential and logarithmic functions
    /// - Section 7.12.7: Power and absolute-value functions
    /// - Section 7.12.9: Rounding functions
    ///
    /// ## Usage
    ///
    /// ```swift
    /// // Trigonometric functions
    /// let sine = ISO_9899.Math.sin(Double.pi / 2)
    /// let cosine = ISO_9899.Math.cos(0.0)
    ///
    /// // Power functions
    /// let power = ISO_9899.Math.pow(2.0, 10.0)
    /// let root = ISO_9899.Math.sqrt(16.0)
    ///
    /// // Rounding functions
    /// let rounded = ISO_9899.Math.ceil(2.3)
    /// let floored = ISO_9899.Math.floor(2.7)
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``Trigonometric``
    /// - ``Exponential``
    /// - ``Power``
    /// - ``Rounding``
    public enum Math {}
}
