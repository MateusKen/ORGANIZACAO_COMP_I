.data	
	#VARI�VEIS DE TEXTO QUE SER�O IMPRESSAS PARA PERGUNTAR INFORMA��ES AO USU�RIO
	age: .asciiz "Sua idade: "
	dis: .asciiz "Voc� tem alguma doen�a?\n 1. N�o\n 2. Sim\n" 
	
	#VARI�VEIS CONDICIONAIS
	pode: .asciiz "Voc� pode doar sangue!"
	npode_doente: .asciiz "Voc� n�o pode doar sangue, pois est� doente"
	npode_idade: .asciiz "Voc� precisa ter 18 anos ou mais para doar sangue"
.text
#IMPRIMIR A MSG "Sua idade" NA TELA E LER O VALOR DE ENTRADA
	li $v0, 4
	la $a0, age
	syscall
	li $v0, 5 
	syscall
	move $s0, $v0 #MOVE O VALOR DE ENTRADA CONTIDO NO REG. $v0 PARA O REG. $s0
	
#IMPRIMIR OA MSG "Voc� tem alguma doen�a" NA TELA E LER O VALOR DE ENTRADA
	li $v0, 4
	la $a0, dis
	syscall
	li $v0, 5
	syscall
	move $s1, $v0 #MOVE O VALOR DE ENTRADA CONTIDO NO REG. $v0 PARA O REG. $s1
	
#CONDI��ES 
	bge $s0, 18, L1 #CASO A IDADE FOR MAIOR QUE 18 ANOS, O PROGRAMA � DESVIADO PARA A LINHA ONDE O LABEL L1 EST�
	li $v0, 4 # <---- PROSSEGUE DESSA LINHA, CASO CONTR�RIO
	la $a0, npode_idade #CARREGA A MENSAGEM CONTIDA NA VARI�VEL npode_idade PARA O REG. $a0
	syscall #IMPRIME A MENSAGEM
	j fim #PROGRAMA DESVIA PARA A LINHA ONDE O LABEL fim EST� PARA FINALIZAR O PROGRAMA
	
	L1: beq $s1, 1, L2 #CASO A RESPOSTA FOR 1 (N�O), O PROGRAMA � DIRECIONADO PARA A LINHA ONDE O LABEL L2 EST�
	li $v0, 4 # <---- PROSSEGUE DESSA LINHA, CASO CONTR�RIO
	la $a0, npode_doente #CARREGA A MENSAGEM CONTIDA NA VARI�VEL npode_doente PARA O REG. $a0
	syscall #IMPRIME A MENSAGEM
	j fim #PROGRAMA DESVIA PARA A LINHA ONDE O LABEL fim EST� PARA FINALIZAR O PROGRAMA
	
	L2: li $v0, 4
	la $a0, pode #CARREGA A MENSAGEM CONTIDA NA VARI�VEL pode PARA O REG. $a0
	syscall#IMPRIME A MENSAGEM
	j fim #PROGRAMA DESVIA PARA A LINHA ONDE O LABEL fim EST� PARA FINALIZAR O PROGRAMA
	
#FINALIZAR O PROGRAMA
	fim: li $v0, 10 
	syscall
	


