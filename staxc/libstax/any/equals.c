#include "../libstax.h"
#include "../platform.h"

void stax_equals(void)
{
	ELEMENT *right = staxp_pop_element();
	ELEMENT *left = staxp_pop_element();
	ELEMENT *result = staxp_compare(left, right, 0) == 0 ? &stax_constant_one : &stax_constant_zero;
	staxp_release_element(right);
	staxp_release_element(left);
	stax_push_element(result);
}
