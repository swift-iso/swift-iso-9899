// iso9899_string.h
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.24 - String handling <string.h>
//
// Wraps string.h functions for Swift import.
// Uses uint8_t* for string functions to keep char* bridging internal.

#ifndef ISO9899_STRING_H
#define ISO9899_STRING_H

#include <string.h>
#include <stdint.h>

// MARK: - Copying functions (Section 7.24.2)

// memcpy/memmove stay void* (raw byte operations)
static inline void *iso9899_memcpy(void *dest, const void *src, size_t n) {
    return memcpy(dest, src, n);
}

static inline void *iso9899_memmove(void *dest, const void *src, size_t n) {
    return memmove(dest, src, n);
}

// String copies use uint8_t*
static inline uint8_t *iso9899_strcpy(uint8_t *dest, const uint8_t *src) {
    return (uint8_t *)strcpy((char *)dest, (const char *)src);
}

static inline uint8_t *iso9899_strncpy(uint8_t *dest, const uint8_t *src, size_t n) {
    return (uint8_t *)strncpy((char *)dest, (const char *)src, n);
}

// MARK: - Concatenation functions (Section 7.24.3)

static inline uint8_t *iso9899_strcat(uint8_t *dest, const uint8_t *src) {
    return (uint8_t *)strcat((char *)dest, (const char *)src);
}

static inline uint8_t *iso9899_strncat(uint8_t *dest, const uint8_t *src, size_t n) {
    return (uint8_t *)strncat((char *)dest, (const char *)src, n);
}

// MARK: - Comparison functions (Section 7.24.4)

// memcmp stays void* (raw byte comparison)
static inline int iso9899_memcmp(const void *s1, const void *s2, size_t n) {
    return memcmp(s1, s2, n);
}

static inline int iso9899_strcmp(const uint8_t *s1, const uint8_t *s2) {
    return strcmp((const char *)s1, (const char *)s2);
}

static inline int iso9899_strncmp(const uint8_t *s1, const uint8_t *s2, size_t n) {
    return strncmp((const char *)s1, (const char *)s2, n);
}

// MARK: - Search functions (Section 7.24.5)

// memchr: const and mutable overloads
static inline const void *iso9899_memchr_const(const void *s, int c, size_t n) {
    return memchr(s, c, n);
}

static inline void *iso9899_memchr(void *s, int c, size_t n) {
    return memchr(s, c, n);
}

// strchr: const and mutable overloads
static inline const uint8_t *iso9899_strchr_const(const uint8_t *s, int c) {
    return (const uint8_t *)strchr((const char *)s, c);
}

static inline uint8_t *iso9899_strchr(uint8_t *s, int c) {
    return (uint8_t *)strchr((char *)s, c);
}

// strrchr: const and mutable overloads
static inline const uint8_t *iso9899_strrchr_const(const uint8_t *s, int c) {
    return (const uint8_t *)strrchr((const char *)s, c);
}

static inline uint8_t *iso9899_strrchr(uint8_t *s, int c) {
    return (uint8_t *)strrchr((char *)s, c);
}

// strstr: const and mutable overloads
static inline const uint8_t *iso9899_strstr_const(const uint8_t *s1, const uint8_t *s2) {
    return (const uint8_t *)strstr((const char *)s1, (const char *)s2);
}

static inline uint8_t *iso9899_strstr(uint8_t *s1, const uint8_t *s2) {
    return (uint8_t *)strstr((char *)s1, (const char *)s2);
}

// strpbrk: const and mutable overloads
static inline const uint8_t *iso9899_strpbrk_const(const uint8_t *s1, const uint8_t *s2) {
    return (const uint8_t *)strpbrk((const char *)s1, (const char *)s2);
}

static inline uint8_t *iso9899_strpbrk(uint8_t *s1, const uint8_t *s2) {
    return (uint8_t *)strpbrk((char *)s1, (const char *)s2);
}

// span functions (return size_t, no const issue)
static inline size_t iso9899_strcspn(const uint8_t *s1, const uint8_t *s2) {
    return strcspn((const char *)s1, (const char *)s2);
}

static inline size_t iso9899_strspn(const uint8_t *s1, const uint8_t *s2) {
    return strspn((const char *)s1, (const char *)s2);
}

// MARK: - Miscellaneous functions (Section 7.24.6)

// memset stays void* (raw byte fill)
static inline void *iso9899_memset(void *s, int c, size_t n) {
    return memset(s, c, n);
}

static inline size_t iso9899_strlen(const uint8_t *s) {
    return strlen((const char *)s);
}

#endif // ISO9899_STRING_H
