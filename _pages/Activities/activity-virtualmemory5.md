---
layout: activity
permalink: /Activities/VirtualMemory5
title: "Virtual Memory"
excerpt: "Virtual Memory"

info:
  prev: ./VirtualMemory4

  goals: 
    - To explain why memory is segmented into a stack and heap
    - To reason about the benefits of growing the stack and heap in opposite directions
    - To motivate the need for virtual memory, and specifically, for logical addressing
    - To design a logical address space that facilitates cooperative multitasking
  models:
    - model: |
        <a href="https://tinyurl.com/arraylistvector" target="_blank">Open the code visualizer below in a new window!</a>
        <br>
        <script type="syntaxhighlighter" class="brush: c"><![CDATA[
        #include <stdio.h>
        #include <stdlib.h>

        int capacity = 0; // how many elements are in the vector now?
        int size = 10; // what is the allocated size of the vector in elements?
        const int N = 30; // how many elements will we insert?

        /* Given a vector and a new size, reallocate the vector.  
         * We assume that this is a vector of integers; therefore,
         * the allocated size will be newSize * sizeof(int).  
         * Return the new vector address, since reallocation can 
         * cause the allocated memory to relocate to a new address
         * with enough free contiguous space to reside.
         */
        int* resize(int* vector, int newSize) {
            if(vector == NULL) return NULL;
            
            size = newSize;
            vector = (int*) realloc(vector, newSize * sizeof(int));
            
            if(vector == NULL) {
                perror("Failed to resize");
                return NULL;
            }
            
            return vector;
        }

        /* Given a value, push the value to the back of the vector,
         * resizing the vector to double its size whenever it becomes
         * full.  Fun fact - this is how the Java ArrayList works!
         */
        int* push(int val, int* vector) {
            printf("Pushing %d\n", val);
            if(vector == NULL) return NULL;
            
            if(capacity >= size) {
                vector = resize(vector, 2 * size);
                if(vector == NULL) return NULL;
            }
            
            capacity = capacity + 1;
            vector[capacity-1] = val;
            
            return vector;
        }

        /* Iteratively print each value of the vector. */
        void printList(int* vector) {
            int i = 0;
            
            for(i = 0; i < capacity - 1; i++) {
                printf("%d ", vector[i]);
            }
            
            printf("\n");
        }

        int main(void) {
            // Create the vector
            int* vec = (int*) malloc(size * sizeof(int));
            
            if(vec == NULL) {
                perror("Failed to allocate vector");
                return -1;
            }
            
            // Push N values to the vector
            int i = 0;

            for(i = 0; i < N; i++) {
                vec = push(i, vec);
                
                if(vec == NULL) {
                    printf("NULL vector during allocation\n");
                    return -2;
                }
            }
            
            // Print the vector
            printList(vec);

            // Don't forget to free the variable!
            free(vec);

            return 0;
        }
        ]]></script>        
      title: "Stack and Heap Access"
      questions:
        - "Trace through a few iterations of the program.  What happens to the local variables of each function as it is called?"
        - "What happens to those local variables when each function returns?"
        - "Why is it that we are able to access the vector across each function call, when the local variable storing its location is created as a local stack variable in <code>main</code>?"
        - "In the MIPS architecture, in what addresses might the local variables of each function be stored as they are called?"   
        
  reflective_prompts: 
    - "What would happen if you forgot to <code>free</code> your <code>malloc</code>'ed memory, and then your program terminated normally?"
    - "Why is it so important to call <code>free</code>?"
    - "What does the Operating System have to keep track of internally for each running program (&quot;process&quot;) in order to locate its stack variables?  In other words, given a logical address (which is not unique across programs), how do you determine the actual physical address in memory of that value?"
    
tags:
  - virtualmemory
  
---

