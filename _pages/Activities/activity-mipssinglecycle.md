---
layout: activity
permalink: /Activities/MIPSSingleCycle
title: "CS274: Computer Architecture - The MIPS Single Cycle Design"


info:
  goals:
    - To design and implement the MIPS instruction set using logic circuits on a single cycle design
    - To design a control unit to direct those logic circuits using the MIPS instruction operation and function codes
    - To implement additional instructions into the MIPS single cycle datapath

  models:
    - model: |
        <img src="https://harttle.land/assets/img/blog/mips-abs.png" alt="The abstract MIPS Single Cycle Datapath">
      title: Abstract MIPS Datapath
      questions:
        - "There are five basic steps in this abstract datapath.  In your own words, describe each one."
        - "Notice that the new Program Counter takes in two inputs: <code>PC+4</code> and the result of adding an immediate constant to <code>PC+4</code>.  What do each of these choices represent, and what logic circuit will enable us to choose between them?  Add that logic circuit."
        - "Where else do you see data lines merge together in this way?  Add additional multiplexors to choose between them, and describe what choice is being made for each."
        - "The register unit accepts three registers (<code>rs</code>, <code>rt</code>, and <code>rd</code>).  However, sometimes <code>rd</code> is the write register (for R type instructions), and sometimes <code>rt</code> is the write register (for I type instructions).  Add a multiplexor to select the correct register."
        
    - model: |
        <img src="https://harttle.land/assets/img/blog/mips-basic.png" alt="Control Signals for the MIPS Single Cycle Components">
        <br>
        <img src="https://i.imgur.com/VFBxSlq.png" alt="Description of the Control Signals">
      title: Using Control Signals to Manipulate the Datapath Components
      questions:
        - "In your own words, describe the function of each control line."
        - "Name an instruction that would cause each possible control value, and what that value would be."      

    - model: |
        <img src="https://harttle.land/assets/img/blog/mips-all.png" alt="Single Cycle Datapath with Control Signals">
        <br>
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
            <th class="tg-1wig">Opcode</th>
            <th class="tg-1wig">Function Code (R Type)</th>
            <th class="tg-1wig">ALU Action</th>
            <th class="tg-1wig">ALU bInvert</th>
            <th class="tg-1wig">ALU select operation</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">lw</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">add</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">10</td>
          </tr>
          <tr>
            <td class="tg-1wig">sw</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">add</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">10</td>
          </tr>
          <tr>
            <td class="tg-1wig">beq</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">subtract</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">10</td>
          </tr>
          <tr>
            <td class="tg-1wig">R (add)</td>
            <td class="tg-0lax">100000</td>
            <td class="tg-0lax">add</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">10</td>
          </tr>
          <tr>
            <td class="tg-1wig">R (sub)</td>
            <td class="tg-0lax">100010</td>
            <td class="tg-0lax">subtract</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">10</td>
          </tr>
          <tr>
            <td class="tg-1wig">R (and)</td>
            <td class="tg-0lax">100100</td>
            <td class="tg-0lax">and</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">00</td>
          </tr>
          <tr>
            <td class="tg-1wig">R (or)</td>
            <td class="tg-0lax">100101</td>
            <td class="tg-0lax">or</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">01</td>
          </tr>
          <tr>
            <td class="tg-1wig">R (slt)</td>
            <td class="tg-0lax">101010</td>
            <td class="tg-0lax">slt</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">11</td>
          </tr>
        </tbody>
        </table>
      title: MIPS Single Cycle Datapath with Control
      questions:
        - "Sketch a logic circuit that accepts the opcode and function code, and outputs the appropriate control lines."     

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
            <th class="tg-1wig">Opcode</th>
            <th class="tg-1wig">RegDst</th>
            <th class="tg-1wig">ALUSrc</th>
            <th class="tg-1wig">MemToReg</th>
            <th class="tg-1wig">RegWrite</th>
            <th class="tg-1wig">MemRead</th>
            <th class="tg-1wig">MemWrite</th>
            <th class="tg-1wig">Branch</th>
            <th class="tg-1wig">ALUOp</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">R</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">See Function Code Table</td>
          </tr>
          <tr>
            <td class="tg-1wig">lw</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">Add</td>
          </tr>
          <tr>
            <td class="tg-1wig">sw</td>
            <td class="tg-0lax">X</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">X</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">Add</td>
          </tr>
          <tr>
            <td class="tg-1wig">beq</td>
            <td class="tg-0lax">X</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">X</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">Subtract</td>
          </tr>
        </tbody>
        </table>
        <br>
        <img src="https://i.stack.imgur.com/Lo6zT.png" alt="The complete Single Cycle MIPS Datapath and Control with support for lw, sw, add, sub, and, or, slt, beq, and j instructions">
      title: Setting the Control Signals and the Full Single Cycle Datapath
      questions:
        - "What is the purpose of the sign extend, shift left, and top right adder on this datapath?"
        - "Trace the execution of the following instructions through the datapath, including their control values: <code>add</code>, <code>lw</code>, and <code>beq</code>."
        - "What ALU operation occurs on a branch instruction, and what status output line is used?"
        - "What happens to the PC if a <code>beq</code> instruction is specified but the ALU result is not 0?"
        - "Write an <code>if</code> statement that outputs one of the control signals above.  Then, write a boolean logic formula (and draw the circuit) using the opcode and, if needed, the function code bits as inputs."
        
    - model: |
        <img src="https://i.stack.imgur.com/vCvw1.png" alt="The MIPS Single Cycle Datapath with Jump Support">
      title: Adding jump Instruction Support to the MIPS Single Cycle Datapath
      questions:
        - "In your own words, describe what components have been added to this datapath."
        - "Trace the execution of a jump instruction."
        - "Add an instruction to the datapath to support <code>blez</code>: branch if less than or equal to 0."

    - model: |
        <p>Let's connect the branch and jump arithmetic to the hardware you just studied.  On the single cycle datapath, three pieces of hardware team up on every <code>beq</code>:</p>
        <ul>
          <li>The <strong>sign extend</strong> unit stretches the 16-bit immediate into a 32-bit signed value.</li>
          <li>The <strong>shift-left-2</strong> unit multiplies that word offset by 4, turning it back into a byte offset.</li>
          <li>The <strong>dedicated adder</strong> at the top right adds the byte offset to PC + 4 to form the branch target -- while, at the same time, the main ALU subtracts the two registers and raises its <code>Zero</code> output if they are equal.  The <code>PCSrc</code> multiplexor picks the branch target only when <code>Branch AND Zero</code> is true.</li>
        </ul>
        <p>So the assembler must store the offset as: <code>immediate = (target - (PC + 4)) / 4</code>, in 16-bit two's complement.  The hardware then undoes the &quot;/ 4&quot; with shift-left-2 and undoes the &quot;- (PC + 4)&quot; with the adder.</p>
        <p><strong>Worked example (forward branch):</strong> a <code>beq</code> at address <code>0x00400040</code> targets <code>0x00400060</code>.</p>
        <ol>
          <li>PC + 4 = <code>0x00400044</code>.  (The PC+4 adder at the top left computes this during the same cycle.)</li>
          <li>byte offset = <code>0x00400060</code> - <code>0x00400044</code> = <code>0x1C</code> = 28 bytes.</li>
          <li>word offset = 28 / 4 = 7 words, so the immediate is <code>0x0007</code>.</li>
          <li>In hardware: sign extend turns <code>0x0007</code> into <code>0x00000007</code>; shift-left-2 makes <code>0x0000001C</code>; the branch adder computes <code>0x00400044</code> + <code>0x1C</code> = <code>0x00400060</code>.  We recovered the target!</li>
        </ol>
        <p><strong>Worked example (backward branch):</strong> the same <code>beq</code> at <code>0x00400040</code> instead targets <code>0x00400028</code>.</p>
        <ol>
          <li>byte offset = <code>0x00400028</code> - <code>0x00400044</code> = <code>-0x1C</code> = -28 bytes.</li>
          <li>word offset = -28 / 4 = -7 words.</li>
          <li>-7 in 16-bit two's complement: 7 = <code>0000000000000111</code>; invert: <code>1111111111111000</code>; add 1: <code>1111111111111001</code> = <code>0xFFF9</code>.</li>
          <li>Sign extension is what makes this work in hardware: <code>0xFFF9</code> becomes <code>0xFFFFFFF9</code> (still -7), and shifting left by 2 gives <code>0xFFFFFFE4</code> (-28), so the adder <em>subtracts</em> 28 from PC + 4.</li>
        </ol>
        <p><strong>Worked example (jump):</strong> a <code>j</code> at <code>0x00400044</code> targets <code>0x00400010</code>.  On the jump-augmented datapath, the 26-bit field is shifted left 2 and concatenated with the top 4 bits of PC + 4 -- no adder needed at all.</p>
        <ol>
          <li>field = target / 4 = <code>0x00400010</code> / 4 = <code>0x00100004</code>.</li>
          <li>machine word = (2 &lt;&lt; 26) + <code>0x00100004</code> = <code>0x08000000</code> + <code>0x00100004</code> = <code>0x08100004</code>.</li>
          <li>In hardware: shift-left-2 of the field restores <code>0x00400010</code>'s low 28 bits; bits [31:28] come from PC + 4 = <code>0x00400048</code>, which are <code>0000</code>.  A second multiplexor (controlled by the <code>Jump</code> signal) selects this address into the PC.</li>
        </ol>
        <p><strong>Now you try!</strong></p>
        <p><strong>Problem 1 (forward branch):</strong> a <code>beq</code> at <code>0x00400008</code> targets <code>0x00400020</code>.  What immediate does the assembler store?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>PC + 4 = <code>0x0040000C</code>.</li>
          <li>byte offset = <code>0x00400020</code> - <code>0x0040000C</code> = <code>0x14</code> = 20 bytes.</li>
          <li>word offset = 20 / 4 = 5; immediate = <code>0x0005</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 2 (backward branch):</strong> a <code>bne</code> at <code>0x00400030</code> targets a loop at <code>0x00400014</code>.  What immediate is stored?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>PC + 4 = <code>0x00400034</code>.</li>
          <li>byte offset = <code>0x00400014</code> - <code>0x00400034</code> = <code>-0x20</code> = -32 bytes.</li>
          <li>word offset = -32 / 4 = -8.</li>
          <li>-8 in 16 bits: 8 = <code>0000000000001000</code>; invert: <code>1111111111110111</code>; add 1: <code>1111111111111000</code> = <code>0xFFF8</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 3 (decode an offset):</strong> a branch at <code>0x00400024</code> carries immediate <code>0xFFFD</code>.  What is the target if the branch is taken?</p>
        <details><summary>Solution</summary>
        <ol>
          <li><code>0xFFFD</code> sign-extends to -3 words = -12 bytes.</li>
          <li>PC + 4 = <code>0x00400028</code>.</li>
          <li>target = <code>0x00400028</code> - 12 = <code>0x00400028</code> - <code>0xC</code> = <code>0x0040001C</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 4 (jump encode):</strong> encode <code>j 0x00400100</code>.</p>
        <details><summary>Solution</summary>
        <ol>
          <li>field = <code>0x00400100</code> / 4 = <code>0x00100040</code>.</li>
          <li>word = <code>0x08000000</code> + <code>0x00100040</code> = <code>0x08100040</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 5 (datapath tie-in):</strong> during the single cycle in which <code>beq $t0, $t1, L</code> executes, what is the main ALU doing, what is the branch adder doing, and what decides which value enters the PC?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>The main ALU subtracts <code>$t1</code> from <code>$t0</code> (ALUOp = subtract) and asserts <code>Zero</code> if the result is 0.</li>
          <li>Simultaneously, the branch adder computes PC + 4 + (sign-extended immediate &lt;&lt; 2) -- the target is ready whether or not we need it.</li>
          <li>The <code>PCSrc</code> multiplexor selects the branch adder's output when <code>Branch AND Zero</code> = 1; otherwise it selects PC + 4.  Nothing stalls: both candidate next-PC values were computed in parallel within the one cycle.</li>
        </ol>
        </details>
      title: "Practice: Branch and Jump Address Calculation"
      questions:
        - "Why can the branch target adder run in parallel with the ALU's register comparison, rather than waiting for it?"
        - "The jump needs no adder at all.  What does that suggest about the relative cycle-time cost of <code>j</code> versus <code>beq</code> on this datapath?"

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
            <th class="tg-1wig">Opcode</th>
            <th class="tg-1wig">Instruction Fetch</th>
            <th class="tg-1wig">Register Read</th>
            <th class="tg-1wig">ALU</th>
            <th class="tg-1wig">Memory</th>
            <th class="tg-1wig">Register Writeback</th>
            <th class="tg-1wig">Total Time (ps)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">R</td>
            <td class="tg-0lax">200</td>
            <td class="tg-0lax">50</td>
            <td class="tg-0lax">100</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">50</td>
            <td class="tg-0lax">400</td>
          </tr>
          <tr>
            <td class="tg-1wig">lw</td>
            <td class="tg-0lax">200</td>
            <td class="tg-0lax">50</td>
            <td class="tg-0lax">100</td>
            <td class="tg-0lax">200</td>
            <td class="tg-0lax">50</td>
            <td class="tg-0lax">600</td>
          </tr>
          <tr>
            <td class="tg-1wig">sw</td>
            <td class="tg-0lax">200</td>
            <td class="tg-0lax">50</td>
            <td class="tg-0lax">100</td>
            <td class="tg-0lax">200</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">550</td>
          </tr>
          <tr>
            <td class="tg-1wig">beq</td>
            <td class="tg-0lax">200</td>
            <td class="tg-0lax">50</td>
            <td class="tg-0lax">100</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">350</td>
          </tr>
          <tr>
            <td class="tg-1wig">j</td>
            <td class="tg-0lax">200</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">200</td>
          </tr>
        </tbody>
        </table>
      title: Timing Limitations of the Single Cycle Design
      questions:
        - "Suppose you have a program with 20% load instructions, 20% store instructions, 50% R type instructions, 5% branch instructions, and 5% jump instructions.  How long would this program take on a single cycle model in which every instruction takes the same amount of time (the length of the longest instruction)?"
        - "How much faster would this program execute if the instructions could &quot;finish early&quot; and use the timings given above?"

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
        <p>A one-page summary of the single cycle design.</p>
        <p><strong>Key formulas and rules:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Formula / Rule</th>
            <th class="tg-1wig">Micro-example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">Every instruction completes in exactly one clock cycle, so CPI = 1.</td>
            <td class="tg-0lax">1,000,000 instructions take 1,000,000 cycles</td>
          </tr>
          <tr>
            <td class="tg-0lax">The clock period must fit the <em>slowest</em> instruction (the critical path).</td>
            <td class="tg-0lax">If <code>lw</code> takes 600 ps, the clock is 600 ps -- even for a 200 ps <code>j</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Execution time = instruction count &times; CPI &times; clock period.</td>
            <td class="tg-0lax">100 instructions &times; 1 &times; 600 ps = 60,000 ps</td>
          </tr>
          <tr>
            <td class="tg-0lax">Next PC = PC + 4, or PC + 4 + (sign-ext(imm) &lt;&lt; 2) on a taken branch, or {PC+4[31:28], field, 00} on a jump.</td>
            <td class="tg-0lax">immediate <code>0xFFF9</code> = -7 words moves the PC back 28 bytes</td>
          </tr>
          <tr>
            <td class="tg-0lax">Wherever two data lines merge, a multiplexor plus a control signal chooses between them.</td>
            <td class="tg-0lax"><code>RegDst</code> picks rd (R type) vs. rt (I type) as the write register</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>Control signal cheat sheet:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Signal</th>
            <th class="tg-1wig">What a 1 means</th>
            <th class="tg-1wig">R</th>
            <th class="tg-1wig">lw</th>
            <th class="tg-1wig">sw</th>
            <th class="tg-1wig">beq</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">RegDst</td>
            <td class="tg-0lax">Write register comes from rd (0 = from rt)</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">X</td>
            <td class="tg-0lax">X</td>
          </tr>
          <tr>
            <td class="tg-1wig">ALUSrc</td>
            <td class="tg-0lax">ALU's second input is the sign-extended immediate (0 = register rt)</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">MemToReg</td>
            <td class="tg-0lax">Value written to the register file comes from memory (0 = from the ALU)</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">X</td>
            <td class="tg-0lax">X</td>
          </tr>
          <tr>
            <td class="tg-1wig">RegWrite</td>
            <td class="tg-0lax">A register is written this cycle</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">MemRead</td>
            <td class="tg-0lax">Data memory is read</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">MemWrite</td>
            <td class="tg-0lax">Data memory is written</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">Branch</td>
            <td class="tg-0lax">Taken branch target may enter the PC (ANDed with the ALU's Zero output)</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">ALUOp</td>
            <td class="tg-0lax">Which ALU operation family (R types defer to the funct field)</td>
            <td class="tg-0lax">funct</td>
            <td class="tg-0lax">add</td>
            <td class="tg-0lax">add</td>
            <td class="tg-0lax">sub</td>
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
            <td class="tg-1wig">Datapath</td>
            <td class="tg-0lax">The chain of hardware (PC, memories, register file, ALU, adders, muxes) that data flows through to execute an instruction.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Control unit</td>
            <td class="tg-0lax">Combinational logic that reads the opcode (and funct) and sets every control signal.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Multiplexor (mux)</td>
            <td class="tg-0lax">A hardware chooser: a select signal picks which of several inputs passes through.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Register file</td>
            <td class="tg-0lax">The block holding all 32 registers, with two read ports and one write port.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Sign extend</td>
            <td class="tg-0lax">Stretches a 16-bit immediate to 32 bits by copying its top bit.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Zero output</td>
            <td class="tg-0lax">ALU status line that is 1 when the result is 0; used to decide <code>beq</code>.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Critical path</td>
            <td class="tg-0lax">The longest delay through the datapath; it sets the clock period.</td>
          </tr>
          <tr>
            <td class="tg-1wig">CPI</td>
            <td class="tg-0lax">Cycles per instruction; exactly 1 in the single cycle design, at the cost of a slow clock.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Don't care (X)</td>
            <td class="tg-0lax">A control value that has no effect this instruction, so either 0 or 1 works.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

tags:
  - mips
  - architecture
  - datapath
  - singlecycle

---

