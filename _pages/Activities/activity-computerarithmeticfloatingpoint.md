---
layout: activity
permalink: /Activities/ComputerArithmeticFloatingPoint
title: "CS274: Computer Architecture - Computer Arithmetic: Floating Point"


info:
  goals:
    - To describe the components of the values in the IEEE 754 floating point standard
    - To differentiate between single and double precision floating point values
    - To convert floating point values into the IEEE 754 floating point standard format
    - To describe the benefits of normalization in the IEEE 754 standard
    - To explain how and why floating point precision is finite and subject to loss (approximation)

  models:
    - model: |
        <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/dcd36557db1b343d74991d99aeb50aadce64eb3a" alt="Scientific Notation">
      title: "Scientific Notation: a Review"
      questions:
        - What are the components of every value written in scientific notation?
        - "How might you &quot;normalize&quot; this value by writing it with only a single digit in the one's place?"
        - "For a binary value, every value except for 0 must have what value in the one's place when normalized?"
        
    - model: |
        <a title="Vectorization:  Stannered, CC BY-SA 3.0 &lt;http://creativecommons.org/licenses/by-sa/3.0/&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Float_example.svg"><img width="512" alt="Float example" src="https://commons.wikimedia.org/w/index.php?title=Special:Redirect/file/Float_example.svg"></a>    
      title: Single Precision Floating Point Standard
      questions:
        - "Write 0.5 in binary by writing it in the form <code>1.xxx * 2^yyy</code>.  What is the exponent and the mantissa?"
        - "Complete the conversion to floating point by adding this exponent to 127.  This is called a &quot;bias&quot; term, and you should end up with a positive exponent, even though your original exponent was negative.  Why do you think all exponents are converted to positive values in this way?"
        - "Look up the double precision standard and list the differences between it and the single precision standard."
        - "Does double precision offer inrceased range, increased precision, or both?"
        - "What is the approximate range of a single and a double precision floating point value?"
        - "Using only integer MIPS instructions, write an instruction to compare two MIPS floating point values.  Hint - you only need one line of code!  What does this tell you about the floating point standard?  Another hint - this has something to do with the normalization of the exponent by converting all exponents to positive values."
        - "Why isn't the initial 1 in the <code>1.xxx</code> field encoded in the bits of an IEEE floating point number?  What is the benefit of this?"

    - model: |
        <div align="center">
        Since a <code>float</code> is really just a 32-bit pattern, we can use the shift-and-mask tricks from our number systems work to pull out the sign, exponent, and mantissa fields ourselves!  Here is where each field lives:
        </div>
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
            <th class="tg-1wig">Field</th>
            <th class="tg-1wig">Bit Positions</th>
            <th class="tg-1wig">Width</th>
            <th class="tg-1wig">How to Extract It</th>
          </tr>
        </thead>
        <tbody>
          <tr><td class="tg-0lax">Sign</td><td class="tg-0lax">31</td><td class="tg-0lax">1 bit</td><td class="tg-0lax"><code>(x &gt;&gt; 31) &amp; 0x1</code></td></tr>
          <tr><td class="tg-0lax">Exponent</td><td class="tg-0lax">30 - 23</td><td class="tg-0lax">8 bits</td><td class="tg-0lax"><code>(x &gt;&gt; 23) &amp; 0xFF</code></td></tr>
          <tr><td class="tg-0lax">Fraction (mantissa)</td><td class="tg-0lax">22 - 0</td><td class="tg-0lax">23 bits</td><td class="tg-0lax"><code>x &amp; 0x7FFFFF</code></td></tr>
        </tbody>
        </table>
        <br>
        <strong>Worked Example: decode <code>x = 0x40490FDB</code></strong>
        <ol>
        <li>Expand each hex digit to 4 bits: <code>4=0100, 0=0000, 4=0100, 9=1001, 0=0000, F=1111, D=1101, B=1011</code>, so
        <pre>
        x = 0100 0000 0100 1001 0000 1111 1101 1011
            s eeeeeeee fffffffffffffffffffffff
            0 10000000 10010010000111111011011
        </pre>
        </li>
        <li><strong>Sign</strong>: <code>x &gt;&gt; 31</code> slides bit 31 down to position 0, giving <code>0b0</code>; then <code>0b0 &amp; 0x1 = 0</code>.  So <code>s = 0</code> (positive).</li>
        <li><strong>Exponent</strong>: <code>x &gt;&gt; 23</code> slides bits 31..23 down into the low 9 positions, giving <code>0 1000 0000</code> binary = <code>0x080</code>.  ANDing with <code>0xFF</code> (<code>1111 1111</code>) throws away the sign bit that came along for the ride: <code>0x080 &amp; 0xFF = 0x80 = 1000 0000</code> binary <code>= 128</code>.  So the stored exponent field is <code>E = 128</code>.</li>
        <li><strong>Mantissa</strong>: no shift needed since the fraction already starts at bit 0.  <code>x &amp; 0x7FFFFF</code> keeps only the low 23 bits: <code>0x40490FDB &amp; 0x007FFFFF = 0x490FDB</code> = <code>100 1001 0000 1111 1101 1011</code> binary = 4788187 decimal.</li>
        <li>Now reconstruct the value using <code>(-1)^s * 1.fraction * 2^(E - 127)</code>:
        <ol>
        <li><code>(-1)^0 = +1</code> (positive).</li>
        <li>Actual exponent = <code>E - 127 = 128 - 127 = 1</code> (remember to subtract the bias!).</li>
        <li>Fraction as a decimal = <code>4788187 / 2^23 = 4788187 / 8388608 = 0.5707963...</code></li>
        <li>Add the implicit leading 1: significand = <code>1 + 0.5707963... = 1.5707963...</code></li>
        <li>Value = <code>+1 * 1.5707963... * 2^1 = 3.1415927...</code>  We just decoded pi!</li>
        </ol>
        </li>
        </ol>
        <br>
        <strong>Practice Problems</strong>
        <ol>
        <li>Extract the three fields of <code>0x3F800000</code> and compute its value.
        <details><summary>Solution</summary>
        Binary: <code>0011 1111 1000 0000 0000 0000 0000 0000</code>.  Sign: <code>(x &gt;&gt; 31) &amp; 0x1 = 0</code>.  Exponent: <code>(x &gt;&gt; 23) &amp; 0xFF = 0x7F = 127</code>, so the actual exponent is <code>127 - 127 = 0</code>.  Mantissa: <code>x &amp; 0x7FFFFF = 0</code>, so the significand is <code>1 + 0 = 1.0</code>.  Value = <code>+1 * 1.0 * 2^0 = 1.0</code>.
        </details>
        </li>
        <li>Extract the three fields of <code>0xC0A00000</code> and compute its value.
        <details><summary>Solution</summary>
        Binary: <code>1100 0000 1010 0000 0000 0000 0000 0000</code>.  Sign: <code>(x &gt;&gt; 31) &amp; 0x1 = 1</code> (negative).  Exponent: <code>(x &gt;&gt; 23) &amp; 0xFF = 1000 0001 = 0x81 = 129</code>, so the actual exponent is <code>129 - 127 = 2</code>.  Mantissa: <code>x &amp; 0x7FFFFF = 0x200000 = 2097152</code>, so the fraction is <code>2097152 / 8388608 = 0.25</code> and the significand is <code>1.25</code>.  Value = <code>-1 * 1.25 * 2^2 = -5.0</code>.
        </details>
        </li>
        <li>Going the other way: assemble the hex word for <code>-0.75</code>.
        <details><summary>Solution</summary>
        <code>-0.75 = -0.11</code> binary <code>= -1.1 * 2^-1</code>.  So <code>s = 1</code>; stored exponent <code>E = -1 + 127 = 126 = 0111 1110</code>; mantissa = <code>1000...0</code> (the <code>.1</code> followed by 22 zeros, since the leading 1 is implicit).  Putting the fields together: <code>1 01111110 10000000000000000000000</code>.  Regroup into nibbles: <code>1011 1111 0100 0000 0000 0000 0000 0000 = 0xBF400000</code>.  (You could also build it arithmetically: <code>(1 &lt;&lt; 31) | (126 &lt;&lt; 23) | 0x400000</code>.)
        </details>
        </li>
        <li>Special case: what value is <code>0x00000000</code>?  What do the masks give you?
        <details><summary>Solution</summary>
        Sign = 0, exponent field = 0, mantissa = 0.  If you blindly applied the formula, you would get <code>1.0 * 2^(0 - 127) = 2^-127</code> - but an all-zero exponent is a special case: with a zero mantissa it is defined to be exactly <code>0.0</code>.  (There is also <code>0x80000000</code>, &quot;negative zero,&quot; with the sign bit set.)
        </details>
        </li>
        <li>Special case: what value is <code>0x7F800000</code>?
        <details><summary>Solution</summary>
        Sign = 0, exponent field = <code>0xFF = 255</code> (all ones), mantissa = 0.  An all-ones exponent with a zero mantissa is defined as infinity, so this is <code>+infinity</code>.  (With a non-zero mantissa it would be NaN.)
        </details>
        </li>
        </ol>
        <br>
        <strong>Common Pitfalls</strong>
        <ul>
        <li><strong>Forgetting the bias</strong>: the stored exponent field is the actual exponent <em>plus 127</em>.  Always compute <code>E - 127</code> when decoding, and <code>exponent + 127</code> when encoding.</li>
        <li><strong>Forgetting the implicit leading 1</strong>: the mantissa bits are only the fraction; the significand is <code>1.fraction</code>, so add 1 before multiplying (except for the special all-zero-exponent cases).</li>
        <li><strong>Arithmetic vs. logical shift</strong>: in C and Java, <code>&gt;&gt;</code> on a <em>signed</em> int is an arithmetic shift that copies the sign bit, so if the float's sign bit is 1, <code>x &gt;&gt; 31</code> gives <code>0xFFFFFFFF</code> (-1), not 1!  The <code>&amp; 0x1</code> in <code>(x &gt;&gt; 31) &amp; 0x1</code> protects you - or store the bits in an <code>unsigned int</code> (or use Java's <code>&gt;&gt;&gt;</code>).</li>
        <li><strong>Masking with the wrong width</strong>: the exponent mask is <code>0xFF</code> (8 ones) and the mantissa mask is <code>0x7FFFFF</code> (23 ones); count your F's and remember that 7 = <code>0111</code> supplies only 3 ones.</li>
        </ul>
      title: "Practice: Extracting the Fields of a Float with Masks and Shifts"
      questions:
        - "Why does the exponent extraction need the <code>&amp; 0xFF</code> even after shifting right by 23?"
        - "Write C expressions that reassemble a float word from variables <code>s</code>, <code>E</code>, and <code>m</code> using shifts and ORs."

    - model: |
        <div align="center">
        0.0: 0 00000000 00000000000000000000000<br>
        1.0 (1.0 x 2^0): 0 01111111 00000000000000000000000<br>
        0.5 (0.1 binary = 1.0 x 2^-1): 0 01111110 00000000000000000000000<br>
        0.75 (0.11 binary = 1.1 x 2^-1): 0 01111110 10000000000000000000000<br>
        3.0 (11 binary = 1.1*2^1): 0 10000000 10000000000000000000000<br>
        -0.375 (-0.011 binary = -1.1*2^-2): 1 01111101 10000000000000000000000<br>
        1 10000011 01000000000000000000000 = - 1.01 * 2^4 = -20.0
        </div>
      title: Representing Floating Point Values
      questions:
        - "Represent 1.25 as a single precision floating point value."
        - "What floating point value is represented by the binary field 0 01111110 000000000000000000000000?"
        - "An exponent of 255 with a mantissa is considered infinity (which can be positive or negative based on the sign bit), and NaN is represented by an exponent of 255 with a non-zero mantissa.  What floating point value would be represented by the binary field 0 00000000 000000000000000000000000; that is, 0 exponent and 0 mantissa?  Note that this is considered a special case and, in reality, it is hard coded to 0"
        - "What is the distance between two floating point numbers?  Is it always the same?  When might you expect the gap to be larger, or smaller (which field would this depend upon)?"
        - "Represent 0.1 as a single precision floating point value.  To calculate a mantissa for any decimal value, repeatedly multiply the decimal portion by 2; if this number is greater than 1, append a 1 to the mantissa.  Take the decimal portion of that result and repeat to fill the rest of the mantissa field.  Normalize this mantissa with any whole number portion of the float, and use this to generate your exponent."
        
    - model: |
        <div align="center">
        1.000 * 2^-1 + -1.11 * 2^-2<br>
        1.000 * 2^-1 + -0.111 * 2^-1<br>
        0.001 * 2^-1<br>
        1.000 * 2^-4<br>
        0.5 + -0.4375 = 0.0625
        </div>
      title: Addition of Floating Point Values and Loss of Precision
      questions:
        - "To add floating point values, denormalize one so that there is a single ones place and a mantissa for both values.  Then add or subtract, and then re-normalize the result.  Generate two floating point values, convert them to IEEE 754 binary, and add them.  Check your answer by converting the values back to decimal."
        - "What is the result of <code>(-1.9*10^25 + 1)</code>?  Why?"
        - "What is the result of <code>-1.9*10^25 + (1.9*10^25 + 1)</code>?  How about <code>(-1.9*10^25 + 1.9*10^25) + 1</code>?  Are they the same or different, and why?"
        - "Is floating point arithmetic associative?  That is, do you get the same results by adding floating point values when you move the parenthesis?" 

    - model: |
        <div align="center">
        A quick-reference recap of the key rules from this activity.  Try to reproduce each one from memory before peeking!
        </div>
        <br>
        <strong>Key Rules and Formulas</strong>
        <ul>
        <li><strong>Single precision value formula</strong>: <code>value = (-1)^s * 1.fraction * 2^(E - 127)</code>, where <code>s</code> is the sign bit, <code>E</code> is the 8-bit stored exponent, and the 23 fraction bits follow an implicit leading 1.  Micro-example: <code>0 10000000 10010010000111111011011</code> gives <code>+1 * 1.5707963 * 2^(128-127) = 3.1415927</code>.</li>
        <li><strong>Bias</strong>: stored exponent = actual exponent + 127 (single precision); + 1023 (double precision).  Micro-example: an actual exponent of -1 (as in 0.5 = <code>1.0 * 2^-1</code>) is stored as <code>-1 + 127 = 126</code>.</li>
        <li><strong>Normalization</strong>: every nonzero binary value is written as <code>1.xxx * 2^y</code>, so the leading 1 need not be stored - a free bit of precision!</li>
        <li><strong>Field extraction</strong>: sign = <code>(x &gt;&gt; 31) &amp; 0x1</code>; exponent = <code>(x &gt;&gt; 23) &amp; 0xFF</code>; mantissa = <code>x &amp; 0x7FFFFF</code>.</li>
        <li><strong>Double precision</strong>: 1 sign bit, 11 exponent bits (bias 1023), 52 fraction bits - both more range and more precision than single.</li>
        <li><strong>Decimal fraction to binary mantissa</strong>: repeatedly multiply the fractional part by 2 and record the whole-number digit.  Micro-example: 0.375: <code>0.375 * 2 = 0.75</code> (0); <code>0.75 * 2 = 1.5</code> (1); <code>0.5 * 2 = 1.0</code> (1); so <code>0.375 = 0.011</code> binary <code>= 1.1 * 2^-2</code>.</li>
        <li><strong>Floating point addition</strong>: (1) denormalize the smaller value so both share the larger exponent, (2) add/subtract the significands, (3) renormalize, (4) round.  Aligning can shift small addends entirely out of the mantissa, which is why <code>-1.9*10^25 + (1.9*10^25 + 1)</code> can differ from <code>(-1.9*10^25 + 1.9*10^25) + 1</code>: floating point addition is <em>not</em> associative.</li>
        </ul>
        <br>
        <pre>
        Bit:   31 | 30 ......... 23 | 22 ........................... 0
              +===+================+================================+
              | s |  exponent (8)  |         fraction (23)          |
              +===+================+================================+
        </pre>
        <br>
        <strong>Special Cases (single precision)</strong>
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
          <tr><th class="tg-1wig">Exponent Field</th><th class="tg-1wig">Mantissa</th><th class="tg-1wig">Meaning</th></tr>
        </thead>
        <tbody>
          <tr><td class="tg-0lax">0</td><td class="tg-0lax">0</td><td class="tg-0lax">Zero (sign bit gives +0 or -0)</td></tr>
          <tr><td class="tg-0lax">0</td><td class="tg-0lax">non-zero</td><td class="tg-0lax">Denormalized (very small) value, no implicit 1</td></tr>
          <tr><td class="tg-0lax">1 - 254</td><td class="tg-0lax">anything</td><td class="tg-0lax">Normal value: <code>(-1)^s * 1.f * 2^(E-127)</code></td></tr>
          <tr><td class="tg-0lax">255</td><td class="tg-0lax">0</td><td class="tg-0lax">+infinity or -infinity</td></tr>
          <tr><td class="tg-0lax">255</td><td class="tg-0lax">non-zero</td><td class="tg-0lax">NaN (not a number)</td></tr>
        </tbody>
        </table>
        <br>
        <strong>Glossary</strong>
        <table class="tg">
        <thead>
          <tr><th class="tg-1wig">Term</th><th class="tg-1wig">Meaning</th></tr>
        </thead>
        <tbody>
          <tr><td class="tg-0lax">Sign bit</td><td class="tg-0lax">Bit 31; 0 for positive, 1 for negative</td></tr>
          <tr><td class="tg-0lax">Exponent field</td><td class="tg-0lax">Bits 30-23; the actual exponent plus the bias</td></tr>
          <tr><td class="tg-0lax">Bias</td><td class="tg-0lax">The constant (127 single, 1023 double) added so all stored exponents are non-negative and floats compare like integers</td></tr>
          <tr><td class="tg-0lax">Mantissa (fraction)</td><td class="tg-0lax">Bits 22-0; the digits after the binary point of the normalized significand</td></tr>
          <tr><td class="tg-0lax">Significand</td><td class="tg-0lax"><code>1.fraction</code> - the mantissa with the implicit leading 1 restored</td></tr>
          <tr><td class="tg-0lax">Normalization</td><td class="tg-0lax">Writing a value with exactly one nonzero digit before the point: <code>1.xxx * 2^y</code></td></tr>
          <tr><td class="tg-0lax">Denormalized number</td><td class="tg-0lax">A tiny value with exponent field 0 and no implicit leading 1</td></tr>
          <tr><td class="tg-0lax">NaN</td><td class="tg-0lax">&quot;Not a number,&quot; e.g. the result of 0/0; exponent field all ones, non-zero mantissa</td></tr>
          <tr><td class="tg-0lax">Loss of precision</td><td class="tg-0lax">Rounding error when a result needs more mantissa bits than are available</td></tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
      questions:
        - "Without looking, write the single precision layout (field names, widths, bit positions), then encode 2.5 and check your answer with the value formula."

  additional_reading:
    - link: https://en.wikipedia.org/wiki/IEEE_754
      title: IEEE 754 Floating Point Standard
    - link: https://www.doc.ic.ac.uk/~eedwards/compsys/float/
      title: Floating Point Arithmetic Examples
    - link: https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf
      title: "What Every Computer Scientist Should Know about Floating Point"
    - title: "Floating Point Standard Example"
      link: "../files/replit/FloatingPointStandard.zip" 
      
tags:
  - arithmetic
  - floating point

---

