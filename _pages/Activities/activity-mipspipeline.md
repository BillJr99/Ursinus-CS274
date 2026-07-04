---
layout: activity
permalink: /Activities/MIPSPipeline
title: "CS274: Computer Architecture - Pipelining"


info:
  goals:
    - To explain the potential speedup of using a pipelined processor design
    - To identify those components necessary to augment a single cycle MIPS design for pipeline support

  models:        
    - model: |
        <img src="https://www.cs.fsu.edu/~hawkes/cda3101lects/chap6/F6.1.gif" alt="A timeline of doing laundry in a single cycle approach and in a pipelined approach">
        <br>
        <img src="https://www.cs.fsu.edu/~hawkes/cda3101lects/chap6/F6.3.gif" alt="A Pipelined Single Cycle MIPS Timeline">
        <br>
        <img src="https://i.stack.imgur.com/Lo6zT.png" alt="The complete Single Cycle MIPS Datapath and Control with support for lw, sw, add, sub, and, or, slt, beq, and j instructions">
      title: Pipelining the MIPS Single Cycle Datapath
      questions:
        - "What five execution stages do you see in the MIPS datapath?"
        - "Which components and control lines belong to each?"
        - "What is happening with most of the rest of the datapath while each stage is executing?"
        
    - model: |
        <img src="https://i.stack.imgur.com/4YGm9.png" alt="Pipelined Datapath and Control Stages">
      title: Abstract Pipelined Datapath and Control Stages
      questions:
        - "Notice the backwards lines.  Are these feasible in this design?  What can we do to enable them?"
        - "These data and control lines can now be associated with one of up to five different instructions.  How can we keep them separated, while at the same time ensure we do not lose them as the instruction propagates from stage to stage?"

    - model: |
        <img src="https://harttle.land/assets/img/blog/single-clock-cycle-pipeline.png" alt="Pipelined Datapath and Control with Pipeline Registers">
        <br>
        <img src="../images/pipeline/pipeline-animation.gif" alt="Animation of instructions executing through the pipeline from Patterson and Hennessy Computer Organization and Design">
      title: Pipelined Datapath and Control with Pipeline Registers
      questions:
        - "What instructions cross stage boundaries during their stage execution?  How does this compare to the former &quot;backwards lines&quot; we saw in the datapath?"   

    - model: |
        <img src="https://www.cs.fsu.edu/~hawkes/cda3101lects/chap6/F6.18.gif" alt="Correction to allow for loads from the writeback stage">
        <br>
        <img src="https://harttle.land/assets/img/blog/single-clock-cycle-pipeline.png" alt="The full pipelined datapath">
      title: Correction to Allow Loads in the Writeback Stage
      questions:
        - "From which pipeline register should the <code>RegWrite</code> and <code>RegDst</code> control lines be fed, and why?"
        - "From which pipeline register should the <code>PCSrc</code> control line be fed, and why?"

    - model: |
        <p>Branch and jump arithmetic doesn't change when we pipeline -- but <em>when</em> and <em>where</em> it happens does, and that timing is exactly why control hazards exist.  Recall the recipe: <code>immediate = (target - (PC + 4)) / 4</code>, stored as 16-bit two's complement, and the hardware recovers the target as <code>PC + 4 + (sign-ext(immediate) &lt;&lt; 2)</code>.</p>
        <p>In the pipeline, the PC + 4 value that the branch needs is captured in the IF/ID pipeline register when the branch is fetched, and rides along with the instruction into ID/EX.  The sign extend happens in ID, the shift-left-2 and target adder do their work in EX -- and meanwhile the fetch stage has kept charging ahead, fetching the next instructions at PC + 4 and PC + 8!</p>
        <p><strong>Worked example (backward branch):</strong> a <code>beq</code> at <code>0x00401000</code> targets a loop header at <code>0x00400FF0</code>.</p>
        <ol>
          <li>PC + 4 = <code>0x00401004</code>.  This value is latched into IF/ID during the branch's fetch cycle.</li>
          <li>byte offset = <code>0x00400FF0</code> - <code>0x00401004</code> = <code>-0x14</code> = -20 bytes.</li>
          <li>word offset = -20 / 4 = -5 words.</li>
          <li>-5 in 16-bit two's complement: 5 = <code>0000000000000101</code>; invert: <code>1111111111111010</code>; add 1: <code>1111111111111011</code> = <code>0xFFFB</code>.</li>
          <li>Pipeline timing check: by the cycle the branch reaches EX and its adder computes <code>0x00401004</code> - 20 = <code>0x00400FF0</code>, the instructions at <code>0x00401004</code> (now in ID) and <code>0x00401008</code> (now in IF) have already entered the pipeline.  If the branch is taken, they must be squashed -- that is the control hazard you will study next.</li>
        </ol>
        <p><strong>Worked example (jump):</strong> a <code>j</code> at <code>0x00401008</code> targets <code>0x00401040</code>.</p>
        <ol>
          <li>field = <code>0x00401040</code> / 4 = <code>0x00100410</code>.</li>
          <li>machine word = (2 &lt;&lt; 26) + <code>0x00100410</code> = <code>0x08000000</code> + <code>0x00100410</code> = <code>0x08100410</code>.</li>
          <li>Target reconstruction: {(PC+4)[31:28] = <code>0000</code>, field, <code>00</code>} = <code>0x00401040</code>.  No adder is needed, so a jump can redirect the PC as early as the decode stage -- it only costs us the one instruction already fetched behind it.</li>
        </ol>
        <p><strong>Now you try!</strong></p>
        <p><strong>Problem 1 (forward branch):</strong> a <code>beq</code> at <code>0x00400100</code> skips ahead to <code>0x00400110</code>.  What immediate is stored?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>PC + 4 = <code>0x00400104</code>.</li>
          <li>byte offset = <code>0x00400110</code> - <code>0x00400104</code> = <code>0xC</code> = 12 bytes.</li>
          <li>word offset = 12 / 4 = 3; immediate = <code>0x0003</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 2 (backward branch):</strong> a <code>bne</code> at <code>0x00400128</code> loops back to <code>0x00400118</code>.  What immediate is stored?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>PC + 4 = <code>0x0040012C</code>.</li>
          <li>byte offset = <code>0x00400118</code> - <code>0x0040012C</code> = <code>-0x14</code> = -20 bytes.</li>
          <li>word offset = -20 / 4 = -5; in 16-bit two's complement, -5 = <code>0xFFFB</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 3 (decode an offset):</strong> a branch at <code>0x00400200</code> carries immediate <code>0x0008</code>.  What is the taken target?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>immediate = 8 words = 32 bytes = <code>0x20</code>.</li>
          <li>PC + 4 = <code>0x00400204</code>.</li>
          <li>target = <code>0x00400204</code> + <code>0x20</code> = <code>0x00400224</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 4 (jump decode):</strong> decode <code>0x08100415</code>, assuming the top 4 bits of PC + 4 are <code>0000</code>.</p>
        <details><summary>Solution</summary>
        <ol>
          <li>opcode = top 6 bits = <code>000010</code> = <code>j</code>.</li>
          <li>field = low 26 bits = <code>0x0100415</code>.</li>
          <li>target = field &times; 4 = <code>0x0401054</code>; with top bits 0000, this is <code>j 0x00401054</code>.</li>
        </ol>
        </details>
        <p><strong>Problem 5 (pipeline PC bookkeeping):</strong> the <code>beq</code> from Problem 1 (at <code>0x00400100</code>) is in its EX stage.  What are the addresses of the instructions currently in ID and IF?  If the branch resolves as taken, what happens to them, and what address is fetched next?</p>
        <details><summary>Solution</summary>
        <ol>
          <li>The pipeline fetched sequentially behind the branch: the instruction in ID is from <code>0x00400104</code>, and the one in IF is from <code>0x00400108</code>.</li>
          <li>The EX-stage adder computes the target <code>0x00400104</code> + 12 = <code>0x00400110</code>, and the ALU's Zero output says &quot;taken.&quot;</li>
          <li>The two younger instructions are squashed (turned into bubbles) before they can write anything, and the next fetch comes from <code>0x00400110</code>.  Two fetch slots were wasted -- the price of resolving branches in EX.</li>
        </ol>
        </details>
      title: "Practice: Branch and Jump Address Calculation"
      questions:
        - "Which pipeline register must carry PC + 4 so that the EX stage can compute the branch target?"
        - "If we moved the comparison and target adder up into the ID stage, how many fetched instructions would a taken branch squash instead of two?"

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
        <p>A one-page summary of pipelining.</p>
        <p><strong>The five stages and their hardware:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Stage</th>
            <th class="tg-1wig">Name</th>
            <th class="tg-1wig">What happens</th>
            <th class="tg-1wig">Main hardware</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">IF</td>
            <td class="tg-0lax">Instruction Fetch</td>
            <td class="tg-0lax">Read the instruction at PC; compute PC + 4</td>
            <td class="tg-0lax">Instruction memory, PC + 4 adder</td>
          </tr>
          <tr>
            <td class="tg-1wig">ID</td>
            <td class="tg-0lax">Instruction Decode</td>
            <td class="tg-0lax">Read rs and rt from the register file; sign-extend the immediate; generate control</td>
            <td class="tg-0lax">Register file (read), control unit, sign extend</td>
          </tr>
          <tr>
            <td class="tg-1wig">EX</td>
            <td class="tg-0lax">Execute</td>
            <td class="tg-0lax">ALU operation or address arithmetic; branch target = PC + 4 + (imm &lt;&lt; 2)</td>
            <td class="tg-0lax">ALU, shift-left-2, branch adder</td>
          </tr>
          <tr>
            <td class="tg-1wig">MEM</td>
            <td class="tg-0lax">Memory</td>
            <td class="tg-0lax">Load or store data; taken-branch decision applied to the PC</td>
            <td class="tg-0lax">Data memory</td>
          </tr>
          <tr>
            <td class="tg-1wig">WB</td>
            <td class="tg-0lax">Writeback</td>
            <td class="tg-0lax">Write the ALU result or loaded value back to the register file</td>
            <td class="tg-0lax">Register file (write)</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>Instructions flowing through the pipeline</strong> (one new instruction enters each cycle; five are in flight at once):</p>
        <pre>
        cycle:        1    2    3    4    5    6    7    8
        lw  $s0, ...  IF   ID   EX   MEM  WB
        add $t0, ...       IF   ID   EX   MEM  WB
        sub $t1, ...            IF   ID   EX   MEM  WB
        sw  $t2, ...                 IF   ID   EX   MEM  WB
        </pre>
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
            <td class="tg-0lax">Clock period = the slowest <em>stage</em> (plus register overhead), not the slowest instruction.</td>
            <td class="tg-0lax">Stages of 200/100/200/200/100 ps &rarr; 200 ps clock, vs. 800 ps single cycle</td>
          </tr>
          <tr>
            <td class="tg-0lax">Ideal speedup &asymp; number of stages, for long instruction streams.</td>
            <td class="tg-0lax">5 stages &rarr; up to 5x throughput</td>
          </tr>
          <tr>
            <td class="tg-0lax">Time for n instructions &asymp; (n + stages - 1) &times; clock period.</td>
            <td class="tg-0lax">4 instructions, 5 stages: 4 + 4 = 8 cycles (see diagram above)</td>
          </tr>
          <tr>
            <td class="tg-0lax">Pipelining improves <em>throughput</em>; each individual instruction's latency does not shrink.</td>
            <td class="tg-0lax">Each instruction still takes 5 stages, but one finishes every cycle</td>
          </tr>
          <tr>
            <td class="tg-0lax">Pipeline registers (IF/ID, ID/EX, EX/MEM, MEM/WB) carry each instruction's data <em>and</em> control bits between stages.</td>
            <td class="tg-0lax">The write register number travels all the way to MEM/WB for use in WB</td>
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
            <td class="tg-1wig">Pipelining</td>
            <td class="tg-0lax">Overlapping the execution of instructions like an assembly line, one per stage.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Pipeline register</td>
            <td class="tg-0lax">A latch between stages (e.g. IF/ID) that holds one instruction's data and control until the next cycle.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Throughput</td>
            <td class="tg-0lax">Instructions completed per unit time; the quantity pipelining improves.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Latency</td>
            <td class="tg-0lax">Time for one instruction to travel from fetch to writeback; unchanged (or slightly worse) with pipelining.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Stage</td>
            <td class="tg-0lax">One of IF, ID, EX, MEM, WB: a slice of the datapath doing one step of every instruction.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Bubble</td>
            <td class="tg-0lax">A do-nothing slot inserted into the pipeline, e.g. when squashing a wrongly fetched instruction.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Hazard</td>
            <td class="tg-0lax">Anything that prevents the next instruction from starting on schedule (structural, data, or control).</td>
          </tr>
          <tr>
            <td class="tg-1wig">In flight</td>
            <td class="tg-0lax">An instruction that has been fetched but has not yet written back; up to five at once here.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

tags:
  - mips
  - architecture
  - datapath
  - pipeline

---

