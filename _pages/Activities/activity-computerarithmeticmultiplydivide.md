---
layout: activity
permalink: /Activities/ComputerArithmeticMultiplyDivide
title: "CS274: Computer Architecture - Computer Arithmetic: Multiplication and Division"


info:
  goals:
    - To be able to multiply and divide integers using a basic algorithm
    - To optimize those algorithms for speed

  models:
    - model: |
        <img src="../images/muldiv/mul1.png" alt="Multiplication with a Simple Algorithm">
      title: Multiplication with a Simple Algorithm
      questions:
        - "Using only shift and add instructions, multiply a value in a register <code>$t0</code> by 3."
        - "Multiply 0010 by 0011 using this algorithm.  What does it remind you of?"
        - "Why does this algorithm require double the number of bits required for the input values to store the answer?  In other words, why does 4-bit multiplication require an 8-bit result, and why does 32-bit multiplication require a 64-bit result?"
        - "How might the MIPS architecture handle this 64-bit requirement, given that it only uses 32-bit registers?"
        - "How might the MIPS architecture perform these additions, given that it uses a 32-bit adder?  Hint - do you ever add more than 4 bits at a time in the example above?"

    - model: |
        <img src="../images/muldiv/mul2.png" alt="Multiplication using a 32-bit ALU">
      title: An Improved Multiplication Algorithm Using a 32-bit ALU
      questions:
        - "Draw the updated flow chart and hardware diagram for this algorithm."   
        - "How does this algorithm take advantage of unused hardware to simplify the hardware requirements?"
        
    - model: |
        <img src="../images/muldiv/mul3.png" alt="Multiplication using a 32-bit ALU and Reduced Hardware">
      title: An Improved Multiplication Algorithm Using a 32-bit ALU and Reduced Hardware
      questions:
        - "Draw the updated hardware diagram for this algorithm.  What components are consolidated, and were they previously unused?"   

    - model: |
        <img src="../images/muldiv/div1.png" alt="Division with a Simple Algorithm">
      title: Division
      questions:
        - "Draw the hardware diagram and flowchart for this algorithm."
        - "Where do you initialize the divisor and dividend for this algorithm?"
        - "Divide 0110 by 0011 using this algorithm."
        - "The quotient and remainder are each 4-bit values (or 32-bit values for 32-bit division).  Where does MIPS store these results?"
        - "What MIPS instructions support multiplication and division?"
        - "What MIPS instructions support manipulating the low and high register components?"

    - model: |
        <img src="../images/muldiv/div2.png" alt="Division using a 32-bit ALU and Reduced Hardware">
        <br>
        <img src="https://i.imgur.com/FQ9dQnU.png" alt="Hardware for a Binary Division Circuit">
        <br>
        <img src="https://i.imgur.com/BzcDA9q.png" alt="Algorithm Flowchart for a Binary Division Circuit">
      title: Improved Division Using a 32-bit ALU and Reduced Hardware
      questions:
        - "Draw the updated hardware diagram for this algorithm."
        - "How do these improvements compare to those you saw with the multiplier circuit and algorithm?"            

    - model: |
        <div align="center">
        A quick-reference recap of the key rules from this activity.  Try to reproduce each one from memory before peeking!
        </div>
        <br>
        <strong>Key Rules and Formulas</strong>
        <ul>
        <li><strong>Result sizes</strong>: multiplying two n-bit values needs up to 2n bits (e.g. <code>1111 * 1111 = 15 * 15 = 225 = 1110 0001</code>, 8 bits); division of n-bit values yields an n-bit quotient and an n-bit remainder.  MIPS holds these 64 bits in the <code>hi</code>/<code>lo</code> register pair.</li>
        <li><strong>Shift-and-add multiplication</strong>: for each bit of the multiplier from LSB to MSB: (1) if the bit is 1, add the multiplicand to the product; (2) shift the multiplicand left (or, in the improved version, shift the product right); (3) shift the multiplier right.  Repeat n times.</li>
        <li><strong>Multiply/divide by powers of two with shifts</strong>: <code>x &lt;&lt; k</code> = <code>x * 2^k</code> and <code>x &gt;&gt; k</code> = <code>x / 2^k</code>.  Micro-example: <code>x * 3 = (x &lt;&lt; 1) + x</code>.</li>
        <li><strong>Restoring division</strong>: repeatedly subtract the divisor from the remainder; if the result is negative, add the divisor back (restore) and shift a 0 into the quotient, otherwise shift in a 1; shift the divisor right (or remainder left) and repeat.</li>
        <li><strong>Division sanity check</strong>: <code>dividend = quotient * divisor + remainder</code>, with <code>0 &lt;= remainder &lt; divisor</code>.  Micro-example: <code>0110 / 0011</code>: 6 = 2 * 3 + 0, so quotient <code>0010</code>, remainder <code>0000</code>.</li>
        <li><strong>Hardware improvement idea</strong>: a 32-bit ALU suffices for 64-bit products because each step only ever adds 32 bits; shifting the product register right lets the multiplier share the product register's unused half.</li>
        <li><strong>MIPS instructions</strong>: <code>mult</code>/<code>multu</code> and <code>div</code>/<code>divu</code> compute into <code>hi</code> (upper product bits / remainder) and <code>lo</code> (lower product bits / quotient); <code>mfhi</code>/<code>mflo</code> move the results into general-purpose registers; <code>sll</code>/<code>srl</code> shift.</li>
        </ul>
        <br>
        <strong>Worked Step Table: 0010 x 0011 (2 x 3) by shift-and-add</strong>
        <pre>
        Step | Multiplier | Multiplicand | Action                  | Product
         0   |    0011    |  0000 0010   | initialize              | 0000 0000
         1   |    0011    |  0000 0010   | LSB=1: add multiplicand | 0000 0010
             |    0001    |  0000 0100   | shift both              |
         2   |    0001    |  0000 0100   | LSB=1: add multiplicand | 0000 0110
             |    0000    |  0000 1000   | shift both              |
         3-4 |    0000    |     ...      | LSB=0: shift only       | 0000 0110
        Result: 0000 0110 = 6.  Correct: 2 x 3 = 6!
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
          <tr><td class="tg-0lax">Multiplicand</td><td class="tg-0lax">The value being multiplied (added repeatedly)</td></tr>
          <tr><td class="tg-0lax">Multiplier</td><td class="tg-0lax">The value whose bits decide whether to add at each step</td></tr>
          <tr><td class="tg-0lax">Product</td><td class="tg-0lax">The result register, up to 2n bits wide</td></tr>
          <tr><td class="tg-0lax">Dividend</td><td class="tg-0lax">The value being divided</td></tr>
          <tr><td class="tg-0lax">Divisor</td><td class="tg-0lax">The value divided by</td></tr>
          <tr><td class="tg-0lax">Quotient / Remainder</td><td class="tg-0lax">The whole-number result and what is left over</td></tr>
          <tr><td class="tg-0lax">Restoring division</td><td class="tg-0lax">Division that adds the divisor back after a subtraction goes negative</td></tr>
          <tr><td class="tg-0lax">hi / lo</td><td class="tg-0lax">MIPS registers holding the upper/lower product halves, or remainder/quotient</td></tr>
          <tr><td class="tg-0lax">Booth's algorithm</td><td class="tg-0lax">A signed multiplication algorithm that recodes runs of 1s (see additional reading)</td></tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
      questions:
        - "Without looking, multiply 0011 by 0101 with the step table method, then check your answer in decimal (3 x 5 = 15)."

  additional_reading:
    - link: https://en.wikipedia.org/wiki/Booth%27s_multiplication_algorithm
      title: Booth's Multiplication Algorithm for Signed Values
    - link: https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_Green_Sheet.pdf
      title: MIPS Reference Data Sheet
      
  additional_practice:
    - link: https://www.math-drills.com/multiplication2/multiplying_base_system_02_binary_001.php
      title: Multiplying Binary Numbers
    - link: https://www.math-drills.com/division/dividing_base_system_02_binary_001.php
      title: Dividing Binary Numbers
    - link: https://www.cs.colostate.edu/~cs470/s08/multi_div.pdf
      title: Multiplication and Division Examples

tags:
  - arithmetic
  - multiplication
  - division

---

