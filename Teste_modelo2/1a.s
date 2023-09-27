#Mapa de Registos
#a: $a0
#t:$f12
#n:$a1
#oldg:$f0
#g:#$f2
#s:#$f4
#k:#t0

  .data
oldg: .float -1.0
g: .float 1.0
s: .float 0.0
   .text
   .globl func3

func3: la $t0,oldg
       l.s $f0,0($t0) #oldg:$f0

       la $t0,g
       l.s $f2,0 ($t0) #g:#f2

       la $t0,s
       l.s $f4,0($t0) #s:#f4

       li $t0,0 #k = 0

for: bge $t0,$a1,end_for # k >= n jump to end_for
     sub.s $f6,$f2,$f0 # g- oldg : $f6

while: c.ge.s $f6,$f12,end_while   # g- oldg  >= t jump to end_while
       mov.s $f0,$f2

       mul $t1,$t0,4 #k * 4
       addu $t1,$t1,$a0 # &a[k]
       l.s $f6,0($t1)# a[k] : $t2
   
       add.s $f6,$f2,$f6 # g + a[k]
       div $f2,$f6,$f12
       
       j while

end_while: addu $f4,$f4,$f2
           
        mul $t1,$t0,4 #k * 4
        addu $t1,$t1,$a0 # &a[k]
        l.s $f6,0($t1)# a[k] : $t2
        
        mov.s $f2,$f6 #a[k] = g

        addi $t0,$t0,1

        j for

end_for: mtc1 $a1,$f0
        cvt.s.w $f6,$f0 #(float) n

        div.s $f0,$f4,$f0 # return s /(float) n

        jr $ra



       

