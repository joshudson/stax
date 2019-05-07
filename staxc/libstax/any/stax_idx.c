/* Copyright (C) Joshua Hudson 2018 */
#include <stdlib.h>
#include <string.h>
#include "../libstax.h"
#include "../platform.h"

ELEMENT *staxp_idx(ELEMENT ***stack, size_t *nstack, size_t *astack, char *freestack)
{
	for (;;) {
		ELEMENT *e = staxp_pop_element();
		switch (e->tag)
		{
			case TAG_STRING:
				return e;
			case TAG_ARRAY:
				return e;
			case TAG_REAL:
				staxp_assert(e->realdata == (double)(long)e->realdata, "Non-integer float for array index");
				goto case_TAG_INT;
			case TAG_RATIONAL:
				staxp_assert(e->intdata[e->size1] == 1, "Non-integer rational for array index");
				for (uint32_t i = 1; i < e->size2; ++i)
					staxp_assert(e->intdata[e->size1 + i] == 0, "Non-integer rational for array index");
case_TAG_INT:
			case TAG_INT:
				if (*nstack == *astack) {
					*astack <<= 1;
					if (!*freestack) {
						ELEMENT **inlinestack = *stack;
						*stack = malloc(sizeof(ELEMENT *) * *astack);
						if (!*stack) staxp_oom();
						memcpy(*stack, inlinestack, sizeof(ELEMENT **) * *nstack);
						*freestack = 1;
					} else {
						*stack = realloc(*stack, sizeof(ELEMENT **) * *astack);
						if (!*stack) staxp_oom();
					}
				}
				stack[0][(*nstack)++] = e;
				break;
			default:
				staxp_assertfail("Inappropriate index type for @ or &");
		}
	}
}

uint32_t staxp_offset(ELEMENT *a, ELEMENT *t, char wrap)
{
	staxp_assert(a->size1, "Non-empty array required for &");
	size_t offset;
	switch (t->tag)
	{
		case TAG_REAL:
			return wrap
				? (a->size1 >= 0)
					? (size_t)(((long)t->realdata) % a->size1)
					: (size_t)(a->size1 - ((long)-t->realdata) % a->size1)
				: (a->size1 >= 0)
					? (size_t)t->realdata
					: (size_t)-t->realdata;
		case TAG_RATIONAL:
		case TAG_INT:
			if (wrap) {
				if (a->size1 == 0) return 0%t->size1; /* return 0 or raise division by 0 */
				offset = 0;
				for (uint32_t i = t->size1; i-- > 0;)
					staxp_divrem(t->intdata[i], &offset, (size_t)a->size1);
				return t->sign ? a->size1 - (uint32_t)offset : (uint32_t)offset; /* cast must succeed */
			} else {
				if (a->size1 == 0) return 0;
				for (uint32_t i = t->size1; i-- > 1;)
					if (t->intdata[i])
						staxp_oom();
				if (t->intdata[0] > 0xFFFFFFFF)
					staxp_oom();
				return t->sign ? a->size1 - (uint32_t)t->intdata[0] : (uint32_t)t->intdata[0]; /* cast must succeed */
			}
		default:
			staxp_assertfail("bad argument to staxp_offset");
	}
}
