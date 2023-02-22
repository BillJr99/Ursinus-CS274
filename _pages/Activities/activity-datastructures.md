---
layout: activity
permalink: /Activities/DataStructures
title: "CS274: Computer Architecture - Data Structures"
excerpt: "CS274: Computer Architecture - Data Structures"

info:
  goals:
    - To model and manipulate strings using MIPS
    - To explain the use of the null terminator when using strings
    - To model and manipulate arrays using MIPS
    - To model and manipulate linked lists using MIPS

  models:
    - model: |
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
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
        ]]></script>
      title: MIPS Strings
      questions:
        - "What is the difference between the <code>lb</code> instruction and the <code>lw</code> instruction?"
        - "Modify this program to convert each character of a String to uppercase, and then to lowercase."
    - model: |
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
            .text
        
            .globl main
        
        main:
            la $t0, arr     # t0 = the address of the array
            
            # set t1 to the value at the address size
            la $t1, size 
            lw $t1, 0($t1)
            
            # let t2 be i = 0
            li $t2, 0
            
            # let s0 be our sum
            li $s0, 0
            
        # for each word in the array (strings end with a 0 null terminator!)    
        loop:
            # are we at the end of the array? if i (t2) == size (t1), we are
            beq $t2, $t1, finished 
            
            # set the address to 4 * i + the base address of the array
            sll $t4, $t2, 2
            add $t3, $t0, $t4
            
            # load the word 
            lw $t5, 0($t3)  
            
            # and add it to our running sum
            add $s0, $s0, $t5
            
            addi $t2, $t2, 1 # i++
            j loop           # and continue
            
        finished:
            # print the sum
            li $v0, 1
            addi $a0, $s0, 0 # set a0 to the sum in s0
            syscall
            
            # exit
            li $v0, 10
            syscall

                .data
        arr:    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        size:   .word 10   
        ]]></script>
      title: MIPS Arrays
      questions:
        - "Now that you know what an array is, what is a string?"
        - "What is the difference between a string and an array, in terms of its size and how it is terminated?"
        - "Why was it necessary to multiply <code>i</code> by 4 before adding it to the base address of the array?"      
    - model: |
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
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
        ]]></script>
      title: Linked Lists in MIPS
      questions:
        - "In your own words, what is a linked list?"
        - "Modify this program by adding and calling a function to find and return the address of the node with the value 2."
        
tags:
  - mips
  - datastructures
  - strings
  - arrays
  - linkedlists

---

