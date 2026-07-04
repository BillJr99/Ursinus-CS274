---
layout: activity
permalink: /Activities/MIPSInstructions
title: "CS274: Computer Architecture - The MIPS Assembly Language and Instructions"


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
            <td class="tg-0lax">bne $t1, $t2, 8</td>
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
        - "When might you use a <code>t</code> register as opposed to an <code>s</code> register in your program?"

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
        <p>Every MIPS instruction, no matter what it does, is exactly 32 bits long.  Those 32 bits are chopped up into <em>fields</em>, and each field always lives at the same bit positions within its format.  Here is where each field sits (bit 31 is the leftmost/most significant bit, and bit 0 is the rightmost):</p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">R Format Field</th>
            <th class="tg-1wig">opcode</th>
            <th class="tg-1wig">rs</th>
            <th class="tg-1wig">rt</th>
            <th class="tg-1wig">rd</th>
            <th class="tg-1wig">shamt</th>
            <th class="tg-1wig">funct</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">Bit positions</td>
            <td class="tg-0lax">31-26</td>
            <td class="tg-0lax">25-21</td>
            <td class="tg-0lax">20-16</td>
            <td class="tg-0lax">15-11</td>
            <td class="tg-0lax">10-6</td>
            <td class="tg-0lax">5-0</td>
          </tr>
          <tr>
            <td class="tg-1wig">Width (bits)</td>
            <td class="tg-0lax">6</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">6</td>
          </tr>
          <tr>
            <td class="tg-1wig">Meaning</td>
            <td class="tg-0lax">always 0 for R type</td>
            <td class="tg-0lax">first source register</td>
            <td class="tg-0lax">second source register</td>
            <td class="tg-0lax">destination register</td>
            <td class="tg-0lax">shift amount (0 unless shifting)</td>
            <td class="tg-0lax">which R operation (add, sub, ...)</td>
          </tr>
        </tbody>
        </table>
        <br>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">I Format Field</th>
            <th class="tg-1wig">opcode</th>
            <th class="tg-1wig">rs</th>
            <th class="tg-1wig">rt</th>
            <th class="tg-1wig">immediate</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">Bit positions</td>
            <td class="tg-0lax">31-26</td>
            <td class="tg-0lax">25-21</td>
            <td class="tg-0lax">20-16</td>
            <td class="tg-0lax">15-0</td>
          </tr>
          <tr>
            <td class="tg-1wig">Width (bits)</td>
            <td class="tg-0lax">6</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">16</td>
          </tr>
          <tr>
            <td class="tg-1wig">Meaning</td>
            <td class="tg-0lax">which I instruction</td>
            <td class="tg-0lax">source register</td>
            <td class="tg-0lax">destination register (usually!)</td>
            <td class="tg-0lax">16-bit constant or offset (sign-extended)</td>
          </tr>
        </tbody>
        </table>
        <br>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">J Format Field</th>
            <th class="tg-1wig">opcode</th>
            <th class="tg-1wig">address</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">Bit positions</td>
            <td class="tg-0lax">31-26</td>
            <td class="tg-0lax">25-0</td>
          </tr>
          <tr>
            <td class="tg-1wig">Width (bits)</td>
            <td class="tg-0lax">6</td>
            <td class="tg-0lax">26</td>
          </tr>
          <tr>
            <td class="tg-1wig">Meaning</td>
            <td class="tg-0lax">2 for <code>j</code>, 3 for <code>jal</code></td>
            <td class="tg-0lax">26-bit word address of the jump target</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>Worked Example 1 (encode an R type): <code>add $t0, $s1, $s2</code></strong></p>
        <ol>
          <li>Identify the format: <code>add</code> is an R type instruction, so we need opcode, rs, rt, rd, shamt, and funct.</li>
          <li>Look up the register numbers: <code>$t0</code> = 8, <code>$s1</code> = 17, <code>$s2</code> = 18 (from the register table above).</li>
          <li>Match assembly positions to fields.  In assembly, the destination comes <em>first</em>: <code>add rd, rs, rt</code>.  So rd = <code>$t0</code> = 8, rs = <code>$s1</code> = 17, rt = <code>$s2</code> = 18.</li>
          <li>Look up opcode and funct: R type instructions have opcode = 0, and <code>add</code> has funct = 0x20 = 32.</li>
          <li>Convert each field to binary at its required width: opcode = <code>000000</code> (6 bits), rs = 17 = <code>10001</code> (5 bits), rt = 18 = <code>10010</code> (5 bits), rd = 8 = <code>01000</code> (5 bits), shamt = 0 = <code>00000</code> (5 bits), funct = 32 = <code>100000</code> (6 bits).</li>
          <li>Concatenate the fields left to right: <code>000000 10001 10010 01000 00000 100000</code>.</li>
          <li>Regroup the 32 bits into groups of 4 for hex: <code>0000 0010 0011 0010 0100 0000 0010 0000</code>.</li>
          <li>Convert each group of 4 to a hex digit: <code>0x02324020</code>.  Done!</li>
        </ol>
        <p><strong>Worked Example 2 (encode an I type): <code>lw $t0, 8($sp)</code></strong></p>
        <ol>
          <li>Identify the format: <code>lw</code> is an I type instruction, so we need opcode, rs, rt, and a 16-bit immediate.</li>
          <li>Look up the register numbers: <code>$t0</code> = 8 and <code>$sp</code> = 29.</li>
          <li>Match assembly positions to fields: for loads and stores, the register in parentheses is the <em>base address</em> register rs, and the register being loaded is rt.  So rs = <code>$sp</code> = 29, rt = <code>$t0</code> = 8, immediate = 8.</li>
          <li>Look up the opcode: <code>lw</code> has opcode 0x23 = 35.</li>
          <li>Convert each field to binary: opcode = 35 = <code>100011</code> (6 bits), rs = 29 = <code>11101</code> (5 bits), rt = 8 = <code>01000</code> (5 bits), immediate = 8 = <code>0000000000001000</code> (16 bits).</li>
          <li>Concatenate: <code>100011 11101 01000 0000000000001000</code>.</li>
          <li>Regroup into fours: <code>1000 1111 1010 1000 0000 0000 0000 1000</code>.</li>
          <li>Convert to hex: <code>0x8FA80008</code>.</li>
        </ol>
        <p><strong>Worked Example 3 (decode): what instruction is <code>0x012A4022</code>?</strong></p>
        <ol>
          <li>Convert each hex digit to 4 bits: <code>0000 0001 0010 1010 0100 0000 0010 0010</code>.</li>
          <li>Take the top 6 bits as the opcode: <code>000000</code> = 0.  An opcode of 0 means this is an R type instruction, so slice the rest using the R field widths.</li>
          <li>Slice the fields: rs = bits 25-21 = <code>01001</code> = 9, rt = bits 20-16 = <code>01010</code> = 10, rd = bits 15-11 = <code>01000</code> = 8, shamt = bits 10-6 = <code>00000</code> = 0, funct = bits 5-0 = <code>100010</code> = 0x22.</li>
          <li>Look up funct 0x22 on your reference sheet: it is <code>sub</code>.</li>
          <li>Translate register numbers back to names: 9 = <code>$t1</code>, 10 = <code>$t2</code>, 8 = <code>$t0</code>.</li>
          <li>Write the assembly with the destination first: <code>sub $t0, $t1, $t2</code>.</li>
        </ol>
        <p><strong>Now you try!</strong>  These are ordered from easier to harder.  Work each one on paper before peeking at the solution.</p>
        <p><strong>Problem 1 (easy):</strong> Encode <code>addi $t0, $t0, 1</code> to binary and hex.</p>
        <details><summary>Solution</summary>
        <ol>
          <li><code>addi</code> is I type with opcode 0x8 = <code>001000</code>.</li>
          <li>rs = source = <code>$t0</code> = 8 = <code>01000</code>; rt = destination = <code>$t0</code> = 8 = <code>01000</code> (I type destinations go in rt!).</li>
          <li>immediate = 1 = <code>0000000000000001</code>.</li>
          <li>Concatenate: <code>001000 01000 01000 0000000000000001</code> = <code>0010 0001 0000 1000 0000 0000 0000 0001</code> = <code>0x21080001</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 2 (easy-medium):</strong> Encode <code>and $s0, $t1, $t2</code> to binary and hex.  (<code>and</code> has funct 0x24.)</p>
        <details><summary>Solution</summary>
        <ol>
          <li>R type: opcode = <code>000000</code>, funct = 0x24 = <code>100100</code>.</li>
          <li>rd = <code>$s0</code> = 16 = <code>10000</code>, rs = <code>$t1</code> = 9 = <code>01001</code>, rt = <code>$t2</code> = 10 = <code>01010</code>, shamt = <code>00000</code>.</li>
          <li>Concatenate in field order (rd is third-from-left in machine code, even though it is first in assembly): <code>000000 01001 01010 10000 00000 100100</code>.</li>
          <li>Regroup: <code>0000 0001 0010 1010 1000 0000 0010 0100</code> = <code>0x012A8024</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 3 (medium):</strong> Encode <code>sll $t0, $t1, 4</code>.  Careful: shifts are R type, but they use the shamt field, and rs is unused (0).</p>
        <details><summary>Solution</summary>
        <ol>
          <li>opcode = <code>000000</code>, funct for <code>sll</code> = 0 = <code>000000</code>.</li>
          <li>rs = 0 = <code>00000</code> (unused), rt = source = <code>$t1</code> = 9 = <code>01001</code>, rd = destination = <code>$t0</code> = 8 = <code>01000</code>, shamt = 4 = <code>00100</code>.</li>
          <li>Concatenate: <code>000000 00000 01001 01000 00100 000000</code> = <code>0000 0000 0000 1001 0100 0001 0000 0000</code> = <code>0x00094100</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 4 (medium):</strong> Suppose <code>$t1</code> holds the address <code>0x10010020</code>.  What memory address does <code>sw $s0, -12($t1)</code> write to, and what is the machine encoding?  (<code>sw</code> has opcode 0x2B.)</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Effective address = base + offset = <code>0x10010020</code> + (-12).</li>
          <li>-12 in hex is -0xC, so <code>0x10010020</code> - <code>0xC</code> = <code>0x10010014</code>.  That is the address written.</li>
          <li>Encoding: opcode = 0x2B = <code>101011</code>, rs = <code>$t1</code> = 9 = <code>01001</code>, rt = <code>$s0</code> = 16 = <code>10000</code>.</li>
          <li>immediate = -12 as 16-bit two's complement: 12 = <code>0000000000001100</code>; invert to <code>1111111111110011</code>; add 1 to get <code>1111111111110100</code> = <code>0xFFF4</code>.</li>
          <li>Concatenate: <code>101011 01001 10000 1111111111110100</code> = <code>1010 1101 0011 0000 1111 1111 1111 0100</code> = <code>0xAD30FFF4</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 5 (medium-hard):</strong> Decode <code>0x8D0B0004</code> back into a MIPS assembly instruction.</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Binary: <code>1000 1101 0000 1011 0000 0000 0000 0100</code>.</li>
          <li>opcode = <code>100011</code> = 0x23 = <code>lw</code>, so this is I type.</li>
          <li>rs = <code>01000</code> = 8 = <code>$t0</code>, rt = <code>01011</code> = 11 = <code>$t3</code>, immediate = <code>0000000000000100</code> = 4.</li>
          <li>Assembly: <code>lw $t3, 4($t0)</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 6 (challenge):</strong> Decode <code>0x0810000A</code>.  What kind of instruction is it, and (assuming the upper 4 bits of PC+4 are 0) what address does it transfer control to?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Binary: <code>0000 1000 0001 0000 0000 0000 0000 1010</code>.</li>
          <li>opcode = <code>000010</code> = 2 = <code>j</code>, so this is J type.</li>
          <li>Take the remaining 26 bits (bits 25-0): <code>00 0001 0000 0000 0000 0000 1010</code> = <code>0x10000A</code>.</li>
          <li>Multiply by 4 (shift left 2) to restore the byte address: <code>0x10000A</code> &times; 4 = <code>0x400028</code>.</li>
          <li>Prepend the upper 4 bits of PC+4 (0000): the target is <code>0x00400028</code>.  So this is <code>j 0x00400028</code>.</li>
        </ol>
        </details>
        <br>
        <div align="center">
        <strong>Common Pitfalls</strong>
        </div>
        <ul>
          <li><strong>The destination moves!</strong>  In assembly, the destination register is written first, but in R type machine code the destination (rd) is the <em>third</em> register field.  In I type instructions, the destination is rt, the <em>second</em> register field.</li>
          <li><strong>Register names are not register numbers.</strong>  <code>$t0</code> is register 8, not register 0.  Always translate through the register table.</li>
          <li><strong>Immediates are sign-extended</strong> for <code>addi</code>, <code>lw</code>, <code>sw</code>, and branches, so <code>0xFFF4</code> means -12, not 65524.  (The logical instructions <code>andi</code> and <code>ori</code> zero-extend instead.)</li>
          <li><strong>Shift amounts go in shamt</strong>, not in an immediate field: <code>sll</code> and <code>srl</code> are R type even though they contain a constant.</li>
          <li><strong>Every instruction is exactly 32 bits.</strong>  If your concatenation doesn't have exactly 32 bits, one of your fields has the wrong width; pad each field with leading zeros to its full width.</li>
        </ul>
      title: "Practice: Translating and Encoding Instructions"
      questions:
        - "In Problem 1, the same register <code>$t0</code> appeared in two different fields.  Why is that not a problem for the hardware?"
        - "Make up an R type instruction of your own, encode it, and trade with a neighbor to decode each other's work."

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
        <p>Here is a one-page summary of the big ideas from this activity.  Keep it handy as a reference!</p>
        <p><strong>Key rules of the MIPS instruction set:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Rule</th>
            <th class="tg-1wig">Micro-example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">Every instruction is exactly 32 bits (one word), in one of just three formats: R, I, or J.</td>
            <td class="tg-0lax"><code>add</code> is R, <code>addi</code>/<code>lw</code>/<code>beq</code> are I, <code>j</code>/<code>jal</code> are J</td>
          </tr>
          <tr>
            <td class="tg-0lax">Arithmetic happens only between registers (or a register and an immediate); memory is touched only by loads and stores.</td>
            <td class="tg-0lax">To add two values in memory: <code>lw</code>, <code>lw</code>, <code>add</code>, then maybe <code>sw</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">There are 32 registers, numbered 0-31; <code>$zero</code> (register 0) is always 0.</td>
            <td class="tg-0lax"><code>add $t0, $t1, $zero</code> copies <code>$t1</code> into <code>$t0</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">The destination register is written first in assembly.</td>
            <td class="tg-0lax"><code>sub $t0, $t1, $t2</code> means t0 = t1 - t2</td>
          </tr>
          <tr>
            <td class="tg-0lax">Loads and stores compute their address as register + constant offset.</td>
            <td class="tg-0lax"><code>lw $s0, 4($sp)</code> reads the word at address sp + 4</td>
          </tr>
          <tr>
            <td class="tg-0lax">Immediates are 16 bits, so building a full 32-bit constant takes two instructions.</td>
            <td class="tg-0lax"><code>lui $t0, 0xABCD</code> then <code>ori $t0, $t0, 0x5678</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Some &quot;instructions&quot; are pseudoinstructions the assembler expands for you.</td>
            <td class="tg-0lax"><code>blt $t0, $t1, L</code> becomes <code>slt $at, $t0, $t1</code> + <code>bne $at, $zero, L</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">System calls request services from the OS: put the call number in <code>$v0</code>, arguments in <code>$a0</code>, then <code>syscall</code>.</td>
            <td class="tg-0lax"><code>li $v0, 1</code> + <code>syscall</code> prints the integer in <code>$a0</code>; call 10 exits</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>Instruction formats at a glance:</strong></p>
        <pre>
        R:  | opcode(6)=0 | rs(5) | rt(5) | rd(5) | shamt(5) | funct(6) |   e.g. add, sub, and, or, slt, sll, jr
        I:  | opcode(6)   | rs(5) | rt(5) |      immediate(16)         |   e.g. addi, lw, sw, beq, bne, li (pseudo)
        J:  | opcode(6)   |              address(26)                   |   e.g. j, jal
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
            <td class="tg-1wig">Register</td>
            <td class="tg-0lax">A 32-bit storage location inside the processor; MIPS has 32 of them.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Immediate</td>
            <td class="tg-0lax">A constant value baked directly into an instruction (16 bits in MIPS I types).</td>
          </tr>
          <tr>
            <td class="tg-1wig">Opcode</td>
            <td class="tg-0lax">The top 6 bits of every instruction, telling the processor which operation (or format) it is.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Program Counter (PC)</td>
            <td class="tg-0lax">The register holding the address of the instruction being fetched; normally advances by 4.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Word</td>
            <td class="tg-0lax">4 bytes (32 bits): the size of a MIPS register, instruction, and <code>lw</code>/<code>sw</code> transfer.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Pseudoinstruction</td>
            <td class="tg-0lax">A convenience instruction (like <code>li</code>, <code>blt</code>, <code>move</code>) the assembler translates into real instructions.</td>
          </tr>
          <tr>
            <td class="tg-1wig">System call</td>
            <td class="tg-0lax">A request to the operating system (print, read, exit) made with the <code>syscall</code> instruction.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Label</td>
            <td class="tg-0lax">A name for an address in your program, used as a branch or jump target or a data location.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Saved vs. temporary registers</td>
            <td class="tg-0lax"><code>$s</code> registers must be preserved across procedure calls; <code>$t</code> registers may be overwritten.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

  additional_reading:
    - link: https://www.billmongan.com/JsSpim/
      title: JsSpim MIPS Simulator by Shawn Zhong
    - link: https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_Green_Sheet.pdf
      title: MIPS Reference Sheet
    - link: https://en.wikibooks.org/wiki/MIPS_Assembly/Instruction_Formats
      title: MIPS Assembly Formats
    - link: https://courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html
      title: MIPS System Call Table
      
tags:
  - mips

---

