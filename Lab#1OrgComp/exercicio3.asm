.data #variáveis
N: .asciiz "Digite o número: "
resultado: .asciiz "\nResultado = "

.text #código
li $v0, 4 #printa N
la $a0, N
syscall

li $v0, 5 #input de um numero
syscall

move $t0, $v0 #transfere o valor lido para $t0

# escrever aqui
beq $t0, 3, terceira # "se o valor lido for igual a 3" vá para...
bgt $t0, 3, quarta # "se o valor lido for maior que 3" vá para...
j fim


#primeira: ...

#segunda: ...

terceira: 
mul $t1, $t0, $t0 #faz x^2 e guarda o resultado em $t1
j fim

quarta: 
mul $t1, $t0, $t0 #faz x^3 e guarda o resultado em $t1
mul $t1, $t0, $t1
j fim

fim: 
li $v0, 4 #printa a mensagem de resultado
la $a0, resultado
syscall

li $v0, 1 #printa o resultado da operação
move $a0, $t1
syscall

li $v0, 10 #encerra o programa
syscall
