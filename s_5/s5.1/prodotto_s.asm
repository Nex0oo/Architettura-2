#INPUT
# $a0 <- a
# $a1 <- b

	.text
	.globl prodotto_s
prodotto_s:
	
	#PREAMBOLO
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	add $sp $fp -8
	
	#CORPO
	move $t4 $a1	#$a1
	move $a1 $a0

	li $t0 1
Loop:
	slt $t1 $t0 $t4
	beq $t1 $zero End
	jal somma
	move $a1 $v0
	add $t0 $t0 1
	j Loop

End:
	#EPILOGO
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	move $fp $t0
	jr $ra