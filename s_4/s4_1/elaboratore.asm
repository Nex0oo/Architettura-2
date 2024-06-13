	.data
msg:	.asciiz "Inserire valore: "
op:	.asciiz "Inserire operatore 1(+) 2(-) 3(*) 4(/): "
ris:	.asciiz "Risultato: "
resto:	.asciiz ",resto della divisione: "
.align 2

	.text
	.globl main
main:

	la $a0 msg
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	move $s0 $v0
	
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	move $s1 $v0
	
	la $a0 op
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	add $s4 $v0 $zero
	
	move $a2 $v0
	move $a0 $s0
	move $a1 $s1
	jal Elaboratore
	move $s0 $v0
	move $s1 $v1
	
	
	la $a0 ris
	li $v0 4
	syscall
	
	move $a0 $s0
	li $v0 1
	syscall
	bne $s4 4 Fine
	
	la $a0 resto
	li $v0 4
	syscall
	
	move $a0 $s1
	li $v0 1
	syscall
	
Fine:
	li $v0 10 
	syscall
	
	

#----------------------------
Elaboratore:
	beq $a2 1 Somma
	beq $a2 2 Sottrazione
	beq $a2 3 Moltiplicazione
	
	#Divisione
	div $a0 $a1
	mflo $v0
	mfhi $v1
	j End
Somma:
	add $v0 $a0 $a1
	j End
Sottrazione:
	sub $v0 $a0 $a1
	j End
Moltiplicazione:
	mul $v0 $a0 $a1
End:
	jr $ra