#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "../libstax.h"
#include "../platform.h"

void stax_reverse_range(void)
{
	ELEMENT *input = staxp_pop_element();
	ELEMENT *output;
	switch (input->tag) {
		case TAG_RATIONAL:
			output = staxp_new_element(input->size1, sizeof(size_t));
			output->tag = TAG_INT;
			memcpy(output->intdata, input->intdata, input->size1 * sizeof(size_t));
			break;
		case TAG_INT:
			if (input->sign)
				output = &stax_constant_z;
			else {
				if (input->size1 > 1) staxp_oom();
				uint32_t sz = input->intdata[0];
				if (sz < input->intdata[0]) staxp_oom(); /* if you wanna memory bomb you gotta try harder */
				output = staxp_new_array_element(sz, NULL);
				for (uint32_t i = 0; i < sz; i++)
					output->arraydata[i] = staxp_int_from_uint32(i);
			}
			break;
		case TAG_STRING:
			output = staxp_new_string_element(input->size1, NULL);
			for (size_t i = 0; i < input->size1; ++i)
				output->stringdata[i] = input->stringdata[input->size1 - i - 1];
			break;
		case TAG_ARRAY:
			output = staxp_new_array_element(input->size1, NULL);
			for (size_t i = 0; i < input->size1; ++i)
				output->arraydata[i] = staxp_own_element(input->arraydata[input->size1 - i - 1]);
			break;
		default:
			staxp_assertfail("Bad input type to r");
	}
	staxp_release_element(input);
	staxp_unpop_element(output);
}
