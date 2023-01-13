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
    
    # our secret number is 7!
    li $s0, 7
    
    # if v0 == our secret number s0
    beq $s0, $v0, correct
    
    # incorrect code
    li $v0, 4
    la $a0, wrong
    syscall       
    
    # but skip the correct code!
    j exit

correct:
    li $v0, 4
    la $a0, right
    syscall 

    # What would you add here to print "The secret number was: " followed by the integer 7, followed by a newline?
    
exit:
    # exit
    li $v0, 10
    syscall  
    
.data
    input: .asciiz "Can you guess my secret number between 1 and 10?  Enter it below\n"
    wrong: .asciiz "Not quite!\n"
    right: .asciiz "You guessed it!\n"