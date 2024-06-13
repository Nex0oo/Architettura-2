	.data
A:	.space 400
B:	.space 400
C:	.word 2
i:	.word 3

	.text
	.globl main
main:
	# Carichiamo gli indirizzi
	la $s0 A
	la $s1 B
	la $s2 C
	la $s3 i
	
	# Inizializziamo B[i] <- 10
	li $t0 10
	lw $s3 0($s3)
	mul $t1 $s3 4
	add $t2 $s1 $t1
	sw $t0 0($t2)
	
	# Risoluzione espressione
	lw $t0 0($t2)
	add $s3 $t0 5
	lw $s2 0($s2)
	add $s3 $s3 $s2
	
	# Salviamo in A[99]
	li $s4 99
	mul $t1 $s4 4
	add $s4 $s0 $t1
	sw $s3 0($s4)