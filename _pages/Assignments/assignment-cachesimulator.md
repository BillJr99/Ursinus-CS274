---
layout: assignment
permalink: /Assignments/CacheSimulator
title: "CS274: Computer Architecture - Cache Simulator"


info:
  coursenum: CS274
  points: 100
  goals:
    - To simulate the effects of a computer cache
    
  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The program does not compile or run via the Makefile, cannot parse the read/write trace file format, or does not model at least an L1 cache with tag and index lookup
      beginning: The program reads the trace file and simulates an L1/L2/main-memory hierarchy, but hits and misses are misclassified on the test traces due to a minor issue (for example, tag and index bits split incorrectly, or the block offset not accounted for)
      progressing: Reads correctly probe L1, then L2, then main memory, and hits and misses are classified correctly for the tested traces, but a general case fails -- for example, LRU replacement does not update on every access, fills on a miss are not copied into both L2 and L1, write-back on eviction happens even when the block is not dirty (or dirty blocks are silently dropped), or one of the size/associativity/words-per-block user configurations is ignored
      proficient: The simulator reads the trace file, probes L1 then L2 then main memory on each access, copies missed blocks into both cache levels, evicts using true LRU, writes back an evicted block to the next lower level if and only if its dirty bit is set, and behaves correctly for user-supplied combinations of overall size, set associativity, and words per block; a Makefile compiles and runs it
    - weight: 20
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, the cache logic is a single monolithic block, and/or the code departs significantly from the style guide
      beginning: Comments are sparse or restate the code (for example, "loop over the sets"), and/or there are minor departures from the style guide that reduce readability
      progressing: The lookup, replacement, and write-back logic are organized into functions with comments describing what each does, and the code mostly adheres to the style guide, but the comments restate definitions rather than explaining the tag/index/offset and LRU reasoning
      proficient: The address decomposition (tag, index, block offset), LRU bookkeeping, and dirty-bit/write-back logic are each documented in terms of the cache concepts they implement, cache levels are represented by a common structure or class rather than duplicated code, and the code follows the style guide
    - weight: 20
      description: Writeup, Textbook Questions, and Submission
      preemerging: An incomplete submission is provided; the readme and the answers to the assigned Chapter 5 textbook questions are missing
      beginning: The program is submitted, but the readme is missing the solution description or answers to one or more of the assigned questions (5.1, 5.2, 5.5, 5.6.2-5.6.3, 5.10.1/5.10.2/5.10.4, and 5.11)
      progressing: The readme describes the solution and answers every assigned question, but one or more answers are superficial or give a result without showing the address breakdowns, hit/miss classifications, or arithmetic used to reach it
      proficient: The readme describes the solution (including how the cache is configured and an example run), and each assigned question is answered correctly with work shown -- address bit breakdowns, hit/miss labeling per reference, and the miss-rate or timing arithmetic -- for 5.1, 5.2, 5.5, 5.6.2-5.6.3, 5.10.1/5.10.2/5.10.4, and 5.11

  readings:
    - rlink: ../Activities/Cache
      rtitle: Cache Activity
    - rlink: https://makefiletutorial.com/
      rtitle: Makefile Tutorial by Example
    - rlink: https://www.gnu.org/software/make/manual/html_node/Introduction.html
      rtitle: "GNU Make Manual: Introduction"
    - rlink: https://www.gnu.org/software/libc/manual/html_node/Consistency-Checking.html
      rtitle: "Unit Testing in C with <code>assert.h</code>"
    - rlink: https://docs.python.org/3/library/unittest.html
      rtitle: "<code>unittest</code>: Unit Testing Framework in Python (if you choose Python)"

  questions:
    - Patterson and Hennessy Textbook Question 5.1
    - Patterson and Hennessy Textbook Question 5.2
    - Patterson and Hennessy Textbook Question 5.5
    - Patterson and Hennessy Textbook Question 5.6.2 through 5.6.3
    - Patterson and Hennessy Textbook Question 5.10.1, 5.10.2, and 5.10.4
    - Patterson and Hennessy Textbook Question 5.11

tags:
  - cache

---

### Purpose

This assignment turns the cache concepts from our activities -- tag/index/offset address decomposition, set associativity, LRU replacement, and write-back with dirty bits -- into a working simulator you can experiment with.  Building the memory hierarchy yourself makes visible why cache configuration changes hit rates, which is the central performance story of the memory system unit.

### Task

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

### Testing Your Work

Write small unit tests for the pieces you can check by hand: a function that splits an address into tag, index, and offset for a given configuration is easy to assert against worked examples from the Cache Activity, as is your LRU update logic on a short access sequence.  Automate your build and test runs with a Makefile (see the readings above) -- a `make test` target that runs your simulator against a small trace with a known hit/miss sequence will save you a great deal of debugging time.

### Written Questions: Points and Hints

The Writeup, Textbook Questions, and Submission criterion is worth 20 points, allocated as follows:

| Item | Points | A complete answer shows... |
| ---- | ------ | -------------------------- |
| Readme writeup | 5 | A description of your simulator's design, how to build and run it via the Makefile, and an example run with its cache configuration |
| Textbook Question 5.1 | 2.5 | Each part answered in terms of the locality concepts the code exhibits, with the relevant references identified |
| Textbook Question 5.2 | 2.5 | The address broken into tag, index, and offset bits for the given cache, with each reference labeled hit or miss and the work shown |
| Textbook Question 5.5 | 2.5 | The cache geometry computations (bits per field, total bits, block placement) with the arithmetic shown |
| Textbook Questions 5.6.2-5.6.3 | 2.5 | The requested cache behavior worked reference-by-reference, showing the resulting cache contents |
| Textbook Questions 5.10.1, 5.10.2, and 5.10.4 | 2.5 | The miss-rate/performance arithmetic written out, with units, for each subpart |
| Textbook Question 5.11 | 2.5 | The set-associative analysis with each reference's set assignment, hit/miss labeling, and replacement decisions shown |

**Hints**

* **5.1:** Classify each memory reference in the given code by whether repeated accesses are to the same location (temporal locality) or to neighboring locations (spatial locality); loop indices and sequential array accesses are your signposts.
* **5.2:** First compute how many bits form the offset and index from the block size and number of sets, then split each address; a table with one row per reference (tag / index / hit or miss) is the clearest presentation and mirrors exactly what your simulator does.
* **5.5:** Work from the cache parameters to the bit widths of each field, then total the storage including tags and valid (and dirty) bits -- the same bookkeeping your simulator's data structures must hold.
* **5.6.2-5.6.3:** Simulate the reference stream by hand, drawing the cache contents after each access; keep track of which block occupies each index and when it is evicted.  You can check your hand simulation against your program.
* **5.10.1, 5.10.2, 5.10.4:** These are arithmetic questions: express each answer in terms of miss rate, miss penalty, and hit time, and carry the units (cycles, ns) through each step so the final expression is dimensionally consistent.
* **5.11:** Redo the reference stream under the given associativity: compute each address's set, apply LRU within the set, and record hits, misses, and evictions -- another sequence your own simulator can confirm.
