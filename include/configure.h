#define AUTHOR  "Simone Margaritelli <http://gibson-db.in>"
#define LICENSE "BSD License"
#define VERSION "1.0.0b"
#define BUILD_DATETIME   "09/22/2013 11:46:45"
#define BUILD_GIT_SHA1   "4a287ebf8c07c9626e40ed30c9bce2fda4ab8def"
#define BUILD_GIT_BRANCH "unstable"

/* #undef HAVE_JEMALLOC */

#if defined(__APPLE__) || defined(__linux__) || defined(__sun) || defined(__FreeBSD__)
#define HAVE_BACKTRACE 1
#endif

#ifdef __linux__
#define HAVE_EPOLL 1
#define HAVE_PROC_STAT 1
#endif

#if defined(__APPLE__)
#define HAVE_TASKINFO 1
#endif

#if defined(__APPLE__) || defined(__FreeBSD__) || defined(__OpenBSD__) || defined (__NetBSD__)
#define HAVE_KQUEUE 1
#endif

#ifdef __sun
#include <sys/feature_tests.h>
#ifdef _DTRACE_VERSION
#define HAVE_EVPORT 1
#endif
#endif

#ifndef HAVE_EVPORT
#ifndef HAVE_EPOLL
#ifndef HAVE_KQUEUE
#	define HAVE_SELECT 1
#endif
#endif
#endif

#ifdef HAVE_EVPORT
#define GB_MUX_API "evport"
#else
#ifdef HAVE_EPOLL
#define GB_MUX_API "epoll"    
#else
#ifdef HAVE_KQUEUE
#define GB_MUX_API "kqueue"
#else
#define GB_MUX_API "select"
#endif
#endif
#endif
