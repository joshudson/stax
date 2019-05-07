/* Copyright (C) Joshua Hudson 2018 */

#include <stdio.h>
#include <iconv.h>
#include <stdlib.h>
#include <string.h>
#include "../libstax.h"
#include "../platform.h"

char *staxp_getdigits(size_t len, size_t *arraydata)
{
	size_t *process = malloc(len * sizeof(size_t));
	if (!process) staxp_oom();
	memcpy(process, arraydata, len * sizeof(size_t));
	char *digits = malloc(2 + 20 * len);
	char *b = digits;
	for (;;) {
		size_t remainder = 0;
		for (uint32_t i = len; i-- > 0;)
			process[i] = staxp_divrem(process[i], &remainder, 10);
		*b++ = '0' + remainder;
		int c = 0;
		for (uint32_t i = len; i-- > 0;)
			if (process[i])
				c = 1;
		if (!c) break;
	}
	*b-- = 0;
	char *r = digits;
	while (r < b) {
		char t = *r;
		*r = *b;
		*b = t;
		++r;
		--b;
	}
	return digits;
}
