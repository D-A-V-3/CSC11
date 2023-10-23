.global main

.align 4
.section .rodata

//Prompted message
string: .asciz "Enter two signed integers: "

format: .asciz "%d %d"

//Outputs for different cases
output: .asciz "Entered values were %d and %d \n\n"
sumOut: .asciz "Sum of %d and %d is %d\n"
prodOut: .asciz "Product of %d and %d is %d\n"
andOut: .asciz "Logical AND of %d and %d is %d\n"
orOut: .asciz "Logical OR of %d and %d is %d\n"

.align 4
.data

//User input
input1: .word 0
input2: .word 0

.align 4
.text

main:
	push {lr}

	//Outputs prompted message
	ldr r0, =string
	ldr r4, =input1
	ldr r5, = input2

	bl printf

	//Gathers the user's input
	ldr r0, =format
	mov r1, r4
	mov r2, r5

	bl scanf

	//Outputs values entered by user
	mov r1, r4
	ldr r0, =output

	mov r2, r5

	ldr r1, [r1]
	ldr r2, [r2]
	bl printf

	//Outputs sum of the values
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2, [r2]

	adds r3, r1, r2  //r3 = r1 + r2

	ldr r0, =sumOut
	bl printf

	//Outputs product of the values
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2, [r2]

	mul r3, r1, r2  // r3 = r1 * r2

	ldr r0, =prodOut
	bl printf

	//Outputs logical AND of values
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2, [r2]

	and r3, r1, r2  // r3 = r1 ^ r2

	ldr r0, =andOut
	bl printf

	//Outputs logical OR of values
	mov r1, r4
	mov r2, r5
	ldr r1, [r1]
	ldr r2, [r2]

	orr r3, r1, r2  // r3 = r1 V r2

	ldr r0, =orOut
	bl printf

	//Exit code
	mov r0, #0
	pop {pc}
