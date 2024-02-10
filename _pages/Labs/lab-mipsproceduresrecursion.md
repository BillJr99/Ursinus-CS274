---
layout: assignment
permalink: /Labs/MIPSProceduresRecursion
title: "CS274: Computer Architecture - Procedures and Recursion in MIPS"


info:
  coursenum: CS274
  points: 100
  goals:
    - To write a leaf procedure in MIPS assembly
    - To implement a recursive algorithm in MIPS assembly
    - To follow proper calling conventions with regard to register and stack use 
    - To save the return address register in non-leaf procedure implementations

  rubric:
    - weight: 60
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
    - weight: 10
      description: Writeup and Submission
      preemerging: An incomplete submission is provided
      beginning: The program is submitted, but not according to the directions in one or more ways (for example, because it is lacking a readme writeup)
      progressing: The program is submitted according to the directions with a minor omission or correction needed, and with at least superficial responses to the bolded questions throughout
      proficient: The program is submitted according to the directions, including a readme writeup describing the solution, and thoughtful answers to the bolded questions throughout

  readings:
    - rlink: https://en.wikipedia.org/wiki/Euclidean_algorithm
      rtitle: Euclidean GCD Algorithm

tags:
  - mips
  - programming
  - procedures
  - recursion

---

### What to Do

#### Part 1: Procedures

For this part of the lab, you may select any prior MIPS program you've written in this class, and modify it to call a proceudre.  For example, if you wrote a program to accept user input, compute a primality test, and output the result, you can move the primality test code into a procedure, and call it from `main`.

Any MIPS program that a) accepts user input from `main`, b) sets the `a` registers and calls a procedure with arguments from `main`, c) returns values via the `v` registers from within your procedure, and d) prints those values from `main` is acceptable.  You can write a new program if you wish.

Don't forget to save any `s` registers to the stack if your procedure uses them.  If your procedure calls any other procedures, you'll also need to save the `$ra` register.  If you do not save any `a` registers, please save the `$ra` register to the stack and restore it for practice.

#### Part 2: Recursion

Write a MIPS program that accepts two values `a` and `b` as user input, and that calls a recursive procedure `gcd` to compute their greatest common divisor using the Euclidean Algorithm.  This algorithm is reproduced below for your reference.  From `main`, print the return value from the `gcd` function.  

```c
int gcd(int a, int b) {
    if(b == 0) {
        return a;
    } else {
        return gcd(b, a % b);
    }
}
```

Don't forget to save and restore registers, including the return address register, from your procedure calls!