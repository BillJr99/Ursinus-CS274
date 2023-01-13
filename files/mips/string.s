        .text
    
        .globl main
    
main:
    la $t0, msg     # t0 = the address of the string
    
# for each character in the string (strings end with a 0 null terminator!)    
loop:
    # load the character (lb == load byte, similar to load word but 1 byte instead of 4)
    lb $t1, 0($t0)  
    
    # are we at the end of the string?
    beq $t1, $zero, finished 
    
    # if not, print the char
    li $v0, 11
    addi $a0, $t1, 0 # set a0 to the current character in t1
    syscall
    
    addi $t0, $t0, 1 # move to the next character in the string
    j loop           # and continue
    
finished:
    # exit
    li $v0, 10
    syscall

        .data
msg:    .asciiz "Hello, world!"