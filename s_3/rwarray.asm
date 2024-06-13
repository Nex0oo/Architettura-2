	.data
A:	.word 0 1 2 3 4 5 6 7 8 9 10 11 12
msg:	.asciiz "Inserire intero: "
err:	.asciiz "comando non riconosciuto"
	.align 2

	.text
	.globl main
main:	

	la $s0 A	#Array

	li $v0 4
	la $a0 msg
	syscall
	
	li $v0 5
	syscall
	
	add $s1 $v0 $zero	#a
	
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	add $s2 $v0 $zero	#b
	
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	add $s3 $v0 $zero	#c
	
	mul $t0 $s1 4
	add $t0 $s0 $t0
	lw $t1 0($t0)	#A[a]
	
	mul $t3 $s2 4
	add $t3 $s0 $t3
	lw $t2 0($t3)	#A[b]
	
	beq $s3 $zero L1
	beq $s3 1 L2
	beq $s3 -1 L3
	j Else
L1:
	sw $t2 0($t0)
	sw $t1 0($t3)
	j End
L2:
	sw $t1 0($t3)
	j End
L3:
	sw $t2 0($t0)
	j End
Else:
	la $a0 err
	li $v0 4
	syscall
End:
	li $v0 10
	syscall