---
layout: activity
permalink: /Activities/ComputerArithmeticAddSubtractLogicGates
title: "CS274: Computer Architecture - Computer Arithmetic: Addition and Subtraction Logic Gates"


info:
  goals:
    - To design truth tables and a circuit for addition
    - To design truth tables and circuit for overflow detection
    - To generzlie overflow detection using only the carry bits
    
  models:
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
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">A</th>
            <th class="tg-1wig">B</th>
            <th class="tg-1wig">Sum</th>
            <th class="tg-1wig">Carry</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
        </tbody>
        </table>
      title: Logic Gates for Adding and Subtracting
      questions:
        - Draw a truth table for addition for both sum and carry outputs.
        - Draw a circuit representing the sum and carry when adding two one-bit values.
        
    - model: |
        <a title="Hellbus, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Odometer_rollover.jpg"><img width="512" alt="Odometer rollover" src="https://commons.wikimedia.org/w/index.php?title=Special:Redirect/file/Odometer_rollover.jpg"></a>
      title: Overflow Detection
      questions:
        - Given that overflow occurs when the sign bit of the sum differs from the sign bit of the two inputs.
        - "Generate examples of overflow when adding values of like signs together (both positive and negative).  Generate examples of non-overview (for both positive and negative).  Finally, generate an example adding a positive and negative value together.  What do their carry bits have in common in the most significant bit?"
        - "Generalize how you can detect overflow by using only the carry in and carry out bits in the most significant digit.  Now, write this down in a truth table and draw a circuit for overflow detection." 
        - "What is the effect of declaring a variable as an <code>unsigned int</code> as opposed to an <code>int</code>?"

    - model: |
        <div align="center">
        A quick-reference recap of the key rules from this activity.  Try to reproduce each one from memory before peeking!
        </div>
        <br>
        <strong>Key Rules and Formulas</strong>
        <ul>
        <li><strong>Half adder (no carry in)</strong>: <code>sum = A XOR B</code>; <code>carry = A AND B</code>.  Micro-example: <code>A=1, B=1</code> gives <code>sum = 1 XOR 1 = 0</code>, <code>carry = 1 AND 1 = 1</code>: that is <code>1 + 1 = 10</code> binary.</li>
        <li><strong>Full adder (with carry in)</strong>: <code>sum = (A XOR B) XOR carryIn</code>; <code>carryOut = ((A XOR B) AND carryIn) OR (A AND B)</code>.  Micro-example: <code>A=1, B=1, carryIn=1</code> gives <code>sum = (1 XOR 1) XOR 1 = 1</code> and <code>carryOut = (0 AND 1) OR (1 AND 1) = 1</code>: that is <code>1 + 1 + 1 = 11</code> binary.</li>
        <li><strong>Overflow by signs</strong>: overflow occurs when the sign bit of the sum differs from the (shared) sign bit of the two inputs; adding opposite-sign values never overflows.</li>
        <li><strong>Overflow by carries</strong>: <code>overflow = carryIn XOR carryOut</code> at the most significant bit.  Micro-example (4 bits): <code>0101 + 0110</code>: the MSB column receives carry in 1 but produces carry out 0, and <code>1 XOR 0 = 1</code>: overflow.</li>
        <li><strong>Unsigned values</strong>: an <code>unsigned int</code> reinterprets the same n bits as 0..2^n - 1; the hardware adds identically, only the overflow interpretation changes (unsigned &quot;rollover,&quot; like an odometer wrapping from 999999 to 000000).</li>
        </ul>
        <br>
        <strong>Full Adder Truth Table</strong>
        <pre>
        carryIn  A  B | sum  carryOut
           0     0  0 |  0      0
           0     0  1 |  1      0
           0     1  0 |  1      0
           0     1  1 |  0      1
           1     0  0 |  1      0
           1     0  1 |  0      1
           1     1  0 |  0      1
           1     1  1 |  1      1
        </pre>
        <br>
        <strong>Glossary</strong>
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <thead>
          <tr><th class="tg-1wig">Term</th><th class="tg-1wig">Meaning</th></tr>
        </thead>
        <tbody>
          <tr><td class="tg-0lax">Truth table</td><td class="tg-0lax">A table listing a circuit's output for every combination of inputs</td></tr>
          <tr><td class="tg-0lax">Logic gate</td><td class="tg-0lax">A circuit computing a boolean function (AND, OR, XOR, NOT, ...)</td></tr>
          <tr><td class="tg-0lax">XOR</td><td class="tg-0lax">&quot;Exclusive or&quot;: 1 exactly when the inputs differ</td></tr>
          <tr><td class="tg-0lax">Half adder</td><td class="tg-0lax">Adds two 1-bit inputs, producing sum and carry</td></tr>
          <tr><td class="tg-0lax">Full adder</td><td class="tg-0lax">Adds two 1-bit inputs plus a carry in, producing sum and carry out</td></tr>
          <tr><td class="tg-0lax">Ripple-carry adder</td><td class="tg-0lax">A chain of full adders where each carry out feeds the next carry in</td></tr>
          <tr><td class="tg-0lax">Overflow</td><td class="tg-0lax">A signed result that does not fit; detected as carryIn XOR carryOut at the MSB</td></tr>
          <tr><td class="tg-0lax">Rollover</td><td class="tg-0lax">Unsigned wraparound past the maximum value, like an odometer</td></tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
      questions:
        - "Without looking, write the full adder's sum and carryOut formulas, then verify them against the truth table row where all three inputs are 1."

  additional_reading:
    - link: https://en.wikipedia.org/wiki/Year_2038_problem
      title: The Year 2038 Problem        
    - link: https://www.engadget.com/2015-05-01-boeing-787-dreamliner-software-bug.html
      title: "To keep a Boeing Dreamliner flying, reboot once every 248 days by Engadget"

tags:
  - arithmetic
  - overflow
  - circuit

---

