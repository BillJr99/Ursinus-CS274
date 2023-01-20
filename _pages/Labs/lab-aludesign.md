---
layout: assignment
permalink: /Labs/ALUDesign
title: "CS274: Computer Architecture - ALU Design"
excerpt: "CS274: Computer Architecture - ALU Design"

info:
  coursenum: CS274
  points: 100
  goals:
    - To design an ALU using logic gates
    - To implement an ALU design using both a structural and behavioral approach using VHDL

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
    - rlink: https://lauri.xn--vsandi-pxa.com/hdl/ghdl.html
      rtitle: Using ghdl
    - rlink: https://lauri.xn--vsandi-pxa.com/hdl/gtkwave.html
      rtitle: Producing and viewing ghdl waveforms with GtkWave
    - rlink: ../Activities/ALU
      rtitle: ALU Activity

tags:
  - alu
  - vhdl

---

### Background: VHDL

A basic circuit can be expressed using the VHDL language as follows:

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity and2 is
    port (
        a  : in  std_logic;
        b  : in  std_logic;
        z : out std_logic);
end and2;

architecture behavioral of full_adder is
begin
    z <= a and b after 2 ns;
end;
```

This `and` gate features two input pins and a single output pin.  Its behavior is defined using the logic formula `a and b` with an optional 2 ns delay (to simulate propagation delay).

To test a circuit, you can create a `testbench` that actuates the circuit with values you can specify:

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity and2_tb is
end and2_tb;

architecture behavior of and_tb is
    component and2 is
    port (
        a  : in  std_logic;
        b  : in  std_logic;
        z : out std_logic);    
    end component;
    
    signal input  : std_logic_vector(1 downto 0);
    signal output : std_logic;
begin
    test1: and2 port map (
        a => input(0),
        b => input(1),
        z => output
    );

    tb_proc: process
    begin
        input <= "00"; wait for 30 ns; assert output = '0' report "0&0 failed";
        input <= "01"; wait for 30 ns; assert output = '0' report "0&1 failed";
        input <= "10"; wait for 30 ns; assert output = '0' report "1&0 failed";
        input <= "11"; wait for 30 ns; assert output = '0' report "1&1 failed";
        report "Testbench finished";
        wait;
    end process;
end;
```

This testbench has no pins of its own, but rather creates signals for the pins of the circuit it is testing (`input` and `output`).  It imports the `and2` circuit, and starts a process to test each set of values and assert their output.

#### Structural Circuit Definitions

An important feature of VHDL is that it allows you to import other components and wire them directly, rather than having to define everything behavrioally through potentially complex boolean logic formulas.

For example, suppose you've created the `and` gate above and a similar `xor` gate.  You could combine them by simulating the wiring using a structural definition to create a half adder:

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	port (
		a: in STD_LOGIC;
		b: in STD_LOGIC;
		sum: out STD_LOGIC;
		carry: out STD_LOGIC
	);
end half_adder;
  
architecture structural of half_adder is	

  component xor_2
	  port(a,b : in std_logic;
	       c   : out std_logic);
  end component;
  
  component and_2
	  port(a,b : in std_logic;
	  c   : out std_logic);
  end component;
  
begin
	X1 : xor_2 port map(a => a, b => b, c => sum);
	A1 : and_2 port map(a => a, b => b, c => carry);
end structural;
```

### Using ghdl

You can compile and run your vhdl program by compiling each vhdl file, and simulating the testbench:

```
ghdl -a and2.vhd
ghdl -a and2_tb.vhd
ghdl -e and2_tb
./and2_tb --vcd=waveform.vcd
```
This will output the report statements within the testbench and output a waveform timeline that you can view in `gtkwave`.

You can view the waveform via:

```
gtkwave waveform.vcd
```

You may need to zoom in and out of the gtk window to see the whole waveform.

### What to Do

1. Create and test a 2-bit and gate
2. Create and test a 2-bit or gate
3. Create and test a full adder that accepts `a`, `b`, and `carryIn`, and outputs `sum` and `carryOut`, either behaviorally or structurally.
4. Create and test a 3-bit and gate
5. Create and test a 4-to-1 multiplexor according to this design:
<img src="https://www.tutorialspoint.com/digital_circuits/images/4_1_multiplexer.jpg" alt="4-1 multiplexor">
<br>
<img src="https://www.tutorialspoint.com/digital_circuits/images/4_1_multiplexer_circuit_diagram.jpg" alt="Circuit design for the 4-1 multiplexor">
6. Create a structural ALU component that wires together a 2-bit and gate, a 2-bit or gate, and a full adder, and then multiplexes them together according to a select input, as shown in this design:
<img src="https://www.researchgate.net/profile/V-Bhanumathi/publication/321814052/figure/fig2/AS:745655408529409@1554789511084/Functional-block-diagram-of-one-bit-ALU_W640.jpg" alt="1 bit ALU">
