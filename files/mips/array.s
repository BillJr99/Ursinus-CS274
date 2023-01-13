        .text
    
        .globl main
    
main:
    la $t0, arr     # t0 = the address of the array
    
    # set t1 to the value at the address size
    la $t1, size 
    lw $t1, 0($t1)
    
    # let t2 be i = 0
    li $t2, 0
    
    # let s0 be our sum
    li $s0, 0
    
# for each word in the array (strings end with a 0 null terminator!)    
loop:
    # are we at the end of the array? if i (t2) == size (t1), we are
    beq $t2, $t1, finished 
    
    # set the address to 4 * i + the base address of the array
    sll $t4, $t2, 2
    add $t3, $t0, $t4
    
    # load the word 
    lw $t5, 0($t3)  
    
    # and add it to our running sum
    add $s0, $s0, $t5
    
    addi $t2, $t2, 1 # i++
    j loop           # and continue
    
finished:
    # print the sum
    li $v0, 1
    addi $a0, $s0, 0 # set a0 to the sum in s0
    syscall
    
    # exit
    li $v0, 10
    syscall

        .data
arr:    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
size:   .word 10