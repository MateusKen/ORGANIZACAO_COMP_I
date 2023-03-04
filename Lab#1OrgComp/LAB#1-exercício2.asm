.data	
	#VARIÁVEIS DE TEXTO QUE SERÃO IMPRESSAS PARA PERGUNTAR INFORMAÇÕES AO USUÁRIO
	age: .asciiz "Sua idade: "
	dis: .asciiz "Você tem alguma doença?\n 1. Não\n 2. Sim\n" 
	
	#VARIÁVEIS CONDICIONAIS
	pode: .asciiz "Você pode doar sangue!"
	npode_doente: .asciiz "Você não pode doar sangue, pois está doente"
	npode_idade: .asciiz "Você precisa ter 18 anos ou mais para doar sangue"
.text
#IMPRIMIR A MSG "Sua idade" NA TELA E LER O VALOR DE ENTRADA
	li $v0, 4
	la $a0, age
	syscall
	li $v0, 5 
	syscall
	move $s0, $v0 #MOVE O VALOR DE ENTRADA CONTIDO NO REG. $v0 PARA O REG. $s0
	
#IMPRIMIR OA MSG "Você tem alguma doença" NA TELA E LER O VALOR DE ENTRADA
	li $v0, 4
	la $a0, dis
	syscall
	li $v0, 5
	syscall
	move $s1, $v0 #MOVE O VALOR DE ENTRADA CONTIDO NO REG. $v0 PARA O REG. $s1
	
#CONDIÇÕES 
	bge $s0, 18, L1 #CASO A IDADE FOR MAIOR QUE 18 ANOS, O PROGRAMA É DESVIADO PARA A LINHA ONDE O LABEL L1 ESTÁ
	li $v0, 4 # <---- PROSSEGUE DESSA LINHA, CASO CONTRÁRIO
	la $a0, npode_idade #CARREGA A MENSAGEM CONTIDA NA VARIÁVEL npode_idade PARA O REG. $a0
	syscall #IMPRIME A MENSAGEM
	j fim #PROGRAMA DESVIA PARA A LINHA ONDE O LABEL fim ESTÁ PARA FINALIZAR O PROGRAMA
	
	L1: beq $s1, 1, L2 #CASO A RESPOSTA FOR 1 (NÃO), O PROGRAMA É DIRECIONADO PARA A LINHA ONDE O LABEL L2 ESTÁ
	li $v0, 4 # <---- PROSSEGUE DESSA LINHA, CASO CONTRÁRIO
	la $a0, npode_doente #CARREGA A MENSAGEM CONTIDA NA VARIÁVEL npode_doente PARA O REG. $a0
	syscall #IMPRIME A MENSAGEM
	j fim #PROGRAMA DESVIA PARA A LINHA ONDE O LABEL fim ESTÁ PARA FINALIZAR O PROGRAMA
	
	L2: li $v0, 4
	la $a0, pode #CARREGA A MENSAGEM CONTIDA NA VARIÁVEL pode PARA O REG. $a0
	syscall#IMPRIME A MENSAGEM
	j fim #PROGRAMA DESVIA PARA A LINHA ONDE O LABEL fim ESTÁ PARA FINALIZAR O PROGRAMA
	
#FINALIZAR O PROGRAMA
	fim: li $v0, 10 
	syscall
	


