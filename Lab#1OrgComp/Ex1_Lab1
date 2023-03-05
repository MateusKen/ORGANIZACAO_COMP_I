.data	#Variaveis de texto contendo pergunta para usuario
	n1: .asciiz "Digite o 1o dado: "
	n2: .asciiz "Digite o 2o dado: "
	
	#Variaveis condicionais
	iguais: .asciiz "dados iguais"
	diferentes: .asciiz "dados diferentes"
	
.text
	# Print("Digite o 1o dado")
	li $v0,4
	la $a0,n1
	syscall
	
	#Recebe o input do usuario
	li $v0,5
	syscall
	move $s3, $v0 #Move valor recebido no reg. $v0 para $s3
	
	# Print("Digite o 2o dado")
	li $v0,4
	la $a0,n2
	syscall
	
	#Recebe input do usuario
	li $v0,5
	syscall
	move $s4, $v0 #Move valor recebido no reg. $v0 para $s4
	
	beq $s3,$s4,IF#Condicional (n1==n2),caso afirmativo pula para linha IF
	li $v0,4#Informa que dados sao diferentes
	la $a0,diferentes
	syscall
	j FimIFELESE#Pula para fim (apenas executado quando n1==n2 é falso)
	
	IF:li $v0,4#Informa que dados sao iguais
	la $a0, iguais
	syscall
	
	FimIFELESE:li $v0,10#Finaliza programa
	syscall
	