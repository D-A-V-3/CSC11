 .global main
 2
 3 .align 4
 4 .section .rodata
 5
 6 prompt:         .asciz "Enter largest integer to display in chart (range of valid values: 1 to 25): "
 7 scnstr:         .asciz "%u"
 8 errorm:         .asciz "ERROR - Input must be between 1 and 25...\n"
 9 newlin:         .asciz "\n"
10
11 header1:        .asciz "           Number    Number\n"
12 header2:        .asciz "  Number    Squared   Cubed\n"
13
14 dashes:         .asciz "------------------------------\n"
15 output1:        .asciz "%8u   %8u   %8u\n"
16 output2:        .asciz "    Sums   %8u   %8u\n"
17
18 .align 4
19 .section .data
20
21 // any variables you need go here
22
23 .align 4
24 .text
25 main:
26
27 // your implementation of the program goes here.