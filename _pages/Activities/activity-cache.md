---
layout: activity
permalink: /Activities/Cache
title: "CS274: Computer Architecture - The Memory Hierarchy: Cache Design"


info:
  goals:
    - To design a memory architecture that does not starve the CPU despite the memory hierarchy
    - To exploit cache design using the principles of locality

  models:
    - model: |
        <div align="center">
        <script type="syntaxhighlighter" class="brush: c"><![CDATA[        
            int arr[N][M]; // assume this is initialized with dimensions N rows by M cols
            sum = 0;
            for(int i = 0; i < N; i++) {
                for(int j = 0; j < M; j++) {
                    sum += arr[i][j];
                }
            }
        ]]></script>
        </div>    
      title: The Principle of Locality
      questions:
        - "There are two principles of locality: Temporal Locality (referring to a variable or instruction repeatedly in a short period of time) and Spatial Locality (referring to nearby memory addresses following a particular access).  Identify all the examples of each in the code example above."
        - "What would happen to our locality if we switched the two for loop lines?  This is called switching from a row-major order to a column-major order."
        - "What would happen to our locality if <code>N</code> and <code>M</code> became very large?"
        
    - model: |
        <img src="https://i.stack.imgur.com/J5Jv5.jpg" alt="The Memory Mountain from CS:APP by Bryant and O'Hallaron">
      title: The Memory Hierarchy
      questions:
        - "What do you think processor registers are made of?  Why might computer memory and disk be made of a different material?"
        - "Since cache (and, for that matter, processor registers) is so much smaller than primary memory, how can we make efficient use of the space given the principle of locality?  For example, should we randomly store data in cache, or take a more strategic approach?"
        - "What do you think stride refers to?"

    - model: |
        <img src="https://i.stack.imgur.com/uNH44.gif" alt="A Direct Mapped Single Word Block Cache">
        <br>
        <img src="https://harttle.land/assets/img/blog/direct-mapped-cache.png" alt="Direct Mapped Cache Design with Address Bits">
      title: Exploiting Temporal Locality with the Direct Mapped Cache
      questions:
        - "Which address bits are used to determine which block a word maps to?"
        - "Given a cache with 1024 entries, how many bits would determine the block number (a.k.a. row, or index)?"
        - "What is the purpose of the tag bits?  Why is it necessary to store them?"
        - "Why do you think the last two bits of the address are ignored?"

    - model: |
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
          <tr>
            <th class="tg-1wig">Index</th>
            <th class="tg-1wig">Valid</th>
            <th class="tg-1wig">Tag</th>
            <th class="tg-1wig">Data</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="tg-0lax">000</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">001</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">010</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">011</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">100</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">101</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">110</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">111</td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax" colspan="4"></td>
          </tr>
          <tr>
            <td class="tg-1wig">Address</td>
            <td class="tg-1wig">Binary</td>
            <td class="tg-1wig">Cache Block</td>
            <td class="tg-1wig">Hit/Miss?</td>
          </tr>
          <tr>
            <td class="tg-0lax">22</td>
            <td class="tg-0lax">10110</td>
            <td class="tg-0lax">110</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">26</td>
            <td class="tg-0lax">11010</td>
            <td class="tg-0lax">010</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">22</td>
            <td class="tg-0lax">10110</td>
            <td class="tg-0lax">110</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">26</td>
            <td class="tg-0lax">11010</td>
            <td class="tg-0lax">010</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">16</td>
            <td class="tg-0lax">10000</td>
            <td class="tg-0lax">000</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">3</td>
            <td class="tg-0lax">00011</td>
            <td class="tg-0lax">011</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">16</td>
            <td class="tg-0lax">10000</td>
            <td class="tg-0lax">000</td>
            <td class="tg-0lax"></td>
          </tr>
          <tr>
            <td class="tg-0lax">18</td>
            <td class="tg-0lax">10010</td>
            <td class="tg-0lax">010</td>
            <td class="tg-0lax"></td>
          </tr>
        </tbody>
        </table>
      title: Direct Mapped Cache Example
      questions:
        - "Fill in the table above, assuming an 8-word direct mapped cache."
        - "How many hits and misses were there?"
        - "Why were these cache replacements particularly unfortunate?"
        - "How could we increase the duration of temporal locality in this cache?  That is, what could we do to enable these words to remain in cache longer?"

    - model: |
        <a title="ComputerMemoryHierarchy.png: User:Danlash at en.wikipedia.org, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:ComputerMemoryHierarchy.svg"><img width="512" alt="ComputerMemoryHierarchy" src="https://commons.wikimedia.org/w/index.php?title=Special:Redirect/file/ComputerMemoryHierarchy.svg"></a>
      title: Write Policies to Avoid Stale Data
      questions:
        - "What is the benefit and drawback of writing data to both cache and to main memory (and every layer in between) whenever a write occurs?  This is known as a &quot;write-through&quot; strategy."
        - "What would need to change if a write-back strategy was used instead, in which data was only written to the top layer of cache.  What would we need to do to ensure this data is not lost, and when would we need to copy it to the next lower layer?"

    - model: |
        <img src="http://gavinchou.github.io/images/memory-ordering/cpu_cache_line_data_layout.jpg" alt="Multi-word cache">
      title: Adding Spatial Locality Multiword Blocks
      questions:
        - "What is different about this design?"
        - "How does this approach enable spatial locality?"
        - "To what block and index does address 67 map?"
        - "What other words would be loaded into this block?"

    - model: |
        <img src="https://harttle.land/assets/img/blog/set-associative.png" alt="A set associative cache">
      title: Mitigating Cache Conflicts with Associative Caches
      questions:
        - "Draw a 1 MB cache that is 4-way set associative, with 8 words per block."
        - "Map address 37 to this cache, and indicate which other addresses would be loaded."
        - "Show the tag and index for address 37."
        - "Does a fully associative cache need a block offset, an index, and/or a tag?  Why or why not?"

    - model: |
        <div align="center">
        Draw a direct mapped, two-way set associative, and fully associative cache with 4 words total.
        </div>
      title: Cache Replacement Strategies
      questions:
        - "Map these addresses and count the number of hits and misses: 0, 8, 0, 6, 8."
        - "How does your hit rate change for 8 or 16 word caches?"
        - "When you must replace a block, how can you decide which set to replace?  What is your rationale for doing so?"
        
    - model: |
        <div align="center">
        Suppose you have a base CPI of 1 (assuming L1 cache hits) and a 5 GHz CPU clock (0.2 ns per CPU cycle), 100 ns main memory access time, a 2% miss rate at L1, a 0.5% miss rate at L2.
        </div>
      title: "Reducing the Miss Penalty with Multi-Level Caches"
      questions:
        - "What is your CPI with and without your secondary cache?"

    - model: |
        <div align="center">
        A quick-reference recap of the key rules from this activity.  Try to reproduce each one from memory before peeking!
        </div>
        <br>
        <strong>Key Rules and Formulas</strong>
        <ul>
        <li><strong>Address bit-splitting</strong>: offset bits = <code>log2(block size)</code>; index bits = <code>log2(number of sets)</code>; tag bits = the rest of the address.  For byte addresses with word-sized data, the lowest <code>log2(4) = 2</code> bits are the byte-within-word offset.</li>
        <li><strong>Number of sets</strong>: <code>sets = cache size / (block size * associativity)</code>.  A direct mapped cache has associativity 1 (sets = number of blocks); a fully associative cache has one set (0 index bits - only tag and offset).</li>
        <li><strong>Micro-example (direct mapped)</strong>: 1024 one-word blocks, 32-bit byte address: (1) offset = 2 bits (bytes in a word); (2) index = <code>log2(1024) = 10</code> bits; (3) tag = <code>32 - 10 - 2 = 20</code> bits.</li>
        <li><strong>Micro-example (set associative)</strong>: 4-way, 8-word (32-byte) blocks, 1 MB total: (1) block offset = <code>log2(32) = 5</code> bits; (2) sets = <code>2^20 / (32 * 4) = 8192</code>, so index = 13 bits; (3) tag = <code>32 - 13 - 5 = 14</code> bits.</li>
        <li><strong>Which block?</strong> block address = <code>address / block size</code>; set number = <code>block address mod number of sets</code>.  Micro-example: address 22 = <code>10110</code>, 8 one-word blocks: index = low 3 block bits = <code>110</code>, tag = <code>10</code>.</li>
        <li><strong>AMAT</strong> (average memory access time) <code>= hit time + miss rate * miss penalty</code>.  Micro-example: 0.2 ns hit, 2% miss rate, 100 ns penalty: (1) <code>0.02 * 100 = 2 ns</code>; (2) <code>AMAT = 0.2 + 2 = 2.2 ns</code>.  A second-level cache replaces most of that 100 ns penalty with a much shorter L2 hit time.</li>
        <li><strong>Locality</strong>: temporal (reuse the same address soon) is exploited by keeping recently used blocks; spatial (use neighboring addresses) is exploited by multiword blocks that load neighbors in with each miss.</li>
        <li><strong>Write policies</strong>: write-through updates cache and memory on every write (simple, but slow writes); write-back writes only the cache, marks the block dirty, and copies it down when the block is evicted (fast writes, must track dirty blocks).</li>
        </ul>
        <br>
        <pre>
        32-bit address, direct mapped, 1024 one-word blocks:

        |        tag (20 bits)        | index (10) | byte offset (2) |
         31 ........................ 12 11 ...... 2  1 ............ 0

        tag    --> compared against the tag stored in the indexed row
        index  --> selects the cache row (set)
        offset --> selects the byte/word within the block
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
          <tr><td class="tg-0lax">Hit / Miss</td><td class="tg-0lax">The requested word is / is not present in the cache</td></tr>
          <tr><td class="tg-0lax">Block (line)</td><td class="tg-0lax">The unit of transfer between cache and memory (one or more words)</td></tr>
          <tr><td class="tg-0lax">Index</td><td class="tg-0lax">Address bits selecting which set (row) a block maps to</td></tr>
          <tr><td class="tg-0lax">Tag</td><td class="tg-0lax">The remaining upper address bits, stored to verify which block occupies a row</td></tr>
          <tr><td class="tg-0lax">Valid bit</td><td class="tg-0lax">Marks whether a row actually holds data yet</td></tr>
          <tr><td class="tg-0lax">Associativity</td><td class="tg-0lax">How many places (ways) a block may live within its set</td></tr>
          <tr><td class="tg-0lax">Miss penalty</td><td class="tg-0lax">Extra time to fetch a block from the next lower level on a miss</td></tr>
          <tr><td class="tg-0lax">LRU replacement</td><td class="tg-0lax">Evicting the least recently used block in a set, betting on temporal locality</td></tr>
          <tr><td class="tg-0lax">Write-through / write-back</td><td class="tg-0lax">Writing to memory on every store vs. only when a dirty block is evicted</td></tr>
          <tr><td class="tg-0lax">Stride</td><td class="tg-0lax">The distance between successive memory accesses (stride 1 maximizes spatial locality)</td></tr>
        </tbody>
        </table>
      title: "Key Formulas and Concepts Recap"
      questions:
        - "Without looking, split a 32-bit address for a direct mapped cache with 256 four-word (16-byte) blocks: how many offset, index, and tag bits?"
        - "Compute the AMAT for a 1 ns hit time, 5% miss rate, and 80 ns miss penalty."

  additional_reading:
    - link: https://drdobbs.com/parallel/eliminate-false-sharing/217500206
      title: "Cache Coherence Across Cores: False Cache Sharing"
    - link: https://en.wikipedia.org/wiki/Locality_of_reference
      title: The Principle of Locality
    - link: https://en.wikipedia.org/wiki/Cache_placement_policies
      title: Cache Placement Policies

tags:
  - memory
  - cache

---

