// ISO_9899.swift
// swift-iso-9899
//
// Main namespace for ISO/IEC 9899:2018 (C Standard Library)

/// ISO/IEC 9899:2018 — Programming Languages — C
///
/// Foundation-free Swift implementation of ISO/IEC 9899:2018 standard library functions.
///
/// ## Overview
///
/// This package provides Swift access to mathematical functions defined in the C standard
/// without requiring Foundation. It wraps the platform's standard C library (`<math.h>`)
/// with a clean, type-safe Swift API.
///
/// ## Standards Compliance
///
/// - **ISO/IEC 9899:2018** Section 7.12: Mathematics `<math.h>`
/// - **Annex F**: IEC 60559 (IEEE 754) floating-point arithmetic compliance
///
/// Platform implementations are assumed to provide IEEE 754-compliant behavior
/// per ISO/IEC 9899:2018 Annex F.
///
/// ## Architecture
///
/// The package consists of two layers:
///
/// 1. **CISO9899Math**: Platform-agnostic C module providing `static inline` wrappers
/// 2. **ISO_9899**: Swift interface with clean API and comprehensive documentation
///
/// ## Usage
///
/// ```swift
/// import ISO_9899
///
/// // Direct namespace access
/// let sine = ISO_9899.Math.sin(Double.pi / 2)  // 1.0
/// let power = ISO_9899.Math.pow(2.0, 10.0)     // 1024.0
///
/// // Ergonomic instance access via .c namespace
/// let x = 1.5
/// let cosine = x.c.cos      // Uses Double.c.cos
/// let root = x.c.sqrt       // Uses Double.c.sqrt
/// ```
///
/// ## Performance
///
/// All functions are marked `@inlinable` for optimal performance. Wrapper functions
/// use `@_transparent` to ensure zero overhead.
///
/// ## See Also
///
/// - ``Math``
public enum ISO_9899 {}

/// Ergonomic alias for ISO_9899.
///
/// Allows natural C-style access:
/// ```swift
/// import ISO_9899
///
/// let len = C.String.length(of: ptr)
/// C.String.Memory.copy(to: dest, from: src, count: 16)
/// let sine = C.Math.sin(x)
/// ```
public typealias C = ISO_9899
