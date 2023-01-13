        .text
    
        .globl main
    
main:
    # print
    li $v0, 4
    la $a0, msg
    syscall
    
    # exit
    li $v0, 10
    syscall

        .data
msg:    .asciiz "Hello, world!"