# swift-iso-9899

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Foundation-free Swift implementation of ISO/IEC 9899 (C Standard) mathematical functions.

## Overview

This package provides Swift access to mathematical functions defined in **ISO/IEC 9899:2018 Section 7.12 (Mathematics)** without requiring Foundation. It wraps the platform's standard C math library with a clean, type-safe Swift API.

## Why ISO 9899?

- **IEEE 754-2019** only *recommends* mathematical functions (Clause 9), doesn't require them
- **ISO/IEC 9899** (C Standard) *defines* the complete math library in Section 7.12
- ISO 9899 specifies function prototypes, behavior, and semantics
- This is the authoritative standard for mathematical function interfaces

## Complete ISO/IEC 9899:2018 Section 7.12 Coverage

This package provides **complete coverage** of all mathematical functions defined in ISO/IEC 9899:2018 Section 7.12.

### Classification Functions (Section 7.12.3)
- `fpclassify(_:)` - Classify floating-point value (normal, zero, subnormal, infinite, NaN)
- `isfinite(_:)` - Test for finite value
- `isinf(_:)` - Test for infinity
- `isnan(_:)` - Test for NaN
- `isnormal(_:)` - Test for normal value
- `signbit(_:)` - Test sign bit

### Trigonometric Functions (Section 7.12.4)
- `sin(_:)`, `cos(_:)`, `tan(_:)` - Basic trigonometric functions
- `asin(_:)`, `acos(_:)`, `atan(_:)` - Inverse trigonometric functions
- `atan2(_:_:)` - Arc tangent of y/x with quadrant information

### Hyperbolic Functions (Section 7.12.5)
- `sinh(_:)`, `cosh(_:)`, `tanh(_:)` - Hyperbolic functions
- `asinh(_:)`, `acosh(_:)`, `atanh(_:)` - Inverse hyperbolic functions

### Exponential and Logarithmic Functions (Section 7.12.6)
- `exp(_:)`, `exp2(_:)` - Exponential functions (e^x, 2^x)
- `log(_:)`, `log2(_:)`, `log10(_:)` - Logarithmic functions
- `expm1(_:)`, `log1p(_:)` - High-precision variants for values near zero

### Power and Absolute-Value Functions (Section 7.12.7)
- `pow(_:_:)` - Compute x raised to the power y
- `sqrt(_:)`, `cbrt(_:)` - Square root and cube root
- `fabs(_:)` - Absolute value
- `hypot(_:_:)` - Euclidean distance (sqrt(x² + y²))

### Error and Gamma Functions (Section 7.12.8)
- `erf(_:)`, `erfc(_:)` - Error function and complementary error function
- `tgamma(_:)`, `lgamma(_:)` - Gamma function and log gamma

### Rounding Functions (Section 7.12.9)
- `ceil(_:)`, `floor(_:)`, `trunc(_:)` - Directional rounding
- `round(_:)` - Round to nearest (ties away from zero)
- `rint(_:)`, `nearbyint(_:)` - Round using current rounding mode
- `lrint(_:)`, `llrint(_:)` - Round and convert to integer
- `lround(_:)`, `llround(_:)` - Round (ties away) and convert to integer

### Remainder Functions (Section 7.12.10)
- `fmod(_:_:)` - Floating-point remainder
- `remainder(_:_:)` - IEEE remainder
- `remquo(_:_:_:)` - Remainder with quotient

### Manipulation Functions (Section 7.12.11)
- `copysign(_:_:)` - Copy sign between values
- `nan(_:)`, `nanf(_:)` - Create NaN with payload
- `nextafter(_:_:)`, `nexttoward(_:_:)` - Next representable value

### Maximum, Minimum, and Difference (Section 7.12.12)
- `fmax(_:_:)`, `fmin(_:_:)` - Maximum and minimum (NaN-aware)
- `fdim(_:_:)` - Positive difference

### Floating Multiply-Add (Section 7.12.13)
- `fma(_:_:_:)` - Fused multiply-add with single rounding

### Comparison Macros (Section 7.12.14)
- `isgreater(_:_:)` - Quiet > comparison (no exception on NaN)
- `isgreaterequal(_:_:)` - Quiet >= comparison
- `isless(_:_:)` - Quiet < comparison
- `islessequal(_:_:)` - Quiet <= comparison
- `islessgreater(_:_:)` - Quiet != comparison
- `isunordered(_:_:)` - Test for unordered (NaN) arguments

### Mathematical Constants
- Fundamental: π, e, τ
- Square roots: √2, √3, √5, 1/√2
- Logarithms: ln(2), ln(10), log₂(e), log₁₀(e), log₂(10)
- Golden ratio: φ
- Angular conversions: degrees ↔ radians
- Common π fractions: π/2, π/3, π/4, π/6, 2π
- Euler-Mascheroni: γ

All functions implement IEEE 754 semantics per Annex F.

## Usage

### Direct Namespace Access

