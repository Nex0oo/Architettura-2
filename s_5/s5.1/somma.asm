#INPUT
# $a0 <- a
# $a1 <- b

	.text
	.globl somma
somma:
	add $v0 $a0 $a1
	jr $ra