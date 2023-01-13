---
layout: activity
permalink: /Activities/MIPSConditionals
title: "CS274: Computer Architecture - MIPS Conditionals"
excerpt: "CS274: Computer Architecture - MIPS Conditionals"

info:
  goals:
    - "To implement <code>if</code> and <code>else</code> statements using MIPS assembly."

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
        ]]></script>
        </div>
      title: "An <code>if</code>/<code>else</code> statement in MIPS"
      questions:
        - "Translate the above code into a C, Java, or Python program.  What does it do?"
        - "What would happen if the <code>j exit</code> line was omitted?"
        - "How would you modify this program to print the secret number using a syscall?"
        - "Translate the <code>beq</code> instruction to machine language."
        
    - model: |
        <script type="syntaxhighlighter" class="brush: c"><![CDATA[        
        int main(void) {
            int grade = 93;
            
            if(grade > 90) {
                printf("A\n");
            } else if(grade > 80) {
                printf("B\n");
            } else {
                printf("C or lower\n");
            }
        }
        ]]></script>
      title: "Implementing MIPS Conditionals"
      questions:
        - "Translate the above C code into a MIPS assembly program"        

tags:
  - mips
  - conditionals

---

