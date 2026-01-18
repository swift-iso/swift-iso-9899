import Testing

@testable import ISO_9899

@Suite("NaN Creation - Swifty API")
struct NaNSwiftyAPITests {

    @Test("Double.c.nan() creates NaN")
    func doubleNanBasic() {
        let result = Double.c.nan()
        #expect(result.isNaN)
        #expect(result.c.isNaN)
    }

    @Test("Double.c.nan(tag) creates NaN with payload")
    func doubleNanWithTag() {
        let result = Double.c.nan("overflow")
        #expect(result.isNaN)
        #expect(result.c.isNaN)
    }

    @Test("Different tags produce different bit patterns")
    func doubleNanDifferentPayloads() {
        let nan1 = Double.c.nan("")
        let nan2 = Double.c.nan("1")
        let nan3 = Double.c.nan("2")

        // All should be NaN
        #expect(nan1.isNaN)
        #expect(nan2.isNaN)
        #expect(nan3.isNaN)

        // But with different bit patterns (payloads)
        // Note: Empty string might produce same as some default
        #expect(nan2.bitPattern != nan3.bitPattern)
    }

    @Test("Float.c.nan() creates NaN")
    func floatNanBasic() {
        let result = Float.c.nan()
        #expect(result.isNaN)
        #expect(result.c.isNaN)
    }

    @Test("Float.c.nan(tag) creates NaN with payload")
    func floatNanWithTag() {
        let result = Float.c.nan("underflow")
        #expect(result.isNaN)
        #expect(result.c.isNaN)
    }

    @Test("NaN with payload has correct classification")
    func nanClassification() {
        let result = Double.c.nan("test")
        #expect(result.c.classification == .nan)
        #expect(result.c.isNaN == true)
        #expect(result.c.isFinite == false)
        #expect(result.c.isInfinite == false)
        #expect(result.c.isNormal == false)
    }

    @Test("NaN comparisons work correctly")
    func nanComparisons() {
        let nan1 = Double.c.nan("a")
        let nan2 = Double.c.nan("b")

        // NaN comparisons should return false
        #expect(nan1.c.isGreater(than: nan2) == false)
        #expect(nan1.c.isLess(than: nan2) == false)
        #expect(nan1.c.isNotEqual(to: nan2) == false)

        // But they should be unordered
        #expect(nan1.c.isUnordered(with: nan2) == true)
        #expect(nan1.c.isUnordered(with: 5.0) == true)
    }

    @Test("Authoritative API still works")
    func authoritativeAPICompatibility() {
        let swiftyNaN = Double.c.nan("auth")
        let authNaN = "auth".withCString { ISO_9899.Math.nan($0) }

        // Both should be NaN
        #expect(swiftyNaN.isNaN)
        #expect(ISO_9899.Math.isnan(authNaN))

        // And should have same bit pattern
        #expect(swiftyNaN.bitPattern == authNaN.bitPattern)
    }
}
