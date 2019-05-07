#include <stddef.h>
#include "../libstax.h"
#include "../platform.h"

void stax_listify_all(void)
{
	staxp_read_all_input();
	uint32_t sz = stax_input_stack.size + stax_main_stack.size;
	ELEMENT *a = staxp_new_array_element(sz, NULL);
	for (uint32_t i = 0; i < sz; i++)
		a->arraydata[i] = staxp_pop_element();
	staxp_unpop_element(a);
}
