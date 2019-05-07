#include "../libstax.h"
#include "../platform.h"
#include <stdio.h>

void staxp_foreach(int (*blockcode)(void))
{
	ELEMENT *a = staxp_pop_element();
	while (a->tag == TAG_BLOCK) {
		/* if F receives a block as its second argument, it is evaluated (undocumented) */
		a->blockcode();
		staxp_release_element(a);
		a = staxp_pop_element();
	}
	switch(a->tag)
	{
		case TAG_ARRAY:
			for (uint32_t i = 0; i < a->size1; ++i) {
				stax_push_element(a->arraydata[i]);
				if (blockcode())
					break;
			}
			break;
		case TAG_STRING:
			for (uint32_t i = 0; i < a->size1; ++i) {
				staxp_unpop_element(staxp_int_from_uint32(a->stringdata[i]));
				if (blockcode())
					break;
			}
			break;
		default:
			staxp_assertfail("Expected: array for foreach");
	}
	staxp_release_element(a);
}
