---
layout: activity
permalink: /Activities/MachineLanguage
title: "CS274: Computer Architecture - From MIPS to Machine Language"


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
        - "Translate the 32 bit instruction 0x00571020 from hexidecimal to binary, and then to a MIPS assembly instruction.  How can you tell just by looking at the hexidecimal that it's an R-type instruction?"
        - "What instructions might implement the pseudoinstruction li $t0, 0xabcd5678?  Why can't this instruction be represented with a single operation?"

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
        <p>Let's put the formats to work.  First, memorize (or bookmark!) the exact bit positions of every field.  Bit 31 is the leftmost (most significant) bit and bit 0 is the rightmost:</p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Format</th>
            <th class="tg-1wig">Bits 31-26</th>
            <th class="tg-1wig">Bits 25-21</th>
            <th class="tg-1wig">Bits 20-16</th>
            <th class="tg-1wig">Bits 15-11</th>
            <th class="tg-1wig">Bits 10-6</th>
            <th class="tg-1wig">Bits 5-0</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">R</td>
            <td class="tg-0lax">opcode (6) = 0</td>
            <td class="tg-0lax">rs (5)</td>
            <td class="tg-0lax">rt (5)</td>
            <td class="tg-0lax">rd (5)</td>
            <td class="tg-0lax">shamt (5)</td>
            <td class="tg-0lax">funct (6)</td>
          </tr>
          <tr>
            <td class="tg-1wig">I</td>
            <td class="tg-0lax">opcode (6)</td>
            <td class="tg-0lax">rs (5)</td>
            <td class="tg-0lax">rt (5)</td>
            <td class="tg-0lax" colspan="3">immediate (16), bits 15-0, sign-extended</td>
          </tr>
          <tr>
            <td class="tg-1wig">J</td>
            <td class="tg-0lax">opcode (6)</td>
            <td class="tg-0lax" colspan="5">address (26), bits 25-0</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>Worked Example 1 (encode an R type): <code>sub $s0, $s1, $s2</code></strong></p>
        <ol>
          <li>Format: <code>sub</code> is R type (opcode 0, funct 0x22).</li>
          <li>Register numbers: <code>$s0</code> = 16, <code>$s1</code> = 17, <code>$s2</code> = 18.</li>
          <li>Assembly order is <code>sub rd, rs, rt</code>, so rd = 16, rs = 17, rt = 18.</li>
          <li>Fields in binary at full width: opcode = <code>000000</code>, rs = 17 = <code>10001</code>, rt = 18 = <code>10010</code>, rd = 16 = <code>10000</code>, shamt = <code>00000</code>, funct = 0x22 = 34 = <code>100010</code>.</li>
          <li>Concatenate: <code>000000 10001 10010 10000 00000 100010</code>.</li>
          <li>Regroup into fours: <code>0000 0010 0011 0010 1000 0000 0010 0010</code>.</li>
          <li>Hex digit by hex digit: <code>0x02328022</code>.</li>
        </ol>
        <p><strong>Worked Example 2 (encode an I type): <code>addi $t1, $sp, 16</code></strong></p>
        <ol>
          <li>Format: <code>addi</code> is I type with opcode 0x8.</li>
          <li>Register numbers: <code>$t1</code> = 9, <code>$sp</code> = 29.</li>
          <li>For I types the destination is rt: rt = <code>$t1</code> = 9, rs = <code>$sp</code> = 29, immediate = 16.</li>
          <li>Fields in binary: opcode = 8 = <code>001000</code>, rs = 29 = <code>11101</code>, rt = 9 = <code>01001</code>, immediate = 16 = <code>0000000000010000</code>.</li>
          <li>Concatenate: <code>001000 11101 01001 0000000000010000</code>.</li>
          <li>Regroup: <code>0010 0011 1010 1001 0000 0000 0001 0000</code>.</li>
          <li>Hex: <code>0x23A90010</code>.</li>
        </ol>
        <p><strong>Worked Example 3 (decode): what is <code>0xAE1100F0</code>?</strong></p>
        <ol>
          <li>Hex to binary: <code>1010 1110 0001 0001 0000 0000 1111 0000</code>.</li>
          <li>opcode = top 6 bits = <code>101011</code> = 0x2B.  Not zero, so it isn't R type; look up 0x2B: it is <code>sw</code>, an I type.</li>
          <li>Slice I type fields: rs = <code>10000</code> = 16 = <code>$s0</code>, rt = <code>10001</code> = 17 = <code>$s1</code>, immediate = <code>0000000011110000</code> = 0xF0 = 240.</li>
          <li>For a store, rt is the register being <em>stored</em> and rs is the base address: <code>sw $s1, 240($s0)</code>.</li>
        </ol>
        <p><strong>Now you try!</strong>  Ordered from easier to harder; solve on paper first, then check.</p>
        <p><strong>Problem 1 (easy):</strong> Encode <code>or $t0, $t1, $zero</code>.  (<code>or</code> has funct 0x25.)</p>
        <details><summary>Solution</summary>
        <ol>
          <li>R type: opcode = <code>000000</code>, funct = 0x25 = <code>100101</code>.</li>
          <li>rd = <code>$t0</code> = 8 = <code>01000</code>, rs = <code>$t1</code> = 9 = <code>01001</code>, rt = <code>$zero</code> = 0 = <code>00000</code>, shamt = <code>00000</code>.</li>
          <li>Concatenate: <code>000000 01001 00000 01000 00000 100101</code> = <code>0000 0001 0010 0000 0100 0000 0010 0101</code> = <code>0x01204025</code>.</li>
          <li>Bonus: this is exactly how the assembler implements the pseudoinstruction <code>move $t0, $t1</code>!</li>
        </ol>
        </details>
        <p><strong>Problem 2 (easy-medium):</strong> Encode <code>slt $t0, $s3, $s4</code>.  (<code>slt</code> has funct 0x2A.)</p>
        <details><summary>Solution</summary>
        <ol>
          <li>R type: opcode = <code>000000</code>, funct = 0x2A = <code>101010</code>.</li>
          <li>rd = <code>$t0</code> = 8 = <code>01000</code>, rs = <code>$s3</code> = 19 = <code>10011</code>, rt = <code>$s4</code> = 20 = <code>10100</code>, shamt = <code>00000</code>.</li>
          <li>Concatenate: <code>000000 10011 10100 01000 00000 101010</code> = <code>0000 0010 0111 0100 0100 0000 0010 1010</code> = <code>0x0274402A</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 3 (medium):</strong> Suppose <code>$gp</code> holds <code>0x10008000</code>.  What effective address does <code>lw $s0, 20($gp)</code> read from, and what is its encoding?  (<code>lw</code> has opcode 0x23.)</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Effective address = base + offset = <code>0x10008000</code> + 20.</li>
          <li>20 in hex is 0x14, so the address is <code>0x10008014</code>.</li>
          <li>Encoding: opcode = 0x23 = <code>100011</code>, rs = <code>$gp</code> = 28 = <code>11100</code>, rt = <code>$s0</code> = 16 = <code>10000</code>, immediate = 20 = <code>0000000000010100</code>.</li>
          <li>Concatenate: <code>100011 11100 10000 0000000000010100</code> = <code>1000 1111 1001 0000 0000 0000 0001 0100</code> = <code>0x8F900014</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 4 (medium):</strong> Decode <code>0x21290001</code>.</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Binary: <code>0010 0001 0010 1001 0000 0000 0000 0001</code>.</li>
          <li>opcode = <code>001000</code> = 0x8 = <code>addi</code> (I type).</li>
          <li>rs = <code>01001</code> = 9 = <code>$t1</code>, rt = <code>01001</code> = 9 = <code>$t1</code>, immediate = 1.</li>
          <li>Assembly: <code>addi $t1, $t1, 1</code> -- an increment!</li>
        </ol>
        </details>
        <p><strong>Problem 5 (medium-hard):</strong> Decode <code>0x02114020</code>.</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Binary: <code>0000 0010 0001 0001 0100 0000 0010 0000</code>.</li>
          <li>opcode = <code>000000</code>, so R type; slice all six fields.</li>
          <li>rs = <code>10000</code> = 16 = <code>$s0</code>, rt = <code>10001</code> = 17 = <code>$s1</code>, rd = <code>01000</code> = 8 = <code>$t0</code>, shamt = <code>00000</code>, funct = <code>100000</code> = 0x20 = <code>add</code>.</li>
          <li>Assembly (destination first): <code>add $t0, $s0, $s1</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 6 (challenge):</strong> Suppose <code>$fp</code> holds <code>0x7FFFEFFC</code>.  What address does <code>sw $t2, -8($fp)</code> write to, and what is its encoding?  (<code>sw</code> has opcode 0x2B.)</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Effective address = <code>0x7FFFEFFC</code> + (-8) = <code>0x7FFFEFFC</code> - <code>0x8</code> = <code>0x7FFFEFF4</code>.</li>
          <li>Encoding: opcode = 0x2B = <code>101011</code>, rs = <code>$fp</code> = 30 = <code>11110</code>, rt = <code>$t2</code> = 10 = <code>01010</code>.</li>
          <li>immediate = -8 in 16-bit two's complement: 8 = <code>0000000000001000</code>; invert: <code>1111111111110111</code>; add 1: <code>1111111111111000</code> = <code>0xFFF8</code>.</li>
          <li>Concatenate: <code>101011 11110 01010 1111111111111000</code> = <code>1010 1111 1100 1010 1111 1111 1111 1000</code> = <code>0xAFCAFFF8</code>.</li>
        </ol>
        </details>
        <br>
        <div align="center">
        <strong>Common Pitfalls</strong>
        </div>
        <ul>
          <li><strong>rd vs. rt:</strong> the destination is the rd field for R types but the rt field for I types -- and in assembly it is always written first, so its machine-code position <em>moves</em> depending on the format.</li>
          <li><strong>Register names vs. numbers:</strong> <code>$s0</code> is register 16 and <code>$t0</code> is register 8; never encode the digit in the name.</li>
          <li><strong>Sign extension:</strong> immediates for <code>addi</code>, <code>lw</code>, <code>sw</code>, <code>beq</code>, and <code>bne</code> are sign-extended 16-bit two's complement values; <code>0xFFF8</code> means -8.  <code>andi</code>/<code>ori</code> zero-extend instead.</li>
          <li><strong>Width discipline:</strong> pad every field to its exact width (5 or 6 or 16 bits) before concatenating; the total must be exactly 32 bits.</li>
          <li><strong>Loads/stores read the offset in bytes:</strong> <code>lw $s0, 4($sp)</code> means 4 <em>bytes</em> past <code>$sp</code>, which is only one word away.</li>
        </ul>
      title: "Practice: Translating and Encoding Instructions"
      questions:
        - "Decode a classmate's favorite hex word.  What happens if the opcode isn't a legal MIPS opcode?"
        - "Why can you decode any 32-bit word uniquely -- that is, why is it impossible for one word to be two different instructions?"

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

    - model: |
        <p>When you write <code>beq $t0, $t1, mylabel</code>, the assembler does not store the address of <code>mylabel</code> in the instruction -- there isn't room!  Instead it stores a <em>word offset</em> relative to the instruction after the branch.  Here is the recipe:</p>
        <p><strong>Branch offset recipe (PC-relative addressing):</strong></p>
        <ol>
          <li>Compute the address of the instruction <em>after</em> the branch: <code>PC + 4</code>.  (By the time the branch executes, the PC has already moved on.)</li>
          <li>Subtract: <code>byte offset = target address - (PC + 4)</code>.  This can be negative for backward branches!</li>
          <li>Divide by 4 to convert bytes to words: <code>word offset = byte offset / 4</code>.  (Instructions are word-aligned, so the bottom two bits are always 0 -- why waste them?)</li>
          <li>Write the word offset as a 16-bit two's complement immediate.</li>
        </ol>
        <p><strong>Worked example:</strong> a <code>beq</code> at address <code>0x00400018</code> branches back to a loop at <code>0x00400008</code>.</p>
        <ol>
          <li>PC + 4 = <code>0x00400018</code> + 4 = <code>0x0040001C</code>.</li>
          <li>byte offset = <code>0x00400008</code> - <code>0x0040001C</code> = <code>-0x14</code> = -20 bytes.</li>
          <li>word offset = -20 / 4 = -5 words.</li>
          <li>-5 as a 16-bit two's complement value: 5 = <code>0000000000000101</code>; invert: <code>1111111111111010</code>; add 1: <code>1111111111111011</code> = <code>0xFFFB</code>.  That is the immediate stored in the instruction.</li>
        </ol>
        <p>Jumps work differently: <code>j</code> and <code>jal</code> use <em>pseudo-direct addressing</em>.  The 26-bit field holds the target's word address, and the hardware rebuilds the full 32-bit byte address like this:</p>
        <pre>
        target = { (PC+4)[31:28] , address field (26 bits) , 00 }
                    4 bits          26 bits                  2 bits  = 32 bits
        </pre>
        <p><strong>Worked example:</strong> a <code>j</code> at address <code>0x00400030</code> targets <code>0x00400020</code>.</p>
        <ol>
          <li>The target's bottom two bits are 00 (word aligned), so drop them: <code>0x00400020</code> / 4 = <code>0x00100008</code>.  This fits in 26 bits, so it becomes the address field.</li>
          <li>Check the top 4 bits: the target <code>0x00400020</code> and PC + 4 = <code>0x00400034</code> both start with <code>0000</code>, so the jump is legal (same 256 MB region).</li>
          <li>Assemble the word: opcode <code>000010</code> followed by the 26-bit field.  Numerically: (2 &lt;&lt; 26) + <code>0x00100008</code> = <code>0x08000000</code> + <code>0x00100008</code> = <code>0x08100008</code>.</li>
        </ol>
        <p><strong>Now you try!</strong></p>
        <p><strong>Problem 1 (forward branch):</strong> A <code>beq $t0, $t1, done</code> sits at address <code>0x00400020</code>, and <code>done</code> is at <code>0x00400034</code>.  What immediate is stored?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>PC + 4 = <code>0x00400024</code>.</li>
          <li>byte offset = <code>0x00400034</code> - <code>0x00400024</code> = <code>0x10</code> = 16 bytes.</li>
          <li>word offset = 16 / 4 = 4 words.</li>
          <li>immediate = <code>0x0004</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 2 (backward branch):</strong> A <code>bne $t0, $zero, loop</code> sits at <code>0x0040004C</code>, and <code>loop</code> is at <code>0x00400038</code>.  What immediate is stored?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>PC + 4 = <code>0x00400050</code>.</li>
          <li>byte offset = <code>0x00400038</code> - <code>0x00400050</code> = <code>-0x18</code> = -24 bytes.</li>
          <li>word offset = -24 / 4 = -6 words.</li>
          <li>-6 in 16-bit two's complement: 6 = <code>0000000000000110</code>; invert: <code>1111111111111001</code>; add 1: <code>1111111111111010</code> = <code>0xFFFA</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 3 (decode an offset):</strong> A branch instruction at address <code>0x00400008</code> has immediate <code>0x000A</code>.  Where does it branch to if taken?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>immediate = <code>0x000A</code> = 10 words = 40 bytes.</li>
          <li>PC + 4 = <code>0x0040000C</code>.</li>
          <li>target = <code>0x0040000C</code> + 40 = <code>0x0040000C</code> + <code>0x28</code> = <code>0x00400034</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 4 (jump encode):</strong> Encode <code>j</code> to the target <code>0x00403100</code> (assume the PC is nearby in the same region).</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Drop the bottom two bits: <code>0x00403100</code> / 4 = <code>0x00100C40</code>.</li>
          <li>Opcode for <code>j</code> is 2: word = (2 &lt;&lt; 26) + <code>0x00100C40</code> = <code>0x08000000</code> + <code>0x00100C40</code> = <code>0x08100C40</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 5 (jump decode):</strong> Decode <code>0x0C100020</code>, assuming the upper 4 bits of PC + 4 are <code>0000</code>.  What does the instruction do?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>Binary: <code>0000 1100 0001 0000 0000 0000 0010 0000</code>; opcode = <code>000011</code> = 3 = <code>jal</code>.</li>
          <li>address field = the low 26 bits = <code>0x0100020</code>.</li>
          <li>target = field &times; 4 = <code>0x0400080</code>; prepend PC's top 4 bits (0000): <code>0x00400080</code>.</li>
          <li>So this is <code>jal 0x00400080</code>: it sets <code>$ra</code> to PC + 4 and jumps to <code>0x00400080</code> -- a procedure call.</li>
        </ol>
        </details>
      title: "Practice: Branch and Jump Address Calculation"
      questions:
        - "A branch immediate is 16 bits of <em>words</em>.  How many bytes forward and backward can a branch reach?  What should the assembler do if the target is farther away?"
        - "Why does the branch recipe use PC + 4 rather than PC?"

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
        <p>A one-page summary of machine language translation.  Keep it next to your green sheet!</p>
        <p><strong>The three instruction formats:</strong></p>
        <pre>
        bit:  31    26 25  21 20  16 15  11 10   6 5     0
        R:   | opcode | rs   | rt   | rd   | shamt | funct |     opcode = 0; funct picks the operation
        I:   | opcode | rs   | rt   |      immediate       |     16-bit immediate, sign-extended
        J:   | opcode |             address                |     26-bit word address
        </pre>
        <p><strong>Key formulas:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Formula</th>
            <th class="tg-1wig">Micro-example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">Load/store effective address = Reg[rs] + sign-extended immediate</td>
            <td class="tg-0lax"><code>lw $s0, 8($sp)</code> with sp = <code>0x7FFFEFF0</code> reads <code>0x7FFFEFF8</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Branch immediate = (target - (PC + 4)) / 4, stored as 16-bit two's complement</td>
            <td class="tg-0lax">branch at <code>0x00400018</code> to <code>0x00400008</code>: -20 bytes = -5 words = <code>0xFFFB</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Branch target = (PC + 4) + (immediate &times; 4)</td>
            <td class="tg-0lax">immediate <code>0x0004</code> at <code>0x00400020</code> targets <code>0x00400024</code> + 16 = <code>0x00400034</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Jump target = { (PC+4)[31:28], 26-bit field, 00 }</td>
            <td class="tg-0lax">field <code>0x0100008</code> with PC top bits 0000 targets <code>0x00400020</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Two's complement negation: invert all bits, then add 1</td>
            <td class="tg-0lax">-5 in 16 bits: <code>0000000000000101</code> &rarr; <code>1111111111111010</code> &rarr; <code>0xFFFB</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Format test: opcode 0 &rarr; R type; opcode 2 or 3 &rarr; J type; anything else &rarr; I type</td>
            <td class="tg-0lax"><code>0x02328022</code> starts <code>000000</code>, so R type</td>
          </tr>
        </tbody>
        </table>
        <br>
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
            <td class="tg-1wig">opcode</td>
            <td class="tg-0lax">Bits 31-26 of every instruction; identifies the operation or, for R types, defers to funct.</td>
          </tr>
          <tr>
            <td class="tg-1wig">funct</td>
            <td class="tg-0lax">Bits 5-0 of an R type; selects which ALU operation (add = 0x20, sub = 0x22, ...).</td>
          </tr>
          <tr>
            <td class="tg-1wig">rs, rt, rd</td>
            <td class="tg-0lax">5-bit register numbers: two sources and a destination (rd for R types; rt doubles as the I type destination).</td>
          </tr>
          <tr>
            <td class="tg-1wig">shamt</td>
            <td class="tg-0lax">5-bit shift amount used by <code>sll</code>/<code>srl</code>; 0 for everything else.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Sign extension</td>
            <td class="tg-0lax">Copying bit 15 of a 16-bit immediate into bits 31-16 so its value is preserved in 32 bits.</td>
          </tr>
          <tr>
            <td class="tg-1wig">PC-relative addressing</td>
            <td class="tg-0lax">Branch targets stored as a word offset from PC + 4 rather than as an absolute address.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Pseudo-direct addressing</td>
            <td class="tg-0lax">Jump targets stored as a 26-bit word address, completed by the top 4 bits of PC + 4.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Word alignment</td>
            <td class="tg-0lax">Instructions and words live at addresses divisible by 4, so their bottom two bits are always 00.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Two's complement</td>
            <td class="tg-0lax">The binary representation of signed numbers; the top bit indicates negative values.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

  additional_reading:
    - link: ./MIPSInstructions
      title: Review of the MIPS Instruction Set
    - link: "https://godbolt.org/"
      title: "Cross-Compiler Explorer"
    - link: "https://web.archive.org/web/20240805121947/http://mipsconverter.com/opcodes.html"
      title: "MIPS to Binary Translation Reference Guide"
    - link: "https://courses.cs.washington.edu/courses/cse378/09au/MIPS_Green_Sheet.pdf"
      title: "MIPS Green Sheet Textbook Reference"

tags:
  - mips

---

