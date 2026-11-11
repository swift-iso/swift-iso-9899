#ifndef ISO9899_STDIO_H
#define ISO9899_STDIO_H

#include <stdio.h>

static inline int iso9899_fputs_stdout(const char *s) { return fputs(s, stdout); }
static inline int iso9899_fputs_stderr(const char *s) { return fputs(s, stderr); }
static inline int iso9899_eof(void) { return EOF; }

#endif
