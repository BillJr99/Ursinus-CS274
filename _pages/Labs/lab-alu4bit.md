---
layout: assignment
permalink: /Labs/ALU4Bit
title: "CS274: Computer Architecture - 4 Bit ALU Design"


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
    - rlink: ../Labs/ALU1Bit
      rtitle: "1-Bit ALU Lab"

tags:
  - alu
  - vhdl

---

### What to Do

#### Draw the Circuit Diagram for a 4-bit ALU

Draw a circuit diagram schematic for a 4-bit ALU using boolean logic gates and the below diagram of a 1-bit ALU.  Specifically, accept as inputs a 4-bit input `A` and a 4-bit input `B`, as well as an `Op` operation code, and connect the individual 1-bit ALU's to one another to produce a 4-bit output `result`, a 1-bit output `zero`, a 1-bit output `CarryOut`, and a 1-bit output `overflow`.

<img src="https://www.researchgate.net/profile/V-Bhanumathi/publication/321814052/figure/fig2/AS:745655408529409@1554789511084/Functional-block-diagram-of-one-bit-ALU_W640.jpg" alt="1 bit ALU">

#### Synthesis of a 4-bit ALU in VHDL

In this lab, you will create and test a 4-bit ALU using a structural design in VHDL.  The port definition is provided for you:

```vhdl
entity ALU4 is
port(a,b             : in std_logic_vector (3 downto 0);
     ALUOp           : in std_logic_vector (1 downto 0);
     result          : out std_logic_vector (3 downto 0);
     CarryOut        : out std_logic;
     overflow        : out std_logic);
end ALU4;
```

You can write four port maps to 1-bit ALU components to do this, but you could also instantiate multiple structural wirings using a `for...generate` loop that you may wish to consider:

```vhdl
alugen: for i in 3 downto 0 generate
   alu: alu1 PORT MAP(x => a(i), ...);
end generate alugen;
```

I recommend creating a `std_logic_vector(3 downto 0)` signal called `results` that you wire each of your individual 1-bit ALU results to.  You can then add a behavioral line to connect the result to the `result` output pin:

```vhdl
result <= results;
```

For the 1-bit ALU port maps, you should wire:

1. Each bit of `a` and `b` to each 1-bit ALU
2. The `ALUOp` port to all of the 1-bit ALUs

### Modifications for Essential Features

When finished with this base design, make the following three modifications.  For your carry bits, create a `std_logic_vector(4 downto 0)` signal called `carries`, and use these to pass the carry out of each 1-bit ALU to the carry in of the next. 

#### Modification 1: Subtraction
Add a `bInvert` pin, and wire it to the bInvert input of all of your 1-bit ALUs, and wire it to the least significant ALU `carryIn` bit (you can replace the `carrys(0)` input which is not used).  

#### Modification 2: Overflow Detection
Add an `ovf` overflow signal that is equal to the `carryIn xor carryOut` of the most significant ALU.  Add an `overflow` pin to your 4-bit ALU, and set `overflow` to `ovf` just like you did with the `result` signal above.

#### Modification 3: less than status bit
Add a `less` than output pin that is the most significant `results` bit `xor` the `ovf` detection signal.

### Extra Credit (20%): Zero Flag

Create a `zero` flag pin for your 4-bit ALU as follows:

```vhdl
zero : out std_logic;
```

Create and use a 4-bit `or` gate, and a `not` gate, to bitwise `or` together all four bits of your `results` signal, and invert that.  Your inverted output writes to the `zero` flag.
