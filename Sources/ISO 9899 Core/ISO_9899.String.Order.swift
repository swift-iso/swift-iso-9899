// ISO_9899.String.Order.swift
// swift-iso-9899
//
// Comparison result type for string functions

extension ISO_9899.String {
    /// Result of string comparison operations.
    ///
    /// Provides a type-safe alternative to the C convention of returning
    /// negative/zero/positive integers for less/equal/greater.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let order = C.String.Comparison.compare(a, b, count: n)
    /// switch order {
    /// case .less: print("a < b")
    /// case .equal: print("a == b")
    /// case .greater: print("a > b")
    /// }
    /// ```
    public enum Order: Int, Sendable {
        /// First operand is less than second.
        case less = -1

        /// Operands are equal.
        case equal = 0

        /// First operand is greater than second.
        case greater = 1
    }
}

extension ISO_9899.String.Order {
    /// Creates an Order from a C comparison result.
    ///
    /// - Parameter cResult: The result from strcmp, memcmp, etc.
    @inline(always)
    public init(cResult: Int32) {
        if cResult < 0 {
            self = .less
        } else if cResult > 0 {
            self = .greater
        } else {
            self = .equal
        }
    }
}
