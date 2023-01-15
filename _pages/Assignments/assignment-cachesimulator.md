---
layout: assignment
permalink: /Assignments/CacheSimulator
title: "CS274: Computer Architecture - Cache Simulator"
excerpt: "CS274: Computer Architecture - Cache Simulator"

info:
  coursenum: CS274
  points: 100
  goals:
    - To simulate the effects of a computer cache
    
  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The algorithm fails on the test inputs due to major issues, or the program fails to compile and/or run
      beginning: The algorithm fails on the test inputs due to one or more minor issues
      progressing: The algorithm is implemented to solve the problem correctly according to given test inputs, but would fail if executed in a general case due to a minor issue or omission in the algorithm design or implementation, including a Makefile
      proficient: A reasonable algorithm is implemented to solve the problem which correctly solves the problem according to the given test inputs, and would be reasonably expected to solve the problem in the general case
    - weight: 30
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, or code structure departs significantly from best practice, and/or the code departs significantly from the style guide
      beginning: Code commenting and structure is limited in ways that reduce the readability of the program, and/or there are minor departures from the style guide
      progressing: Code documentation is present that re-states the explicit code definitions, and/or code is written that mostly adheres to the style guide
      proficient: Code is documented at non-trivial points in a manner that enhances the readability of the program, and code is written according to the style guide
    - weight: 10
      description: Writeup and Submission
      preemerging: An incomplete submission is provided
      beginning: The program is submitted, but not according to the directions in one or more ways (for example, because it is lacking a readme writeup)
      progressing: The program is submitted according to the directions with a minor omission or correction needed, and with at least superficial responses to the bolded questions throughout
      proficient: The program is submitted according to the directions, including a readme writeup describing the solution, and thoughtful answers to the bolded or textbook questions throughout

  readings:
    - rlink: ../Activities/Cache
      rtitle: Cache Activity

  questions:
    - Patterson and Hennessy Textbook Question 5.1
    - Patterson and Hennessy Textbook Question 5.2
    - Patterson and Hennessy Textbook Question 5.5
    - Patterson and Hennessy Textbook Question 5.6
    - Patterson and Hennessy Textbook Question 5.10
    - Patterson and Hennessy Textbook Question 5.11

tags:
  - cache

---

### What to Do

Read a text file of the following format:

```
read 8
read 2012
write 564
```

Each line of text simulates a memory access to a given address.  Write a program that simulates L1 cache, L2 cache, and main memory.

On a read, you should start at L1 cache and identify the address stored at a particular index given its tag.  If it is a hit, return the value.  If it is a miss, move on to the next level of cache, and then to main memory.

If you hit at L2 or retrieve from main memory, copy the value to the appropriate location in L2 and L1 cache.  Use a least-recently-used strategy to replace cache blocks.

You will use a write-back strategy such that, on cache replacement, you should write the value to the next lowest level of memory (for example, L2 from L1, or main memory from L2), if **and only if** the value has been written to (also know as being "dirty").

Allow the user to configure your cache using user inputs for the overall size, set associativity, and number of words per block.  