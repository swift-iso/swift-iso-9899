// iso9899_stdlib.h
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.22 - General utilities <stdlib.h>
//
// Wraps stdlib functions that may be macros or need consistent access.

#ifndef ISO9899_STDLIB_H
#define ISO9899_STDLIB_H

#include <stdlib.h>
#include <stdint.h>

// String conversion functions (Section 7.22.1)
// These are typically real functions, but we wrap for consistency.
//
// `long`-returning conversions (atol / strtol / strtoul) return via pointer-width
// intptr_t/uintptr_t rather than C `long`. C `long` is 64-bit on LP64 (macOS/Linux)
// but 32-bit on LLP64 (Windows), so it imports into Swift as `Int`/`UInt` on LP64
// but `Int32`/`UInt32` on Windows — mismatching the Swift wrappers' `Int`/`UInt`.
// intptr_t/uintptr_t are pointer-width on every platform, so they import as Swift
// `Int`/`UInt` uniformly (like ssize_t), letting the wrappers stay conversion-free.
// The C-level widening of the platform `long` result is value-preserving.
static inline double iso9899_atof(const char *nptr) { return atof(nptr); }
static inline int iso9899_atoi(const char *nptr) { return atoi(nptr); }
static inline intptr_t iso9899_atol(const char *nptr) { return atol(nptr); }
static inline long long iso9899_atoll(const char *nptr) { return atoll(nptr); }

static inline double iso9899_strtod(const char *nptr, char **endptr) {
    return strtod(nptr, endptr);
}
static inline float iso9899_strtof(const char *nptr, char **endptr) {
    return strtof(nptr, endptr);
}
static inline long double iso9899_strtold(const char *nptr, char **endptr) {
    return strtold(nptr, endptr);
}
static inline intptr_t iso9899_strtol(const char *nptr, char **endptr, int base) {
    return strtol(nptr, endptr, base);
}
static inline long long iso9899_strtoll(const char *nptr, char **endptr, int base) {
    return strtoll(nptr, endptr, base);
}
static inline uintptr_t iso9899_strtoul(const char *nptr, char **endptr, int base) {
    return strtoul(nptr, endptr, base);
}
static inline unsigned long long iso9899_strtoull(const char *nptr, char **endptr, int base) {
    return strtoull(nptr, endptr, base);
}

// Pseudo-random sequence generation (Section 7.22.2)
static inline int iso9899_rand(void) { return rand(); }
static inline void iso9899_srand(unsigned int seed) { srand(seed); }

// Memory management functions (Section 7.22.3)
static inline void *iso9899_aligned_alloc(size_t alignment, size_t size) {
#if defined(_WIN32)
    return _aligned_malloc(size, alignment);
#else
    return aligned_alloc(alignment, size);
#endif
}
static inline void *iso9899_calloc(size_t nmemb, size_t size) {
    return calloc(nmemb, size);
}
static inline void iso9899_free(void *ptr) { free(ptr); }
static inline void *iso9899_malloc(size_t size) { return malloc(size); }
static inline void *iso9899_realloc(void *ptr, size_t size) {
    return realloc(ptr, size);
}

// Environment functions (Section 7.22.4)
static inline char *iso9899_getenv(const char *name) { return getenv(name); }

// Integer arithmetic functions (Section 7.22.6)
static inline int iso9899_abs(int j) { return abs(j); }
static inline long iso9899_labs(long j) { return labs(j); }
static inline long long iso9899_llabs(long long j) { return llabs(j); }

#endif // ISO9899_STDLIB_H
