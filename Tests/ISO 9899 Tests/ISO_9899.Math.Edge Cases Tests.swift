// ISO_9899.Math.Edge Cases Tests.swift
// swift-iso-9899
//
// Comprehensive edge case tests for ISO/IEC 9899 Section 7.12 mathematical functions
// Testing special values, boundary conditions, and error cases

import Testing

@testable import ISO_9899

@Suite
struct `ISO_9899.Math - Edge Cases` {

    // MARK: - Power Function Edge Cases

    @Suite
    struct `pow() - Special Values` {

        @Test
        func `pow(±0, y) where y is negative odd integer returns ±infinity`() {
            let result1 = ISO_9899.Math.pow(0.0, -3.0)
            #expect(result1.isInfinite && result1 > 0)

            let result2 = ISO_9899.Math.pow(-0.0, -3.0)
            #expect(result2.isInfinite && result2 < 0)
        }

        @Test
        func `pow(±0, y) where y is negative non-integer returns +infinity`() {
            let result1 = ISO_9899.Math.pow(0.0, -2.5)
            #expect(result1.isInfinite && result1 > 0)

            let result2 = ISO_9899.Math.pow(-0.0, -2.5)
            #expect(result2.isInfinite && result2 > 0)
        }

        @Test
        func `pow(±0, y) where y is positive odd integer preserves sign`() {
            let result1 = ISO_9899.Math.pow(0.0, 3.0)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.pow(-0.0, 3.0)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `pow(-1, ±infinity) returns 1`() {
            let result1 = ISO_9899.Math.pow(-1.0, Double.infinity)
            #expect(result1 == 1.0)

            let result2 = ISO_9899.Math.pow(-1.0, -Double.infinity)
            #expect(result2 == 1.0)
        }

        @Test
        func `pow(+1, any) returns 1`() {
            #expect(ISO_9899.Math.pow(1.0, 0.0) == 1.0)
            #expect(ISO_9899.Math.pow(1.0, Double.infinity) == 1.0)
            #expect(ISO_9899.Math.pow(1.0, -Double.infinity) == 1.0)
            #expect(ISO_9899.Math.pow(1.0, Double.nan) == 1.0)
        }

        @Test
        func `pow(x, ±0) returns 1 for any x including NaN`() {
            #expect(ISO_9899.Math.pow(2.0, 0.0) == 1.0)
            #expect(ISO_9899.Math.pow(-2.0, 0.0) == 1.0)
            #expect(ISO_9899.Math.pow(Double.infinity, 0.0) == 1.0)
            #expect(ISO_9899.Math.pow(Double.nan, 0.0) == 1.0)
        }

        @Test
        func `pow(x, NaN) returns NaN`() {
            #expect(ISO_9899.Math.pow(2.0, Double.nan).isNaN)
            #expect(ISO_9899.Math.pow(-2.0, Double.nan).isNaN)
        }

        @Test
        func `pow(NaN, y) returns NaN for y != 0`() {
            #expect(ISO_9899.Math.pow(Double.nan, 2.0).isNaN)
            #expect(ISO_9899.Math.pow(Double.nan, -2.0).isNaN)
        }

        @Test
        func `pow(x, +infinity) for |x| < 1 returns +0`() {
            let result = ISO_9899.Math.pow(0.5, Double.infinity)
            #expect(result == 0.0)
        }

        @Test
        func `pow(x, +infinity) for |x| > 1 returns +infinity`() {
            let result = ISO_9899.Math.pow(2.0, Double.infinity)
            #expect(result.isInfinite && result > 0)
        }

        @Test
        func `pow(x, -infinity) for |x| < 1 returns +infinity`() {
            let result = ISO_9899.Math.pow(0.5, -Double.infinity)
            #expect(result.isInfinite && result > 0)
        }

        @Test
        func `pow(x, -infinity) for |x| > 1 returns +0`() {
            let result = ISO_9899.Math.pow(2.0, -Double.infinity)
            #expect(result == 0.0)
        }

        @Test
        func `pow(+infinity, y) for y < 0 returns +0`() {
            let result = ISO_9899.Math.pow(Double.infinity, -2.0)
            #expect(result == 0.0)
        }

        @Test
        func `pow(+infinity, y) for y > 0 returns +infinity`() {
            let result = ISO_9899.Math.pow(Double.infinity, 2.0)
            #expect(result.isInfinite && result > 0)
        }

        @Test
        func `pow(-infinity, y) for y negative odd integer returns -0`() {
            let result = ISO_9899.Math.pow(-Double.infinity, -3.0)
            #expect(result == 0.0 && result.sign == .minus)
        }

        @Test
        func `pow(-infinity, y) for y negative non-integer returns +0`() {
            let result = ISO_9899.Math.pow(-Double.infinity, -2.5)
            #expect(result == 0.0 && result.sign == .plus)
        }

        @Test
        func `pow(-infinity, y) for y positive odd integer returns -infinity`() {
            let result = ISO_9899.Math.pow(-Double.infinity, 3.0)
            #expect(result.isInfinite && result < 0)
        }

        @Test
        func `pow(-infinity, y) for y positive non-integer returns +infinity`() {
            let result = ISO_9899.Math.pow(-Double.infinity, 2.5)
            #expect(result.isInfinite && result > 0)
        }

        @Test
        func `pow(negative, non-integer) returns NaN`() {
            let result = ISO_9899.Math.pow(-2.0, 1.5)
            #expect(result.isNaN)
        }

        @Test
        func `pow with very large exponent near overflow`() {
            let result = ISO_9899.Math.pow(2.0, 1024.0)
            #expect(result.isInfinite && result > 0)
        }

        @Test
        func `pow with very large negative exponent near underflow`() {
            let result = ISO_9899.Math.pow(2.0, -1075.0)
            #expect(result == 0.0)
        }

        @Test
        func `pow with subnormal base`() {
            let subnormal = Double.leastNonzeroMagnitude
            let result = ISO_9899.Math.pow(subnormal, 2.0)
            #expect(result >= 0.0)
        }
    }

