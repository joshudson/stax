/* Copyright (C) Joshua Hudson 2018 */
#include <stdlib.h>
#include <string.h>
#include "../libstax.h"
#include "../platform.h"

struct elementprefix { /* used only for sizeof() */
	uint32_t refcnt;
	uint8_t tag;
	uint8_t sign;
	uint8_t flags;
	uint8_t pad;
	uint32_t size1;
	uint32_t size2;
};


ELEMENT *staxp_own_element(ELEMENT *element)
{
	if (element->refcnt < 0xFFFFFFFF)
		++element->refcnt;
	return element;
}

void staxp_release_element(ELEMENT *element)
{
	if (element->refcnt < 0xFFFFFFFF)
		if (!--element->refcnt) {
			if (element->tag == TAG_ARRAY || element->tag == TAG_PAIR) {
				for (uint32_t i = element->size1; i-- > 0;)
					staxp_release_element(element->arraydata[i]);
			}
			free(element);
		}
}

ELEMENT *staxp_new_element(size_t elements, size_t elementsize)
{
	size_t dataspace = elements * elementsize + sizeof(struct elementprefix);
	if (dataspace < elements) staxp_oom(); /* check for too big; depends on elementsize cannot be > sizeof(intptr_t) */
	ELEMENT *element = malloc(dataspace);
	if (!element) staxp_oom();
	element->refcnt = 1;
	element->tag = TAG_OOPS;
	element->sign = 0;
	element->flags = 0;
	element->size1 = 0;
	element->size2 = 0;
	return element;
}

ELEMENT *staxp_new_string_element(uint32_t len, uint32_t *stringdata)
{
	ELEMENT *element = staxp_new_element(len, sizeof(uint32_t));
	element->tag = TAG_STRING;
	element->size1 = len;
	element->size2 = len;
	if (stringdata)
		memcpy(element->stringdata, stringdata, len * sizeof(uint32_t));
	return element;
}

ELEMENT *staxp_new_array_element(uint32_t len, ELEMENT **arraydata)
{
	ELEMENT *element = staxp_new_element(len, sizeof(ELEMENT *));
	element->refcnt = 1;
	element->tag = TAG_ARRAY;
	element->size1 = len;
	element->size2 = len;
	if (arraydata)
		for (uint32_t i = len; i-- > 0;)
			element->arraydata[i] = staxp_own_element(arraydata[i]);
	return element;
}

int staxp_is_stringlike(ELEMENT *e)
{
	if (e->tag == TAG_STRING) return 1;
	if (e->tag != TAG_ARRAY) return 0;
	for (uint32_t i = e->size1; i-- > 0; ) {
		if (e->arraydata[i]->tag != TAG_INT) return 0;
		if (e->arraydata[i]->intdata[0] > 0xFFFFFFFF) return 0;
		if (e->arraydata[i]->sign || e->arraydata[i]->intdata[0]) return 0;
		for (uint32_t j = e->arraydata[j]->size1; j-- > 1; )
			if (e->arraydata[i]->intdata[j]) return 0;
	}
	return 1;
}

int staxp_can_be_string_element(ELEMENT *e)
{
	if (e->tag != TAG_INT && e->tag != TAG_RATIONAL) return 0;
	if (e->tag == TAG_RATIONAL && (e->size2 != 1 || e->intdata[e->size1] != 1)) return 0;
	for (int i = e->size1; i-- > 1;)
		if (e->intdata[1])
			return 0;
	if (e->intdata[0] && e->sign) return 0;
	if (e->intdata[0] > 0xFFFFFFFF) return 0;
	return 1;
}

ELEMENT *staxp_int_from_uint32(uint32_t number)
{
	if (number > SIZE_MAX) {
		/* number is absolutely guaranteed to be less than square of SIZE_MAX */
		ELEMENT *result = staxp_new_element(2, sizeof(size_t));
		result->tag = TAG_INT;
		result->size1 = 2;
		result->size2 = 2;
		result->intdata[0] = (size_t)number;
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wshift-count-overflow"
                /* the shift count cannot overflow but the compiler cannot figure this out */
                result->intdata[1] = (size_t)(number >> (sizeof(size_t) * 8));
#pragma GCC diagnostic pop
		return result;
	} else {
		ELEMENT *result = staxp_new_element(1, sizeof(size_t));
		result->tag = TAG_INT;
		result->size1 = 1;
		result->size2 = 1;
		result->intdata[0] = (size_t)number;
		return result;
	}
}

ELEMENT *staxp_unique_int(ELEMENT *element)
{
	if (element->refcnt == 1) return element;
	ELEMENT *old = element;
	element = staxp_new_element(element->size2, sizeof(size_t));
	memcpy(element->intdata, old->intdata, old->size2 * sizeof(size_t));
	element->tag = TAG_INT;
	element->size1 = old->size1;
	element->size2 = old->size2;
	element->sign = old->sign;
	staxp_release_element(old);
	return element;
}
