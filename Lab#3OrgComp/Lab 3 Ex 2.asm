.data
array: .space 40
n: .asciiz "Digite um número: "
msg: .asciiz "Ordem inversa: "
espaco: .asciiz " "

.text
li $t0, 0 #contador para loop de print
li $t1, 10 #tamanho do vetor

loop:
beq $t1,$zero,load #sai do loop quando todos os elementos do vetor foram usados

#printa a mensagem de n
li $v0, 4 
la $a0, n
syscall

#pede o input
li $v0, 5
syscall

move $s0, $v0 #guarda o input em $s0

sw $s0, array($t0) #guarda o elemento no index atual
addi $t0, $t0, 4 #soma 4 bytes para avancar o index e guardar o proximo elemento do vetor
subi $t1, $t1, 1 #subtrai 1 do tamanho do vetor para controlar o loop
j loop #loop

load:
#printa a mensagem de msg
li $v0, 4 
la $a0, msg
syscall

li $t1, 10 #reusa o $t1

la $s0, array #$s0 = endereco do primeiro elemento do vetor
j print



print:
beq $t1,$zero,exit #sai do loop quando todos os elementos do vetor foram usados
lw $s1, 36($s0) #pega o elemento do array na ultima posicao (offset 36 = 4 * 9) e coloca no $s1

#imprime o elemento
li $v0, 1
move $a0, $s1
syscall

#imprime um espaco
li $v0, 4
la $a0, espaco
syscall

subi $s0, $s0, 4 #subtrai 4 bytes para pegar o proximo elemento anterior
subi $t1, $t1, 1 #subtrai 1 do tamanho do vetor para controlar o loop
j print #loop

#fim do programa
exit:
li $v0, 10
syscall
