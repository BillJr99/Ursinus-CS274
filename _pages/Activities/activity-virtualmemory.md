---
layout: activity
permalink: /Activities/VirtualMemory
title: "CS274: Computer Architecture - Virtual Memory"


info:
  next: ./VirtualMemory2
  
  goals: 
    - To explain why memory is segmented into a stack and heap
    - To reason about the benefits of growing the stack and heap in opposite directions
    - To motivate the need for virtual memory, and specifically, for logical addressing
    - To design a logical address space that facilitates cooperative multitasking
  models:
    - model: |
        <img src="../images/activity-virtualmemory/mips-address-space.png" alt="The MIPS address space includes a stack that begins at the top of the address space and grows downward, while the heap is in the lower region of the address space and grows upward.">
      title: "Warmup - MIPS Addresses"
      questions:
        - "Which region contains the translated machine code for your program?"
        - "Which address above is the starting address for a MIPS program?"

    - model: |
        <div align="center">
        A quick-reference recap of the key ideas from this activity (and a preview of where the virtual memory series is headed).  Try to reproduce each one from memory before peeking!
        </div>
        <br>
        <strong>Key Rules and Formulas</strong>
        <ul>
        <li><strong>Memory segments</strong>: a program's address space contains its machine code (the text segment, where a MIPS program starts at 0x00400000), global/static data, the heap (dynamic allocations), and the stack (function frames).</li>
        <li><strong>Stack and heap grow toward each other</strong>: the stack starts at the top of the address space and grows downward; the heap sits above the data segment and grows upward.  This lets each use as much of the free middle region as it needs, without deciding a fixed boundary in advance.</li>
        <li><strong>Logical (virtual) addressing</strong>: every program is compiled as if it owns the whole address space; the hardware translates each virtual address to a physical one, so multiple programs can coexist safely without knowing where they really live in RAM.</li>
        <li><strong>Page number / offset split</strong>: a virtual address divides into a virtual page number and a page offset, with offset bits = <code>log2(page size)</code>.  Micro-example with 4 KB pages: (1) <code>log2(4096) = 12</code> offset bits; (2) for the 32-bit address <code>0x00003ABC</code>, the offset is the low 12 bits, <code>0xABC</code>, and the virtual page number is <code>0x00003ABC &gt;&gt; 12 = 0x3</code>.</li>
        <li><strong>Translation</strong>: the page table maps virtual page number to physical frame number; physical address = <code>frame number * page size + offset</code>.  Micro-example: if virtual page 3 maps to frame 7, then (1) <code>7 * 4096 = 28672 = 0x7000</code>; (2) <code>0x7000 + 0xABC = 0x7ABC</code>.  The offset is never translated - only the page number changes.</li>
        <li><strong>TLB</strong>: the Translation Lookaside Buffer is a small cache of recent page-number-to-frame translations, so most translations do not require an extra memory access to walk the page table.</li>
        </ul>
        <br>
        <pre>
        High addresses  +==================+  <-- stack starts here,
                        |      stack       |      grows DOWN
                        |        |         |
                        |        v         |
                        |   (free space)   |
                        |        ^         |
                        |        |         |
                        |      heap        |      grows UP
                        +==================+
                        |   static data    |
                        +==================+
                        |  text (code)     |  <-- program starts here
        Low addresses   +==================+

        Virtual address (4 KB pages):
        | virtual page number (bits 31..12) | offset (bits 11..0) |
                     translated                   copied as-is
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
          <tr><td class="tg-0lax">Text segment</td><td class="tg-0lax">The region holding the program's machine code</td></tr>
          <tr><td class="tg-0lax">Stack</td><td class="tg-0lax">Function-call frames (locals, return addresses); grows downward from high addresses</td></tr>
          <tr><td class="tg-0lax">Heap</td><td class="tg-0lax">Dynamically allocated memory; grows upward toward the stack</td></tr>
          <tr><td class="tg-0lax">Virtual (logical) address</td><td class="tg-0lax">The address a program uses, translated by hardware before reaching RAM</td></tr>
          <tr><td class="tg-0lax">Physical address</td><td class="tg-0lax">The actual location in RAM after translation</td></tr>
          <tr><td class="tg-0lax">Page / Frame</td><td class="tg-0lax">A fixed-size chunk of virtual memory / the physical slot that holds one page</td></tr>
          <tr><td class="tg-0lax">Page offset</td><td class="tg-0lax">The low <code>log2(page size)</code> address bits, identical in virtual and physical addresses</td></tr>
          <tr><td class="tg-0lax">Page table</td><td class="tg-0lax">The per-process map from virtual page numbers to physical frame numbers</td></tr>
          <tr><td class="tg-0lax">TLB</td><td class="tg-0lax">A small cache of recent translations that makes virtual memory fast</td></tr>
          <tr><td class="tg-0lax">Multitasking</td><td class="tg-0lax">Running several programs at once, each with its own address space</td></tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
      questions:
        - "Without looking, split the virtual address 0x00005F10 into its page number and offset assuming 4 KB pages, and explain which half the TLB helps translate."

tags:
  - virtualmemory
  
---

<!-- https://www.mentimeter.com/s/281bcef1bfc35d3433a2b128219e7305/6cb58194111a/edit -->
