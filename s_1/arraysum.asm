	.data
h:	.word 10
A:	.space 60

	.text
	.globl main
main:
	la $s1 A
	la $s2 h
	
	lw $s2, 0($s2)
	
	li $t0 8
	sw $t0, 32($s1)
	lw $t0, 32($s1)
	
	add $t1 $s2 $t0
	
	sw $t1, 48($s1)