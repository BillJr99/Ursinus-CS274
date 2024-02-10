---
layout: assignment
permalink: /Labs/SingleCycle
title: "CS274: Computer Architecture - Single Cycle Datapath and Control"


info:
  coursenum: CS274
  points: 100
  goals:
    - To manipulate the single cycle datapath and control signals of the MIPS architecture
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

In this lab, you will simulate the datapath and control of the MIPS single cycle architecture in a programming language of your choice.  You may use arrays to simulate the register units and memory.

Read a MIPS assembly program from a text file, in this format:

```mips
add $t1, $t2, $t3
beq $t1, $t2, Label
Label: lw $t5, 0($sp)
```

You should support the `add`, `sub`, `beq`, `lw`, and `sw` instructions.  You may support more if you would like to test your program.