---
layout: activity
permalink: /Activities/MIPSSingleCycle
title: "CS274: Computer Architecture - The MIPS Single Cycle Design"
excerpt: "CS274: Computer Architecture - The MIPS Single Cycle Design"

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
            <th class="tg-1wig">Regiter Read</th>
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
        
tags:
  - mips
  - architecture
  - datapath
  - singlecycle

---

