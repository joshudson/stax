#include "../libstax.h"
#include "../platform.h"

ELEMENT *stax_register_y = &stax_constant_z;

void stax_regread_y(void)
{
	stax_push_element(stax_register_y);
}

void stax_regwrite_y(void)
{
	staxp_release_element(stax_register_y);
	stax_register_y = staxp_pop_element();
	stax_push_element(stax_register_y);
}
