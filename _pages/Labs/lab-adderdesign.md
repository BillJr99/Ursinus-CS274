---
layout: assignment
permalink: /Labs/AdderDesign
title: "CS274: Computer Architecture - Adder Design"


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

In this lab, you will use a tool called [ghdl](http://ghdl.free.fr/download.html) to compile Virtual Hardware Description Language (VHDL) code that describes circuit wirings for various logic components.  On Mac OS systems, you can install ghdl using [homebrew](https://brew.sh/) via this command: `brew install --cask ghdl gtkwave`, and on Linux, you can install using this command: `sudo apt-get install ghdl gtkwave` (these will also install the gtkwave system that Windows users will download later in this lab).  Alternatively, if you have any difficulty running these tools locally, you can run many ghdl commands through the VHDL example shown below:

<iframe height="500px" width="100%" src="{{ site.baseurl }}/assets/code-viewer.html?zip=https%3A%2F%2Fraw.githubusercontent.com%2FBillJr99%2FUrsinus-CS274%2Fgh-pages%2Ffiles%2Freplit%2FVHDLExample.zip&title=VHDL%20Example" scrolling="yes" frameborder="no" allowfullscreen="true" sandbox="allow-scripts allow-same-origin"></iframe>


Using these tools, you will implement an adder circuit using the VHDL language.

### Installing the Tools

We'll use two programs in this lab: `ghdl` (which compiles and simulates your VHDL code) and `gtkwave` (which displays the waveform files that the simulation produces, so you can see your signals change over time).  Here's how to install them on each platform:

**Windows**

1. Download the latest GHDL release for Windows from the [GHDL releases page](https://github.com/ghdl/ghdl/releases) (look for a `.zip` or installer ending in `mingw64` or `ucrt64` under "Assets").
2. Extract or install it, and add the `bin` folder (the one containing `ghdl.exe`) to your system `PATH` so you can run `ghdl` from any command prompt.  You can do this by searching for "Edit the system environment variables" in the Start menu, clicking "Environment Variables...", and appending the folder to the `Path` variable.
3. Download and install GTKWave from the [GTKWave SourceForge page](https://sourceforge.net/projects/gtkwave/), and add its `bin` folder to your `PATH` as well.
4. Alternatively, if you already use [MSYS2](https://www.msys2.org/), you can install both at once from an MSYS2 terminal with: `pacman -S mingw-w64-x86_64-ghdl-llvm mingw-w64-x86_64-gtkwave`

**macOS**

1. Install [homebrew](https://brew.sh/) if you don't already have it.
2. Run `brew install ghdl` in a Terminal window.
3. Run `brew install --cask gtkwave` to install the GTKWave application.
4. On Apple Silicon Macs, the first time you open GTKWave, macOS Gatekeeper may warn you that the app is from an unidentified developer.  If that happens, right-click (or Control-click) the GTKWave app in your Applications folder and choose "Open" — you only need to do this once.

**Linux**

1. Run `sudo apt-get install ghdl gtkwave` (on Debian/Ubuntu-based systems; use your distribution's package manager otherwise).

**Verify Your Install**

Before going any further, open a fresh terminal window and run:

```
ghdl --version
gtkwave --version
```

If both commands print a version number, you're ready to go.  If you get a "command not found" error, the tool isn't on your `PATH` yet — revisit the steps above (and on Windows, make sure you opened a *new* command prompt after editing the `PATH`).

**If All Else Fails**

Don't let tool installation stop you!  The [EDA Playground](https://edaplayground.com/) (described at the bottom of this page) runs GHDL and a waveform viewer entirely in your browser with nothing to install.

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

Let's walk through what each of those commands actually does, because you'll be running this same workflow in every VHDL lab this semester:

1. `ghdl -a and2.vhd` — **analyze** the file.  This is GHDL's word for "syntax-check and compile."  It parses `and2.vhd`, checks it for errors, and adds the compiled `and2` entity to a *work library* (you'll notice a `work-obj93.cf` or similar file appear in your directory — that's the library).  **Order matters here**: you must analyze a component *before* you analyze any file that uses it, because the second file looks the first one up in the work library.  Analyze your gates first, then the components built from them, then the testbench last — dependencies first, just like you'd define a function before calling it.
2. `ghdl -a and2_tb.vhd` — analyze the testbench the same way.  Since `and2` is already in the work library, the testbench's `component and2` declaration can be matched up with it.
3. `ghdl -e and2_tb` — **elaborate** the design.  This takes the *top-level entity* (your testbench, `and2_tb`) and links together everything it depends on into a runnable simulation.  Note that you pass the **entity name** here, *not* a filename — no `.vhd` extension!  The name must exactly match the `entity and2_tb is` line in your code.
4. `ghdl -r and2_tb --vcd=waveform.vcd` — **run** the simulation.  GHDL executes your testbench process, prints any `report` messages (and any failed `assert` messages) to the terminal, and — because of the `--vcd` flag — records *every signal change* with its timestamp into the file `waveform.vcd`.  VCD stands for "Value Change Dump," and it's exactly what it sounds like: a log of every wire's value over time, which is what GTKWave displays.

A few common errors to watch out for:

* **"cannot find entity"** or **"unit ... not found"**: you analyzed your files out of order (or forgot to analyze one).  Re-run the `ghdl -a` commands starting from the lowest-level component.
* **Entity name mismatch**: `ghdl -e and2tb` will fail if your entity is actually named `and2_tb`.  The name in the `-e` and `-r` commands must match the entity name in the code exactly.
* **On some systems** (particularly the mcode/LLVM backends on Windows or older Linux installs), `ghdl -e` produces an actual executable file, and you run the simulation with `./and2_tb --vcd=waveform.vcd` instead of `ghdl -r and2_tb --vcd=waveform.vcd`.  If `ghdl -r` complains, try that form.
* **Stale results**: if you edit a `.vhd` file, you must re-run *all three steps* (`-a`, `-e`, `-r`) for the change to take effect.  Running the simulation without re-analyzing runs your *old* code.

### Reading the Waveform in GTKWave

You can view the waveform by downloading a tool called [gtkwave](https://sourceforge.net/projects/gtkwave/) (see the install section above), and running:

```
gtkwave waveform.vcd
```

When GTKWave first opens, the wave display will be *empty* — this surprises everyone the first time!  You have to tell GTKWave which signals you want to see:

1. Open your file with `gtkwave waveform.vcd` (or launch GTKWave and use `File > Open New Tab`).
2. In the upper-left panel (the "SST", or Signal Search Tree), click the triangle/plus to expand the top module — it will be named after your testbench, e.g. `and2_tb`.
3. Click the module name so its signals (`input`, `output`, etc.) appear in the list below the SST panel.
4. Select the signals you want to view (Ctrl-click or Shift-click to select several) and click the **Append** or **Insert** button beneath the list.  The signals now appear in the wave pane on the right.
5. The default zoom is often way too far in or out to see anything useful.  Choose `Time > Zoom > Zoom Fit` (or press `Ctrl+Alt+F`, or click the magnifying-glass-with-brackets toolbar button) to fit the entire simulation in the window.  Then use the `+` magnifier button to zoom in around an interesting transition.
6. Click anywhere in the wave pane to drop the **primary marker** (a vertical line).  The value of every displayed signal *at that exact timestamp* is shown in the "Signals" column, and the marker's time appears at the top of the window.  This is how you read off exact values — for example, to check what `output` is at `t = 92 ns`.

### What You Should See

Here's what the waveform for the `and2` testbench above should look like.  The testbench changes the inputs every 30 ns, so:

| Time range | `a`, `b` (i.e. `input`) | `z` (i.e. `output`) |
|:---|:---:|:---:|
| 0 – 30 ns | `0 0` | `0` |
| 30 – 60 ns | `0 1` (input = "01") | `0` |
| 60 – 90 ns | `1 0` (input = "10") | `0` |
| 90 – 120 ns | `1 1` (input = "11") | `1` (rises at ~92 ns) |

For the first 90 ns the output is a flat `0` line (an AND gate only outputs 1 when *both* inputs are 1).  The interesting moment is at `t = 90 ns`, when both inputs become `1`.  Notice that `z` does **not** rise at exactly 90 ns — it rises at 92 ns, because we wrote `z <= a and b after 2 ns;` to simulate the gate's propagation delay.  **Zoom in tightly around t = 90 ns and place the marker on the transition — actually seeing that 2 ns gap between the input change and the output change is the payoff of this whole exercise.**  Real gates take time, and your waveform proves it.

(At the very start of the simulation, before the first assignment takes effect, you may also see signals shown in red or as `U` for "uninitialized" — that's normal.)

> **Common Pitfalls**
>
> * **No waveform file?**  You probably forgot the `--vcd=waveform.vcd` flag on the run command.  Without it, the simulation runs and prints reports, but dumps nothing for GTKWave to display.
> * **Waveform looks the same after you changed your code?**  GTKWave shows the file as it was when the simulation ran.  Re-run all of `ghdl -a`, `ghdl -e`, and `ghdl -r ... --vcd=...`, then choose `File > Reload Waveform` in GTKWave (`Shift+Ctrl+R`).
> * **Everything looks like one solid block, or you see nothing at all?**  That's a zoom problem, not a bug.  Use `Time > Zoom > Zoom Fit` (`Ctrl+Alt+F`) first, then zoom in.  And remember: signals don't appear in the wave pane until you Append them from the SST panel.

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

### What to Do

1. Create and test a 2-bit and gate.
2. Create and test a 2-bit xor gate.
3. Create and test a 2-bit or gate.
4. Create and test a full adder that accepts `a`, `b`, and `carryIn`, and outputs `sum` and `carryOut`, using the half adder above.  By using two half adder components in your full adder implementation, you will have far fewer total components in your synthesized circuit than if you constructed the whole full adder out of and/or/xor gates.  This is a bit like re-using a function in software!  Feel free to create additional gates (for example, an or gate), if you need them.

#### Schematic

Here is the schematic you will implement with these steps above:

![Full Adder Schematic from Two Half Adders](https://media.geeksforgeeks.org/wp-content/uploads/20240228175355/Untitled-Diagram---2024-02-28T175346210.webp)

### Online VHDL Editor

If you have trouble using the tools, the [EDA Playground](https://edaplayground.com/) is an online VHDL editor and compiler that you can try!  On the left menu, you can select VHDL as the `Testbench and Design`, and specify the name of your testbench component in the `Top entity` text box.  Under `Tools & Simulators`, choose `GHDL`, and hit `Run` at the top.  Optionally, you can select the `EPWave` tool to enable the output waveform similar to gtkwave.

Here is an example, using a 3-input and gate that structurally wires together two 2-input and gates:

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

-- This section could go into its own file instead
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
