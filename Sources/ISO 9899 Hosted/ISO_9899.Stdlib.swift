// ISO_9899.Stdlib.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.22 - General utilities <stdlib.h>

import CISO9899Stdlib

extension ISO_9899 {
    /// Section 7.22: General utilities `<stdlib.h>`
    ///
    /// General utility functions including string conversion, memory
    /// allocation, random number generation, and environment access.
    ///
    /// ## Excluded Functions
    ///
    /// - `exit`, `abort`, `atexit`, `at_quick_exit` — Process termination deferred
    /// - `qsort`, `bsearch` — Require C function pointer comparators
    /// - `system` — Security concerns
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let value = C.Stdlib.Conversion.toInt("42")
    /// let ptr = try C.Stdlib.Memory.allocate(count: 100)
    /// let env = C.Stdlib.Environment.get("PATH")
    /// ```
    public enum Stdlib {}
}
