# Principled ISO C Byte String Representation in Swift

## Abstract

This paper presents a type-theoretic approach to representing ISO/IEC 9899 (C standard) byte strings in Swift. We argue that ISO C strings constitute a distinct semantic domain from operating system path strings, requiring independent type representation. Our design introduces `ISO_9899.String` as an owned `~Copyable` struct with `Char = UInt8` on all platforms, faithfully capturing the byte-oriented semantics specified in the C standard while avoiding platform-dependent C type leakage. We employ Swift's ownership system (`~Copyable`, `~Escapable`) to encode resource management invariants at the type level.

## 1. Introduction

The intersection of Swift and C presents subtle challenges in string representation. While Swift's `String` type provides Unicode-correct text handling with copy-on-write semantics, systems programming frequently requires interaction with C APIs that operate on null-terminated byte sequences. The naive approach—exposing C's `char*` directly via Swift's `CChar` type—introduces several problems:

1. **Platform-dependent signedness**: `CChar` maps to `Int8` on some platforms and `UInt8` on others, creating potential for subtle comparison bugs.

2. **Semantic conflation**: C's `<string.h>` functions operate on byte sequences, but file path APIs have divergent requirements across operating systems.

3. **Ownership ambiguity**: Raw pointers provide no compile-time guarantees about memory validity or ownership transfer.

This work addresses these challenges through a principled type design that separates the ISO C byte string domain from OS-native path strings, using Swift's type system to enforce correctness invariants.

## 2. Design Principles

Our design adheres to several principles:

**P1. No C Type Leakage**: Public Swift APIs must not expose `CChar`, `wchar_t`, or other C bridging types. These types exist for FFI convenience but carry platform-dependent semantics inappropriate for public interfaces.

**P2. Semantic Fidelity**: Types should faithfully represent their source domain. `ISO_9899.String` represents ISO C byte strings, not an abstraction over multiple string representations.

**P3. Ownership Encoding**: Memory safety invariants should be encoded in the type system using Swift's ownership annotations (`~Copyable`, `~Escapable`).

**P4. API Consistency**: String type families should follow consistent naming patterns. The owned type is `String`, the borrowed type is `String.View`.

## 3. Type Design

### 3.1 Owned String Type

```swift
extension ISO_9899 {
    public struct String: ~Copyable {
        @usableFromInline
        internal let pointer: UnsafeMutablePointer<Char>
        public let count: Int

        @inlinable
        deinit { pointer.deallocate() }
    }
}
```

The owned string type manages heap-allocated byte strings with RAII semantics. The `~Copyable` constraint enforces unique ownership, preventing double-free bugs. The `deinit` deallocates storage, ensuring no memory leaks.

### 3.2 View Type (Borrowed Access)

```swift
extension ISO_9899.String {
    public struct View: ~Copyable, ~Escapable {
        public let pointer: UnsafePointer<Char>

        @inlinable
        @_lifetime(borrow pointer)
        public init(_ pointer: UnsafePointer<Char>) {
            self.pointer = pointer
        }
    }
}
```

The `View` type provides borrowed access to null-terminated byte sequences. The `~Escapable` constraint ensures at compile time that a `View` cannot outlive its backing storage, preventing use-after-free bugs.

### 3.3 Character Type

```swift
extension ISO_9899.String {
    public typealias Char = UInt8

    @inlinable
    public static var terminator: Char { 0 }
}
```

We define `Char = UInt8` unconditionally on all platforms:

1. **Unsigned semantics**: Matches ISO C's use of `unsigned char` for byte operations.
2. **Consistent representation**: Unlike `CChar`, `UInt8` has identical semantics across all platforms.
3. **No C leakage**: `UInt8` is a native Swift type, not a C bridging artifact.

## 4. Core/Hosted Separation

The package separates into two targets:

**Core** (OS-core runtime assumed):
- `ISO_9899.String` (owned)
- `ISO_9899.String.View` (borrowed)
- `ISO_9899.String.Char`
- `ISO_9899.Errno`
- String operations (copy, compare, search)

**Hosted** (full C runtime assumed):
- Convenience initializers: `init(copying:)`
- `ISO_9899.Stdlib` (malloc, free, etc.)
- `ISO_9899.Ctype`

