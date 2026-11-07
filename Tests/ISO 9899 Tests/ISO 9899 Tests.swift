import Testing

@testable import ISO_9899

enum `ISO 9899 Tests` {}

extension `ISO 9899 Tests` {
    @Suite
    struct `ISO_9899 - Module Structure Tests` {

        @Test
        func `ISO_9899 namespace exists`() {

            _ = ISO_9899.self
        }

        @Test
        func `ISO_9899_Math namespace exists`() {

            _ = ISO_9899.Math.self
        }

        @Test
        func `all power functions are available`() {

            _ = ISO_9899.Math.pow as (Double, Double) -> Double
            _ = ISO_9899.Math.pow as (Float, Float) -> Float
            _ = ISO_9899.Math.sqrt as (Double) -> Double
            _ = ISO_9899.Math.sqrt as (Float) -> Float
        }

        @Test
        func `all trigonometric functions are available`() {

            _ = ISO_9899.Math.sin as (Double) -> Double
            _ = ISO_9899.Math.cos as (Double) -> Double
            _ = ISO_9899.Math.tan as (Double) -> Double
            _ = ISO_9899.Math.asin as (Double) -> Double
            _ = ISO_9899.Math.acos as (Double) -> Double
            _ = ISO_9899.Math.atan as (Double) -> Double
            _ = ISO_9899.Math.atan2 as (Double, Double) -> Double
        }
    }
}
