---
layout: assignment
permalink: /Labs/AdderDesign
title: "CS274: Computer Architecture - Adder Design"
excerpt: "CS274: Computer Architecture - Adder Design"

info:
  coursenum: CS274
  points: 100
  goals:
    - To design an adder using logic gates
    - To implement an adder design using both a structural and behavioral approach using VHDL

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
    - rlink: https://www.tutorialspoint.com/vlsi_design/vlsi_design_vhdl_introduction.htm
      rtitle: VHDL Tutorial
    - rlink: ../Activities/ALU
      rtitle: ALU Activity

tags:
  - alu
  - vhdl

---

In this lab, you will use a tool called [ghdl](http://ghdl.free.fr/download.html) to compile Virtual Hardware Description Language (VHDL) code that describes circuit wirings for various logic components.  On Mac OS systems, you can install ghdl using [homebrew](https://brew.sh/) via this command: `brew install --cask ghdl gtkwave`, and on Linux, you can install using this command: `sudo apt-get install ghdl gtkwave` (these will also install the gtkwave system that Windows users will download later in this lab).  Alternatively, if you have any difficulty running these tools locally, you can run many ghdl commands through [replit](https://replit.com/@BillJr99/VHDLExample).

Using these tools, you will implement an adder circuit using the VHDL language.

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

architecture behavioral of and2 is
begin
    -- This is a comment: set z to a and b with a 2ns delay
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

architecture behavior of and2_tb is
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
        input <= "11"; wait for 30 ns; assert output = '1' report "1&1 failed";
        report "Testbench finished";
        wait;
    end process;
end;
```

This testbench has no pins of its own, but rather creates signals for the pins of the circuit it is testing (`input` and `output`).  It imports the `and2` circuit, and starts a process to test each set of values and assert their output.

### Using ghdl

You can compile and run your vhdl program by compiling each vhdl file, and simulating the testbench:

```
ghdl -a and2.vhd
ghdl -a and2_tb.vhd
ghdl -e and2_tb
ghdl -r and2_tb --vcd=waveform.vcd # on some systems, this command may be: ./and2_tb --vcd=waveform.vcd
```
This will output the report statements within the testbench and output a waveform timeline that you can view in `gtkwave`.

You can view the waveform by downloading a tool called [gtkwave](https://sourceforge.net/projects/gtkwave/), and running:

```
gtkwave waveform.vcd
```

You may need to zoom in and out of the gtk window to see the whole waveform.

#### Creating Complex Circuits Using Structural Circuit Definitions: a Half Adder

An important feature of VHDL is that it allows you to import other components and wire them directly, rather than having to define everything behavrioally through potentially complex boolean logic formulas.

For example, suppose you've created the `and` gate above and a similar `xor` gate.  You could combine them by simulating the wiring using a structural definition to create a half adder:

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	port (
		a: in std_logic;
		b: in std_logic;
		sum: out std_logic;
		carry: out std_logic
	);
end half_adder;
  
architecture structural of half_adder is	

  component xor2
	  port(a,b : in std_logic;
	       z   : out std_logic);
  end component;
  
  component and2
	  port(a,b : in std_logic;
	  z   : out std_logic);
  end component;
  
begin
	X1 : xor2 port map(a => a, b => b, z => sum);
	A1 : and2 port map(a => a, b => b, z => carry);
end structural;
```

Here is a testbench for the half adder:

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture behavior of tb is
    component half_adder is
	port (
		a: in std_logic;
		b: in std_logic;
		sum: out std_logic;
		carry: out std_logic
	);  
    end component;
    
	signal input  : std_logic_vector(1 downto 0);
	signal output : std_logic_vector(1 downto 0);

begin
    test1: half_adder port map (
        a => input(0),
        b => input(1),
      	sum => output(0),
      	carry => output(1)
    );

    tb_proc: process
    begin
        input <= "00"; wait for 30 ns; assert output = "00" report "0&0 failed";
        input <= "01"; wait for 30 ns; assert output = "01" report "0&1 failed";
        input <= "10"; wait for 30 ns; assert output = "01" report "1&0 failed";
        input <= "11"; wait for 30 ns; assert output = "10" report "1&1 failed";    
        report "Testbench finished";
        wait;
    end process;
end;
```

#### Wiring Two Components Together: a Full Adder

You can create a signal (like you did in your testbench files) to represent internal variables in your component.  You can port map the output of one half adder to that signal, and then port map the signal to the input of the next half adder!  You can do this for all your internal wires.

For example, suppose you wanted to connect the output of one xor gate to the input of another.  You could add a signal to represent this internal connection between the two gates:

```vhdl
signal x : std_logic;
```

You can then port map the xor gates:

```vhdl
X1 : xor2 port map(a => a1, b => b1, c => x);
X2 : xor2 port map(a => x, b => b2, c => z);
```

Notice the use of x as an output of `X1` and as an input of `X2`, thus connecting the two gates!

#### Testing the Full Adder

When you test your full adder, you can re-use much of the and2 test bench from earlier.  However, you'll have three inputs now (a, b, and carry in), instead of two, so your input signal will become a 3-bit gate, as follows:

```vhdl
signal input  : std_logic_vector(2 downto 0);
```

You'll set this to `"000"` instead of just `"00"`, and so on.  You'll also have two output signals, for the sum and carry out (instead of just one).

### Online VHDL Editor

If you have trouble using the tools, the [EDA Playground](https://edaplayground.com/) is an online VHDL editor and compiler that you can try!  On the left menu, you can select VHDL as the `Testbench and Design`, and specify the name of your testbench component in the `Top entity` text box.  Under `Tools & Simulators`, choose `GHDL`, and hit `Run` at the top.  Optionally, you can select the `EPWave` tool to enable the output waveform similar to gtkwave.

The only restriction is that you will save all your work in a single design file, and a single testbench file.  So, if you have multiple entities, you'll paste them one after the other in the design file.  Here is an example, using a 3-input and gate that structurally wires together two 2-input and gates (notice the two files are pasted one right after the other, such that the and2 gate begins as soon as the and3 gate ends!):

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity and3 is
    port (
        a  : in  std_logic;
        b  : in  std_logic;
        c  : in std_logic;
        z : out std_logic);
end and3;

architecture structural of and3 is

  component and2
	  port(a,b : in std_logic;
	  z   : out std_logic);
  end component;
  
  signal sig : std_logic;
begin

	A1 : and2 port map(a => a, b => b, z => sig);
	A2 : and2 port map(a => c, b => sig, z => z);
    
end;

-- Normally, this section would go into its own file; but on EDA Playground, they are combined into one by pasting one file below the other
library ieee;
use ieee.std_logic_1164.all;

entity and2 is
    port (
        a  : in  std_logic;
        b  : in  std_logic;
        z : out std_logic);
end and2;

architecture behavioral of and2 is
begin
    z <= a and b after 2 ns;
end;
```

Here is the testbench for that entity:

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity and3_tb is
end and3_tb;

architecture behavior of and3_tb is
    component and3 is
    port (
        a  : in  std_logic;
        b  : in  std_logic;
        c  : in std_logic;
        z : out std_logic);    
    end component;
    
    signal input  : std_logic_vector(2 downto 0);
    signal output : std_logic;
begin
    test1: and3 port map (
        a => input(0),
        b => input(1),
        c => input(2),
        z => output
    );

    tb_proc: process
    begin
        input <= "000"; wait for 30 ns; assert output = '0' report "0&0&0 failed";
        input <= "001"; wait for 30 ns; assert output = '0' report "0&0&1 failed";
        input <= "010"; wait for 30 ns; assert output = '0' report "0&1&0 failed";
        input <= "011"; wait for 30 ns; assert output = '0' report "0&1&1 failed";
        input <= "100"; wait for 30 ns; assert output = '0' report "0&0&0 failed";
        input <= "101"; wait for 30 ns; assert output = '0' report "0&0&1 failed";
        input <= "110"; wait for 30 ns; assert output = '0' report "0&1&0 failed";
        input <= "111"; wait for 30 ns; assert output = '1' report "0&1&1 failed";
        report "Testbench finished";
        wait;
    end process;
end;
```

### What to Do

1. Create and test a 2-bit and gate.
2. Create and test a 2-bit xor gate.
3. Create and test a full adder that accepts `a`, `b`, and `carryIn`, and outputs `sum` and `carryOut`, using the half adder above.  By using two half adder components in your full adder implementation, you will have far fewer total components in your synthesized circuit than if you constructed the whole full adder out of and/or/xor gates.  This is a bit like re-using a function in software!  Feel free to create additional gates (for example, an or gate), if you need them.
