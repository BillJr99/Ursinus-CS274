---
layout: activity
permalink: /Activities/MIPSConditionals
title: "CS274: Computer Architecture - MIPS Conditionals"


info:
  goals:
    - "To implement <code>if</code> and <code>else</code> statements using MIPS assembly."

  models:
    - model: |
        <script type="syntaxhighlighter" class="brush: mips"><![CDATA[        
        .text
        .globl main
         
        main:
            # print user prompt string
            li $v0, 4
            la $a0, input
            syscall    
            
            # read integer - will be copied to v0
            li $v0, 5
            syscall
            
            # our secret number is 7!
            li $s0, 7
            
            # if v0 == our secret number s0
            beq $s0, $v0, correct
            
            # incorrect code
            li $v0, 4
            la $a0, wrong
            syscall       
            
            # but skip the correct code!
            j exit

        correct:
            li $v0, 4
            la $a0, right
            syscall 

            # What would you add here to print "The secret number was: " followed by the integer 7, followed by a newline?
            
        exit:
            # exit
            li $v0, 10
            syscall  
            
        .data
            input: .asciiz "Can you guess my secret number between 1 and 10?  Enter it below\n"
            wrong: .asciiz "Not quite!\n"
            right: .asciiz "You guessed it!\n"   
        ]]></script>
        </div>
      title: "An <code>if</code>/<code>else</code> statement in MIPS"
      questions:
        - "Translate the above code into a C, Java, or Python program.  What does it do?"
        - "What would happen if the <code>j exit</code> line was omitted?"
        - "How would you modify this program to print the secret number using a syscall?"
        - "Translate the <code>beq</code> instruction to machine language."
        - "Translate the <code>j</code> instruction to machine language."
        - "What is the farthest you can move the program counter with a branch instruction?  How about a jump instruction?"
        - "Suppose you wanted to jump to a location that caused the upper four bits of the program counter to be modified.  Using a combination of branch and jump instructions, perform this jump."
        
    - model: |
        <script type="syntaxhighlighter" class="brush: c"><![CDATA[        
        int main(void) {
            int grade = 93;
            
            if(grade > 90) {
                printf("A\n");
            } else if(grade > 80) {
                printf("B\n");
            } else {
                printf("C or lower\n");
            }
        }
        ]]></script>
      title: "Implementing MIPS Conditionals"
      questions:
        - "Translate the above C code into a MIPS assembly program"        

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
        <p>A one-page summary of conditionals in MIPS.</p>
        <p><strong>Translation patterns for every comparison</strong> (note the trick: to <em>run</em> the body when a condition holds, branch <em>away</em> on its opposite!):</p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">C condition</th>
            <th class="tg-1wig">MIPS to skip the body when false</th>
            <th class="tg-1wig">Why</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax"><code>if (a == b)</code></td>
            <td class="tg-0lax"><code>bne $t0, $t1, skip</code></td>
            <td class="tg-0lax">Branch away on the opposite: not-equal</td>
          </tr>
          <tr>
            <td class="tg-0lax"><code>if (a != b)</code></td>
            <td class="tg-0lax"><code>beq $t0, $t1, skip</code></td>
            <td class="tg-0lax">Branch away on equal</td>
          </tr>
          <tr>
            <td class="tg-0lax"><code>if (a &lt; b)</code></td>
            <td class="tg-0lax"><code>slt $at, $t0, $t1</code> then <code>beq $at, $zero, skip</code></td>
            <td class="tg-0lax"><code>$at</code> = 1 if a &lt; b; skip when it is 0 (i.e. a &gt;= b)</td>
          </tr>
          <tr>
            <td class="tg-0lax"><code>if (a &gt;= b)</code></td>
            <td class="tg-0lax"><code>slt $at, $t0, $t1</code> then <code>bne $at, $zero, skip</code></td>
            <td class="tg-0lax">Skip when a &lt; b is true</td>
          </tr>
          <tr>
            <td class="tg-0lax"><code>if (a &gt; b)</code></td>
            <td class="tg-0lax"><code>slt $at, $t1, $t0</code> then <code>beq $at, $zero, skip</code></td>
            <td class="tg-0lax">a &gt; b is the same as b &lt; a: swap the operands</td>
          </tr>
          <tr>
            <td class="tg-0lax"><code>if (a &lt; 100)</code></td>
            <td class="tg-0lax"><code>slti $at, $t0, 100</code> then <code>beq $at, $zero, skip</code></td>
            <td class="tg-0lax">Comparing against a constant uses <code>slti</code></td>
          </tr>
        </tbody>
        </table>
        <br>
        <p><strong>The if/else skeleton</strong> (compare with the C on the left):</p>
        <pre>
        C                              MIPS
        ---------------------          ----------------------------------
        if (a == b) {                      bne  $t0, $t1, else_part
            /* then code */                # ... then code ...
        } else {                           j    endif
            /* else code */            else_part:
        }                                  # ... else code ...
        /* after */                    endif:
                                           # ... after ...
        </pre>
        <p>Concrete micro-example: with <code>$t0</code> = 7 and <code>$t1</code> = 7, <code>bne</code> is not taken (7 == 7), the then-code runs, and <code>j endif</code> hops over the else-code.  With <code>$t0</code> = 3, <code>bne</code> is taken and only the else-code runs.  Forgetting the <code>j endif</code> would run <em>both</em> bodies!</p>
        <p><strong>Glossary:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Term</th>
            <th class="tg-1wig">One-line definition</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-1wig">Branch</td>
            <td class="tg-0lax">A conditional change of the PC (<code>beq</code>, <code>bne</code>), reaching PC-relative targets within +/- 32K words.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Jump</td>
            <td class="tg-0lax">An unconditional change of the PC (<code>j</code>), reaching anywhere in the current 256 MB region.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Label</td>
            <td class="tg-0lax">A named address used as a branch or jump target; the assembler computes the offset for you.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Fall through</td>
            <td class="tg-0lax">What happens when a branch is not taken: execution continues with the next instruction.</td>
          </tr>
          <tr>
            <td class="tg-1wig"><code>slt</code> / <code>slti</code></td>
            <td class="tg-0lax">Set-if-less-than: writes 1 or 0 to a register, turning a comparison into data a branch can test.</td>
          </tr>
          <tr>
            <td class="tg-1wig"><code>$at</code></td>
            <td class="tg-0lax">The assembler temporary register (1), reserved for pseudoinstruction expansions like <code>blt</code>.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Pseudoinstruction</td>
            <td class="tg-0lax"><code>blt $t0, $t1, L</code> is really <code>slt $at, $t0, $t1</code> + <code>bne $at, $zero, L</code>.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Branch inversion</td>
            <td class="tg-0lax">The compiler's habit of branching on the <em>opposite</em> condition to skip the body.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

tags:
  - mips
  - conditionals

---

