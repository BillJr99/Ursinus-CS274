.text
.globl main
 
main:
    # print user prompt string
    li $v0, 4
    la $a0, input
    syscall    
    
    # read integer - will be copied to v0
    li $v0, 5
    syscall

    # call procedure
    addi $a0, $v0, 0 # set a0 to the v0 value that the user just typed in
    jal add5
    
    # print the answer: be sure to set a0 before v0 so we don't lose it!
    addi $a0, $v0, 0 # print the value that add5 just returned as v0
    li $v0, 1
    syscall
    
    # exit
    li $v0, 10
    syscall  
    
add5:
    # Save one register on the stack
    addi $sp, $sp, -4
    sw $s0, 0($sp)
    
    # add 5 to the input argument, and set it to the return value
    li $s0, 5
    add $v0, $a0, $s0
    
    # Restore the register from the stack
    lw $s0, 0($sp)
    addi $sp, $sp, 4
    
    # return
    jr $ra
    
.data
input: .asciiz "Enter an integer\n"