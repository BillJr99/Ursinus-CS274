---
layout: assignment
permalink: /Assignments/FloatingPoint
title: "CS274: Computer Architecture - Floating Point Bit Fields"
excerpt: "CS274: Computer Architecture - Floating Point Bit Fields"

info:
  coursenum: CS274
  points: 100
  goals:
    - To manipulate the fields of an IEEE 754 floating point value

  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The algorithm fails on the test inputs due to major issues, or the program fails to compile and/or run
      beginning: The algorithm fails on the test inputs due to one or more minor issues
      progressing: The algorithm is implemented to solve the problem correctly according to given test inputs, but would fail if executed in a general case due to a minor issue or omission in the algorithm design or implementation, including a Makefile
      proficient: A reasonable algorithm is implemented to solve the problem which correctly solves the problem according to the given test inputs, and would be reasonably expected to solve the problem in the general case
    - weight: 30
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, or code structure departs significantly from best practice, and/or the code departs significantly from the style guide
      beginning: Code commenting and structure is limited in ways that reduce the readability of the program, and/or there are minor departures from the style guide
      progressing: Code documentation is present that re-states the explicit code definitions, and/or code is written that mostly adheres to the style guide
      proficient: Code is documented at non-trivial points in a manner that enhances the readability of the program, and code is written according to the style guide
    - weight: 10
      description: Writeup and Submission
      preemerging: An incomplete submission is provided
      beginning: The program is submitted, but not according to the directions in one or more ways (for example, because it is lacking a readme writeup)
      progressing: The program is submitted according to the directions with a minor omission or correction needed, and with at least superficial responses to the bolded questions throughout
      proficient: The program is submitted according to the directions, including a readme writeup describing the solution, and thoughtful answers to the bolded or textbook questions throughout

  readings:
    - rlink: ../Activities/ComputerArithmeticFloatingPoint
      rtitle: "Computer Arithmetic: Floating Point Activity"

  questions:
    - Patterson and Hennessy Textbook Question 3.9
    - Patterson and Hennessy Textbook Question 3.13
    - Patterson and Hennessy Textbook Question 3.18
    - Patterson and Hennessy Textbook Question 3.21
    - Patterson and Hennessy Textbook Question 3.23
    - "What is the IEEE 754 single precision representation for the value 0.1?  What is the actual value of this binary representation?"

tags:
  - arithmetic
  - floatingpoint

---

Recall the C program to extract the IEEE bit fields from an IEEE 754 `float` data type:

<iframe height="400px" width="100%" src="https://repl.it/@BillJr99/FloatingPointStandard?lite=true" scrolling="no" frameborder="no" allowtransparency="true" allowfullscreen="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-same-origin allow-scripts allow-modals"></iframe> 

### What to Do

In this assignment, you will write a program to prompt the user for the sign, mantissa, and exponent of an IEEE 754 single precision floating point value (in binary).  Using the IEEE 754 standard, calculate the decimal value of this float.

Repeat this process for an IEEE 754 double precision floating point value.  Instead of an `int`, you can declare the mantissa as a `long int` to enable the additional bit storage.

You may use C, C++, Java, or Python for your solution, but be sure to include a Makefile that compiles and runs the program(s).
