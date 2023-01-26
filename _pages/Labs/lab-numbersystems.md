---
layout: assignment
permalink: /Labs/NumberSystems
title: "CS274: Computer Architecture - Number Systems"
excerpt: "CS274: Computer Architecture - Number Systems"

info:
  coursenum: CS274
  points: 100
  goals:
    - To convert between decimal, hexadecimal, and binary number representations

  rubric:
    - weight: 90
      description: Correctness
      preemerging: 5 or fewer values were converted correctly
      beginning: 6 to 10 values were converted correctly
      progressing: 11 to 13 values were converted correctly
      proficient: 13 or more values were converted correctly
    - weight: 10
      description: Writeup and Submission
      preemerging: An incomplete submission is provided
      beginning: The program is submitted, but not according to the directions in one or more ways (for example, because it is lacking a readme writeup)
      progressing: The program is submitted according to the directions with a minor omission or correction needed, and with at least superficial responses to the bolded questions throughout
      proficient: The program is submitted according to the directions, including a readme writeup describing the solution, and thoughtful answers to the bolded questions throughout

  readings:
    - rlink: ../Activities/NumberSystems
      rtitle: Number Systems Activity

  questions:
    - "In your own words, describe the approach you took to converting between each of the pairs of number systems.  Imagine that you were to do this programmatically; how would you do it?"

tags:
  - numbers

---

Using the tool below, generate 5 decimal, 5 binary, and 5 hexadecimal values, and convert them.  In your browser, open your developer tools console and copy the log output into your class notebook.

<script language="JavaScript">
function gen2() {
    var val = Math.floor(Math.random() * 2048) + 1
    
    document.getElementById("decimal").value = "";
    document.getElementById("binary").value = val.toString(2);
    document.getElementById("hexadecimal").value = "";
}

function gen10() {
    var val = Math.floor(Math.random() * 2048) + 1
    
    document.getElementById("decimal").value = val.toString();
    document.getElementById("binary").value = "";
    document.getElementById("hexadecimal").value = "";
}

function gen16() {
    var val = Math.floor(Math.random() * 2048) + 1
    
    document.getElementById("decimal").value = "";
    document.getElementById("binary").value = "";
    document.getElementById("hexadecimal").value = val.toString(16);
}

function check() {
    var bin = document.getElementById("binary").value;
    bin = parseInt(bin, 2);
    var hex = document.getElementById("hexadecimal").value;
    hex = parseInt(hex, 16);
    var dec = document.getElementById("decimal").value;
    dec = parseInt(dec, 10);
    
    console.log("Decimal: " + document.getElementById("decimal").value + " Binary: " + document.getElementById("binary").value + " Hexadecimal: " + document.getElementById("hexadecimal").value);
    console.log("Decimal: " + dec.toString() + " Binary: " + bin.toString() + " Hexadecimal: " + hex.toString());
    
    if(hex == bin && dec == bin) {
        alert("Correct!");
        console.log("Correct");
    } else {
        alert("Not quite!");
        console.log("Incorrect");
    }
  
    document.getElementById("responses").innerHTML += "Decimal: " + document.getElementById("decimal").value + " Binary: " + document.getElementById("binary").value + " Hexadecimal: " + document.getElementById("hexadecimal").value + "<br>";
    document.getElementById("responses").innerHTML += "Decimal: " + dec.toString() + " Binary: " + bin.toString() + " Hexadecimal: " + hex.toString() + "<br>";
    
    if(hex == bin && dec == bin) {
        document.getElementById("responses").innerHTML += "Correct<br>";
    } else {
        document.getElementById("responses").innerHTML += "Incorrect<br>";
    }  
}
</script>

<div align="center">
<div align="left">
Decimal Value: <input id="decimal" name="decimal" /><br>
Binary Value: <input id="binary" name="binary" /><br>
Hexadecimal Value: <input id="hexadecimal" name="hexadecimal" /><br>
<br>
<button id="bgen10" onclick="gen10()">Generate Decimal</button><br>
<button id="bgen2" onclick="gen2()">Generate Binary</button><br>
<button id="bgen16" onclick="gen16()">Generate Hexadecimal</button><br>
<br>
<button id="bcheck" onclick="check()">Check</button>
<br>
<br>
<h3>Output Log</h3>
<textarea rows="5" cols="50" id="multiLineInput"></textarea>
</div>
</div>
