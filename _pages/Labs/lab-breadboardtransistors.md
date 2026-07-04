---
layout: assignment
permalink: /Labs/BreadboardTransistors
title: "CS274: Computer Architecture - Transistor Logic Circuits on a Breadboard"


info:
  coursenum: CS274
  points: 100
  goals:
    - Comprehend the function of a NOT gate in digital circuits.
    - Learn how to use an NPN transistor to implement digital logic.
    - Develop breadboarding skills by constructing a working circuit.
    - Analyze circuit behavior and refine your design based on observed results.
    - Relate Boolean algebra and logic gate theory to physical circuit implementation.

  readings:
    - rtitle: Logic Gates with Transistors (including the NOT and AND gates)
      rlink: https://techatronic.com/logic-gates-with-transistors-and-or-not-gates/
    - rtitle: Breadboarding Logic Gates Video
      rlink: https://www.youtube.com/watch?v=eStPV_ehAXw
    - rlink: https://www.gsnetwork.com/and-gate/
      rtitle: AND gate tutorial
      
tags:
  - breadboard
  - logic

---

## Overview

In this assignment, you will design and breadboard the following circuits using NPN transistors, a push button, an LED, and the necessary resistors. 

* A NOT gate (inverter) 
* An AND gate 

You will learn how an NPN transistor can be used as a switching device to invert a digital signal, and you will gain valuable hands-on experience with breadboarding techniques.  Follow the guides and tutorials provided at the top of this page to assemble each circuit.  You can use one breadboard for the NOT gate, and a second one for the AND gate.

## Materials Required

- Breadboard
- NPN transistor (e.g., 2N3904, BC547)
- Push button (momentary switch)
- LED (with an appropriate current-limiting resistor)
- Additional resistors for transistor biasing (values to be determined by your circuit design)
- Connecting wires
- Power supply (typically 5V DC)

## Circuit Design and Implementation

### 1. Circuit Schematic

- **Design Requirement:** Review the transistor schematics for a NOT and AND gate using the links above. The transistor should operate such that when the push button is activated (or deactivated, depending on your design), the LED’s state changes in accordance with the NOT gate truth table.
- **Component Connections:**
  - **Transistor:** The transistors has three pins: emitter, base, and collector.  They allow current to flow in and out of the transistor, and to control that current flow.
  - **Button:** Connect the push button so that it provides a proper bias voltage to the transistor’s base through a resistor, allowing the current to pass or not, depending on whether the button in pressed.
  - **LED:** Wire the LED in series with a current-limiting resistor connected to the collector, ensuring correct orientation.  The short leg is the ground leg of the LED.
  - **Power and Ground:** Connect the emitter to ground and provide a positive voltage to the circuit where appropriate.
  - **Resistors:** We are using three resistors, 330 Ohm, 1K Ohm, and 10K Ohm.  
  
#### Resistor Color Codes

This table shows the color bands for three resistors in a 5‑band configuration:
- **330 Ω Resistor**
- **1 kΩ Resistor**
- **10 kΩ Resistor**

The bands represent the following:
- **Bands 1, 2, & 3:** The first three significant digits.
- **Band 4 (Multiplier):** The multiplier factor.
- **Band 5 (Tolerance):** The tolerance rating.

| Resistor Value | Band 1                                               | Band 2                                               | Band 3                                               | Band 4 (Multiplier)                                     | Band 5 (Tolerance)                                      |
|----------------|------------------------------------------------------|------------------------------------------------------|------------------------------------------------------|---------------------------------------------------------|---------------------------------------------------------|
| **330 Ω**      | <span style="background-color: orange; color: black; padding: 4px;">Orange (3)</span> | <span style="background-color: orange; color: black; padding: 4px;">Orange (3)</span> | <span style="background-color: black; color: white; padding: 4px;">Black (0)</span> | <span style="background-color: black; color: white; padding: 4px;">Black (×1)</span> | <span style="background-color: gold; color: black; padding: 4px;">Gold (±5%)</span> |
| **1 kΩ**       | <span style="background-color: brown; color: white; padding: 4px;">Brown (1)</span>  | <span style="background-color: black; color: white; padding: 4px;">Black (0)</span>  | <span style="background-color: black; color: white; padding: 4px;">Black (0)</span>  | <span style="background-color: brown; color: white; padding: 4px;">Brown (×10)</span> | <span style="background-color: gold; color: black; padding: 4px;">Gold (±5%)</span> |
| **10 kΩ**      | <span style="background-color: brown; color: white; padding: 4px;">Brown (1)</span>  | <span style="background-color: black; color: white; padding: 4px;">Black (0)</span>  | <span style="background-color: black; color: white; padding: 4px;">Black (0)</span>  | <span style="background-color: red; color: white; padding: 4px;">Red (×100)</span>   | <span style="background-color: gold; color: black; padding: 4px;">Gold (±5%)</span> |
  
