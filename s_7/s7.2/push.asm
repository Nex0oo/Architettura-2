#Input
#	$a0 -> indirizzo array
#	$a1 -> elemento da inserire

	.text
	.globl push
push:
	lw $t0 0($a0)
	lw $t1 4($a0)
	
	move $t7 $a0
	
	beq $t1 $t0 aumento
	#Posso inserire nuovo elemento
	mul $t3 $t0 4
	add $t3 $t3 $a0
	sw $a1 0($t3)
	add $t2 $t0 1
	sw $t2 0($a0)
	move $t4 $a0
	j fine


aumento:
	mul $t3 $t1 2
	move $a0 $t3
	li $v0 9
	syscall
	
	move $t4 $v0
	sw $t3 4($t4)
	add $t3 $t0 1
	sw $t3 0($t4)
	
	li $t1 2
Loop:
	beq $t0 $t1 fine_ciclo
	mul $t2 $t1 4
	add $t2 $t2 $t7
	lw $t5 0($t2)
	mul $t2 $t1 4
	add $t2 $t2 $t4
	sw $t5 0($t2)
	add $t1 $t1 1
	j Loop
	
fine_ciclo:
	mul $t2 $t1 4
	add $t2 $t2 $t4
	sw $a1 0($t2)
fine:
	move $v0 $t4
	jr $ra
	