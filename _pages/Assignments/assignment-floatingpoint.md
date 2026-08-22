---
layout: assignment
permalink: /Assignments/FloatingPoint
title: "CS274: Computer Architecture - Floating Point Bit Fields"


info:
  coursenum: CS274
  points: 100
  goals:
    - To manipulate the fields of an IEEE 754 floating point value

  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The program does not compile or run via the Makefile, or the decimal value is obtained by casting or by a library conversion rather than by applying the IEEE 754 formula to the user-entered fields
      beginning: The program builds, prompts for the sign, exponent, and mantissa bits, and applies the IEEE 754 formula, but produces an incorrect decimal value due to a minor issue (for example, the wrong exponent bias, a missing implicit leading 1, or mantissa bits weighted from the wrong end)
      progressing: The single precision case is decoded correctly for the tested inputs (sign, biased exponent of 127, implicit 1 plus fractional place values), but the double precision case is missing or incorrect (for example, the 1023 bias or long int mantissa storage is not handled), or a general input such as a negative value fails, or the Makefile does not both compile and run the program
      proficient: The program prompts for the sign, exponent, and mantissa in binary and correctly computes the decimal value for both single precision (bias 127, 23 mantissa bits) and double precision (bias 1023, 52 mantissa bits in a long int), including the implicit leading 1 and negative values, and includes a Makefile that compiles and runs it
    - weight: 30
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, the decoding is one uncommented block, and/or the code departs significantly from the style guide
      beginning: Comments are sparse or restate the code, and/or there are minor departures from the style guide that reduce the readability of the bit manipulation logic
      progressing: The decoding steps are commented and organized into functions, and the code mostly adheres to the style guide, but the comments restate operations rather than tying them to the IEEE 754 fields (sign, biased exponent, mantissa)
      proficient: Bit extraction and reconstruction steps are commented in terms of the IEEE 754 standard (which bits form the sign, exponent, and mantissa, and how bias and the implicit 1 are applied), single and double precision logic is cleanly separated or parameterized, and the code follows the style guide
    - weight: 10
      description: Writeup, Textbook Questions, and Submission
      preemerging: An incomplete submission is provided; the readme and the answers to the assigned textbook questions are missing
      beginning: The program is submitted, but the readme is missing the solution description or answers to one or more of the assigned questions (3.9, 3.13, 3.18, 3.21, 3.23, and the 0.1 representation question)
      progressing: The readme describes the solution and answers every assigned question, but one or more answers are superficial or state a result without showing the conversion or arithmetic work
      proficient: The readme describes the solution and answers each assigned question (3.9, 3.13, 3.18, 3.21, 3.23, and the 0.1 representation question) correctly with work shown, including the intermediate bit patterns, biased exponents, and rounding steps used to reach each answer

  readings:
    - rlink: ../Activities/ComputerArithmeticFloatingPoint
      rtitle: "Computer Arithmetic: Floating Point Activity"

  questions:
    - Patterson and Hennessy Textbook Question 3.9
    - Patterson and Hennessy Textbook Question 3.13
    - Patterson and Hennessy Textbook Question 3.18
    - Patterson and Hennessy Textbook Question 3.21
    - Patterson and Hennessy Textbook Question 3.23
    - "What is the IEEE 754 single precision representation for the value 0.1?  What is the actual value of this binary representation?"

tags:
  - arithmetic
  - floatingpoint

---

### Purpose

This assignment develops your working knowledge of the IEEE 754 floating point standard by having you reconstruct decimal values from their sign, exponent, and mantissa fields by hand and in code.  Decoding the bias, the implicit leading 1, and the fractional place values makes concrete why floating point arithmetic rounds the way it does, which we build on in our study of computer arithmetic hardware.

Recall the C program to extract the IEEE bit fields from an IEEE 754 `float` data type, shown below:

<iframe height="500px" width="100%" src="{{ site.baseurl }}/assets/code-viewer.html?zip=https%3A%2F%2Fraw.githubusercontent.com%2FBillJr99%2FUrsinus-CS274%2Fgh-pages%2Ffiles%2Freplit%2FFloatingPointStandard.zip&title=Floating%20Point%20Standard" scrolling="yes" frameborder="no" allowfullscreen="true" sandbox="allow-scripts allow-same-origin"></iframe>


### Task

In this assignment, you will write a program to prompt the user for the sign, mantissa, and exponent of an IEEE 754 single precision floating point value (in binary).  Using the IEEE 754 standard, calculate the decimal value of this float.

Repeat this process for an IEEE 754 double precision floating point value.  Instead of an `int`, you can declare the mantissa as a `long int` to enable the additional bit storage.

You may use C, C++, Java, or Python for your solution, but be sure to include a Makefile that compiles and runs the program(s).

### Written Questions: Points and Hints

The Writeup, Textbook Questions, and Submission criterion is worth 10 points, allocated as follows:

| Item | Points | A complete answer shows... |
| ---- | ------ | -------------------------- |
| Readme writeup | 4 | A description of your decoding approach and how to build and run your program(s) via the Makefile |
| Textbook Question 3.9 | 1 | The arithmetic carried out in the requested representation, with intermediate values and any overflow noted |
| Textbook Question 3.13 | 1 | Each step of the computation shown, not just the final bit pattern or value |
| Textbook Question 3.18 | 1 | The value converted to the requested IEEE format, with the sign, biased exponent, and mantissa fields identified separately |
| Textbook Question 3.21 | 1 | The bit pattern interpreted under each requested reading, with the work for each interpretation |
| Textbook Question 3.23 | 1 | The conversion and a statement of the rounding/accuracy consequences the problem asks about |
| IEEE 754 representation of 0.1 | 1 | The single precision bit pattern for 0.1, the exact decimal value that pattern actually represents, and a sentence on why they differ |

**Hints**

* **3.9:** Set up the operands in the requested format first, then perform the arithmetic digit-by-digit in that base; state explicitly whether the result fits in the given number of bits.
* **3.13:** Convert to binary scientific notation (normalize to 1.xxxx times 2^e) before touching the fields; then apply the bias to get the stored exponent and truncate/round the fraction to the available mantissa bits.
* **3.18:** Work field by field: sign bit from the value's sign, exponent from the normalized power of two plus the bias, mantissa from the bits after the implicit leading 1.  Double-check your bias against the format's exponent width.
* **3.21:** The same 32 bits mean different things under different interpretations; decode the pattern once per requested reading (integer, instruction, floating point), and for the floating point reading undo the bias and re-attach the implicit 1.
* **3.23:** After converting, compare the exactly representable neighbor values; the gap between them tells you how much accuracy is lost and connects to your program's output.
* **0.1 question:** 0.1 has an infinitely repeating binary fraction; carry the expansion a few bits past the 23-bit mantissa so you can round correctly, then convert the stored pattern back to decimal to see the exact value your program would report.
