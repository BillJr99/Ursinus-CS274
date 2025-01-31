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
