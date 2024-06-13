#INPUT
# 3 valori interi e 2 indirizzi del segmento di testo

#OUTPUT
# Nessuno

	.text
	.globl branch3equal

branch3equal:
	#Pop dallo stack
	lw $t4 0($sp)	#Secondo indirizzo segmento testo
	add $sp $sp 4
	
	move $t0 $a0	#1° valore
	move $t1 $a1	#2° valore
	move $t2 $a2	#3° valore
	move $t3 $a3	#Primo indirizzo segmento testo
	
	
	beq $t0 $t1 condizione1
	beq $t0 $t2 normale
	bne $t1 $t2 diversi

condizione1:
	beq $t1 $t2 uguali
	j normale
uguali:
	jr $t3
diversi:
	jr $t4	
normale:
	jr $ra