---
layout: activity
permalink: /Activities/ComputerArithmeticMultiplyDivide
title: "CS274: Computer Architecture - Computer Arithmetic: Multiplication and Division"
excerpt: "CS274: Computer Architecture - Computer Arithmetic: Multiplication and Division"

info:
  goals:
    - To be able to multiply and divide integers using a basic algorithm
    - To optimize those algorithms for speed

  models:
    - model: |
        <img src="../../images/muldiv/mul1.png" alt="Multiplication with a Simple Algorithm">
        <br>
        <img src="https://www.researchgate.net/profile/Darshan-Shah-19/publication/232322818/figure/fig1/AS:393475884371969@1470823369188/Figure-2-Hardware-of-shift-add-multiplication-Hardware-for-Shift-Add-multiplication-is_W640.jpg" alt="Hardware for a Shift and Add Multiplier">
        <br>
        <img src="https://i.stack.imgur.com/mKtQu.png" alt="Algorithm Flowchart for a Shift and Add Multiplier">
      title: Multiplication with a Simple Algorithm
      questions:
        - "Multiply 0010 by 0011 using this algorithm.  What does it remind you of?"
        - "Why does this algorithm require double the number of bits required for the input values to store the answer?  In other words, why does 4-bit multiplication require an 8-bit result, and why does 32-bit multiplication require a 64-bit result?"
        - "How might the MIPS architecture handle this 64-bit requirement, given that it only uses 32-bit registers?"
        - "How might the MIPS architecture perform these additions, given that it uses a 32-bit adder?  Hint - do you ever add more than 4 bits at a time in the example above?"

    - model: |
        <img src="../../images/muldiv/mul2.png" alt="Multiplication using a 32-bit ALU">
      title: An Improved Multiplication Algorithm Using a 32-bit ALU
      questions:
        - "Draw the updated flow chart and hardware diagram for this algorithm."   
        - "How does this algorithm take advantage of unused hardware to simplify the hardware requirements?"
        
    - model: |
        <img src="../../images/muldiv/mul3.png" alt="Multiplication using a 32-bit ALU and Reduced Hardware">
      title: An Improved Multiplication Algorithm Using a 32-bit ALU and Reduced Hardware
      questions:
        - "Draw the updated hardware diagram for this algorithm.  What components are consolidated, and were they previously unused?"   

    - model: |
        <img src="../../images/muldiv/div1.png" alt="Division with a Simple Algorithm">
      title: Division
      questions:
        - "Draw the hardware diagram and flowchart for this algorithm."
        - "Divide 0110 by 0011 using this algorithm."
        - "The quotient and remainder are each 4-bit values (or 32-bit values for 32-bit division).  Where does MIPS store these results?"
        - "What MIPS instructions support multiplication and division?"
        - "What MIPS instructions support manipulating the low and high register components?"

    - model: |
        <img src="../../images/muldiv/mul2.png" alt="Division using a 32-bit ALU and Reduced Hardware">
        <br>
        <img src="https://i.imgur.com/FQ9dQnU.png" alt="Hardware for a Binary Division Circuit">
        <br>
        <img src="https://i.imgur.com/BzcDA9q.png" alt="Algorithm Flowchart for a Binary Division Circuit">
      title: Improved Division Using a 32-bit ALU and Reduced Hardware
      questions:
        - "Draw the updated hardware diagram for this algorithm."
        - "How do these improvements compare to those you saw with the multiplier circuit and algorithm?"            

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

tags:
  - arithmetic
  - floatingpoint

---

