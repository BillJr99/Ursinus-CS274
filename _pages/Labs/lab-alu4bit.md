---
layout: assignment
permalink: /Labs/ALU4Bit
title: "CS274: Computer Architecture - 4 Bit ALU Design"
excerpt: "CS274: Computer Architecture - 4 Bit ALU Design"

info:
  coursenum: CS274
  points: 100
  goals:
    - To connect individual ALU designs into a multi-bit ALU

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
    - rlink: ../Labs/ALUDesign
      rtitle: 1-Bit ALU Design Lab

tags:
  - alu
  - vhdl

---

### What to Do

In this lab, you will create and test a 4-bit ALU using a structural design in VHDL.  The port definition is provided for you:

```vhdl
entity ALU4 is
port(a,b             : in std_ulogic_vector (3 downto 0);
     Op              : in std_ulogic_vector (1 downto 0);
     result          : out std_ulogic_vector (3 downto 0);
     zero            : out std_ulogic;
     CarryOut        : out std_ulogic;
     overflow        : out std_ulogic);
end ALU4;
```

You can instantiate multiple structural wirings using a `for...generate` loop that you may wish to consider:

```vhdl
alugen: for i in 3 downto 0 generate
   alu: alu1 PORT MAP(x => a(i), ...);
```

When finished with this base design, make two modifications.

#### Modification 1: less than status bit
Modify your design to support a less than output that is the most significant bit `xor` the overflow detection bit.

#### Modification 2: Subtraction
Add a bInvert bit to your design, use it as your least significant bit ALU carry in, and pass it to the bInvert input of your 1-bit ALUs (adding this to your 1-bit ALU design if necessary).