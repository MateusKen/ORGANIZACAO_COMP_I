.data #vari�veis
hello: .asciiz "Bom dia"
.text #instru��es

li $v0, 4 #load immediate
la $a0, hello # load address
syscall #chamada do sistema