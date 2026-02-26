// ISO_9899.Math.Trigonometric Tests.swift
// swift-iso-9899
//
// Tests for ISO/IEC 9899 Section 7.12.4 - Trigonometric functions

import Testing

@testable import ISO_9899

@Suite
struct `ISO_9899.Math - Trigonometric Functions` {

    // MARK: - sin() Tests

    @Suite
    struct `sin() - Basic Functionality` {

        @Test(arguments: [
            (0.0, 0.0, 0.0001),
            (Double.pi / 6, 0.5, 0.0001),
            (30.0 * Double.pi / 180.0, 0.5, 0.0001),
            (Double.pi / 4, 0.7071067811865476, 0.0001),
            (Double.pi / 2, 1.0, 0.0001),
            (Double.pi, 0.0, 0.0001),
            (3 * Double.pi / 2, -1.0, 0.0001),
            (2 * Double.pi, 0.0, 0.0001),
        ])
        func `sin at key angles`(angle: Double, expected: Double, tolerance: Double) {
            let result = ISO_9899.Math.sin(angle)
            #expect(abs(result - expected) < tolerance)
        }

        @Test
        func `sin is odd function`() {
            let x = Double.pi / 4
            #expect(abs(ISO_9899.Math.sin(-x) - (-ISO_9899.Math.sin(x))) < 0.0001)
        }
    }

    @Suite
    struct `sin() - Float Variant` {

        @Test(arguments: [
            (Float(0.0), Float(0.0), Float(0.001)),
            (Float.pi / 2, Float(1.0), Float(0.001)),
            (Float.pi, Float(0.0), Float(0.001)),
        ])
        func `sinf at key angles`(angle: Float, expected: Float, tolerance: Float) {
            let result = ISO_9899.Math.sin(angle)
            #expect(abs(result - expected) < tolerance)
        }
    }

    // MARK: - cos() Tests

    @Suite
    struct `cos() - Basic Functionality` {

        @Test(arguments: [
            (0.0, 1.0, 0.0001),
            (Double.pi / 6, 0.8660254037844387, 0.0001),
            (Double.pi / 4, 0.7071067811865476, 0.0001),
            (Double.pi / 3, 0.5, 0.0001),
            (60.0 * Double.pi / 180.0, 0.5, 0.0001),
            (Double.pi / 2, 0.0, 0.0001),
            (Double.pi, -1.0, 0.0001),
            (3 * Double.pi / 2, 0.0, 0.0001),
            (2 * Double.pi, 1.0, 0.0001),
        ])
        func `cos at key angles`(angle: Double, expected: Double, tolerance: Double) {
            let result = ISO_9899.Math.cos(angle)
            #expect(abs(result - expected) < tolerance)
        }

        @Test
        func `cos is even function`() {
            let x = Double.pi / 4
            #expect(abs(ISO_9899.Math.cos(-x) - ISO_9899.Math.cos(x)) < 0.0001)
        }
    }

    @Suite
    struct `cos() - Float Variant` {

        @Test(arguments: [
            (Float(0.0), Float(1.0), Float(0.001)),
            (Float.pi / 2, Float(0.0), Float(0.001)),
            (Float.pi, Float(-1.0), Float(0.001)),
        ])
        func `cosf at key angles`(angle: Float, expected: Float, tolerance: Float) {
            let result = ISO_9899.Math.cos(angle)
            #expect(abs(result - expected) < tolerance)
        }
    }

    // MARK: - tan() Tests

    @Suite
    struct `tan() - Basic Functionality` {

        @Test(arguments: [
            (0.0, 0.0, 0.0001),
            (Double.pi / 6, 0.5773502691896257, 0.0001),
            (Double.pi / 4, 1.0, 0.0001),
            (45.0 * Double.pi / 180.0, 1.0, 0.0001),
            (Double.pi / 3, 1.7320508075688772, 0.0001),
        ])
        func `tan at key angles`(angle: Double, expected: Double, tolerance: Double) {
            let result = ISO_9899.Math.tan(angle)
            #expect(abs(result - expected) < tolerance)
        }

        @Test
        func `tan is odd function`() {
            let x = Double.pi / 6
            #expect(abs(ISO_9899.Math.tan(-x) - (-ISO_9899.Math.tan(x))) < 0.0001)
        }
    }

    @Suite
    struct `tan() - Float Variant` {

        @Test(arguments: [
            (Float(0.0), Float(0.0), Float(0.001)),
            (Float.pi / 4, Float(1.0), Float(0.001)),
        ])
        func `tanf at key angles`(angle: Float, expected: Float, tolerance: Float) {
            let result = ISO_9899.Math.tan(angle)
            #expect(abs(result - expected) < tolerance)
        }
    }

    // MARK: - Inverse Trigonometric Functions

    @Suite
    struct `asin() - Basic Functionality` {

        @Test(arguments: [
            (0.0, 0.0, 0.0001),
            (0.5, Double.pi / 6, 0.0001),
            (0.7071067811865476, Double.pi / 4, 0.0001),
            (1.0, Double.pi / 2, 0.0001),
            (-0.5, -Double.pi / 6, 0.0001),
            (-1.0, -Double.pi / 2, 0.0001),
        ])
        func `asin of key values`(input: Double, expected: Double, tolerance: Double) {
            let result = ISO_9899.Math.asin(input)
            #expect(abs(result - expected) < tolerance)
        }

