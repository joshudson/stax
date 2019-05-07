#include "../libstax.h"
#include "../platform.h"

ELEMENT *stax_register_x = &stax_constant_z;

void stax_regread_x(void)
{
	stax_push_element(stax_register_x);
}

void stax_regwrite_x(void)
{
	staxp_release_element(stax_register_x);
	stax_register_x = staxp_pop_element();
	stax_push_element(stax_register_x);
}
