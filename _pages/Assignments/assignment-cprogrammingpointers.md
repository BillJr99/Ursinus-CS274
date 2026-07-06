---
layout: assignment
permalink: /Assignments/Programming/CProgrammingPointers
title: "CS274: Computer Architecture - C Programming and Pointers"


info:
  coursenum: CS274
  points: 100
  goals:
    - To write, compile, and execute programs in C
    - To dynamically allocate and utilize memory
    - To reason about how signed vs. unsigned integer types (int vs. size_t) affect memory safety

  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The programs do not compile or run via the Makefile, crash (for example, from dereferencing an unchecked or freed pointer), or fewer than four of the six required parts are attempted
      beginning: The six parts compile and run, but one or more produces incorrect behavior due to a minor issue (for example, a missing null terminator in the strncpy part, an off-by-one in the malloc'd array bounds, or the sort using x[i] indexing instead of pointer arithmetic)
      progressing: All six parts work on the tested inputs -- the malloc'd int array, the char** of strncpy'd strings, the pointer-arithmetic sort, the linked list sort, the realloc-based growable array with add/remove/get, and the signed/unsigned size-safeguard replication -- but a general case would fail (for example, malloc return values are not checked for NULL, some allocations are never freed, the linked list sort swaps values rather than nodes, or the timing comparison of +1 vs. doubling growth is missing), or the Makefile does not both compile and run the programs
      proficient: All six parts work in the general case with every malloc/realloc checked for NULL and every allocation freed; the sort operates through pointer arithmetic (*(a+i), not a[i]); the linked list sort relinks the actual nodes; the growable array supports add, remove, and get, grows by both +1 and doubling, and the timing of both strategies for 100000+ adds is reported; the size-safeguard replication reproduces the out-of-bounds copy with a negative length and is then fixed by using an unsigned size; and a Makefile compiles and runs everything
    - weight: 30
      description: Code Quality and Documentation
      preemerging: Code commenting and structure are absent, the five parts are an undifferentiated block of code, and/or the code departs significantly from the style guide
      beginning: Comments are sparse or restate the code (for example, "call malloc"), and/or there are minor departures from the style guide that reduce readability
      progressing: Each part is organized into its own function or program with comments describing what it does, and the code mostly adheres to the style guide, but comments restate definitions rather than explaining the pointer and memory reasoning
      proficient: Each part is cleanly separated, comments explain the memory behavior at non-trivial points (what is allocated, who owns it, when it is freed, and how the pointer arithmetic or node relinking works), and the code follows the style guide
    - weight: 10
      description: Writeup and Submission
      preemerging: An incomplete submission is provided; the readme is missing
      beginning: The programs are submitted, but not according to the directions in one or more ways (for example, the readme is missing, or the Makefile is not included)
      progressing: The programs are submitted according to the directions with a minor omission or correction needed, and the readme describes the solution and reports the part 5 timing observations at least superficially
      proficient: The programs are submitted according to the directions, including a readme that describes each part, explains how to build and run everything via the Makefile, reports the measured times for the +1 versus doubling growth strategies in part 5, gives a thoughtful answer to why the two strategies differ (the bolded "What do you observe?" question), and gives a thoughtful answer to why declaring a size as int instead of size_t is unsafe (the bolded question in part 6)

  readings:
    - rlink: https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
      rtitle: Makefile Tutorial by Bruce A. Maxwell
    - rlink: https://www.tutorialspoint.com/cprogramming/index.htm
      rtitle: C Programming Tutorial
    - rlink: https://cplusplus.com/reference/cstring/strncpy/
      rtitle: "<code>strncpy</code> Reference"
    - rlink: https://www.learn-c.org/en/Linked_lists
      rtitle: "Linked Lists in C"
    - rlink: https://makefiletutorial.com/
      rtitle: Makefile Tutorial by Example
    - rlink: https://www.gnu.org/software/make/manual/html_node/Introduction.html
      rtitle: "GNU Make Manual: Introduction"
    - rlink: https://www.gnu.org/software/libc/manual/html_node/Consistency-Checking.html
      rtitle: "Unit Testing in C with <code>assert.h</code>"
    - rlink: https://www.youtube.com/watch?v=14q9KLkbRT8
      rtitle: "Video: Every Developer Should Know This Type Of Bug (signed/unsigned size bug)"

tags:
  - programming
  - c
  - pointers

---

### Purpose

This assignment builds the C and pointer skills that let you see memory the way the hardware does: as addresses you allocate, dereference, and release yourself.  Dynamic allocation, pointer arithmetic, and node-based structures are exactly the mechanisms we will revisit when we study how the stack, heap, and caches behave, and the timing experiment in part 5 previews how memory behavior drives performance.

In this assignment, you will practice allocating memory dynamically on the heap, and then access the variables you allocate through the pointers they return.

This approach is useful over stack-based compile-time variable allocations because you don't need to know the size of your variables when you write your code.  For example, if you are creating an array to hold a phone book, you don't know when writing and compiling your code how many phone numbers you will store.  This might be based on user input, or the size of a file that you read from disk.  At runtime, you can make this determination, and *then* allocate the array with the correct size.  It is this idea that gives rise to dynamic data structures like linked lists and vectors.

If you program in Java, you may be familiar with the `ArrayList`, which seems to allow you to create an array at compile time, but grow it at runtime.  In fact, it's doing this dynamic memory allocation and re-allocation for you!  When the array gets too large to fit in the space allocated for it, it allocates new, larger memory, and copies itself to the new location for subsequent use.  In this assignment, you'll create a data structure similar to the `ArrayList` and experience how this works.

The `malloc` function creates memory on the heap, and returns to you the address of the variable or start of the array.  It returns `NULL` if it fails (for example, due to being out of memory), so be sure to check (and exit) if your variable is equal to `NULL`!  For example:

```c
#include <stdlib.h>
#include <stdio.h>

int main(void) {
    // malloc's 1 integer, casts the return value to a pointer to the array (int*), and assigns it to x
    int* x = (int*) malloc(1 * sizeof(int));

    if(x == NULL) {
        perror("Error allocating array x"); // perror is like printf but also prints the error message
    }
    
    *x = 5;
    
    printf("%d\n", *x);
    
    free(x); // it is up to you to de-allocate all variables you allocate
}
```

You can declare an array by calling `malloc` with a larger size parameter:

```c
#include <stdlib.h>
#include <stdio.h>

int main(void) {
    // malloc's 5 integers
    int* x = (int*) malloc(5 * sizeof(int));

    if(x == NULL) {
        perror("Error allocating array x"); // perror is like printf but also prints the error message
    }
    
    x[0] = 6;
    x[1] = 7;
    
    printf("%d\n", x[0]);
    
    free(x);
}
```

### Task

Write a program with 6 functions, or 6 different programs, to accomplish each of the below functionality.  When finished, create a Makefile that compiles and runs the program(s).

1. Define an `int*` pointer variable, and create an array of 10 integers using `malloc()`.  Then, assign values to that array, print their values, and `free()` the integers.

2. Using `malloc`, create a `char**` pointer that contains 10 `char*`'s.  
    * In a loop, initialize each of the 10 `char*`'s in a loop to a char array (a `char*`) of size 15
    * Initialize each to a word of your choice using the `strncpy` function (don't forget the null terminator \0).
    * Print each one to the screen using `printf("%s", charptr)`.
    
3. Write a function `sort()` that takes in an `int* a` and `int size`, and sorts the array using pointer arithmetic.  You may select and use any sorting algorithm that you like, but your array must be created using `malloc`.  Array accesses must be manually computed, that is: `*(x+3)` instead of `x[3]`.

4. Modify the sort program you just created to take in a linked list of structs that you create (with a `int data` element, and a `struct ListNode*`), and sort the linked list. Note that you should swap the actual nodes and not just the values within those nodes.

5. Finally, write a program that, using `malloc` and `realloc`, creates an array of initial size `n`.  
    * Write `add()`, `remove()` and `get()` functions for your array.  
    * When adding beyond the end of the array, reallocate space such that the array contains one more element.  
    * Time your program for adding 100000 elements (or more).  
    * Finally, modify the program such that it increases in size by a factor of 2 times the previous size (use an `if` statement to select between doubling and increasing by 1, so that you don't lost your previous work).  Time it again.  What do you observe?

6. **Signed vs. unsigned sizes: confirm a real vulnerability.**  Every size you passed above (`int size` in your `sort()`, the array lengths) was an `int`.  The C library never does this: `malloc`, `memcpy`, and `strncpy` all take their sizes as `size_t`, an *unsigned* type.  This part shows why, using a simplified version of a real bug found in the FreeBSD kernel.  Watch the short video below first:

    <iframe width="560" height="315" src="https://www.youtube.com/embed/14q9KLkbRT8" title="Every Developer Should Know This Type Of Bug" frameborder="0" allowfullscreen></iframe>

    The kernel lets a user program copy *at most* some number of bytes out of a fixed 1&nbsp;KB buffer, and must never copy more.  A simplified version of the safeguard:

    ```c
    #include <string.h>

    char kbuf[1024];   // the only region the user is allowed to read

    void copy_from_kernel(void* dst, int len) {
        int max = sizeof(kbuf);                    // 1024, kept in a signed int
        int safe_len = (len > max) ? max : len;    // "never copy more than 1024"
        memcpy(dst, kbuf, safe_len);               // but memcpy's size is a size_t (unsigned)
    }
    ```

    * Build a small program around this function.  Fill `kbuf` with a known pattern, and place a second array right after it (call it `secret`) filled with a *different* pattern, so you can tell if a copy ran past the end of `kbuf`.
    * Call `copy_from_kernel` with a sensible positive `len` (say `64`) and confirm it behaves.  Then **call it with a negative `len`, such as `-1`.**  Print `safe_len`, and observe how many bytes actually get copied (running under `valgrind` or with AddressSanitizer, `-fsanitize=address`, makes the over-read obvious; otherwise you will see the leaked `secret` bytes or a crash).
    * **Trace what happens to the `len > max` check when `len` is negative, and what value `memcpy` actually receives as its size.**  Confirm the bug: the "safe" length passes the check and is then reinterpreted as an enormous unsigned number.
    * In your readme, **explain why it is unsafe to declare a size as `int` instead of `size_t`.**  Reference the two's-complement bit pattern of `-1` and what that same pattern means when read as an unsigned `size_t` (recall the number-systems material).  Then fix the function so the bug cannot happen, and explain why your fix works.

    *Hint: `sizeof` already returns a `size_t`.  Try changing `int max` to `size_t max` and re-running your negative-length test -- note how the comparison's behavior changes, and decide whether that alone is a complete fix.*

### Testing Your Work

Write a small unit test for each function as you go -- a `sort()` test with an already-sorted array, a reverse-sorted array, and a one-element array will catch most pointer arithmetic bugs, and `assert` from `assert.h` is all you need (see the readings above).  Automate the build with your Makefile, and consider adding a `make test` target that compiles and runs your tests so that one command verifies everything before you submit.  Part 6's test is a *negative* one: your fixed `copy_from_kernel` should refuse (or safely clamp) a negative length instead of copying `SIZE_MAX` bytes.
