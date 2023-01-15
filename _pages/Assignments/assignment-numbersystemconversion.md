---
layout: assignment
permalink: /Assignments/Programming/NumberSystemConversion
title: "CS274: Computer Architecture - Number System Conversions"
excerpt: "CS274: Computer Architecture - Number System Conversions"

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
      preemerging: The algorithm fails on the test inputs due to major issues, or the program fails to compile and/or run
      beginning: The algorithm fails on the test inputs due to one or more minor issues
      progressing: The algorithm is implemented to solve the problem correctly according to given test inputs, but would fail if executed in a general case due to a minor issue or omission in the algorithm design or implementation, including a Makefile
      proficient: A reasonable algorithm is implemented to solve the problem which correctly solves the problem according to the given test inputs, and would be reasonably expected to solve the problem in the general case
    - weight: 20
      description: Test Cases
      preemerging: Testing was performed outside of the unit test framework, or not performed at all
      beginning: Trivial test cases are provided in a unit test framework
      progressing: Test cases that cover some, but not all, boundary cases and branches of the program are provided
      proficient: Test cases that cover all boundary cases and branches of the program are provided      
    - weight: 20
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, or code structure departs significantly from best practice, and/or the code departs significantly from the style guide
      beginning: Code commenting and structure is limited in ways that reduce the readability of the program, and/or there are minor departures from the style guide
      progressing: Code documentation is present that re-states the explicit code definitions, and/or code is written that mostly adheres to the style guide
      proficient: Code is documented at non-trivial points in a manner that enhances the readability of the program, and code is written according to the style guide
    - weight: 10
      description: Writeup and Submission
      preemerging: An incomplete submission is provided
      beginning: The program is submitted, but not according to the directions in one or more ways (for example, because it is lacking a readme writeup)
      progressing: The program is submitted according to the directions with a minor omission or correction needed, and with at least superficial responses to the bolded questions throughout
      proficient: The program is submitted according to the directions, including a readme writeup describing the solution, and thoughtful answers to the bolded questions throughout

  readings:
    - rlink: ../Activities/NumberSystems
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

# What to Do

Recall the approaches we used to convert between a decimal value and a binary value, and between binary and hexidecimal values.  

In this assignment, you will write a program (or a series of programs) that:
1. allow the user to input which base they would like to convert from and to (base 2, 10, and 16),
2. allow the user to input a value in the base they're converting from
3. convert the value to the target base

The input value should be a string that represents the numeric value; this will facilitate your looping over each digit.  If desired, you may convert it to an integer data type.  However, you may not use a library to convert between the bases themselves: you should do that yourself!

You may use any of several programming languages: C, C++, Java, Python, or another language if pre-approved by the instructor.  You must, however, include a Makefile that compiles and runs the program.  In addition, you must provide appropriate unit tests for each of your functions.