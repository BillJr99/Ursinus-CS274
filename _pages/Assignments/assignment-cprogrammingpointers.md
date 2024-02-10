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
      proficient: The program is submitted according to the directions, including a readme writeup describing the solution, and thoughtful answers to the bolded questions throughout

  readings:
    - rlink: https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
      rtitle: Makefile Tutorial by Bruce A. Maxwell
    - rlink: https://www.tutorialspoint.com/cprogramming/index.htm
      rtitle: C Programming Tutorial
    - rlink: https://cplusplus.com/reference/cstring/strncpy/
      rtitle: "<code>strncpy</code> Reference"
    - rlink: https://www.learn-c.org/en/Linked_lists
      rtitle: "Linked Lists in C"

tags:
  - programming
  - c
  - pointers

---

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

### What to Do

Write a program with 5 functions, or 5 different programs, to accomplish each of the below functionality.  When finished, create a Makefile that compiles and runs the program(s).

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
