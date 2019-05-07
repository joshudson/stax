#include "../libstax.h"
#include "../platform.h"

void stax_ifelse(void)
{
	ELEMENT *fe = staxp_pop_element();
	ELEMENT *ft = staxp_pop_element();
	ELEMENT *r = staxp_truthy() ? ft : fe;
	staxp_own_element(r);
	staxp_release_element(fe);
	staxp_release_element(ft);
	if (r->tag == TAG_BLOCK)
		r->blockcode();
	else
		stax_push_element(r);
	staxp_release_element(r);
}
