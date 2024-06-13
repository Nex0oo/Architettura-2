	.data
risS:	.asciiz "Risultato somma: "
risM:	.asciiz "Risultato moltiplicazione: "
.align 2
	
	.text
	.globl main
main:
	li $s0 3
	li $s1 4
	
	move $a0 $s0
	move $a1 $s1
	
	jal somma
	move $s3 $v0
	
	jal prodotto_s
	move $s4 $v0
	
	la $a0 risS
	li $v0 4
	syscall
	
	move $a0 $s3
	li $v0 1
	syscall
	
	la $a0 risM
	li $v0 4
	syscall
	
	move $a0 $s4
	li $v0 1
	syscall
	
	li $v0 10
	syscall