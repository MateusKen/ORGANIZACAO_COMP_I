.data
	msg_add1: .asciiz "Digite o valor do primeiro numero da adi��o: "
	msg_add2: .asciiz "Digite o valor do segundo numero da adi��o: "
	msg_result_add: .asciiz "O resultado da adi��o: "
.text

li $v0, 4
la $a0, msg_add1
syscall

li $v0, 6  #valor lido � guardado em $f0
syscall

movf.s $f1, $f0 #move o conte�do de $f0 para $f1

li $v0, 4
la $a0, msg_add2
syscall

li $v0, 6  #valor lido � guardado em $f0
syscall

add.s $f12, $f1, $f0

li $v0, 4
la $a0, msg_result_add
syscall

li $v0, 2
syscall