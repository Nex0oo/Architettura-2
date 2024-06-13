	.data
ris:	.asciiz "Risultato fibonacci: "
.align 2

	.text
	.globl main
main:	
	li $a0 4
	
	jal fibonacci
	move $s0 $v0
	
	la $a0 ris
	li $v0 4
	syscall
	
	move $a0 $s0
	li $v0 1
	syscall
	
	li $v0 10
	syscall
	


###################################
fibonacci:
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $ra -4($fp)
	sw $sp -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	add $sp $fp -16
	
	beq $a0 1 caso_base_1
	beq $a0 $zero caso_base_2
	
	add $sp $sp -4
	sw $a0 0($sp)
	
	
	add $a0 $a0 -1
	jal fibonacci
	
	move $s0 $v0
	
	lw $a0 0($sp)
	add $sp $sp 4
	
	add $a0 $a0 -2
	jal fibonacci
	move $s1 $v0
	
	add $v0 $s0 $s1
	j fine_fibonacci

caso_base_1:
	li $v0 1
	j fine_fibonacci
caso_base_2:
	li $v0 0
	
fine_fibonacci:	
	lw $t0 0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	jr $ra