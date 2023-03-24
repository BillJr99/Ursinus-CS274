---
layout: activity
permalink: /Activities/ComputerArithmeticFloatingPoint
title: "CS274: Computer Architecture - Computer Arithmetic: Floating Point"
excerpt: "CS274: Computer Architecture - Computer Arithmetic: Floating Point"

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
        <a title="Vectorization:  Stannered, CC BY-SA 3.0 &lt;http://creativecommons.org/licenses/by-sa/3.0/&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Float_example.svg"><img width="512" alt="Float example" src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Float_example.svg/512px-Float_example.svg.png"></a>    
      title: Single Precision Floating Point Standard
      questions:
        - "Write 0.5 in binary by writing it in the form <code>1.xxx * 2^yyy</code>.  What is the exponent and the mantissa?"
        - "Complete the conversion to floating point by subtracting this exponent from 127.  You should have a positive number, even though your original exponent was negative.  Why do you think all exponents are converted to positive values in this way?"
        - "Look up the double precision standard and list the differences between it and the single precision standard."
        - "Does double precision offer inrceased range, increased precision, or both?"
        - "What is the approximate range of a single and a double precision floating point value?"
        - "Using only integer MIPS instructions, write an instruction to compare two MIPS floating point values.  Hint - you only need one line of code!  What does this tell you about the floating point standard?  Another hint - this has something to do with the normalization of the exponent by converting all exponents to positive values."
        - "Why isn't the initial 1 in the <code>1.xxx</code> field encoded in the bits of an IEEE floating point number?  What is the benefit of this?"
      embed: |
        <iframe height="400px" width="100%" src="https://repl.it/@BillJr99/FloatingPointStandard?lite=true" scrolling="no" frameborder="no" allowtransparency="true" allowfullscreen="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-same-origin allow-scripts allow-modals"></iframe> 
        
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

  additional_reading:
    - link: https://en.wikipedia.org/wiki/IEEE_754
      title: IEEE 754 Floating Point Standard
    - link: https://www.doc.ic.ac.uk/~eedwards/compsys/float/
      title: Floating Point Arithmetic Examples

tags:
  - arithmetic
  - floating point

---

