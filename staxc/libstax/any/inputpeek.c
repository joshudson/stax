#include <stddef.h>
#include "../libstax.h"
#include "../platform.h"

void stax_input_peek(void)
{
	ELEMENT *s = staxp_pop_input_element();
	stax_push_input_element(s);
	staxp_unpop_element(s);
}
