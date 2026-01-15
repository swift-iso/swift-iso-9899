// iso9899_errno.h
// swift-iso-9899
//
// ISO/IEC 9899:2018 Section 7.5 - Errors <errno.h>
//
// errno is typically a macro that expands to a modifiable lvalue.
// Swift cannot import C macros directly, so we wrap access in functions.

#ifndef ISO9899_ERRNO_H
#define ISO9899_ERRNO_H

#include <errno.h>

// Thread-local errno access
static inline int iso9899_get_errno(void) { return errno; }
static inline void iso9899_set_errno(int value) { errno = value; }

// ISO C error codes (Section 7.5)
// These are guaranteed by the standard
static inline int iso9899_EDOM(void) { return EDOM; }
static inline int iso9899_EILSEQ(void) { return EILSEQ; }
static inline int iso9899_ERANGE(void) { return ERANGE; }

// POSIX error codes (commonly available on all platforms)
// These are widely supported but technically POSIX extensions

#ifdef EACCES
static inline int iso9899_EACCES(void) { return EACCES; }
#endif

#ifdef EAGAIN
static inline int iso9899_EAGAIN(void) { return EAGAIN; }
#endif

#ifdef EBADF
static inline int iso9899_EBADF(void) { return EBADF; }
#endif

#ifdef EBUSY
static inline int iso9899_EBUSY(void) { return EBUSY; }
#endif

#ifdef EEXIST
static inline int iso9899_EEXIST(void) { return EEXIST; }
#endif

#ifdef EFAULT
static inline int iso9899_EFAULT(void) { return EFAULT; }
#endif

#ifdef EINTR
static inline int iso9899_EINTR(void) { return EINTR; }
#endif

#ifdef EINVAL
static inline int iso9899_EINVAL(void) { return EINVAL; }
#endif

#ifdef EIO
static inline int iso9899_EIO(void) { return EIO; }
#endif

#ifdef EISDIR
static inline int iso9899_EISDIR(void) { return EISDIR; }
#endif

#ifdef EMFILE
static inline int iso9899_EMFILE(void) { return EMFILE; }
#endif

#ifdef ENFILE
static inline int iso9899_ENFILE(void) { return ENFILE; }
#endif

#ifdef ENOENT
static inline int iso9899_ENOENT(void) { return ENOENT; }
#endif

#ifdef ENOMEM
static inline int iso9899_ENOMEM(void) { return ENOMEM; }
#endif

#ifdef ENOSPC
static inline int iso9899_ENOSPC(void) { return ENOSPC; }
#endif

#ifdef ENOTDIR
static inline int iso9899_ENOTDIR(void) { return ENOTDIR; }
#endif

#ifdef ENOTEMPTY
static inline int iso9899_ENOTEMPTY(void) { return ENOTEMPTY; }
#endif

#ifdef ENOSYS
static inline int iso9899_ENOSYS(void) { return ENOSYS; }
#endif

#ifdef ENOTTY
static inline int iso9899_ENOTTY(void) { return ENOTTY; }
#endif

#ifdef EPERM
static inline int iso9899_EPERM(void) { return EPERM; }
#endif

#ifdef EPIPE
static inline int iso9899_EPIPE(void) { return EPIPE; }
#endif

#ifdef EROFS
static inline int iso9899_EROFS(void) { return EROFS; }
#endif

#ifdef ESPIPE
static inline int iso9899_ESPIPE(void) { return ESPIPE; }
#endif

#ifdef ESRCH
static inline int iso9899_ESRCH(void) { return ESRCH; }
#endif

#ifdef ETIMEDOUT
static inline int iso9899_ETIMEDOUT(void) { return ETIMEDOUT; }
#endif

#ifdef EXDEV
static inline int iso9899_EXDEV(void) { return EXDEV; }
#endif

#ifdef EWOULDBLOCK
static inline int iso9899_EWOULDBLOCK(void) { return EWOULDBLOCK; }
#endif

#ifdef ELOOP
static inline int iso9899_ELOOP(void) { return ELOOP; }
#endif

#ifdef ENAMETOOLONG
static inline int iso9899_ENAMETOOLONG(void) { return ENAMETOOLONG; }
#endif

#ifdef EOVERFLOW
static inline int iso9899_EOVERFLOW(void) { return EOVERFLOW; }
#endif

#endif // ISO9899_ERRNO_H