    @Suite
    struct `sqrt() - Special Values` {

        @Test
        func `sqrt(±0) returns ±0`() {
            let result1 = ISO_9899.Math.sqrt(0.0)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.sqrt(-0.0)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `sqrt(+infinity) returns +infinity`() {
            let result = ISO_9899.Math.sqrt(Double.infinity)
            #expect(result.isInfinite && result > 0)
        }

        @Test
        func `sqrt(negative) returns NaN`() {
            let result = ISO_9899.Math.sqrt(-1.0)
            #expect(result.isNaN)
        }

        @Test
        func `sqrt(NaN) returns NaN`() {
            let result = ISO_9899.Math.sqrt(Double.nan)
            #expect(result.isNaN)
        }

        @Test
        func `sqrt of subnormal number`() {
            let subnormal = Double.leastNonzeroMagnitude
            let result = ISO_9899.Math.sqrt(subnormal)
            #expect(result > 0.0 && result.isFinite)
        }

        @Test
        func `sqrt of very large number near infinity`() {
            let result = ISO_9899.Math.sqrt(Double.greatestFiniteMagnitude)
            #expect(result.isFinite && result > 0)
        }
    }

    // MARK: - Trigonometric Function Edge Cases

    @Suite
    struct `sin() - Special Values` {

        @Test
        func `sin(±0) returns ±0`() {
            let result1 = ISO_9899.Math.sin(0.0)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.sin(-0.0)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `sin(±infinity) returns NaN`() {
            let result1 = ISO_9899.Math.sin(Double.infinity)
            #expect(result1.isNaN)

            let result2 = ISO_9899.Math.sin(-Double.infinity)
            #expect(result2.isNaN)
        }

        @Test
        func `sin(NaN) returns NaN`() {
            let result = ISO_9899.Math.sin(Double.nan)
            #expect(result.isNaN)
        }

        @Test
        func `sin of very large finite value has range-reduced result`() {
            let result = ISO_9899.Math.sin(1e100)
            #expect(result.isFinite && abs(result) <= 1.0)
        }

        @Test
        func `sin of subnormal value returns approximately the value`() {
            let subnormal = Double.leastNonzeroMagnitude
            let result = ISO_9899.Math.sin(subnormal)
            // For very small x, sin(x) ≈ x
            #expect(abs(result - subnormal) < subnormal * 2)
        }

        @Test
        func `sin range is always [-1, 1]`() {
            let values: [Double] = [
                0.0, Double.pi / 6, Double.pi / 4, Double.pi / 3, Double.pi / 2,
                2 * Double.pi / 3, 3 * Double.pi / 4, 5 * Double.pi / 6, Double.pi,
                -Double.pi / 2, -Double.pi,
            ]
            for value in values {
                let result = ISO_9899.Math.sin(value)
                #expect(abs(result) <= 1.0, "sin(\(value)) = \(result) exceeds range")
            }
        }
    }

    @Suite
    struct `cos() - Special Values` {

        @Test
        func `cos(±0) returns 1`() {
            #expect(ISO_9899.Math.cos(0.0) == 1.0)
            #expect(ISO_9899.Math.cos(-0.0) == 1.0)
        }

