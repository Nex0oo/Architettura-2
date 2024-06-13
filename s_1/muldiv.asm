	.text
	.globl main
	
main:
	li $t0 100
	li $t1 45
	
	#Istruzioni dell'ISA
	mult $t0 $t1
	mflo $s0
	
	div $t0 $t1
	mflo $s1
	mfhi $s2
	
	
	#Pseudoistruzioni
	mul $s3 $t0 $t1
	
	div $s4 $t0 $t1