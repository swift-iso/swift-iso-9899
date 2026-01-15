// iso9899_ctype.h
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.4 - Character handling <ctype.h>
//
// ctype functions are often implemented as macros.
// Swift cannot import C macros directly, so we wrap them in functions.

#ifndef ISO9899_CTYPE_H
#define ISO9899_CTYPE_H

#include <ctype.h>

// Character classification functions (Section 7.4.1)
static inline int iso9899_isalnum(int c) { return isalnum(c); }
static inline int iso9899_isalpha(int c) { return isalpha(c); }
static inline int iso9899_isblank(int c) { return isblank(c); }
static inline int iso9899_iscntrl(int c) { return iscntrl(c); }
static inline int iso9899_isdigit(int c) { return isdigit(c); }
static inline int iso9899_isgraph(int c) { return isgraph(c); }
static inline int iso9899_islower(int c) { return islower(c); }
static inline int iso9899_isprint(int c) { return isprint(c); }
static inline int iso9899_ispunct(int c) { return ispunct(c); }
static inline int iso9899_isspace(int c) { return isspace(c); }
static inline int iso9899_isupper(int c) { return isupper(c); }
static inline int iso9899_isxdigit(int c) { return isxdigit(c); }

// Character case mapping functions (Section 7.4.2)
static inline int iso9899_tolower(int c) { return tolower(c); }
static inline int iso9899_toupper(int c) { return toupper(c); }

#endif // ISO9899_CTYPE_H
