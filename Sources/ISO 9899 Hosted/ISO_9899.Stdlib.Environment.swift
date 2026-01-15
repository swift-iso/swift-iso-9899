// ISO_9899.Stdlib.Environment.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.22.4 - Communication with the environment

import CISO9899Stdlib

extension ISO_9899.Stdlib {
    /// Environment access functions.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.4
    ///
    /// ## Excluded Functions
    ///
    /// - `exit`, `_Exit`, `quick_exit` — Process termination deferred
    /// - `atexit`, `at_quick_exit` — Registration deferred
    /// - `system` — Security concerns
    ///
    /// ## Usage
    ///
    /// ```swift
    /// if let path = C.Stdlib.Environment.get("PATH") {
    ///     // path points to the PATH environment variable value
    /// }
    /// ```
    public enum Environment {}
}

extension ISO_9899.Stdlib.Environment {
    /// Gets an environment variable.
    ///
    /// ISO/IEC 9899:2018 Section 7.22.4.6 — The `getenv` function
    ///
    /// Searches the environment list for a string that matches `name`.
    ///
    /// - Parameter name: Pointer to null-terminated variable name.
    /// - Returns: Pointer to the value string, or `nil` if not found.
    ///
    /// - Warning: The returned pointer points to memory that may be
    ///   modified by subsequent calls to `getenv`, `setenv`, or `unsetenv`.
    ///   Copy the value if you need to preserve it.
    @inline(__always)
    public static func get(
        _ name: UnsafePointer<CChar>
    ) -> UnsafePointer<CChar>? {
        iso9899_getenv(name).map { UnsafePointer($0) }
    }
}
