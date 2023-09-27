#Mapa de Registos:
#rv: $v0
#n:$t4
#sum:$t0
#nit: $t1
#pt:$t2

  .data
  .eqv SIZE,8
  .eqv read_int,5
  .eqv print_string,4
str: .asciiz "Media invalida!\n"
list: .space 32
  .globl main

main: li $t0,0 # sum= 0
      li $t1,0 #nit = 0

      la $t2,list #pt = list

      addiu $t3,$t2,SIZE
   
for1: bge $t2,$t3,end_for1 # for(pt < (list + SIZE){
      
      li $v0,read_int
      syscall       #read_int()--> $v0

      sw $v0,0($t2) #*pt = read_int()

      addiu $t2,$t2,4 #p++

      j for1 #}

end_for1: li $t4,0 # n =0
          la $t2,list

for2: bge $t4,SIZE,end_for2
      
      mul $t5,$t4,4 # list + n*4
      addu $t5,$t5,$t2 # &list[n]
      lw $t6,0($t5) # list[n]

if1: blt $t6,0,end_if1 # if(list[n] < 0){
     addu $t0,$t0,$t6 # sum += list[n]
     addiu $t1,$t1,1 #nit++

end_if1: # }
        addiu $t4,$t4,1
        j for2 


if2: ble $t1,0,else #if( nit < 0){
     li $t2,0 # repor $t2 com 0
     div $t2,$t0,$t1 #sum / nit
     li $v0, 0 #rv = 0

else: #else
      li $a0,str
      li $v0,print_string # printstring
      syscall
      li $v0,-1

end_if2: jr $ra # } e fim do programa
      


      

