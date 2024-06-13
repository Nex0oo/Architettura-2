	.data
A: 	.word 34,227,224,226,14,17,112,16 # matrice A
N:	.word 8

	.text
	.globl main
main:
	la $a1 A
	la $s0 N
	lw $a0 0($s0)
	
	#jal max
	jal min
	move $a0 $v0
	
	li $v0 1
	syscall
	
	li $v0 10
	syscall