import Testing

@testable import ISO_9899

enum `ISO_9899.Math.Trigonometric Tests` {}

extension `ISO_9899.Math.Trigonometric Tests` {
    @Suite
    struct `ISO_9899.Math - Trigonometric Functions` {
    }
}

extension `ISO_9899.Math.Trigonometric Tests`.`ISO_9899.Math - Trigonometric Functions` {
    @Suite
    struct `sin() - Basic Functionality` {

        private static let `sin at key angles arguments`: [(Double, Double, Double)] = [
            (0.0, 0.0, 0.0001),
            (Double.pi / 6, 0.5, 0.0001),
            (30.0 * Double.pi / 180.0, 0.5, 0.0001),
            (Double.pi / 4, 0.7071067811865476, 0.0001),
            (Double.pi / 2, 1.0, 0.0001),
            (Double.pi, 0.0, 0.0001),
            (3 * Double.pi / 2, -1.0, 0.0001),
            (2 * Double.pi, 0.0, 0.0001),
        ]

        @Test(arguments: Self.`sin at key angles arguments`)
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

        private static let `sinf at key angles arguments`: [(Float, Float, Float)] = [
            (Float(0.0), Float(0.0), Float(0.001)),
            (Float.pi / 2, Float(1.0), Float(0.001)),
            (Float.pi, Float(0.0), Float(0.001)),
        ]

        @Test(arguments: Self.`sinf at key angles arguments`)
        func `sinf at key angles`(angle: Float, expected: Float, tolerance: Float) {
            let result = ISO_9899.Math.sin(angle)
            #expect(abs(result - expected) < tolerance)
        }
    }

    @Suite
    struct `cos() - Basic Functionality` {

        private static let `cos at key angles arguments`: [(Double, Double, Double)] = [
            (0.0, 1.0, 0.0001),
            (Double.pi / 6, 0.8660254037844387, 0.0001),
            (Double.pi / 4, 0.7071067811865476, 0.0001),
            (Double.pi / 3, 0.5, 0.0001),
            (60.0 * Double.pi / 180.0, 0.5, 0.0001),
            (Double.pi / 2, 0.0, 0.0001),
            (Double.pi, -1.0, 0.0001),
            (3 * Double.pi / 2, 0.0, 0.0001),
            (2 * Double.pi, 1.0, 0.0001),
        ]

        @Test(arguments: Self.`cos at key angles arguments`)
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

        private static let `cosf at key angles arguments`: [(Float, Float, Float)] = [
            (Float(0.0), Float(1.0), Float(0.001)),
            (Float.pi / 2, Float(0.0), Float(0.001)),
            (Float.pi, Float(-1.0), Float(0.001)),
        ]

        @Test(arguments: Self.`cosf at key angles arguments`)
        func `cosf at key angles`(angle: Float, expected: Float, tolerance: Float) {
            let result = ISO_9899.Math.cos(angle)
            #expect(abs(result - expected) < tolerance)
        }
    }

    @Suite
    struct `tan() - Basic Functionality` {

        private static let `tan at key angles arguments`: [(Double, Double, Double)] = [
            (0.0, 0.0, 0.0001),
            (Double.pi / 6, 0.5773502691896257, 0.0001),
            (Double.pi / 4, 1.0, 0.0001),
            (45.0 * Double.pi / 180.0, 1.0, 0.0001),
            (Double.pi / 3, 1.7320508075688772, 0.0001),
        ]

        @Test(arguments: Self.`tan at key angles arguments`)
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

        private static let `tanf at key angles arguments`: [(Float, Float, Float)] = [
            (Float(0.0), Float(0.0), Float(0.001)),
            (Float.pi / 4, Float(1.0), Float(0.001)),
        ]

        @Test(arguments: Self.`tanf at key angles arguments`)
        func `tanf at key angles`(angle: Float, expected: Float, tolerance: Float) {
            let result = ISO_9899.Math.tan(angle)
            #expect(abs(result - expected) < tolerance)
        }
    }

    @Suite
    struct `asin() - Basic Functionality` {

        private static let `asin of key values arguments`: [(Double, Double, Double)] = [
            (0.0, 0.0, 0.0001),
            (0.5, Double.pi / 6, 0.0001),
            (0.7071067811865476, Double.pi / 4, 0.0001),
            (1.0, Double.pi / 2, 0.0001),
            (-0.5, -Double.pi / 6, 0.0001),
            (-1.0, -Double.pi / 2, 0.0001),
        ]

        @Test(arguments: Self.`asin of key values arguments`)
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

        private static let `acos of key values arguments`: [(Double, Double, Double)] = [
            (1.0, 0.0, 0.0001),
            (0.7071067811865476, Double.pi / 4, 0.0001),
            (0.5, Double.pi / 3, 0.0001),
            (0.0, Double.pi / 2, 0.0001),
            (-0.5, 2 * Double.pi / 3, 0.0001),
            (-1.0, Double.pi, 0.0001),
        ]

        @Test(arguments: Self.`acos of key values arguments`)
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

        private static let `atan of key values arguments`: [(Double, Double, Double)] = [
            (0.0, 0.0, 0.0001),
            (0.5773502691896257, Double.pi / 6, 0.0001),
            (1.0, Double.pi / 4, 0.0001),
            (1.7320508075688772, Double.pi / 3, 0.0001),
            (-1.0, -Double.pi / 4, 0.0001),
        ]

        @Test(arguments: Self.`atan of key values arguments`)
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

        private static let `atan2 quadrants`: [(Double, Double, Double, String)] = [
            (0.0, 1.0, 0.0, "positive x-axis"),
            (1.0, 1.0, Double.pi / 4, "first quadrant (45°)"),
            (1.0, 0.0, Double.pi / 2, "positive y-axis"),
            (1.0, -1.0, 3 * Double.pi / 4, "second quadrant (135°)"),
            (-1.0, -1.0, -3 * Double.pi / 4, "third quadrant (-135°)"),
            (-1.0, 1.0, -Double.pi / 4, "fourth quadrant (-45°)"),
        ]

        @Test(arguments: Self.`atan2 quadrants`)
        func `atan2 quadrant determination`(
            y: Double,
            x: Double,
            expected: Double,
            description: String
        ) {
            let result = ISO_9899.Math.atan2(y, x)
            #expect(abs(result - expected) < 0.0001, "\(description)")
        }
    }

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

    @Suite
    struct `Color Space Conversion Examples` {

        @Test
        func `LCH to LAB conversion uses cos and sin`() {

            let h = 120.0
            let c = 50.0

            let radians = h * Double.pi / 180.0
            let a = c * ISO_9899.Math.cos(radians)
            let b = c * ISO_9899.Math.sin(radians)

            #expect(abs(a) <= c)
            #expect(abs(b) <= c)
        }

        @Test
        func `OKLCH to OKLAB conversion uses cos and sin`() {

            let h = 45.0
            let c = 0.15

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

            #expect(gamma > 0.0)
            #expect(gamma < 1.0)
            #expect(gamma > c, "Gamma correction should brighten mid-tones")
        }
    }
}
