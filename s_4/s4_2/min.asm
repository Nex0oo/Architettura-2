	.text
	.globl min
min:
	li $t0 1
	move $t1 $a0	#N
	move $t2 $a1	#A[]
	lw $t8 0($t2)	#A[0]
Loop:	
	slt $t3 $t0 $t1
	beq $t3 0 End
	#Estraggo valore nell'array
	mul $t5 $t0 4
	add $t5 $t5 $t2
	lw $t4 0($t5)
	##############
	slt $t5 $t8 $t4
	beq $t5 1 Then
	move $t8 $t4
Then:
	add $t0 $t0 1
	j Loop
End:
	move $v0 $t8
	jr $ra