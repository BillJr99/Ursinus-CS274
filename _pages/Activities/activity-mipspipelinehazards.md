---
layout: activity
permalink: /Activities/MIPSPipelineHazards
title: "CS274: Computer Architecture - Pipelining: Data and Control Hazards"


info:
  goals:
    - To identify the three types of pipeline hazards
    - To identify and mitigate the hazards present in the MIPS pipelined architecture

  models:
    - model: |
        <div align="center">
        Structural Hazards: not enough hardware to execute each pipeline stage independently<br>
        Control Hazards: Need to execute an instruction to determine the location or control of the next instruction<br>
        Data Hazards: An instruction needs to read data being calculated by a prior instruction
        </div>
      title: Pipeline Hazards
      questions:
        - "Where, if anywhere, do each of these hazards exist in the MIPS architecture?"
        - "What are some strategies to mitigate each of these hazards?"

    - model: |
        <img src="https://i.imgur.com/HmQkGry.png" alt="Timeline diagram showing a stall while the branch instruction is resolved in order to determine the next instruction to execute.">
        <br>
        <img src="https://i.imgur.com/r0YCf45.png" alt="Predicting branch not taken, and then bubbling the isntruction before it finishes upon determining that the branch should be taken.">
      title: Control Hazards
      questions:
        - "Notice that if a branch occurs, we must stall one cycle until the ALU stage so that we can compare the registers and determine if a branch should be taken or not.  Here, the branch is taken.  If the branch was not taken, what could we have done during that stalled time instead?"
        - "How might we cancel an instruction already in progress?  Do we have time to do this before it writes to any registers or memory?  If so, how many cycles do we have, and is this enough time to resolve a branch?"
        - "Is it better to predict that a branch is taken or not taken, and why?"
        - "Could the compiler help to avoid these stalls by changing the order of execution?  What do you think a &quot;branch delay slot&quot; is?"
        
    - model: |
        <img src="https://i.imgur.com/zejkHki.png" alt="Timeline showing a two cycle data hazard on writeback.">
        <br>
        <img src="https://i.imgur.com/IjEdbE9.png" alt="Forwarding the register value prior to writeback for use in subsequent instructions without a stall.">
      title: Data Hazards
      questions:
        - "Notice the <code>and</code> and <code>or</code> instructions will receive stale data because the register writeback from the prior instruction hasn't completed by the time they decode.  At what point is this data actually available, and how might it be used to override the register decode values?"
        - "What would happen if two consecutive instructions write to the same register, and the next instruction reads that register?  Which pipeline stage forward should take priority and why?"
        - "Will this work for a load instruction?  Why or why not?  Hint - when is that value available, and from what stage can it be forwarded?"
        - "Modify our strategy to allow forwards from load instructions using a stall cycle."
        
    - model: |
        <img src="https://i.imgur.com/fQFpbRN.png" alt="Forwarding Detection">
        <br>
        <img src="https://i.imgur.com/uk38lxA.png" alt="Forwarding Control">
        <br>
        <img src="https://i.imgur.com/8PtYa15.png" alt="Pipelined Datapath and Control with Forwarding">
        <br>
        <div align="center">
        <script type="syntaxhighlighter"><![CDATA[        
        if EX/MEM.RegWrite == 1 && EX/MEM.rd == ID/EX.rs && EX/MEM.rd != 0 then ForwardA = 0b10
        elif MEM/WB.RegWrite == 1 && MEM/WB.rd == ID/EX.rs && MEM/WB.rd != 0 then ForwardA = 0b01
        if EX/MEM.RegWrite == 1 && EX/MEM.rd == ID/EX.rt && EX/MEM.rd != 0 then ForwardB = 0b10
        elif MEM/WB.RegWrite == 1 && MEM/WB.rd == ID/EX.rt && MEM/WB.rd != 0 then ForwardA = 0b01  
        ]]></script>
        </div>
      title: Forwarding Detection
      questions:
        - "Why is the <code>else if</code> critical here to ensure that an <code>EX/MEM</code> forwarding hazard doesn't also exist when checking for a <code>MEM/WB</code> forwarding hazard?"  
        
    - model: |
        <img src="https://i.imgur.com/LFrSwm5.png" alt="Example load hazard requiring a stall followed by a forward from the writeback stage">
        <br>
        <img src="https://i.imgur.com/416Zt0q.png" alt="Pipelined Datapath and Control with Hazard Detection">
        <br>        
        <div align="center">
        <script type="syntaxhighlighter"><![CDATA[        
        if ID/EX.MemRead && (ID/EX.rt == IF/ID.rs || ID/EX.rt == IF/ID.rt) then stall by overriding ID/EX control to 0, PCWrite to 0, and IF/ID to flush
        ]]></script>        
        </div>
      title: Hazard Detection for Load (Control Hazard) and Branch (Data Hazard) Stalls
      questions:
        - "How does this unit work in tandem with the forwarding unit for load data hazards?"          
        - "How does this approach ensure we do not skip the currently executing instruction (but instead re-issue it with a no-op feeding into the execute stage)?"  
        
    - model: |
        <div align="center">
        25% load instructions, 10% of which result in hazards<br>
        50% R-type instructions, 20% of which require forwarding<br>
        25% branch instructions, 50% of which are taken
        </div>
      title: MIPS Pipeline Performance
      questions:
        - "How many penalty cycles result from stalling the pipeline, on average, per instruction?"          

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
        <p>A one-page summary of pipeline hazards and their fixes.</p>
        <p><strong>The three hazard types and their mitigations:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Hazard</th>
            <th class="tg-1wig">Cause</th>
            <th class="tg-1wig">Micro-example</th>
            <th class="tg-1wig">Mitigations</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">Structural</td>
            <td class="tg-0lax">Two instructions need the same hardware in the same cycle</td>
            <td class="tg-0lax">One memory for both fetch and data access</td>
            <td class="tg-0lax">Duplicate hardware (separate instruction and data memories)</td>
          </tr>
          <tr>
            <td class="tg-1wig">Data</td>
            <td class="tg-0lax">An instruction reads a register a prior in-flight instruction hasn't written yet</td>
            <td class="tg-0lax"><code>add $s0, ...</code> immediately followed by <code>and $t0, $s0, ...</code></td>
            <td class="tg-0lax">Forwarding from EX/MEM or MEM/WB; a one-cycle stall for load-use</td>
          </tr>
          <tr>
            <td class="tg-1wig">Control</td>
            <td class="tg-0lax">The next PC isn't known until a branch resolves</td>
            <td class="tg-0lax"><code>beq</code> resolved in EX while two younger instructions are already fetched</td>
            <td class="tg-0lax">Predict not taken and squash on a taken branch; early branch resolution; branch delay slot</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>Key rules and formulas:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Rule / Formula</th>
            <th class="tg-1wig">Micro-example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">Forward from EX/MEM when EX/MEM.RegWrite = 1, EX/MEM.rd = ID/EX.rs (or rt), and EX/MEM.rd &ne; 0; otherwise check MEM/WB the same way.  EX/MEM (the newer value) wins ties.</td>
            <td class="tg-0lax">Back-to-back <code>add $s0,...</code> then <code>sub ..., $s0, ...</code>: ForwardA = 10</td>
          </tr>
          <tr>
            <td class="tg-0lax">Load-use rule: a value loaded by <code>lw</code> is not available until after MEM, so a dependent instruction in the very next slot always costs one stall cycle (then forward).</td>
            <td class="tg-0lax"><code>lw $t0, 0($s1)</code> then <code>add $t2, $t0, $t3</code>: 1 bubble</td>
          </tr>
          <tr>
            <td class="tg-0lax">Stall detection: stall if ID/EX.MemRead = 1 and ID/EX.rt matches IF/ID.rs or IF/ID.rt (zero the ID/EX control bits, freeze PC and IF/ID).</td>
            <td class="tg-0lax">The <code>lw</code>/<code>add</code> pair above trips this test in the <code>add</code>'s decode cycle</td>
          </tr>
          <tr>
            <td class="tg-0lax">Average stall cycles per instruction = sum of (frequency &times; hazard rate &times; penalty).</td>
            <td class="tg-0lax">25% loads &times; 10% hazards &times; 1 cycle = 0.025 cycles/instruction from loads</td>
          </tr>
          <tr>
            <td class="tg-0lax">Real CPI = 1 + average stall cycles per instruction.</td>
            <td class="tg-0lax">1 + 0.025 (loads) + 0.25 &times; 50% &times; penalty (branches) + ...</td>
          </tr>
          <tr>
            <td class="tg-0lax">Forwarding fixes most data hazards with zero cost; stalls and squashes are the fallback when the value literally does not exist yet.</td>
            <td class="tg-0lax">R-type-to-R-type dependences never stall with forwarding</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>A load-use stall, pictured:</strong></p>
        <pre>
        cycle:              1    2    3    4    5    6    7
        lw  $t0, 0($s1)     IF   ID   EX   MEM  WB
        add $t2, $t0, $t3        IF   ID   **   EX   MEM  WB
                                           stall, then forward MEM/WB -> EX
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
            <td class="tg-1wig">Forwarding (bypassing)</td>
            <td class="tg-0lax">Routing a result from a pipeline register straight to the ALU input, skipping the register file.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Stall</td>
            <td class="tg-0lax">Holding an instruction in place for a cycle by freezing the PC and IF/ID and inserting a bubble.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Bubble (no-op)</td>
            <td class="tg-0lax">A pipeline slot whose control signals are all zeroed so it changes no state.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Squash (flush)</td>
            <td class="tg-0lax">Canceling already-fetched instructions after a taken branch, before they write anything.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Load-use hazard</td>
            <td class="tg-0lax">A data hazard where the very next instruction needs a value still being loaded from memory.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Branch prediction</td>
            <td class="tg-0lax">Guessing a branch's outcome (e.g. &quot;not taken&quot;) so fetching can continue; wrong guesses are squashed.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Branch delay slot</td>
            <td class="tg-0lax">An instruction slot after a branch that executes regardless; the compiler tries to fill it with useful work.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Hazard detection unit</td>
            <td class="tg-0lax">Logic in ID that spots load-use hazards and triggers the stall.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Forwarding unit</td>
            <td class="tg-0lax">Logic in EX that compares register numbers across pipeline registers and steers the ALU input muxes.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

  additional_reading:
    - link: "https://hackmd.io/@yW7HKRexRASTmH3kBDXQpQ/Sy395BDg5"
      title: MIPS Architecture Notes        
        
tags:
  - mips
  - architecture
  - datapath
  - multicycle

---

