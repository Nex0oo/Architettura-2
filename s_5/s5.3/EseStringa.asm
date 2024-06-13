	.data
prima:	.asciiz "Prima: "
dopo:	.asciiz "Dopo: "
conv:	.asciiz "cIAo"
.align 2
	.text
	.globl main
main:
	
	la $a0 prima
	li $v0 4
	syscall
	
	la $a0 conv
	li $v0 4
	syscall
	
	li $a0 10
	li $v0 11
	syscall
	
	la $a0 dopo
	li $v0 4
	syscall
	
	la $a0 conv
	jal converti
	
	la $a0 conv
	li $v0 4
	syscall
	
	li $v0 10
	syscall
	
	





########################
#Procedura converti
converti:

	move $t0 $fp
	add $fp $sp -4
	
	sw $t0 0($fp)
	sw $ra -4($fp)
	sw $sp -8($fp)
	sw $s0 -12($fp)
	add $sp $fp -12
	
	
Loop:
	lb $t0 0($a0)
	beq $t0 $zero fine_ciclo
	
	move $s0 $a0
	move $a0 $t0
	jal converti_singolo_carattere
	move $a0 $s0
	sb $v0 0($a0)
	add $a0 $a0 1
	j Loop
fine_ciclo:	
	lw $t0 -0($fp)
	lw $ra -4($fp)
	lw $sp -8($fp)
	lw $s0 -12($fp)
	move $fp $t0
	
	jr $ra
	
	
	

#############################
converti_singolo_carattere:
	
	move $v0 $a0
	blt $a0 97 no_converti
	bgt $a0 122 no_converti
	
	add $v0 $v0 -32

no_converti:
	jr $ra
	
