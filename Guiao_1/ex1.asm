.data #Data segment
.text # Code segment
.globl main 
main:ori,$t0,$0,3#$st0 = val_x=3
     ori $t2,$0,8
     add $t1,$t0,$t0 # x + x = 2 * x = 2 * 3 = 6
     add $t1,$t1,$t2# y = 2*x + 8 = 2 * 3 + 8=14
     jr $ra #terminar o programa

