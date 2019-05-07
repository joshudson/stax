/* Copyright (C) 2019 Joshua Hudson */
#include <stddef.h>
#include "../libstax.h"
#include "../platform.h"

#include <stdio.h>

int staxp_compare(ELEMENT *a, ELEMENT *b, int invert)
{
	ELEMENT *re = NULL;
	size_t i;
	int r = 0;
	switch (b->tag) {
		case TAG_STRING:
		case TAG_ARRAY:
			if (a->tag != TAG_STRING && a->tag != TAG_ARRAY && a->tag != TAG_BLOCK)
				return staxp_compare(b, a, invert ? 0 : 1);
			if (a->tag == TAG_STRING && b->tag == TAG_STRING) {
				size_t limit = a->size1;
				if (limit > b->size1) limit = b->size1;
				for (i = 0; !r && i < limit; ++i)
					if (a->stringdata[i] > b->stringdata[i])
						r = 1;
					else if (a->stringdata[i] < b->stringdata[i])
						r = -1;
				if (limit < a->size1)
					r = -1;
				else if (limit < b->size1)
					r = 1;
			} else if (a->tag == TAG_ARRAY && b->tag == TAG_ARRAY) {
				size_t limit = a->size1;
				if (limit > b->size1) limit = b->size1;
				for (i = 0; !r && i < limit; ++i)
					r = staxp_compare(a->arraydata[i], b->arraydata[i], 0);
				if (limit < a->size1)
					r = -1;
				else if (limit < b->size1)
					r = 1;
			} else if (a->tag == TAG_ARRAY && b->tag == TAG_STRING) {
				size_t limit = a->size1;
				if (limit > b->size1) limit = b->size1;
				for (i = 0; !r && i < limit; ++i)
					r = staxp_compare_to_int(a->arraydata[i], b->stringdata[i]);
				if (limit < a->size1)
					r = -1;
				else if (limit < b->size1)
					r = 1;
			} else if (a->tag == TAG_STRING && b->tag == TAG_ARRAY) {
				size_t limit = a->size1;
				if (limit > b->size1) limit = b->size1;
				for (i = 0; !r && i < limit; ++i)
					r = -staxp_compare_to_int(b->arraydata[i], a->stringdata[i]);
				if (limit < a->size1)
					r = -1;
				else if (limit < b->size1)
					r = 1;
			} else
				staxp_assertfail("Tried to compare an array with a block");
			if (r == 0)
				r = i < b->size1 ? -1 : 0;
			break;
		case TAG_INT:
		case TAG_REAL:
		case TAG_RATIONAL:
			while (a->tag == TAG_ARRAY) {
				if (a->size1 == 0)
					return invert ? -1 : 1;
				a = a->arraydata[0];
			}
			if (a->tag == TAG_STRING)
				return staxp_compare_to_int(b, a->stringdata[0]) * (invert ? 1 : -1);
			/* we could optimize this for INT and REAL in most cases by doing it inline when the types agree */
			stax_push_element(a);
			stax_push_element(b);
			stax_subtract();
			re = staxp_pop_element();
			if (re->tag == TAG_REAL) {
				if (re->realdata > 0)
					r = 1;
				else if (re->realdata < 0)
					r = -1;
				else
					r = 0;
			} else {
				r = 0;
				for (size_t i = 0; i < re->size1; i++)
					if (re->intdata[i]) {
						r = re->sign ? -1 : 1;
						break;
					}
			}
			break;
		default:
			staxp_assertfail("Comparisons with blocks make no sense");
	}
	if (re) staxp_release_element(re);
	return invert ? -r : r;
}

int staxp_compare_to_int(ELEMENT *a, uint32_t b)
{
	if ((a->tag == TAG_STRING || a->tag == TAG_ARRAY) && a->size1 == 0)
		return -1;
	if (a->tag == TAG_ARRAY)
		return staxp_compare_to_int(a->arraydata[0], b);
	if (a->tag == TAG_STRING) {
		if (a->size1 == 0)
			return b > 0 ? -1 : 0;
		if (a->stringdata[0] < b)
			return -1;
		if (a->stringdata[0] > b)
			return 1;
		return 0;
	}
	if (a->tag == TAG_REAL) {
		if (a->realdata != a->realdata || a->realdata < b)
			return -1;
		if (a->realdata > b)
			return 1;
		return 0;
	}
	if (a->sign)
		return -1;
	if (a->tag == TAG_RATIONAL || a->tag == TAG_INT) {
		if (a->size1 == 0)
			return !!b;
		if (a->tag == TAG_RATIONAL && a->intdata[a->size1] != 1) {
			ELEMENT *b2 = staxp_int_from_uint32(b);
			int r = staxp_compare(a, b2, 0);
			staxp_release_element(b2);
			return r;
		}
		/* FAILS on platforms with sizeof(size_t < 4) */
		for (int i = 1; i < a->size1; i++)
			if (a->intdata[i])
				return 1;
		if (a->intdata[0] < b)
			return -1;
		else if (a->intdata[0] > b)
			return 1;
		else
			return 0;
	}
	staxp_assertfail("Unexpected type in staxp_compare_to_int");
}
