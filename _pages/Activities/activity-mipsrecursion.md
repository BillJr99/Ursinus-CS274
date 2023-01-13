---
layout: activity
permalink: /Activities/MIPSRecursion
title: "CS274: Computer Architecture - Recursion in MIPS"
excerpt: "CS274: Computer Architecture - Recursion in MIPS"

info:
  goals:
    - To properly use recursion and save the stack
    - To diagram a call stack trace for a given program

  models:
    - model: |
        <script src="https://gist.github.com/Peng-YM/be70d28079833bd701b05a5ce7772ff1.js"></script>
      title: A Recursive Algorithm
      questions:
        - "Draw a call stack for a call to <code>factorial(3)</code>."
        - "What registers did <code>factorial</code> save to the stack, and why?  In particular, why did it save <code>ra</code>?"
        - "Remove <code>ra</code> from the stack and re-run this program.  What happens, and why?"
        - How might one implement the Fibonacci sequence?

tags:
  - mips
  - procedures
  - recursion

---

