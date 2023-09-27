   .data

num: .float 2.59375
zero: .float 0.0
   .eqv read_int,5
   .eqv print_float,2

   .text
   .globl main
main:
 
do: li $v0,read_int
    syscall
    move $t0,$v0

    mtc1 $t0,$f0
    cvt. s.w $f0,$f0

    l.s $f2,num
    mul.s $f0,$f0,$f2

    li $v0,print_float
    move.s $f12,$f0
    syscall

    l.s $f2,zero
    c.eq.s $f0,$f2
    bc1f do

end_do: li $v0,0
        jr $ra

    
    