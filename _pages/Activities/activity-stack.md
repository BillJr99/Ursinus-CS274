---
layout: activity
permalink: /Activities/Stack
title: "CS274: Computer Architecture - The Stack"


info:
  goals:
    - To explain the direction in which the stack grows

  models:
    - model: |
        <img src="https://www.cs.fsu.edu/~hawkes/cda3101lects/chap3/F3.22.gif" alt="MIPS Stack Diagram">
      title: The MIPS Stack
      questions:
        - In which direction does the stack grow?  Why do you think this is?  In other words, why not have it grow in the same direction as the heap?
        - What MIPS instructions would save a value to the stack?  How would you save two values to the stack?
        - "Suppose a function <code>f1</code> saves three values to the stack, and then calls a function <code>f2</code> which saves two more values to the stack.  What does the stack look like, and where does the stack pointer point, after each function call?"
        - "Does <code>f1</code> and/or <code>f2</code> need to save the return address register <code>ra</code> to the stack?  Why or why not?"
        - "Write a program that calls a procedure, that then calls another procedure, saving registers to the stack along the way.  Diagram your call stack and share it with the class."

tags:
  - stack

---