### 2. Breadboarding the Circuit

- **Step-by-Step Assembly:**
  1. Insert the transistor into the breadboard and confirm its pin configuration.
  2. Connect the base resistor to the push button. Ensure that pressing the button correctly alters the base voltage.
  3. Attach the LED (with its resistor) between the collector and the power supply.
  4. Complete the circuit by connecting the emitter to ground.
- **Testing:** Once assembled, apply power and observe the LED's behavior as you operate the push button. The LED should illuminate when the input is low (or high, based on your design), conforming to the logical inversion.

### 3. Testing and Verification

- **Observation:** Record the LED response corresponding to each state of the push button.
- **Analysis:** Compare your observations with the expected output of a NOT gate.
- **Troubleshooting:** If discrepancies arise, re-examine the wiring, component orientation, and resistor values.

### Guided Circuit: A NAND Gate from Transistors

Now that you have built a NOT gate and an AND gate, you have all the skills you need to build a NAND gate!  A NAND gate outputs the *complement* of an AND gate: its output is 0 only when *both* inputs are 1, and it is 1 otherwise.  The NAND gate is special because it is **functionally complete**: as the appendix at the bottom of this page shows, any logic function (NOT, AND, OR, XOR, and so on) can be built using only NAND gates.  This is why NAND is sometimes called a "universal gate."

The trick is to place **two NPN transistors in series** between the LED (with its pull-up resistor) and ground.  Current can only flow through the LED to ground when *both* transistors are switched on -- that is, when both inputs are high.  When both are on, the output node is pulled down to ground and the LED turns off; otherwise, the output stays high and the LED stays lit.

Follow these steps, using the same components as before (NPN transistors such as the 2N3904 or BC547, and the 330 Ohm, 1 kOhm, and 10 kOhm resistors):

1. Insert two NPN transistors into the breadboard, a few rows apart, and confirm the emitter, base, and collector pins of each (check the datasheet for your transistor; on the 2N3904, with the flat face toward you, the pins are emitter, base, collector from left to right).
2. Connect the LED in series with a 330 Ohm current-limiting resistor from the positive supply rail (5V) to the **collector of the first (top) transistor**.  Remember that the short leg of the LED is the ground-facing (cathode) leg, so the short leg should face toward the transistor, not toward 5V.
3. Connect the **emitter of the first transistor** to the **collector of the second transistor** with a jumper wire.  This puts the two transistors in series.  This connection point is the *intermediate node* -- we will probe it later!
4. Connect the **emitter of the second (bottom) transistor** to the ground rail.
5. Wire the first push button between the 5V rail and one end of a 10 kOhm base resistor; connect the other end of that resistor to the **base of the first transistor**.  This is input **A**.
6. Wire the second push button and a second 10 kOhm base resistor to the **base of the second transistor** in the same way.  This is input **B**.
7. So that the inputs read a clean 0 when the buttons are *not* pressed, connect a resistor (the 1 kOhm works well here) from each base to ground.  This is called a *pull-down* resistor, and it prevents the base from "floating" at an undefined voltage.
8. Double-check the polarity of the LED and that both emitters/collectors are oriented as described, then apply power.

Fill in the following truth table as you test.  The **output** column is the LED: lit = 1, off = 0.

