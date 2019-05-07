#ifndef DEBUG
#define NDEBUG
#endif

#include <stdlib.h>
#include <assert.h>
#include "../libstax.h"
#include "../platform.h"

/* specified to exit with no more output */

noreturn staxp_empty_stack(void) 
{
	assert(0);
	exit(1);
}
