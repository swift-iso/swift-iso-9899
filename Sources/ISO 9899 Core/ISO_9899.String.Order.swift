extension ISO_9899.String {

    public enum Order: Int, Sendable {

        case less = -1

        case equal = 0

        case greater = 1
    }
}

extension ISO_9899.String.Order {

    @inline(always)
    public init(cResult: Int32) {
        self = if cResult < 0 {
            .less
        } else if cResult > 0 {
            .greater
        } else {
            .equal
        }
    }
}
