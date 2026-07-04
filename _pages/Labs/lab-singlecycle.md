---
layout: assignment
permalink: /Labs/SingleCycle
title: "CS274: Computer Architecture - Lab: Tracing the Single Cycle Datapath"


info:
  coursenum: CS274
  points: 100
  goals:
    - To trace instructions through the single cycle datapath of the MIPS architecture by hand
    - To determine the control signal values that execute each MIPS instruction
    - To begin a software simulation of the single cycle datapath
  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The algorithm fails on the test inputs due to major issues, or the program fails to compile and/or run
      beginning: The algorithm fails on the test inputs due to one or more minor issues
      progressing: The algorithm is implemented to solve the problem correctly according to given test inputs, but would fail if executed in a general case due to a minor issue or omission in the algorithm design or implementation, including a Makefile
      proficient: A reasonable algorithm is implemented to solve the problem which correctly solves the problem according to the given test inputs, and would be reasonably expected to solve the problem in the general case   
    - weight: 20
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, or code structure departs significantly from best practice, and/or the code departs significantly from the style guide
      beginning: Code commenting and structure is limited in ways that reduce the readability of the program, and/or there are minor departures from the style guide
      progressing: Code documentation is present that re-states the explicit code definitions, and/or code is written that mostly adheres to the style guide
      proficient: Code is documented at non-trivial points in a manner that enhances the readability of the program, and code is written according to the style guide
    - weight: 20
      description: Writeup and Submission
      preemerging: An incomplete submission is provided
      beginning: The program is submitted, but not according to the directions in one or more ways (for example, because it is lacking a readme writeup)
      progressing: The program is submitted according to the directions with a minor omission or correction needed, and with at least superficial responses to the bolded questions throughout
      proficient: The program is submitted according to the directions, including a readme writeup describing the solution, and thoughtful answers to the bolded questions throughout
      
  readings:
    - rlink: ../Activities/MIPSSingleCycle
      rtitle: MIPS Single Cycle Activity
    - rlink: ../Assignments/SingleCycle
      rtitle: "Programming Assignment: Single Cycle Datapath and Control"

  questions:
    - Patterson and Hennessy Textbook Question 4.1
    - Patterson and Hennessy Textbook Question 4.2

tags:
  - mips
  - singlecycle

---

**Note**: This lab is the in-class companion to the [Single Cycle Datapath and Control programming assignment](../Assignments/SingleCycle).  Here, you will trace the datapath *by hand* and start a small simulator for a single instruction; in the assignment, you will grow that simulator to support a full (small) instruction set.

### Purpose

Before you can simulate the single cycle processor in software, you have to be able to execute it in your head: for any one instruction, which datapath components are used, what value is on each wire, and what each control signal must be.  This lab builds that skill with paper traces, and then converts one of your paper traces into the first lines of your simulator.

### Task

#### Part 1: Paper Traces of the Datapath

Using the single cycle datapath diagram from the [MIPS Single Cycle Activity](../Activities/MIPSSingleCycle), trace each of the following instructions.  For each one, sketch (or annotate a printout of) the datapath and label: (1) the value of the PC, (2) the values read from the register file, (3) the ALU inputs and output, (4) any memory address and data values, (5) the value written back (and to where), and (6) the value of every control signal (`RegDst`, `RegWrite`, `ALUSrc`, `ALUOp`, `MemRead`, `MemWrite`, `MemtoReg`, `Branch`, `Jump`).

Assume the instruction is at address `0x00400000`, that `$t0 = 8`, `$t1 = 5`, `$t2 = 12`, and `$sp = 0x7FFFEFFC`, and that memory at `0x7FFFF000` contains `42`.

1. `add $t0, $t1, $t2`
2. `lw $t3, 4($sp)`
3. `sw $t1, 4($sp)`
4. `beq $t1, $t2, 0x000C` (**Where does the PC go when the branch is taken?  When it is not taken?  Show the offset arithmetic.**)

**For each trace, write one sentence explaining why each control signal has the value it does.**

#### Part 2: A One-Instruction Simulator

In a programming language of your choice, begin the simulator you will complete in the programming assignment.  You may use arrays to simulate the register file and memory.

1. Create a 32-element array of registers and a small memory array.
2. Hard-code (or read from a file) the single instruction `add $t1, $t2, $t3`.
3. Decode the instruction into its fields (opcode, `rs`, `rt`, `rd`, `shamt`, `funct`) - you may decode from the assembly text or from the 32-bit machine encoding (the machine encoding is closer to what the real datapath does, and is worth the extra effort).
4. Set your control signal variables the way your paper trace says they should be set, "execute" the instruction by moving values between your arrays accordingly, and print the destination register before and after.

Verify that your simulator's register values match your Part 1 paper trace exactly.  **Include the paper traces from Part 1 (photos or ASCII sketches are fine) and this comparison in your readme writeup.**

If you finish early, add `sub` - you should find that only the ALU operation changes, and none of the control wiring; **why is that the case?**
