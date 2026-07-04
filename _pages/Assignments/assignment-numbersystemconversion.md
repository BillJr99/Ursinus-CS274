---
layout: assignment
permalink: /Assignments/Programming/NumberSystemConversion
title: "CS274: Computer Architecture - Number System Conversions"


info:
  coursenum: CS274
  points: 100
  goals:
    - To programmatically convert between numbers represented in base-2, base-10, and base-16
    - To develop appropriate unit tests for functions
    - To write and use a Makefile

  rubric:
    - weight: 50
      description: Algorithm Implementation
      preemerging: The program does not compile or run via the Makefile, or the conversions are performed by a library call (for example, parseInt with a radix, or int(s, base)) rather than by your own digit-by-digit algorithm
      beginning: The program builds and runs, prompting for the source base, target base, and input value, but produces incorrect conversions on one or more of the base-2, base-10, or base-16 test inputs due to a minor issue (for example, digits processed in the wrong order or an incorrect hex letter mapping)
      progressing: The program correctly converts between base 2, 10, and 16 by looping over the digits of the input string for the tested values, but would fail in a general case (for example, uppercase vs. lowercase hex digits, a value of 0, or one direction of conversion is hard-coded), or the Makefile does not both compile and run the program
      proficient: The program prompts for the source base, target base, and value as a string, correctly converts between any pair of bases 2, 10, and 16 by iterating over digits without using a base-conversion library, handles general cases such as 0 and hex letter digits, and includes a Makefile that compiles and runs it
    - weight: 20
      description: Test Cases
      preemerging: Testing was performed by hand outside of a unit test framework, or not performed at all
      beginning: A unit test framework is used, but only one or two trivial cases are checked (for example, a single one-digit conversion), and not every conversion function has a test
      progressing: Each conversion function has unit tests covering typical values, but some boundary cases or branches are untested (for example, 0, single-digit values, hex values containing letter digits, or one of the six base-pair directions)
      proficient: Each conversion function has unit tests covering all six base-pair directions and the boundary cases, including 0, single-digit values, multi-digit values, and hex values with letter digits, and all tests can be run from the Makefile
    - weight: 20
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, the conversion logic is a single monolithic block rather than functions, and/or the code departs significantly from the style guide
      beginning: Comments are sparse or restate the code (for example, "loop over the string"), and/or there are minor departures from the style guide that reduce readability
      progressing: The conversion logic is organized into functions with comments describing what each does, and the code mostly adheres to the style guide, but comments restate definitions rather than explaining the place-value reasoning
      proficient: Each conversion function is documented in terms of the algorithm (for example, how place values are accumulated or how remainders produce digits), variable names reflect their roles (base, digit, accumulator), and the code follows the style guide
    - weight: 10
      description: Writeup and Submission
      preemerging: An incomplete submission is provided; the readme is missing
      beginning: The program is submitted, but not according to the directions in one or more ways (for example, the readme is missing, or the Makefile and tests are not included in the submission)
      progressing: The program is submitted according to the directions with a minor omission or correction needed, and the readme describes the solution and how to build, run, and test it at least superficially
      proficient: The program is submitted according to the directions, including a readme that describes your conversion approach for each base pair, explains how to build and run the program and its unit tests via the Makefile, and gives thoughtful answers to any bolded questions throughout

  readings:
    - rlink: ../../Activities/NumberSystems
      rtitle: Number Systems Activity
    - rlink: https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
      rtitle: Makefile Tutorial by Bruce A. Maxwell      
    - rlink: https://antonz.org/makefile-automation/
      rtitle: Automate your Python project with Makefile by Anton Zhiyanov
    - rlink: https://libcheck.github.io/check/doc/check_html/check_3.html
      rtitle: "Check: Unit Testing in C"
    - rlink: https://java-programming.mooc.fi/part-6/3-introduction-to-testing
      rtitle: Introduction to Unit Testing in Java
    - rlink: https://machinelearningmastery.com/a-gentle-introduction-to-unit-testing-in-python/
      rtitle: A Gentle Introduction to Unit Testing in Python
    - rlink: https://docs.python.org/3/library/unittest.html
      rtitle: "<code>unittest</code>: Unit Testing Framework in Python"

tags:
  - numbers

---

### Purpose

This assignment builds fluency with the number systems the machine itself uses: binary, decimal, and hexadecimal.  By writing the digit-by-digit conversions yourself (rather than calling a library), you internalize place value and the bit/nibble relationship between binary and hex that we will use constantly when reading instruction encodings, addresses, and memory dumps.  You will also establish two habits we will rely on all semester: automating your build with a Makefile and validating each function with unit tests.

### Task

Recall the approaches we used to convert between a decimal value and a binary value, and between binary and hexadecimal values.  

In this assignment, you will write a program (or a series of programs) that:
1. allow the user to input which base they would like to convert from and to (base 2, 10, and 16),
2. allow the user to input a value in the base they're converting from
3. convert the value to the target base

The input value should be a string that represents the numeric value; this will facilitate your looping over each digit.  If desired, you may convert it to an integer data type.  However, you may not use a library to convert between the bases themselves: you should do that yourself!

You may use any of several programming languages: C, C++, Java, Python, or another language if pre-approved by the instructor.  You must, however, include a Makefile that compiles and runs the program.  In addition, you must provide appropriate unit tests for each of your functions.
