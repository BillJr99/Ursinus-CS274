---
layout: assignment
permalink: /Assignments/SingleCycle
title: "CS274: Computer Architecture - Single Cycle Datapath and Control"


info:
  coursenum: CS274
  points: 100
  goals:
    - To manipulate the single cycle datapath and control signals of the MIPS architecture
  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The program does not compile or run via the Makefile, cannot parse the assembly text file format, or executes instructions directly (for example, via string matching straight to a result) without modeling the datapath stages and control signals
      beginning: The program parses the input file and models the datapath, but one or more of the five required instructions (add, sub, beq, lw, sw) produces incorrect register or memory state due to a minor issue (for example, a control signal such as RegDst or ALUSrc set incorrectly, or a branch target miscomputed)
      progressing: All five instructions execute correctly for the tested programs, with simulated register and memory arrays and per-instruction control signals, but a general case fails -- for example, labels like "Label:" on the same line as an instruction are not parsed, beq's sign-extended and PC-relative offset is wrong for backward branches, or lw/sw offsets off $sp are mishandled
      proficient: The simulator reads a MIPS assembly file, resolves labels, and for each of add, sub, beq, lw, and sw models the single cycle datapath -- setting the control signals (RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp), reading the register array, computing through the ALU, and updating registers, memory, and the PC (including taken and not-taken branches) -- correctly in the general case; a Makefile compiles and runs it
    - weight: 20
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, the fetch/decode/execute logic is one monolithic block, and/or the code departs significantly from the style guide
      beginning: Comments are sparse or restate the code, and/or there are minor departures from the style guide that reduce the readability of the datapath logic
      progressing: The stages (fetch, decode, execute, memory, write-back) or units are organized into functions with comments describing what each does, and the code mostly adheres to the style guide, but comments restate definitions rather than naming the datapath elements and control lines being modeled
      proficient: The code is structured to mirror the datapath -- with separately identifiable register file, ALU, control, and memory components -- comments name the control signals and datapath elements each section models, and the code follows the style guide
    - weight: 20
      description: Writeup, Textbook Questions, and Submission
      preemerging: An incomplete submission is provided; the readme and the answers to Textbook Questions 4.1, 4.2, 4.4, 4.5, and 4.6 are missing
      beginning: The program is submitted, but the readme is missing the solution description or answers to one or more of Textbook Questions 4.1, 4.2, 4.4, 4.5, and 4.6
      progressing: The readme describes the solution and answers each of the five assigned questions, but one or more answers are superficial or state control signal values or latencies without showing which datapath elements and paths produced them
      proficient: The readme describes the solution (including an example input program and its resulting register/memory state), and each of Textbook Questions 4.1, 4.2, 4.4, 4.5, and 4.6 is answered correctly with work shown -- identifying the datapath blocks and control signal values involved and, where asked, the latency arithmetic along each path
      
  readings:
    - rlink: ../Activities/MIPSSingleCycle
      rtitle: MIPS Single Cycle Activity
    - rlink: https://makefiletutorial.com/
      rtitle: Makefile Tutorial by Example
    - rlink: https://www.gnu.org/software/make/manual/html_node/Introduction.html
      rtitle: "GNU Make Manual: Introduction"
    - rlink: https://www.gnu.org/software/libc/manual/html_node/Consistency-Checking.html
      rtitle: "Unit Testing in C with <code>assert.h</code>"
    - rlink: https://docs.python.org/3/library/unittest.html
      rtitle: "<code>unittest</code>: Unit Testing Framework in Python (if you choose Python)"

  questions:
    - Patterson and Hennessy Textbook Question 4.1
    - Patterson and Hennessy Textbook Question 4.2
    - Patterson and Hennessy Textbook Question 4.4
    - Patterson and Hennessy Textbook Question 4.5
    - Patterson and Hennessy Textbook Question 4.6

tags:
  - mips
  - singlecycle

---

### Purpose

This assignment asks you to build in software the machine we have been drawing on the board: the MIPS single cycle datapath and its control unit.  Deciding how each instruction flows through the register file, ALU, and memory -- and which control signals steer it -- cements how hardware executes the assembly you wrote earlier in the course, and sets up our study of pipelining, where this same datapath is split into stages.

### Task

In this assignment, you will simulate the datapath and control of the MIPS single cycle architecture in a programming language of your choice.  You may use arrays to simulate the register units and memory.

Read a MIPS assembly program from a text file, in this format:

```mips
add $t1, $t2, $t3
beq $t1, $t2, Label
Label: lw $t5, 0($sp)
```

You should support the `add`, `sub`, `beq`, `lw`, and `sw` instructions.  You may support more if you would like to test your program.

### Testing Your Work

Unit test the datapath components in isolation before wiring them together: your ALU, your control unit (given an opcode, assert the expected signal values from the control truth table), and your register file are each a few asserts away from confidence (see the unit testing readings above).  Automate the build and a sample simulation run with a Makefile -- a `make test` target that runs a short assembly file and checks the final register values will catch regressions as you add instructions.

### Written Questions: Points and Hints

The Writeup, Textbook Questions, and Submission criterion is worth 20 points, allocated as follows:

| Item | Points | A complete answer shows... |
| ---- | ------ | -------------------------- |
| Readme writeup | 5 | A description of your simulator's structure, how to build and run it via the Makefile, and an example program with its resulting register/memory state |
| Textbook Question 4.1 | 3 | Each subpart answered with the specific datapath signal values and widths identified, with reasoning |
| Textbook Question 4.2 | 3 | The instruction's effect traced through the datapath, stating the value carried on each requested wire/signal |
| Textbook Question 4.4 | 3 | For each fault or scenario given, which instructions still work and which break, justified by the datapath blocks and control lines involved |
| Textbook Question 4.5 | 3 | The requested datapath/control analysis with each control signal's value stated and defended |
| Textbook Question 4.6 | 3 | The latency computed along each relevant path (instruction memory, register file, ALU, data memory, muxes), with the arithmetic shown and the critical path identified |

**Hints**

* **General approach for all of these:** start from the single cycle datapath figure and, for the instruction or scenario in question, trace left to right -- PC, instruction memory, register file, sign extension, ALU, data memory, write-back mux -- writing down each control signal's value as you pass it.  Your simulator is doing exactly this, so the questions and the program check each other.
* **4.1:** Read the given logic carefully and answer in terms of bit widths and signal values; most subparts follow directly from which fields of the instruction word feed which datapath inputs.
* **4.2:** Identify the instruction's type (R-type, load/store, branch) first; that determines every mux setting, and the requested values fall out of tracing the operands through the datapath.
* **4.4:** For each fault, ask which instructions actually use the affected block or control line; an instruction that never exercises the broken element still works.  Organize your answer instruction-by-instruction (add/sub, lw, sw, beq).
* **4.5:** Determine what the modified or described datapath does to each instruction class by re-deriving the control signal table for it; state each signal as 0, 1, or X (don't care) and justify the X's.
* **4.6:** Sum the component latencies along each candidate path for each instruction type; lw usually exercises the longest path (instruction memory, register file, ALU, data memory, write-back).  The clock period is set by the slowest instruction's path -- show that comparison explicitly.