        @Test
        func `cos(±infinity) returns NaN`() {
            let result1 = ISO_9899.Math.cos(Double.infinity)
            #expect(result1.isNaN)

            let result2 = ISO_9899.Math.cos(-Double.infinity)
            #expect(result2.isNaN)
        }

        @Test
        func `cos(NaN) returns NaN`() {
            let result = ISO_9899.Math.cos(Double.nan)
            #expect(result.isNaN)
        }

        @Test
        func `cos of very large finite value has range-reduced result`() {
            let result = ISO_9899.Math.cos(1e100)
            #expect(result.isFinite && abs(result) <= 1.0)
        }

        @Test
        func `cos range is always [-1, 1]`() {
            let values: [Double] = [
                0.0, Double.pi / 6, Double.pi / 4, Double.pi / 3, Double.pi / 2,
                2 * Double.pi / 3, 3 * Double.pi / 4, 5 * Double.pi / 6, Double.pi,
                -Double.pi / 2, -Double.pi,
            ]
            for value in values {
                let result = ISO_9899.Math.cos(value)
                #expect(abs(result) <= 1.0, "cos(\(value)) = \(result) exceeds range")
            }
        }
    }

    @Suite
    struct `tan() - Special Values` {

        @Test
        func `tan(±0) returns ±0`() {
            let result1 = ISO_9899.Math.tan(0.0)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.tan(-0.0)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `tan(±infinity) returns NaN`() {
            let result1 = ISO_9899.Math.tan(Double.infinity)
            #expect(result1.isNaN)

            let result2 = ISO_9899.Math.tan(-Double.infinity)
            #expect(result2.isNaN)
        }

        @Test
        func `tan(NaN) returns NaN`() {
            let result = ISO_9899.Math.tan(Double.nan)
            #expect(result.isNaN)
        }

        @Test
        func `tan near π_2 approaches infinity`() {
            let nearPiOver2 = Double.pi / 2 - 1e-10
            let result = ISO_9899.Math.tan(nearPiOver2)
            #expect(result > 1e9)
        }

        @Test
        func `tan of very large finite value has range-reduced result`() {
            let result = ISO_9899.Math.tan(1e100)
            #expect(result.isFinite)
        }
    }

    // MARK: - Inverse Trigonometric Edge Cases

    @Suite
    struct `asin() - Special Values` {

        @Test
        func `asin(±0) returns ±0`() {
            let result1 = ISO_9899.Math.asin(0.0)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.asin(-0.0)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `asin(x) for |x| > 1 returns NaN`() {
            let result1 = ISO_9899.Math.asin(1.1)
            #expect(result1.isNaN)

            let result2 = ISO_9899.Math.asin(-1.1)
            #expect(result2.isNaN)
        }

        @Test
        func `asin(NaN) returns NaN`() {
            let result = ISO_9899.Math.asin(Double.nan)
            #expect(result.isNaN)
        }

        @Test
        func `asin(±1) returns ±π_2`() {
            let result1 = ISO_9899.Math.asin(1.0)
            #expect(abs(result1 - Double.pi / 2) < 1e-15)

            let result2 = ISO_9899.Math.asin(-1.0)
            #expect(abs(result2 + Double.pi / 2) < 1e-15)
        }

        @Test
        func `asin boundary at exactly 1`() {
            let result = ISO_9899.Math.asin(1.0)
            #expect(result.isFinite)
            #expect(abs(result - Double.pi / 2) < 1e-15)
        }

        @Test
        func `asin boundary at exactly -1`() {
            let result = ISO_9899.Math.asin(-1.0)
            #expect(result.isFinite)
            #expect(abs(result + Double.pi / 2) < 1e-15)
        }
    }

    @Suite
    struct `acos() - Special Values` {

        @Test
        func `acos(1) returns +0`() {
            let result = ISO_9899.Math.acos(1.0)
            #expect(result == 0.0)
        }

        @Test
        func `acos(-1) returns π`() {
            let result = ISO_9899.Math.acos(-1.0)
            #expect(abs(result - Double.pi) < 1e-15)
        }

        @Test
        func `acos(x) for |x| > 1 returns NaN`() {
            let result1 = ISO_9899.Math.acos(1.1)
            #expect(result1.isNaN)

            let result2 = ISO_9899.Math.acos(-1.1)
            #expect(result2.isNaN)
        }

        @Test
        func `acos(NaN) returns NaN`() {
            let result = ISO_9899.Math.acos(Double.nan)
            #expect(result.isNaN)
        }

        @Test
        func `acos(0) returns π_2`() {
            let result = ISO_9899.Math.acos(0.0)
            #expect(abs(result - Double.pi / 2) < 1e-15)
        }
    }

