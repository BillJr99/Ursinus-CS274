---
layout: assignment
permalink: /Labs/ALU1Bit
title: "CS274: Computer Architecture - 1 Bit ALU Design"
excerpt: "CS274: Computer Architecture - 1 Bit ALU Design"

info:
  coursenum: CS274
  points: 100
  goals:
    - To synthesize an adder and classic logic gates into a 1-bit ALU

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
    - rlink: ../Labs/AdderDesign
      rtitle: Adder Design Lab

tags:
  - alu
  - vhdl

---

### What to Do

#### Create a 1-bit ALU

Using the adder circuit from the prior lab, create a 1-bit ALU by creating and wiring the following additional components:

1. Create and test a 3-bit and gate
2. Create and test a 4-to-1 multiplexor according to the design below.  You will create four input pins (`I0`, `I1`, `I2`, and `I3`), one select input (`s`: a 2-bit `std_logic_vector`), and an output pin.  Create four internal signals (`sig1`, `sig2`, `sig3`, and `sig4`) to hold the intermediate values.  You can port map four and gates to signals like this:
```vhdl
A1: and3 port map(w => I0, x => "not"(s(0)), y => "not"(s(1)), z => sig1);
```
Using these and gates, allow `I0` to pass when `s` is `10`, `I1` when `s` is `01`, and so on.  If a bit of `s` is `0`, invert it to produce a `1`.
Finally, You can `or` together the four internal signals, and wire that to the output pin, to complete the multiplexor.  Note that if you only need fewer than 4 inputs to your multiplexor (say, one for the adder, one for the `and` gate, and one for the `or` gate), you can simply wire `I0`, `I1`, and `I2` to those pins or signals, and then create a placeholder signal that you can wire to `I3`.  This will leave that pin essentially disconnected, or &quot;floating&quot;.  In other words, you can port map `I3` to `'0'`.
<br>
<img src="https://www.tutorialspoint.com/digital_circuits/images/4_1_multiplexer.jpg" alt="4-1 multiplexor">
<br>
<img src="https://www.tutorialspoint.com/digital_circuits/images/4_1_multiplexer_circuit_diagram.jpg" alt="Circuit design for the 4-1 multiplexor">
3. Create a structural ALU component that wires together a 2-bit and gate, a 2-bit or gate, and a full adder, and then multiplexes them together according to a select input, as shown in this design:
<br>
<img src="https://www.researchgate.net/profile/V-Bhanumathi/publication/321814052/figure/fig2/AS:745655408529409@1554789511084/Functional-block-diagram-of-one-bit-ALU_W640.jpg" alt="1 bit ALU">
Your ALU will include an input called `ALUOp`, which is a `std_logic_vector(1 downto 0)`.  You will wire this to the select input of the mux to choose which operation your ALU will perform!

When finished with this base design, make the following modification.

#### Subtraction
1. Create and test a 4-input or gate
2. Create and test a 2-to-1 multiplexor according to this design (note that your select input will only be 1 bit now!):
<br>
<img src="https://www.electronicshub.org/wp-content/uploads/2021/04/Logic-Circuit-of-2-to-1-MUX.jpg" alt="2-1 multiplexor">
3. Add a `bInvert` input bit to your design, and multiplex the input signal `b` with `not b` (using a 2-input mux), and use the resulting mux output as a signal to the remaining `b` inputs.  
