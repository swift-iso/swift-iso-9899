// ISO_9899.Ctype.swift
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.4 - Character handling <ctype.h>

import CISO9899Ctype

extension ISO_9899 {
    /// Section 7.4: Character handling `<ctype.h>`
    ///
    /// Character classification and case mapping functions.
    ///
    /// ## Overview
    ///
    /// These functions classify characters and perform case conversions.
    /// All functions take an `Int32` representing a character value that
    /// must be representable as an `unsigned char` or equal to `EOF`.
    ///
    /// ## Locale Dependency
    ///
    /// The behavior of these functions (except `isDigit` and `isXDigit`)
    /// is affected by the current locale. This implementation uses the
    /// C locale as configured on the system.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let c: Int32 = 65  // 'A'
    ///
    /// if C.Ctype.isAlpha(c) {
    ///     let lower = C.Ctype.toLower(c)  // 97 ('a')
    /// }
    /// ```
    public enum Ctype {}
}

// MARK: - Character Classification (Section 7.4.1)

extension ISO_9899.Ctype {
    /// Tests if character is alphanumeric.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.1
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is alphanumeric.
    @inline(always)
    public static func isAlphanumeric(_ c: Int32) -> Bool {
        iso9899_isalnum(c) != 0
    }

    /// Tests if character is alphabetic.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.2
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is alphabetic.
    @inline(always)
    public static func isAlpha(_ c: Int32) -> Bool {
        iso9899_isalpha(c) != 0
    }

    /// Tests if character is blank (space or tab).
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.3
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is a blank character.
    @inline(always)
    public static func isBlank(_ c: Int32) -> Bool {
        iso9899_isblank(c) != 0
    }

    /// Tests if character is a control character.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.4
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is a control character.
    @inline(always)
    public static func isControl(_ c: Int32) -> Bool {
        iso9899_iscntrl(c) != 0
    }

    /// Tests if character is a decimal digit.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.5
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is a digit (0-9).
    @inline(always)
    public static func isDigit(_ c: Int32) -> Bool {
        iso9899_isdigit(c) != 0
    }

    /// Tests if character has graphical representation.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.6
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is a graphical character (not space).
    @inline(always)
    public static func isGraph(_ c: Int32) -> Bool {
        iso9899_isgraph(c) != 0
    }

    /// Tests if character is lowercase.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.7
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is lowercase.
    @inline(always)
    public static func isLower(_ c: Int32) -> Bool {
        iso9899_islower(c) != 0
    }

    /// Tests if character is printable.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.8
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is printable (including space).
    @inline(always)
    public static func isPrint(_ c: Int32) -> Bool {
        iso9899_isprint(c) != 0
    }

    /// Tests if character is punctuation.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.9
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is punctuation.
    @inline(always)
    public static func isPunctuation(_ c: Int32) -> Bool {
        iso9899_ispunct(c) != 0
    }

    /// Tests if character is whitespace.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.10
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is whitespace.
    @inline(always)
    public static func isSpace(_ c: Int32) -> Bool {
        iso9899_isspace(c) != 0
    }

    /// Tests if character is uppercase.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.11
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is uppercase.
    @inline(always)
    public static func isUpper(_ c: Int32) -> Bool {
        iso9899_isupper(c) != 0
    }

    /// Tests if character is a hexadecimal digit.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.1.12
    ///
    /// - Parameter c: Character to test.
    /// - Returns: `true` if `c` is a hex digit (0-9, A-F, a-f).
    @inline(always)
    public static func isHexDigit(_ c: Int32) -> Bool {
        iso9899_isxdigit(c) != 0
    }
}

// MARK: - Character Case Mapping (Section 7.4.2)

extension ISO_9899.Ctype {
    /// Converts character to lowercase.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.2.1
    ///
    /// - Parameter c: Character to convert.
    /// - Returns: Lowercase equivalent if `c` is uppercase, otherwise `c`.
    @inline(always)
    public static func toLower(_ c: Int32) -> Int32 {
        iso9899_tolower(c)
    }

    /// Converts character to uppercase.
    ///
    /// ISO/IEC 9899:2018 Section 7.4.2.2
    ///
    /// - Parameter c: Character to convert.
    /// - Returns: Uppercase equivalent if `c` is lowercase, otherwise `c`.
    @inline(always)
    public static func toUpper(_ c: Int32) -> Int32 {
        iso9899_toupper(c)
    }
}
