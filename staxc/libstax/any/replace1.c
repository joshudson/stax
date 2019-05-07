/* Copyright (C) Joshua Hudson 2019 */
#include "../libstax.h"
#include "../platform.h"

void staxp_replace1(ELEMENT **match, size_t sourcelen, ELEMENT *target, size_t offset)
{
	ELEMENT *tmp;
	if (match[0]->tag == TAG_STRING && target->tag == TAG_ARRAY) {
		if (!staxp_is_stringlike(target)) {
			tmp = staxp_new_array_element(match[0]->size1 + target->size1 - sourcelen, NULL);
			size_t i;
			size_t j = 0;
			for (i = 0; i < offset; i++, j++)
				tmp->arraydata[j] = staxp_int_from_uint32(match[0]->stringdata[i]);
			for (i = 0; i < target->size1; i++, j++)
				tmp->arraydata[j] = staxp_own_element(target->arraydata[i]);
			for (i = offset + sourcelen; i < match[0]->size1; i++, j++)
				tmp->arraydata[j] = staxp_int_from_uint32(match[0]->stringdata[i]);
		} else {
			tmp = staxp_new_string_element(match[0]->size1 + target->size1 - sourcelen, NULL);
			size_t i;
			size_t j = 0;
			for (i = 0; i < offset; i++, j++)
				tmp->stringdata[j] = match[0]->stringdata[i];
			for (i = 0; i < target->size1; i++, j++)
				tmp->stringdata[j] = target->arraydata[i]->intdata[0];
			for (i = offset + sourcelen; i < match[0]->size1; i++, j++)
				tmp->stringdata[j] = match[0]->stringdata[i];
		}
	} else if (match[0]->tag == TAG_STRING && target->tag == TAG_STRING) {
		tmp = staxp_new_string_element(match[0]->size1 + target->size1 - sourcelen, NULL);
		size_t i;
		size_t j = 0;
		for (i = 0; i < offset; i++, j++)
			tmp->stringdata[j] = match[0]->stringdata[i];
		for (i = 0; i < target->size1; i++, j++)
			tmp->stringdata[j] = target->stringdata[i];
		for (i = offset + sourcelen; i < match[0]->size1; i++, j++)
			tmp->stringdata[j] = match[0]->stringdata[i];
	} else if (match[0]->tag == TAG_ARRAY && target->tag == TAG_STRING) {
		tmp = staxp_new_array_element(match[0]->size1 + target->size1 - sourcelen, NULL);
		size_t i;
		size_t j = 0;
		for (i = 0; i < offset; i++, j++)
			tmp->arraydata[j] = staxp_own_element(match[0]->arraydata[i]);
		for (i = 0; i < target->size1; i++, j++)
			tmp->arraydata[j] = staxp_int_from_uint32(target->stringdata[i]);
		for (i = offset + sourcelen; i < match[0]->size1; i++, j++)
			tmp->arraydata[j] = staxp_own_element(match[0]->arraydata[i]); 
	} else if (match[0]->tag == TAG_ARRAY && target->tag == TAG_ARRAY) {
		tmp = staxp_new_array_element(match[0]->size1 + target->size1 - sourcelen, NULL);
		size_t i;
		size_t j = 0;
		for (i = 0; i < offset; i++, j++)
			tmp->arraydata[j] = staxp_own_element(match[0]->arraydata[i]);
		for (i = 0; i < target->size1; i++, j++)
			tmp->arraydata[j] = staxp_own_element(target->arraydata[i]);
		for (i = offset + sourcelen; i < match[0]->size1; i++, j++)
			tmp->arraydata[j] = staxp_own_element(match[0]->arraydata[i]); 
	} else
		staxp_assertfail("Bizarre type combination passed to replace1");
	staxp_release_element(*match);
	*match = tmp;
}
