.global main

 .align 4
 .section .rodata

 prompt:         .asciz "Enter largest integer to display in chart (range of valid values: 1 to 25): "
 scnstr:         .asciz "%u"
 errorm:         .asciz "ERROR - Input must be between 1 and 25...\n"
 newline:         .asciz "\n"

 header1:        .asciz "            Number    Number\n"
 header2:        .asciz "  Number    Squared   Cubed\n"

 dashes:         .asciz "------------------------------\n"
 output1:        .asciz "%8u   %8u   %8u\n"
 output2:        .asciz "    Sums   %8u   %8u\n"

 .align 4
 .section .data

 // any variables you need go here
input: 	.word 0

 .align 4
 .text
 main:

 // your implementation of the program goes here.
	push {lr}

	//Min
	mov r4, #1
	//Max
	mov r6, #25

	//Square accumulator
	mov r7, #0
	//Cube accumulator
	mov r8, #0

	//Input Validation
	start://do
	ldr r0, =prompt
	bl printf

	//Gather input
	ldr r0, =scnstr
	ldr r1, =input
	bl scanf

	ldr r1, =input
	ldr r5, [r1]  //r5 = user input

	if://if r5(input) < r4(min)
	cmp r5, r4
	bge else
	ldr r0, =errorm
	bl printf
	b endif
	else://else if r5(input) > r6(max)
	cmp r5, r6
	ble endif
	ldr r0, =errorm
	bl printf
	endif:

	//while r5(input) < r4(min) or r5(input) > r6(max)
	cmp r5, r4
	blt start

	cmp r5, r6
	bgt start
	//End of do-while

	//Print headers
	ldr r0, =newline
	bl printf

	ldr r0, =header1
	bl printf

	ldr r0, =header2
	bl printf

	ldr r0, =dashes
	bl printf

	//Display numbers and there squares and cubes
	while: //While r4(min) <= r5(input)
	cmp r4, r5
	bgt endWhile

	ldr r0, =output1

	mov r1, r4     //Original number
	mul r2, r4, r4 //Number squared
	mul r3, r2, r4 //Number cubed

	//Update accumulators
	add r7, r7, r2
	add r8, r8, r3

	bl printf

	//Update loop count
	add r4, #1
	b while

	endWhile:

	//Outputs sums of squares and cubes
	ldr r0, =dashes
	bl printf

	ldr r0, =output2
	mov r1, r7
	mov r2, r8
	bl printf

	//Exit
	mov r0, #0
	pop {pc}
