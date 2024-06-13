	.data
msg1: 	.asciiz "Inserire numero intero: "
msg2:	.asciiz "Risultato: "
s:	.asciiz " "
.align 2

	.text
	.globl main
main:
	la $a0 msg1
	li $v0 51
	syscall
	
	move $s0 $a0
	
	li $t2 2
	div $s0 $t2
	mfhi $t0
	bne $t0 0 dispari
	add $s0 $s0 2
	j end	
	
dispari:
	add $s0 $s0 1
	
end:	
	la $a0 msg2
	move $a1 $s0
	li $v0 56
	syscall
	
	li $v0 10
	syscall