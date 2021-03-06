/* Copyright (C) Joshua Hudson 2018 */
#include <stdlib.h>
#include <iconv.h>
#include <string.h>
#include "../libstax.h"
#include "../platform.h"

static iconv_t ico;
static char ico_initialized = 0;

ELEMENT *staxp_string_to_element(char *string)
{
	union {
		char data[sizeof(uint32_t)];
		uint32_t codepoint;
	} u;
	if (!ico_initialized) {
		ico = iconv_open("UTF-32", "");
		staxp_assert(ico != (iconv_t)-1, "iconv input failed; check environment");
		ico_initialized = 1;
		/* Eat stupid BOM generated by iconv */
		char *dummy = " ";
		char *ptr = u.data;
		size_t spacein = 1;
		size_t spaceout = 4;
		iconv(ico, &dummy, &spacein, &ptr, &spaceout);
	}
	size_t len = strlen(string);
	char *stop = string + len;
	ELEMENT *s = staxp_new_element(len + 1, sizeof(uint32_t));
	s->tag = TAG_STRING;
	s->size1 = 0;
	s->size2 = len;
	while (stop > string) {
		size_t datalen = 4;
		char *ptr = u.data;
		iconv(ico, &string, &len, &ptr, &datalen);
		if (datalen != 0) {
			/* bad codepoint: unrecoverable in the general case */
			s->stringdata[s->size1++] = '?';
			break;
		}
		/* we have a new code point in datalen */
		s->stringdata[s->size1++] = u.codepoint;
		len = stop - string;
	}
	return s;
}
