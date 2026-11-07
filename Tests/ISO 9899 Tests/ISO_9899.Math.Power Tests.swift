import Testing

@testable import ISO_9899

enum `ISO_9899.Math.Power Tests` {}

extension `ISO_9899.Math.Power Tests` {
    @Suite
    struct `ISO_9899.Math - Power Functions` {
    }
}

extension `ISO_9899.Math.Power Tests`.`ISO_9899.Math - Power Functions` {
    @Suite
    struct `pow() - Basic Functionality` {

        private static let `pow with integer exponents arguments`: [(Double, Double, Double)] = [
            (2.0, 3.0, 8.0),
            (10.0, 2.0, 100.0),
            (3.0, 4.0, 81.0),
            (2.0, 10.0, 1024.0),
            (-2.0, 2.0, 4.0),
            (-2.0, 3.0, -8.0),
            (-3.0, 4.0, 81.0),
        ]

        @Test(arguments: Self.`pow with integer exponents arguments`)
        func `pow with integer exponents`(base: Double, exponent: Double, expected: Double) {
            #expect(ISO_9899.Math.pow(base, exponent) == expected)
        }

        private static let `pow with fractional exponents arguments`: [(Double, Double, Double)] = [
            (16.0, 0.5, 4.0),
            (27.0, 1.0 / 3.0, 3.0),
            (8.0, 1.0 / 3.0, 2.0),
            (4.0, 0.5, 2.0),
            (100.0, 0.5, 10.0),
        ]

        @Test(arguments: Self.`pow with fractional exponents arguments`)
        func `pow with fractional exponents`(base: Double, exponent: Double, expected: Double) {
            let result = ISO_9899.Math.pow(base, exponent)
            #expect(abs(result - expected) < 0.0001)
        }

        @Test
        func `pow with gamma correction exponent`() {

            let c = 0.5
            let gamma = ISO_9899.Math.pow(c, 1.0 / 2.4)
            #expect(gamma > 0)
            #expect(gamma < 1)
        }

        @Test(arguments: [1.0, 2.0, 3.0, 10.0, 100.0])
        func `pow(0, y) returns 0 for positive y`(exponent: Double) {
            #expect(ISO_9899.Math.pow(0.0, exponent) == 0.0)
        }

        @Test(arguments: [0.0, 0.5, 1.0, 2.0, 10.0, 42.0, 100.0, -5.0, -10.0])
        func `pow(x, 0) returns 1 for any x`(base: Double) {
            #expect(ISO_9899.Math.pow(base, 0.0) == 1.0)
        }

        @Test(arguments: [0.0, 0.5, 1.0, 2.0, 10.0, 100.0, -5.0, -10.0])
        func `pow(1, y) returns 1 for any y`(exponent: Double) {
            #expect(ISO_9899.Math.pow(1.0, exponent) == 1.0)
        }
    }

    @Suite
    struct `pow() - Float Variant` {

        private static let `powf with integer exponents arguments`: [(Float, Float, Float)] = [
            (Float(2.0), Float(3.0), Float(8.0)),
            (Float(10.0), Float(2.0), Float(100.0)),
            (Float(3.0), Float(4.0), Float(81.0)),
        ]

        @Test(arguments: Self.`powf with integer exponents arguments`)
        func `powf with integer exponents`(base: Float, exponent: Float, expected: Float) {
            #expect(ISO_9899.Math.pow(base, exponent) == expected)
        }

        private static let `powf with fractional exponents arguments`: [(Float, Float, Float)] = [
            (Float(16.0), Float(0.5), Float(4.0)),
            (Float(4.0), Float(0.5), Float(2.0)),
        ]

        @Test(arguments: Self.`powf with fractional exponents arguments`)
        func `powf with fractional exponents`(base: Float, exponent: Float, expected: Float) {
            let result = ISO_9899.Math.pow(base, exponent)
            #expect(abs(result - expected) < 0.001)
        }
    }

    @Suite
    struct `sqrt() - Basic Functionality` {

        private static let `sqrt of perfect squares arguments`: [(Double, Double)] = [
            (4.0, 2.0),
            (9.0, 3.0),
            (16.0, 4.0),
            (25.0, 5.0),
            (100.0, 10.0),
        ]

        @Test(arguments: Self.`sqrt of perfect squares arguments`)
        func `sqrt of perfect squares`(input: Double, expected: Double) {
            #expect(ISO_9899.Math.sqrt(input) == expected)
        }

        @Test
        func `sqrt of non-perfect squares`() {
            let result = ISO_9899.Math.sqrt(2.0)
            #expect(abs(result - 1.41421356) < 0.00001)
        }

        @Test
        func `sqrt of zero is zero`() {
            #expect(ISO_9899.Math.sqrt(0.0) == 0.0)
        }

        @Test
        func `sqrt of one is one`() {
            #expect(ISO_9899.Math.sqrt(1.0) == 1.0)
        }

        @Test
        func `sqrt matches pow with 0_5 exponent`() {
            let value = 16.0
            let sqrtResult = ISO_9899.Math.sqrt(value)
            let powResult = ISO_9899.Math.pow(value, 0.5)
            #expect(abs(sqrtResult - powResult) < 0.0001)
        }
    }

    @Suite
    struct `sqrt() - Float Variant` {

        private static let `sqrtf of perfect squares arguments`: [(Float, Float)] = [
            (Float(4.0), Float(2.0)),
            (Float(9.0), Float(3.0)),
            (Float(16.0), Float(4.0)),
            (Float(25.0), Float(5.0)),
        ]

        @Test(arguments: Self.`sqrtf of perfect squares arguments`)
        func `sqrtf of perfect squares`(input: Float, expected: Float) {
            #expect(ISO_9899.Math.sqrt(input) == expected)
        }
    }
}
