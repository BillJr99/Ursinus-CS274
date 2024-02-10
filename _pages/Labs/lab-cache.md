---
layout: assignment
permalink: /Labs/Cache
title: "CS274: Computer Architecture - Cache"


info:
  coursenum: CS274
  points: 100
  goals:
    - To design and manipulate a memory cache

  readings:
    - rlink: ../Activities/Cache
      rtitle: Cache Activity

tags:
  - cache

---

<div align="center">
<img src="https://i.stack.imgur.com/bRqNc.png" alt="Direct Mapped Cache">
</div>

### What to Do

Sketch the following cache designs:

1. A 64 kilobyte direct mapped cache from the DEC Station 3100, which uses one word per block and a write-through policy.
2. A 1 MB 4-way set associative cache with 8 words per block.
3. A 4 MB 8-way set associative cache with 32 words per block.

For each of these caches, map the following addresses.  Indicate whether it is a hit or a miss, which (if any) block is replaced, and what words are moved into that block.

317, 67, 25, 8, 64, 256, 512, 78