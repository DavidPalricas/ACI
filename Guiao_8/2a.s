# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia
itoa: addiu $sp,$sp,-20
 sw $ra,0($sp)
 sw $s0,4($sp) # guarda registos $sx e $ra
 sw $s1,8($sp)
 sw $s2,12($sp)
 sw $s3,16($sp)

 move $s0,$a0 # copia n, b e s para registos
 move $s1,$a1
 move$s2,$a2
 move $s3,$s2
# "callee-saved"
 move $s3,$a2 # p = s;
do: # do {
 remu $t0,$s0,$s1
 divu $s0,$s0,$s1

 move $a0,$t0
 jal toascii

 sb $v0,0($s3)s# *p++ = toascii( digit )
 addiu $s3,$s3,1 #p++

 bleu $s0,0,end_do # } while(n > 0);

 j do


 end_do: sb $0,0($s3) # *p = 0;

 move $a0, $s2
 jal strrev # strrev( s );
 
 move $v0,$s2

 lw $ra,0($sp)
 lw $s0,4($sp) # repõe registos $sx e $ra
 lw $s1,8($sp)
 lw $s2,12($sp)
 lw $s3,16($sp)

 addiu $sp,$sp,20 # liberta espaço na stack
 jr $ra # 


   .text
   .globl toascii

toascii:addiu $a0,$a0,'0'
if: bge $a0,'9',end_if
    addiu $a0,$a0,7
  

end_if:move $v0,$a0
       jr $ra

         