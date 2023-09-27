#Mapa de registos
#a: $a0
#t: $f12
#n: $a1
#oldg:$f0
#g: $f2
#s: $f4
#k:$t0

 .data 

 oldg: .eqv .float -1.0
 g: .eqv .float 1.0
 s: .eqv .float 0.0
  .text
  .globl func3

func3: la $t0,oldg
       l.s $f0,0($t0) #oldg:$f0

       la $t0,g
       l.s $f2,0($t0) #g: $f2

       la $t0,s
       l.s $f4,0($t0) #s: $f4

       li $t0,0 #k = 0

for: bge $t0,$a1,end_for #for(k >= n){
     sub.s $f6,$f2,$f0 # g - oldg: $f6

while: c.le.s $f6,$f12 # while((g-oldg) > t){
       bc1t end_while # jump to end_while

       mov.s $f0,$f2

       mul $t0,$t0,4 # k* 4
       addu $t1,$t1,$a0# &a[k]: $t1
       l.s $f6,0($t1) #a[k]: $f6
       
       add.s $f8,$f2,$f6 #g + a[k]

       div.s $f2,$f8,$f12 # g = (g + a[k])/t

       addi $t0,$t0,1

       j while

end_while: add.s $f4,$f4,$f2 # s = s + g  

         mul $t0,$t0,4 # k* 4
         addu $t1,$t1,$a0# &a[k]: $t1
        l.s $f6,0($t1) #a[k]: $f6

        mov.s $f2,$f6 # a[k] = g
        
        addi $t0,$t0,1
        j for

end_for: mtc1 $a1,$f0
         cvt.s.w $f0,$f0 #float(n)
         div.s $f0,$f4,$f0 # return s / float (n)
         jr $ra



