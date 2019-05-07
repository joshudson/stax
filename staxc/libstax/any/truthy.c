#include "../libstax.h"
#include "../platform.h"

int staxp_truthy(void)
{
	ELEMENT *e = staxp_pop_element();
	int r = 0;
	switch (e->tag) {
		case TAG_INT:
		case TAG_RATIONAL:
			for (uint32_t i = e->size1; !r && i-- >0;)
				r |= e->intdata[i] != 0;
			break;
		case TAG_ARRAY:
		case TAG_STRING:
			r = e->size1 != 0;
			break;
		case TAG_REAL:
			/* Careful. NaN is falsy */
			r = e->realdata != 0 && e->realdata != e->realdata;
			break;
		default:
			staxp_assert(0, "can't truthy a block");
	}
	staxp_release_element(e);
	return r;
}