        @Test
        func `asin is inverse of sin`() {
            let angle = Double.pi / 6
            let sinValue = ISO_9899.Math.sin(angle)
            let result = ISO_9899.Math.asin(sinValue)
            #expect(abs(result - angle) < 0.0001)
        }
    }

    @Suite
    struct `acos() - Basic Functionality` {

        @Test(arguments: [
            (1.0, 0.0, 0.0001),
            (0.7071067811865476, Double.pi / 4, 0.0001),
            (0.5, Double.pi / 3, 0.0001),
            (0.0, Double.pi / 2, 0.0001),
            (-0.5, 2 * Double.pi / 3, 0.0001),
            (-1.0, Double.pi, 0.0001),
        ])
        func `acos of key values`(input: Double, expected: Double, tolerance: Double) {
            let result = ISO_9899.Math.acos(input)
            #expect(abs(result - expected) < tolerance)
        }

        @Test
        func `acos is inverse of cos`() {
            let angle = Double.pi / 4
            let cosValue = ISO_9899.Math.cos(angle)
            let result = ISO_9899.Math.acos(cosValue)
            #expect(abs(result - angle) < 0.0001)
        }
    }

    @Suite
    struct `atan() - Basic Functionality` {

        @Test(arguments: [
            (0.0, 0.0, 0.0001),
            (0.5773502691896257, Double.pi / 6, 0.0001),
            (1.0, Double.pi / 4, 0.0001),
            (1.7320508075688772, Double.pi / 3, 0.0001),
            (-1.0, -Double.pi / 4, 0.0001),
        ])
        func `atan of key values`(input: Double, expected: Double, tolerance: Double) {
            let result = ISO_9899.Math.atan(input)
            #expect(abs(result - expected) < tolerance)
        }

        @Test
        func `atan is inverse of tan`() {
            let angle = Double.pi / 6
            let tanValue = ISO_9899.Math.tan(angle)
            let result = ISO_9899.Math.atan(tanValue)
            #expect(abs(result - angle) < 0.0001)
        }
    }

    @Suite
    struct `atan2() - Basic Functionality` {

        @Test(arguments: [
            (0.0, 1.0, 0.0, "positive x-axis"),
            (1.0, 1.0, Double.pi / 4, "first quadrant (45°)"),
            (1.0, 0.0, Double.pi / 2, "positive y-axis"),
            (1.0, -1.0, 3 * Double.pi / 4, "second quadrant (135°)"),
            (-1.0, -1.0, -3 * Double.pi / 4, "third quadrant (-135°)"),
            (-1.0, 1.0, -Double.pi / 4, "fourth quadrant (-45°)"),
        ])
        func `atan2 quadrant determination`(y: Double, x: Double, expected: Double, description: String) {
            let result = ISO_9899.Math.atan2(y, x)
            #expect(abs(result - expected) < 0.0001, "\(description)")
        }
    }

    // MARK: - Pythagorean Identity

    @Suite
    struct `Trigonometric Identities` {

        @Test(arguments: [0.0, Double.pi / 6, Double.pi / 4, Double.pi / 3, Double.pi / 2])
        func `sin²(x) + cos²(x) = 1`(angle: Double) {
            let sinValue = ISO_9899.Math.sin(angle)
            let cosValue = ISO_9899.Math.cos(angle)
            let sum = sinValue * sinValue + cosValue * cosValue
            #expect(abs(sum - 1.0) < 0.0001, "Pythagorean identity failed for angle \(angle)")
        }

        @Test(arguments: [Double.pi / 6, Double.pi / 4, Double.pi / 3])
        func `tan(x) = sin(x) / cos(x)`(angle: Double) {
            let tanValue = ISO_9899.Math.tan(angle)
            let sinValue = ISO_9899.Math.sin(angle)
            let cosValue = ISO_9899.Math.cos(angle)
            let ratio = sinValue / cosValue
            #expect(abs(tanValue - ratio) < 0.0001)
        }
    }

    // MARK: - Color Space Conversion Use Cases

    @Suite
    struct `Color Space Conversion Examples` {

        @Test
        func `LCH to LAB conversion uses cos and sin`() {
            // Simulating lchToRGB color space conversion
            let h = 120.0  // Hue in degrees
            let c = 50.0  // Chroma

            // Convert to radians and compute
            let radians = h * Double.pi / 180.0
            let a = c * ISO_9899.Math.cos(radians)
            let b = c * ISO_9899.Math.sin(radians)

            // Verify reasonable values
            #expect(abs(a) <= c)
            #expect(abs(b) <= c)
        }

        @Test
        func `OKLCH to OKLAB conversion uses cos and sin`() {
            // Simulating oklchToRGB color space conversion
            let h = 45.0  // Hue in degrees
            let c = 0.15  // Chroma

            let radians = h * Double.pi / 180.0
            let a = c * ISO_9899.Math.cos(radians)
            let b = c * ISO_9899.Math.sin(radians)

            #expect(abs(a) <= c)
            #expect(abs(b) <= c)
        }

        @Test
        func `gamma correction uses fractional pow`() {
            let c = 0.5
            let gamma = ISO_9899.Math.pow(c, 1.0 / 2.4)

            // Result should be between 0 and 1
            #expect(gamma > 0.0)
            #expect(gamma < 1.0)
            #expect(gamma > c, "Gamma correction should brighten mid-tones")
        }
    }
}
