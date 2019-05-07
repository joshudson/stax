#include <stddef.h>
#include "../libstax.h"
#include "../platform.h"

void stax_swap(void)
{
	ELEMENT *one = staxp_pop_element();
	ELEMENT *two = staxp_pop_element();
	staxp_unpop_element(one);
	staxp_unpop_element(two);
}
