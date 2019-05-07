/* Copyright (C) Joshua Hudson 2019 */

#include "../libstax.h"
#include "../platform.h"

static void staxp_instanceloop(const char *amsg, int (*onmatch)(size_t))
{
	ELEMENT *contains = staxp_pop_element();
	ELEMENT *search = staxp_pop_element();
	if (search->tag != TAG_ARRAY && search->tag != TAG_STRING) {
		if (contains->tag == TAG_ARRAY || contains->tag == TAG_STRING) {
			ELEMENT *tmp = contains;
			contains = search;
			search = tmp;
		} else
			staxp_assertfail(amsg);
	}
	if (contains->tag == TAG_ARRAY || contains->tag == TAG_STRING) {
		if (contains->size1 <= search->size1) {
			for (size_t i = 0; i <= search->size1 - contains->size1; i++) {
				int found = 1;
				for (size_t j = 0; found && j < contains->size1; j++) {
					if (search->tag == TAG_ARRAY && contains->tag == TAG_ARRAY) {
						if (staxp_compare(search->arraydata[i + j], contains->arraydata[j], 0))
							found = 0;
					} else if (search->tag == TAG_STRING && contains->tag == TAG_ARRAY) {
						if (staxp_compare_to_int(contains->arraydata[j], search->stringdata[i + j]))
							found = 0;
					} else if (search->tag == TAG_ARRAY && contains->tag == TAG_STRING) {
						if (staxp_compare_to_int(search->arraydata[i + j], contains->stringdata[j]))
							found = 0;
					} else if (search->tag == TAG_STRING && contains->tag == TAG_STRING) {
						if (search->stringdata[i + j] != contains->stringdata[j])
							found = 0;
					} else
						staxp_assertfail(amsg);
				}
				if (found && !onmatch(i)) break;
			}
		}
	} else {
		if (search->tag == TAG_STRING) {
			for (size_t i = 0; i < search->size1; i++) {
				if (!staxp_compare_to_int(contains, search->stringdata[i]))
					if (!onmatch(i)) break;
			}
		}
		else if (search->tag == TAG_ARRAY) {
			for (size_t i = 0; i < search->size1; i++) {
				if (!staxp_compare(search->arraydata[i], contains, 0))
					if (!onmatch(i)) break;
			}
		} else
			staxp_assertfail(amsg);
	}
	staxp_release_element(search);
	staxp_release_element(contains);
}

void stax_countinstances(void)
{
	size_t counter = 0;
	int morecounter(size_t ignored) { ++counter; return 1; }
	staxp_instanceloop("Bad argument set to #", morecounter);
	staxp_unpop_element(staxp_int_from_uint32(counter));
}

void stax_indexof(void)
{
	char found = 0;
	size_t index;
	int foundit(size_t offset) { index = offset; found = 1; return 0; }
	staxp_instanceloop("Bad argument set to I", foundit);
	if (found)
		staxp_unpop_element(staxp_int_from_uint32(index));
	else
		stax_push_element(&stax_constant_minus_one);
}
