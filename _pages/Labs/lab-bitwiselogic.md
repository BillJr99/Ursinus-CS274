---
layout: assignment
permalink: /Labs/BitwiseLogic
title: "CS274: Computer Architecture - Bitwise Logical Operators"


info:
  coursenum: CS274
  points: 100
  goals:
    - To manipulate bitwise variables in the C programming language
    - To write and use a Makefile    

  rubric:
    - weight: 60
      description: Algorithm Implementation
      preemerging: The algorithm fails on the test inputs due to major issues, or the program fails to compile and/or run
      beginning: The algorithm fails on the test inputs due to one or more minor issues
      progressing: The algorithm is implemented to solve the problem correctly according to given test inputs, but would fail if executed in a general case due to a minor issue or omission in the algorithm design or implementation
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
    - rlink: ../Activities/Circuits
      rtitle: Circuits Activity
    - rlink: https://www.tutorialspoint.com/cprogramming/c_bitwise_operators.htm
      rtitle: Bitwise Operators in C
    - rlink: https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
      rtitle: Makefile Tutorial by Bruce A. Maxwell      

tags:
  - logic

---

### Overview: Bitwise Operations

Consider the following C program, which computes bitwise logical operations:

```c
#include <stdio.h>

// https://www.codegrepper.com/profile/yasha
void print_bin(unsigned int value)
{
    for (int i = 31; i >= 0; i--)
        printf("%d", (value & (1 << i)) >> i );
    putc('\n', stdout);
}

int main(void) {
  int a = 0xaa;
  int b = 0x55;

  printf("%d: ", a);
  print_bin(a);
  
  printf("%d: ", b);
  print_bin(b);

  print_bin(a & b); // and
  print_bin(a | b); // or
  print_bin(a ^ b); // xor 
  print_bin(~a); // not: note that the upper bits are assumed to be 0, and will be flipped!

  int c = 2;
  printf("%d: ", (c << 1)); // shift left
  print_bin(c << 1);

  printf("%d: ", (c >> 1)); // shift right
  print_bin(c >> 1);
}
```

In this lab, you will use combinations of these operations to compute several logical bitwise operations on variables that you can set.

### What to Do

Write a C program to compute the following using bitwise operators, and submit this program along with a makefile that compiles and runs your code.

1. Take two integer variable values and determine if they are equal by computing the `xor` of one value with the other.  The xor will produce a 1 in the bit positions that are the same, and a 0 in the ones that are not.  Invert this, and check if the value is equal to 0.  If so, the values are the same.

