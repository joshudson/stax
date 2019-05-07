#	nop
#	nop
#	nop
#	nop
#	nop
#	nop
stax_foreach:
	push	%rbp
	mov	%rsp, %rbp
	sub	$16, %rsp

	call	staxp_pop_element
	cmpb	$5, 4(%rax)
	jne	.Ltrampoline
	mov	%rax, -8(%rbp)
	mov	16(%rax), %rdi
	call	staxp_foreach
	mov	-8(%rbp), %rdi
	call	staxp_release_element
	add	$16, %rsp
	xor	%rax, %rax
	pop	%rbp
	ret

# Put these in if you discover something is trying to find the function prologue
#	push	%rbp
#	mov	%rbp, %rsp
#	sub	32, %rbp
.Ltrampoline:
	mov	%rdi, %rax
	call	staxp_unpop_element
	mov	8(%rbp), %rdi
	xor	%rsi, %rsi
	call	staxp_alloc_trampoline
	mov	%rax, -8(%rbp)
	mov	%rax, %rdi
	call	staxp_foreach
	mov	-8(%rbp), %rdi
	call	staxp_free_trampoline
	add	$32, %rsp
	xor	%rax, %rax
	pop	%rbp
	ret

.global stax_foreach
