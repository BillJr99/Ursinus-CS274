---
layout: assignment
permalink: /Assignments/Participation/PipelineAssessment
title: "CS274: Computer Architecture - In-Class Assessment: Pipelining"


info:
  coursenum: CS274
  points: 10
  goals:
    - To schedule instructions through the five stage MIPS pipeline
    - To identify data and control hazards and resolve them with forwarding, stalls, or reordering
  readings:
    - rlink: ../../Activities/MIPSPipeline
      rtitle: MIPS Pipeline Activity
    - rlink: ../../Activities/MIPSPipelineHazards
      rtitle: MIPS Pipeline Hazards Activity

tags:
  - participation
  - pipeline

---

This is a short, low-stakes in-class assessment, completed individually on paper during class and graded on the basis of demonstrated reasoning (showing your work earns credit even when a slip occurs in one cycle of the table).  It counts toward the Class Participation and Quizzes portion of your grade.

## What to Expect

You will be given a short MIPS code sequence (3-5 instructions).  In roughly 15 minutes, you will:

1. Fill in a pipeline diagram table (instructions down the rows, clock cycles across the columns, stages `IF`/`ID`/`EX`/`MEM`/`WB` in the cells) for the sequence.
2. Circle each data dependence between instructions, and state whether it causes a hazard.
3. Show how the hazards are resolved: which can be fixed by forwarding, which require a stall (bubble), and whether reordering the instructions could avoid the stall entirely.
4. Compute the total number of cycles for the sequence with and without forwarding.

## How to Prepare

* Practice drawing the stage/cycle table quickly: instruction *i* is in stage `IF` in cycle *i*, and moves one stage per cycle unless stalled.
* Remember the two classic cases: an ALU result needed by the next instruction can be forwarded with no stall, but a `lw` result needed by the very next instruction always costs one bubble (the load-use hazard).
* Be able to explain, in one sentence each, what forwarding hardware does and why a branch creates a control hazard.

## Grading

Full credit requires a correct pipeline table, all dependences identified, correct stall/forwarding decisions with one-line justifications, and correct cycle counts.  Partial credit is given for tables and hazard analyses that demonstrate understanding of the pipeline's operation even if a cycle is misplaced.