| A (button 1) | B (button 2) | Predicted Output | Observed LED |
|:------------:|:------------:|:----------------:|:------------:|
| 0            | 0            |                  |              |
| 0            | 1            |                  |              |
| 1            | 0            |                  |              |
| 1            | 1            |                  |              |

**Testing checklist:**

- [ ] Try all 4 input combinations (neither button, only A, only B, both buttons) and record the LED state for each.
- [ ] Verify that the LED turns off **only** when both buttons are pressed.
- [ ] Compare your observed column against your predicted column; if they differ, re-check the series connection between the two transistors and the base resistor wiring.
- [ ] Confirm that your table is the exact complement of the AND gate truth table you observed earlier.

### Guided Circuit: An LED Logic Probe

It is often handy to be able to "peek" at the voltage of any point (or *node*) in a circuit and read it as a logic level.  You can build a simple **logic probe** from just an LED and a resistor:

1. Connect a 330 Ohm resistor in series with an LED on a free area of your breadboard.
2. Connect the short (cathode) leg of the LED to the ground rail.
3. Attach a jumper wire to the free end of the 330 Ohm resistor.  This wire is your probe tip!

Touch the probe tip to any node in your circuit: if the LED lights, that node is at a logic 1 (high); if it stays dark, the node is at logic 0 (low).  Try it on the 5V rail (it should light) and the ground rail (it should not).

Now use your probe on the **intermediate node** of your NAND gate -- the connection between the emitter of the first transistor and the collector of the second.  Try all four button combinations and note when this internal node is high or low.  **What do you observe at the intermediate node when only the top button (A) is pressed, and why?**

> **Caution:** Never connect an LED directly to a circuit node without its current-limiting resistor.  Without the resistor, the LED will draw far too much current, which can burn out the LED and disturb (or damage) the circuit you are probing.  The resistor also keeps the probe from pulling the node's voltage down so far that it changes the behavior of your gate.

### Bridge: Checking Your Gate with an Arduino

So far, you have tested your NAND gate by hand.  Real hardware engineers automate this: they write a program that drives every input combination and checks the output against the expected value.  This is exactly what a *testbench* does in a hardware description language like VHDL -- and you can build one with an Arduino!

Wire it up as follows:

1. Remove (or leave unpressed) the push buttons; the Arduino will drive the inputs instead.
2. Connect Arduino digital pin **2** through a 1 kOhm resistor to the base resistor node of input **A** (or directly through the existing 10 kOhm base resistor, replacing the button connection).
3. Connect Arduino digital pin **3** the same way to input **B**.
4. Connect the NAND gate's output node (the collector of the first transistor, where the LED resistor attaches) through a 10 kOhm resistor to Arduino digital pin **4**, which we will use as an input.
5. Connect the Arduino's **GND** pin to your breadboard's ground rail.  This shared ground is essential: without it, the Arduino and your circuit have no common reference for what "0 volts" means, and the readings will be meaningless.
6. Power your breadboard's positive rail from the Arduino's **5V** pin so the whole system shares one supply.

Then upload this sketch:

```c
// NAND gate hardware unit test
const int PIN_A   = 2;   // drives gate input A
const int PIN_B   = 3;   // drives gate input B
const int PIN_OUT = 4;   // reads the gate output

void setup() {
  pinMode(PIN_A, OUTPUT);
  pinMode(PIN_B, OUTPUT);
  pinMode(PIN_OUT, INPUT);
  Serial.begin(9600);
}

void loop() {
  for (int a = 0; a <= 1; a++) {
    for (int b = 0; b <= 1; b++) {
      digitalWrite(PIN_A, a);
      digitalWrite(PIN_B, b);
      delay(10); // let the transistors settle

      int expected = !(a && b);        // NAND computed in software
      int measured = digitalRead(PIN_OUT); // NAND measured in hardware

      Serial.print("A=");
      Serial.print(a);
      Serial.print(" B=");
      Serial.print(b);
      Serial.print(" expected=");
      Serial.print(expected);
      Serial.print(" measured=");
      Serial.print(measured);
      Serial.println(expected == measured ? "  PASS" : "  FAIL");
    }
  }
  Serial.println("---- test cycle complete ----");
  delay(2000);
}
```

