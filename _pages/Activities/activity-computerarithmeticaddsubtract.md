---
layout: activity
permalink: /Activities/ComputerArithmeticAddSubtract
title: "CS274: Computer Architecture - Computer Arithmetic: Addition and Subtraction"
excerpt: "CS274: Computer Architecture - Computer Arithmetic: Addition and Subtraction"

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

tags:
  - arithmetic
  - overflow

---

