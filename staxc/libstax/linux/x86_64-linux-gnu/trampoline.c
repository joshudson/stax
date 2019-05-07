#include <sys/mman.h>
#include <asm/mman.h>
#include "../../libstax.h"
#include "../../platform.h"

typedef union trampoline {
	unsigned char bytes[32];
	union trampoline *next;
} TRAMPOLINE;

static TRAMPOLINE *head;

void *staxp_alloc_trampoline(void *whence, unsigned char template)
{
	if (!head) {
		TRAMPOLINE *build = mmap(NULL, 4096, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
		for (uint32_t counter = 4096 / sizeof(TRAMPOLINE); counter-- > 0;)
		{
			build->bytes[sizeof(TRAMPOLINE) - 1] = 0xFF;
			build->next = head;
			head = build++;
		}
	}
	TRAMPOLINE *mine = head;
	staxp_assert(mine->bytes[sizeof(TRAMPOLINE) - 1] == 0xFF, "allocated an allocated trampoline; check for slab corruption");
	head = head->next;
	unsigned char *b = mine->bytes;
#define B(n) (void)(*b++ = (n))
	switch (template)
	{
		case 0:
			B(0x55);		 	/* push rbp */
			B(0x48); B(0x89); B(0xE5);	/* mov rbp, rsp */
			B(0x48); B(0xB8);		/* mov rax, immed64 */
			*(volatile void **)b = whence; b += 8;
			B(0xFF); B(0xE0);		/* jmp rax */
			B(0xCC);			/* int 3 */
			break;
		default:
			staxp_assertfail("unknown trampoline template");
	}
	mine->bytes[sizeof(TRAMPOLINE) - 1] = template;
	return mine;
}

void staxp_free_trampoline(TRAMPOLINE *trampoline)
{
	switch (trampoline->bytes[sizeof(TRAMPOLINE) - 1])
	{
		case 0:
			break;
		case 0xFF:
			staxp_assertfail("trampoline double free");
		default:
			staxp_assertfail("unknown trampoline encountered; check for slab corruption");
	}
	trampoline->bytes[sizeof(TRAMPOLINE) - 1] = 0xFF;
	trampoline->next = head;
	head = trampoline;
}
