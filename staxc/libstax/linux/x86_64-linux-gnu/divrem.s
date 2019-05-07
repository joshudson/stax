staxp_divrem:
	mov	%rdx, %rcx
	mov	%rdi, %rax
	mov	(%rsi), %rdx
	div	%rcx
	mov	%rdx, (%rsi)
	ret

.global staxp_divrem
