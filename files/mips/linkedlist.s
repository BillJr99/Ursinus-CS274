        .text
    
        .globl main
    
main:
    # t1 is the address of the heap where our malloc'd linked list nodes will go
    la $t1, heap
    
    # Create a linked list node
    li $s0, 3               # value = 3
    addi $s1, $zero, 0      # next = null
    # store on the heap, data first, then the next pointer
    sw $s0, 0($t1)          
    sw $s1, 4($t1)
    
    # repeat for the second node
    li $s0, 2               # value = 2
    addi $s1, $t1, 0        # next = the base address of the heap (&heap), the location of the beginning of the first node
    # store on the heap, data first, then the next pointer
    sw $s0, 8($t1)          
    sw $s1, 12($t1)    

    # repeat for the third node
    li $s0, 1               # value = 2
    addi $s1, $t1, 8        # next = the base address of the heap (&heap) + 8, the location of the beginning of the second node
    # store on the heap, data first, then the next pointer
    sw $s0, 16($t1)          
    sw $s1, 20($t1)        
    
    # set the address of the beginning of the list (the third node we created)
    addi $a0, $t1, 16
    jal suml
    
    # set t0 to our answer from the return register (so we can overwrite v0 for the syscall)
    addi $t0, $v0, 0
    
    # print the sum
    li $v0, 1
    addi $a0, $t0, 0 # set a0 to the sum in t0 returned from the suml procedure as v0
    syscall

    # exit
    li $v0, 10
    syscall
    
suml:
    # save to the stack
    # since this function doesn't call any other procedures, saving ra isn't necessary, but good practice and good review!
    addi $sp, $sp, -16
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)
    
    # set sum to 0
    li $s0, 0
    
    # set s1 to the address of the list
    addi $s1, $a0, 0
    
loop:    
    # traverse the list
    # if list is NULL, return
    beq $s1, $zero, finished
    
    # load the value from the list, which is the first position in each node
    lw $s2, 0($s1)
    
    # add the value to our running sum
    add $s0, $s0, $s2
    
    # load the next pointer into the current node pointer, which is the second position in each node
    # and repeat
    lw $s1, 4($s1)
    j loop
    
finished:
    addi $v0, $s0, 0 # set v0 to our result = s0

    # restore from the stack
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    addi $sp, $sp, 16
    
    # return 
    jr $ra

        .data
heap:   .space 80
