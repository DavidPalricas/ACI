.text

strcopy: li $t0,0 # i = 0

        

do: mul $t1,$t0,4
    
    addu $t2,$t1,$a1	# $t2 = &src[i]
	addu $t1,$t1,$a0	# $t1 = &dst[i]
  	lw $t3,0($t2)		# $t3 = src[i]
  	sw $t3,0($t1)    	# dst[i] = src[i]; 

    addiu $t0,$t0,1

while: beq $t3,'\0',end_do
       j do

end_do: move $v0,$a0
             jr $ra

