---
layout: activity
permalink: /Activities/VirtualMemory4
title: "CS274: Computer Architecture - Virtual Memory"
excerpt: "CS274: Computer Architecture - Virtual Memory"

info:
  prev: ./VirtualMemory3
  next: ./VirtualMemory5

  goals: 
    - To explain why memory is segmented into a stack and heap
    - To reason about the benefits of growing the stack and heap in opposite directions
    - To motivate the need for virtual memory, and specifically, for logical addressing
    - To design a logical address space that facilitates cooperative multitasking
  models:
    - model: |
        <a href="../images/activity-virtualmemory/CompileExample1.mp4"><img src="../images/activity-virtualmemory/CompileExample1-still.png" alt="An example C program that allocates two integers, adds them together, and stores their sum in an uninitialized global variable"></a>
      title: "Mapping a C Program to Memory"
      questions:
        - "Uninitialized global variables get linked together at a common memory address across all the code modules in your program.  So, if you have two globals with the same name, they end up pointing to the same memory address.  Why can't we immediately place an uninitialized global variable on the stack or data section of a module as soon as we see it, and where might we place it instead?"
        - "To what sections does each highlighted portion of code compile in a C program?"
        - "How much memory should we allocate to the stack and how much to the heap?  In other words, how should we divide up our available memory among these regions?"
        - "What is the address of the two <code>malloc</code>'ed values?  How about the integer variables <code>a</code> and <code>b</code>?"
        - "Suppose this program was loaded at physical location 0x00000100.  What would be the actual physical addresses of the two <code>malloc</code>'ed values?  What mathematical operator would we need to apply to the logical address of each <code>malloc</code>'ed space?  Hint - the warmup question will show you the starting address of each region of a program!"
        - "When you access a and b, what accesses take place to get to the heap?"
    
tags:
  - virtualmemory
  
---

<!-- https://www.mentimeter.com/s/281bcef1bfc35d3433a2b128219e7305/6cb58194111a/edit -->
