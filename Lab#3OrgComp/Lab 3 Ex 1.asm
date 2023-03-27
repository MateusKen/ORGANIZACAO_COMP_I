.data 
c: .word 8, 13, -4, 4, 10
elementos: .asciiz "\nElementos do vetor: \n"
ma: .asciiz "\nMaior número do vetor: "
me: .asciiz "\nMenor número do vetor: "
med: .asciiz "\nMédia dos elementos do vetor: "	
espaco: .asciiz " "
virgula: .asciiz ","

.text

j main

#funcao 1
original:
beq $t0,$zero,f_org #sai do loop quando todos os elementos do vetor foram usados
lw $s1, 0($s0) #coloca o elemento que esta em $s0 no $s1, s1=c[0]

#imprime o elemento
li $v0, 1
move $a0, $s1
syscall

#imprime um espaco
li $v0, 4
la $a0, espaco
syscall

addi $s0, $s0, 4 #soma 4 bytes para pegar o proximo elemento do vetor
subi $t0, $t0, 1 #subtrai 1 do tamanho do vetor para controlar o loop
j original #loop

f_org:
jr $ra #volta pra main



#funcao 2
maior:
beq $t0,$zero,f_maior #sai do loop quando todos os elementos do vetor foram usados
lw $s1, 0($s0) #coloca o elemento que esta em $s0 no $s1, s1=c[0]

bgt $s1, $t1, atualiza_ma #se o elemento atual for maior que o maior, pula pra atualiza_ma

addi $s0, $s0, 4 #soma 4 bytes para pegar o proximo elemento do vetor
subi $t0, $t0, 1 #subtrai 1 do tamanho do vetor para controlar o loop
j maior #loop

atualiza_ma:
move $t1, $s1 #o elemento atual vira o novo elemento maior
addi $s0, $s0, 4 #soma 4 bytes para pegar o proximo elemento do vetor
subi $t0, $t0, 1 #subtrai 1 do tamanho do vetor para controlar o loop
j maior #loop

f_maior:

#imprime o elemento maior
li $v0, 1
move $a0, $t1
syscall

jr $ra #volta pra main



#funcao 3
menor:
beq $t0,$zero,f_menor #sai do loop quando todos os elementos do vetor foram usados
lw $s1, 0($s0) #coloca o elemento que esta em $s0 no $s1, s1=c[0]

blt $s1, $t1, atualiza_me #se o elemento atual for menor que o menor, pula pra atualiza_me

addi $s0, $s0, 4 #soma 4 bytes para pegar o proximo elemento do vetor
subi $t0, $t0, 1 #subtrai 1 do tamanho do vetor para controlar o loop
j menor #loop

atualiza_me:
move $t1, $s1 #o elemento atual vira o novo elemento menor
addi $s0, $s0, 4 #soma 4 bytes para pegar o proximo elemento do vetor
subi $t0, $t0, 1 #subtrai 1 do tamanho do vetor para controlar o loop
j menor #loop

f_menor:

#imprime o elemento menor
li $v0, 1
move $a0, $t1
syscall

jr $ra #volta pra main



#funcao 4
media:
beq $t0,$zero,f_media #sai do loop quando todos os elementos do vetor foram usados
lw $s1, 0($s0) #coloca o elemento que esta em $s0 no $s1, s1=c[0]

add $t2, $t2, $s1 #soma o elemento atual com a soma total

addi $s0, $s0, 4 #soma 4 bytes para pegar o proximo elemento do vetor
subi $t0, $t0, 1 #subtrai 1 do tamanho do vetor para controlar o loop

j media #loop

f_media:
div $t2, $t1 #divide a soma total pelo numero de elementos para conseguir a media

#imprime a parte inteira da divisao da media
mflo $a0 
li $v0, 1
syscall

#imprime uma virgula
li $v0, 4
la $a0, virgula
syscall

#imprime a parte quebrada da divisao da media
mfhi $a0 
li $v0, 1
syscall

jr $ra #volta pra main




main:

#preparacao funcao 1

li $t0, 5 #$t0 = tamanho do vetor
la $s0, c #$s0 = endereco do primeiro elemento do vetor

#imprime a mensagem da funcao 1
li $v0, 4
la $a0, elementos
syscall

jal original #chama a funcao 1


#preparacao funcao 2

li $t0, 5 #$t0 = tamanho do vetor
la $s0, c #$s0 = endereco do primeiro elemento do vetor
lw $t1, 0($s0)  #$t1 guarda o maior numero

#imprime a mensagem da funcao 2
li $v0, 4
la $a0, ma
syscall

jal maior #chama a funcao 2


#preparacao funcao 3

li $t0, 5 #$t0 = tamanho do vetor
la $s0, c #$s0 = endereco do primeiro elemento do vetor
lw $t1, 0($s0)  #$t1 guarda o menor numero

#imprime a mensagem da funcao 3
li $v0, 4
la $a0, me
syscall

jal menor #chama a funcao 3


#preparacao funcao 4

li $t0, 5 #$t0 = tamanho do vetor
li $t1, 5 #$t1 = tamanho do vetor estatico
la $s0, c #$s0 = endereco do primeiro elemento do vetor
li $t2, 0 #t1 guarda a soma dos elementos

#imprime a mensagem da funcao 4
li $v0, 4
la $a0, med
syscall

jal media #chama a funcao 4

#fim do programa
li $v0, 10
syscall







