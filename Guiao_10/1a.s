# Mapa de registos:
				# float x: $f12 -> $f20
				# float result: $f22
				# y: $a0 -> $s0
				# i: $t0
				# abs(y): $t1


   .data
num = .float 1.0
   .text
   .globl xtoy

xtoy:    
    addiu $sp,$sp,-16	# Salvaguardar os valores
	sw $ra,0($sp)		# guardar $ra
	sw $s0,4($sp)		# guardar $s0
	s.s $f20,8($sp)		# guardar $f20
	s.s $f22,12($sp)	# guardar $f22

   move $s0,$a0
   mov.s $f20,$f12

