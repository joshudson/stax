#include "../libstax.h"
#include "../platform.h"

void stax_next(void)
{
	ELEMENT *two = staxp_pop_element();
	ELEMENT *one = staxp_pop_element();
	staxp_unpop_element(one);
	staxp_unpop_element(two);
	stax_push_element(one);
}
