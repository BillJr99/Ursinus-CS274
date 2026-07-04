---
layout: assignment
permalink: /Assignments/MIPSProgramming
title: "CS274: Computer Architecture - MIPS Programming"


info:
  coursenum: CS274
  points: 100
  goals:
    - To read, write, and execute a MIPS Assembly Language Program
    - To implement an algorithm in MIPS assembly

  rubric:
    - weight: 50
      description: Algorithm Implementation
      preemerging: The program does not assemble in the MIPS simulator, crashes at runtime, or does not implement the iterative power algorithm (for example, it prints a hard-coded value or uses a pseudoinstruction to do the whole computation)
      beginning: The program assembles and runs, prompting for x and y via syscalls, but computes an incorrect result on one or more of the provided test inputs due to a minor issue (for example, an off-by-one loop bound, an uninitialized result register, or reversed operands)
      progressing: The program assembles, prompts for x and y via syscalls, computes x^y iteratively with a loop and the mul instruction, and prints the correct result via a syscall for the provided test inputs, but would fail in a general small-input case (for example, y = 0 or x = 1 is not handled, or a register is clobbered between iterations)
      proficient: The program assembles and runs in the MIPS simulator, prompts the user for x and y using syscalls, computes x^y with an iterative loop using mul, correctly handles small general inputs including the y = 0 case, and prints the correct result to the console via a syscall
    - weight: 30
      description: Code Quality and Documentation
      preemerging: The assembly source has no comments and no register-use documentation, and/or labels and structure make the loop impossible to follow
      beginning: Comments are sparse or restate the instruction mnemonics (for example, "add one to t0"), and register usage is not documented, reducing the readability of the program
      progressing: Most lines or blocks are commented in terms of the algorithm (for example, "multiply result by x"), and register usage is mostly consistent, but a register-usage summary or meaningful label names are missing in places
      proficient: Each logical block of the program is commented in terms of the power algorithm rather than the mnemonics, a header comment documents which registers hold x, y, the loop counter, and the result, labels are meaningfully named, and register conventions (temporaries vs. saved) are respected
    - weight: 20
      description: Writeup, Textbook Questions, and Submission
      preemerging: An incomplete submission is provided; the readme, memory layout sketch, and answers to Textbook Questions 2.1-2.3 are missing
      beginning: The program is submitted, but the readme is missing one or more required elements (the solution description, the memory layout sketch, or answers to one or more of Textbook Questions 2.1-2.3 and the two address conversion questions)
      progressing: The readme describes the solution and includes the memory layout sketch and an answer to each of Textbook Questions 2.1-2.3 and the two address conversion questions, but the sketch omits one of the required segments or addresses, or one or more question answers are superficial or lack shown work
      proficient: The readme describes the solution, includes a memory layout sketch labeling the text segment, data segment, heap, and stack with their approximate addresses and the locations of the program's own labels, and answers each of Textbook Questions 2.1-2.3 and the two address conversion questions correctly with work shown (each MIPS line commented, register choices explained, and each address conversion step written out)

  questions:
    - Patterson and Hennessy Textbook Question 2.1
    - Patterson and Hennessy Textbook Question 2.2
    - Patterson and Hennessy Textbook Question 2.3
    - "Address Conversion Question A: a beq instruction at address 0x00400020 must branch back to a label at address 0x00400008.  Show, step by step, the 16-bit immediate field the assembler stores, and verify your answer by recomputing the target from PC + 4 and your immediate."
    - "Address Conversion Question B: encode the instruction j 0x00400024 as a 32-bit machine word (the opcode for j is 2).  Show how the 26-bit address field is derived from the target, and how the processor reconstructs the full 32-bit target address from the field."

  readings:
    - rlink: https://makefiletutorial.com/
      rtitle: Makefile Tutorial by Example
    - rlink: https://www.gnu.org/software/make/manual/html_node/Introduction.html
      rtitle: "GNU Make Manual: Introduction"
    - rlink: https://docs.python.org/3/library/unittest.html
      rtitle: "<code>unittest</code>: Unit Testing Framework in Python (useful for scripting checks of your program's outputs)"

tags:
  - mips
  - programming
  - iteration

---

### Purpose

This assignment gives you your first end-to-end experience writing, assembling, and running a MIPS assembly program: managing registers by hand, structuring a loop with branches, and interacting with the user through syscalls.  These skills underpin everything that follows in the course, because we will later build the very datapath and control hardware that executes instructions like these.

### Task

In this assignment, you will write a MIPS program that raises a value `x` to the power of `y`, according to the iterative algorithm given below.

```c
int power(int x, int y)
{
    int result = 1;
    for (int i = 1; i <= y; i++) {
        result = result * x;
    }
    return result;
}
```

