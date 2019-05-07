#include "../libstax.h"
#include "../platform.h"

void stax_tuck0(void)
{
	ELEMENT *reserve = staxp_pop_element();
	stax_push_element(&stax_constant_zero);
	staxp_unpop_element(reserve);
}
