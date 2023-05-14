.data
	msg_dividendo: .asciiz "Digite o valor do dividendo: "
	msg_divisor: .asciiz "Digite o valor do divisor: "
	msg_result_divisao: .asciiz "O resultado da divisão é: "
.text


divisao:
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




