#include "../libstax.h"
#include "../platform.h"

void stax_tuck1(void)
{
	ELEMENT *reserve = staxp_pop_element();
	stax_push_element(&stax_constant_one);
	staxp_unpop_element(reserve);
}
