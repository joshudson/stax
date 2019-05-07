#include <stddef.h>
#include <stdlib.h>
#include "../libstax.h"
#include "../platform.h"

static void stax_push2(STACK *stack, ELEMENT *element)
{
	if (stack->alloc <= stack->size) {
		if (stack->alloc == 0)
			stack->alloc = 16;
		else
			stack->alloc <<= 1;
		stack->elements = realloc(stack->elements, sizeof(ELEMENT *) * stack->alloc);
		if (!stack->elements) staxp_oom();
	}
	stack->elements[stack->size++] = element;
	staxp_own_element(element);
}

void stax_push_element(ELEMENT *element)
{
	stax_push2(&stax_main_stack, element);
}

void staxp_unpop_element(ELEMENT *element)
{
	stax_push2(&stax_main_stack, element);
	staxp_release_element(element);
}

void stax_push_input_element(ELEMENT *element)
{
	stax_push2(&stax_input_stack, element);
}

ELEMENT *staxp_pop_element()
{
	if (stax_main_stack.size == 0) return staxp_pop_input_element();
	return stax_main_stack.elements[--stax_main_stack.size];
}

ELEMENT *staxp_pop_input_element()
{
	if (stax_input_stack.size == 0) staxp_read_input();
	if (stax_input_stack.size == 0) staxp_empty_stack();
	return stax_input_stack.elements[--stax_input_stack.size];
}

void stax_listify(void)
{
	ELEMENT *n = staxp_pop_element();
	staxp_assert((n->tag == TAG_INT || n->tag == TAG_RATIONAL && n->size2 == 1 && n->intdata[n->size1] == 1), "non-integer argument to listify");
	ELEMENT *a;
	if (n->sign) {
		a = &stax_constant_z;
	} else {
		for (uint32_t i = n->size1; i-- > 1;)
			if (n->intdata[i])
				staxp_oom(); /* > SIZE_T_MAX can't be allocated */
		a = staxp_new_array_element(n->intdata[0], NULL);
		for (size_t i = n->intdata[0]; i-- > 0;)
			a->arraydata[i] = staxp_pop_element();
	}
	staxp_unpop_element(a);
}