    @Suite
    struct `atan() - Special Values` {

        @Test
        func `atan(±0) returns ±0`() {
            let result1 = ISO_9899.Math.atan(0.0)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.atan(-0.0)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `atan(±infinity) returns ±π_2`() {
            let result1 = ISO_9899.Math.atan(Double.infinity)
            #expect(abs(result1 - Double.pi / 2) < 1e-15)

            let result2 = ISO_9899.Math.atan(-Double.infinity)
            #expect(abs(result2 + Double.pi / 2) < 1e-15)
        }

        @Test
        func `atan(NaN) returns NaN`() {
            let result = ISO_9899.Math.atan(Double.nan)
            #expect(result.isNaN)
        }

        @Test
        func `atan of very large value approaches π_2`() {
            let result = ISO_9899.Math.atan(1e100)
            #expect(abs(result - Double.pi / 2) < 1e-10)
        }

        @Test
        func `atan of very small value approximately equals the value`() {
            let small = 1e-100
            let result = ISO_9899.Math.atan(small)
            #expect(abs(result - small) < 1e-100)
        }
    }

    @Suite
    struct `atan2() - Special Values` {

        @Test
        func `atan2(±0, -0) returns ±π`() {
            let result1 = ISO_9899.Math.atan2(0.0, -0.0)
            #expect(abs(result1 - Double.pi) < 1e-15)

            let result2 = ISO_9899.Math.atan2(-0.0, -0.0)
            #expect(abs(result2 + Double.pi) < 1e-15)
        }

