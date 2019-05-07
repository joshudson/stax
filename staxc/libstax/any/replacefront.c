/* Copyright (C) Joshua Hudson 2019 */
#include <stdint.h>
#include <stdlib.h>
#include "../libstax.h"
#include "../platform.h"

void stax_replacefront(void)
{
	ELEMENT *target = staxp_pop_element();
	if (target->tag != TAG_ARRAY && target->tag != TAG_STRING) {
		if (target->tag == TAG_REAL) {
			stax_push_element(((long)target->realdata & 1)
				? &stax_constant_one : &stax_constant_zero);
		} else if (target->tag == TAG_RATIONAL || target->tag == TAG_INT) {
			if (target->tag == TAG_RATIONAL && target->intdata[target->size1] != 1) {
				stax_push_element(&stax_constant_zero);
				return ;
			}
			stax_push_element(((long)target->intdata & 1)
				? &stax_constant_one : &stax_constant_zero);
		} else
			staxp_assertfail("Bad argument type to |e");
		return ;
	}
	ELEMENT *match = staxp_pop_element();
	if (match->tag != TAG_ARRAY && match->tag != TAG_STRING)
		staxp_assertfail("Bad argument type to |e");
	ELEMENT *source = staxp_pop_element();
	if (source->tag != TAG_ARRAY && source-> tag != TAG_STRING)
		staxp_assertfail("Bad arguemnt type to |e");
	if (source->size1 < match->size1) {
		staxp_release_element(match);
		staxp_release_element(target);
		staxp_unpop_element(source);
		return ;
	}
	size_t i;
	char found = 0;
	if (source->tag == TAG_STRING && match->tag == TAG_STRING) {
		for (i = 0; !found && i <= source->size1 - match->size1; i++) {
			found = 1;
			for (size_t j = 0; found && j < match->size1; j++)
				if (source->stringdata[i + j] != match->stringdata[i + j])
					found = 0;
		}
	} else if (source->tag == TAG_STRING && match->tag == TAG_ARRAY) {
		for (i = 0; !found && i <= source->size1 - match->size1; i++) {
			found = 1;
			for (size_t j = 0; found && j < match->size1; j++)
				if (staxp_compare_to_int(match->arraydata[i + j], source->stringdata[i + j]))
					found = 0;
		}
	} else if (source->tag == TAG_ARRAY && match->tag == TAG_STRING) {
		for (i = 0; !found && i <= source->size1 - match->size1; i++) {
			found = 1;
			for (size_t j = 0; found && j < match->size1; j++)
				if (staxp_compare_to_int(source->arraydata[i + j], match->stringdata[i + j]))
					found = 0;
		}
	} else /* if (source->tag == TAG_ARRAY && match->tag == TAG_ARRAY) */ {
		for (i = 0; !found && i <= source->size1 - match->size1; i++) {
			found = 1;
			for (size_t j = 0; found && j < match->size1; j++)
				if (staxp_compare(source->arraydata[i + j], match->arraydata[i + j], 0))
					found = 0;
		}
	}
	if (found)
		staxp_replace1(&source, match->size1, target, i - 1);
	staxp_release_element(match);
	staxp_release_element(target);
	staxp_unpop_element(source);
}