Prompt the user for values of `x` and `y`, and print the result to the console using system calls.

You can use the pseudoinstruction `mul` as an R-type instruction to multiply two values together.  Multiplication can quickly overflow a 32-bit register, and although we will learn later how to deal with this, you can simply use small input values for `x` and `y` for now.

### Memory Layout Sketch

In your readme, include a sketch of your program's memory layout in the MIPS memory map.  Show where the text segment (your code), the data segment (your string literals and prompts declared with `.data`/`.asciiz`), the heap, and the stack live.  Label the approximate starting addresses: the text segment starts at `0x00400000`, static data starts at `0x10010000`, and the stack grows downward from `0x7FFFFFFC`.  Mark where your own labels (your `main` code and each of your `.asciiz` prompts) live within those segments.  An ASCII sketch in the readme is perfectly fine; a photographed hand drawing is fine too.

Here is a fully worked example for a small hello-world-style program with one prompt string `hello: .asciiz "Hello!"` and its code at `main:`:

```
High addresses
0x7FFFFFFC  +----------------------------+
            |   Stack ($sp starts here,  |
            |   grows DOWNWARD)          |
            |            |               |
            |            v               |
            ~                            ~
            |            ^               |
            |            |               |
            |   Heap (grows UPWARD,      |
            |   from sbrk/syscall 9)     |
0x10040000  +----------------------------+
            |   Static Data Segment      |
0x10010000  |   hello: .asciiz "Hello!"  |  <-- my label 'hello' is the first
            +----------------------------+      thing in .data, at 0x10010000
            |   Text Segment (code)      |
            |     ...                    |
            |     syscall                |
            |     la $a0, hello          |
0x00400000  |   main: li $v0, 4          |  <-- my label 'main' at 0x00400000
            +----------------------------+
            |   Reserved                 |
0x00000000  +----------------------------+
Low addresses
```

Your sketch should do the same for *your* program: same segments and addresses, but with your own labels marked where they actually live (you can confirm the addresses in the simulator's data and text segment windows).  This sketch is assessed as part of the Writeup, Textbook Questions, and Submission rubric criterion.

### Written Questions: Points and Hints

The Writeup, Textbook Questions, and Submission criterion is worth 20 points, allocated as follows:

| Item | Points | A complete answer shows... |
| ---- | ------ | -------------------------- |
| Readme writeup and memory layout sketch | 5 | A description of your solution, plus the memory layout sketch with all four segments, the three anchor addresses, and your own labels marked |
| Textbook Question 2.1 | 3 | The C statement translated to MIPS, each line commented, with register choices stated |
| Textbook Question 2.2 | 3 | The MIPS sequence translated back to a C statement, with the role of each register identified |
| Textbook Question 2.3 | 3 | A working MIPS translation of the C code, each line commented, with correct handling of any constants/immediates |
| Address Conversion Question A | 3 | The branch offset arithmetic shown step by step (PC + 4, byte offset, word offset, 16-bit two's complement), with the target recomputed as a check |
| Address Conversion Question B | 3 | The jump field derivation shown (target / 4), the assembled 32-bit word, and the pseudo-direct reconstruction of the target |

**Hints**

* **2.1:** Translate the C statement directly, respecting the register mappings given in the problem.  Break compound expressions into one operation per instruction, and use a temporary register for the intermediate value.
* **2.2:** Work backward: annotate what each instruction does to its registers, then collapse the sequence into a single C assignment.  Keep track of which register corresponds to which C variable per the problem's stated conventions.
* **2.3:** As in 2.1, map each C variable to its assigned register before writing any code.  Watch the signed immediates (`addi` sign-extends its constant), and comment each line with the C-level operation it performs.
* **Address Conversion A:** The stored immediate is `(target - (PC + 4)) / 4`, in words.  Since the target is *behind* the branch, expect a negative offset -- convert it to 16-bit two's complement (invert and add one), then check yourself by sign-extending, multiplying by 4, and adding back to PC + 4.  The worked examples in the [Machine Language activity](../Activities/MachineLanguage) follow exactly these steps.
* **Address Conversion B:** The jump field is the target address divided by 4 (dropping the two always-zero low bits), kept to 26 bits.  The machine word is the opcode in bits 31-26 followed by the field; the processor rebuilds the target by shifting the field left 2 and prepending bits 31-28 of PC + 4.

### Testing Your Work

Before you submit, test your program the way the rubric will: run it in the simulator on several small `(x, y)` pairs whose answers you can verify by hand, and be sure to include the edge case `y = 0` (the result should be 1).  If you find yourself re-running the same cases repeatedly, consider scripting your checks or driving the simulator from a Makefile target -- see the Makefile and unit testing readings above, which we will lean on heavily in the upcoming C assignments.
