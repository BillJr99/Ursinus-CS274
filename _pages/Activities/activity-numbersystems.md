---
layout: activity
permalink: /Activities/NumberSystems
title: "CS274: Computer Architecture - Number Systems"
excerpt: "CS274: Computer Architecture - Number Systems"

info:
  goals:
    - xxx

  models:
    - model: |
        xxx
      title: xxx
      questions:
        - xxx

  additional_reading:
    - link: xxx
      title: xxx

  additional_practice:
    - link: xxx
      title: xxx

tags:
  - xxx

---

<script language="JavaScript">
function gen2() {
    var val = Math.floor(Math.random() * 2048) + 1
    
    document.getElementById("decimal").value = "";
    document.getElementById("binary").value = val.toString(2);
    document.getElementById("hexidecimal").value = "";
}

function gen10() {
    var val = Math.floor(Math.random() * 2048) + 1
    
    document.getElementById("decimal").value = val.toString();
    document.getElementById("binary").value = "";
    document.getElementById("hexidecimal").value = "";
}

function gen16() {
    var val = Math.floor(Math.random() * 2048) + 1
    
    document.getElementById("decimal").value = "";
    document.getElementById("binary").value = "";
    document.getElementById("hexidecimal").value = val.toString(16);
}

function check() {
    var bin = document.getElementById("binary").value;
    bin = parseInt(bin, 2);
    var hex = document.getElementById("hexidecimal").value;
    hex = parseInt(hex, 16);
    var dec = document.getElementById("decimal").value;
    dec = parseInt(dec, 10);
    
    console.log(dec.toString() + " " + bin.toString() + " " + hex.toString());
    
    if(hex == bin && dec == bin) {
        alert("Correct!");
    } else {
        alert("Not quite!");
    }
}
</script>

Decimal Value: <input id="decimal" name="decimal" />
Binary Value: <input id="binary" name="binary" />
Hexidecimal Value: <input id="binary" name="binary" />

<button id="gen10" onclick=get10()>Generate Decimal</button>
<button id="gen2" onclick=gen2()>Generate Binary</button>
<button id="gen16" onclick=gen16()>Generate Hexidecimal</button>

<button id="check" onclick=check()>Check</button>