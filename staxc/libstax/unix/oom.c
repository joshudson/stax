#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "../libstax.h"
#include "../platform.h"

noreturn staxp_oom(void)
{
	fputs("Out of memory\n", stderr);
	assert(0);
	exit(3);
}
