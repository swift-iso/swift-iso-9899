// ISO_9899.Math.Power Tests.swift
// swift-iso-9899
//
// Tests for ISO/IEC 9899 Section 7.12.7 - Power and absolute-value functions

import Testing

@testable import ISO_9899

@Suite
struct `ISO_9899.Math - Power Functions` {

    // MARK: - pow() Tests

    @Suite
    struct `pow() - Basic Functionality` {

        @Test(arguments: [
            (2.0, 3.0, 8.0),
            (10.0, 2.0, 100.0),
            (3.0, 4.0, 81.0),
            (2.0, 10.0, 1024.0),
            (-2.0, 2.0, 4.0),
            (-2.0, 3.0, -8.0),
            (-3.0, 4.0, 81.0),
        ])
        func `pow with integer exponents`(base: Double, exponent: Double, expected: Double) {
            #expect(ISO_9899.Math.pow(base, exponent) == expected)
        }

        @Test(arguments: [
            (16.0, 0.5, 4.0),
            (27.0, 1.0 / 3.0, 3.0),
            (8.0, 1.0 / 3.0, 2.0),
            (4.0, 0.5, 2.0),
            (100.0, 0.5, 10.0),
        ])
        func `pow with fractional exponents`(base: Double, exponent: Double, expected: Double) {
            let result = ISO_9899.Math.pow(base, exponent)
            #expect(abs(result - expected) < 0.0001)
        }

        @Test
        func `pow with gamma correction exponent`() {
            // Gamma correction: pow(c, 1/2.4)
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

        @Test(arguments: [
            (Float(2.0), Float(3.0), Float(8.0)),
            (Float(10.0), Float(2.0), Float(100.0)),
            (Float(3.0), Float(4.0), Float(81.0)),
        ])
        func `powf with integer exponents`(base: Float, exponent: Float, expected: Float) {
            #expect(ISO_9899.Math.pow(base, exponent) == expected)
        }

        @Test(arguments: [
            (Float(16.0), Float(0.5), Float(4.0)),
            (Float(4.0), Float(0.5), Float(2.0)),
        ])
        func `powf with fractional exponents`(base: Float, exponent: Float, expected: Float) {
            let result = ISO_9899.Math.pow(base, exponent)
            #expect(abs(result - expected) < 0.001)
        }
    }

    // MARK: - sqrt() Tests

    @Suite
    struct `sqrt() - Basic Functionality` {

        @Test(arguments: [
            (4.0, 2.0),
            (9.0, 3.0),
            (16.0, 4.0),
            (25.0, 5.0),
            (100.0, 10.0),
        ])
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

        @Test(arguments: [
            (Float(4.0), Float(2.0)),
            (Float(9.0), Float(3.0)),
            (Float(16.0), Float(4.0)),
            (Float(25.0), Float(5.0)),
        ])
        func `sqrtf of perfect squares`(input: Float, expected: Float) {
            #expect(ISO_9899.Math.sqrt(input) == expected)
        }
    }
}
