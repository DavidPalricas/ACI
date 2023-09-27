# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx
     .text
     .globl atoi
atoi: li $v0,0 # res = 0;
while: lb $t0,0($a0)# while(*s >= ...)
 blt $t0,'0',end_while
 bgt $t0.'9',end_while
 sub $t1,$t0,'0' # digit = *s – '0'
 addiu $a0,$a0,1 # s++;
 mul $v0,$v0,10 # res = 10 * res;
 add $v0,$v0,$t1 # res = 10 * res + digit;
 j while # }

 end_while:
             jr $ra # termina sub-rotina 