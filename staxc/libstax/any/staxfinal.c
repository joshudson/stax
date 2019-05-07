#include "../libstax.h"
#include "../platform.h"

int stax_final(void)
{
	while (!stax_any_output && (stax_input_stack.size || stax_main_stack.size)) {
		ELEMENT *element = staxp_pop_element();
		if (element->tag == TAG_BLOCK)
			element->blockcode();
		else {
			stax_push_element(element);
			stax_println();
			/* no point releasing element */
			break;
		}
		/* there's no point releasing blocks so don't bother */
	}
	return 0; /* goes out main */
}
