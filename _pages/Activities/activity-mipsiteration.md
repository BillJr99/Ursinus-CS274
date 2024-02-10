---
layout: activity
permalink: /Activities/MIPSIteration
title: "CS274: Computer Architecture - MIPS Iteration"


info:
  goals:
    - To implement iterative algorithms using the MIPS assembly language

  models:
    - model: |
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
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
        ]]></script>
        </div>
      title: An iterative MIPS program
      questions:
        - What kind of loop do you see depicted in this program?
        
    - model: |
        <script type="syntaxhighlighter" class="brush: c"><![CDATA[        
        int main(void) {
            int sum = 0;
            int i = 0;
            
            for(i = 0; i < 10; i++) {
                sum = sum + 1;
            }
            
            printf("%d", sum);
        }
        ]]></script>
        <br>
        <script type="syntaxhighlighter" class="brush: c"><![CDATA[        
        int main(void) {
            int num = 0;
            do {
                printf("Enter a number between 1 and 10\n");
                scanf(" %d", &num);
            } while(num < 1 || num > 10);
        }
        ]]></script>
      title: "Implementing Loops in MIPS"
      questions:
        - "Translate each of the above C code listings into a MIPS assembly program"         

tags:
  - mips
  - iteration
  - conditionals

---

