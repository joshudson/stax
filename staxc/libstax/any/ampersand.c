/* Copyright (C) Joshua Hudson 2018-2019 */
#include <stdlib.h>
#include "../libstax.h"
#include "../platform.h"

void stax_ampersand(void)
{
	size_t nindices = 0;
	size_t aindices = 4;
	char freestack = 0;
	ELEMENT *assignee = staxp_pop_element();
	ELEMENT *stkindices[4];
	ELEMENT **indices = stkindices;
	ELEMENT *array = staxp_idx(&indices, &nindices, &aindices, &freestack);
	if (array->refcnt != 1) {
		if (array->tag == TAG_ARRAY) {
			ELEMENT *old = array;
			array = staxp_new_array_element(array->size1, array->arraydata);
			staxp_release_element(old);
		} /* else TAG_STRING handled below */
	}
	ELEMENT *root = array;
	ELEMENT **owner = &root;
	void MaybeGrowArray(uint32_t offset)
	{
		if (array->size1 <= offset) {
			uint32_t newsize = array->size2;
			while (newsize <= offset)
				newsize <<= 1;
			if (array->refcnt > 1 || newsize > array->size2) {
				*owner = staxp_new_array_element(newsize, NULL);
				owner[0]->size1 = offset + 1;
				owner[0]->size2 = newsize;
				uint32_t j;
				for (j = 0; j < array->size1; j++)
					owner[0]->arraydata[j] = array->arraydata[j];
				for (; j <= offset; j++)
					owner[0]->arraydata[j] = &stax_constant_zero;
				for (; j < newsize; j++)
					owner[0]->arraydata[j] = NULL;
				staxp_release_element(array);
				array = *owner;
			} else
				array->size1 = offset + 1;
		}
	}
	size_t i;
	for (i = 0; i < nindices - 1; i++) {
		staxp_assert(array->tag == TAG_ARRAY, "Got non-array too soon in &");
		uint32_t offset = staxp_offset(array, indices[i], 0);
		MaybeGrowArray(offset);
		owner = &array->arraydata[offset];
		array = array->arraydata[offset];
		if (array->refcnt != 1) {
			*owner = staxp_new_array_element(array->size1, array->arraydata);
			staxp_release_element(array);
			array = array->arraydata[offset];
		}
		staxp_release_element(indices[i]);
	}
	if (array->tag == TAG_STRING) {
		*owner = staxp_new_array_element(array->size1, NULL);
		for (uint32_t j = array->size1; j-- > 0;)
			owner[0]->arraydata[j] = staxp_int_from_uint32(array->stringdata[j]);
		staxp_release_element(array);
		array = *owner;
	}
	staxp_assert(array->tag == TAG_ARRAY, "Got non-array too soon in &");
	staxp_assert(nindices > 1 || &root == owner, "Wandering owner in &");
	uint32_t offset = staxp_offset(array, indices[i], 0);
	MaybeGrowArray(offset);
	staxp_assert(nindices > 1 || root == array, "Wandering root in &");
	if (assignee->tag == TAG_BLOCK) {
		/* if we were passed a block, mutate the element with it */
		stax_push_element(array->arraydata[offset]);
		assignee->blockcode();
		staxp_release_element(assignee);
		assignee = staxp_pop_element();
	}
	staxp_release_element(array->arraydata[offset]);
	array->arraydata[offset] = assignee;
	if (freestack) free(indices);
	staxp_unpop_element(root);
}
