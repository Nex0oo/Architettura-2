	.data
msg:	.asciiz "Il risultato è: "
	.align 2
	
	.text
	.globl main
main:	
	li $s0 3
	li $t0 2
	
	mult $s0 $t0
	mflo $t0
	
	#Push di 2*3
	addi $sp $sp -4
	sw $t0 0($sp)
	
	mult $s0 $s0
	mflo $t0
	
	add $s0 $t0 $s0
	
	lw $t0 0($sp)
	add $sp $sp 4
	
	add $s0 $t0 $s0
	
	la $a0 msg
	li $v0 4
	syscall
	
	move $a0 $s0
	li $v0 1
	syscall
	
	li $v0 10
	syscall