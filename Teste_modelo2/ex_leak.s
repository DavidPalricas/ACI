#Mapa de Registos:
#p: $a0 --> $s0
#k:$a1 --> s1
#n: $s2
#*p: $t0

  .data
  .text
  .globl funk2

funk2: addiu $sp,$sp,-16 # não é terminal -> salvaguardar
       sw $ra,0($sp)
       sw $s0,4($sp)
       sw $s1,8($sp)
       sw $s2,12($sp) # salvaguardar registos

       move $s0,$a0 #p: $a0 --> $s0
       move $s1,$a1 #k:$a1 --> s1

       li $s2,0 #i = 0

while: lw $t0,0($s0) #*p: $t0
       beq $t0, $s1, end_while	# while(*p !=k)
       
       move $a0,$t0  #*p: $t0 --> $a0
       move $a1,$s1 #k:$s1 --> a1
       jal funk

       addu $s2,$s2,$v0 # n = n + funk(*p,k)
       
       addi $s0,$s0,4#p++

       j while

end_while: move $v0,$s2 # return n
           lw $ra,0($sp)
           lw $s0,4($sp)
           lw $s1,8($sp)
           lw $s2,12($sp)  # restaurar registos
           addi $sp,$sp,16 #libertar espaço na stack
           jr $ra
       
