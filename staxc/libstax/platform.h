/* Copyright (C) Joshua Hudson 2017-2018 */

#include <stddef.h>
#include <stdint.h>
#include <limits.h>

/* this checks if size_t is big enough to contain a unicode code point */
extern char staxp_assert_sizet[(sizeof(size_t) * CHAR_BIT > 20) ? 1 : -1];

enum { TAG_OOPS=0, TAG_INT=1, TAG_RATIONAL=2, TAG_REAL=3, TAG_ARRAY=4, TAG_BLOCK=5, TAG_STRING=6, TAG_PAIR=7 };

typedef struct element {
	uint32_t refcnt;
	uint8_t tag;
	uint8_t sign;
	uint8_t flags;
	uint8_t pad;
	uint32_t size1;
	uint32_t size2;
	union {
		size_t intdata[1]; /* these are really flexible members but the compiler will not understand */
		uint32_t stringdata[1];
		struct element *arraydata[1];
		int (*blockcode)(void);
		double realdata;
	};
} ELEMENT;

typedef struct stack {
	uint32_t size;
	uint32_t alloc;
	ELEMENT **elements;
} STACK;

ELEMENT *staxp_new_element(size_t elements, size_t elementsize);
ELEMENT *staxp_new_string_element(uint32_t count, uint32_t *stringdata);
ELEMENT *staxp_new_array_element(uint32_t count, ELEMENT **arraydata);
ELEMENT *staxp_int_from_uint32(uint32_t number);
ELEMENT *staxp_unique_int(ELEMENT *src);
ELEMENT *staxp_string_to_element(char *string);
ELEMENT *staxp_own_element(ELEMENT *base);
ELEMENT *staxp_pop_element(void);
ELEMENT *staxp_pop_input_element(void);
void staxp_unpop_element(ELEMENT *element);
void staxp_release_element(ELEMENT *base);
int staxp_compare(ELEMENT *a, ELEMENT *b, int invert);
int staxp_compare_to_int(ELEMENT *a, uint32_t b);
int staxp_is_stringlike(ELEMENT *e);
int staxp_can_be_string_element(ELEMENT *e);
ELEMENT *staxp_idx(ELEMENT ***stack, size_t *nstack, size_t *astack, char *freestack);
uint32_t staxp_offset(ELEMENT *a, ELEMENT *t, char wrap);
void staxp_replace1(ELEMENT **target, size_t len, ELEMENT *replace, size_t offset);
int staxp_truthy(void);
void staxp_foreach(int (*blockcode)(void));
void staxp_read_input(void);
void staxp_read_all_input(void);
char *staxp_getdigits(size_t len, size_t *arraydata);
noreturn staxp_assertfail(const char *);
noreturn staxp_oom(void);
noreturn staxp_empty_stack(void);

size_t staxp_divrem(size_t divlow, size_t *divhigh, size_t dividend);

extern STACK stax_input_stack;
extern STACK stax_main_stack;
extern ELEMENT stax_constant_z;
extern ELEMENT stax_constant_zero;
extern ELEMENT stax_constant_one;
extern ELEMENT stax_constant_minus_one;
extern ELEMENT *stax_register_x;
extern ELEMENT *stax_register_y;
extern ELEMENT *stax_register_z;
extern ELEMENT *stax_register__;
extern ELEMENT *stax_argv;
extern char stax_any_output;

#define staxp_assert(expr, msg) (void)((expr) ? 0 : (staxp_assertfail(msg), 0))
