.globl main
.text
main:
pushq %rbp
movq %rsp,%rbp
call stax_startup
call blkdef0
call stax_final
popq %rbp
ret
block0:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef0
blkdef0:
pushq %rbp
movq %rsp,%rbp
call stax_listify_all
leaq constant0(%rip), %rdi
call stax_push_element
call stax_input_push
leaq block1(%rip), %rdi
call stax_push_element
call stax_foreach
leaq block2(%rip), %rdi
call stax_push_element
call stax_commandline
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
leaq constant5(%rip), %rdi
call stax_push_element
call stax_equals
leaq block3(%rip), %rdi
call stax_push_element
leaq block5(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_commandline
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
leaq constant6(%rip), %rdi
call stax_push_element
call stax_equals
leaq block6(%rip), %rdi
call stax_push_element
leaq block43(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant46(%rip), %rdi
call stax_push_element
call stax_swap
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant48(%rip), %rdi
call stax_push_element
leaq block44(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant63(%rip), %rdi
call stax_push_element
leaq block68(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant65(%rip), %rdi
call stax_push_element
leaq block71(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant62(%rip), %rdi
call stax_push_element
leaq block72(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant74(%rip), %rdi
call stax_push_element
leaq block75(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant80(%rip), %rdi
call stax_push_element
leaq block78(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant169(%rip), %rdi
call stax_push_element
leaq block226(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant171(%rip), %rdi
call stax_push_element
call stax_listify
leaq block238(%rip), %rdi
call stax_push_element
leaq block242(%rip), %rdi
call stax_push_element
leaq constant172(%rip), %rdi
call stax_push_element
call stax_listify
call stax_regwrite_x
call stax_discard
leaq constant4(%rip), %rdi
call stax_push_element
leaq block246(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
call stax_regwrite_y
call stax_discard
call stax_input_pop
leaq constant0(%rip), %rdi
call stax_push_element
call stax_input_push
leaq block261(%rip), %rdi
call stax_push_element
call stax_foreach
call stax_input_pop
leaq constant48(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq constant80(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq constant169(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block1:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef1
blkdef1:
pushq %rbp
movq %rsp,%rbp
call stax_input_pop
call stax_swap
leaq constant1(%rip), %rdi
call stax_push_element
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_add
call stax_add
call stax_input_push
xorq %rax, %rax
popq %rbp
ret
block2:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef2
blkdef2:
pushq %rbp
movq %rsp,%rbp
leaq constant3(%rip), %rdi
call stax_push_element
call stax_println
call stax_listify_all
call stax_discard
call stax_println
xorq %rax, %rax
popq %rbp
ret
block3:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef3
blkdef3:
pushq %rbp
movq %rsp,%rbp
leaq block4(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block4:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef4
blkdef4:
pushq %rbp
movq %rsp,%rbp
call stax_println
xorq %rax, %rax
popq %rbp
ret
block5:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef5
blkdef5:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block6:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef6
blkdef6:
pushq %rbp
movq %rsp,%rbp
leaq block7(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block7:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef7
blkdef7:
pushq %rbp
movq %rsp,%rbp
leaq block8(%rip), %rdi
call stax_push_element
call stax_next
call stax_copy
leaq constant0(%rip), %rdi
call stax_push_element
call stax_equals
leaq block9(%rip), %rdi
call stax_push_element
leaq block11(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant8(%rip), %rdi
call stax_push_element
call stax_equals
leaq block12(%rip), %rdi
call stax_push_element
leaq block14(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant19(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block15(%rip), %rdi
call stax_push_element
leaq block17(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant25(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block18(%rip), %rdi
call stax_push_element
leaq block20(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant29(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block21(%rip), %rdi
call stax_push_element
leaq block23(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant31(%rip), %rdi
call stax_push_element
call stax_equals
leaq block24(%rip), %rdi
call stax_push_element
leaq block26(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant33(%rip), %rdi
call stax_push_element
call stax_equals
leaq block27(%rip), %rdi
call stax_push_element
leaq block29(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant34(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block30(%rip), %rdi
call stax_push_element
leaq block32(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant36(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block33(%rip), %rdi
call stax_push_element
leaq block36(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant40(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block37(%rip), %rdi
call stax_push_element
leaq block39(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant43(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block40(%rip), %rdi
call stax_push_element
leaq block42(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_discard
call stax_inverse
call stax_discard
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block8:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef8
blkdef8:
pushq %rbp
movq %rsp,%rbp
leaq constant7(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
call stax_println
call stax_listify_all
call stax_discard
call stax_println
xorq %rax, %rax
popq %rbp
ret
block9:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef9
blkdef9:
pushq %rbp
movq %rsp,%rbp
leaq block10(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block10:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef10
blkdef10:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block11:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef11
blkdef11:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block12:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef12
blkdef12:
pushq %rbp
movq %rsp,%rbp
leaq block13(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block13:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef13
blkdef13:
pushq %rbp
movq %rsp,%rbp
leaq constant9(%rip), %rdi
call stax_push_element
call stax_println
leaq constant10(%rip), %rdi
call stax_push_element
call stax_println
leaq constant11(%rip), %rdi
call stax_push_element
call stax_println
leaq constant12(%rip), %rdi
call stax_push_element
call stax_println
leaq constant13(%rip), %rdi
call stax_push_element
call stax_println
leaq constant14(%rip), %rdi
call stax_push_element
call stax_println
leaq constant15(%rip), %rdi
call stax_push_element
call stax_println
leaq constant16(%rip), %rdi
call stax_push_element
call stax_println
leaq constant17(%rip), %rdi
call stax_push_element
call stax_println
leaq constant18(%rip), %rdi
call stax_push_element
call stax_println
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block14:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef14
blkdef14:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block15:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef15
blkdef15:
pushq %rbp
movq %rsp,%rbp
leaq block16(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block16:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef16
blkdef16:
pushq %rbp
movq %rsp,%rbp
leaq constant19(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
call stax_copy
leaq constant20(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant21(%rip), %rdi
call stax_push_element
call stax_add
call stax_println
leaq constant22(%rip), %rdi
call stax_push_element
call stax_println
call stax_copy
leaq constant23(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
call stax_println
leaq constant24(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant21(%rip), %rdi
call stax_push_element
call stax_add
call stax_println
leaq constant12(%rip), %rdi
call stax_push_element
call stax_println
leaq constant13(%rip), %rdi
call stax_push_element
call stax_println
xorq %rax, %rax
popq %rbp
ret
block17:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef17
blkdef17:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block18:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef18
blkdef18:
pushq %rbp
movq %rsp,%rbp
leaq block19(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block19:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef19
blkdef19:
pushq %rbp
movq %rsp,%rbp
leaq constant25(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant26(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant27(%rip), %rdi
call stax_push_element
call stax_add
call stax_println
leaq constant28(%rip), %rdi
call stax_push_element
call stax_println
xorq %rax, %rax
popq %rbp
ret
block20:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef20
blkdef20:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block21:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef21
blkdef21:
pushq %rbp
movq %rsp,%rbp
leaq block22(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block22:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef22
blkdef22:
pushq %rbp
movq %rsp,%rbp
leaq constant29(%rip), %rdi
call stax_push_element
leaq constant30(%rip), %rdi
call stax_push_element
call stax_replacefront
call stax_println
xorq %rax, %rax
popq %rbp
ret
block23:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef23
blkdef23:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block24:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef24
blkdef24:
pushq %rbp
movq %rsp,%rbp
leaq block25(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block25:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef25
blkdef25:
pushq %rbp
movq %rsp,%rbp
leaq constant32(%rip), %rdi
call stax_push_element
call stax_println
leaq constant17(%rip), %rdi
call stax_push_element
call stax_println
leaq constant18(%rip), %rdi
call stax_push_element
call stax_println
xorq %rax, %rax
popq %rbp
ret
block26:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef26
blkdef26:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block27:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef27
blkdef27:
pushq %rbp
movq %rsp,%rbp
leaq block28(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block28:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef28
blkdef28:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block29:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef29
blkdef29:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block30:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef30
blkdef30:
pushq %rbp
movq %rsp,%rbp
leaq block31(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block31:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef31
blkdef31:
pushq %rbp
movq %rsp,%rbp
leaq constant34(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant35(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant21(%rip), %rdi
call stax_push_element
call stax_add
call stax_println
xorq %rax, %rax
popq %rbp
ret
block32:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef32
blkdef32:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block33:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef33
blkdef33:
pushq %rbp
movq %rsp,%rbp
leaq block34(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block34:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef34
blkdef34:
pushq %rbp
movq %rsp,%rbp
leaq constant36(%rip), %rdi
call stax_push_element
leaq constant37(%rip), %rdi
call stax_push_element
call stax_add
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
call stax_copy
call stax_modulus
call stax_copy
leaq constant38(%rip), %rdi
call stax_push_element
call stax_println
leaq constant39(%rip), %rdi
call stax_push_element
call stax_print
call stax_stringify
call stax_println
leaq constant39(%rip), %rdi
call stax_push_element
call stax_print
call stax_stringify
call stax_println
leaq block35(%rip), %rdi
call stax_push_element
call stax_foreach
xorq %rax, %rax
popq %rbp
ret
block35:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef35
blkdef35:
pushq %rbp
movq %rsp,%rbp
leaq constant39(%rip), %rdi
call stax_push_element
call stax_print
call stax_stringify
call stax_println
xorq %rax, %rax
popq %rbp
ret
block36:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef36
blkdef36:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block37:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef37
blkdef37:
pushq %rbp
movq %rsp,%rbp
leaq block38(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block38:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef38
blkdef38:
pushq %rbp
movq %rsp,%rbp
leaq constant40(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant41(%rip), %rdi
call stax_push_element
call stax_println
leaq constant42(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
call stax_println
xorq %rax, %rax
popq %rbp
ret
block39:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef39
blkdef39:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block40:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef40
blkdef40:
pushq %rbp
movq %rsp,%rbp
leaq block41(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block41:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef41
blkdef41:
pushq %rbp
movq %rsp,%rbp
leaq constant43(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant44(%rip), %rdi
call stax_push_element
call stax_println
leaq constant45(%rip), %rdi
call stax_push_element
call stax_add
call stax_println
xorq %rax, %rax
popq %rbp
ret
block42:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef42
blkdef42:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block43:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef43
blkdef43:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block44:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef44
blkdef44:
pushq %rbp
movq %rsp,%rbp
leaq constant49(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant50(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant51(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant52(%rip), %rdi
call stax_push_element
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant53(%rip), %rdi
call stax_push_element
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant54(%rip), %rdi
call stax_push_element
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant55(%rip), %rdi
call stax_push_element
leaq constant2(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant56(%rip), %rdi
call stax_push_element
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq block45(%rip), %rdi
call stax_push_element
call stax_foreach
xorq %rax, %rax
popq %rbp
ret
block45:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef45
blkdef45:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant57(%rip), %rdi
call stax_push_element
call stax_equals
leaq block46(%rip), %rdi
call stax_push_element
leaq block47(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant58(%rip), %rdi
call stax_push_element
call stax_equals
leaq block48(%rip), %rdi
call stax_push_element
leaq block49(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_copy
leaq constant60(%rip), %rdi
call stax_push_element
call stax_greater
call stax_swap
leaq constant61(%rip), %rdi
call stax_push_element
call stax_less
call stax_bitand
leaq block50(%rip), %rdi
call stax_push_element
leaq block51(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block46:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef46
blkdef46:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant37(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block47:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef47
blkdef47:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block48:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef48
blkdef48:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant59(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block49:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef49
blkdef49:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block50:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef50
blkdef50:
pushq %rbp
movq %rsp,%rbp
leaq constant62(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq constant37(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant63(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block51:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef51
blkdef51:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
leaq constant64(%rip), %rdi
call stax_push_element
call stax_equals
leaq block52(%rip), %rdi
call stax_push_element
leaq block53(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block52:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef52
blkdef52:
pushq %rbp
movq %rsp,%rbp
leaq constant65(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq constant37(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant63(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block53:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef53
blkdef53:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant66(%rip), %rdi
call stax_push_element
call stax_equals
leaq block54(%rip), %rdi
call stax_push_element
leaq block55(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block54:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef54
blkdef54:
pushq %rbp
movq %rsp,%rbp
leaq constant51(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant51(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant52(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_add
leaq constant51(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant53(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant2(%rip), %rdi
call stax_push_element
call stax_add
leaq constant53(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant54(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant2(%rip), %rdi
call stax_push_element
call stax_add
leaq constant54(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant49(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant49(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant0(%rip), %rdi
call stax_push_element
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_add
leaq constant49(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant53(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant52(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block55:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef55
blkdef55:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant67(%rip), %rdi
call stax_push_element
call stax_equals
leaq block56(%rip), %rdi
call stax_push_element
leaq block57(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block56:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef56
blkdef56:
pushq %rbp
movq %rsp,%rbp
leaq constant68(%rip), %rdi
call stax_push_element
call stax_println
call stax_listify_all
call stax_discard
call stax_println
xorq %rax, %rax
popq %rbp
ret
block57:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef57
blkdef57:
pushq %rbp
movq %rsp,%rbp
leaq constant54(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq block58(%rip), %rdi
call stax_push_element
leaq block63(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block58:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef58
blkdef58:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant69(%rip), %rdi
call stax_push_element
call stax_swap
call stax_indexof
leaq constant2(%rip), %rdi
call stax_push_element
call stax_add
leaq block59(%rip), %rdi
call stax_push_element
leaq block62(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block59:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef59
blkdef59:
pushq %rbp
movq %rsp,%rbp
leaq constant51(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant0(%rip), %rdi
call stax_push_element
leaq constant51(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_copy
call stax_modulus
call stax_input_push
call stax_reverse_range
call stax_explode
call stax_input_pop
leaq constant2(%rip), %rdi
call stax_push_element
call stax_subtract
call stax_listify
call stax_reverse_range
leaq constant51(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant52(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_swap
leaq constant52(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant70(%rip), %rdi
call stax_push_element
call stax_swap
call stax_stringify
call stax_add
leaq constant63(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq constant54(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant2(%rip), %rdi
call stax_push_element
call stax_subtract
leaq constant54(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_copy
leaq constant70(%rip), %rdi
call stax_push_element
call stax_equals
leaq block60(%rip), %rdi
call stax_push_element
leaq block61(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block60:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef60
blkdef60:
pushq %rbp
movq %rsp,%rbp
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block61:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef61
blkdef61:
pushq %rbp
movq %rsp,%rbp
leaq constant63(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block62:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef62
blkdef62:
pushq %rbp
movq %rsp,%rbp
leaq constant63(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block63:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef63
blkdef63:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant70(%rip), %rdi
call stax_push_element
call stax_equals
leaq block64(%rip), %rdi
call stax_push_element
leaq block65(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block64:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef64
blkdef64:
pushq %rbp
movq %rsp,%rbp
leaq constant71(%rip), %rdi
call stax_push_element
call stax_println
call stax_listify_all
call stax_discard
call stax_println
xorq %rax, %rax
popq %rbp
ret
block65:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef65
blkdef65:
pushq %rbp
movq %rsp,%rbp
call stax_copy
call stax_modulus
leaq block66(%rip), %rdi
call stax_push_element
leaq block67(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block66:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef66
blkdef66:
pushq %rbp
movq %rsp,%rbp
leaq constant63(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block67:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef67
blkdef67:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block68:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef68
blkdef68:
pushq %rbp
movq %rsp,%rbp
leaq constant49(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant49(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant52(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_copy
call stax_input_push
call stax_next
call stax_swap
call stax_at
call stax_alter
call stax_next
call stax_modulus
call stax_inverse
call stax_next
leaq constant72(%rip), %rdi
call stax_push_element
call stax_equals
call stax_bitand
leaq block69(%rip), %rdi
call stax_push_element
leaq block70(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant49(%rip), %rdi
call stax_push_element
call stax_swap
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block69:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef69
blkdef69:
pushq %rbp
movq %rsp,%rbp
call stax_input_pop
call stax_discard
call stax_discard
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block70:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef70
blkdef70:
pushq %rbp
movq %rsp,%rbp
call stax_input_peek
call stax_swap
call stax_input_push
call stax_swap
call stax_input_push
leaq constant0(%rip), %rdi
call stax_push_element
call stax_ampersand
call stax_input_pop
call stax_input_pop
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_add
call stax_input_pop
call stax_swap
call stax_ampersand
xorq %rax, %rax
popq %rbp
ret
block71:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef71
blkdef71:
pushq %rbp
movq %rsp,%rbp
leaq constant73(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant74(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block72:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef72
blkdef72:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant75(%rip), %rdi
call stax_push_element
call stax_countinstances
leaq block73(%rip), %rdi
call stax_push_element
leaq block74(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block73:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef73
blkdef73:
pushq %rbp
movq %rsp,%rbp
leaq constant76(%rip), %rdi
call stax_push_element
leaq constant77(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant78(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant74(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block74:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef74
blkdef74:
pushq %rbp
movq %rsp,%rbp
leaq constant79(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant74(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block75:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef75
blkdef75:
pushq %rbp
movq %rsp,%rbp
leaq constant56(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_input_push
leaq constant50(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_input_push
call stax_regread_x
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_swap
call stax_regread_x
leaq constant4(%rip), %rdi
call stax_push_element
call stax_input_pop
call stax_ampersand
call stax_regwrite_x
call stax_discard
call stax_copy
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_copy
leaq block76(%rip), %rdi
call stax_push_element
leaq block77(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_regread_x
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_input_push
call stax_regread_x
call stax_alter
leaq constant4(%rip), %rdi
call stax_push_element
call stax_swap
call stax_ampersand
call stax_regwrite_x
call stax_discard
leaq constant50(%rip), %rdi
call stax_push_element
call stax_input_pop
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq constant56(%rip), %rdi
call stax_push_element
call stax_input_pop
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block76:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef76
blkdef76:
pushq %rbp
movq %rsp,%rbp
call stax_swap
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block77:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef77
blkdef77:
pushq %rbp
movq %rsp,%rbp
call stax_discard
call stax_input_pop
call stax_copy
call stax_input_push
call stax_stringify
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_input_pop
call stax_copy
leaq constant2(%rip), %rdi
call stax_push_element
call stax_add
call stax_input_push
call stax_stringify
xorq %rax, %rax
popq %rbp
ret
block78:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef78
blkdef78:
pushq %rbp
movq %rsp,%rbp
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regwrite_y
call stax_discard
leaq constant8(%rip), %rdi
call stax_push_element
leaq constant46(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq constant49(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq block79(%rip), %rdi
call stax_push_element
call stax_foreach
xorq %rax, %rax
popq %rbp
ret
block79:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef79
blkdef79:
pushq %rbp
movq %rsp,%rbp
leaq constant19(%rip), %rdi
call stax_push_element
call stax_regread_y
call stax_stringify
call stax_add
leaq constant46(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq block80(%rip), %rdi
call stax_push_element
call stax_foreach
leaq constant31(%rip), %rdi
call stax_push_element
leaq constant46(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
call stax_regread_y
leaq constant2(%rip), %rdi
call stax_push_element
call stax_add
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block80:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef80
blkdef80:
pushq %rbp
movq %rsp,%rbp
leaq block81(%rip), %rdi
call stax_push_element
call stax_next
call stax_copy
leaq constant37(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block82(%rip), %rdi
call stax_push_element
leaq block84(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant70(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block85(%rip), %rdi
call stax_push_element
leaq block87(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant72(%rip), %rdi
call stax_push_element
call stax_equals
leaq block88(%rip), %rdi
call stax_push_element
leaq block90(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant84(%rip), %rdi
call stax_push_element
call stax_equals
leaq block91(%rip), %rdi
call stax_push_element
leaq block93(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant86(%rip), %rdi
call stax_push_element
call stax_equals
leaq block94(%rip), %rdi
call stax_push_element
leaq block96(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant88(%rip), %rdi
call stax_push_element
call stax_equals
leaq block97(%rip), %rdi
call stax_push_element
leaq block99(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant90(%rip), %rdi
call stax_push_element
call stax_equals
leaq block100(%rip), %rdi
call stax_push_element
leaq block102(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant79(%rip), %rdi
call stax_push_element
call stax_equals
leaq block103(%rip), %rdi
call stax_push_element
leaq block105(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant92(%rip), %rdi
call stax_push_element
call stax_equals
leaq block106(%rip), %rdi
call stax_push_element
leaq block108(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant94(%rip), %rdi
call stax_push_element
call stax_equals
leaq block109(%rip), %rdi
call stax_push_element
leaq block111(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant96(%rip), %rdi
call stax_push_element
call stax_equals
leaq block112(%rip), %rdi
call stax_push_element
leaq block114(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant78(%rip), %rdi
call stax_push_element
call stax_equals
leaq block115(%rip), %rdi
call stax_push_element
leaq block117(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant73(%rip), %rdi
call stax_push_element
call stax_equals
leaq block118(%rip), %rdi
call stax_push_element
leaq block120(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant100(%rip), %rdi
call stax_push_element
call stax_equals
leaq block121(%rip), %rdi
call stax_push_element
leaq block123(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant102(%rip), %rdi
call stax_push_element
call stax_equals
leaq block124(%rip), %rdi
call stax_push_element
leaq block126(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant104(%rip), %rdi
call stax_push_element
call stax_equals
leaq block127(%rip), %rdi
call stax_push_element
leaq block129(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant106(%rip), %rdi
call stax_push_element
call stax_equals
leaq block130(%rip), %rdi
call stax_push_element
leaq block132(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant108(%rip), %rdi
call stax_push_element
call stax_equals
leaq block133(%rip), %rdi
call stax_push_element
leaq block135(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant110(%rip), %rdi
call stax_push_element
call stax_equals
leaq block136(%rip), %rdi
call stax_push_element
leaq block138(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant112(%rip), %rdi
call stax_push_element
call stax_equals
leaq block139(%rip), %rdi
call stax_push_element
leaq block141(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant114(%rip), %rdi
call stax_push_element
call stax_equals
leaq block142(%rip), %rdi
call stax_push_element
leaq block144(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant116(%rip), %rdi
call stax_push_element
call stax_equals
leaq block145(%rip), %rdi
call stax_push_element
leaq block147(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant118(%rip), %rdi
call stax_push_element
call stax_equals
leaq block148(%rip), %rdi
call stax_push_element
leaq block150(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant120(%rip), %rdi
call stax_push_element
call stax_equals
leaq block151(%rip), %rdi
call stax_push_element
leaq block153(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant76(%rip), %rdi
call stax_push_element
call stax_equals
leaq block154(%rip), %rdi
call stax_push_element
leaq block156(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant123(%rip), %rdi
call stax_push_element
call stax_equals
leaq block157(%rip), %rdi
call stax_push_element
leaq block159(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant125(%rip), %rdi
call stax_push_element
call stax_equals
leaq block160(%rip), %rdi
call stax_push_element
leaq block162(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant127(%rip), %rdi
call stax_push_element
call stax_equals
leaq block163(%rip), %rdi
call stax_push_element
leaq block165(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant129(%rip), %rdi
call stax_push_element
call stax_equals
leaq block166(%rip), %rdi
call stax_push_element
leaq block168(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant131(%rip), %rdi
call stax_push_element
call stax_equals
leaq block169(%rip), %rdi
call stax_push_element
leaq block171(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant133(%rip), %rdi
call stax_push_element
call stax_equals
leaq block172(%rip), %rdi
call stax_push_element
leaq block174(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant135(%rip), %rdi
call stax_push_element
call stax_equals
leaq block175(%rip), %rdi
call stax_push_element
leaq block177(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant137(%rip), %rdi
call stax_push_element
call stax_equals
leaq block178(%rip), %rdi
call stax_push_element
leaq block180(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant139(%rip), %rdi
call stax_push_element
call stax_equals
leaq block181(%rip), %rdi
call stax_push_element
leaq block183(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant141(%rip), %rdi
call stax_push_element
call stax_equals
leaq block184(%rip), %rdi
call stax_push_element
leaq block186(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant143(%rip), %rdi
call stax_push_element
call stax_equals
leaq block187(%rip), %rdi
call stax_push_element
leaq block189(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant145(%rip), %rdi
call stax_push_element
call stax_equals
leaq block190(%rip), %rdi
call stax_push_element
leaq block192(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant147(%rip), %rdi
call stax_push_element
call stax_equals
leaq block193(%rip), %rdi
call stax_push_element
leaq block195(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant149(%rip), %rdi
call stax_push_element
call stax_equals
leaq block196(%rip), %rdi
call stax_push_element
leaq block198(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant151(%rip), %rdi
call stax_push_element
call stax_equals
leaq block199(%rip), %rdi
call stax_push_element
leaq block201(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant153(%rip), %rdi
call stax_push_element
call stax_equals
leaq block202(%rip), %rdi
call stax_push_element
leaq block204(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant155(%rip), %rdi
call stax_push_element
call stax_equals
leaq block205(%rip), %rdi
call stax_push_element
leaq block207(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant157(%rip), %rdi
call stax_push_element
call stax_equals
leaq block208(%rip), %rdi
call stax_push_element
leaq block210(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant159(%rip), %rdi
call stax_push_element
call stax_equals
leaq block211(%rip), %rdi
call stax_push_element
leaq block213(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant161(%rip), %rdi
call stax_push_element
call stax_equals
leaq block214(%rip), %rdi
call stax_push_element
leaq block216(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant163(%rip), %rdi
call stax_push_element
call stax_equals
leaq block217(%rip), %rdi
call stax_push_element
leaq block219(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant165(%rip), %rdi
call stax_push_element
call stax_equals
leaq block220(%rip), %rdi
call stax_push_element
leaq block222(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant167(%rip), %rdi
call stax_push_element
call stax_equals
leaq block223(%rip), %rdi
call stax_push_element
leaq block225(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_discard
call stax_inverse
leaq constant46(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
call stax_discard
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block81:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef81
blkdef81:
pushq %rbp
movq %rsp,%rbp
leaq constant81(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
call stax_println
call stax_listify_all
call stax_discard
call stax_println
xorq %rax, %rax
popq %rbp
ret
block82:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef82
blkdef82:
pushq %rbp
movq %rsp,%rbp
leaq block83(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block83:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef83
blkdef83:
pushq %rbp
movq %rsp,%rbp
leaq constant37(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant82(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
xorq %rax, %rax
popq %rbp
ret
block84:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef84
blkdef84:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block85:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef85
blkdef85:
pushq %rbp
movq %rsp,%rbp
leaq block86(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block86:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef86
blkdef86:
pushq %rbp
movq %rsp,%rbp
leaq constant70(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant83(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
xorq %rax, %rax
popq %rbp
ret
block87:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef87
blkdef87:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block88:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef88
blkdef88:
pushq %rbp
movq %rsp,%rbp
leaq block89(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block89:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef89
blkdef89:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant0(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block90:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef90
blkdef90:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block91:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef91
blkdef91:
pushq %rbp
movq %rsp,%rbp
leaq block92(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block92:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef92
blkdef92:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant85(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block93:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef93
blkdef93:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block94:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef94
blkdef94:
pushq %rbp
movq %rsp,%rbp
leaq block95(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block95:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef95
blkdef95:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant87(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block96:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef96
blkdef96:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block97:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef97
blkdef97:
pushq %rbp
movq %rsp,%rbp
leaq block98(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block98:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef98
blkdef98:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant89(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block99:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef99
blkdef99:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block100:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef100
blkdef100:
pushq %rbp
movq %rsp,%rbp
leaq block101(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block101:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef101
blkdef101:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant91(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block102:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef102
blkdef102:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block103:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef103
blkdef103:
pushq %rbp
movq %rsp,%rbp
leaq block104(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block104:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef104
blkdef104:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant0(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block105:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef105
blkdef105:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block106:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef106
blkdef106:
pushq %rbp
movq %rsp,%rbp
leaq block107(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block107:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef107
blkdef107:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant93(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block108:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef108
blkdef108:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block109:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef109
blkdef109:
pushq %rbp
movq %rsp,%rbp
leaq block110(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block110:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef110
blkdef110:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant95(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block111:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef111
blkdef111:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block112:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef112
blkdef112:
pushq %rbp
movq %rsp,%rbp
leaq block113(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block113:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef113
blkdef113:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant97(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block114:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef114
blkdef114:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block115:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef115
blkdef115:
pushq %rbp
movq %rsp,%rbp
leaq block116(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block116:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef116
blkdef116:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant98(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block117:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef117
blkdef117:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block118:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef118
blkdef118:
pushq %rbp
movq %rsp,%rbp
leaq block119(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block119:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef119
blkdef119:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant99(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block120:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef120
blkdef120:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block121:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef121
blkdef121:
pushq %rbp
movq %rsp,%rbp
leaq block122(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block122:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef122
blkdef122:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant101(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block123:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef123
blkdef123:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block124:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef124
blkdef124:
pushq %rbp
movq %rsp,%rbp
leaq block125(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block125:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef125
blkdef125:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant103(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block126:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef126
blkdef126:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block127:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef127
blkdef127:
pushq %rbp
movq %rsp,%rbp
leaq block128(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block128:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef128
blkdef128:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant105(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block129:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef129
blkdef129:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block130:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef130
blkdef130:
pushq %rbp
movq %rsp,%rbp
leaq block131(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block131:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef131
blkdef131:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant107(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block132:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef132
blkdef132:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block133:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef133
blkdef133:
pushq %rbp
movq %rsp,%rbp
leaq block134(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block134:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef134
blkdef134:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant109(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block135:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef135
blkdef135:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block136:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef136
blkdef136:
pushq %rbp
movq %rsp,%rbp
leaq block137(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block137:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef137
blkdef137:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant111(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block138:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef138
blkdef138:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block139:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef139
blkdef139:
pushq %rbp
movq %rsp,%rbp
leaq block140(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block140:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef140
blkdef140:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant113(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block141:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef141
blkdef141:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block142:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef142
blkdef142:
pushq %rbp
movq %rsp,%rbp
leaq block143(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block143:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef143
blkdef143:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant115(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block144:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef144
blkdef144:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block145:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef145
blkdef145:
pushq %rbp
movq %rsp,%rbp
leaq block146(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block146:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef146
blkdef146:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant117(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block147:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef147
blkdef147:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block148:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef148
blkdef148:
pushq %rbp
movq %rsp,%rbp
leaq block149(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block149:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef149
blkdef149:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant119(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block150:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef150
blkdef150:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block151:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef151
blkdef151:
pushq %rbp
movq %rsp,%rbp
leaq block152(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block152:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef152
blkdef152:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant121(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block153:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef153
blkdef153:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block154:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef154
blkdef154:
pushq %rbp
movq %rsp,%rbp
leaq block155(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block155:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef155
blkdef155:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant122(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block156:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef156
blkdef156:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block157:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef157
blkdef157:
pushq %rbp
movq %rsp,%rbp
leaq block158(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block158:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef158
blkdef158:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant124(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block159:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef159
blkdef159:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block160:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef160
blkdef160:
pushq %rbp
movq %rsp,%rbp
leaq block161(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block161:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef161
blkdef161:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant126(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block162:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef162
blkdef162:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block163:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef163
blkdef163:
pushq %rbp
movq %rsp,%rbp
leaq block164(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block164:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef164
blkdef164:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant128(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block165:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef165
blkdef165:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block166:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef166
blkdef166:
pushq %rbp
movq %rsp,%rbp
leaq block167(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block167:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef167
blkdef167:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant130(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block168:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef168
blkdef168:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block169:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef169
blkdef169:
pushq %rbp
movq %rsp,%rbp
leaq block170(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block170:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef170
blkdef170:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant132(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block171:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef171
blkdef171:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block172:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef172
blkdef172:
pushq %rbp
movq %rsp,%rbp
leaq block173(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block173:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef173
blkdef173:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant134(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block174:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef174
blkdef174:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block175:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef175
blkdef175:
pushq %rbp
movq %rsp,%rbp
leaq block176(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block176:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef176
blkdef176:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant136(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block177:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef177
blkdef177:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block178:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef178
blkdef178:
pushq %rbp
movq %rsp,%rbp
leaq block179(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block179:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef179
blkdef179:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant138(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block180:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef180
blkdef180:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block181:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef181
blkdef181:
pushq %rbp
movq %rsp,%rbp
leaq block182(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block182:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef182
blkdef182:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant140(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block183:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef183
blkdef183:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block184:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef184
blkdef184:
pushq %rbp
movq %rsp,%rbp
leaq block185(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block185:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef185
blkdef185:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant142(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block186:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef186
blkdef186:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block187:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef187
blkdef187:
pushq %rbp
movq %rsp,%rbp
leaq block188(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block188:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef188
blkdef188:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant144(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block189:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef189
blkdef189:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block190:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef190
blkdef190:
pushq %rbp
movq %rsp,%rbp
leaq block191(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block191:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef191
blkdef191:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant146(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block192:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef192
blkdef192:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block193:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef193
blkdef193:
pushq %rbp
movq %rsp,%rbp
leaq block194(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block194:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef194
blkdef194:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant148(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block195:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef195
blkdef195:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block196:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef196
blkdef196:
pushq %rbp
movq %rsp,%rbp
leaq block197(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block197:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef197
blkdef197:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant150(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block198:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef198
blkdef198:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block199:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef199
blkdef199:
pushq %rbp
movq %rsp,%rbp
leaq block200(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block200:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef200
blkdef200:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant152(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block201:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef201
blkdef201:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block202:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef202
blkdef202:
pushq %rbp
movq %rsp,%rbp
leaq block203(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block203:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef203
blkdef203:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant154(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block204:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef204
blkdef204:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block205:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef205
blkdef205:
pushq %rbp
movq %rsp,%rbp
leaq block206(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block206:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef206
blkdef206:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant156(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block207:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef207
blkdef207:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block208:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef208
blkdef208:
pushq %rbp
movq %rsp,%rbp
leaq block209(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block209:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef209
blkdef209:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant158(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block210:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef210
blkdef210:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block211:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef211
blkdef211:
pushq %rbp
movq %rsp,%rbp
leaq block212(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block212:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef212
blkdef212:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant160(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block213:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef213
blkdef213:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block214:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef214
blkdef214:
pushq %rbp
movq %rsp,%rbp
leaq block215(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block215:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef215
blkdef215:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant162(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block216:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef216
blkdef216:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block217:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef217
blkdef217:
pushq %rbp
movq %rsp,%rbp
leaq block218(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block218:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef218
blkdef218:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant164(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block219:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef219
blkdef219:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block220:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef220
blkdef220:
pushq %rbp
movq %rsp,%rbp
leaq block221(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block221:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef221
blkdef221:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant166(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block222:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef222
blkdef222:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block223:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef223
blkdef223:
pushq %rbp
movq %rsp,%rbp
leaq block224(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block224:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef224
blkdef224:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant168(%rip), %rdi
call stax_push_element
xorq %rax, %rax
popq %rbp
ret
block225:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef225
blkdef225:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block226:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef226
blkdef226:
pushq %rbp
movq %rsp,%rbp
leaq constant33(%rip), %rdi
call stax_push_element
leaq constant46(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq constant50(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
leaq block227(%rip), %rdi
call stax_push_element
call stax_foreach
xorq %rax, %rax
popq %rbp
ret
block227:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef227
blkdef227:
pushq %rbp
movq %rsp,%rbp
call stax_explode
leaq constant34(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
leaq constant46(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
leaq block228(%rip), %rdi
call stax_push_element
call stax_next
call stax_copy
leaq constant73(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block229(%rip), %rdi
call stax_push_element
leaq block231(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant79(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block232(%rip), %rdi
call stax_push_element
leaq block234(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_copy
leaq constant78(%rip), %rdi
call stax_push_element
call stax_startswith
leaq block235(%rip), %rdi
call stax_push_element
leaq block237(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_discard
call stax_inverse
leaq constant46(%rip), %rdi
call stax_push_element
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
call stax_inverse
call stax_discard
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block228:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef228
blkdef228:
pushq %rbp
movq %rsp,%rbp
leaq constant170(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
call stax_println
call stax_listify_all
call stax_discard
call stax_println
xorq %rax, %rax
popq %rbp
ret
block229:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef229
blkdef229:
pushq %rbp
movq %rsp,%rbp
leaq block230(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block230:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef230
blkdef230:
pushq %rbp
movq %rsp,%rbp
leaq constant73(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant36(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
xorq %rax, %rax
popq %rbp
ret
block231:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef231
blkdef231:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block232:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef232
blkdef232:
pushq %rbp
movq %rsp,%rbp
leaq block233(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block233:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef233
blkdef233:
pushq %rbp
movq %rsp,%rbp
leaq constant79(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant40(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
xorq %rax, %rax
popq %rbp
ret
block234:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef234
blkdef234:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block235:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef235
blkdef235:
pushq %rbp
movq %rsp,%rbp
leaq block236(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block236:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef236
blkdef236:
pushq %rbp
movq %rsp,%rbp
leaq constant78(%rip), %rdi
call stax_push_element
leaq constant0(%rip), %rdi
call stax_push_element
call stax_replacefront
leaq constant43(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
xorq %rax, %rax
popq %rbp
ret
block237:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef237
blkdef237:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block238:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef238
blkdef238:
pushq %rbp
movq %rsp,%rbp
call stax_regread_x
call stax_swap
call stax_regread_x
leaq constant0(%rip), %rdi
call stax_push_element
call stax_regwrite_x
call stax_discard
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
leaq block239(%rip), %rdi
call stax_push_element
call stax_foreach
call stax_discard
call stax_regread_x
call stax_swap
call stax_regwrite_x
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block239:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef239
blkdef239:
pushq %rbp
movq %rsp,%rbp
call stax_next
call stax_swap
call stax_both_copy
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block240(%rip), %rdi
call stax_push_element
leaq block241(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block240:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef240
blkdef240:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_regwrite_x
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block241:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef241
blkdef241:
pushq %rbp
movq %rsp,%rbp
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block242:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef242
blkdef242:
pushq %rbp
movq %rsp,%rbp
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
call stax_regread_x
leaq constant47(%rip), %rdi
call stax_push_element
call stax_at
call stax_swap
call stax_regread_x
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_swap
call stax_copy
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_input_push
call stax_regread_x
call stax_input_push
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_regwrite_x
call stax_discard
call stax_input_pop
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_input_pop
call stax_swap
leaq block243(%rip), %rdi
call stax_push_element
call stax_foreach
call stax_discard
call stax_regread_x
call stax_swap
call stax_alter
leaq constant172(%rip), %rdi
call stax_push_element
call stax_listify
call stax_regwrite_x
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block243:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef243
blkdef243:
pushq %rbp
movq %rsp,%rbp
call stax_next
call stax_swap
call stax_both_copy
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block244(%rip), %rdi
call stax_push_element
leaq block245(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block244:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef244
blkdef244:
pushq %rbp
movq %rsp,%rbp
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block245:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef245
blkdef245:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_regread_x
call stax_add
call stax_regwrite_x
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block246:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef246
blkdef246:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant173(%rip), %rdi
call stax_push_element
call stax_countinstances
leaq block247(%rip), %rdi
call stax_push_element
leaq block248(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block247:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef247
blkdef247:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_push
leaq constant2(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block248:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef248
blkdef248:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant174(%rip), %rdi
call stax_push_element
call stax_equals
leaq block249(%rip), %rdi
call stax_push_element
leaq block250(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block249:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef249
blkdef249:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant37(%rip), %rdi
call stax_push_element
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_push
leaq constant47(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block250:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef250
blkdef250:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant77(%rip), %rdi
call stax_push_element
call stax_equals
leaq block251(%rip), %rdi
call stax_push_element
leaq block252(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block251:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef251
blkdef251:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant37(%rip), %rdi
call stax_push_element
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_push
leaq constant172(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block252:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef252
blkdef252:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant175(%rip), %rdi
call stax_push_element
call stax_equals
leaq block253(%rip), %rdi
call stax_push_element
leaq block254(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block253:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef253
blkdef253:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant176(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block254:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef254
blkdef254:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant37(%rip), %rdi
call stax_push_element
call stax_equals
leaq block255(%rip), %rdi
call stax_push_element
leaq block256(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block255:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef255
blkdef255:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_push
leaq constant177(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block256:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef256
blkdef256:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant1(%rip), %rdi
call stax_push_element
call stax_equals
leaq block257(%rip), %rdi
call stax_push_element
leaq block258(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block257:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef257
blkdef257:
pushq %rbp
movq %rsp,%rbp
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block258:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef258
blkdef258:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant178(%rip), %rdi
call stax_push_element
call stax_greater
call stax_next
leaq constant61(%rip), %rdi
call stax_push_element
call stax_less
call stax_bitand
leaq block259(%rip), %rdi
call stax_push_element
leaq block260(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block259:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef259
blkdef259:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_push
leaq constant179(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block260:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef260
blkdef260:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
xorq %rax, %rax
popq %rbp
ret
block261:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef261
blkdef261:
pushq %rbp
movq %rsp,%rbp
leaq block262(%rip), %rdi
call stax_push_element
call stax_next
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block263(%rip), %rdi
call stax_push_element
leaq block265(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant2(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block266(%rip), %rdi
call stax_push_element
leaq block268(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant47(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block269(%rip), %rdi
call stax_push_element
leaq block271(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant172(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block272(%rip), %rdi
call stax_push_element
leaq block274(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant179(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block275(%rip), %rdi
call stax_push_element
leaq block283(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant176(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block284(%rip), %rdi
call stax_push_element
leaq block288(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant177(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_at
call stax_equals
leaq block289(%rip), %rdi
call stax_push_element
leaq block293(%rip), %rdi
call stax_push_element
call stax_ifelse
call stax_discard
call stax_inverse
call stax_discard
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block262:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef262
blkdef262:
pushq %rbp
movq %rsp,%rbp
leaq constant180(%rip), %rdi
call stax_push_element
call stax_swap
call stax_add
call stax_println
call stax_listify_all
call stax_discard
call stax_println
xorq %rax, %rax
popq %rbp
ret
block263:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef263
blkdef263:
pushq %rbp
movq %rsp,%rbp
leaq block264(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block264:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef264
blkdef264:
pushq %rbp
movq %rsp,%rbp
call stax_regread_y
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block265:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef265
blkdef265:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block266:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef266
blkdef266:
pushq %rbp
movq %rsp,%rbp
leaq block267(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block267:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef267
blkdef267:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block268:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef268
blkdef268:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block269:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef269
blkdef269:
pushq %rbp
movq %rsp,%rbp
leaq block270(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block270:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef270
blkdef270:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block271:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef271
blkdef271:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block272:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef272
blkdef272:
pushq %rbp
movq %rsp,%rbp
leaq block273(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block273:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef273
blkdef273:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
leaq constant47(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block274:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef274
blkdef274:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block275:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef275
blkdef275:
pushq %rbp
movq %rsp,%rbp
leaq block276(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block276:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef276
blkdef276:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant75(%rip), %rdi
call stax_push_element
call stax_equals
leaq block277(%rip), %rdi
call stax_push_element
leaq block278(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block277:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef277
blkdef277:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
xorq %rax, %rax
popq %rbp
ret
block278:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef278
blkdef278:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant60(%rip), %rdi
call stax_push_element
call stax_greater
call stax_next
leaq constant61(%rip), %rdi
call stax_push_element
call stax_less
call stax_bitand
leaq block279(%rip), %rdi
call stax_push_element
leaq block280(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block279:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef279
blkdef279:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
xorq %rax, %rax
popq %rbp
ret
block280:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef280
blkdef280:
pushq %rbp
movq %rsp,%rbp
call stax_input_pop
call stax_copy
leaq constant59(%rip), %rdi
call stax_push_element
call stax_equals
leaq block281(%rip), %rdi
call stax_push_element
leaq block282(%rip), %rdi
call stax_push_element
call stax_ifelse
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
call stax_regread_y
leaq constant2(%rip), %rdi
call stax_push_element
call stax_at
call stax_inverse
xorq %rax, %rax
popq %rbp
ret
block281:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef281
blkdef281:
pushq %rbp
movq %rsp,%rbp
call stax_discard
leaq constant181(%rip), %rdi
call stax_push_element
leaq constant182(%rip), %rdi
call stax_push_element
leaq constant47(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
xorq %rax, %rax
popq %rbp
ret
block282:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef282
blkdef282:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
xorq %rax, %rax
popq %rbp
ret
block283:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef283
blkdef283:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block284:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef284
blkdef284:
pushq %rbp
movq %rsp,%rbp
leaq block285(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block285:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef285
blkdef285:
pushq %rbp
movq %rsp,%rbp
leaq constant1(%rip), %rdi
call stax_push_element
call stax_equals
leaq block286(%rip), %rdi
call stax_push_element
leaq block287(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block286:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef286
blkdef286:
pushq %rbp
movq %rsp,%rbp
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block287:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef287
blkdef287:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block288:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef288
blkdef288:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
block289:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef289
blkdef289:
pushq %rbp
movq %rsp,%rbp
leaq block290(%rip), %rdi
call stax_push_element
call stax_next
xorq %rax, %rax
popq %rbp
ret
block290:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef290
blkdef290:
pushq %rbp
movq %rsp,%rbp
call stax_copy
leaq constant37(%rip), %rdi
call stax_push_element
call stax_equals
leaq block291(%rip), %rdi
call stax_push_element
leaq block292(%rip), %rdi
call stax_push_element
call stax_ifelse
xorq %rax, %rax
popq %rbp
ret
block291:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef291
blkdef291:
pushq %rbp
movq %rsp,%rbp
call stax_discard
call stax_input_pop
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
leaq constant4(%rip), %rdi
call stax_push_element
call stax_regread_y
leaq constant4(%rip), %rdi
call stax_push_element
call stax_alter
call stax_ampersand
call stax_regwrite_y
call stax_discard
xorq %rax, %rax
popq %rbp
ret
block292:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef292
blkdef292:
pushq %rbp
movq %rsp,%rbp
leaq constant2(%rip), %rdi
call stax_push_element
call stax_listify
call stax_input_pop
call stax_swap
call stax_add
call stax_input_push
xorq %rax, %rax
popq %rbp
ret
block293:
.byte 255,255,255,255,5,0,0,0,1,0,0,0,1,0,0,0
.quad blkdef293
blkdef293:
pushq %rbp
movq %rsp,%rbp
xorq %rax, %rax
popq %rbp
ret
constant181:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 49
constant179:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 4
constant177:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 6
constant175:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 9
constant173:
.byte 255,255,255,255,6,0,0,0
.long 3
.long 3
.long 58
.long 124
.long 86
constant171:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 8
constant169:
.byte 255,255,255,255,6,0,0,0
.long 10
.long 10
.long 99
.long 111
.long 109
.long 112
.long 105
.long 108
.long 101
.long 45
.long 100
.long 115
constant167:
.byte 255,255,255,255,6,0,0,0
.long 2
.long 2
.long 123
.long 115
constant165:
.byte 255,255,255,255,6,0,0,0
.long 2
.long 2
.long 124
.long 38
constant163:
.byte 255,255,255,255,6,0,0,0
.long 2
.long 2
.long 124
.long 86
constant161:
.byte 255,255,255,255,6,0,0,0
.long 2
.long 2
.long 58
.long 91
constant159:
.byte 255,255,255,255,6,0,0,0
.long 2
.long 2
.long 124
.long 101
constant157:
.byte 255,255,255,255,6,0,0,0
.long 2
.long 2
.long 124
.long 68
constant155:
.byte 255,255,255,255,6,0,0,0
.long 2
.long 2
.long 124
.long 100
constant153:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 44
constant151:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 59
constant149:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 126
constant147:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 35
constant145:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 36
constant143:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 38
constant141:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 64
constant139:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 37
constant137:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 91
constant135:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 63
constant133:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 62
constant131:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 60
constant129:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 61
constant127:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 42
constant125:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 45
constant123:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 43
constant121:
.byte 255,255,255,255,6,0,0,0
.long 15
.long 15
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 116
.long 117
.long 99
.long 107
.long 48
constant119:
.byte 255,255,255,255,6,0,0,0
.long 20
.long 20
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 114
.long 101
.long 103
.long 119
.long 114
.long 105
.long 116
.long 101
.long 95
.long 121
constant117:
.byte 255,255,255,255,6,0,0,0
.long 20
.long 20
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 114
.long 101
.long 103
.long 119
.long 114
.long 105
.long 116
.long 101
.long 95
.long 120
constant115:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 112
.long 114
.long 105
.long 110
.long 116
.long 108
.long 110
constant113:
.byte 255,255,255,255,6,0,0,0
.long 10
.long 10
.long 67
.long 65
.long 76
.long 76
.long 32
.long 116
.long 117
.long 99
.long 107
.long 49
constant111:
.byte 255,255,255,255,6,0,0,0
.long 21
.long 21
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 108
.long 105
.long 115
.long 116
.long 105
.long 102
.long 121
.long 95
.long 97
.long 108
.long 108
constant109:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 105
.long 110
.long 100
.long 101
.long 120
.long 111
.long 102
constant107:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 102
.long 111
.long 114
.long 101
.long 97
.long 99
.long 104
constant105:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 101
.long 120
.long 112
.long 108
.long 111
.long 100
.long 101
constant103:
.byte 255,255,255,255,6,0,0,0
.long 19
.long 19
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 114
.long 101
.long 103
.long 114
.long 101
.long 97
.long 100
.long 95
.long 121
constant101:
.byte 255,255,255,255,6,0,0,0
.long 19
.long 19
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 114
.long 101
.long 103
.long 114
.long 101
.long 97
.long 100
.long 95
.long 120
constant99:
.byte 255,255,255,255,6,0,0,0
.long 14
.long 14
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 115
.long 119
.long 97
.long 112
constant97:
.byte 255,255,255,255,6,0,0,0
.long 15
.long 15
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 112
.long 114
.long 105
.long 110
.long 116
constant95:
.byte 255,255,255,255,6,0,0,0
.long 14
.long 14
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 110
.long 101
.long 120
.long 116
constant93:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 108
.long 105
.long 115
.long 116
.long 105
.long 102
.long 121
constant91:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 100
.long 105
.long 115
.long 99
.long 97
.long 114
.long 100
constant89:
.byte 255,255,255,255,6,0,0,0
.long 14
.long 14
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 99
.long 111
.long 112
.long 121
constant87:
.byte 255,255,255,255,6,0,0,0
.long 19
.long 19
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 98
.long 111
.long 116
.long 104
.long 95
.long 99
.long 111
.long 112
.long 121
constant85:
.byte 255,255,255,255,6,0,0,0
.long 15
.long 15
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 97
.long 108
.long 116
.long 101
.long 114
constant83:
.byte 255,255,255,255,6,0,0,0
.long 10
.long 10
.long 80
.long 85
.long 83
.long 72
.long 32
.long 98
.long 108
.long 111
.long 99
.long 107
constant81:
.byte 255,255,255,255,6,0,0,0
.long 25
.long 25
.long 40
.long 98
.long 108
.long 111
.long 99
.long 107
.long 41
.long 58
.long 32
.long 85
.long 110
.long 107
.long 110
.long 111
.long 119
.long 110
.long 32
.long 99
.long 111
.long 109
.long 109
.long 97
.long 110
.long 100
.long 32
constant79:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 105
constant77:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 46
constant75:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 33
constant73:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 115
constant71:
.byte 255,255,255,255,6,0,0,0
.long 23
.long 23
.long 84
.long 79
.long 68
.long 79
.long 32
.long 71
.long 79
.long 83
.long 85
.long 66
.long 32
.long 98
.long 108
.long 111
.long 99
.long 107
.long 32
.long 109
.long 97
.long 114
.long 107
.long 101
.long 114
constant69:
.byte 255,255,255,255,6,0,0,0
.long 7
.long 7
.long 102
.long 103
.long 107
.long 70
.long 119
.long 87
.long 125
constant67:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 71
constant65:
.byte 255,255,255,255,6,0,0,0
.long 11
.long 11
.long 112
.long 117
.long 115
.long 104
.long 45
.long 115
.long 116
.long 114
.long 105
.long 110
.long 103
constant63:
.byte 255,255,255,255,6,0,0,0
.long 19
.long 19
.long 112
.long 117
.long 115
.long 104
.long 45
.long 116
.long 111
.long 107
.long 101
.long 110
.long 45
.long 116
.long 111
.long 45
.long 98
.long 108
.long 111
.long 99
.long 107
constant61:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 58
constant59:
.byte 255,255,255,255,6,0,0,0
.long 2
.long 2
.long 49
.long 48
constant57:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 122
constant55:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 102
.long 105
.long 114
.long 115
.long 116
.long 45
.long 105
.long 110
.long 115
.long 116
.long 114
.long 117
.long 99
.long 116
.long 105
.long 111
.long 110
constant53:
.byte 255,255,255,255,6,0,0,0
.long 13
.long 13
.long 98
.long 108
.long 111
.long 99
.long 107
.long 45
.long 99
.long 111
.long 117
.long 110
.long 116
.long 101
.long 114
constant51:
.byte 255,255,255,255,6,0,0,0
.long 11
.long 11
.long 98
.long 108
.long 111
.long 99
.long 107
.long 45
.long 115
.long 116
.long 97
.long 99
.long 107
constant49:
.byte 255,255,255,255,6,0,0,0
.long 6
.long 6
.long 98
.long 108
.long 111
.long 99
.long 107
.long 115
constant47:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 2
constant45:
.byte 255,255,255,255,6,0,0,0
.long 8
.long 8
.long 46
.long 100
.long 111
.long 117
.long 98
.long 108
.long 101
.long 32
constant43:
.byte 255,255,255,255,6,0,0,0
.long 5
.long 5
.long 82
.long 69
.long 65
.long 76
.long 32
constant41:
.byte 255,255,255,255,6,0,0,0
.long 45
.long 45
.long 46
.long 98
.long 121
.long 116
.long 101
.long 32
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 49
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
.long 44
.long 49
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
.long 44
.long 49
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
constant39:
.byte 255,255,255,255,6,0,0,0
.long 6
.long 6
.long 46
.long 108
.long 111
.long 110
.long 103
.long 32
constant37:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 34
constant35:
.byte 255,255,255,255,6,0,0,0
.long 8
.long 8
.long 99
.long 111
.long 110
.long 115
.long 116
.long 97
.long 110
.long 116
constant33:
.byte 255,255,255,255,6,0,0,0
.long 4
.long 4
.long 68
.long 65
.long 84
.long 65
constant31:
.byte 255,255,255,255,6,0,0,0
.long 3
.long 3
.long 69
.long 78
.long 68
constant29:
.byte 255,255,255,255,6,0,0,0
.long 5
.long 5
.long 67
.long 65
.long 76
.long 76
.long 32
constant27:
.byte 255,255,255,255,6,0,0,0
.long 12
.long 12
.long 40
.long 37
.long 114
.long 105
.long 112
.long 41
.long 44
.long 32
.long 37
.long 114
.long 100
.long 105
constant25:
.byte 255,255,255,255,6,0,0,0
.long 5
.long 5
.long 80
.long 85
.long 83
.long 72
.long 32
constant23:
.byte 255,255,255,255,6,0,0,0
.long 12
.long 12
.long 46
.long 113
.long 117
.long 97
.long 100
.long 32
.long 98
.long 108
.long 107
.long 100
.long 101
.long 102
constant21:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 58
constant19:
.byte 255,255,255,255,6,0,0,0
.long 6
.long 6
.long 66
.long 69
.long 71
.long 73
.long 78
.long 32
constant17:
.byte 255,255,255,255,6,0,0,0
.long 9
.long 9
.long 112
.long 111
.long 112
.long 113
.long 32
.long 37
.long 114
.long 98
.long 112
constant15:
.byte 255,255,255,255,6,0,0,0
.long 12
.long 12
.long 99
.long 97
.long 108
.long 108
.long 32
.long 98
.long 108
.long 107
.long 100
.long 101
.long 102
.long 48
constant13:
.byte 255,255,255,255,6,0,0,0
.long 14
.long 14
.long 109
.long 111
.long 118
.long 113
.long 32
.long 37
.long 114
.long 115
.long 112
.long 44
.long 37
.long 114
.long 98
.long 112
constant11:
.byte 255,255,255,255,6,0,0,0
.long 5
.long 5
.long 109
.long 97
.long 105
.long 110
.long 58
constant9:
.byte 255,255,255,255,6,0,0,0
.long 11
.long 11
.long 46
.long 103
.long 108
.long 111
.long 98
.long 108
.long 32
.long 109
.long 97
.long 105
.long 110
constant7:
.byte 255,255,255,255,6,0,0,0
.long 30
.long 30
.long 40
.long 112
.long 45
.long 99
.long 111
.long 100
.long 101
.long 41
.long 58
.long 32
.long 85
.long 110
.long 107
.long 110
.long 111
.long 119
.long 110
.long 32
.long 105
.long 110
.long 115
.long 116
.long 114
.long 117
.long 99
.long 116
.long 105
.long 111
.long 110
.long 32
constant5:
.byte 255,255,255,255,6,0,0,0
.long 6
.long 6
.long 112
.long 45
.long 99
.long 111
.long 100
.long 101
constant3:
.byte 255,255,255,255,6,0,0,0
.long 47
.long 47
.long 85
.long 115
.long 97
.long 103
.long 101
.long 58
.long 32
.long 115
.long 116
.long 97
.long 120
.long 99
.long 49
.long 32
.long 97
.long 114
.long 99
.long 104
.long 105
.long 116
.long 101
.long 99
.long 116
.long 117
.long 114
.long 101
.long 32
.long 60
.long 32
.long 102
.long 105
.long 108
.long 101
.long 46
.long 115
.long 116
.long 97
.long 120
.long 32
.long 62
.long 32
.long 102
.long 105
.long 108
.long 101
.long 46
.long 115
constant1:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 10
constant0:
.byte 255,255,255,255,6,0,0,0
.long 0
.long 0
constant2:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 1
constant4:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 0
constant6:
.byte 255,255,255,255,6,0,0,0
.long 16
.long 16
.long 120
.long 56
.long 54
.long 95
.long 54
.long 52
.long 45
.long 108
.long 105
.long 110
.long 117
.long 120
.long 45
.long 103
.long 110
.long 117
constant8:
.byte 255,255,255,255,6,0,0,0
.long 7
.long 7
.long 80
.long 82
.long 79
.long 71
.long 82
.long 65
.long 77
constant10:
.byte 255,255,255,255,6,0,0,0
.long 5
.long 5
.long 46
.long 116
.long 101
.long 120
.long 116
constant12:
.byte 255,255,255,255,6,0,0,0
.long 10
.long 10
.long 112
.long 117
.long 115
.long 104
.long 113
.long 32
.long 37
.long 114
.long 98
.long 112
constant14:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 99
.long 97
.long 108
.long 108
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 115
.long 116
.long 97
.long 114
.long 116
.long 117
.long 112
constant16:
.byte 255,255,255,255,6,0,0,0
.long 15
.long 15
.long 99
.long 97
.long 108
.long 108
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 102
.long 105
.long 110
.long 97
.long 108
constant18:
.byte 255,255,255,255,6,0,0,0
.long 3
.long 3
.long 114
.long 101
.long 116
constant20:
.byte 255,255,255,255,6,0,0,0
.long 5
.long 5
.long 98
.long 108
.long 111
.long 99
.long 107
constant22:
.byte 255,255,255,255,6,0,0,0
.long 45
.long 45
.long 46
.long 98
.long 121
.long 116
.long 101
.long 32
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 53
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
.long 44
.long 49
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
.long 44
.long 49
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
constant24:
.byte 255,255,255,255,6,0,0,0
.long 6
.long 6
.long 98
.long 108
.long 107
.long 100
.long 101
.long 102
constant26:
.byte 255,255,255,255,6,0,0,0
.long 5
.long 5
.long 108
.long 101
.long 97
.long 113
.long 32
constant28:
.byte 255,255,255,255,6,0,0,0
.long 22
.long 22
.long 99
.long 97
.long 108
.long 108
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 112
.long 117
.long 115
.long 104
.long 95
.long 101
.long 108
.long 101
.long 109
.long 101
.long 110
.long 116
constant30:
.byte 255,255,255,255,6,0,0,0
.long 5
.long 5
.long 99
.long 97
.long 108
.long 108
.long 32
constant32:
.byte 255,255,255,255,6,0,0,0
.long 15
.long 15
.long 120
.long 111
.long 114
.long 113
.long 32
.long 37
.long 114
.long 97
.long 120
.long 44
.long 32
.long 37
.long 114
.long 97
.long 120
constant34:
.byte 255,255,255,255,6,0,0,0
.long 9
.long 9
.long 67
.long 79
.long 78
.long 83
.long 84
.long 65
.long 78
.long 84
.long 32
constant36:
.byte 255,255,255,255,6,0,0,0
.long 7
.long 7
.long 83
.long 84
.long 82
.long 73
.long 78
.long 71
.long 32
constant38:
.byte 255,255,255,255,6,0,0,0
.long 29
.long 29
.long 46
.long 98
.long 121
.long 116
.long 101
.long 32
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 54
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
constant40:
.byte 255,255,255,255,6,0,0,0
.long 8
.long 8
.long 73
.long 78
.long 84
.long 69
.long 71
.long 69
.long 82
.long 32
constant42:
.byte 255,255,255,255,6,0,0,0
.long 6
.long 6
.long 46
.long 113
.long 117
.long 97
.long 100
.long 32
constant44:
.byte 255,255,255,255,6,0,0,0
.long 45
.long 45
.long 46
.long 98
.long 121
.long 116
.long 101
.long 32
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 50
.long 53
.long 53
.long 44
.long 51
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
.long 44
.long 49
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
.long 44
.long 49
.long 44
.long 48
.long 44
.long 48
.long 44
.long 48
constant46:
.byte 255,255,255,255,6,0,0,0
.long 8
.long 8
.long 97
.long 115
.long 115
.long 101
.long 109
.long 98
.long 108
.long 101
constant48:
.byte 255,255,255,255,6,0,0,0
.long 14
.long 14
.long 99
.long 111
.long 109
.long 112
.long 105
.long 108
.long 101
.long 45
.long 98
.long 108
.long 111
.long 99
.long 107
.long 115
constant50:
.byte 255,255,255,255,6,0,0,0
.long 9
.long 9
.long 99
.long 111
.long 110
.long 115
.long 116
.long 97
.long 110
.long 116
.long 115
constant52:
.byte 255,255,255,255,6,0,0,0
.long 8
.long 8
.long 98
.long 108
.long 111
.long 99
.long 107
.long 45
.long 105
.long 100
constant54:
.byte 255,255,255,255,6,0,0,0
.long 11
.long 11
.long 98
.long 108
.long 111
.long 99
.long 107
.long 45
.long 100
.long 101
.long 112
.long 116
.long 104
constant56:
.byte 255,255,255,255,6,0,0,0
.long 16
.long 16
.long 99
.long 111
.long 110
.long 115
.long 116
.long 97
.long 110
.long 116
.long 45
.long 99
.long 111
.long 117
.long 110
.long 116
.long 101
.long 114
constant58:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 65
constant60:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 47
constant62:
.byte 255,255,255,255,6,0,0,0
.long 11
.long 11
.long 112
.long 117
.long 115
.long 104
.long 45
.long 110
.long 117
.long 109
.long 98
.long 101
.long 114
constant64:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 34
constant66:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 123
constant68:
.byte 255,255,255,255,6,0,0,0
.long 18
.long 18
.long 84
.long 79
.long 68
.long 79
.long 32
.long 71
.long 79
.long 83
.long 85
.long 66
.long 32
.long 99
.long 111
.long 109
.long 109
.long 97
.long 110
.long 100
constant70:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 125
constant72:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 32
constant74:
.byte 255,255,255,255,6,0,0,0
.long 13
.long 13
.long 112
.long 117
.long 115
.long 104
.long 45
.long 99
.long 111
.long 110
.long 115
.long 116
.long 97
.long 110
.long 116
constant76:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 33
constant78:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 114
constant80:
.byte 255,255,255,255,6,0,0,0
.long 14
.long 14
.long 99
.long 111
.long 109
.long 112
.long 105
.long 108
.long 101
.long 45
.long 116
.long 111
.long 107
.long 101
.long 110
.long 115
constant82:
.byte 255,255,255,255,6,0,0,0
.long 13
.long 13
.long 80
.long 85
.long 83
.long 72
.long 32
.long 99
.long 111
.long 110
.long 115
.long 116
.long 97
.long 110
.long 116
constant84:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 97
constant86:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 98
constant88:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 99
constant90:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 100
constant92:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 108
constant94:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 110
constant96:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 112
constant98:
.byte 255,255,255,255,6,0,0,0
.long 23
.long 23
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 114
.long 101
.long 118
.long 101
.long 114
.long 115
.long 101
.long 95
.long 114
.long 97
.long 110
.long 103
.long 101
constant100:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 120
constant102:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 121
constant104:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 69
constant106:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 70
constant108:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 73
constant110:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 76
constant112:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 79
constant114:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 80
constant116:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 88
constant118:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 89
constant120:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 90
constant122:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 105
.long 110
.long 118
.long 101
.long 114
.long 115
.long 101
constant124:
.byte 255,255,255,255,6,0,0,0
.long 13
.long 13
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 97
.long 100
.long 100
constant126:
.byte 255,255,255,255,6,0,0,0
.long 18
.long 18
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 115
.long 117
.long 98
.long 116
.long 114
.long 97
.long 99
.long 116
constant128:
.byte 255,255,255,255,6,0,0,0
.long 15
.long 15
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 116
.long 105
.long 109
.long 101
.long 115
constant130:
.byte 255,255,255,255,6,0,0,0
.long 16
.long 16
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 101
.long 113
.long 117
.long 97
.long 108
.long 115
constant132:
.byte 255,255,255,255,6,0,0,0
.long 14
.long 14
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 108
.long 101
.long 115
.long 115
constant134:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 103
.long 114
.long 101
.long 97
.long 116
.long 101
.long 114
constant136:
.byte 255,255,255,255,6,0,0,0
.long 16
.long 16
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 105
.long 102
.long 101
.long 108
.long 115
.long 101
constant138:
.byte 255,255,255,255,6,0,0,0
.long 15
.long 15
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 117
.long 110
.long 100
.long 101
.long 114
constant140:
.byte 255,255,255,255,6,0,0,0
.long 17
.long 17
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 109
.long 111
.long 100
.long 117
.long 108
.long 117
.long 115
constant142:
.byte 255,255,255,255,6,0,0,0
.long 12
.long 12
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 97
.long 116
constant144:
.byte 255,255,255,255,6,0,0,0
.long 19
.long 19
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 97
.long 109
.long 112
.long 101
.long 114
.long 115
.long 97
.long 110
.long 100
constant146:
.byte 255,255,255,255,6,0,0,0
.long 19
.long 19
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 115
.long 116
.long 114
.long 105
.long 110
.long 103
.long 105
.long 102
.long 121
constant148:
.byte 255,255,255,255,6,0,0,0
.long 24
.long 24
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 99
.long 111
.long 117
.long 110
.long 116
.long 105
.long 110
.long 115
.long 116
.long 97
.long 110
.long 99
.long 101
.long 115
constant150:
.byte 255,255,255,255,6,0,0,0
.long 20
.long 20
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 105
.long 110
.long 112
.long 117
.long 116
.long 95
.long 112
.long 117
.long 115
.long 104
constant152:
.byte 255,255,255,255,6,0,0,0
.long 20
.long 20
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 105
.long 110
.long 112
.long 117
.long 116
.long 95
.long 112
.long 101
.long 101
.long 107
constant154:
.byte 255,255,255,255,6,0,0,0
.long 19
.long 19
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 105
.long 110
.long 112
.long 117
.long 116
.long 95
.long 112
.long 111
.long 112
constant156:
.byte 255,255,255,255,6,0,0,0
.long 20
.long 20
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 109
.long 97
.long 105
.long 110
.long 95
.long 100
.long 101
.long 112
.long 116
.long 104
constant158:
.byte 255,255,255,255,6,0,0,0
.long 21
.long 21
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 105
.long 110
.long 112
.long 117
.long 116
.long 95
.long 100
.long 101
.long 112
.long 116
.long 104
constant160:
.byte 255,255,255,255,6,0,0,0
.long 22
.long 22
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 114
.long 101
.long 112
.long 108
.long 97
.long 99
.long 101
.long 102
.long 114
.long 111
.long 110
.long 116
constant162:
.byte 255,255,255,255,6,0,0,0
.long 20
.long 20
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 115
.long 116
.long 97
.long 114
.long 116
.long 115
.long 119
.long 105
.long 116
.long 104
constant164:
.byte 255,255,255,255,6,0,0,0
.long 21
.long 21
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 99
.long 111
.long 109
.long 109
.long 97
.long 110
.long 100
.long 108
.long 105
.long 110
.long 101
constant166:
.byte 255,255,255,255,6,0,0,0
.long 16
.long 16
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 98
.long 105
.long 116
.long 97
.long 110
.long 100
constant168:
.byte 255,255,255,255,6,0,0,0
.long 26
.long 26
.long 67
.long 65
.long 76
.long 76
.long 32
.long 115
.long 116
.long 97
.long 120
.long 95
.long 99
.long 108
.long 101
.long 97
.long 114
.long 115
.long 116
.long 97
.long 114
.long 116
.long 117
.long 112
.long 102
.long 108
.long 97
.long 103
constant170:
.byte 255,255,255,255,6,0,0,0
.long 25
.long 25
.long 40
.long 99
.long 111
.long 110
.long 115
.long 116
.long 97
.long 110
.long 116
.long 41
.long 58
.long 32
.long 85
.long 110
.long 107
.long 110
.long 111
.long 119
.long 110
.long 32
.long 102
.long 111
.long 114
.long 109
.long 32
constant172:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 3
constant174:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 39
constant176:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 5
constant178:
.byte 255,255,255,255,1,0,0,0,1,0,0,0,1,0,0,0
.quad 48
constant180:
.byte 255,255,255,255,6,0,0,0
.long 23
.long 23
.long 108
.long 101
.long 120
.long 101
.long 114
.long 32
.long 115
.long 116
.long 97
.long 116
.long 101
.long 32
.long 104
.long 111
.long 115
.long 101
.long 100
.long 32
.long 110
.long 101
.long 97
.long 114
.long 32
constant182:
.byte 255,255,255,255,6,0,0,0
.long 1
.long 1
.long 48
