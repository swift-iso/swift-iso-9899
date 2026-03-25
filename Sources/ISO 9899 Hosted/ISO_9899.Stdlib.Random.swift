// ISO_9899.Stdlib.Random.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.22.2 - Pseudo-random sequence generation functions

public import CISO9899Stdlib

extension ISO_9899.Stdlib {
    /// Pseudo-random number generation.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.2
    ///
    /// ## Warning
    ///
    /// These functions are NOT cryptographically secure. They are provided
    /// for compatibility with C code. For security-sensitive applications,
    /// use platform-specific secure random APIs.
    ///
    /// ## Thread Safety
    ///
    /// The `rand` and `srand` functions use global state and are NOT
    /// thread-safe. Use with caution in multi-threaded code.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// C.Stdlib.Random.seed(42)
    /// let value = C.Stdlib.Random.next()
    /// ```
    public enum Random {}
}

extension ISO_9899.Stdlib.Random {
    /// Seeds the pseudo-random number generator.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.2.2 — The `srand` function
    ///
    /// Sets the seed for a new sequence of pseudo-random integers.
    /// Using the same seed will produce the same sequence.
    ///
    /// - Parameter seed: The seed value.
    @inline(always)
    public static func seed(_ seed: UInt32) {
        iso9899_srand(seed)
    }

    /// Generates the next pseudo-random integer.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.2.1 — The `rand` function
    ///
    /// Computes a sequence of pseudo-random integers in the range 0 to `RAND_MAX`.
    ///
    /// - Returns: A pseudo-random integer in the range [0, RAND_MAX].
    @inline(always)
    public static func next() -> Int32 {
        iso9899_rand()
    }
}
