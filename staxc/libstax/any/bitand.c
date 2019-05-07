#include "../libstax.h"
#include "../platform.h"

void stax_bitand()
{
	ELEMENT *one = staxp_pop_element();
	ELEMENT *two = staxp_pop_element();
	staxp_assert(one->tag == TAG_INT && two->tag == TAG_INT, "|& requires integer arguments");
	one = staxp_unique_int(one);
	for (uint32_t i = 0; i < one->size1; i++)
		one->intdata[i] &= (i < two->size1) ? two->intdata[i] : 0;
	staxp_unpop_element(one);
	staxp_release_element(two);
}
