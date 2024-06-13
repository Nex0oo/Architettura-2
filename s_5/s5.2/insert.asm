#INPUT
#	$a0 <- indirizzo array
#	$a1 <- posizione del head
#	$a2 <- elemento da inserire

	.text
	.globl insert
insert:
	mul $t1 $a1 4
	add $t1 $t1 $a0
	sw $a2 0($t1)
	add $v0 $a1 1
	jr $ra