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
        <a title="ComputerMemoryHierarchy.png: User:Danlash at en.wikipedia.org, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:ComputerMemoryHierarchy.svg"><img width="512" alt="ComputerMemoryHierarchy" src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/ComputerMemoryHierarchy.svg/512px-ComputerMemoryHierarchy.svg.png"></a>
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

