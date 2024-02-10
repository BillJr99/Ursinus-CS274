---
layout: activity
permalink: /Activities/VirtualMemory2
title: "CS274: Computer Architecture - Virtual Memory"


info:
  prev: ./VirtualMemory
  next: ./VirtualMemory3

  goals: 
    - To explain why memory is segmented into a stack and heap
    - To reason about the benefits of growing the stack and heap in opposite directions
    - To motivate the need for virtual memory, and specifically, for logical addressing
    - To design a logical address space that facilitates cooperative multitasking
  models:   
    - model: |
        <img src="https://www.vinylrecordlife.com/wp-content/uploads/2020/07/VINYL-RECORD-LIFE-TRACK-LISTING-1024x683.jpg?ezimgfmt=ng:webp/ngcb2" alt="Record showing tracks from vinylrecordlife.com"> 
      title: "Virtual Memory - Separating Programs with a Logical Address Space"
      questions:
        - "How might you describe to someone where to put the needle on the record to play the beginning of Track (program!) 1?"
        - "How about the beginning of Track 2?"
        - "What do you need to keep track of to know where the beginning of each song is located?"
        - "Where would you position the needle on the record to play Track 3 starting from the 1 minute mark?"
        - "Suppose you couldn't see the grooves for the start of each track on the record, but you knew that each song was exactly 5 minutes long.  How could this help you to place the needle to play the third song from the beginning?"
        - "How might we apply this idea to the memory layout of our programs so that we can compile them with a consistent layout, but also load multiple programs at the same time?"
    
tags:
  - virtualmemory
  
---

