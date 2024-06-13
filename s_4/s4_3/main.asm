	.data
s1:	.asciiz "Tre uguali"
s2:	.asciiz "Tre diversi"
s3:	.asciiz "No salto"
.align 2
	
	.text
	.globl main
main:
	li $a0 3
	li $a1 2
	li $a2 3
	la $a3 A1
	
	la $t0 A2
	add $sp $sp -4
	sw $t0 0($sp)	#Push dello stack
	
	jal branch3equal
	j A3
	
A1:
	la $a0 s1
	li $v0 4
	syscall
	j End
A2:
	la $a0 s2
	li $v0 4
	syscall
	j End
A3:
	la $a0 s3
	li $v0 4
	syscall
End:
	li $v0 10
	syscall