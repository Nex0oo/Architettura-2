	.data
msg:	.asciiz "Inserire intero: "
ris:	.asciiz "Risultato: "
err:	.asciiz "errore"
	.align 2

	.text
	.globl main
main:
	li $t0 0
Loop:
	li $v0 51
	la $a0 msg
	syscall
	
	add $sp $sp -4
	sw $a0 0($sp)
	
	beq $t0 2 End
	add $t0 $t0 1
	j Loop
End:
	
	lw $s2 0($sp)	
	add $sp $sp 4	#Pop c
	
	lw $s1 0($sp)
	add $sp $sp 4	#Pop b
	
	lw $s0 0($sp)
	add $sp $sp 4	#Pop a
	
	ble $s0 $s1 Else
	beq $s2 $zero Else
	
	add $s0 $s0 $s1
	mul $s0 $s0 $s2
	
	li $v0 56
	la $a0 ris
	move $a1 $s0
	syscall
	j Finish
Else:
	li $v0 55
	la $a0 err
	li $a1 2
	syscall
Finish:
	li $v0 10
	syscall