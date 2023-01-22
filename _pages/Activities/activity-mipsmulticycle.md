---
layout: activity
permalink: /Activities/MIPSMultiCycle
title: "CS274: Computer Architecture - The MIPS Multi Cycle Design"
excerpt: "CS274: Computer Architecture - The MIPS Multi Cycle Design"

info:
  goals:
    - To extend the single cycle datapath into a multicycle approach
    - To express the control of the datapath as a finite state machine over each instruction stage (cycle) rather than a simple single cycle table
    - To describe the timing benefits of a multicycle design
    - To calculate the average cycles per instruction for a given program on the MIPS multicycle datapath

  models:
    - model: |
        <img src="https://www.researchgate.net/profile/Sharmin-Abdullah/publication/323748116/figure/fig1/AS:631599347531776@1527596427022/High-level-view-of-multi-cycle-Data-path-3_W640.jpg" alt="An abstract block diagram for a multi cycle MIPS architecture">
      title: A Multicycle Datapath Design for MIPS
      questions:
        - "Notice the inputs to the ALU: there are several of them.  What are they, and how can we choose between them?"
        
    - model: |
        <img src="https://slideplayer.com/16/5038796/big_thumb.jpg" alt="Consolidating the ALUs from the Single Cycle Datapath, since a single ALU can be used during each instruction step for a different purpose">
      title: Augmenting the Single Cycle MIPS Datapath to Consolidate the ALUs
      questions:
        - "Why does the multicycle approach use only a single ALU?  Why was this impossible with the single cycle design?"
        - "How does an add instruction execute through this datapath?  Hint: it requires multiple steps through the datapath now!"

    - model: |
        <img src="https://www.ece.lsu.edu/alex/EE3755/fall09/control_files/image006.gif" alt="Block Diagram of a Finite State Machine">
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
            <th class="tg-1wig">Fetch</th>
            <th class="tg-1wig">Decode</th>
            <th class="tg-1wig">ALU</th>
            <th class="tg-1wig">Memory Access</th>
            <th class="tg-1wig">Writeback</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">IR = Mem[PC]</td>
            <td class="tg-0lax">A = Reg[rs]</td>
            <td class="tg-0lax">lw/sw: ALUOut = A+immediate (IR[15:0])</td>
            <td class="tg-0lax">lw: MDR = Mem[ALUOut]</td>
            <td class="tg-0lax">lw/sw: Reg[rt] = MDR</td>
          </tr>
          <tr>
            <td class="tg-0lax">ALUOut = PC + 4</td>
            <td class="tg-0lax">B = Reg[rt]</td>
            <td class="tg-0lax">R type: ALUOut = func</td>
            <td class="tg-0lax">sw: Mem[ALUOut] = B</td>
            <td class="tg-0lax">R-type: Reg[rd] = ALUOut</td>
          </tr>
          <tr>
            <td class="tg-0lax">PC += 4</td>
            <td class="tg-0lax">ALUOut = immediate (IR[15:0]) &lt;&lt;2<br>sign extended to 32 bits</td>
            <td class="tg-0lax">beq: ALUOut = A - B; if zero, PC = ALUOut</td>
            <td class="tg-0lax">R-type: skip to writeback</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">j: PC = jump target</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
        </tbody>
        </table>    
        <br>
        <img src="https://camo.githubusercontent.com/cabec94e61a35fe078491a579b88487211fe273b53eda3b8c1d88aa3b69e7c05/68747470733a2f2f7777772e636973652e75666c2e6564752f7e6d73737a2f436f6d704f72672f466967342e32322d4d4950532d4653432d436f6d706f736974652e676966" alt="Modifying the Control Unit to Output Specialized Control Signals at Each Instruction Stage">
      title: Modifying the Control Unit to Output Specialized Control Signals at Each Instruction Stage via a Finite State Machine
      questions:
        - "Describe the functionality of each control signal in this datapath, for each instruction cycle stage."   
        - "How does the conditional and boolean logic of the multi-cycle control unit differ from that of the single cycle control?  In other words, what additional input(s) are needed to the control unit to determine the output control bits, beyond merely the opcode and function code?"

    - model: |   
        <img src="https://camo.githubusercontent.com/93dad2cf0647e66de5070ee90c99adaa1fe3045fa322f15bccc6fa6dcbf96050/68747470733a2f2f692e696d6775722e636f6d2f6d5758485770542e706e67" alt="The MIPS Multi Cycle Datapath">
      title: The MIPS Multicycle Datapath
      questions:
        - "Trace an add, beq, and j instruction through this datapath."
        - "Add an instruction to the datapath and control finite state machine flowchart to support <code>blez</code>: branch if less than or equal to 0."

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
      title: Calculating Performance via Cycles Per Instruction (CPI)
      questions:
        - "How many cycles are required for each instruction above?  Hint: use the control unit finite state machine and count the length of each path."           
        - "Suppose a program has 25% loads, 10% stores, 52% ALU instructions, 11% branches, and 2% jumps.  What is the average number of cycles per instruction?"
        - "The average cycles per instruction for the single cycle datapath is always 1.  Why is this an improvement?  Hint: consider the timing length of each cycle for single cycle and for multi cycle."

tags:
  - mips
  - architecture
  - datapath
  - multicycle

---

