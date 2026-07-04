---
layout: activity
permalink: /Activities/MIPSRecursion
title: "CS274: Computer Architecture - Recursion in MIPS"


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

    - model: |
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <p>A one-page summary of recursion in MIPS.</p>
        <p><strong>Key rules:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Rule</th>
            <th class="tg-1wig">Micro-example (factorial)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">A recursive procedure calls <code>jal</code>, and <code>jal</code> overwrites <code>$ra</code> -- so <code>$ra</code> MUST be saved to the stack in the prologue and restored in the epilogue.</td>
            <td class="tg-0lax">Without it, <code>factorial</code> returns to itself forever (or crashes)</td>
          </tr>
          <tr>
            <td class="tg-0lax">Save any argument you will still need <em>after</em> the recursive call, because <code>$a0</code> gets overwritten too.</td>
            <td class="tg-0lax">Save n; after <code>jal factorial</code> returns (n-1)!, compute n &times; (n-1)!</td>
          </tr>
          <tr>
            <td class="tg-0lax">Every recursion needs a base case that returns without another call.</td>
            <td class="tg-0lax">if n &lt;= 1, set <code>$v0</code> = 1 and return</td>
          </tr>
          <tr>
            <td class="tg-0lax">Each call gets its OWN stack frame; depth n recursion uses n frames of stack space.</td>
            <td class="tg-0lax"><code>factorial(3)</code> stacks 3 frames of (saved <code>$ra</code>, saved n): 8 bytes each = 24 bytes</td>
          </tr>
          <tr>
            <td class="tg-0lax">Results flow back through <code>$v0</code> as the frames unwind, last call first.</td>
            <td class="tg-0lax">1 &rarr; 2 &times; 1 = 2 &rarr; 3 &times; 2 = 6</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>The call stack for <code>factorial(3)</code></strong> at its deepest moment (the stack grows downward; each frame saved <code>$ra</code> and its n):</p>
        <pre>
        higher addresses
        +---------------------------+
        | main's frame              |
        +---------------------------+
        | factorial(3): $ra to main |
        |               saved n = 3 |
        +---------------------------+
        | factorial(2): $ra to fact |
        |               saved n = 2 |
        +---------------------------+
        | factorial(1): $ra to fact |
        |               saved n = 1 |   &lt;- $sp (base case: returns v0 = 1)
        +---------------------------+
        lower addresses

        unwinding: factorial(1) returns 1 -> factorial(2) computes 2*1 = 2 -> factorial(3) computes 3*2 = 6
        </pre>
        <p><strong>The recursive skeleton, step by step:</strong></p>
        <ol>
          <li>Prologue: <code>addi $sp, $sp, -8</code>; <code>sw $ra, 4($sp)</code>; <code>sw $a0, 0($sp)</code>.</li>
          <li>Base case test: <code>slti $t0, $a0, 2</code>; if <code>$t0</code> = 1, set <code>$v0</code> = 1 and skip to the epilogue.</li>
          <li>Recurse: <code>addi $a0, $a0, -1</code>; <code>jal factorial</code>.</li>
          <li>Combine: reload n with <code>lw $a0, 0($sp)</code>, then multiply it by <code>$v0</code> into <code>$v0</code>.</li>
          <li>Epilogue: <code>lw $ra, 4($sp)</code>; <code>addi $sp, $sp, 8</code>; <code>jr $ra</code>.</li>
        </ol>
        <p><strong>Glossary:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Term</th>
            <th class="tg-1wig">One-line definition</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">Recursion</td>
            <td class="tg-0lax">A procedure that calls itself on a smaller version of the problem.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Base case</td>
            <td class="tg-0lax">The input for which the procedure answers directly, ending the chain of calls.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Call stack</td>
            <td class="tg-0lax">The stack of frames for every call currently in progress, deepest call on top (lowest address).</td>
          </tr>
          <tr>
            <td class="tg-1wig">Stack frame</td>
            <td class="tg-0lax">One call's saved registers (at minimum <code>$ra</code> and needed arguments) on the stack.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Unwinding</td>
            <td class="tg-0lax">The return phase: frames pop off and partial results combine into the final answer.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Stack overflow</td>
            <td class="tg-0lax">Running out of stack memory, e.g. when a missing base case recurses forever.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Call stack trace (diagram)</td>
            <td class="tg-0lax">A drawing of the frames on the stack at some instant, like the one above.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

tags:
  - mips
  - procedures
  - recursion

---

