	.data
ris:	.asciiz "Risultato: "
.align 2

	.text
	.globl main
main:
	li $a0 4
	
	jal fattoriale
	
	move $s0 $v0
	
	la $a0 ris
	li $v0 4
	syscall
	
	move $a0 $s0
	li $v0 1
	syscall
	
	li $v0 10
	syscall
	
	
	
########################################
fattoriale:
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $ra -4($fp)
	sw $sp -8($fp)
	add $sp $fp -8
	
	beq $a0 $zero fine_caso_base
	
	add $sp $sp -4
	sw $a0 0($sp)
	
	add $a0 $a0 -1
	jal fattoriale
	
	lw $t0 0($sp)
	add $sp $sp 4
	
	mul $v0 $v0 $t0
	
	j fine_fattoriale
	
fine_caso_base:
	li $v0 1


fine_fattoriale:
	lw $t0 0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	move $fp $t0
	jr $ra
	
	