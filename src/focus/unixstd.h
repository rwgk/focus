#ifndef A_UNIXSTD_H__
#define A_UNIXSTD_H__


#if (defined(__ALPHA) && defined(__VMS))

#define unlink remove
#include <socket.h> /* declaration of gethostname() */

#else

#if defined(__sgi)
#include <sys/uio.h>
#include <sys/time.h>
#endif

#include <unistd.h>
#if ! defined(__hpux) && ! defined(_ABIN32)
extern int gethostname(char *, int);
#endif

#endif


#endif /* A_UNIXSTD_H__ */
