#include <stddef.h>
#include "../libstax.h"
#include "../platform.h"

void stax_input_pop(void)
{
	ELEMENT *s = staxp_pop_input_element();
	staxp_unpop_element(s);
}
