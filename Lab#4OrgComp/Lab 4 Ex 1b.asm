.data
qtd: .asciiz "Quantos nodes para essa lista? "
valor: .asciiz "Qual o valor do node? "
head: .asciiz "\nhead -> "
no1: .asciiz "\nNode 1(key) -> "
no1Next: .asciiz "\nNode 1(next) -> "
no2: .asciiz "\nNode 2(key) -> "
espaco: .asciiz " "

.text
.globl main

main:

#printa a mensagem de qtd
li $v0, 4 
la $a0, qtd
syscall

#pede o input
li $v0, 5
syscall

move $t3, $v0 # contador da quantidade de nós
move $t4, $v0 # copia do contador da quantidade de nós

# Inicialização do ponteiro para o primeiro nó da lista
li $t0, 0
la $s0, ($t0) # endereço da head

loop:
beq $t3, $zero, print #"se o contador chegar a 0... vá para..."

# Alocando espaço na heap para o primeiro nó da lista
li $a0, 8          # 8 bytes para armazenar um ponteiro e um valor inteiro
li $v0, 9          # Código do serviço do sistema para alocação na heap
syscall
move $s1, $v0      # Armazenando o endereço do nó alocado na heap em $s1
   
#printa a mensagem de valor
li $v0, 4 
la $a0, valor
syscall

#pede o input
li $v0, 5
syscall

move $t1, $v0 # armazena o valor lido em $t1 
   
sw $t1, ($s1)      # Armazenando o valor no endereço do nó alocado
sw $t0, 4($s1)     # O ponteiro próximo do nó é nulo

#configurando o ponteiro para o primeiro nó da lista para apontar para o nó alocado
sw $s1, 4($s1) #node anterior aponta para o próximo node da lista
la $s0, 4($s1) #incrementa o node

beq $t3, $t4, armazena
volta:

subi $t3, $t3, 1 #subtrai 1 do tamanho do vetor para controlar o loop

j loop


armazena:

la $s2, ($s1)#armazena o endereco inicial do head em s0 para uso mais tarde

j volta


print:
beq $t4, $zero, exit #"se o contador chegar a 0... vá para..."

# Imprimindo o endere�o armazenado em head
li $v0, 1
lw $t5, ($s2)
move $a0, $t5
syscall

la $s2, 8($s2) # move s2 to the next node

subi $t4, $t4, 1 #subtrai 1 do tamanho do vetor para controlar o loop

li $v0, 4 
la $a0, espaco
syscall

j print

#fim do programa
exit:
li $v0, 10
syscall
