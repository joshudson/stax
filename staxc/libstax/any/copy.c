#include <stddef.h>
#include "../libstax.h"
#include "../platform.h"

void stax_copy(void)
{
	ELEMENT *s = staxp_pop_element();
	staxp_unpop_element(s);
	stax_push_element(s);
}
