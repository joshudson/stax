/* Copyright (C) Joshua Hudson 2019 */
#include "../libstax.h"
#include "../platform.h"

void stax_startswith(void)
{
	ELEMENT *match = staxp_pop_element();
	if (match->tag != TAG_ARRAY && match->tag != TAG_STRING) {
		staxp_assertfail("Bad second argument to :[");
	}
	ELEMENT *source = staxp_pop_element();
	if (source->tag != TAG_ARRAY && source->tag != TAG_STRING) {
		staxp_assertfail("Bad first argument to :[");
	}
	char found = 1;
	if (source->tag == TAG_STRING && match->tag == TAG_STRING) {
		if (source->size1 < match->size1)
			found = 0;
		else
			for (size_t j = 0; found && j < match->size1; j++)
				if (source->stringdata[j] != match->stringdata[j])
					found = 0;
	} else if (source->tag == TAG_STRING && match->tag == TAG_ARRAY) {
		if (source->size1 < match->size1)
			found = 0;
		else
			for (size_t j = 0; found && j < match->size1; j++)
				if (staxp_compare_to_int(match->arraydata[j], source->stringdata[j]))
					found = 0;
	} else if (source->tag == TAG_ARRAY && match->tag == TAG_STRING) {
		if (source->size1 < match->size1)
			found = 0;
		else
			for (size_t j = 0; found && j < match->size1; j++)
				if (staxp_compare_to_int(source->arraydata[j], match->stringdata[j]))
					found = 0;
	} else /* if (source->tag == TAG_ARRAY && match->tag == TAG_ARRAY) */ {
		if (source->size1 >= match->size1)
			found = 0;
		else
			for (size_t j = 0; found && j < match->size1; j++)
				if (staxp_compare(source->arraydata[j], match->arraydata[j], 0))
					found = 0;
	}
	staxp_release_element(match);
	staxp_release_element(source);
	stax_push_element(found ? &stax_constant_one : &stax_constant_zero);
}
