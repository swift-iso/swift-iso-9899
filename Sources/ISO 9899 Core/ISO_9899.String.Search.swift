// ISO_9899.String.Search.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.24.5 - Search functions

import CISO9899String

extension ISO_9899.String {
    /// String search functions from `<string.h>`
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5
    ///
    /// ## Usage
    ///
    /// ```swift
    /// if let ptr = ISO_9899.String.Search.character(in: str, byte: 0x41) {
    ///     // Found 'A' in string
    /// }
    /// ```
    public enum Search {}
}

// MARK: - strchr

extension ISO_9899.String.Search {
    /// Locates first occurrence of a byte in a string.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.2 — The `strchr` function
    ///
    /// Locates the first occurrence of `byte` in the string pointed to by `string`.
    /// The terminating null character is considered part of the string.
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string to search.
    ///   - byte: Byte value to search for.
    /// - Returns: Pointer to the located byte, or `nil` if not found.
    @inline(__always)
    public static func character(
        in string: UnsafePointer<ISO_9899.String.Char>,
        byte: ISO_9899.String.Char
    ) -> UnsafePointer<ISO_9899.String.Char>? {
        iso9899_strchr_const(string, Int32(byte))
    }

    /// Locates first occurrence of a byte in a string (mutable).
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.2 — The `strchr` function
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string to search.
    ///   - byte: Byte value to search for.
    /// - Returns: Mutable pointer to the located byte, or `nil` if not found.
    @inline(__always)
    public static func character(
        in string: UnsafeMutablePointer<ISO_9899.String.Char>,
        byte: ISO_9899.String.Char
    ) -> UnsafeMutablePointer<ISO_9899.String.Char>? {
        iso9899_strchr(string, Int32(byte))
    }
}

// MARK: - strrchr

extension ISO_9899.String.Search {
    /// Locates last occurrence of a byte in a string.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.5 — The `strrchr` function
    ///
    /// Locates the last occurrence of `byte` in the string pointed to by `string`.
    /// The terminating null character is considered part of the string.
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string to search.
    ///   - byte: Byte value to search for.
    /// - Returns: Pointer to the located byte, or `nil` if not found.
    @inline(__always)
    public static func lastCharacter(
        in string: UnsafePointer<ISO_9899.String.Char>,
        byte: ISO_9899.String.Char
    ) -> UnsafePointer<ISO_9899.String.Char>? {
        iso9899_strrchr_const(string, Int32(byte))
    }

    /// Locates last occurrence of a byte in a string (mutable).
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.5 — The `strrchr` function
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string to search.
    ///   - byte: Byte value to search for.
    /// - Returns: Mutable pointer to the located byte, or `nil` if not found.
    @inline(__always)
    public static func lastCharacter(
        in string: UnsafeMutablePointer<ISO_9899.String.Char>,
        byte: ISO_9899.String.Char
    ) -> UnsafeMutablePointer<ISO_9899.String.Char>? {
        iso9899_strrchr(string, Int32(byte))
    }
}

// MARK: - strstr

extension ISO_9899.String.Search {
    /// Locates a substring within a string.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.7 — The `strstr` function
    ///
    /// Locates the first occurrence of the sequence of bytes (excluding the
    /// terminating null) in the string pointed to by `needle` in the string
    /// pointed to by `haystack`.
    ///
    /// - Parameters:
    ///   - haystack: Pointer to null-terminated string to search.
    ///   - needle: Pointer to null-terminated substring to find.
    /// - Returns: Pointer to the located substring, or `nil` if not found.
    @inline(__always)
    public static func substring(
        in haystack: UnsafePointer<ISO_9899.String.Char>,
        find needle: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafePointer<ISO_9899.String.Char>? {
        iso9899_strstr_const(haystack, needle)
    }

    /// Locates a substring within a string (mutable).
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.7 — The `strstr` function
    ///
    /// - Parameters:
    ///   - haystack: Pointer to null-terminated string to search.
    ///   - needle: Pointer to null-terminated substring to find.
    /// - Returns: Mutable pointer to the located substring, or `nil` if not found.
    @inline(__always)
    public static func substring(
        in haystack: UnsafeMutablePointer<ISO_9899.String.Char>,
        find needle: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafeMutablePointer<ISO_9899.String.Char>? {
        iso9899_strstr(haystack, needle)
    }
}

// MARK: - strpbrk

extension ISO_9899.String.Search {
    /// Locates first occurrence of any byte from a set.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.4 — The `strpbrk` function
    ///
    /// Locates the first occurrence in the string pointed to by `string`
    /// of any byte from the string pointed to by `accept`.
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string to search.
    ///   - accept: Pointer to null-terminated string of bytes to find.
    /// - Returns: Pointer to the located byte, or `nil` if not found.
    @inline(__always)
    public static func anyCharacter(
        in string: UnsafePointer<ISO_9899.String.Char>,
        from accept: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafePointer<ISO_9899.String.Char>? {
        iso9899_strpbrk_const(string, accept)
    }

    /// Locates first occurrence of any byte from a set (mutable).
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.4 — The `strpbrk` function
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string to search.
    ///   - accept: Pointer to null-terminated string of bytes to find.
    /// - Returns: Mutable pointer to the located byte, or `nil` if not found.
    @inline(__always)
    public static func anyCharacter(
        in string: UnsafeMutablePointer<ISO_9899.String.Char>,
        from accept: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafeMutablePointer<ISO_9899.String.Char>? {
        iso9899_strpbrk(string, accept)
    }
}

// MARK: - strspn / strcspn

extension ISO_9899.String.Search {
    /// Computes length of initial segment of bytes in a set.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.6 — The `strspn` function
    ///
    /// Computes the length of the maximum initial segment of the string
    /// pointed to by `string` which consists entirely of bytes from
    /// the string pointed to by `accept`.
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string to examine.
    ///   - accept: Pointer to null-terminated string of accepted bytes.
    /// - Returns: Length of the initial segment.
    @inline(__always)
    public static func span(
        in string: UnsafePointer<ISO_9899.String.Char>,
        accept: UnsafePointer<ISO_9899.String.Char>
    ) -> Int {
        iso9899_strspn(string, accept)
    }

    /// Computes length of initial segment of bytes not in a set.
    ///
    /// ISO/IEC 9899:2018 Section 7.24.5.3 — The `strcspn` function
    ///
    /// Computes the length of the maximum initial segment of the string
    /// pointed to by `string` which consists entirely of bytes NOT
    /// from the string pointed to by `reject`.
    ///
    /// - Parameters:
    ///   - string: Pointer to null-terminated string to examine.
    ///   - reject: Pointer to null-terminated string of rejected bytes.
    /// - Returns: Length of the initial segment.
    @inline(__always)
    public static func complementSpan(
        in string: UnsafePointer<ISO_9899.String.Char>,
        reject: UnsafePointer<ISO_9899.String.Char>
    ) -> Int {
        iso9899_strcspn(string, reject)
    }
}
