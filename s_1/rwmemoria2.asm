	.data
A:	.word -1 -1 1 4
B:	.word -1 6 -1 -1
c:	.word 2

	.text
	.globl main
main:
	la $s0 A
	la $s1 B
	la $s2 c
	
	lw $s2 0($s2) #c
	
	#A[c]
	mul $t0 $s2 4
	add $t0 $t0 $s0
	lw $t1 0($t0)	#Preso valore contenuto in A[c]
	#B[A[c]]
	mul $t1 $t1 4
	add $t1 $t1 $s1
	lw $s3 0($t1)	# Preso valore contenuto in B[A[c]]
	#A[2*c-1]
	mul $t1 $s2 2
	add $t1 $t1 -1
	mul $t1 $t1 4
	add $t1 $t1 $s0
	lw $s4 0($t1)	# Preso valore contenuto in A[2*c-1]
	
	#Svolgo espressione
	#B[A[c]] + c
	add $s3 $s3 $s2
	#*c
	mul $s3 $s3 $s2
	#/A[2*c-1]
	div $s3 $s3 $s4
	
	#Salvo in A[c-1]
	add $t1 $s2 -1
	mul $t1 $t1 4
	add $t1 $t1 $s0
	sw $s3 0($t1)