	.data
A:	.space 200
msg1:	.asciiz "Quanti valori vuoi inserire: "
msg2:	.asciiz "Inserire intero: "
k:	.asciiz "Inserire k: "
ris:	.asciiz "Risultato: "
.align 2

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
	li $t0 0
	la $a0 msg2
	
Loop:
	slt $t1 $t0 $s1
	beq $t1 $zero Uscita
	
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	mul $t2 $t0 4
	add $t2 $t2 $s0
	sw $v0 0($t2)
	add $t0 $t0 1
	j Loop
Uscita:
	la $a0 k
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	move $a2 $v0
	move $a0 $s0
	move $a1 $s1
	jal P
	
	move $s3 $v0
	la $a0 ris
	li $v0 4
	syscall
	
	move $a0 $s3
	li $v0 1
	syscall
	
	li $v0 10
	syscall
	
#############################
#Procedura P
P:
	beq $a2 1 Pari
	li $t4 1
	j Ciclo
Pari:
	li $t4 0

Ciclo:
	slt $t5 $t4 $a1
	beq $t5 $zero Fine
	mul $t6 $t4 4
	add $t6 $t6 $a0
	lw $t7 0($t6)
	add $t8 $t8 $t7
	add $t4 $t4 2
	j Ciclo
Fine:
	move $v0 $t8
	jr $ra
	
	