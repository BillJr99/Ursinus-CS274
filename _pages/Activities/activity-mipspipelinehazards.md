---
layout: activity
permalink: /Activities/MIPSPipelineHazards
title: "CS274: Computer Architecture - Pipelining: Data and Control Hazards"
excerpt: "CS274: Computer Architecture - Pipelining: Data and Control Hazards"

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

  additional_reading:
    - link: "https://hackmd.io/@yW7HKRexRASTmH3kBDXQpQ/Sy395BDg5"
      title: MIPS Architecture Notes        
        
tags:
  - mips
  - architecture
  - datapath
  - multicycle

---

