---
layout: activity
permalink: /Activities/NumberSystems
title: "CS274: Computer Architecture - Number Systems"
excerpt: "CS274: Computer Architecture - Number Systems"

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
                    result = result + Math.pow(2, i);
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
        <a title="Dgoetze, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Positionalnotationtable.jpg"><img width="512" alt="Positionalnotationtable" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Positionalnotationtable.jpg/512px-Positionalnotationtable.jpg"></a>
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


tags:
  - numbers

---
