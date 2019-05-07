/* Copyright (C) Joshua Hudson 2018 */
#include <stdlib.h>
#include "../libstax.h"
#include "../platform.h"

void stax_at(void)
{
	size_t nindices = 0;
	size_t aindices = 4;
	char freestack = 0;
	ELEMENT *stkindices[4];
	ELEMENT **indices = stkindices;
	ELEMENT *array = staxp_idx(&indices, &nindices, &aindices, &freestack);
	for (size_t i = 0; i < nindices; i++) {
		if (array->size1 > 0) {
			uint32_t offset = staxp_offset(array, indices[i], 1);
			ELEMENT *old = array;
			if (array->tag == TAG_ARRAY) {
				array = old->arraydata[offset];
				staxp_own_element(array);
			} else if (array->tag == TAG_STRING)
				array = staxp_int_from_uint32(old->stringdata[offset]);
			else
				staxp_assertfail("Got non-array too soon in @");
			staxp_release_element(old);
		} else
			staxp_assertfail("Tried to index empty array"); /* TODO fixme emulating bad behavior in js version */
		staxp_release_element(indices[i]);
	}
	if (freestack) free(indices);
	staxp_unpop_element(array);
}
