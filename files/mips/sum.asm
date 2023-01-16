.data 
str1: .asciiz "Five plus two is: "

.text
main:
    # Make room on the stack
    sub $sp, $sp, 4 
    
    # Load the values 5 and 2 and add them together
    li $t0, 5
    li $t1, 2
    add $t2, $t0, $t1

    # Store the result on the stack
    sw $t2, 0($sp)

    # Print the string at the address specified by str1
    li $v0, 4
    la $a0, str1
    syscall
 
    # Print the sum from the stack
    li $v0, 1
    lw $a0, 0($sp)
    syscall

    # Pop the stack back to the way we found it
    add $sp, $sp, 4
    
    # ... and quit!
    li $v0, 10
    syscall