	.data
msg1:	.asciiz "Inserire intero: "
msg2:	.asciiz "Il risultato è: "
	.align 2

	.text
	.globl main
main:	
	la $a0 msg1
	li $v0 51
	syscall
	
	move $s0 $a0
	
	mul $t0 $s0 2
	add $t0 $t0 1
	
	li $a0 0
	move $a1 $t0
	li $v0 42
	syscall
	
	sub $t0 $a0 $s0
	add $s3 $t0 $s0
	
	la $a0 msg2
	move $a1 $s3
	li $v0 56
	syscall
	
	li $v0 10
	syscall