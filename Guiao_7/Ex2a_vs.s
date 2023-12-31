# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
   .data
  .eqv print_string,4
str:.asciiz "ITED - orievA ed edadisrevinU"
   .text
   .globl main

main: addiu $sp,$sp,-4 #reserva espaço na stack
      sw $ra,0($sp) #salvaguarda $ra

      la $a0,str #a0 = str
      jal strrev

      move $a0,$v0
      li $v0,print_string
      syscall

      li $v0,0 #  return 0
      lw $ra,0($sp)
      addiu $sp,$sp,4
      jr $ra




strrev: addiu $sp,$sp,-16 # reserva espaço na stack
 sw $ra,0($sp) # guarda endereço de retorno
 sw $s0,4($sp) # guarda valor dos registos
 sw $s1,8($sp) # $s0, $s1 e $s2
 sw $s2,12($sp) #
 move $s0,$a0 # registo "callee-saved"
 move $s1,$a0 # p1 = str
 move $s2,$a0

 while1: lb $t0,  0($s2) #*p2
         beq $t2,'\0',end_while1
         addiu $t0,$t0,1
         j while1

subi	$s2, $s2, 1		# $s2 = $s2 - 1

while2: bge		$s1, $s2, end_while2	# if $s1 >= $s2 then goto target

        move 	$a0, $s1		# $a0 = $s1
        move 	$a1, $s2		# $a1 = $s2

        jal		exchange				# jump to exchange and save position to $ra
        
        addi	$s1, $s1, 1 	# $s1 = $s1 + 1
        subi    $s2,$s2,1       #s2 = $s2 -1

        j while2

end_while2: move $v0,$s0 # return sr
            lw $ra,0($sp) # repõe endereço de retorno
            # repõe o valor dos registos:
            lw $s0,4($sp) 
            lw $s1,8($sp) 
            lw $s2,12($sp)
            
            addiu $sp,$sp,16 #liberta espaço da stack

            jr $ra

          
          .text

exchange: lb $t0,0($a0)		# char aux = *c1;
	      lb $t1,0($a2)		# $t1 = *c1
	      sb $t1,0($a0)		# *c1 = *c2; 
	      sb $t0,0($a1)		# *c2 = aux;
	      jr $ra			# Fim da função exchange
          


        



         