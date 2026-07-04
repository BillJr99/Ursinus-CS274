---
layout: activity
permalink: /Activities/ALU
title: "CS274: Computer Architecture - MIPS Processor Design: The ALU"


info:
  goals:
    - To incorporate the design of a 1-bit adder into a 1-bit ALU
    - To combine 1-bit ALUs into a 32-bit ALU design
    - To support subtraction within a 32-bit adder
    - To enable status bits to support the MIPS isntruction set from an ALU
    - To optimize an ALU for performance using a Carry Lookahead Adder

  models:
    - model: |
        <div align="center">
        <img src="https://sites.google.com/site/mikekraseksblog/_/rsrc/1371652810451/student-name-tech-portfolio/computer-technology/Logic_gate.gif" alt="Circuit Building Blocks">
        <br>
        sum = (A xor B) xor carryIn<br>
        carryOut = ((A xor B) and carryIn) or (A and B)
        <br>
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">A</th>
            <th class="tg-1wig">B</th>
            <th class="tg-1wig">Sum</th>
            <th class="tg-1wig">Carry</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
        </tbody>
        </table>
        </div>
      title: "Review: Components for a 1-bit Adder"
      questions:
        - "Draw a 1-bit adder using these logic formulas"
      
    - model: |
        <img src="../images/mux/mux.png" alt="A 1-bit multiplexor">
        <br>
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">A</th>
            <th class="tg-1wig">B</th>
            <th class="tg-1wig">select</th>
            <th class="tg-1wig">Z</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">0</td>
            <td class="tg-1wig">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-1wig">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">0</td>
            <td class="tg-1wig">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-1wig">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-1wig">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
          </tr>
        </tbody>
        </table>
        <br>
        <img src="../images/mux/muxinternals.png" alt="Internals of a 1-bit multiplexor">
      title: A Multiplexor Circuit
      questions:
        - "The multiplexor (or &quot;mux&quot;) takes two inputs and selects one of them: for example, <code>A</code> passes through if <code>select</code> is <code>0</code>, and <code>B</code> passes through if <code>select</code> is <code>1</code>.  Draw a truth table and circuit for an ALU that selects between four options (you will need two select bits)."
        
    - model: |
        <img src="https://www.researchgate.net/profile/V-Bhanumathi/publication/321814052/figure/fig2/AS:745655408529409@1554789511084/Functional-block-diagram-of-one-bit-ALU_W640.jpg" alt="1-bit Full Adder">
      title: A 1-bit ALU
      questions:
        - "Add the select line to this ALU such that the AND operation is select bits 00, the OR operation is select bits 01, and the adder is select bits 10.  Call this select line <code>operation</code>."

    - model: |
        <a title="Lambtron, CC BY-SA 4.0 &lt;https://creativecommons.org/licenses/by-sa/4.0&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:ALU_block.gif"><img width="512" alt="ALU block" src="https://commons.wikimedia.org/w/index.php?title=Special:Redirect/file/ALU_block.gif"></a>
      title: A 32-bit ALU
      questions:
        - "Suppose you had an 8-bit ALU.  Connect each of the 8-bits of the inputs <code>A</code> and <code>B</code> to 8 individual ALUs.  Where would you connect the select operation lines, and the carry inputs and outputs?  Sketch your final result."
        
    - model: |
        <img src="https://pbs.twimg.com/media/Ehp3i59XkAAUMDw?format=png&name=small" alt="A 1-bit ALU with subtraction support via a bInvert mux and a one's place carryIn to compute the two's complement of B">
      title: Subtraction
      questions:
        - "Recall that binary subtraction involves adding the two's-complement inverse of <code>B</code> to <code>A</code>.  Modify your 1-bit ALU design to invert <code>B</code>, and select either it or the original <code>B</code> value using a multiplexor.  You can call your new select input <code>bInvert</code>."  
        - "However, you must also add 1 to the final answer to perform the two's complement.  How can you use the existing 32-bit ALU design to add 1 in the one's place?"

    - model: |
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">MSB</th>
            <th class="tg-0lax"></th>
            <th class="tg-0lax"></th>
            <th class="tg-0lax"></th>
            <th class="tg-0lax"></th>
            <th class="tg-0lax"></th>
            <th class="tg-0lax"></th>
            <th class="tg-0lax"></th>
            <th class="tg-0lax"></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">carryIn</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">A</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">B</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">sum</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">carryOut</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-1wig">A sign?</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">-</td>
          </tr>
          <tr>
            <td class="tg-1wig">B sign?</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
          </tr>
          <tr>
            <td class="tg-1wig">sum sign?</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">+</td>
            <td class="tg-0lax">-</td>
          </tr>
          <tr>
            <td class="tg-1wig">Overflow?</td>
            <td class="tg-0lax">No</td>
            <td class="tg-0lax">No</td>
            <td class="tg-0lax">No</td>
            <td class="tg-1wig">Yes</td>
            <td class="tg-1wig">Yes</td>
            <td class="tg-0lax">No</td>
            <td class="tg-0lax">No</td>
            <td class="tg-0lax">No</td>
          </tr>
        </tbody>
        </table>
      title: Overflow Detection
      questions:
        - "Can overflow occur when adding values of different signs?  Why or why not?"
        - "For the cases where overflow occurs, what do their inputs and outputs have in common?"
        - "Look again at the cases where overflow does not occur.  How do the carry bits ultimately indicate whether overflow will or will not occur?"
        - "Draw a truth table and circuit diagram using only the most significant carry in and out bits to indicate overflow detection."
        
    - model: |
        <img src="https://people.stfx.ca/igondra/csci365/labs/lab7/lab7_arquivos/image004.gif" alt="ALU with less and overflow detection bits">
      title: "Status Bits (Zero and Less)"
      questions:
        - "If you are performing subtraction, what will you know about <code>B</code> compared to <code>A</code> if the result is negative?"
        - "Add a status line called <code>less</code> to the output of the most significant bit ALU."
        - "What does overflow do to the sign bit of the output? If overflow occurs, can we fix the less bit output, and how?"   
        - "Draw a truth table with the less bit, overflow bit, and resulting &quot;correct&quot; less output.  What circuit is this?  Add it to your ALU!"
        - "What circuit can tell you if all 32 bits of the ALU result line are 0?  Add an ALU output called <code>zero</code> that is set to 1 when this occurs.  Hint - add a logic circuit that indicates if any of the bits is 1, and then negate it."

    - model: |
        <a title="en:User:Cburnett, CC BY-SA 3.0 &lt;http://creativecommons.org/licenses/by-sa/3.0/&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:4-bit_carry_lookahead_adder.svg"><img width="256" alt="4-bit carry lookahead adder" src="https://commons.wikimedia.org/w/index.php?title=Special:Redirect/file/4-bit_carry_lookahead_adder.svg"></a>
        <br>
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">A</th>
            <th class="tg-1wig">B</th>
            <th class="tg-1wig">Carry State</th>
            <th class="tg-1wig">Logic formula</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">kill</td>
            <td class="tg-0lax">A NOR B</td>
          </tr>
          <tr>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">propagate</td>
            <td class="tg-0lax">A XOR B</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">propagate</td>
            <td class="tg-0lax">A XOR B</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">generate</td>
            <td class="tg-0lax">A AND B</td>
          </tr>
        </tbody>
        </table>
      title: "Parallelized Addition with the Carry Lookahead Adder"
      questions:
        - "What carry out bit is always generated if both <code>A</code> and <code>B</code> are 1?"
        - "What carry out bit is always generated if both <code>A</code> and <code>B</code> are 0?"
        - "What should the carry out bit be if <code>A</code> and <code>B</code> are different?"
        - "Write a logic formula for the carry out bit based on the carry in, generate, and propagate detection bits."
        - "Sketch a &quot;carry lookahead&quot; circuit that outputs all 32 carry bits."
        - "Design an ALU that adds all 32 bits in parallel using this carry lookahead circuit." 

    - model: |
        <div align="center">
        A quick-reference recap of the key rules from this activity.  Try to reproduce each one from memory before peeking!
        </div>
        <br>
        <strong>Key Rules and Formulas</strong>
        <ul>
        <li><strong>1-bit full adder</strong>: <code>sum = (A XOR B) XOR carryIn</code>; <code>carryOut = ((A XOR B) AND carryIn) OR (A AND B)</code>.  Micro-example: <code>A=1, B=0, carryIn=1</code> gives <code>sum = 1 XOR 1 = 0</code>, <code>carryOut = (1 AND 1) OR 0 = 1</code>.</li>
        <li><strong>1-bit ALU</strong>: compute <code>A AND B</code>, <code>A OR B</code>, and the adder's sum in parallel, and use a multiplexor with select lines (00 = AND, 01 = OR, 10 = add) to pick the operation's output.</li>
        <li><strong>32-bit ALU</strong>: chain 32 one-bit ALUs; each carryOut feeds the next bit's carryIn, and all bits share the operation select lines.</li>
        <li><strong>Subtraction</strong>: <code>A - B = A + ~B + 1</code>: set <code>bInvert = 1</code> to select the inverted B input, and set the ones-place <code>carryIn = 1</code> to supply the &quot;+1&quot; of the two's complement for free.</li>
        <li><strong>Overflow</strong>: <code>overflow = carryIn XOR carryOut</code> at the most significant bit.</li>
        <li><strong>Zero status bit</strong>: <code>zero = NOT(result31 OR result30 OR ... OR result0)</code> - OR every result bit and negate (a NOR of all 32 bits).</li>
        <li><strong>Less / set-on-less-than</strong>: subtract <code>B</code> from <code>A</code>; the sign bit of the result feeds the <code>less</code> output of bit 0.  If overflow occurred, the sign bit is wrong, so correct it: <code>less = sign XOR overflow</code>.</li>
        <li><strong>Carry lookahead</strong>: define <code>g = A AND B</code> (generate) and <code>p = A XOR B</code> (propagate); then <code>carryOut_i+1 = g_i OR (p_i AND carryIn_i)</code>.  Expanding lets all carries be computed in parallel instead of rippling.  Micro-example: <code>c1 = g0 + p0*c0</code>; <code>c2 = g1 + p1*g0 + p1*p0*c0</code>.</li>
        </ul>
        <br>
        <pre>
        1-bit ALU (bit i):
                    bInvert     operation (2 bits)
                       |            |
          A_i ====+==[AND]==+
                  |  [OR ]==+==[ MUX ]== result_i
          B_i =[inv?]=+==[ADD]==+
                           |  |
                    carryIn_i  carryOut_i --> to bit i+1
        </pre>
        <br>
        <strong>Glossary</strong>
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <thead>
          <tr><th class="tg-1wig">Term</th><th class="tg-1wig">Meaning</th></tr>
        </thead>
        <tbody>
          <tr><td class="tg-0lax">ALU</td><td class="tg-0lax">Arithmetic Logic Unit: computes AND, OR, add, subtract, and comparisons</td></tr>
          <tr><td class="tg-0lax">Multiplexor (mux)</td><td class="tg-0lax">A selector circuit: select bits choose which input passes through</td></tr>
          <tr><td class="tg-0lax">bInvert</td><td class="tg-0lax">Control line that swaps B for its bitwise inverse (for subtraction)</td></tr>
          <tr><td class="tg-0lax">Status bits</td><td class="tg-0lax">Extra ALU outputs (zero, less, overflow) that the instruction set uses for branches and slt</td></tr>
          <tr><td class="tg-0lax">Zero bit</td><td class="tg-0lax">1 when all result bits are 0; used by beq/bne</td></tr>
          <tr><td class="tg-0lax">Less bit</td><td class="tg-0lax">1 when A &lt; B, taken from the (overflow-corrected) sign of A - B</td></tr>
          <tr><td class="tg-0lax">Ripple-carry adder</td><td class="tg-0lax">Adder whose carries pass sequentially from bit to bit (slow: 32 stages)</td></tr>
          <tr><td class="tg-0lax">Generate (g)</td><td class="tg-0lax">A AND B: this column produces a carry no matter what comes in</td></tr>
          <tr><td class="tg-0lax">Propagate (p)</td><td class="tg-0lax">A XOR B: this column passes an incoming carry along</td></tr>
          <tr><td class="tg-0lax">Carry lookahead adder</td><td class="tg-0lax">Adder computing all carries in parallel from g and p terms</td></tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
      questions:
        - "Without looking, write the settings of <code>bInvert</code>, <code>carryIn</code>, and <code>operation</code> needed to compute <code>A - B</code>, and the formula for the overflow bit."

tags:
  - arithmetic
  - alu

---

