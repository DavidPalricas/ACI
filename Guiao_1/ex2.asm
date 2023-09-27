.data #Data segment
.text # Code segment
.globl main 
main:ori,$t0,$0,5#$st0 = val_x=3
     ori $t2,$0,8
     add $t1,$t0,$t0 # x + x = 2 * x 
     sub $t1,$t1,$t2# y = 2*x -8 
     jr $ra #terminar o programa