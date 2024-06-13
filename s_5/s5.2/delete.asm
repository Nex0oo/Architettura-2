#INPUT:
#	$a0 <- indirizzo array
#	$a1 <- posizione elemento da eliminare
#	$a2 <- head

	.text
	.globl delete
delete:

	move $t5 $a0	#array
	move $t0 $a1	#pos
	move $t2 $a2	#head


Loop:
	slt $t1 $t0 $t2
	beq $t1 $zero End
	mul $t3 $t0 4	
	add $t3 $t3 $t5	#Indirizzo cella da eliminare
	lw $t9 4($t3)
	sw $t9 0($t3)
	add $t0 $t0 1
	j Loop
End:
	add $v0 $t2 -1
	jr $ra
	