### 4.1 Design Rationale

The distinction is **not** "heap vs no-heap"—Core can own memory. The distinction is:

- **Core**: Minimal OS runtime (TLS errno, Swift allocation)
- **Hosted**: Full C library (malloc/free as C functions, ctype, stdio)

The owned `String` type lives in Core because:

1. Swift's `UnsafeMutablePointer.allocate()` and `.deallocate()` are always available
2. Ownership semantics are independent of which allocator provided the memory
3. The `init(adopting:count:)` initializer takes ownership of externally-allocated buffers

Convenience initializers like `init(copying:)` live in Hosted because they use C library functions (`strcpy`) for the copy operation.

## 5. Architectural Layering

```
┌─────────────────────────────────────────────────────┐
│                  swift-strings                       │
│         Bridging: Swift.String ↔ domains            │
└─────────────────────────────────────────────────────┘
                         │
         ┌───────────────┴───────────────┐
         ▼                               ▼
┌─────────────────────┐     ┌─────────────────────────┐
│   swift-iso-9899    │     │ swift-string-primitives │
│  ISO C byte strings │     │  OS-native path strings │
│   Char = UInt8      │     │ Char = CChar / UInt16   │
└─────────────────────┘     └─────────────────────────┘
```

**swift-iso-9899** (this package): Faithful ISO C semantics. `Char = UInt8` always. Used for C library interop where byte-level control is required.

**swift-string-primitives**: OS-native path strings. `Char` varies by platform to match OS API requirements. Used for file system operations requiring platform-correct encoding.

**swift-strings**: High-level bridging layer providing extension initializers for conversion between `Swift.String`, `ISO_9899.String`, and `String_Primitives.String`.

## 6. The Windows Case Study

Windows provides the clearest validation of our architectural separation:

```swift
// ISO C semantics: fopen with ACP byte encoding
let isoPath: ISO_9899.String = ...
fopen(isoPath.pointer, "r")  // Works, but ACP-limited

// OS-native semantics: _wfopen with UTF-16
let nativePath: String_Primitives.String = ...
_wfopen(nativePath.pointer, L"r")  // Unicode-correct
```

If `ISO_9899.String` were a typealias to `String_Primitives.String`, on Windows it would have `Char = UInt16`. But ISO C's `<string.h>` functions operate on `char*` (bytes), not `wchar_t*`. The type mismatch would prevent compilation of correct code.

## 7. API Consistency

The naming pattern matches `String_Primitives.String`:

| Pattern | ISO_9899 | String_Primitives |
|---------|----------|-------------------|
| Owned type | `ISO_9899.String` | `String_Primitives.String` |
| Borrowed type | `ISO_9899.String.View` | `String_Primitives.String.View` |
| Character type | `ISO_9899.String.Char` | `String_Primitives.String.Char` |

This consistency enables users to transfer knowledge between packages and simplifies generic programming over string types.

## 8. Memory Safety Analysis

### 8.1 Bug Classes Prevented

| Bug Class | Prevention Mechanism |
|-----------|---------------------|
| Double-free | `~Copyable` prevents multiple owners |
| Use-after-free | `~Escapable` prevents escaping views |
| Memory leak | `deinit` ensures deallocation |
| Buffer overread | Length caching avoids repeated traversal |

### 8.2 Ownership Transfer

The `take()` method enables explicit ownership transfer:

```swift
let (ptr, count) = owned.take()
// Caller now owns ptr, must deallocate
```

This prevents the `deinit` from running, transferring responsibility to the caller.

## 9. Conclusion

We have presented a principled approach to representing ISO C byte strings in Swift that:

1. Uses `UInt8` consistently, avoiding C type leakage and signedness ambiguity.
2. Employs Swift's ownership system to encode memory safety invariants.
3. Maintains clear separation from OS-native path strings.
4. Follows consistent naming conventions with related packages.
5. Separates Core (ownership semantics) from Hosted (convenience initializers).

The design demonstrates that faithful representation of external standards, combined with Swift's advanced type features, yields APIs that are both safe and semantically precise.

## References

1. ISO/IEC 9899:2018. Programming languages — C.
2. The Swift Programming Language: Ownership.
3. swift-string-primitives: OS-native path string representation.
4. swift-strings: String domain bridging layer.
