---
layout: activity
permalink: /Activities/MIPSPipeline
title: "CS274: Computer Architecture - Pipelining"
excerpt: "CS274: Computer Architecture - Pipelining"

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

tags:
  - mips
  - architecture
  - datapath
  - pipeline

---

