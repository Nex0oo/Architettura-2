	.data
del:	.asciiz "Che elemento i-esimo vuoi eliminare? "
.align 2
A:	.space 512

	.text
	.globl main
main:
	la $s0 A
	li $s1 0	#head
	
	
	li $a2 3
	move $a0 $s0
	move $a1 $s1
	jal insert
	
	move $s1 $v0	#Nuova head
	
	move $a0 $s0
	move $a1 $s1
	li $a2 5
	jal insert
	
	move $s1 $v0 	#Nuova head
	
	move $a0 $s0
	move $a1 $s1
	li $a2 9
	jal insert
	
	move $s1 $v0 	#Nuova head
	
	
	la $a0 del
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	move $a0 $s0	#Indirizzo Array
	move $a1 $v0	#Passo l'elemento che si vuole eliminare
	move $a2 $s1	#head
	jal delete
	
	move $s1 $v0	#Salvo nuova head dopo delete
	
	move $a0 $s0
	move $a1 $s1
	li $a2 237
	jal insert
	
	move $s1 $v0 	#Nuova head
	
	
	li $v0 10
	syscall
	

		
	