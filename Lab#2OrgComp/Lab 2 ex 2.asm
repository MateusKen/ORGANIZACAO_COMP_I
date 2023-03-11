.data

msg_fibo: .asciiz "Digite a quantidade de termos desejados na sequência Fibonacci: "
espaco: .asciiz " "


.text

j main

fibo:
#Enquanto a quantidade de termos é diferente de 2, continuar na função
beq $t0, 2, fimfibo

#Soma os dois números e coloca o novo número na próxima posição, também printando-o
add $t3, $t2, $t1
li $v0, 1
la $a0, ($t3)
syscall

#Imprime um espaço
li $v0, 4
la $a0, espaco
syscall

#Move o número em $t2 para $t1, e o número em $t3 (a soma) para $t2, fazendo com que no próximo loop os dois últimos números sejam somados, continuando a sequência fibonacci
move $t1, $t2
move $t2, $t3

sub $t0, $t0, 1

j fibo

fimfibo:
jr $ra



main:
#Imprime a msg solicitando a quantidade de termos da sequência
li $v0, 4
la $a0, msg_fibo
syscall

#Lê o número
li $v0, 5
syscall

#Copia o número para o registrador $t0
move $t0, $v0

#Se o número for 0, já finaliza o programa
beq $t0, 0, fim

#Os dois primeiros números da sequência são 0 e 1
li $t1, 0
li $t2, 1

#Imprime esses números e coloca espaços entre eles
li $v0, 1
la $a0, ($t1)
syscall

li $v0, 4
la $a0, espaco
syscall

#Se a quantidade de números da sequência for 1, não é preciso mais imprimir nada e o programa da um jump pro final
beq $t0, 1, fim

li $v0, 1
la $a0, ($t2)
syscall

li $v0, 4
la $a0, espaco
syscall

#Se a quantidade de números da sequência for 2, não é preciso mais imprimir nada e o programa da um jump pro final
beq $t0, 2, fim

#Chama a função fibonacci

jal fibo

#Termina o programa
fim:
li $v0, 10
syscall
