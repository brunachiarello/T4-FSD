.text
	.globl main
	
main:	la	$t0, n
	lw	$t0, 0($t0)	#t0: n	
	
	la	$t1, a		# a para o registrador t1
	la	$t2, b		# b para o registrador t2
	la	$t3, c		# c para o registrador t3
	la	$t4, d		# d para o registrador t4
	
	xor	$t5, $t5, $t5	# zera i
	
soma_sub_loop:
	beq $t5, $t0, fim
    	lw  $t6, 0($t1)   # Carrega a[i]
    	lw  $t7, 0($t2)   # Carrega b[i]
    	add $t8, $t6, $t7 # c[i] = a[i] + b[i]
    	sub $t9, $t6, $t7 # d[i] = a[i] - b[i]
    	sw  $t8, 0($t3)   # Armazena c[i]
    	sw  $t9, 0($t4)   # Armazena d[i]
    	addi $t5, $t5, 1  # Incrementa i
    	addi $t1, $t1, 4  # Avança para o próximo elemento de a
    	addi $t2, $t2, 4  # Avança para o próximo elemento de b
    	addi $t3, $t3, 4  # Avança para o próximo elemento de c
    	addi $t4, $t4, 4  # Avança para o próximo elemento de d
    	j soma_sub_loop   # Loop
	

fim:	j	fim
		
.data
n:	.word	8
a:	.word	2 8 -24 4 12 -2 4 3
b:	.word	7 -12 5 12 15 8 11 -7
c:	.word	0 0 0 0 0 0 0 0
d:	.word	0 0 0 0 0 0 0 0
max: 	.word	0
sm:	.word	0