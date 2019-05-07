#include "../libstax.h"
#include "../platform.h"

void stax_discard(void)
{       
	staxp_release_element(staxp_pop_element());
}
