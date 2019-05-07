#include "../libstax.h"
#include "../platform.h"

void stax_alter(void)
{
	ELEMENT *three = staxp_pop_element();
	ELEMENT *two = staxp_pop_element();
	ELEMENT *one = staxp_pop_element();
	staxp_unpop_element(two);
	staxp_unpop_element(three);
	staxp_unpop_element(one);
}
