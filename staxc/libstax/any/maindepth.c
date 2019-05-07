#include "../libstax.h"
#include "../platform.h"

void stax_main_depth(void)
{
	ELEMENT *e = staxp_new_element(1, sizeof(size_t));
	e->tag = TAG_INT;
	e->size1 = 1;
	e->size2 = 1;
	e->intdata[0] = stax_main_stack.size;
	staxp_unpop_element(e);
}
