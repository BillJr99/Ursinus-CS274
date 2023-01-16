---
layout: activity
permalink: /Activities/VirtualMemory
title: "Virtual Memory"
excerpt: "Virtual Memory"

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
    
tags:
  - virtualmemory
  
---

<!-- https://www.mentimeter.com/s/281bcef1bfc35d3433a2b128219e7305/6cb58194111a/edit -->