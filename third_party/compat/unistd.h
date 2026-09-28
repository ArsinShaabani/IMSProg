/* Minimal unistd.h shim for MSVC builds (IMSProg Windows port).
   Provides only what the IMSProg sources need from <unistd.h>. */
#ifndef IMSPROG_COMPAT_UNISTD_H
#define IMSPROG_COMPAT_UNISTD_H

#if defined(_MSC_VER)

#include <winsock2.h>
#include <windows.h>
#include <io.h>
#include <process.h>

#ifndef R_OK
#define R_OK 4
#define W_OK 2
#define X_OK 1
#define F_OK 0
#endif

#ifndef STDIN_FILENO
#define STDIN_FILENO 0
#define STDOUT_FILENO 1
#define STDERR_FILENO 2
#endif

static __inline int usleep(unsigned int usec)
{
    Sleep(usec / 1000u);
    return 0;
}

static __inline unsigned int sleep(unsigned int sec)
{
    Sleep(sec * 1000u);
    return 0;
}

#endif /* _MSC_VER */

#endif /* IMSPROG_COMPAT_UNISTD_H */