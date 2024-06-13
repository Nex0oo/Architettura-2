	.data
msg1:	.asciiz "Inserire intero: "
msg2:	.asciiz "I due numeri sono: "
s:	.asciiz " "
	.align 2
A:	.space 8
	
	.text
	.globl main
main:
	la $s0 A
	
	la $a0 msg1
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	move $s1 $v0
	add $s2 $s1 1
	
	sw $s1 0($s0)
	sw $s2 4($s0)
	
	lw $s1 0($s0)
	lw $s2 4($s0)
	
	la $a0 msg2
	li $v0 4
	syscall
	
	move $a0 $s1
	li $v0 1
	syscall
	
	la $a0 s
	li $v0 4
	syscall
	
	move $a0 $s2
	li $v0 1
	syscall
	
	li $v0 10
	syscall
	
	
	