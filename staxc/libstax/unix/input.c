/* Copyright (C) Joshua Hudson 2018 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../libstax.h"
#include "../platform.h"

static char *inputbuf;
static size_t inputlen;

void staxp_read_input(void)
{
	fflush(stdout);
	if (feof(stdin)) return;
	if (inputbuf == NULL) {
		inputlen = 128;
		inputbuf = malloc(inputlen);
		if (!inputbuf) staxp_oom();
	}
	size_t linelen = 0;
	char hasnewline = 0;
	for(;;) {
		if (!fgets(inputbuf + linelen, inputlen - linelen, stdin)) {
			if (ferror(stdin)) {
				perror("stdin");
				exit(2);
			}
			if (feof(stdin))
				if (linelen == 0)
					return;
				else
					inputbuf[linelen] = 0;
			else
				staxp_assertfail("Nonsensical failure from fgets");
		}
		size_t ldelta = strlen(inputbuf + linelen);
		if (ldelta == 0) break;
		linelen += ldelta;
		if (inputbuf[linelen - 1] == '\n') {
			hasnewline = 1;
			inputbuf[linelen - 1] = 0;
			break;
		}
		if (linelen + 1 == inputlen) {
			inputbuf = realloc(inputbuf, inputlen <<= 1);
			if (!inputbuf) staxp_oom();
		}
	}
	ELEMENT *e = staxp_string_to_element(inputbuf);
	if (stax_input_stack.alloc == stax_input_stack.size) {
		if (stax_input_stack.alloc == 0)
			stax_input_stack.alloc = 16;
		else
			stax_input_stack.alloc <<= 1;
		stax_input_stack.elements = realloc(stax_input_stack.elements, sizeof(ELEMENT *) * stax_input_stack.alloc);
		if (!stax_input_stack.elements) staxp_oom();
	}
	memmove(stax_input_stack.elements + 1, stax_input_stack.elements, sizeof(ELEMENT *) * stax_input_stack.size);
	stax_input_stack.elements[0] = e;
	++stax_input_stack.size;
	/* TODO: push element to input accumulator for _ at top level */
	/* TODO: deal with i as first character */
}
