struct element;

int stax_final(void);
void stax_startup(int argc, char **argv);
void stax_push_element(struct element *);
void stax_push_input_element(struct element *);

void stax_alter(void); /* a */
void stax_both_copy(void); /* b */
void stax_copy(void); /* c */
void stax_discard(void); /* d */
void stax_listify(void); /* l */
void stax_print(void); /* p */
void stax_reverse_range(void); /* r */
void stax_swap(void);	/* s */
void stax_regread_x(void); /* x */
void stax_regread_y(void); /* y */

void stax_explode(void); /* E */
void stax_foreach(void); /* F */
void stax_indexof(void); /* I */
void stax_listify_all(void); /* L */
void stax_tuck1(void); /* O */
void stax_println(void); /* P */
void stax_regwrite_x(void); /* X */
void stax_regwrite_y(void); /* Y */
void stax_tuck0(void); /* Z */

void stax_add(void);	/* + */
void stax_subtract(void); /* - */
void stax_modulus(void); /* % */
void stax_equals(void); /* = */
void stax_greater(void); /* > */
void stax_less(void); /* < */
void stax_under(void); /* [ */
void stax_input_push(void); /* ~ */
void stax_input_peek(void); /* ; */
void stax_input_pop(void); /* , */
void stax_ifelse(void); /* ? */
void stax_at(void); /* @ */
void stax_stringify(void); /* $ */
void stax_ampersand(void); /* & */
void stax_countinstances(void); /* # */
void stax_main_depth(void); /* |d */
void stax_input_depth(void); /* |D */
void stax_startswith(void); /* :[ */
