addi x5, x0, 0 #i = 0
addi x6, x0, 0 #j = 0

BUBBLE_SORT:
slli x28, x6, 2 #x28 = j*4
add x29, x28, x10 #x29 = &a[j]
lw x30, 0(x29) #x30 = a[j]
addi x29, x29, 4 #x31 = &a[j + 1]
lw x5, 0(x29) #x5 = a[j + 1]

#verifica se a[j] > a[j + 1] para troca-los
bge x5, x30, CONTINUE

#troca de a[j] e a[j + 1]
addi x7, x30, 0
addi x30, x5, 0
addi x5, x7, 0

CONTINUE:
#iteracao do loop interno e verificacao da condicao para continuar
addi x6, x6, 1
sub x7, x11, x5 #x7 = n - i
addi x7, x7, -1 #x7 = n - i -1
bge x6, x7, FIM_1 #se j < n - i -1, continua o loop interno
beq x0, x0, BUBBLE_SORT

FIM_1:
#iteracao do loop externo e verificacao da condicao para continuar
addi x5, x5, 1
bge x5, x11, FIM_2 #se i < n, continua o loop externo
addi x6, x0, 0 #j = 0
beq x0, x0, BUBBLE_SORT

FIM_2:
jalr x0,0(x1)