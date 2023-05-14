.data
	msg_add1: .asciiz "Digite o valor do primeiro numero da adição: "
	msg_add2: .asciiz "Digite o valor do segundo numero da adição: "
	msg_result_add: .asciiz "O resultado da adição: "
.text

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