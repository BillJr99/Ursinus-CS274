---
layout: activity
permalink: /Activities/Circuits
title: "CS274: Computer Architecture - From Circuits to Systems: the 555 Timer"
excerpt: "CS274: Computer Architecture - From Circuits to Systems: the 555 Timer"

info:
  goals:
    - To construct basic circuits using transistor logic gates
    - To integrate circuits into logic components that can be used to build modern computers
    - To demonstrate transistor logic using the 555 timer integrated circuit
    - To explain that a timer can be used to synchronize computations via a clock

  models:
    - model: |
        <a title="Pradana Aumars (talk · contribs), CC0, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Simplified_NOT_gate_circuit_using_transistor.svg"><img width="256" alt="Simplified NOT gate circuit using transistor" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Simplified_NOT_gate_circuit_using_transistor.svg/256px-Simplified_NOT_gate_circuit_using_transistor.svg.png"></a>
      title: Transistor-based Logic Gates
      questions:
        - "The source current flows through the 10 kilo-ohm resistor (R_1) at the top of the figure.  If current is applied to the transistor (T) at point A, the gate will close and the current will be allowed to pass to ground.  Otherwise, the gate will be open and the current will be forced to flow to the output (S).  If A is high, what is the output on S?  What is the output on S if A is low?" 
        - "If you were to give this gate a name, what would you call it?"
        
    - model: |
        <a title="EBatlleP, CC BY-SA 3.0 &lt;https://creativecommons.org/licenses/by-sa/3.0&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Transistor_OR_Gate.png"><img width="256" alt="Transistor OR Gate" src="https://upload.wikimedia.org/wikipedia/commons/0/01/Transistor_OR_Gate.png"></a>
        <br>
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-fymr{border-color:inherit;font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-fymr">A</th>
            <th class="tg-fymr">B</th>
            <th class="tg-fymr">Out</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0pky"><span style="font-weight:bold">0</span></td>
            <td class="tg-fymr">0</td>
            <td class="tg-0pky"></td>
          </tr>
          <tr>
            <td class="tg-fymr">0</td>
            <td class="tg-fymr">1</td>
            <td class="tg-0pky"></td>
          </tr>
          <tr>
            <td class="tg-fymr">1</td>
            <td class="tg-fymr">0</td>
            <td class="tg-0pky"></td>
          </tr>
          <tr>
            <td class="tg-fymr">1</td>
            <td class="tg-fymr">1</td>
            <td class="tg-0pky"></td>
          </tr>
        </tbody>
        </table>        
      title: Another Transistor-based Logic Gate: the OR Gate
      questions:
        - "Describe the current behavior in this gate, in terms of the two inputs A and B."
        - "Fill in the truth table above."
        - "Modify the NOT gate to act as a NAND gate.  This gate outputs low if both A and B are high, and outputs high otherwise.  That is, it is the opposite of an AND gate (hence &quot;NOT AND&quot;).  Hint: this gate looks nearly identical to the NOT gate, but has an additional input B that drives an additional transistor between T and ground."

    - model: |
        <a title="Napalm Llama, CC BY-SA 3.0 &lt;http://creativecommons.org/licenses/by-sa/3.0/&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:R-S_mk2.gif"><img width="256" alt="R-S mk2" src="https://upload.wikimedia.org/wikipedia/commons/c/c6/R-S_mk2.gif"></a>
      title: The SR Latch
      questions:
        - "The purpose of S is to set the output (Q) to high.  R is a reset, and sets Q to low.  Q bar is just the opposite of Q.  If Q is set to high by setting S to high, why does Q remain high even when turning off the current to S?"
        - "What do you think is the purpose of an SR Latch?"
        - "How can we cause an SR Latch to set when a series of conditions occur: for example, to unlock our door when it is warm and not raining outside?"

    - model: |
        <a title="Own work based on:NE555 astable.png, CC BY-SA 3.0 &lt;http://creativecommons.org/licenses/by-sa/3.0/&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:555_esquema.png"><img width="512" alt="555 esquema" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/555_esquema.png/512px-555_esquema.png"></a>
        <br>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/kRlSFm519Bo" title="YouTube video player" frameborder="0" allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
      title: The 555 Timer
      questions:
        - "When does the SR Latch get set to high, and when does it get set to low?"
        - "How often does the Q state of the SR Latch oscillate?"
        - "What controls the oscillation of the SR Latch?"
        - "How might one determine the frequency of the timer?  That is, what should the period of a timer or clock be when used inside a computer?  Could you make the timer as fast as you want?  Why or why not?"
        - "What elements of the 555 Timer would you adjust to make the SR Latch oscillate faster or slower?"

tags:
  - circuits

---

