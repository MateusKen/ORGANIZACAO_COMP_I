.data
	msg_fator1: .asciiz "Digite o valor do primeiro fator da multiplica��o: "
	msg_fator2: .asciiz "Digite o valor do segundo fator da multiplica��o: "
	msg_result_mult: .asciiz "O resultado da multiplica��o: "
.text

li $v0, 4
la $a0, msg_fator1
syscall

li $v0, 6  #valor lido � guardado em $f0
syscall

movf.s $f1, $f0 #move o conte�do de $f0 para $f1

li $v0, 4
la $a0, msg_fator2
syscall

li $v0, 6  #valor lido � guardado em $f0
syscall

mul.s $f12, $f1, $f0

li $v0, 4
la $a0, msg_result_mult
syscall

li $v0, 2
syscall