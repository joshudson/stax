/* libstax Copyright (C) Joshua Hudson 2018-2019 */
#include <stdlib.h>
#include <string.h>
#include "../libstax.h"
#include "../platform.h"
#include "../mpi.h"

void stax_add(void)
{
	ELEMENT *two = staxp_pop_element();
	ELEMENT *one = staxp_pop_element();

	if (one->tag == TAG_ARRAY) {
		for (uint32_t i = 0; i < one->size1; i++)
			if (one->arraydata[i]->tag == 0)
				staxp_assertfail("Got bad type0 to add in one\n");
	}
	if (two->tag == TAG_ARRAY) {
		for (uint32_t i = 0; i < two->size1; i++)
			if (two->arraydata[i]->tag == 0)
				staxp_assertfail("Got bad type0 to add in two\n");
	}

	if (one->tag == TAG_ARRAY || one->tag == TAG_STRING) {
		if (two->tag == TAG_ARRAY || two->tag == TAG_STRING) {
			if (staxp_is_stringlike(one) && staxp_is_stringlike(two)) {
				if (!(one->refcnt == 1 && one->tag == TAG_STRING && one->size2 - one->size1 >= two->size1)) {
					ELEMENT *old = one;
					uint32_t newsize = old->size1 + two->size1;
					if (newsize < (old->size2 << 1))
						newsize = old->size2 << 1;
					one = staxp_new_string_element(newsize, NULL);
					one->size1 = old->size1;
					one->size2 = newsize;
					if (old->tag == TAG_STRING)
						memcpy(one->stringdata, old->stringdata, old->size1 * sizeof(old->stringdata[0]));
					else
						for (uint32_t i = old->size1; i-- > 0;)
							one->stringdata[i] = (uint32_t)two->arraydata[i]->intdata[0];
					staxp_release_element(old);
				}
				if (two->tag == TAG_STRING)
					memcpy(one->stringdata + one->size1, two->stringdata, two->size1 * sizeof(two->stringdata[0]));
				else
					for (uint32_t i = two->size1; i-- > 0;)
						one->stringdata[one->size1 + i] = (uint32_t)two->arraydata[i]->intdata[0];
				one->size1 += two->size1;
			} else {
				if (!(two->refcnt == 1 && one->tag == TAG_ARRAY && one->size2 - one->size1 >= two->size1)) {
					ELEMENT *old = one;
					uint32_t newsize = old->size1 + two->size1;
					if (newsize < (old->size2 << 1))
						newsize = old->size2 << 1;
					one = staxp_new_array_element(newsize, NULL);
					one->size1 = old->size1;
					one->size2 = newsize;
					if (old->tag == TAG_ARRAY && old->refcnt == 1) {
						memcpy(one->arraydata, old->arraydata, old->size1 * sizeof(ELEMENT *));
						free(old);
					} else if (old->tag == TAG_ARRAY) {
						for (uint32_t i = old->size1; i-- > 0;)
							one->arraydata[i] = staxp_own_element(old->arraydata[i]);
						staxp_release_element(old);
					} else {
						for (uint32_t i = old->size1; i-- > 0;)
							one->arraydata[i] = staxp_int_from_uint32(old->stringdata[i]);
						staxp_release_element(old);
					}
				}
				size_t delta = two->size1;
				if (two->tag == TAG_STRING)
					for (uint32_t i = two->size1; i-- > 0;)
						one->arraydata[one->size1 + i] = staxp_int_from_uint32(two->stringdata[i]);
				else if (two->refcnt != 1)
					for (uint32_t i = two->size1; i-- > 0;)
						one->arraydata[one->size1 + i] = staxp_own_element(two->arraydata[i]);
				else {
					memcpy(one->arraydata + one->size1, two->arraydata, two->size1 * sizeof(ELEMENT *));
					free(two);
					two = NULL;
				}
				one->size1 += delta;
			}
		} else {
			if (one->tag == TAG_STRING && staxp_can_be_string_element(two)) {
				if (!(one->refcnt == 1 && one->size1 < one->size2)) {
					ELEMENT *old = one;
					uint32_t newsize = (old->size2 > old->size1) ? old->size2 : old->size2 << 1;
					one = staxp_new_string_element(newsize, NULL);
					one->size1 = old->size1;
					one->size2 = newsize;
					memcpy(one->stringdata, old->stringdata, old->size1 * sizeof(old->stringdata[0]));
					staxp_release_element(old);
				}
				one->stringdata[one->size1++] = two->intdata[0];
			} else {
				if (!(one->tag == TAG_ARRAY && one->refcnt == 1 && one->size1 < one->size2)) {
					ELEMENT *old = one;
					uint32_t newsize = (old->size2 > old->size1) ? old->size2 : old->size2 << 1;
					one = staxp_new_array_element(newsize, NULL);
					one->size1 = old->size1;
					one->size2 = newsize;
					if (old->tag == TAG_ARRAY && old->refcnt == 1) {
						memcpy(one->arraydata, old->arraydata, one->size1 * sizeof(ELEMENT *));
						free(old);
					} else if (old->tag == TAG_ARRAY) {
						for (uint32_t i = old->size1; i-- > 0;)
							one->arraydata[i] = staxp_own_element(old->arraydata[i]);
						staxp_release_element(old);
					} else {
						for (uint32_t i = old->size1; i-- > 0;)
							one->arraydata[i] = staxp_int_from_uint32(old->stringdata[i]);
						staxp_release_element(old);
					}
				}
				one->arraydata[one->size1++] = staxp_own_element(two);
			}
		}
	} else {
		if (two->tag == TAG_ARRAY || two->tag == TAG_STRING) {
			if (two->tag == TAG_STRING && staxp_can_be_string_element(one)) {
				if (!(two->refcnt == 1 && two->size1 < two->size2)) {
					ELEMENT *old = two;
					uint32_t newsize = (old->size2 > old->size1) ? old->size2 : old->size2 << 1;
					if (newsize == 0) newsize = 16;
					two = staxp_new_string_element(newsize, NULL);
					two->size1 = old->size1;
					two->size2 = newsize;
					memcpy(two->stringdata + 1, old->stringdata, old->size1);
					staxp_release_element(old);
				}
				two->stringdata[0] = (uint32_t)one->intdata[0];
				two->size1++;
			} else {
				if (!(one->tag == TAG_ARRAY && one->refcnt == 1 && one->size1 < one->size2)) {
					ELEMENT *old = two;
					uint32_t newsize = (old->size2 > old->size1) ? old->size2 : old->size2 << 1;
					if (newsize == 0) newsize = 16;
					two = staxp_new_array_element(newsize, NULL);
					two->size1 = old->size1;
					two->size2 = newsize;
					if (old->tag == TAG_ARRAY && old->refcnt == 1) {
						memcpy(one->arraydata + 1, old->arraydata, one->size1 * sizeof(ELEMENT *));
						free(old);
					} else if (old->tag == TAG_ARRAY) {
						for (uint32_t i = old->size1; i-- > 0;)
							one->arraydata[i + 1] = staxp_own_element(old->arraydata[i]);
						staxp_release_element(old);
					} else {
						for (uint32_t i = old->size1; i-- > 0;)
							one->arraydata[i + 1] = staxp_int_from_uint32(old->stringdata[i]);
						staxp_release_element(old);
					}
				}
				two->arraydata[0] = staxp_own_element(one);
				two->size1++;
			}
			ELEMENT *tmp = two;
			two = one;
			one = tmp;
		} else {
			staxp_assert(one->tag == TAG_INT && two->tag == TAG_INT, "non-integer not implemented in add()");
			if (one->sign == two->sign) {
				one = staxp_unique_int(one);
				void reallocate(uint32_t newsize, uint32_t oldsize, size_t **space)
				{
					if (newsize > one->size2) {
						ELEMENT *old = one;
						one = staxp_new_element(newsize, sizeof(size_t));
						one->tag = old->tag;
						memcpy(one->intdata, old->intdata, oldsize * sizeof(size_t));
						memset(one->intdata + oldsize, 0, (newsize - oldsize) * sizeof(size_t));
						one->size2 = newsize;
						one->sign = old->sign;
						staxp_release_element(old);
					}
					one->size1 = newsize;
					*space = one->intdata;
				}
				size_t *we_handle_move = one->intdata;
				stax_mpi_add(&one->size1, &we_handle_move, two->size1, two->intdata, reallocate);
			} else {
				int c = stax_mpi_compare(one->size1, one->intdata, two->size1, two->intdata);
				if (c == 0) {
					staxp_release_element(one);
					one = &stax_constant_zero;
				} else {
					if (c < 0) {
						ELEMENT *tmp = two;
						two = one;
						one = tmp;
					}
					one = staxp_unique_int(one);
					stax_mpi_sub(one->size1, one->intdata, two->size1, two->intdata);
				}
			}
		}
	}
	if (one->tag == TAG_ARRAY) {
		for (uint32_t i = 0; i < one->size1; i++)
			if (one->arraydata[i]->tag == 0)
				staxp_assertfail("Wrote bad type0 to add\n");
	}
	if (two != NULL) staxp_release_element(two);
	staxp_unpop_element(one);
}
