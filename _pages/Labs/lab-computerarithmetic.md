---
layout: assignment
permalink: /Labs/ComputerArithmetic
title: "CS274: Computer Architecture - Computer Arithmetic"
excerpt: "CS274: Computer Architecture - Computer Arithmetic"

info:
  coursenum: CS274
  points: 100
  goals:
    - To implement computer multiplication and division algorithms

  rubric:
    - weight: 50
      description: Algorithm Implementation
      preemerging: The algorithm fails on the test inputs due to major issues, or the program fails to compile and/or run
      beginning: The algorithm fails on the test inputs due to one or more minor issues
      progressing: The algorithm is implemented to solve the problem correctly according to given test inputs, but would fail if executed in a general case due to a minor issue or omission in the algorithm design or implementation
      proficient: A reasonable algorithm is implemented to solve the problem which correctly solves the problem according to the given test inputs, and would be reasonably expected to solve the problem in the general case
    - weight: 30
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
      proficient: The program is submitted according to the directions, including a readme writeup describing the solution, and thoughtful answers to the bolded or textbook questions throughout
  readings:
    - rlink: ../Activities/ComputerArithmeticMultiplyDivide
      rtitle: "Computer Arithmetic: Multiplication and Division Algorithms"

tags:
  - arithmetic
  - multiplication
  - division

---

### What to Do

In this lab, you will write two programs (or two functions): one to multiply two binary numbers, and one to divide two binary numbers.  Follow the circuitry and control from the flowcharts for the algorithm we learned.  In other words, each register in the circuit should be a variable in your program, and your implementation should simulate a state machine as indicated by the algorithm control flowchart.

You will write this program in MIPS assembly, storing the floating point values in 32-bit registers, and storing the result in a pair of 32-bit registers for the result of the multiplication or division.  For the quotient, one register will represent the quotient and the other will represent the remainder.

Note that you may not use the `mul` or `div` instructions on this lab; rather, you will use the arithmetic instructions `sll`, `add` and others as you may need.