To upload and run:

1. Connect the Arduino to your computer with its USB cable.
2. In the Arduino IDE, choose **Tools > Board** and select your board (for example, *Arduino Uno*).
3. Choose **Tools > Port** and select the serial port your board is attached to.
4. Click the **Upload** (right-arrow) button and wait for "Done uploading."
5. Open the **Serial Monitor** (**Tools > Serial Monitor**) and set the baud rate to **9600** to match the `Serial.begin(9600)` in the sketch.
6. Watch the four rows print every couple of seconds; all four should say PASS.  If a row says FAIL, note which input combination it is -- that tells you exactly where to look in your wiring!

Answer these questions in your writeup:

**What happens (and why) if you forget the common ground wire between the Arduino and your breadboard?**

**How is this sketch like a testbench in a hardware description language such as VHDL?  What role does the `expected` variable play?**

**Why do we compute `expected = !(a && b)` in software rather than just checking that the LED "looks right"?  What advantage does an automated test have as circuits get larger?**

### Common Pitfalls

> **Watch out for these frequent mistakes:**
>
> - **Floating inputs:** An unconnected transistor base (or Arduino input pin) does not read as 0 -- it "floats" and can pick up noise, making your gate behave erratically.  Use pull-down resistors so every input is always at a defined voltage.
> - **Missing common ground:** The Arduino and the breadboard circuit must share a ground connection.  Without it, `digitalRead` and `digitalWrite` have no shared reference and the test results will be nonsense.
> - **LED polarity:** The short leg (cathode) of the LED must face ground.  A backwards LED simply will not light, which is easy to mistake for a logic error.
> - **Resistor values:** Always use the 330 Ohm resistor in series with any LED, and the 10 kOhm resistor into each transistor base.  Too small a base resistor can damage the transistor or the Arduino pin; skipping the LED resistor can burn out the LED.

---

## Appendix: Converting Logic Expressions to NAND Gates Using DeMorgan's Laws

DeMorgan's Laws are essential tools in Boolean algebra that allow for the systematic conversion of logical expressions. These laws state:

- **First Law:**  
  The complement of a conjunction is the disjunction of the complements:  
  $$\overline{A \land B} = \overline{A} \lor \overline{B}$$

- **Second Law:**  
  The complement of a disjunction is the conjunction of the complements:  
  $$\overline{A \lor B} = \overline{A} \land \overline{B}$$

Using these principles, any logic expression can be restructured to use only NAND gates. Notably, the NOT operation can be implemented with a single NAND gate by connecting both inputs to the same signal:
  
$$\text{NOT } A = A \text{ NAND } A$$

### Truth Table Verification

The following truth table demonstrates that \( A \text{ NAND } A \) is equivalent to \( \text{NOT } A \):

| A | A NAND A | NOT A |
|:-:|:--------:|:-----:|
| 0 |    1     |   1   |
| 1 |    0     |   0   |

### Extended Example: Converting XOR to NAND Only

The transformation of more complex expressions using only NAND gates is illustrated below:

```
A xor B = ((not A) and B) or (A and (not B))
        = ((A NAND A) and B) or (A and (B NAND B))
        = (NOT (A NAND A) NAND B) OR (NOT (A NAND (B NAND B)))
        
Let X = NOT ((A NAND A) NAND B)
Let Y = NOT (A NAND (B NAND B))
        
Thus, X OR Y
        
By DeMorgan's Law:
        
X OR Y = NOT (NOT X AND NOT Y)
       = (NOT X) NAND (NOT Y)
        
Which simplifies to:
        
(NOT (NOT ((A NAND A) NAND B))) NAND (NOT (NOT (A NAND (B NAND B))))
Equivalent to:
((A NAND A) NAND B) NAND (A NAND (B NAND B))
```

This example underscores the universality of NAND gates in digital logic design. By applying DeMorgan's Laws, any logical function, no matter how complex, can be implemented solely with NAND gates.
