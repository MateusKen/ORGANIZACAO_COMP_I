.data
array: .space 40
n: .asciiz "Digite um número: "

.text
li $t0, 0 # contador para loop
li $t4, 0 # contador para loop de print
la $t1, array #endereço inicial do vetor
la $t3, array # endereço inicial do vetor
li $t2, 4
mul $t2, $t2, 9
addi $t1, $t1, $t2 # endereço do ultimo 

loop1:
bge $t0, 10, print # depois de registrar os 10 inteiros para 

li $v0, 4 # printa a mensagem de n
la $a0, n
syscall

li $v0, 5 # pede o input
syscall

sw $v0, array($t1) 
addi $t0, $t0, 1 # incrementa o contador
addi $t1, $t1, -4 # faz o i--
j loop

print:
bge $t4, 10, exit
lw $t5, ($t1)

li $v0, 1
move $a0, $t5
syscall

addi $t4, $t4, 4
j print
