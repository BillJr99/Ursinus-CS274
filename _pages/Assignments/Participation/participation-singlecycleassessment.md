---
layout: assignment
permalink: /Assignments/Participation/SingleCycleAssessment
title: "CS274: Computer Architecture - In-Class Assessment: The Single Cycle Datapath"


info:
  coursenum: CS274
  points: 10
  goals:
    - To trace an instruction through the single cycle datapath
    - To determine the control signal values required to execute a MIPS instruction
  readings:
    - rlink: ../../Activities/MIPSSingleCycle
      rtitle: MIPS Single Cycle Activity

tags:
  - participation
  - singlecycle

---

This is a short, low-stakes in-class assessment, completed individually on paper during class and graded on the basis of demonstrated reasoning (showing your work earns credit even when an arithmetic slip occurs).  It counts toward the Class Participation and Quizzes portion of your grade.

## What to Expect

You will be given a copy of the single cycle datapath diagram and one or two MIPS instructions (for example, an R-type instruction like `add`, and a memory or branch instruction like `lw` or `beq`).  In roughly 15 minutes, you will:

1. Highlight the path each instruction takes through the datapath (which components are used, and which are ignored).
2. Fill in a table of the control signal values (`RegDst`, `RegWrite`, `ALUSrc`, `ALUOp`, `MemRead`, `MemWrite`, `MemtoReg`, `Branch`) for each instruction.
3. For a branch instruction, compute the branch target address from the PC and the encoded offset, showing each step of the arithmetic.

## How to Prepare

* Re-work the traces from the single cycle activity and lab without looking at your notes, then check yourself against them.
* For each control signal, be able to say in one sentence what question it answers (for example, `ALUSrc` answers: "does the ALU's second input come from a register, or from the sign-extended immediate?").
* Practice the branch offset arithmetic: offset = (target − (PC + 4)) / 4, and target = PC + 4 + (offset × 4).

## Grading

Full credit requires a legible trace, a complete control signal table with a brief justification for each value, and branch arithmetic with the steps shown.  Partial credit is given for partially correct tables and traces that demonstrate understanding of the datapath's structure.