2. Check if a number is negative or positive by extracting only its sign bit (the 32nd bit for a 32-bit integer).  If it is a 1, the value is negative, and it is positive or 0 if the most significant bit is 0.  (hint: if you shift the value right 31 times, you'll get the first bit of that value duplicated in all 32 places; you can AND this value with 1 to obtain the single bit, and compare that to 0 or 1).

3. Compute the bitwise AND of two variables using the `&` operator.  Now, use deMorgan's law to compute the bitwise AND using only the OR (`|`) and NOT (`~`) operators.  The formula is `A AND B = NOT (NOT A OR NOT B)`.

4. Computer network addresses are given in the form 255.255.255.255, which is four octets of 8 bit values (from 0 to 255).  Some of these bits correspond to the network address, and some correspond to the specific computer address.  The number of bits used in the network portion of the address is known as the netmask.  For example, the address 192.168.1.12/24 indicates that the first 24 bits of the address (192.168.1) represent the network address, and the remaining 8 (32-24) bits represent the computer address (12).  

Write a program to input an IP address and a netmask, and print out the decimal values of the network address and the computer address using the bitwise logical operators.  (hint: if you AND 24 1's and 8 0's with a value, you'll get the first 24 bits of that value).  To determine an integer value of an IP address, convert each decimal octet to an 8-bit binary value (for example, 192, 168, 1, and 12).  Append these values together.  The netmask can be an integer value between 1 and 31.  One challenge here is writing a loop that generates a bit sequence of, say, 24 bits (for a 24-bit netmask).  Consider a loop that computes the bitwise OR of a value with 1.  That shifts in a 1 in the least significant digit place.  Then, shift this value left by 1.  Repeat, and you've shifted in as many 1 bits as you like! 

To extract the octets from a 32-bit IP address (i.e., the decimal IP address numbers), you can AND the IP address with 255 (0xFF) to obtain the least significant octet.  You can AND it with 0xFF00 to get the next least significant octet, but be sure to shift it right to get rid of the eight 0 bits on the right that result from performing and AND with 0x00.  Repeat for the other two octets!

### Worked Example: Netmasks and the AND Mask

Let's decompose the address `192.168.1.12/24` end-to-end, one micro-step at a time, so you can see every intermediate value.  Work through this by hand before you write any code!

1. **Convert each octet to 8-bit binary:**

    ```
    192 = 1100 0000  (0xC0)
    168 = 1010 1000  (0xA8)
      1 = 0000 0001  (0x01)
     12 = 0000 1100  (0x0C)
    ```

2. **Assemble the four octets into one 32-bit value.**  The first octet is the most significant byte:

    ```
    1100 0000  1010 1000  0000 0001  0000 1100
    = 0xC0A8010C
    ```

3. **Build the /24 mask by shifting.**  A /24 netmask means the first 24 bits are 1's and the last 32 &minus; 24 = 8 bits are 0's.  Start with all 32 bits set (`0xFFFFFFFF`) and shift left by 8; the shift pushes 8 zeros in from the right:

    ```
    0xFFFFFFFF << 8  =  0xFFFFFF00
    = 1111 1111  1111 1111  1111 1111  0000 0000
    ```

    In general, the mask for a netmask of `n` bits is `0xFFFFFFFF << (32 - n)`.

4. **AND the address with the mask** to get the network address.  Line the bits up and AND each column (a bit survives only where the mask has a 1):

    ```
      1100 0000  1010 1000  0000 0001  0000 1100   (0xC0A8010C = 192.168.1.12)
    & 1111 1111  1111 1111  1111 1111  0000 0000   (0xFFFFFF00 = /24 mask)
    -----------------------------------------------
      1100 0000  1010 1000  0000 0001  0000 0000   (0xC0A80100)
    ```

    Converting each octet of `0xC0A80100` back to decimal gives the **network address**: `192.168.1.0`.

5. **Find the host (computer) part by inverting the mask.**  `~mask` flips every bit, so `~0xFFFFFF00 = 0x000000FF` -- 1's exactly where the *host* bits are:

    ```
      1100 0000  1010 1000  0000 0001  0000 1100   (0xC0A8010C)
    & 0000 0000  0000 0000  0000 0000  1111 1111   (~mask = 0x000000FF)
    -----------------------------------------------
      0000 0000  0000 0000  0000 0000  0000 1100   (0x0000000C = 12)
    ```

    The **host address** is `12`, just as we expected from `192.168.1.12/24`.

#### A Second Example: A Mask That Splits an Octet

Netmasks are not always a multiple of 8, so the dividing line can fall *inside* an octet.  Consider `172.16.44.9/20`:

```
172 = 1010 1100 (0xAC)     16 = 0001 0000 (0x10)
 44 = 0010 1100 (0x2C)      9 = 0000 1001 (0x09)

Address: 1010 1100  0001 0000  0010 1100  0000 1001  = 0xAC102C09

/20 mask = 0xFFFFFFFF << (32 - 20) = 0xFFFFFFFF << 12 = 0xFFFFF000
         = 1111 1111  1111 1111  1111 0000  0000 0000

  1010 1100  0001 0000  0010 1100  0000 1001   (0xAC102C09 = 172.16.44.9)
& 1111 1111  1111 1111  1111 0000  0000 0000   (0xFFFFF000 = /20 mask)
------------------------------------------------
  1010 1100  0001 0000  0010 0000  0000 0000   (0xAC102000 = 172.16.32.0)

Host part = addr & ~mask = 0xAC102C09 & 0x00000FFF = 0xC09 = 3081
```

Notice what happened to the third octet: the mask keeps only its top 4 bits, so `44` (`0010 1100`) becomes `32` (`0010 0000`).  The network address is `172.16.32.0`, and the host number is `3081` -- the low 12 bits, which span *parts of two octets*.  This is why your program must work on the whole 32-bit value rather than octet by octet!

#### Algorithm Sketch

Here is a plan for your program (guidance only -- the code is up to you):

1. Read the four octets of the IP address and the netmask value (1 to 31) from the user.
2. Pack the octets into a single 32-bit value with shifts and ORs: `value = (o1 << 24) | (o2 << 16) | (o3 << 8) | o4`.
3. Build the mask, either with `0xFFFFFFFF << (32 - n)` or with the shift-in-a-1 loop described above.
4. Compute the network address with `value & mask`, and the host address with `value & ~mask`.
5. Print the network address back out in dotted form by extracting each octet with a shift and an AND: for example, the first octet is `(network >> 24) & 0xFF`, the second is `(network >> 16) & 0xFF`, and so on.
6. Print the host address as a decimal integer.

#### Common Pitfalls

> **Watch out for these frequent mistakes:**
>
> - **Signed shifts and the high bit:** In C, right-shifting a *signed* `int` whose top bit is 1 (like `0xFFFFFFFF`, or any address starting with an octet of 128 or more) may shift in copies of the sign bit rather than zeros.  Declare your address and mask variables as `unsigned int` to get the behavior you expect.
> - **Operator precedence:** In C, `==` binds *tighter* than `&`, so `x & mask == 0` actually means `x & (mask == 0)`!  Always parenthesize: `(x & mask) == 0`.
> - **Printing octets:** After shifting an octet down (for example, `value >> 16`), the bits of the *higher* octets are still there to its left.  Always mask with `0xFF` after the shift -- `(value >> 16) & 0xFF` -- or your "octet" can print as a number larger than 255.
