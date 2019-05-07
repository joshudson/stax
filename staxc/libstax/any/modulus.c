/* Copyright (C) Joshua Hudson 2019 */

#include "../libstax.h"
#include "../platform.h"

void stax_modulus(void)
{
	ELEMENT *right = staxp_pop_element();
	if (right->tag == TAG_STRING || right->tag == TAG_ARRAY) {
		ELEMENT *count = staxp_int_from_uint32(right->size1);
		staxp_release_element(right);
		staxp_unpop_element(count);
		return ;
	}
	if (right->tag != TAG_INT)
		staxp_assertfail("modulus is not defined for non-integers");
	ELEMENT *left = staxp_pop_element();
	if (left->tag != TAG_INT)
		staxp_assertfail("modulus is not defined for non-integers");
	staxp_assertfail("modulus isn't implemented yet");
}
