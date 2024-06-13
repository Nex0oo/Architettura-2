	.data
msg1:	.asciiz "Inserire intero: "
br:	.asciiz "break "
	.align 2

	.text
	.globl main
main:	
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	
	move $s0 $v0	#V
	
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	move $s1 $v0	#N
	
	add $s2 $s0 $zero	#Sum
	
	#Ciclo
	li $t0 1
Loop:	
	bge $t0 $s1 End
	mul $t2 $t0 $t0
	div $t2 $s0
	mfhi $t3
	beq $t3 $zero If
	add $s2 $s2 $t2	
	add $t0 $t0 1
	j Loop

If:
	li $v0 4
	la $a0 br
	syscall
End:
	move $a0 $s2
	li $v0 1
	syscall
	
	li $v0 10
	syscall