```swift
import ISO_9899

// Power functions
let power = ISO_9899.Math.pow(2.0, 3.0)  // 8.0
let gamma = ISO_9899.Math.pow(c, 1.0/2.4)  // Gamma correction
let root = ISO_9899.Math.sqrt(16.0)  // 4.0

// Trigonometric functions
let sine = ISO_9899.Math.sin(.pi / 2)  // 1.0
let cosine = ISO_9899.Math.cos(0)  // 1.0
let angle = ISO_9899.Math.atan2(1.0, 1.0)  // π/4

// Exponential and logarithmic functions
let e = ISO_9899.Math.exp(1.0)  // 2.71828...
let power2 = ISO_9899.Math.exp2(10.0)  // 1024.0
let ln = ISO_9899.Math.log(2.71828)  // 1.0
let log2 = ISO_9899.Math.log2(1024.0)  // 10.0

// Absolute value and additional power functions
let abs = ISO_9899.Math.fabs(-3.14)   // 3.14
let dist = ISO_9899.Math.hypot(3.0, 4.0)   // 5.0
let cubeRoot = ISO_9899.Math.cbrt(27.0)    // 3.0
let max = ISO_9899.Math.fmax(3.0, 5.0)     // 5.0
let min = ISO_9899.Math.fmin(3.0, 5.0)     // 3.0

// Rounding functions
let rounded = ISO_9899.Math.ceil(2.3)   // 3.0
let floored = ISO_9899.Math.floor(2.7)  // 2.0
let nearest = ISO_9899.Math.round(2.5)  // 3.0 (ties away from zero)
let truncated = ISO_9899.Math.trunc(-2.7)  // -2.0

// Classification functions
let classification = ISO_9899.Math.fpclassify(1.0)    // .normal
let isFinite = ISO_9899.Math.isfinite(.infinity)      // false
let isNaN = ISO_9899.Math.isnan(.nan)                 // true
let signBit = ISO_9899.Math.signbit(-0.0)             // true

// Comparison functions (quiet - no exception on NaN)
let greater = ISO_9899.Math.isgreater(5.0, 3.0)      // true
let lessOrGreater = ISO_9899.Math.islessgreater(5.0, .nan)  // false
let unordered = ISO_9899.Math.isunordered(.nan, 5.0)  // true

// Integer-returning rounding
let asInt = ISO_9899.Math.lround(2.5)                 // 3
let asInt64 = ISO_9899.Math.llround(2.5)              // 3

// Mathematical constants
let circumference = 2 * ISO_9899.Math.Constants.pi * radius
let radians = degrees * ISO_9899.Math.Constants.degreesToRadians
let sqrt2 = ISO_9899.Math.Constants.sqrt2
let goldenRatio = ISO_9899.Math.Constants.phi

// Works with Float too
let f: Float = ISO_9899.Math.sin(Float.pi / 4)
```

### Ergonomic `.c` Namespace (Swifty API)

```swift
import ISO_9899

let x = 2.0

// Power functions
let squared = x.c.pow(3.0)      // 8.0
let root = x.c.sqrt             // 1.41421356...

// Trigonometric functions
let sine = x.c.sin              // 0.90929742...
let cosine = x.c.cos            // -0.41614683...
let tangent = x.c.tan           // -2.18503986...

// Exponential and logarithmic functions
let exp = x.c.exp               // 7.389056...
let log = x.c.log               // 0.693147180...
let log2 = x.c.log2             // 1.0

// Absolute value and additional power functions
let abs = (-x).c.abs            // 2.0
let dist = x.c.hypot(3.0)       // 3.60555127...
let cube = x.c.cbrt             // 1.25992104...
let maximum = x.c.max(5.0)      // 5.0
let minimum = x.c.min(5.0)      // 2.0

// Rounding functions
let ceil = (2.3).c.ceil         // 3.0
let floor = (2.7).c.floor       // 2.0
let round = (2.5).c.round       // 3.0
let trunc = (-2.7).c.trunc      // -2.0

// Classification functions
let classification = (1.0).c.classification          // .normal
let isFinite = Double.infinity.c.isFinite            // false
let isNaN = Double.nan.c.isNaN                       // true
let hasNegativeSign = (-0.0).c.hasNegativeSign       // true

// Comparison functions (quiet - no exception on NaN)
let greater = (5.0).c.isGreater(than: 3.0)           // true
let lessOrGreater = (5.0).c.isNotEqual(to: .nan)     // false
let unordered = Double.nan.c.isUnordered(with: 5.0)  // true

// Integer-returning rounding
let asInt = (2.5).c.roundToInt()                     // 3
let asInt64 = (2.5).c.roundToInt64()                 // 3

// Works with Float too
let y: Float = 1.5
let result = y.c.sqrt           // 1.22474487
```

## Platform Support

- **macOS 13+**
- **iOS 16+**
- **tvOS 16+**
- **watchOS 9+**
- **Linux** (via Glibc)
- **Windows** (via UCRT)

## Implementation

The package consists of:
1. **CISO9899Math** - C module providing platform-agnostic wrappers
2. **ISO 9899** - Swift interface with clean API and documentation

All functions are inlined for optimal performance.

## Standards Reference

- **ISO/IEC 9899:2018** - Programming Languages — C
  - Section 7.12: Mathematics `<math.h>`
  - Section 7.12.4: Trigonometric functions
  - Section 7.12.6: Exponential and logarithmic functions
  - Section 7.12.7: Power and absolute-value functions
  - Section 7.12.9: Rounding functions
  - Annex F: IEC 60559 floating-point arithmetic (IEEE 754 compliance)

## Requirements

- Swift 6.0+
- No Foundation dependency
- Platform C standard library

## License

Apache 2.0
