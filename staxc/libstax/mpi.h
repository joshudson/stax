void stax_mpi_add(uint32_t *targetlen, size_t **target, uint32_t addendlen, const size_t *addend,
                void (*reallocate)(uint32_t newtargetlen, uint32_t targetlen, size_t **target));
void stax_mpi_sub(uint32_t minuendlen, size_t *minuend, uint32_t subtrahendlen, const size_t *subtrahend);
int stax_mpi_compare(uint32_t minuendlen, const size_t *minuend, uint32_t subtrahendlen, const size_t *subtrahend);
