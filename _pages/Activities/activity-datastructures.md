---
layout: activity
permalink: /Activities/DataStructures
title: "CS274: Computer Architecture - Data Structures"


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

    - model: |
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <p>A one-page summary of data structures in MIPS.</p>
        <p><strong>Key address formulas:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Structure</th>
            <th class="tg-1wig">Address formula</th>
            <th class="tg-1wig">Micro-example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">Word array</td>
            <td class="tg-0lax">address of arr[i] = base + 4 &times; i</td>
            <td class="tg-0lax">arr at <code>0x10010000</code>: arr[3] lives at <code>0x1001000C</code>; compute 4i with <code>sll $t4, $t2, 2</code></td>
          </tr>
          <tr>
            <td class="tg-1wig">String (bytes)</td>
            <td class="tg-0lax">address of s[i] = base + 1 &times; i</td>
            <td class="tg-0lax">s at <code>0x10010000</code>: s[3] lives at <code>0x10010003</code>; step with <code>addi $t0, $t0, 1</code> and read with <code>lb</code></td>
          </tr>
          <tr>
            <td class="tg-1wig">Linked list node (value, next)</td>
            <td class="tg-0lax">value at node + 0; next pointer at node + 4</td>
            <td class="tg-0lax"><code>lw $s2, 0($s1)</code> reads the value; <code>lw $s1, 4($s1)</code> follows the arrow</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>Key rules:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Rule</th>
            <th class="tg-1wig">Micro-example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">Arrays end when a separately stored <em>size</em> counter runs out; strings end at a 0 byte (the null terminator).</td>
            <td class="tg-0lax">Loop on <code>beq $t2, $t1, done</code> (i == size) vs. <code>beq $t1, $zero, done</code> (char == 0)</td>
          </tr>
          <tr>
            <td class="tg-0lax"><code>lb</code>/<code>sb</code> move 1 byte; <code>lw</code>/<code>sw</code> move 4 bytes and need word-aligned addresses.</td>
            <td class="tg-0lax">Characters use <code>lb</code>; integers and pointers use <code>lw</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">A pointer is just an address in a register; NULL is 0, and <code>$zero</code> makes the test easy.</td>
            <td class="tg-0lax"><code>beq $s1, $zero, finished</code> stops a list traversal</td>
          </tr>
          <tr>
            <td class="tg-0lax">Array elements are contiguous (jump by index arithmetic); list nodes can live anywhere (follow next pointers one at a time).</td>
            <td class="tg-0lax">arr[7] is one multiply-and-add away; node 7 takes seven <code>lw ... 4(...)</code> hops</td>
          </tr>
          <tr>
            <td class="tg-0lax">ASCII arithmetic works on characters like numbers: 'a' - 'A' = 32.</td>
            <td class="tg-0lax">Uppercase a letter with <code>addi $t1, $t1, -32</code></td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>The linked list from this activity, drawn in memory</strong> (each node is value at offset 0, next at offset 4; the list reads 1 &rarr; 2 &rarr; 3):</p>
        <pre>
        heap base = &amp;heap (say 0x10010000)

        address        contents        meaning
        -----------    ------------    -------------------------------
        heap + 0       3               node C value
        heap + 4       0               node C next = NULL (end of list)
        heap + 8       2               node B value
        heap + 12      heap + 0        node B next --> node C
        heap + 16      1               node A value  (head of the list)
        heap + 20      heap + 8        node A next --> node B

        head = heap + 16:   [1 | *]--&gt;[2 | *]--&gt;[3 | NULL]
        </pre>
        <p><strong>Glossary:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Term</th>
            <th class="tg-1wig">One-line definition</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">Array</td>
            <td class="tg-0lax">A block of equal-size elements stored back to back, indexed by base + size &times; i.</td>
          </tr>
          <tr>
            <td class="tg-1wig">String</td>
            <td class="tg-0lax">An array of 1-byte characters ending with a 0 byte instead of a stored length.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Null terminator</td>
            <td class="tg-0lax">The 0 byte that marks the end of a string (<code>.asciiz</code> adds it for you).</td>
          </tr>
          <tr>
            <td class="tg-1wig">Pointer</td>
            <td class="tg-0lax">A register or memory word holding an address; dereference it with <code>lw</code>/<code>lb</code>.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Linked list</td>
            <td class="tg-0lax">Nodes scattered in memory, each holding a value and the address of the next node.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Node</td>
            <td class="tg-0lax">One element of a list: here two words, value at offset 0 and next at offset 4.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Traversal</td>
            <td class="tg-0lax">Visiting each element in order: increment an index (array) or follow next pointers (list) until NULL.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Heap</td>
            <td class="tg-0lax">The memory region for dynamically created data, like our hand-built list nodes.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Byte vs. word addressing</td>
            <td class="tg-0lax">Addresses count bytes, so consecutive words are 4 apart -- the reason for the <code>sll ... 2</code>.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
        
tags:
  - mips
  - datastructures
  - strings
  - arrays
  - linkedlists

---

