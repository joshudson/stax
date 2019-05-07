#include "../libstax.h"
#include "../platform.h"

#include <stdio.h>

void stax_inverse(void)
{
	ELEMENT *e = staxp_pop_element();
	if (e->tag == TAG_BLOCK)
		e->blockcode();
	else {
		stax_push_element(e);
		int r = staxp_truthy();
		stax_push_element(r ? &stax_constant_zero : &stax_constant_one);
	}
	staxp_release_element(e);
}
