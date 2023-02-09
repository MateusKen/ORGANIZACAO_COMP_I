.data #variáveis
hello: .asciiz "Bom dia"
.text #instruções

li $v0, 4 #load immediate
la $a0, hello # load address
syscall #chamada do sistema