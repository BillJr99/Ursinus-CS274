---
layout: activity
permalink: /Activities/ComputerArithmeticAddSubtract
title: "CS274: Computer Architecture - Computer Arithmetic: Addition and Subtraction"


info:
  goals:
    - To add binary numbers including carry
    - To identify overflow
    - "To use two's complement to negate and subtract values"

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
            <th class="tg-1wig">Carry</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">1</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax"></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">A = 5</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">B = 6</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">Sum = 11</td>
            <td class="tg-0lax">X</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
          </tr>
        </tbody>
        </table>
      title: Addition in Binary
      questions:
        - "What is 0 + 0 in binary?  How about 0 + 1, 1 + 0, and 1 + 1?"
        - "What should happen if you encounter 1 + 1 in terms of the carry bit?  What should be done with the carry bit?"
        - "What is 1 + 1 + 1?"
        - "With a partner, choose two arbitrary values and ask the other to add them together in binary.  Check your partner's work."
        
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
            <th class="tg-1wig">A = 2</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">1</th>
            <th class="tg-0lax">0</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">One's Complement of A</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">B = Two's Complement of A</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">One's Complement of B</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">A = Two's Complement of B</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
        </tbody>
        </table>
      title: "Two's Complement of Binary Numbers and Subtraction"
      questions:
        - "The two's complement of a value is the inverse of the value's bits, plus one.  Why not use the one's complement to negate a value?  That is, what if we simply flipped the bits and did not add one to the result?"        
        - "What is the most significant bit of a negative number using this system?  A positive number?"
        - "Why not simply set the most significant bit to 1 for negative numbers, and not bother flipping the bits?"
        - "Subtract <code>6 - 4</code> by converting 4 to its two's complement value, and then adding them together."

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
            <th class="tg-1wig">Carry</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">1</th>
            <th class="tg-0lax">1</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax">0</th>
            <th class="tg-0lax"></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">A = 5</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">B = 14</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">Sum =</td>
            <td class="tg-0lax">X</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
          </tr>
        </tbody>
        </table>
      title: Overflow
      questions:
        - "Given that the most significant bit of the sum is 1, this is a negative number.  Using two's complement, determine this value's magnitude.  Is it correct?"
        - "Why is the result negative when we added two positive numbers together?"
        - "In your own words, how can you tell that overflow occurred?"
        - "How can you obtain overflow when subtracting two values? Provide an example."
        - "What is the largest 4 bit signed positive value that you can represent, and what is the smallest?"
        - "What is the largest 32 bit signed positive value that you can represent, and what is the smallest?"

    - model: |
        <div align="center">
        A quick-reference recap of the key rules from this activity.  Try to reproduce each one from memory before peeking!
        </div>
        <br>
        <strong>Key Rules and Formulas</strong>
        <ul>
        <li><strong>Single-bit addition facts</strong>: <code>0+0=0</code>; <code>0+1=1+0=1</code>; <code>1+1=0</code> carry 1; <code>1+1+1=1</code> carry 1.</li>
        <li><strong>Two's complement negation = invert the bits, then add 1</strong>.  Micro-example (4 bits): <code>2 = 0010</code>; invert to get <code>1101</code>; add 1 to get <code>1110 = -2</code>.  Negating again: invert <code>1110</code> to <code>0001</code>, add 1 to get <code>0010 = 2</code>.</li>
        <li><strong>Subtraction is addition</strong>: <code>A - B = A + (~B + 1)</code>.  Micro-example (4 bits): <code>6 - 4 = 0110 + 1100 = (1)0010 = 2</code>, discarding the carry out of the top bit.</li>
        <li><strong>Sign bit</strong>: the most significant bit is 1 for negative values, 0 for non-negative values.</li>
        <li><strong>Range of an n-bit signed value</strong>: <code>-2^(n-1)</code> to <code>2^(n-1) - 1</code>.  Micro-example: 4 bits hold -8..7; 32 bits hold -2147483648..2147483647.  The range is asymmetric because zero uses one of the &quot;positive&quot; patterns.</li>
        <li><strong>Overflow detection rules</strong>: adding two positives that yields a &quot;negative&quot; sum, or adding two negatives that yields a &quot;positive&quot; sum, is overflow.  Adding values of opposite signs can <em>never</em> overflow.  Micro-example (4 bits): <code>5 + 6 = 0101 + 0110 = 1011</code>, which reads as -5: overflow!</li>
        <li><strong>Overflow in subtraction</strong>: <code>A - B</code> overflows exactly when <code>A + (-B)</code> overflows, e.g. (4 bits) <code>7 - (-2) = 7 + 2 = 9 &gt; 7</code>: overflow.</li>
        </ul>
        <br>
        <pre>
        Carry:    0 1 1 0 0
        A = 5:      0 1 0 1
        B = 6:      0 1 1 0
                  =========
        Sum:        1 0 1 1   <-- sign bit is 1 but we added two positives: overflow!
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
          <tr><td class="tg-0lax">Carry (in/out)</td><td class="tg-0lax">The extra 1 passed to the next column when a column's sum exceeds 1</td></tr>
          <tr><td class="tg-0lax">One's complement</td><td class="tg-0lax">The value with every bit inverted</td></tr>
          <tr><td class="tg-0lax">Two's complement</td><td class="tg-0lax">One's complement plus 1; the standard encoding of negative integers</td></tr>
          <tr><td class="tg-0lax">Sign bit (MSB)</td><td class="tg-0lax">The most significant bit; 1 means negative in two's complement</td></tr>
          <tr><td class="tg-0lax">Overflow</td><td class="tg-0lax">A result too large or too small to fit in the available bits, indicated by an impossible sign</td></tr>
          <tr><td class="tg-0lax">Magnitude</td><td class="tg-0lax">The absolute value of a number; for a negative two's complement value, take the two's complement to read it</td></tr>
          <tr><td class="tg-0lax">Signed vs. unsigned</td><td class="tg-0lax">Whether the bit pattern is interpreted with a sign (range -2^(n-1)..2^(n-1)-1) or without (0..2^n - 1)</td></tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
      questions:
        - "Without looking, negate 5 in 4-bit two's complement, then compute 3 - 5 by addition and verify the answer is -2."

tags:
  - arithmetic
  - overflow

---

