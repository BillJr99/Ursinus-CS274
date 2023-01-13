.text
.globl main
 
main:
    # print user prompt string
    li $v0, 4
    la $a0, input
    syscall    
    
guess:
    # read integer - will be copied to v0
    li $v0, 5
    syscall
    
    # our secret number is 7!
    li $s0, 7
    
    # if v0 == our secret number s0
    beq $s0, $v0, correct
    
    # incorrect code
    li $v0, 4
    la $a0, wrong
    syscall       
    
    # loop until the user gets it right
    j guess

correct:
    li $v0, 4
    la $a0, right
    syscall       
    
exit:
    # exit
    li $v0, 10
    syscall  
    
.data
    input: .asciiz "Can you guess my secret number between 1 and 10?  Enter it below\n"
    wrong: .asciiz "Not quite!\n"
    right: .asciiz "You guessed it!\n"