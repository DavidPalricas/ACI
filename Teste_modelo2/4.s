#Mapa de Registos
#nv:$a0
#pt:$a1
#i:$t0
#j:$t1
#sum:$f0


# typedef struct
# {            Align    Size    Offset
# int acc;        4    4          0
# char nm;        1    1          4
# double grade;   8    8          5 -> 8
# char quest[14]; 1    14         16
# int cq;         4    4          30 -> 32
# } t_kvd;        8    36 -> 40

    .data
sum: .double 0.0
    .text
    .globl func4

func4: la $t0,sum
       l.s $f0.0($t0) #sum:$f0

       li $t0,0 # i = 0

for: bge $t0,$a0,end_for #for(i < nv){
      
      li $t1,0 # j = 0

do: addi    $t2, $a1, 16                # $t2 = &pt->quest[0]
    addu    $t2, $t2, $t1                # $t2 = &pt->quest[j]
    lb    $t2, 0($t2)                # $t2 = pt->quest[j]

   mtc1 $t2,$f2
   cvt.d.w $f2,$f2 #(double) pt->quest[j]
   add.d $f0,$f0,$f2#sum += (double) pt->quest[j]
   addi $t1,$t1,1#j ++

while: lb $t2,4($a1) # pt --> nm
       blt $t1, $t2,do #while(j < pt-->nm)
dfcg                                                                                                                                                                                                                    
end_do:l.d $f2,8($a1) #pt --> grade
       div.d $f2,$f0,$f2 # sum/ pt--> grade
       cvt.w.d $f2,$f2

       mfc1 $t2,$f2
       lb $t2,0($a1) #pt--> acc = sum/ pt--> grade

end_for: lb $t2,32($a1) # pt-->cq
         mtc1 $f0,$t2
         cvt.d.w $f0,$f2 #(double) pt--> cq

         l.d $f2,8($a1)#pt --> grade
         mul.d $f0,$f2,$f0 # return (pt --> grade* (double) pt--> cq)~
         jr $ra #fim do programa
         

       
