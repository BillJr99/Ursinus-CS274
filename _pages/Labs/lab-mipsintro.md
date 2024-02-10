---
layout: assignment
permalink: /Labs/MIPSIntro
title: "CS274: Computer Architecture - Introduction to MIPS Programming"


info:
  coursenum: CS274
  points: 100
  goals:
    - To read, write, and execute a MIPS Assembly Language Program
    - To gain familiarity with a MIPS simulator to run MIPS assembly language code

  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The algorithm fails on the test inputs due to major issues, or the program fails to compile and/or run
      beginning: The algorithm fails on the test inputs due to one or more minor issues
      progressing: The algorithm is implemented to solve the problem correctly according to given test inputs, but would fail if executed in a general case due to a minor issue or omission in the algorithm design or implementation
      proficient: A reasonable algorithm is implemented to solve the problem which correctly solves the problem according to the given test inputs, and would be reasonably expected to solve the problem in the general case
    - weight: 30
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
    - rlink: ../Activities/MIPSInstructions
      rtitle: MIPS Instruction Set Activity
    - rlink: https://www.billmongan.com/JsSpim/
      rtitle: JsSpim MIPS Simulator by Shawn Zhong
    - rlink: https://pages.cs.wisc.edu/~larus/spim.html#qtspim
      rtitle: SPIM MIPS Simulator
    - rlink: http://courses.missouristate.edu/kenvollmar/mars/
      rtitle: MARS MIPS Simulator    
    - rlink: https://courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html
      rtitle: MIPS System Calls    
    - rlink: https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_Green_Sheet.pdf
      rtitle: MIPS Reference Sheet      

  questions:
    - "Step through the &quot;Hello World&quot; example assembly program in your MIPS Simulator.  As you step from instruction to instruction, what registers and memory values change?"

tags:
  - mips
  - programming

---

The Flesch-Kincaid Reading Level is a measurement of the writing level of text.  It calculates the recommended grade level for the reader of the text.  The formula uses floating point vlues, but for simplicity, we'll modify the formula to use integers instead for this lab:

<span>\\(gradeLevel \approx wps + 5 \times spw - 12\\)</span>

Where `wps` is the number of words per sentence, and `spw` is the number of syllables per word in the text.  In this lab, you will write a MIPS assembly program to compute the Flesch-Kincaid Reading Level, given these values as inputs.

We'll use integers today because integers and floating point values are represented differently under the hood, so, as you'll soon learn, they use different instructions in the language to perform arithmetic on them!

### What to Do

#### Reading User Input
Begin by prompting the user to input integer values fomr `wps` and `spw` using a `syscall`.  To perform the syscall that prints the prompt to the screen, set `$v0` to 4 using the `li` instruction, set `$a0` to your prompt label using the `la` instruction, and call `syscall`.  In your `.data` section, you can declare your string variables.  Be sure to add a `\n` to the end of your string to print a newline!

Read in an integer using `syscall`, but this time merely set `$v0` to 5.  `$v0` will contain the integer the user types in when finished.  Repeat this process for each variable you wish to input: prompt the user, read an integer, and copy that integer into a register to save it (you can `add $t0, $v0, $zero` to copy `$v0` into `$t0`, but be sure to use a different register for `wps` and `spw`).

Keep in mind that the register `$v0` is overwritten by the user's input when you type in an integer value, so you'll need to reset `$v0` before making the next `syscall`.  

#### Computing the Formula

Use the R type instructions `add`, `sub`, and the pseudoinstruction `mul` (we will learn how MIPS processors multiply numbers later), calculate the grade level using the formula and the registers containing `wps` and `spw`.

#### Outputting the Result

To print an integer, invoke `syscall` with `$v0` set to 1, and `$a0` containing the value you wish to print.  Print the grade level.

#### Summary

The general strategy is as follows:

1. Perform a `syscall` number 4 to print a message prompting the user to input `wps`.
2. Perform a `syscall` number 5 to read in an integer.
3. Copy that value from `$v0` to a temporary register that will represent the `wps` value.
4. Perform a `syscall` number 4 to print a second message prompting the user to input `spw`.
5. Perform a `syscall` number 5 to read in an integer.
6. Copy that value from `$v0` to another temporary register that will represent the `spw` value.
7. Load your formula constants (the `12` and the `5` in the formula above) into temporary registers using `li` instructions.
8. Using the `add`, `sub`, and `mul` instructions, compute the formula into a new temporary register.  Be aware of order of operations!
9. Copy your answer into the `$a0` register, and perform a `syscall` number 1 to print an integer (the one stored in `$a0`).  This will print your result.
10. Perform a `syscall` number 10 to quit the program.
11. In the `.data` section, create two strings to hold your prompt messages (including a `\n` character for each).
