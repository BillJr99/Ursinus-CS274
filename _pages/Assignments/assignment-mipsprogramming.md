---
layout: assignment
permalink: /Assignments/MIPSProgramming
title: "CS274: Computer Architecture - MIPS Programming"
excerpt: "CS274: Computer Architecture - MIPS Programming"

info:
  coursenum: CS274
  points: 100
  goals:
    - To read, write, and execute a MIPS Assembly Language Program
    - To implement an algorithm in MIPS assembly

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

  questions:
    - Patterson and Hennessy Textbook Question 2.1
    - Patterson and Hennessy Textbook Question 2.2
    - Patterson and Hennessy Textbook Question 2.3

tags:
  - mips
  - programming
  - iteration

---

### What to Do

In this assignment, you will write a MIPS program that raises a value `x` to the power of `y`, according to the iterative algorithm given below.

```c
int power(int x, int y)
{
    int result = 1;
    for (int i = 1; i <= y; i++) {
        result = result * x;
    }
    return result;
}
```

Prompt the user for values of `x` and `y`, and print the result to the console using system calls.

You can use the pseudoinstruction `mul` as an R-type instruction to multiply two values together.  Multiplication can quickly overflow a 32-bit register, and although we will learn later how to deal with this, you can simply use small input values for x and y for now.