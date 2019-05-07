#include "../libstax.h"
#include "../platform.h"

int stax_commandline()
{
	stax_push_element(stax_argv);
}
