/* Copyright (C) Joshua Hudson 2018 */

#include <stdio.h>
#include <iconv.h>
#include <stdlib.h>
#include <string.h>
#include "../libstax.h"
#include "../platform.h"

static iconv_t ico;
static char ico_initialized = 0;

static void printr(ELEMENT *s)
{
	switch (s->tag) {
		case TAG_OOPS:
			printf("Oops: uninitialized tag\n");
			break;
		case TAG_INT:
		{
			char *digits = staxp_getdigits(s->size1, s->intdata);
			if (s->sign && digits[0] != '0') putc('-', stdout);
			printf(digits); /* contains only 0-9; safe! */
			free(digits);
			break;
		}
		case TAG_RATIONAL:
		{
			char *digits1 = staxp_getdigits(s->size1, s->intdata);
			if (digits1[0] != '0') {
				char *digits2 = staxp_getdigits(s->size2, s->intdata + s->size1);
				if (s->sign && digits1[0] != 0) putc('-', stdout);
				printf("%s/%s", digits1, digits2);
				free(digits2);
			} else
				putc('0', stdout);
			free(digits1);
			break;
		}
		case TAG_REAL:
			printf("%g", s->realdata);
			break;
		case TAG_ARRAY:
		{
			for (uint32_t i = 0; i < s->size1; i++) {
				if (s->arraydata[i]->tag == TAG_INT) {
					if (s->arraydata[i] == 0)
						putc(' ', stdout);
					else {
						char data[7];
						size_t inbytes = 4;
						size_t outbytes = 6;
						char *inbuf = (char *)(s->arraydata[i]->intdata);
						char *outbuf = data;
						iconv(ico, &inbuf, &inbytes, &outbuf, &outbytes);
						if (outbuf == data)
							putc('?', stdout);
						else {
							*outbuf = 0;
							printf("%s", data);
						}
					}
				} else {
					/* array element not an int just gets printed */
					printr(s->arraydata[i]);
				}
			}
			break;
		}
		case TAG_STRING:
		{
			for (uint32_t i = 0; i < s->size1; i++) {
				if (s->stringdata[i] == 0)
					putc(' ', stdout);
				else {
					char data[7];
					size_t inbytes = 4;
					size_t outbytes = 6;
					char *inbuf = (char *)(s->stringdata + i);
					char *outbuf = data;
					iconv(ico, &inbuf, &inbytes, &outbuf, &outbytes);
					if (outbuf == data)
						putc('?', stdout);
					else {
						*outbuf = 0;
						printf("%s", data);
					}
				}
			}
			break;
		}
		case TAG_BLOCK:
			printf("(block)");
			break;
		case TAG_PAIR:
		default:
			printf("Oops: unimplemented tag on print\n");
	}
	if (ferror(stdout)) {
		perror("stdout");
		exit(2);
	}
}

void stax_print(void)
{
	if (!ico_initialized) {
		ico = iconv_open("", "UTF-32");
		staxp_assert(ico != (iconv_t)-1, "iconv_open output failed; check environment\n");
		ico_initialized = 1;
	}
	stax_any_output = 1;
	ELEMENT *s = staxp_pop_element();
	printr(s);
	staxp_release_element(s);
}

void stax_println(void)
{
	stax_print();
	putc('\n', stdout);
	if (ferror(stdout)) {
		perror("stdout");
		exit(2);
	}
}
