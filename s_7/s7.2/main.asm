	.text
	.globl main
main:

	li $v0 9
	li $a0 20
	syscall
	
	move $s0 $v0
	
	li $t0 2
	sw $t0 0($s0)
	li $t0 5
	sw $t0 4($s0)
	
	
	move $a0 $s0
	li $a1 237
	jal push
	
	move $a0 $v0
	li $a1 9
	jal push
	
	move $a0 $v0
	li $a1 37
	jal push
	
	move $a0 $v0
	li $a1 9128
	jal push
	
	move $s0 $v0
	
	
	move $a0 $s0
	jal print
	
	li $v0 10
	syscall
			