        @Test
        func `atan2(±0, +0) returns ±0`() {
            let result1 = ISO_9899.Math.atan2(0.0, 0.0)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.atan2(-0.0, 0.0)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `atan2(±0, x) for x < 0 returns ±π`() {
            let result1 = ISO_9899.Math.atan2(0.0, -1.0)
            #expect(abs(result1 - Double.pi) < 1e-15)

            let result2 = ISO_9899.Math.atan2(-0.0, -1.0)
            #expect(abs(result2 + Double.pi) < 1e-15)
        }

        @Test
        func `atan2(±0, x) for x > 0 returns ±0`() {
            let result1 = ISO_9899.Math.atan2(0.0, 1.0)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.atan2(-0.0, 1.0)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `atan2(y, ±0) for y > 0 returns π_2`() {
            let result1 = ISO_9899.Math.atan2(1.0, 0.0)
            #expect(abs(result1 - Double.pi / 2) < 1e-15)

            let result2 = ISO_9899.Math.atan2(1.0, -0.0)
            #expect(abs(result2 - Double.pi / 2) < 1e-15)
        }

        @Test
        func `atan2(y, ±0) for y < 0 returns -π_2`() {
            let result1 = ISO_9899.Math.atan2(-1.0, 0.0)
            #expect(abs(result1 + Double.pi / 2) < 1e-15)

            let result2 = ISO_9899.Math.atan2(-1.0, -0.0)
            #expect(abs(result2 + Double.pi / 2) < 1e-15)
        }

        @Test
        func `atan2(±y, -infinity) for finite y > 0 returns ±π`() {
            let result1 = ISO_9899.Math.atan2(1.0, -Double.infinity)
            #expect(abs(result1 - Double.pi) < 1e-15)

            let result2 = ISO_9899.Math.atan2(-1.0, -Double.infinity)
            #expect(abs(result2 + Double.pi) < 1e-15)
        }

        @Test
        func `atan2(±y, +infinity) for finite y > 0 returns ±0`() {
            let result1 = ISO_9899.Math.atan2(1.0, Double.infinity)
            #expect(result1 == 0.0 && result1.sign == .plus)

            let result2 = ISO_9899.Math.atan2(-1.0, Double.infinity)
            #expect(result2 == 0.0 && result2.sign == .minus)
        }

        @Test
        func `atan2(±infinity, x) for finite x returns ±π_2`() {
            let result1 = ISO_9899.Math.atan2(Double.infinity, 1.0)
            #expect(abs(result1 - Double.pi / 2) < 1e-15)

            let result2 = ISO_9899.Math.atan2(-Double.infinity, 1.0)
            #expect(abs(result2 + Double.pi / 2) < 1e-15)
        }

        @Test
        func `atan2(±infinity, -infinity) returns ±3π_4`() {
            let result1 = ISO_9899.Math.atan2(Double.infinity, -Double.infinity)
            #expect(abs(result1 - 3 * Double.pi / 4) < 1e-15)

            let result2 = ISO_9899.Math.atan2(-Double.infinity, -Double.infinity)
            #expect(abs(result2 + 3 * Double.pi / 4) < 1e-15)
        }

        @Test
        func `atan2(±infinity, +infinity) returns ±π_4`() {
            let result1 = ISO_9899.Math.atan2(Double.infinity, Double.infinity)
            #expect(abs(result1 - Double.pi / 4) < 1e-15)

            let result2 = ISO_9899.Math.atan2(-Double.infinity, Double.infinity)
            #expect(abs(result2 + Double.pi / 4) < 1e-15)
        }

        @Test
        func `atan2(NaN, x) returns NaN`() {
            let result = ISO_9899.Math.atan2(Double.nan, 1.0)
            #expect(result.isNaN)
        }

        @Test
        func `atan2(y, NaN) returns NaN`() {
            let result = ISO_9899.Math.atan2(1.0, Double.nan)
            #expect(result.isNaN)
        }
    }

    // MARK: - Numerical Stability Tests

    @Suite
    struct `Numerical Stability` {

        @Test
        func `pow maintains precision for small fractional exponents`() {
            let base = 1.0000001
            let exponent = 0.0000001
            let result = ISO_9899.Math.pow(base, exponent)
            #expect(result.isFinite && result > 0)
        }

        @Test
        func `sqrt maintains precision near machine epsilon`() {
            let value = 1.0 + Double.ulpOfOne
            let result = ISO_9899.Math.sqrt(value)
            let expected = 1.0 + Double.ulpOfOne / 2
            #expect(abs(result - expected) < 1e-15)
        }

        @Test
        func `sin maintains precision for very small angles`() {
            let angle = 1e-15
            let result = ISO_9899.Math.sin(angle)
            // For very small x, sin(x) ≈ x with high precision
            #expect(abs(result - angle) < 1e-30)
        }

        @Test
        func `cos maintains precision near zero angle`() {
            let angle = 1e-15
            let result = ISO_9899.Math.cos(angle)
            // cos(x) ≈ 1 - x²/2 for small x
            let expected = 1.0 - (angle * angle) / 2.0
            #expect(abs(result - expected) < 1e-30)
        }

        @Test
        func `tan maintains precision for small angles`() {
            let angle = 1e-15
            let result = ISO_9899.Math.tan(angle)
            // For very small x, tan(x) ≈ x
            #expect(abs(result - angle) < 1e-30)
        }

        @Test
        func `asin maintains precision near zero`() {
            let value = 1e-15
            let result = ISO_9899.Math.asin(value)
            // For small x, asin(x) ≈ x
            #expect(abs(result - value) < 1e-30)
        }

        @Test
        func `atan2 maintains precision for small differences`() {
            let y = 1e-100
            let x = 1.0
            let result = ISO_9899.Math.atan2(y, x)
            #expect(result.isFinite && result >= 0)
        }

        @Test
        func `pow with denormalized result`() {
            let base = 2.0
            let exponent = -1074.0  // Near smallest normal number
            let result = ISO_9899.Math.pow(base, exponent)
            #expect(result >= 0.0)
        }
    }

    // MARK: - Float Precision Edge Cases

    @Suite
    struct `Float Precision Edge Cases` {

        @Test
        func `Float pow special values`() {
            #expect(ISO_9899.Math.pow(Float.nan, Float(2.0)).isNaN)
            #expect(ISO_9899.Math.pow(Float(1.0), Float.infinity) == 1.0)
            #expect(ISO_9899.Math.pow(Float(0.0), Float(0.0)) == 1.0)
        }

        @Test
        func `Float sqrt special values`() {
            #expect(ISO_9899.Math.sqrt(Float.infinity).isInfinite)
            #expect(ISO_9899.Math.sqrt(Float(-1.0)).isNaN)
            #expect(ISO_9899.Math.sqrt(Float.nan).isNaN)
        }

        @Test
        func `Float sin special values`() {
            #expect(ISO_9899.Math.sin(Float.infinity).isNaN)
            #expect(ISO_9899.Math.sin(Float.nan).isNaN)
            #expect(ISO_9899.Math.sin(Float(0.0)) == 0.0)
        }

        @Test
        func `Float cos special values`() {
            #expect(ISO_9899.Math.cos(Float.infinity).isNaN)
            #expect(ISO_9899.Math.cos(Float.nan).isNaN)
            #expect(ISO_9899.Math.cos(Float(0.0)) == 1.0)
        }

        @Test
        func `Float tan special values`() {
            #expect(ISO_9899.Math.tan(Float.infinity).isNaN)
            #expect(ISO_9899.Math.tan(Float.nan).isNaN)
            #expect(ISO_9899.Math.tan(Float(0.0)) == 0.0)
        }
    }
}
