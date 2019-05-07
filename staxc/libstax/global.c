#include "libstax.h"
#include "platform.h"

ELEMENT stax_constant_z = { 0xFFFFFFFF, TAG_ARRAY, 0, 0, 0, 0, 0 };
ELEMENT stax_constant_zero = { 0xFFFFFFFF, TAG_INT, 0, 0, 0, 1, 1, { 0 } };
ELEMENT stax_constant_one = { 0xFFFFFFFF, TAG_INT, 0, 0, 0, 1, 1, { 1 } };
ELEMENT stax_constant_minus_one = { 0xFFFFFFFF, TAG_INT, 1, 0, 0, 1, 1, { 1 } };

ELEMENT *stax_argv;
ELEMENT *stax_register_z = &stax_constant_z;
ELEMENT *stax_register__ = &stax_constant_z;

STACK stax_input_stack = { 0, 0, NULL };
STACK stax_main_stack = { 0, 0, NULL };

char stax_any_output;
