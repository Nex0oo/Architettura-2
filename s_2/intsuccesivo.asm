	.data
msg1:	.asciiz "Inserisci un intero: "
msg2:	.asciiz "L'intero successivo è: "
	.align 2
	
	.text
	.globl main
main:
	la $a0 msg1
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	add $s0 $v0 1
	
	la $a0 msg2
	li $v0 4
	syscall
	
	li $v0 1
	move $a0 $s0
	syscall
	
	li $v0 10
	syscall