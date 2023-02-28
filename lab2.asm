
#                                           ICS 51, Lab #2
# 
#                                          IMPORTANT NOTES:
# 
#                       Write your assembly code only in the marked blocks.
# 
#                       DO NOT change anything outside the marked blocks.
#
#

###############################################################
#                           Text Section
.text

###############################################################
###############################################################
###############################################################
#                            PART 1 (Fibonacci)
#
# 	The Fibonacci Sequence is the series of integer numbers:
#
#		0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...

#	The next number is found by adding up the two numbers before it.
	
#	The `2` is found by adding the two numbers before it (1+1)
#	The `3` is found by adding the two numbers before it (1+2),
#	And the `5` is (2+3),
#	and so on!
#
# You should compute N ($a0) number of elements of fibonacci and put
# in array, named fib_array.
# 
fibonacci:
# $a0: Number of elements. 
# fib_array: The destination array.
################## Part 1: your code begins here ###############

############################## Part 1: your code ends here   ###
.text
	li $t0, 0 # f0
	li $t1, 1 # f1
	li $t3, 0 # currIndex
	li $t4, 0 # currSum
	sll $a0, $a0, 2
	sw $t0, fib_array($t3)
	addi $t3, $t3, 4
	sw $t1, fib_array($t3)
	addi $t3, $t3, 4

fibWhile: 
	beq $t3, $a0, fibEnd
	add $t4, $t0, $t1
	move $t0, $t1
	move $t1, $t4
	sw $t4, fib_array($t3)
	addi $t3, $t3, 4
	j fibWhile

fibEnd:
jr $ra
###############################################################
###############################################################
###############################################################
#                  PART 2 (local maximum points)
# Write a function in MIPS assembly that takes an array of 
# integers and finds local maximum points. i.e., points that if 
# the input entry is larger than both adjacent entries. The 
# output is an array of the same size of the input array. The 
# output point is 1 if the corresponding input entry is a 
# relative maximum, otherwise 0. (You should ignore the output
# array's boundary items, set to 0.) 
# 
# For example,
# 
# the input array of integers is {1, 3, 2, 4, 6, 5, 7, 8}. Then,
# the output array of integers should be {0, 1, 0, 0, 1, 0, 0, 0}
# 
# (Note: The first/last entry of the output array is always 0
#  since it's ignored, never be a local maximum.)
# $a0: The base address of the input array
# $a1: The base address of the output array with local maximum points
# $a2: Size of array
find_local_maxima:
############################ Part 2: your code begins here ###
	addi $t0, $a2, -2 # loop a2 - 2 times
	addi $a0, $a0, 4
	sw $zero, 0($a1)
	addi $a1, $a1, 4
	
findMaxLoop:
	ble $t0, $zero, findMaxEnd
	lw $t1, -4($a0) # prevVal
	lw $t2, 0($a0) # currVal
	lw $t3, 4($a0) # nextVal
	bgt $t1, $t2, currVal_is_smaller 
	bgt $t3, $t2, currVal_is_smaller 
	addi $t4, $zero, 1
	sw $t4, 0($a1)
	j rear_of_loop
	
	currVal_is_smaller:
		addi $t4, $zero, 0
		sw $t4, 0($a1)
		
	rear_of_loop:
		addi $a0, $a0, 4
		addi $a1, $a1, 4
		addi $t0, $t0, -1
		j findMaxLoop
		
findMaxEnd:
	addi $t4, $zero, 0
	sw $t4, 0($a1)
############################ Part 2: your code ends here ###
jr $ra

###############################################################
###############################################################
###############################################################
#                       PART 3 (Change Case)
# Complete the change_case function that takes a Null-terminated
# string and converts the lowercase characters (a-z) to 
# uppercase and convert the uppercase ones (A-Z) to lower case. 
# Your function should also ignore non-alphabetical characters. 
# For example, "L!A##b@@3" should be converted to "laB". 
# In null-terminated strings, end of the string is specified 
# by a special null character (i.e., value of 0).

#a0: The base address of the input array
#a1: The base address of the output array
###############################################################
change_case:
############################## Part 3: your code begins here ###
change_case_loop:
	lb $t0, 0($a0) # currCharVal
	beq $t0, $zero, exit_change_case_loop
	blt $t0, 'A', not_uppercase
	bgt $t0, 'Z', not_uppercase
	addi $t0, $t0, -0x41
	addi $t0, $t0, 0x61
	sb $t0, 0($a1)
	addi $a1, $a1, 1
	j continue
	
	not_uppercase:
	blt $t0, 'a', continue
	bgt $t0, 'z', continue
	addi $t0, $t0, -0x61
	addi $t0, $t0, 0x41
	sb $t0, 0($a1)
	addi $a1, $a1, 1
	
	continue:
	addi $a0, $a0, 1
	j change_case_loop
	
exit_change_case_loop:
	sb $zero, 0x00($a1)
############################## Part 3: your code ends here ###
jr $ra
