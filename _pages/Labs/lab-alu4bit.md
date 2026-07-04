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

Recall the schematic of a 1-bit ALU, which you will chain together:

<img src="https://max.cs.kzoo.edu/cs230/Resources/ALU/SimpleALU.png" alt="1 bit ALU">

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

Do the same for `carries` as a vector of `(4 downto 0)`, mapping each carryout bit to the next ALU carry in (for example, the first ALU takes `carries(0)` as its `carryin`, and `carryout` goes to `carries(1)`, and so on.  In your loop, this would involve reading `carryin` from `carries(i)` and writing `carryout` to `carries(i+1)`.  Just be sure to map `carries(0)` and `carries(4)` to the main ALU `carryin` and `carryout`, respectively.

For the 1-bit ALU port maps, you should wire:

1. Each bit of `a` and `b` to each 1-bit ALU
2. The `ALUOp` port to all of the 1-bit ALUs

### Wiring Signals Individually

Let's make the "four port maps" approach concrete.  Suppose your 1-bit ALU from the last lab has ports `a`, `b`, `carryin`, `bInvert`, `op`, `z`, `carryout`, `zero`, `less`, and `overflow`.  Inside your `ALU4` architecture, declare the internal signals for the results and the ripple-carry chain:

```vhdl
signal results : std_logic_vector(3 downto 0);
signal carry   : std_logic_vector(4 downto 0);  -- carry(0) in, carry(4) out
```

The key idea is exactly the one you used to chain two half adders into a full adder: the carry **out** of each slice becomes the carry **in** of the next.  With a 5-bit `carry` vector, slice `i` reads `carry(i)` and writes `carry(i+1)`, so the whole chain is just consistent indexing.  Here are slices 0 and 1 spelled out with named association (slices 2 and 3 follow the same pattern):

```vhdl
slice0: alu1bit port map (
    a        => a(0),        -- bit 0 of the 4-bit input a
    b        => b(0),        -- bit 0 of the 4-bit input b
    carryin  => carry(0),    -- the ALU's overall carry-in enters the chain here
    bInvert  => bInvert,     -- one control wire fans out to every slice
    op       => ALUOp,       -- likewise: all slices perform the same operation
    z        => results(0),  -- this slice computes result bit 0
    carryout => carry(1)     -- ... and hands its carry to slice 1
);

slice1: alu1bit port map (
    a        => a(1),
    b        => b(1),
    carryin  => carry(1),    -- <-- the same signal slice0 wrote: this IS the ripple wire
    bInvert  => bInvert,
    op       => ALUOp,
    z        => results(1),
    carryout => carry(2)     -- ... on to slice 2
);
```

Line by line, notice:

* `a => a(0)` — the left side is the 1-bit ALU's *port* named `a` (a single `std_logic`); the right side is bit 0 of the 4-bit ALU's *input vector* also named `a`.  The names coincide, but VHDL keeps them straight because the left of `=>` always refers to the component's formal port.
* `carryin => carry(0)` / `carryout => carry(1)` in slice 0, then `carryin => carry(1)` in slice 1 — `carry(1)` appears as an **output** of slice 0 and an **input** of slice 1.  That shared signal is the physical wire connecting the two slices, just like the `signal x` trick from the adder lab.
* `bInvert => bInvert` and `op => ALUOp` — control inputs aren't per-bit; the same wire fans out to all four slices so they all do the same operation.
* The unused per-slice outputs (`zero`, `less`, `overflow` on the middle slices) can be mapped to `open` (VHDL's keyword for "leave this output pin disconnected"), or to throwaway signals.

Finally, connect the chain's endpoints to the outside world: wire `carry(0)` from your ALU-level carry-in (after the subtraction modification below, from `bInvert`), and `CarryOut <= carry(4);` at the top, along with `result <= results;`.

### Using for ... generate

Those four port maps are identical except for the index — which is exactly the situation `for ... generate` exists for.  Here is the generate version:

```vhdl
gen_alu: for i in 0 to 3 generate
    slice: alu1bit port map (
        a        => a(i),
        b        => b(i),
        carryin  => carry(i),
        bInvert  => bInvert,
        op       => ALUOp,
        z        => results(i),
        carryout => carry(i+1)
    );
end generate;
```

Line by line:

1. `gen_alu: for i in 0 to 3 generate` — the label (`gen_alu:`) is **required** on a generate statement (unlike most VHDL statements, you can't omit it).  `i` is the generate parameter, ranging over 0 through 3.
2. Crucially, this is **not a runtime loop**.  `i` is evaluated at *elaboration* (compile) time: the compiler literally stamps out four separate copies of the `alu1bit` hardware, one per value of `i`, exactly as if you had written the four port maps by hand.  Nothing "iterates" while the circuit runs — all four slices exist simultaneously and operate in parallel.  (This is a good mental checkpoint: VHDL describes *hardware*, not a program that executes top to bottom.)
3. `slice: alu1bit port map (...)` — each stamped-out copy gets the label `slice`, automatically disambiguated by index (you'll see `gen_alu(0).slice`, `gen_alu(1).slice`, ... in GTKWave's SST panel).
4. `a => a(i), b => b(i), z => results(i)` — the only things that vary between copies are the vector indices, which is what makes the loop body writable once.
5. `carryin => carry(i), carryout => carry(i+1)` — the ripple chain again: copy `i` writes `carry(i+1)`, which copy `i+1` reads.  The `i+1` is computed at compile time, so this is legal and cheap.
6. `end generate;` — closes the generate block (you may also write `end generate gen_alu;`).

What about the boundary slices?  Slice 0's `carryin` is `carry(0)`, which you connect *outside* the loop to the ALU's overall carry-in (or to `bInvert`, per the subtraction modification below) with a plain concurrent assignment like `carry(0) <= bInvert;`.  Similarly, the top of the chain is read outside the loop: `CarryOut <= carry(4);`.  If the MSB slice needs genuinely different wiring (for example, only slice 3's `overflow` and per-slice carry signals matter for the flag logic), you have two options: keep the uniform loop and simply *use* the signals you need by index (e.g., compute overflow from `carry(3)` and `carry(4)` — nothing requires you to consume every slice's outputs), or write an `if i = 3 generate ... end generate;` block *inside* the outer loop to give the top slice its own port map.  For this lab, indexing into the `carry` vector is the simpler path.

### Modifications for ALU status flags

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

### Flag Formulas for the 4-Bit ALU

Here are all four flag formulas in one place, using the `results` and `carry(4 downto 0)` chain naming from above.  (These are the behavioral one-liners; where the lab asks you to build the logic structurally from gates — as with the extra-credit zero flag — the formula tells you exactly which gates to wire.)

**Zero** — the result is zero exactly when no bit is a 1, so OR all the bits ("is any bit set?") and invert:

```vhdl
zero <= not (results(3) or results(2) or results(1) or results(0));
```

Worked example: `0101 - 0101` (5 − 5, i.e. `0101 + 1010 + 1`) produces `results = "0000"`; the OR of the bits is 0, so `zero = 1`.  Any other result has at least one 1, making the OR 1 and `zero` 0.

**Overflow** — the carry *into* the MSB xor the carry *out of* the MSB.  In the chain naming, the carry into slice 3 is `carry(3)` and the carry out of slice 3 is `carry(4)`:

```vhdl
overflow <= carry(3) xor carry(4);
```

Worked example: `0111 + 0001` (7 + 1).  The low bits ripple a carry all the way up, so `carry(3) = 1`; the MSB computes `0 + 0 + 1 = 1` with no carry out, so `carry(4) = 0`.  `1 xor 0 = 1`: overflow — and sure enough the result `1000` reads as −8, not 8.

**Negative (less)** — the sign bit of a two's complement number is its MSB:

```vhdl
negative <= results(3);
```

Worked example: `0011 - 0101` (3 − 5) gives `results = "1110"` (−2); `results(3) = 1` correctly reports a negative result, i.e., 3 < 5.  (In this lab's `less` modification, you xor this bit with `ovf` so the answer stays correct even when the subtraction itself overflows.)

**Carry-out** — simply the top of the ripple chain:

```vhdl
CarryOut <= carry(4);
```

Worked example: `1111 + 0001` (unsigned 15 + 1) produces `results = "0000"` with `carry(4) = 1` — the answer didn't fit in 4 unsigned bits.  Note that overflow is 0 here (`carry(3) = 1`, `carry(4) = 1`, and `1 xor 1 = 0`): as a *signed* computation this was −1 + 1 = 0, which is perfectly fine.  Carry-out flags unsigned wraparound; overflow flags signed wraparound — the `0111 + 0001` example above shows the opposite case (overflow = 1, carryout = 0).

### Testing the 4-Bit ALU

You don't need a new testbench design — reuse the 1-bit ALU testbench pattern from the previous lab, with two changes: the stimulus signals become `std_logic_vector(3 downto 0)` (so you assign string literals like `"0111"` instead of `'0'`/`'1'`), and you should assert the flag outputs alongside the result.  For example:

```vhdl
-- ADD 7 + 1: expect signed overflow
ta <= "0111"; tb <= "0001"; tbInvert <= '0'; tALUOp <= "10";
wait for 30 ns;
assert tresult = "1000" report "ADD 7+1 result failed";
assert toverflow = '1'  report "ADD 7+1 should overflow";

-- ADD 15 + 1: expect carry-out but no overflow
ta <= "1111"; tb <= "0001"; tbInvert <= '0'; tALUOp <= "10";
wait for 30 ns;
assert tresult = "0000"   report "ADD 15+1 result failed";
assert tCarryOut = '1'    report "ADD 15+1 should carry out";
assert toverflow = '0'    report "ADD 15+1 should not overflow";

-- SUB 5 - 5: expect a zero result (and the zero flag, if you did the extra credit)
ta <= "0101"; tb <= "0101"; tbInvert <= '1'; tALUOp <= "10";
wait for 30 ns;
assert tresult = "0000" report "SUB 5-5 result failed";
assert tzero = '1'      report "SUB 5-5 should set the zero flag";
```

(Adjust the `ALUOp` codes and signal names to match your own design — for instance, if your mux passes the adder on `"10"` as shown here, or on a different code, use yours.  As always, allow the full `wait for 30 ns` so the carry has time to ripple through all four slices' gate delays before you assert.)
