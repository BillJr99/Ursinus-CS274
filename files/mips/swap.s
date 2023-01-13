.text
.globl main
 
main:
    la $t0, val1
    la $t1, val2
    
    lw $t2, 0($t0)
    lw $t3, 0($t1)
    
    sw $t2, 0($t1)
    sw $t3, 0($t0)
    
    # exit
    li $v0, 10
    syscall  
    
.data
val1: .word 5
val2: .word 6