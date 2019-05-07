#include "../libstax.h"
#include "../platform.h"

void stax_subtract()
{
	ELEMENT *second = staxp_pop_element();
	ELEMENT *first = staxp_pop_element();

	switch (second->tag) {
		case TAG_INT:
			second = staxp_unique_int(second);
			second->sign = second->sign ? 0 : 1;
			staxp_unpop_element(first);
			staxp_unpop_element(second);
			stax_add();
			return;
		default:
			staxp_assertfail("subtract is not implemented for this type yet");
	}
}
