#ifndef DEBUG
#define NDEBUG
#endif

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "../libstax.h"
#include "../platform.h"

noreturn staxp_assertfail(const char *s)
{
	fflush(stdout);
	fprintf(stderr, "assertion failed: %s\n", s);
	assert(0);
	exit(3);
}
