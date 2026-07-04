---
layout: activity
permalink: /Activities/NumberSystems
title: "CS274: Computer Architecture - Number Systems"


info:
  goals:
    - To convert between decimal, hexadecimal, and binary number representations
    - To explain why computers represent values in binary rather than in another number system

  models:
    - model: |
        <div align="center">
        Divide the value by 2, and append the remainder to the beginning of your output string.  Repeat using the new quotient until the quotient is 0.
        <br>
        <script type="syntaxhighlighter" class="brush: cpp"><![CDATA[        
        function convert_decimal_to_binary(x) {
            result = "";
            
            while(x > 0) {
                remainder = x % 2;
                x = x / 2;
                result = remainder + result;
            }
            
            return result;
        }
        ]]></script>
        </div>
        <br>
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-fymr{border-color:inherit;font-weight:bold;text-align:left;vertical-align:top}
        .tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-fymr">Number</th>
            <th class="tg-fymr">Quotient / 2</th>
            <th class="tg-fymr">Remainder</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0pky">375</td>
            <td class="tg-0pky">187</td>
            <td class="tg-0pky">1</td>
          </tr>
          <tr>
            <td class="tg-0pky">187</td>
            <td class="tg-0pky">93</td>
            <td class="tg-0pky">1</td>
          </tr>
          <tr>
            <td class="tg-0pky">93</td>
            <td class="tg-0pky">46</td>
            <td class="tg-0pky">1</td>
          </tr>
          <tr>
            <td class="tg-0pky">46</td>
            <td class="tg-0pky">23</td>
            <td class="tg-0pky">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">23</td>
            <td class="tg-0lax">11</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-0lax">11</td>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-0lax">5</td>
            <td class="tg-0lax">2</td>
            <td class="tg-0lax">1</td>
          </tr>
          <tr>
            <td class="tg-0lax">2</td>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
          </tr>
          <tr>
            <td class="tg-0lax">1</td>
            <td class="tg-0lax">0</td>
            <td class="tg-0lax">1</td>
          </tr>
        </tbody>
        </table>
      title: Converting From Decimal to Binary
      questions:
        - Using the procedure above, convert 1024 to binary.
        - Convert 617 to binary.
        - Why might a computer prefer to store values in binary rather than in another number system?

    - model: |
        <div align="center">
        Multiply the digit (1 or 0) by its place value (2 to the power of the digit position, right to left, beginning at the 1 place), and add up the result.
        <br> 
        In the example in the table below: 00001011001 = 1 * 1 + 0 * 2 + 0 * 4 + 1 * 8 + 1 * 16 + 0 * 32 + 1 * 64 + 0 * 128 + 0 ... = 1 + 8 + 16 + 64 = 89
        <br>
        <script type="syntaxhighlighter" class="brush: cpp"><![CDATA[        
        function convert_binary_to_decimal(x) {
            result = 0;
            
            for(i = x.length - 1; i >= 0; i--) {
                ch = x[i];
                
                if(ch == '1') {
                    result = result + Math.pow(2, x.length - i - 1);
                }
            }
            
            return result;
        }
        ]]></script>
        </div>
        <br>    
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-za14{border-color:inherit;text-align:left;vertical-align:bottom}
        .tg .tg-7zrl{text-align:left;vertical-align:bottom}
        </style>
        <table class="tg">
        <thead>
          <tr>
            <th class="tg-za14">Place Value</th>
            <th class="tg-za14">1024</th>
            <th class="tg-za14">512</th>
            <th class="tg-7zrl">256</th>
            <th class="tg-7zrl">128</th>
            <th class="tg-7zrl">64</th>
            <th class="tg-7zrl">32</th>
            <th class="tg-7zrl">16</th>
            <th class="tg-7zrl">8</th>
            <th class="tg-7zrl">4</th>
            <th class="tg-7zrl">2</th>
            <th class="tg-7zrl">1</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-za14"></td>
            <td class="tg-za14">0</td>
            <td class="tg-za14">0</td>
            <td class="tg-7zrl">0</td>
            <td class="tg-7zrl">0</td>
            <td class="tg-7zrl">1</td>
            <td class="tg-7zrl">0</td>
            <td class="tg-7zrl">1</td>
            <td class="tg-7zrl">1</td>
            <td class="tg-7zrl">0</td>
            <td class="tg-7zrl">0</td>
            <td class="tg-7zrl">1</td>
          </tr>
        </tbody>
        </table>
      title: Converting From Binary to Decimal
      questions:
        - Convert 0b1000100001 from binary to decimal.
        - Convert 0b10001001 from binary to decimal.
        - Convert 0b101110111 from binary to decimal.

    - model: |
        <div align="center">
        Take each group of 4 binary values from left to right.  Look them up in the table to obtain the corresponding hexadecimal digit, and output that digit.
        </div>
        <br>
        <a title="Dgoetze, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Positionalnotationtable.jpg"><img width="512" alt="Positionalnotationtable" src="https://commons.wikimedia.org/w/index.php?title=Special:Redirect/file/Positionalnotationtable.jpg"></a>
      title: Converting From Binary to Hexadecimal
      questions:
        - "What is the ASCII value of the letter <code>C</code> and the letter <code>K</code>?  What are these values in binary, decimal, and hexadecimal?"
        - "Suppose a binary value is fewer than 4 bits, like 0b110.  How can you convert this to a 4-bit binary value so that it can be looked up in the table?"
        - Convert 0b1000100001 from binary to hexadecimal.
        - Convert 0b10001001 from binary to hexadecimal.
        - Convert 0b101110111 from binary to hexadecimal.
        - Convert 375 from decimal to binary, and then to hexadecimal.
        
    - model: |
        <div align="center">
        Using the binary to hexadecimal table, look up the binary representation for each hexadecimal digit.  In other words, convert each hexadecimal digit to decimal, and then to binary.  This will result in a four digit binary number.  Output those binary bits.  Repeat for each hexadecimal digit from left to right.
        </div>
      title: Converting From Hexadecimal to Binary
      questions:
        - Convert 0xCAFE from hexadecimal to binary.
        - Convert 0x3C from hexadecimal to binary, and from binary to decimal.
        - Convert 0xFF from hexadecimal to binary, and from binary to decimal.

    - model: |
        <div align="center">
        Now that you can convert between binary and hexadecimal, you can pull individual bits out of a value!  To extract a field of bits from an integer, shift the value to the right so that the field you want begins at bit position 0, and then AND the result with a &quot;mask&quot; of ones that is exactly as wide as the field.  The AND keeps only the bits where the mask is 1, and zeroes out everything else.
        <br><br>
        In general, to extract bits <code>k</code> down to <code>j</code> (inclusive) of a value <code>x</code>, compute: <code>(x &gt;&gt; j) &amp; ((1 &lt;&lt; (k - j + 1)) - 1)</code>
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
            <th class="tg-1wig">Field Width (bits)</th>
            <th class="tg-1wig">Mask Arithmetic</th>
            <th class="tg-1wig">Mask (binary)</th>
            <th class="tg-1wig">Mask (hex)</th>
          </tr>
        </thead>
        <tbody>
          <tr><td class="tg-0lax">1</td><td class="tg-0lax">(1 &lt;&lt; 1) - 1 = 2 - 1 = 1</td><td class="tg-0lax">1</td><td class="tg-0lax">0x1</td></tr>
          <tr><td class="tg-0lax">2</td><td class="tg-0lax">(1 &lt;&lt; 2) - 1 = 4 - 1 = 3</td><td class="tg-0lax">11</td><td class="tg-0lax">0x3</td></tr>
          <tr><td class="tg-0lax">3</td><td class="tg-0lax">(1 &lt;&lt; 3) - 1 = 8 - 1 = 7</td><td class="tg-0lax">111</td><td class="tg-0lax">0x7</td></tr>
          <tr><td class="tg-0lax">4</td><td class="tg-0lax">(1 &lt;&lt; 4) - 1 = 16 - 1 = 15</td><td class="tg-0lax">1111</td><td class="tg-0lax">0xF</td></tr>
          <tr><td class="tg-0lax">8</td><td class="tg-0lax">(1 &lt;&lt; 8) - 1 = 256 - 1 = 255</td><td class="tg-0lax">11111111</td><td class="tg-0lax">0xFF</td></tr>
        </tbody>
        </table>
        <br>
        <strong>Worked Mini-Example 1: extract bits 3..2 of 220</strong>
        <ol>
        <li>Write 220 in binary: <code>220 = 1101 1100</code>.</li>
        <li>The field is 2 bits wide (bits 3 and 2), so the mask is <code>(1 &lt;&lt; 2) - 1 = 4 - 1 = 3 = 0b11</code>.</li>
        <li>Shift right by <code>j = 2</code>: <code>1101 1100 &gt;&gt; 2 = 0011 0111</code> (the two rightmost bits fall off, and bits 3..2 land in positions 1..0).</li>
        <li>AND with the mask: <code>0011 0111 &amp; 0000 0011 = 0000 0011 = 3</code>.</li>
        <li>Check against step 1: bits 3..2 of <code>1101 1100</code> are indeed <code>11 = 3</code>.</li>
        </ol>
        <strong>Worked Mini-Example 2: extract bits 7..4 (the high nibble) of 0xAB</strong>
        <ol>
        <li>Write 0xAB in binary: <code>1010 1011</code>.</li>
        <li>The field is 4 bits wide, so the mask is <code>(1 &lt;&lt; 4) - 1 = 16 - 1 = 15 = 0xF</code>.</li>
        <li>Shift right by 4: <code>1010 1011 &gt;&gt; 4 = 0000 1010 = 0xA</code>.</li>
        <li>AND with the mask: <code>0000 1010 &amp; 0000 1111 = 0000 1010 = 0xA = 10</code>.  Notice that this extracts the first hexadecimal digit - each hex digit is a 4-bit field!</li>
        </ol>
        <strong>Worked Mini-Example 3: extract bit 0 of 41</strong>
        <ol>
        <li>Write 41 in binary: <code>0010 1001</code>.</li>
        <li>A 1-bit field needs no shift when <code>j = 0</code>, and the mask is <code>(1 &lt;&lt; 1) - 1 = 1</code>.</li>
        <li><code>0010 1001 &amp; 0000 0001 = 1</code>: bit 0 is 1, which tells us 41 is odd!</li>
        </ol>
        <br>
        <strong>Practice Problems</strong>
        <ol>
        <li>Extract bits 5..3 of 231 (0xE7).
        <details><summary>Solution</summary>
        231 = <code>1110 0111</code>.  Shift right by 3: <code>1110 0111 &gt;&gt; 3 = 0001 1100 = 28</code>.  Mask for a 3-bit field: <code>(1 &lt;&lt; 3) - 1 = 7</code>.  <code>28 &amp; 7 = 0001 1100 &amp; 0000 0111 = 100 = 4</code>.
        </details>
        </li>
        <li>Extract bits 11..8 of 0xBEEF.
        <details><summary>Solution</summary>
        Shift right by 8: <code>0xBEEF &gt;&gt; 8 = 0xBE</code>.  Mask for a 4-bit field: <code>0xF</code>.  <code>0xBE &amp; 0xF = 0xE = 14</code>.  (Shortcut: bits 11..8 are exactly the third hex digit from the right, which is E.)
        </details>
        </li>
        <li>Write an expression that extracts bits 6..4 of a variable <code>x</code>, and evaluate it for <code>x = 0x5C</code>.
        <details><summary>Solution</summary>
        The expression is <code>(x &gt;&gt; 4) &amp; 0x7</code> (a 3-bit mask).  0x5C = <code>0101 1100</code>.  <code>0101 1100 &gt;&gt; 4 = 0000 0101 = 5</code>, and <code>5 &amp; 7 = 5 = 0b101</code>.
        </details>
        </li>
        </ol>
      title: "Practice Warm-Up: Extracting Bits with Shifts and Masks"
      questions:
        - "Why must you shift before applying the mask (what would <code>x &amp; 0b11</code> give you if the field you wanted was in bits 3..2)?"
        - "What mask (in hex) would you use to extract an 8-bit field?  A 16-bit field?"

    - model: |
        <div align="center">
        Bit masks are not just an academic exercise - your computer uses them every time it sends a network packet!  An IPv4 address like <code>192.168.1.12</code> is really just a 32-bit binary number: each of the four numbers (called &quot;octets&quot;) is one byte, written in decimal and separated by dots.  The &quot;slash&quot; suffix in <code>192.168.1.12/24</code> is called CIDR notation, and it says that the first 24 bits identify the <em>network</em>, while the remaining 32 - 24 = 8 bits identify the <em>host</em> on that network.
        <br><br>
        The netmask for a /24 network is 24 ones followed by 8 zeros: <code>11111111 11111111 11111111 00000000</code> = <code>255.255.255.0</code> = <code>0xFFFFFF00</code>.  ANDing an address with its netmask keeps the network part and zeroes out the host part.
        </div>
        <br>
        <strong>Computing the mask from the prefix length</strong>: for a prefix length <code>n</code>, the mask is <code>0xFFFFFFFF &lt;&lt; (32 - n)</code>.  For <code>n = 24</code>:
        <ol>
        <li><code>32 - n = 32 - 24 = 8</code>.</li>
        <li><code>0xFFFFFFFF &lt;&lt; 8</code> shifts all 32 ones left by 8 positions; the top 8 ones fall off the left end, and 8 zeros shift in on the right.</li>
        <li>The result is <code>0xFFFFFF00</code> = <code>11111111 11111111 11111111 00000000</code> = <code>255.255.255.0</code>.</li>
        </ol>
        <br>
        <strong>Worked Example: what network is 192.168.1.12/24 on?</strong>
        <ol>
        <li>Convert each octet to 8-bit binary: <code>192 = 11000000</code>, <code>168 = 10101000</code>, <code>1 = 00000001</code>, <code>12 = 00001100</code>.</li>
        <li>Write the /24 mask underneath and AND each column (1 AND x = x; 0 AND x = 0):</li>
        </ol>
        <pre>
        Address: 192.168.1.12    11000000 . 10101000 . 00000001 . 00001100
        Mask:    255.255.255.0   11111111 . 11111111 . 11111111 . 00000000
        AND      =========================================================
        Network: 192.168.1.0     11000000 . 10101000 . 00000001 . 00000000
        </pre>
        <ol start="3">
        <li>The network address is <code>11000000.10101000.00000001.00000000 = 192.168.1.0</code>.</li>
        <li>The host part is the last 8 bits of the original address: <code>00001100 = 12</code>.  So this is host number 12 on network 192.168.1.0.</li>
        </ol>
        <br>
        <strong>Practice Problems</strong>
        <ol>
        <li>What is the netmask for a /8 network, in dotted-quad, binary, and hex?  What is the network address of <code>10.1.2.3/8</code>?
        <details><summary>Solution</summary>
        A /8 mask is 8 ones then 24 zeros: <code>11111111 00000000 00000000 00000000</code> = <code>255.0.0.0</code> = <code>0xFF000000</code>.  ANDing keeps only the first octet: the network is <code>10.0.0.0</code>, and the host part is <code>1.2.3</code> (bits <code>00000001 00000010 00000011</code>).
        </details>
        </li>
        <li>Compute the mask for a /26 network, and find the network address of <code>172.16.5.130/26</code>.
        <details><summary>Solution</summary>
        <code>0xFFFFFFFF &lt;&lt; (32 - 26) = 0xFFFFFFFF &lt;&lt; 6 = 0xFFFFFFC0</code>: 26 ones then 6 zeros, or <code>255.255.255.192</code> (since <code>11000000 = 192</code>).  The first three octets are fully masked, so only the last octet changes: <code>130 = 10000010</code>, and <code>10000010 AND 11000000 = 10000000 = 128</code>.  The network is <code>172.16.5.128</code>, and the host part is <code>000010 = 2</code>.
        </details>
        </li>
        <li>Now a mask that does not fall on an octet boundary: find the mask for /20, and the network address of <code>192.168.37.44/20</code>.
        <details><summary>Solution</summary>
        <code>0xFFFFFFFF &lt;&lt; (32 - 20) = 0xFFFFFFFF &lt;&lt; 12 = 0xFFFFF000</code>, which is <code>11111111 11111111 11110000 00000000</code> = <code>255.255.240.0</code> (since <code>11110000 = 240</code>).  The mask splits the <em>third</em> octet: <code>37 = 00100101</code>, and <code>00100101 AND 11110000 = 00100000 = 32</code>.  The network is <code>192.168.32.0</code>.  The 12 host bits are <code>0101 00101100</code>, i.e. host number <code>5 * 256 + 44 = 1324</code>.
        </details>
        </li>
        <li>Are the hosts <code>192.168.1.77</code> and <code>192.168.2.80</code> on the same /24 network?  Are they on the same /16 network?  (Two hosts are on the same network exactly when <code>address1 AND mask == address2 AND mask</code>.)
        <details><summary>Solution</summary>
        With a /24 mask: <code>192.168.1.77 AND 255.255.255.0 = 192.168.1.0</code>, but <code>192.168.2.80 AND 255.255.255.0 = 192.168.2.0</code>.  These differ, so they are <em>not</em> on the same /24 network.  With a /16 mask (<code>255.255.0.0</code>), both AND to <code>192.168.0.0</code>, so they <em>are</em> on the same /16 network.
        </details>
        </li>
        <li>How many host bits does a /30 network have, and how many distinct addresses can it hold?
        <details><summary>Solution</summary>
        <code>32 - 30 = 2</code> host bits, giving <code>2^2 = 4</code> addresses (in practice, the all-zeros host is the network address and the all-ones host is the broadcast address, leaving 2 usable hosts).  The mask is <code>0xFFFFFFFF &lt;&lt; 2 = 0xFFFFFFFC = 255.255.255.252</code>.
        </details>
        </li>
        </ol>
        <br>
        <strong>Common Pitfalls</strong>
        <ul>
        <li><strong>Forgetting that the dots are cosmetic</strong>: an IPv4 address is one 32-bit number; convert each octet to 8 bits (padding with leading zeros, e.g. <code>1 = 00000001</code>) before masking.</li>
        <li><strong>Shifting by <code>n</code> instead of <code>32 - n</code></strong> when computing the mask from the prefix length: /24 means shift left by 8, not by 24.</li>
        <li><strong>Assuming masks always end on an octet boundary</strong>: for prefixes like /20 or /26, one octet is split, so you must convert that octet to binary to AND it correctly.</li>
        <li><strong>Confusing the network AND with the host part</strong>: the host part is what the mask zeroes out; you can extract it with <code>address &amp; ~mask</code> (AND with the inverted mask).</li>
        </ul>
      title: "Practice: Bitwise Operators and Network Addresses"
      questions:
        - "Why is AND the right operator for extracting the network address, rather than OR or XOR?"
        - "Your home router probably uses <code>192.168.0.0/16</code> addresses.  How many host bits (and therefore how many possible devices) is that?"

    - model: |
        <div align="center">
        A quick-reference recap of the key rules from this activity.  Try to reproduce each one from memory before peeking!
        </div>
        <br>
        <strong>Key Rules and Formulas</strong>
        <ul>
        <li><strong>Decimal to binary</strong>: repeatedly divide by 2 and prepend the remainder, until the quotient is 0.  Micro-example: 13 / 2 = 6 r 1; 6 / 2 = 3 r 0; 3 / 2 = 1 r 1; 1 / 2 = 0 r 1; reading the remainders backwards gives <code>1101</code>.</li>
        <li><strong>Binary to decimal</strong>: multiply each digit by its place value (1, 2, 4, 8, ... from the right) and add.  Micro-example: <code>1101 = 1*8 + 1*4 + 0*2 + 1*1 = 13</code>.</li>
        <li><strong>Binary to hexadecimal</strong>: group bits into 4s from the right and look each group up (0000=0 ... 1001=9, 1010=A ... 1111=F).  Micro-example: <code>1101 0111 = 0xD7</code>.</li>
        <li><strong>Hexadecimal to binary</strong>: expand each hex digit to exactly 4 bits.  Micro-example: <code>0x3C = 0011 1100</code>.</li>
        <li><strong>Extract bits k..j</strong>: <code>(x &gt;&gt; j) &amp; ((1 &lt;&lt; (k - j + 1)) - 1)</code>.  Micro-example: bits 3..2 of 220 = <code>(220 &gt;&gt; 2) &amp; 3 = 55 &amp; 3 = 3</code>.</li>
        <li><strong>Netmask from prefix /n</strong>: <code>0xFFFFFFFF &lt;&lt; (32 - n)</code>; network address = <code>address AND mask</code>.  Micro-example: /24 gives <code>0xFFFFFF00 = 255.255.255.0</code>, and <code>192.168.1.12 AND 255.255.255.0 = 192.168.1.0</code>.</li>
        <li><strong>n bits hold 2^n values</strong>: 8 bits hold 256 values (0..255); 10 bits hold 1024.</li>
        </ul>
        <br>
        <pre>
        Place values:   128   64   32   16    8    4    2    1
        220        =      1    1    0    1    1    1    0    0
                        128 + 64      + 16 +  8 +  4          = 220
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
          <tr><td class="tg-0lax">Bit</td><td class="tg-0lax">A single binary digit, 0 or 1</td></tr>
          <tr><td class="tg-0lax">Nibble</td><td class="tg-0lax">4 bits; exactly one hexadecimal digit</td></tr>
          <tr><td class="tg-0lax">Byte (octet)</td><td class="tg-0lax">8 bits; holds values 0..255</td></tr>
          <tr><td class="tg-0lax">Base (radix)</td><td class="tg-0lax">The number of distinct digits in a number system (2 for binary, 10 for decimal, 16 for hex)</td></tr>
          <tr><td class="tg-0lax">Place value</td><td class="tg-0lax">The weight of a digit position: base^position, counting from 0 at the right</td></tr>
          <tr><td class="tg-0lax">Most significant bit (MSB)</td><td class="tg-0lax">The leftmost (highest place value) bit</td></tr>
          <tr><td class="tg-0lax">Least significant bit (LSB)</td><td class="tg-0lax">The rightmost (ones place) bit</td></tr>
          <tr><td class="tg-0lax">Bitmask</td><td class="tg-0lax">A value ANDed with another to keep only certain bits</td></tr>
          <tr><td class="tg-0lax">CIDR prefix (/n)</td><td class="tg-0lax">The number of leading 1 bits in a netmask; the first n bits of an IPv4 address name the network</td></tr>
          <tr><td class="tg-0lax">Netmask</td><td class="tg-0lax">The 32-bit mask of n ones then (32-n) zeros used to separate network bits from host bits</td></tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
      questions:
        - "Without looking, convert 45 to binary and to hexadecimal, then check yourself using the recap rules."


tags:
  - numbers

---
