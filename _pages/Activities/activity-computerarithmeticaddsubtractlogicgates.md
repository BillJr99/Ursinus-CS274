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
        <a title="Hellbus, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Odometer_rollover.jpg"><img width="512" alt="Odometer rollover" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Odometer_rollover.jpg"></a>
      title: Overflow Detection
      questions:
        - Given that overflow occurs when the sign bit of the sum differs from the sign bit of the two inputs.
        - "Generate examples of overflow when adding values of like signs together (both positive and negative).  Generate examples of non-overview (for both positive and negative).  Finally, generate an example adding a positive and negative value together.  What do their carry bits have in common in the most significant bit?"
        - "Generalize how you can detect overflow by using only the carry in and carry out bits in the most significant digit.  Now, write this down in a truth table and draw a circuit for overflow detection." 
        - "What is the effect of declaring a variable as an <code>unsigned int</code> as opposed to an <code>int</code>?"
        
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

