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
        <p>A one-page summary of the stack.</p>
        <p><strong>Key rules:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Rule</th>
            <th class="tg-1wig">Micro-example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">The stack grows DOWNWARD, from high addresses toward low ones; the heap grows upward toward it.</td>
            <td class="tg-0lax">If <code>$sp</code> = <code>0x7FFFEFFC</code>, pushing moves it to <code>0x7FFFEFF8</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Push one word: subtract 4 from <code>$sp</code>, then store.</td>
            <td class="tg-0lax"><code>addi $sp, $sp, -4</code> then <code>sw $s0, 0($sp)</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Pop one word: load, then add 4 back to <code>$sp</code>.</td>
            <td class="tg-0lax"><code>lw $s0, 0($sp)</code> then <code>addi $sp, $sp, 4</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Push n registers at once: subtract 4n, then store at offsets 0, 4, 8, ...</td>
            <td class="tg-0lax">Two values: <code>addi $sp, $sp, -8</code>; <code>sw $s0, 0($sp)</code>; <code>sw $s1, 4($sp)</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Last in, first out: restore in the reverse order you saved, and leave <code>$sp</code> exactly where you found it.</td>
            <td class="tg-0lax">A procedure that does <code>-8</code> on entry must do <code>+8</code> before <code>jr $ra</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Save <code>$ra</code> on the stack whenever your procedure calls another one (including itself).</td>
            <td class="tg-0lax">If <code>f1</code> calls <code>f2</code>, <code>f1</code> saves <code>$ra</code>; a leaf procedure like <code>f2</code> need not</td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>Memory map and a two-call stack</strong> (<code>f1</code> pushes three words, then calls <code>f2</code>, which pushes two more):</p>
        <pre>
        high addresses
        +---------------------+  0x7FFFFFFF-ish
        |  stack (grows down) |
        |    f1: word 3       |
        |    f1: word 2       |
        |    f1: word 1       |   &lt;- $sp after f1's pushes (-12)
        |    f2: word 2       |
        |    f2: word 1       |   &lt;- $sp during f2 (-8 more, -20 total)
        |         |           |
        |         v           |
        |                     |
        |         ^           |
        |         |           |
        |  heap (grows up)    |
        +---------------------+
        |  data (globals)     |
        +---------------------+
        |  text (your code)   |
        +---------------------+
        low addresses
        </pre>
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
            <td class="tg-1wig">Stack</td>
            <td class="tg-0lax">The last-in-first-out memory region used for saved registers, locals, and return addresses.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Stack pointer (<code>$sp</code>)</td>
            <td class="tg-0lax">Register 29: always holds the address of the newest (lowest) word on the stack.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Push / Pop</td>
            <td class="tg-0lax">Adding a word to the stack (move <code>$sp</code> down, store) / removing one (load, move <code>$sp</code> up).</td>
          </tr>
          <tr>
            <td class="tg-1wig">Stack frame</td>
            <td class="tg-0lax">All the words one procedure call pushed; popped as a unit when it returns.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Heap</td>
            <td class="tg-0lax">The region for dynamically allocated data; grows upward, opposite the stack, so they share free space.</td>
          </tr>
          <tr>
            <td class="tg-1wig">LIFO</td>
            <td class="tg-0lax">Last in, first out: the most recently pushed word is the first one popped.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Word alignment</td>
            <td class="tg-0lax">Stack pushes move <code>$sp</code> in multiples of 4 because registers are 4 bytes.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

tags:
  - stack

---

