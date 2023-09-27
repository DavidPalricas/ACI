   #Mapa de Registos:
   #f1:$a0--> $s0
   #k: $a1--> $s1
   #av:$a2--> $s2
   #i:$s3
   #res: $t0
   
   
   .data
   .eqv SIZE,15 # SIZE- 15
   .eqv print_int10,1
   .eqv print_string,4
str: .asciiz "Invalid argc"
   .text
   .globl func2

func2: addiu $sp,$sp,-20 #reservar espaço na stack
       sw $ra,0($sp) 
       sw $s0,4($sp)
       sw $s1,8($sp)
       sw $s2,12($sp)
       sw $s3,16($sp)
      
      move $s0,$a0 #f1:$a0--> $s0
      move $s1,$a1 #k: $a1--> $s1
      move $s2,$a2 #av: $a2--> $s2


if: blt $s1,2,else #if(k < 2)
    bgt $s1,SIZE,else# ... && (k > SIZE){

    li $s3,2 # i =2
   
do: mul $t1,$s3,4 # i * 4
    addu $t1,$t1,$s0 #$t1 = &av[i]
    sw $a0,0($t1) # $a0 = av[i]
    jal toi

    mul $t1,$s3,4 # i * 4
    addu $t1,$t1,$s0 #$t1 = &f1[i]
    sw $v0,0($t1) # $f1[i] = av[i]
    
    addiu $s3,$s3,1



while: bge $s3,$s1,end_do
       j do

end_do: move $a0,$s0 #f1:s0-->$a0
        move $a1,$s1 #k:s1-->$a1
        jal avz #avz(f1,k)

        move $t0,$v0
        move $a0,$t0 #res = avz(f1,k)

       li $v0,print_int10
       syscall #print_int10(res)

       j end_if

else: la $a0,str
      li $v0,print_string
      syscall #print_string("Invalid argc")

end_if: move $v0,$t0 # return res
         
         lw $ra,0($sp)
         lw $s0,4($sp)
         lw $s1,8($sp)
         lw $s2,12($sp)
         lw $s3,16($sp)
        addiu $sp,20
        jr $ra



  



