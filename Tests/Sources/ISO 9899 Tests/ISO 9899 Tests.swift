// ISO 9899 Tests.swift
// swift-iso-9899
//
// Tests for module-level ISO_9899 namespace and performance benchmarks

import StandardsTestSupport
import Testing

@testable import ISO_9899

// MARK: - Module Structure

@Suite
struct `ISO_9899 - Module Structure Tests` {

    @Test
    func `ISO_9899 namespace exists`() {
        // Verify the top-level namespace is accessible
        _ = ISO_9899.self
    }

    @Test
    func `ISO_9899_Math namespace exists`() {
        // Verify the Math sub-namespace is accessible
        _ = ISO_9899.Math.self
    }

    @Test
    func `all power functions are available`() {
        // Verify function signatures compile
        _ = ISO_9899.Math.pow as (Double, Double) -> Double
        _ = ISO_9899.Math.pow as (Float, Float) -> Float
        _ = ISO_9899.Math.sqrt as (Double) -> Double
        _ = ISO_9899.Math.sqrt as (Float) -> Float
    }

    @Test
    func `all trigonometric functions are available`() {
        // Verify function signatures compile
        _ = ISO_9899.Math.sin as (Double) -> Double
        _ = ISO_9899.Math.cos as (Double) -> Double
        _ = ISO_9899.Math.tan as (Double) -> Double
        _ = ISO_9899.Math.asin as (Double) -> Double
        _ = ISO_9899.Math.acos as (Double) -> Double
        _ = ISO_9899.Math.atan as (Double) -> Double
        _ = ISO_9899.Math.atan2 as (Double, Double) -> Double
    }
}

// MARK: - Performance Tests

extension `Performance Tests` {

    @Suite
    struct `ISO_9899.Math - Performance` {

        @Test(.timed(threshold: .milliseconds(50)))
        func `pow() with integer exponents - 100K iterations`() {
            for _ in 0..<100_000 {
                _ = ISO_9899.Math.pow(2.0, 3.0)
            }
        }

        @Test(.timed(threshold: .milliseconds(50)))
        func `pow() with fractional exponents - 100K iterations`() {
            for _ in 0..<100_000 {
                _ = ISO_9899.Math.pow(2.0, 1.0 / 2.4)
            }
        }

        @Test(.timed(threshold: .milliseconds(50)))
        func `sqrt() - 100K iterations`() {
            for _ in 0..<100_000 {
                _ = ISO_9899.Math.sqrt(16.0)
            }
        }

        @Test(.timed(threshold: .milliseconds(100)))
        func `sin() - 100K iterations`() {
            let angle = Double.pi / 4
            for _ in 0..<100_000 {
                _ = ISO_9899.Math.sin(angle)
            }
        }

        @Test(.timed(threshold: .milliseconds(100)))
        func `cos() - 100K iterations`() {
            let angle = Double.pi / 4
            for _ in 0..<100_000 {
                _ = ISO_9899.Math.cos(angle)
            }
        }

        @Test(.timed(threshold: .milliseconds(100)))
        func `tan() - 100K iterations`() {
            let angle = Double.pi / 4
            for _ in 0..<100_000 {
                _ = ISO_9899.Math.tan(angle)
            }
        }

        @Test(.timed(threshold: .milliseconds(100)))
        func `atan2() - 100K iterations`() {
            for _ in 0..<100_000 {
                _ = ISO_9899.Math.atan2(1.0, 1.0)
            }
        }

        @Test(.timed(threshold: .milliseconds(200)))
        func `color space conversion simulation - 10K iterations`() {
            // Simulate LCH to LAB conversion (used in HTMLColor)
            for i in 0..<10_000 {
                let h = Double(i % 360)
                let c = 50.0
                let radians = h * Double.pi / 180.0
                _ = c * ISO_9899.Math.cos(radians)
                _ = c * ISO_9899.Math.sin(radians)
            }
        }

        @Test(.timed(threshold: .milliseconds(100)))
        func `gamma correction simulation - 10K iterations`() {
            // Simulate gamma correction (used in HTMLColor)
            for i in 0..<10_000 {
                let c = Double(i % 256) / 255.0
                _ = ISO_9899.Math.pow(c, 1.0 / 2.4)
            }
        }
    }
}
