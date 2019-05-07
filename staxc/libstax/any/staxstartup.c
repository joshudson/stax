/* stax runtime
 * Copyright (C) Joshua Hudson 2018
 */

#include <stdlib.h>
#include <iconv.h>
#include "../libstax.h"
#include "../platform.h"

void stax_startup(int argc, char **argv)
{
	ELEMENT *args = &stax_constant_z;
	stax_push_element(args);
	while (*++argv)
	{
		args = staxp_string_to_element(*argv);
		staxp_unpop_element(args);
		stax_push_element(&stax_constant_one);
		stax_listify();
		stax_add();
	}
	stax_argv = staxp_pop_element();
}
