---
layout: activity
permalink: /Activities/MIPSProcedures
title: "CS274: Computer Architecture - MIPS Procedures"


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
        - "Why is the <code>syscall 10</code> call important in this code?  What would happen if it was not present?"
        
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
        <p>A one-page summary of MIPS procedure calls.</p>
        <p><strong>The calling convention -- who uses which register:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Registers</th>
            <th class="tg-1wig">Purpose</th>
            <th class="tg-1wig">Who must preserve them</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">$a0 - $a3</td>
            <td class="tg-0lax">Arguments into a procedure</td>
            <td class="tg-0lax">Caller (they may be overwritten)</td>
          </tr>
          <tr>
            <td class="tg-1wig">$v0 - $v1</td>
            <td class="tg-0lax">Return values out of a procedure</td>
            <td class="tg-0lax">Nobody -- they carry the answer back</td>
          </tr>
          <tr>
            <td class="tg-1wig">$t0 - $t9</td>
            <td class="tg-0lax">Temporaries</td>
            <td class="tg-0lax">Caller: save them yourself before <code>jal</code> if you still need them</td>
          </tr>
          <tr>
            <td class="tg-1wig">$s0 - $s7</td>
            <td class="tg-0lax">Saved values</td>
            <td class="tg-0lax">Callee: a procedure that uses one must save and restore it on the stack</td>
          </tr>
          <tr>
            <td class="tg-1wig">$ra</td>
            <td class="tg-0lax">Return address, set by <code>jal</code></td>
            <td class="tg-0lax">Callee, but only if it calls another procedure</td>
          </tr>
          <tr>
            <td class="tg-1wig">$sp</td>
            <td class="tg-0lax">Stack pointer: address of the top stack word</td>
            <td class="tg-0lax">Callee: whatever you subtract, add back before <code>jr $ra</code></td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>The call/return recipe:</strong></p>
        <ol>
          <li>Caller places arguments in <code>$a0</code>-<code>$a3</code>, then executes <code>jal proc</code> (sets <code>$ra</code> = PC + 4 and jumps).</li>
          <li>Callee prologue: make room and save what the convention requires -- e.g. <code>addi $sp, $sp, -8</code>, <code>sw $ra, 4($sp)</code>, <code>sw $s0, 0($sp)</code>.  (Each saved register is one word = 4 bytes; the stack grows <em>downward</em>.)</li>
          <li>Callee does its work and puts the result in <code>$v0</code>.</li>
          <li>Callee epilogue: restore in reverse -- <code>lw $s0, 0($sp)</code>, <code>lw $ra, 4($sp)</code>, <code>addi $sp, $sp, 8</code> -- then <code>jr $ra</code>.</li>
          <li>Caller finds the answer in <code>$v0</code>.  Micro-example: <code>add5</code> above saved one register, so it moved <code>$sp</code> by exactly 4 down and 4 back up.</li>
        </ol>
        <p><strong>Stack frame layout</strong> (higher addresses at the top; <code>$sp</code> points at the last word pushed):</p>
        <pre>
        higher addresses
        +------------------------+
        |  caller's frame        |
        +------------------------+  &lt;- $sp before the call
        |  saved $ra             |   4($sp)
        +------------------------+
        |  saved $s0             |   0($sp)
        +------------------------+  &lt;- $sp during the callee (after addi $sp, $sp, -8)
        |  (free space)          |
        lower addresses ... the stack grows DOWN
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
            <td class="tg-1wig">Caller / Callee</td>
            <td class="tg-0lax">The procedure making the call / the procedure being called.</td>
          </tr>
          <tr>
            <td class="tg-1wig"><code>jal</code></td>
            <td class="tg-0lax">Jump-and-link: saves the return address (PC + 4) in <code>$ra</code>, then jumps.</td>
          </tr>
          <tr>
            <td class="tg-1wig"><code>jr $ra</code></td>
            <td class="tg-0lax">Jump-register: returns by setting the PC to the address in <code>$ra</code>.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Stack frame (activation record)</td>
            <td class="tg-0lax">The block of stack memory one procedure call uses for its saved registers and locals.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Prologue / Epilogue</td>
            <td class="tg-0lax">The entry code that saves registers / the exit code that restores them, in reverse order.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Caller-saved vs. callee-saved</td>
            <td class="tg-0lax"><code>$t</code> registers are the caller's problem; <code>$s</code> registers, <code>$sp</code>, and <code>$ra</code> are the callee's.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Calling convention</td>
            <td class="tg-0lax">The shared agreement about registers and the stack that lets any procedure call any other.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Push / Pop</td>
            <td class="tg-0lax">Push = <code>addi $sp, $sp, -4</code> + <code>sw</code>; pop = <code>lw</code> + <code>addi $sp, $sp, 4</code>.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
        

tags:
  - mips
  - procedures

---

