#include <stdlib.h>
#include <stdint.h>
#include <limits.h>
#include <string.h>
#include "../mpi.h"

void stax_mpi_add(uint32_t *targetlen, size_t **target, uint32_t addendlen, const size_t *addend,
		void (*reallocate)(uint32_t newtargetlen, uint32_t targetlen, size_t **target))
{
	size_t accum = 0; /* always 0 or 1 */
	uint32_t tgtlen = *targetlen;
	size_t *tgt = *target;
	for (uint32_t i = 0; i < addendlen || accum; i++) {
		if (i == tgtlen) {
			uint32_t newtargetlen = i;
			if (newtargetlen < addendlen) newtargetlen = addendlen;
			reallocate(newtargetlen, tgtlen, target);
			tgt = *target;
			memset(tgt, 0, (newtargetlen - tgtlen) * sizeof(size_t));
			*targetlen = tgtlen = newtargetlen;
		}
		/* the pointer arith to get direct access to adc just isn't worth it */
		size_t accum2 = 0;
		size_t result = tgt[i] + accum;
		if (result < accum) ++accum2;
		if (i < addendlen) {
			result += addend[i];
			if (result < addend[i]) ++accum2;
		}
		tgt[i] = result;
		accum = accum2;
	}
}

void stax_mpi_sub(uint32_t minuendlen, size_t *minuend, uint32_t subtrahendlen, const size_t *subtrahend)
{
	size_t borrow = 0;
	for (uint32_t i = 0; i < subtrahendlen || borrow; i++) {
		size_t borrow2 = 0;
		size_t prev = minuend[i];
		size_t result = prev - borrow;
		if (result > prev) ++borrow2;
		if (i < subtrahendlen) {
			prev = result;
			result -= subtrahend[i];
			if (result > prev) ++borrow2;
		}
		minuend[i] = result;
		borrow = borrow2;
	}
}

int stax_mpi_compare(uint32_t minuendlen, const size_t *minuend, uint32_t subtrahendlen, const size_t *subtrahend)
{
	for (uint32_t i = minuendlen; i-- > subtrahendlen;)
		if (minuend[i])
			return 1;
	for (uint32_t i = subtrahendlen; i-- > minuendlen;)
		if (subtrahend[i])
			return -1;
	for (uint32_t i = minuendlen; i-- > 0;)
		if (minuend[i] > subtrahend[i])
			return 1;
		else if (minuend[i] < subtrahend[i])
			return -1;
	return 0;
}
