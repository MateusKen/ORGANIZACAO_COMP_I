.data #variáveis
N: .asciiz "Digite o número: "
positivos: .asciiz "\nNúmero de positivos: "
negativos: .asciiz "\nNúmero de negativos: "

.text #código
li $t5, 5 #total
li $t1, 5 #numero de execucoes
li $t2, 0 #contador de positivos
j main

isPositivo:
add $t2, $t2, 1 #se for positivo, soma +1 no contador de positivos ($t2)
j main

func:
li $v0, 4 #printa N
la $a0, N
syscall

li $v0, 5 #input de um número
syscall

move $t0, $v0 #move o valor lido para t0
sub $t1, $t1,1 #sempre que funcINPUT acontecer, subtrai 1 do numero de execuções ($t1)
bge $t0, 0, isPositivo # "se o número lido for maior ou igual a zero vá para..."

main:
bgt $t1, 0, func # enquanto não tiverem feitas as 5 execuções do programa... volte para linha func
#para positivos
li $v0, 4 #printa texto
la $a0, positivos
syscall

li $v0, 1 #printa quantidade de positivos
move $a0, $t2
syscall

#para negativos
li $v0, 4 #printa texto
la $a0, negativos
syscall

sub $t2, $t5, $t2 #acha quantidade de negativos, por (total-positivos)

li $v0, 1 #printa quantidade de negativos
move $a0, $t2
syscall
