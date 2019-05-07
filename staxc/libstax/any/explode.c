/* Copyright(C) Joshua Hudson 2018 */
#include <string.h>
#include "../libstax.h"
#include "../platform.h"

void stax_explode(void)
{
	ELEMENT *e = staxp_pop_element();
	switch (e->tag) {
		case TAG_ARRAY:
			for (size_t ia = 0; ia < e->size1; ia++)
				stax_push_element(e->arraydata[ia]);
			break;
		case TAG_STRING:
			for (size_t is = 0; is < e->size1; is++)
				staxp_unpop_element(staxp_int_from_uint32(e->stringdata[is]));
			break;
		case TAG_INT:
		{
			e = staxp_unique_int(e);
			ELEMENT *array = staxp_new_element(e->size1 * 20, sizeof(ELEMENT *));
			array->tag = TAG_ARRAY;
			array->size1 = 0;
			array->size2 = e->size1 * 20;
			for (;;) {
				size_t remainder = 0;
				for (uint32_t i = e->size1; i-- > 0;)
					e->intdata[i] = staxp_divrem(e->intdata[i], &remainder, 10);
				ELEMENT *d = staxp_new_element(1, sizeof(size_t));
				d->tag = TAG_INT;
				d->intdata[0] = remainder;
				array->arraydata[array->size1++] = d;
				int c = 0;
				for (uint32_t i = e->size1; i-- > 0;)
					if (e->intdata[i])
						c = 1;
				if (!c) break;
			}
			for (uint32_t i = 0; i < array->size1 >> 1; i++) {
				ELEMENT *t = array->arraydata[i];
				array->arraydata[i] = array->arraydata[array->size1 - 1 - i];
				array->arraydata[array->size1 - 1 - i] = t;
			}
			staxp_unpop_element(array);
		}
		case TAG_RATIONAL:
		{
			ELEMENT *n = staxp_new_element(e->size1, sizeof(size_t));
			n->tag = TAG_INT;
			n->sign = 0;
			n->size1 = e->size1;
			n->size2 = e->size1;
			memcpy(n->intdata, e->intdata, sizeof(size_t) * e->size1);
			ELEMENT *d = staxp_new_element(e->size2, sizeof(size_t));
			n->tag = TAG_INT;
			d->sign = 0;
			d->size1 = e->size2;
			d->size2 = e->size2;
			memcpy(n->intdata, e->intdata + e->size1, sizeof(size_t) * e->size1);
			staxp_unpop_element(d);
			staxp_unpop_element(n);
			break;
		}
		case TAG_REAL:
			staxp_assert(0, "E is not defined for REAL");
		case TAG_BLOCK:
			staxp_assert(0, "TODO E maxby");
	}
	staxp_release_element(e);
}
