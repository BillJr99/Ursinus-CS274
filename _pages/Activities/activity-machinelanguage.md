---
layout: activity
permalink: /Activities/MachineLanguage
title: "CS274: Computer Architecture - From MIPS to Machine Language"
excerpt: "CS274: Computer Architecture - From MIPS to Machine Language"

info:
  goals:
    - To translate between MIPS assembly instructions and MIPS 32-bit machine language
    - To explain that all MIPS assembly instructions are 32 bits in size, regardless of format

  models:
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
            <th class="tg-1wig">R Type</th>
            <th class="tg-1wig">opcode</th>
            <th class="tg-1wig">rs</th>
            <th class="tg-1wig">rt</th>
            <th class="tg-1wig">rd</th>
            <th class="tg-1wig">shamt</th>
            <th class="tg-1wig">function</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">bits</td>
            <td class="tg-0lax">6</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">6</td>
          </tr>
          <tr>
            <td class="tg-0lax">add $t0, $t1, $t2</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">$t1 = 9</td>
            <td class="tg-0lax">$t2 = 10</td>
            <td class="tg-0lax">$t0 = 8</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0x20</td>
          </tr>
          <tr>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-1wig">I Type</td>
            <td class="tg-1wig">opcode</td>
            <td class="tg-1wig">rs</td>
            <td class="tg-1wig">rt</td>
            <td class="tg-1wig" colspan="3">immediate</td>
          </tr>
          <tr>
            <td class="tg-0lax">bits</td>
            <td class="tg-0lax">6</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax" colspan="3">16</td>
          </tr>
          <tr>
            <td class="tg-0lax">addi $s0, $s1, 100</td>
            <td class="tg-0lax">0x8</td>
            <td class="tg-0lax">$s1 = 17</td>
            <td class="tg-0lax">$s0 = 16</td>
            <td class="tg-0lax" colspan="3">100</td>
          </tr>
          <tr>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-1wig">J type</td>
            <td class="tg-1wig">opcode</td>
            <td class="tg-1wig" colspan="5">jump-address</td>
          </tr>
          <tr>
            <td class="tg-0lax">bits</td>
            <td class="tg-0lax">6</td>
            <td class="tg-0lax" colspan="5">26</td>
          </tr>
          <tr>
            <td class="tg-0lax">j loop</td>
            <td class="tg-0lax">0x2</td>
            <td class="tg-0lax" colspan="5">10010001101</td>
          </tr>
          <tr>
            <td class="tg-0lax" colspan="7">assuming the address of loop is 0x80001234 (0b10000000000000000001001000110100)</td>
          </tr>
          <tr>
            <td class="tg-0lax" colspan="7">and PC+4 is 0x80000000</td>
          </tr>
        </tbody>
        </table>
      title: Instruction Formats
      questions:
        - "A jump instruction allows 26 bits for the jump address, but addresses are 32 bits in length.  Why can't we allow a 32-bit jump address in an instruction, and what do you think is done instead?"  
        - "Why are all addresses and instructions 32 bits in size?"
        - "Where is the &quot;answer&quot; register (<code>rd</code> in an R type instruction, and <code>rt</code> in an I type instruction) typically found in a MIPS assembly instruction, and where is it typically found in the machine code translation?"
        - "The <code>shamt</code> field holds the number of bits that a register shifts left or right.  In your MIPS reference sheet, look up what instruction would consist of all 0 bits.  What might you call this instruction, and what does it do?"
        - "How can you tell if an instruction is R type or not?  If it is not R type, how can you tell if it is J type or I type?"
        - "Why do you think the designers stopped at only 3 instruction formats?"
        - "Translate the instruction <code>addi $t1, $t2, $t3</code> to a MIPS 32 bit machine instruction."
        - "Translate the 32 bit instruction 0x00571020 from hexidecimal to binary, and then to a MIPS assembly instruction."
        
    - model: |
        <div align="center">
        <code>printf("Hello, world!");</code>
        <br>
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
                .text
            
                .globl main
            
        main: 
            # print
            li $a0, 4       # suppose this is address 0x00400024
            jal procedure   # what is this instruction in binary?
            
            # exit
            li $v0, 10
            syscall

        procedure: 
            addi $v0, $a0, 1 # what is this address?
            jr $ra
        ]]></script>
        </div>
      title: Translating jump instructions
      questions:
        - What do you think this program does?
        - "Suppose the first line of <code>main</code> is instruction address <code>0x00400024</code>.  What is the address of the first instruction at label <code>procedure</code>?  What is the binary translation of the <code>jal</code> instruction above?"

  additional_reading:
    - link: ../MIPSInstructions
      title: Review of the MIPS Instruction Set

tags:
  - mips

---

