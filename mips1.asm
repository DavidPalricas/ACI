# Mapa de registos
# $t0 – c

.data
.eqv putChar,11
.eqv getChar,12
.text

.globl main 

#do{
main:
      li $v0,12
      syscall #c = getChar();
      move $t0,$v0
 
      move $a0,$t0
      li $v0,11
      syscall #putChar(c);
      
      bne $t0,'\n',main #} while( c != '\n');

      
end:jr $ra #return 0;