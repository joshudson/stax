#include <stdio.h>
#include "../libstax.h"
#include "../platform.h"

void staxp_read_all_input(void)
{
	while (!feof(stdin))
		staxp_read_input();
}
