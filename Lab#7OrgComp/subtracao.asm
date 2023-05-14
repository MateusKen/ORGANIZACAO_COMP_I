.data
	msg_sub1: .asciiz "Digite o valor do primeiro fator da subtração: "
	msg_sub2: .asciiz "Digite o valor do segundo fator da subtração: "
	msg_result_sub: .asciiz "O resultado da subtração: "
.text

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