#Input
#	$a0 -> indirizzo array	
	
	.data
msg:	.asciiz "L'array contiene i seguenti elementi: "
s:	.asciiz " "
.align 2

	.text
	.globl print
print:
	move $t0 $a0
	
	la $a0 msg
	li $v0 4
	syscall
	
	lw $t1 0($t0)
	
	li $t2 0
Loop:
	beq $t1 $t2 fine
	mul $t3 $t2 4
	add $t3 $t3 $t0
	lw $a0 0($t3)
	li $v0 1
	syscall
	
	la $a0 s
	li $v0 4
	syscall
	
	add $t2 $t2 1
	j Loop
fine:
	jr $ra