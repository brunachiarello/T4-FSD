.text
	.globl main
	
main:	la	$t0, n
	lw	$t0, 0($t0)		#t0: n	
	
	la	$t1, a			# a para o registrador t1
	la	$t2, b			# b para o registrador t2
	la	$t3, c			# c para o registrador t3
	la	$t4, d			# d para o registrador t4
	
	xor	$t5, $t5, $t5		# zera i
	
	#cria c e d
inicializa_vetores_loop:
	beq	$t5, $t0, inicializa_max		# verifica se t5 e t0 s�o iguais
    	lw	$t6, 0($t1)		# Carrega a[i]
    	lw	$t7, 0($t2)   		# Carrega b[i]

    	add	$t8, $t6, $t7 		# c[i] = a[i] + b[i]
    	sub	$t9, $t6, $t7 		# d[i] = a[i] - b[i]

    	sw 	$t8, 0($t3)   		# Armazena c[i]
    	sw	$t9, 0($t4)   		# Armazena d[i]

    	addi	$t5, $t5, 1  		# Incrementa i
    	addi	$t1, $t1, 4  		# Avan�a para o proximo elemento de a
    	addi	$t2, $t2, 4  		# Avan�a para o proximo elemento de b
    	addi	$t3, $t3, 4  		# Avan�a para o proximo elemento de c
    	addi	$t4, $t4, 4  		# Avan�a para o proximo elemento de d
    	j	inicializa_vetores_loop   	
	
	# acha o maior valor
inicializa_max:	
	xor	$t5, $t5, $t5		# zera i
	la	$t1, c			# c para o registrador t1
	la	$t2, d			# d para o registrador t2
	lw 	$t3, 0($t1)		# inicializa max value	com c[i]	

max_value_loop:
	beq	$t5, $t0, inicializa_soma		# verifica se t5 e t0 s�o iguais
    	lw 	$t6, 0($t1)   		# Carrega c[i]
    	lw 	$t7, 0($t2)   		# Carrega d[i]
    	bgt	$t6, $t3, c_maior	# verifica se c[i] � maior que max
    	
verify_d:    	
    	bgt	$t7, $t3, d_maior	#verifica se d[i] � maior que max
    	
increment_max_value:
    	addi	$t5, $t5, 1  		# Incrementa i
    	addi	$t1, $t1, 4  		# Avan�a para o pr�ximo elemento de c
    	addi	$t2, $t2, 4  		# Avan�a para o pr�ximo elemento de d
    	j max_value_loop		
    
 c_maior:
 	add	$t3, $t6, $0		# max value recebe c[i]
 	j	verify_d
 	
 d_maior:
 	add	$t3, $t7, $0		#max value recebe d[i]
 	j	increment_max_value	

	#soma os vetores
inicializa_soma:
	xor	$t5, $t5, $t5		# zera i
	la	$t1, c			# c para o registrador t1
	la	$t2, d			# d para o registrador t2
	xor	$t4, $t4, $t4		# inicializa soma
	
soma_loop:
	beq	$t5, $t0, inicializa_multi		# verifica se t5 e t0 s�o iguais
    	lw 	$t6, 0($t1)   		# Carrega c[i]
    	lw 	$t7, 0($t2)   		# Carrega d[i]

    	add	$t4, $t4, $t6		# soma soma com a[i]
    	add	$t4, $t4, $t7		# soma soma com b[i]

    	addi	$t5, $t5, 1  		# Incrementa i
    	addi	$t1, $t1, 4  		# Avan�a para o pr�ximo elemento de c
    	addi	$t2, $t2, 4  		# Avan�a para o pr�ximo elemento de d
    	j soma_loop
    		
    	# multiplica a soma do vetor pelo maior numero encontrado	
inicializa_multi:
	xor	$t5, $t5, $t5		# zera i
	xor	$t9, $t9, $t9		# inicializa res multi

	lw 	$t0, sm			# t0 recebe sm
	
	add	$t1, $t3, $0		# t1 recebe o maior valor encontrado
	blt	$t1, $0, max_negativo	# verifica se o meior valor encontrado � negativo

multi_loop:
	beq	$t5, $t1, verify_result	# verifica se i e maior valor s�o iguais
	add	$t9, $t9, $t4			# soma e guarda em t9
	addi	$t5, $t5, 1			# incrementa t5
	j multi_loop
	
max_negativo:
	sub	$t1, $0, $t1		# inverte o sinal de max value caso seja negativo
	j	multi_loop
	
verify_result:
	bgt	$t3, $0, salva_sm	# verifica se o maior valor  negativo

troca_sinal_result:
	sub	$t9, $0, $t9		# troca o sinal do resultado caso o max value seja negativo

	#salva na mem�ria
salva_sm:
	sw	$t9, 0($t0)		# salva o resultado em sm
	
fim:	j	fim
		
.data
sm:	.word	0
n:	.word	8
a:	.word	2 8 -24 4 12 -2 4 3
b:	.word	7 -12 5 12 15 8 11 -7
c:	.word	0 0 0 0 0 0 0 0
d:	.word	0 0 0 0 0 0 0 0

