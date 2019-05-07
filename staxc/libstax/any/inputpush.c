#include <stddef.h>
#include "../libstax.h"
#include "../platform.h"

void stax_input_push(void)
{
	ELEMENT *s = staxp_pop_element();
	stax_push_input_element(s);
	staxp_release_element(s);
}
