#include <stdint.h>
#include <stdlib.h>
#include "../libstax.h"
#include "../platform.h"

static ELEMENT slash = { 0xFFFFFFFF, TAG_STRING, 0, 0, 0, 1, 0, '/' };

void stax_stringify(void)
{
	ELEMENT *a = staxp_new_array_element(0, NULL);
	ELEMENT *e = staxp_pop_element();
	staxp_unpop_element(a);
	void eep(ELEMENT *s)
	{
		char *d1;
		switch (s->tag) {
			case TAG_ARRAY:
				if (staxp_is_stringlike(s)) {
					stax_push_element(s);
					stax_add();
				} else {
					for (uint32_t i = 0; i < s->size1; i++)
						eep(s->arraydata[i]);
				}
				break;
			case TAG_STRING:
				stax_push_element(s);
				stax_add();
				break;
			case TAG_INT:
				d1 = staxp_getdigits(s->size1, s->intdata);
				staxp_unpop_element(staxp_string_to_element(d1));
				free(d1);
				stax_add();
				break;
			case TAG_RATIONAL:
				d1 = staxp_getdigits(s->size1, s->intdata);
				staxp_unpop_element(staxp_string_to_element(d1));
				free(d1);
				stax_add();
				stax_push_element(&slash);
				stax_add();
				d1 = staxp_getdigits(s->size2, s->intdata + s->size1);
				staxp_unpop_element(staxp_string_to_element(d1));
				stax_add();
				break;
			default:
				staxp_assertfail("Not implemented type for stringify");
		}
	}
	eep(e);
	staxp_release_element(e);
}
