# mips_with_array_and_loops:
Question 1
1. Complete the fibonacci function that should compute the series of N (integer) elements of Fibonacci numbersLinks to an external site. and put them into a global array, named "fib_array" (given in the memory). (Note: You can assume "fib_array" will have enough space to place N elements. By definition, you can assign the constant value 0 and 1 directly for F0 and F1.)
>>> $a0 contains the N's value, which represents the number of elements of the Fibonacci number to be completed.
>>> "fib_array" is the given label name of an array in the memory

Question 2
2. Write a function in MIPS assembly that takes an array of integers and finds local maximum points. i.e., points that if the input entry is larger than both adjacent entries. The output is an array of the same size of the input array. The output point will be set to 1 if the corresponding input entry is a relative maximum, otherwise 0. (You should ignore the output array's boundary items, set to 0.) 
For example,
the input array of integers is {1, 3, 2, 4, 6, 5, 7, 8}. Then,
the output array of integers should be {0, 1, 0, 0, 1, 0, 0, 0}
(Note: The first/last entry of the output array is always 0 since it's ignored, never be a local maximum.)
>>> $a0: The base address of the input array of integers
>>> $a1: The base address of the output array of integers
>>> $a2: number of entries in the array (For simplicity, assume it's always >= 3.)

Question 3
3. Complete the change_case function that takes a Null-terminatedLinks to an external site. string and converts the lowercase characters (a-z) to uppercase and converts the uppercase ones (A-Z) to lower case. Your function should also ignore non-alphabetical characters. For example, “L!A##b@@3” should be converted to “laB”. In null-terminated strings, end of the string is specified by a special null character (i.e., value of 0).
Hint: every character has a corresponding one-byte code in what we call the ASCII table. In this part, you are dealing with characters and checking for validity. Go to this webpage for the full ASCII reference: http://www.asciitable.com/Links to an external site.. Make sure that the output string is also null-terminated by appending 0 to the end of it. 
>>> The base address of the input array is given in $a0.
>>> The base address of the output array is given in $a1.

