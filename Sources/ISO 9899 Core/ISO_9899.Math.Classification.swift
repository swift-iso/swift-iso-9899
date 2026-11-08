public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    public enum FloatingPointClass: Int32 {

        case normal = 0

        case zero = 1

        case subnormal = 2

        case infinite = 3

        case nan = 4
    }

    @inline(always)
    public static func fpclassify(_ x: Double) -> FloatingPointClass {
        _ = iso9899_fpclassify_d(x)

        return if x.isNaN {
            .nan
        } else if x.isInfinite {
            .infinite
        } else if x == 0 {
            .zero
        } else if abs(x) < Double.leastNormalMagnitude {
            .subnormal
        } else {
            .normal
        }
    }

    @inline(always)
    public static func fpclassify(_ x: Float) -> FloatingPointClass {
        _ = iso9899_fpclassify_f(x)

        return if x.isNaN {
            .nan
        } else if x.isInfinite {
            .infinite
        } else if x == 0 {
            .zero
        } else if abs(x) < Float.leastNormalMagnitude {
            .subnormal
        } else {
            .normal
        }
    }

    @inline(always)
    public static func isfinite(_ x: Double) -> Bool {
        return iso9899_isfinite_d(x) != 0
    }

    @inline(always)
    public static func isfinite(_ x: Float) -> Bool {
        return iso9899_isfinite_f(x) != 0
    }

    @inline(always)
    public static func isinf(_ x: Double) -> Bool {
        return iso9899_isinf_d(x) != 0
    }

    @inline(always)
    public static func isinf(_ x: Float) -> Bool {
        return iso9899_isinf_f(x) != 0
    }

    @inline(always)
    public static func isnan(_ x: Double) -> Bool {
        return iso9899_isnan_d(x) != 0
    }

    @inline(always)
    public static func isnan(_ x: Float) -> Bool {
        return iso9899_isnan_f(x) != 0
    }

    @inline(always)
    public static func isnormal(_ x: Double) -> Bool {
        return iso9899_isnormal_d(x) != 0
    }

    @inline(always)
    public static func isnormal(_ x: Float) -> Bool {
        return iso9899_isnormal_f(x) != 0
    }

    @inline(always)
    public static func signbit(_ x: Double) -> Bool {
        return iso9899_signbit_d(x) != 0
    }

    @inline(always)
    public static func signbit(_ x: Float) -> Bool {
        return iso9899_signbit_f(x) != 0
    }
}
