---
layout: activity
permalink: /Activities/MIPSIteration
title: "CS274: Computer Architecture - MIPS Iteration"


info:
  goals:
    - To implement iterative algorithms using the MIPS assembly language

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
            
        guess:
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
            
            # loop until the user gets it right
            j guess

        correct:
            li $v0, 4
            la $a0, right
            syscall       
            
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
      title: An iterative MIPS program
      questions:
        - What kind of loop do you see depicted in this program?
        
    - model: |
        <script type="syntaxhighlighter" class="brush: c"><![CDATA[        
        int main(void) {
            int sum = 0;
            int i = 0;
            
            for(i = 0; i < 10; i++) {
                sum = sum + 1;
            }
            
            printf("%d", sum);
        }
        ]]></script>
        <br>
        <script type="syntaxhighlighter" class="brush: c"><![CDATA[        
        int main(void) {
            int num = 0;
            do {
                printf("Enter a number between 1 and 10\n");
                scanf(" %d", &num);
            } while(num < 1 || num > 10);
        }
        ]]></script>
      title: "Implementing Loops in MIPS"
      questions:
        - "Translate each of the above C code listings into a MIPS assembly program"         

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
        <p>A one-page summary of loops in MIPS.</p>
        <p><strong>The three loop skeletons:</strong></p>
        <pre>
        while (cond) { body }          do { body } while (cond);       for (init; cond; update) { body }
        --------------------           ------------------------       ---------------------------------
        loop:                          loop:                               # init, e.g. li $t0, 0
            # test cond;                   # body                      loop:
            # branch to done               # test cond;                    # test cond; branch to done
            #   when it FAILS              # branch to loop                # body
            # body                         #   when it HOLDS               # update, e.g. addi $t0, $t0, 1
            j loop                                                         j loop
        done:                                                          done:
        </pre>
        <p>Notice: a <code>while</code>/<code>for</code> loop tests at the <em>top</em> (branching away on the opposite of the condition), and a <code>do</code>-<code>while</code> tests at the <em>bottom</em> (branching back when the condition holds), so its body always runs at least once.</p>
        <p><strong>A concrete counted loop</strong> (sum 0 + 1 + ... + 9), with every micro-step:</p>
        <ol>
          <li>Initialize: <code>li $t0, 0</code> (i) and <code>li $s0, 0</code> (sum).</li>
          <li>Test: <code>slti $at, $t0, 10</code> sets <code>$at</code> = 1 while i &lt; 10; <code>beq $at, $zero, done</code> exits when i reaches 10.</li>
          <li>Body: <code>add $s0, $s0, $t0</code>.</li>
          <li>Update: <code>addi $t0, $t0, 1</code>.</li>
          <li>Repeat: <code>j loop</code>.  The loop body runs exactly 10 times (i = 0 through 9).</li>
        </ol>
        <p><strong>Key rules:</strong></p>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-1wig">Rule</th>
            <th class="tg-1wig">Micro-example</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">Branch away on the <em>opposite</em> of the loop condition to exit; jump back to repeat.</td>
            <td class="tg-0lax">C's <code>while (i &lt; 10)</code> becomes &quot;exit when i &gt;= 10&quot;</td>
          </tr>
          <tr>
            <td class="tg-0lax">Every loop needs an initialization, a test, and an update -- forget the update and you loop forever.</td>
            <td class="tg-0lax">Without <code>addi $t0, $t0, 1</code>, i stays 0 and the test never fails</td>
          </tr>
          <tr>
            <td class="tg-0lax">Compound conditions (<code>||</code>, <code>&amp;&amp;</code>) become chains of branches.</td>
            <td class="tg-0lax"><code>while (n &lt; 1 || n &gt; 10)</code>: branch back to the prompt from either test</td>
          </tr>
          <tr>
            <td class="tg-0lax">When looping over an array by index, scale the index by 4 each iteration (or add 4 to a running pointer).</td>
            <td class="tg-0lax"><code>sll $t4, $t2, 2</code> then <code>add $t3, $t0, $t4</code></td>
          </tr>
          <tr>
            <td class="tg-0lax">Backward branch offsets are negative two's complement word counts.</td>
            <td class="tg-0lax">A branch 5 instructions back stores immediate <code>0xFFFB</code> (-5)</td>
          </tr>
        </tbody>
        </table>
        <br>
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
            <td class="tg-1wig">Loop body</td>
            <td class="tg-0lax">The instructions repeated on every iteration.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Loop counter (induction variable)</td>
            <td class="tg-0lax">A register (often a <code>$t</code>) that counts iterations, e.g. i.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Pre-test loop</td>
            <td class="tg-0lax">Tests before the body (<code>while</code>, <code>for</code>); may run zero times.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Post-test loop</td>
            <td class="tg-0lax">Tests after the body (<code>do</code>-<code>while</code>); always runs at least once.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Infinite loop</td>
            <td class="tg-0lax">A loop whose exit test can never fail -- often a missing update instruction.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Sentinel</td>
            <td class="tg-0lax">A special value (like a correct guess, or a string's null terminator) that ends a loop.</td>
          </tr>
          <tr>
            <td class="tg-1wig">Backward branch</td>
            <td class="tg-0lax">A branch or jump to an earlier address; the telltale sign of a loop in machine code.</td>
          </tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"

tags:
  - mips
  - iteration
  - conditionals

---

