.data
	msg_add1: .asciiz "Digite o valor do primeiro numero da adição: "
	msg_add2: .asciiz "Digite o valor do segundo numero da adição: "
	msg_result_add: .asciiz "O resultado da adição: "
	
	msg_sub1: .asciiz "Digite o valor do primeiro fator da subtração: "
	msg_sub2: .asciiz "Digite o valor do segundo fator da subtração: "
	msg_result_sub: .asciiz "O resultado da subtração: "
	
	msg_fator1: .asciiz "Digite o valor do primeiro fator da multiplicação: "
	msg_fator2: .asciiz "Digite o valor do segundo fator da multiplicação: "
	msg_result_mult: .asciiz "O resultado da multiplicação: "
	
	msg_dividendo: .asciiz "Digite o valor do dividendo: "
	msg_divisor: .asciiz "Digite o valor do divisor: "
	msg_result_divisao: .asciiz "O resultado da divisão é: "
	
	msg_menu: .asciiz "Menu de opções\n1- Soma\n2- Subtração\n3- Multiplicação\n4- Divisão\n5- SAIR\nDigite a opção: "
.text
j main

add:
li $v0, 4
la $a0, msg_add1
syscall

li $v0, 6  #valor lido é guardado em $f0
syscall

movf.s $f1, $f0 #move o conteúdo de $f0 para $f1

li $v0, 4
la $a0, msg_add2
syscall

li $v0, 6  #valor lido é guardado em $f0
syscall

add.s $f12, $f1, $f0

li $v0, 4
la $a0, msg_result_add
syscall

li $v0, 2
syscall

sub:
li $v0, 4
la $a0, msg_sub1
syscall

li $v0, 6  #valor lido é guardado em $f0
syscall

movf.s $f1, $f0 #move o conteúdo de $f0 para $f1

li $v0, 4
la $a0, msg_sub1
syscall

li $v0, 6  #valor lido é guardado em $f0
syscall

sub.s $f12, $f1, $f0

li $v0, 4
la $a0, msg_result_sub
syscall

li $v0, 2
syscall

mult:
li $v0, 4
la $a0, msg_fator1
syscall

li $v0, 6  #valor lido é guardado em $f0
syscall

movf.s $f1, $f0 #move o conteúdo de $f0 para $f1

li $v0, 4
la $a0, msg_fator2
syscall

li $v0, 6  #valor lido é guardado em $f0
syscall

mul.s $f12, $f1, $f0

li $v0, 4
la $a0, msg_result_mult
syscall

li $v0, 2
syscall

div:
li $v0, 4
la $a0, msg_dividendo
syscall

li $v0, 6  #valor lido é guardado em $f0
syscall

movf.s $f1, $f0 #move o conteúdo de $f0 para $f1 

li $v0, 4
la $a0, msg_divisor
syscall

li $v0, 6  #valor lido é guardado em $f0
syscall

div.s $f12, $f1, $f0

li $v0, 4
la $a0, msg_result_divisao
syscall

li $v0, 2
syscall

main:
li $v0, 4
la $a0, msg_menu
syscall
