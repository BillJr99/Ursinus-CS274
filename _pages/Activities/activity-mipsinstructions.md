---
layout: activity
permalink: /Activities/MIPSInstructions
title: "CS274: Computer Architecture - The MIPS Assembly Language and Instructions"
excerpt: "CS274: Computer Architecture - The MIPS Assembly Language and Instructions"

info:
  goals:
    - To write a simple program using the instructions of the MIPS Assembly Language
    - To identify the three instruction formats of the MIPS Assembly Language
    - To relate the relatively few instructions and formats to the regularlity of the language design
    - To explain the function of a system call
    - To differentiate between registers and memory

  models:
    - model: |
        <div align="center">
        <code>A = 5 + 10</code>
        <br>
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
        .text
    
        .globl main
    
        main:
            li $t0, 5
            li $t1, 10
            add $t2, $t0, $t1
            
            # exit
            li $v0, 10
            syscall    
        ]]></script>
        </div>
      title: A First Program
      questions:
        - Using your best guess, write comments for each line of code.  What do you think they do?
        - Save and import this program into the MIPS Simulator and run it.  What happens?
        
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
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Instruction</th>
            <th class="tg-1wig">Note</th>
            <th class="tg-1wig">Type</th>
            <th class="tg-1wig">Example</th>
            <th class="tg-1wig">Effect</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">add</td>
            <td class="tg-0lax">Add two registers</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">add $t1, $t2, $t3</td>
            <td class="tg-0lax">t1 = t2 + t3</td>
          </tr>
          <tr>
            <td class="tg-1wig">subtract</td>
            <td class="tg-0lax">Subtract two registers</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">sub $t1, $t2, $t3</td>
            <td class="tg-0lax">t1 = t2 - t3</td>
          </tr>
          <tr>
            <td class="tg-1wig">add immediate (constant)</td>
            <td class="tg-0lax">Add a register and a 16-bit value</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">addi $t1, $t2, 10</td>
            <td class="tg-0lax">t1 = t2 + 10</td>
          </tr>
          <tr>
            <td class="tg-1wig"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-1wig">load word</td>
            <td class="tg-0lax">Load from memory at address register + immediate into a register</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">lw $s0, 4($sp)</td>
            <td class="tg-0lax">s0 = *(sp + 4)</td>
          </tr>
          <tr>
            <td class="tg-1wig">store word</td>
            <td class="tg-0lax">Store a register to memory at address register + immediate</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">sw $s0, 4($sp)</td>
            <td class="tg-0lax">*(sp + 4) = s0</td>
          </tr>
          <tr>
            <td class="tg-1wig">load immediate</td>
            <td class="tg-0lax">Store a 16-bit value in the lower half of a 32-bit register</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">li $t0, 100</td>
            <td class="tg-0lax">t0 = 100</td>
          </tr>
          <tr>
            <td class="tg-1wig">load upper immediate</td>
            <td class="tg-0lax">Store a 16-bit value in the upper half of a 32-bit register</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">lui $t0, 100</td>
            <td class="tg-0lax">t0 = (100 &lt;&lt; 16)</td>
          </tr>
          <tr>
            <td class="tg-1wig"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-1wig">and</td>
            <td class="tg-0lax">Bitwise and two registers</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">and $t1, $t2, $t3</td>
            <td class="tg-0lax">t1 = t2 &amp; t3</td>
          </tr>
          <tr>
            <td class="tg-1wig">or</td>
            <td class="tg-0lax">Bitwise or two registers</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">or $t1, $t2, $t3</td>
            <td class="tg-0lax">t1 = t2 | t3</td>
          </tr>
          <tr>
            <td class="tg-1wig">nor</td>
            <td class="tg-0lax">Bitwise nor two registers</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">nor $t1, $t2, $t3</td>
            <td class="tg-0lax">t1 = ~(t2 | t3)</td>
          </tr>
          <tr>
            <td class="tg-1wig">and immediate</td>
            <td class="tg-0lax">Bitwise and a register and a value</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">andi $t1, $t2, 4</td>
            <td class="tg-0lax">t1 = the value at the third least significant bit of t2</td>
          </tr>
          <tr>
            <td class="tg-1wig">or immediate</td>
            <td class="tg-0lax">Bitwise or a register and a value</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">ori $t1, $t2, 7</td>
            <td class="tg-0lax">t1 = the value of t2 but the least three significant bits are set to 1</td>
          </tr>
          <tr>
            <td class="tg-1wig">shift left logical</td>
            <td class="tg-0lax">Shift the bits of a register left</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">sll $t1, $t2, 1</td>
            <td class="tg-0lax">t1 = t2 &lt;&lt; 1 = t2 * 2</td>
          </tr>
          <tr>
            <td class="tg-1wig">shift right logical</td>
            <td class="tg-0lax">Shift the bits of a register right</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">srl $t1, $t2, 1</td>
            <td class="tg-0lax">t1 = t2 &gt;&gt; 1 = t2 / 2</td>
          </tr>
          <tr>
            <td class="tg-1wig">not</td>
            <td class="tg-0lax">???</td>
            <td class="tg-0lax">???</td>
            <td class="tg-0lax">???</td>
            <td class="tg-0lax">???</td>
          </tr>
          <tr>
            <td class="tg-1wig"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-1wig">branch if equal</td>
            <td class="tg-0lax">Move the program counter to its current location (the next instruction to execute) plus the immediate (can be specified as a label) if the registers are equal</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">beq $t1, $t2, 8</td>
            <td class="tg-0lax">t1 == t2? PC = PC + 4 + 8 : PC = PC + 4</td>
          </tr>
          <tr>
            <td class="tg-1wig">branch if not equal</td>
            <td class="tg-0lax">Move the program counter to its current location (the next instruction to execute) plus the immediate (can be specified as a label) if the registers are NOT equal</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">beq $t1, $t2, 8</td>
            <td class="tg-0lax">t1 != t2? PC = PC + 4 + 8 : PC = PC + 4</td>
          </tr>
          <tr>
            <td class="tg-1wig">set if less than</td>
            <td class="tg-0lax">Set the result to 1 if the source register is less than the target register, 0 otherwise</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">slt $t1, $t2, $t3</td>
            <td class="tg-0lax">t2 &lt; t3 ? t1 = 1: t1 = 0</td>
          </tr>
          <tr>
            <td class="tg-1wig">set if less than immediate</td>
            <td class="tg-0lax">Set the result to 1 if the source register is less than the immediate, 0 otherwise</td>
            <td class="tg-0lax">I</td>
            <td class="tg-0lax">slti $t1, $t2, 1</td>
            <td class="tg-0lax">t2 &lt; 1 ? t1 = 1: t1 = 0</td>
          </tr>
          <tr>
            <td class="tg-1wig">branch if less than</td>
            <td class="tg-0lax">???</td>
            <td class="tg-0lax">???</td>
            <td class="tg-0lax">???</td>
            <td class="tg-0lax">???</td>
          </tr>
          <tr>
            <td class="tg-1wig"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-1wig">jump</td>
            <td class="tg-0lax">Set the program counter to the jump target (augmented by the first 4 bits of the current program counter, and assuming the last two bits are 0 for word alignment)</td>
            <td class="tg-0lax">J</td>
            <td class="tg-0lax">j loop</td>
            <td class="tg-0lax">Set PC to the address of loop</td>
          </tr>
          <tr>
            <td class="tg-1wig">jump and link (function call)</td>
            <td class="tg-0lax">Same as jump, but set the jr register to the current program counter (the next instruction to execute) to enable a return</td>
            <td class="tg-0lax">J</td>
            <td class="tg-0lax">jal factorial</td>
            <td class="tg-0lax">Set PC to the address of factorial, set $ra to PC+4</td>
          </tr>
          <tr>
            <td class="tg-1wig">jump register (return)</td>
            <td class="tg-0lax">Set the program counter to the value in the register</td>
            <td class="tg-0lax">R</td>
            <td class="tg-0lax">jr $ra</td>
            <td class="tg-0lax">Set the PC to the value of $ra</td>
          </tr>
        </tbody>
        </table>
      title: Instructions of the MIPS Instruction Set
      questions:
        - Why do you think there are three different types of instructions?  Why couldn't they all use the same format?
        - "The <code>not</code> instruction does not exist in the language set.  What other bitwise instruction could you use to re-create a <code>not</code> behavior?"
        - "Similarly, the &quot;branch if less than&quot; instruction <code>blt</code> is a pseudoinstruction, and does not exist as a machine level language.  Instead, it translates to other existing MIPS instructions.  How could you implement this using two MIPS instructions?"
        - "Suppose you have two values in memory, and you wish to add them together.  How do you do it?"

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
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Register</th>
            <th class="tg-1wig">Number</th>
            <th class="tg-1wig">Type</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">$zero</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">$at</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">Assembler Temporary</td>
          </tr>
          <tr>
            <td class="tg-1wig">$v0 - $v1</td>
            <td class="tg-0lax">2 - 3</td>
            <td class="tg-0lax">Return Values</td>
          </tr>
          <tr>
            <td class="tg-1wig">$a0 - $a3</td>
            <td class="tg-0lax">4 - 7</td>
            <td class="tg-0lax">Procedure Arguments</td>
          </tr>
          <tr>
            <td class="tg-1wig">$t0 - $t7</td>
            <td class="tg-0lax">8 - 15</td>
            <td class="tg-0lax">Temporary Registers</td>
          </tr>
          <tr>
            <td class="tg-1wig">$s0 - $s7</td>
            <td class="tg-0lax">16 - 23</td>
            <td class="tg-0lax">Saved Registers (procedures must restore these values before returning)</td>
          </tr>
          <tr>
            <td class="tg-1wig">$t8 - $t9</td>
            <td class="tg-0lax">24 - 25</td>
            <td class="tg-0lax">Temporary Registers</td>
          </tr>
          <tr>
            <td class="tg-1wig">$k0 - $k1</td>
            <td class="tg-0lax">26 - 27</td>
            <td class="tg-0lax">Kernel Reigsters</td>
          </tr>
          <tr>
            <td class="tg-1wig">$gp</td>
            <td class="tg-0lax">28</td>
            <td class="tg-0lax">Global Pointer (procedures must restore)</td>
          </tr>
          <tr>
            <td class="tg-1wig">$sp</td>
            <td class="tg-0lax">29</td>
            <td class="tg-0lax">Stack Pointer (procedures must restore)</td>
          </tr>
          <tr>
            <td class="tg-1wig">$fp</td>
            <td class="tg-0lax">30</td>
            <td class="tg-0lax">Frame Pointer (procedures must restore)</td>
          </tr>
          <tr>
            <td class="tg-1wig">$ra</td>
            <td class="tg-0lax">31</td>
            <td class="tg-0lax">Return Address</td>
          </tr>
        </tbody>
        </table>
      title: Registers
      questions:
        - "What do you think is the difference between the <code>t</code> registers and the <code>s</code> registers?"
        - When might you use a <code>t</code> register as opposed to an <code>s</code> register in your program?"

    - model: |
        <div align="center">
        <code>printf("Hello, world!");</code>
        <br>
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
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
        ]]></script>
        </div>
      title: System Calls
      questions:
        - What do you think system call number 4 does, and what do you think system call number 10 does?
        - Save and import this program into the MIPS Simulator and run it.  What happens?

  additional_reading:
    - link: https://shawnzhong.github.io/JsSpim/
      title: JsSpim MIPS Simulator 
    - link: https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_Green_Sheet.pdf
      title: MIPS Reference Sheet
    - link: https://en.wikibooks.org/wiki/MIPS_Assembly/Instruction_Formats
      title: MIPS Assembly Formats
      
tags:
  - mips

---

