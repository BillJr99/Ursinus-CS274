---
layout: activity
permalink: /Activities/MIPSProcedures
title: "CS274: Computer Architecture - MIPS Procedures"
excerpt: "CS274: Computer Architecture - MIPS Procedures"

info:
  goals:
    - To read and write procedure calls
    - To save and restore the stack when calling procedures
    - To use registers and save registers according to standard MIPS calling conventions

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
        ]]></script>
      title: MIPS Procedures
      questions:
        - "Why was it important to set <code>a0</code> prior to executing <code>syscall 1</code> above?"
        - "Given that register values are 32 bits in size, why did we subtract 4 from the stack pointer prior to saving register <code>s0</code>, and add 4 back to it when restoring the register from memory?"
        - "Why was it necessary to save register <code>s0</code> to the stack in the <code>add5</code> function?"
        - "If we had used <code>t0</code> instead of <code>s0</code> in <code>add5</code>, would we have had to save it to the stack?  What is the significance of this?"
        
    - model: |
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
        .text
        .globl main
         
        main:
            la $t0, val1
            la $t1, val2
            
            lw $t2, 0($t0)
            lw $t3, 0($t1)
            
            sw $t2, 0($t1)
            sw $t3, 0($t0)
            
            # exit
            li $v0, 10
            syscall  
            
        .data
        val1: .word 5
        val2: .word 6
        ]]></script>
      title: Writing Procedures
      questions:
        - What does this program do?
        - "Modify this program to execute the algorithm in a procedure, using the argument registers to correspond to the two memory addresses to be swapped.  Call the procedure from <code>main</code>."
        

tags:
  - mips
  - procedures

---

