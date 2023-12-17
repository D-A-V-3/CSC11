.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1
.equ YEL_PIN, 0  //BCM 17, Phys 11
.equ GREEN_PIN, 2
.equ BLUE_PIN, 3
.equ RED_PIN, 25
.equ BUTTON, 23

.align 4
.section .rodata
out: .asciz "%d\n"
.text
.global main
main:
	push {lr}
	bl wiringPiSetup

	mov r4, #0
	mov r0, #BUTTON
	mov r1, #INPUT
	bl pinMode

	mov r0, #YEL_PIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #GREEN_PIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #BLUE_PIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #RED_PIN
	mov r1, #OUTPUT
	bl pinMode

//	mov r4, #0
	loop:
	//Yellow
	yellowloop:
	mov r0,#YEL_PIN
	mov r1, #HIGH
	bl digitalWrite

	ldr r0, =#1000
	bl delay

	mov r0, #YEL_PIN
	mov r1, #LOW
	bl digitalWrite

	//Green
	cmp r4, #3
	beq endLoop
	greenloop:
	mov r0,#GREEN_PIN
        mov r1, #HIGH
        bl digitalWrite

        ldr r0, =#1000
        bl delay

        mov r0, #GREEN_PIN
        mov r1, #LOW
        bl digitalWrite

	//Blue
	cmp r4, #2
	beq endLoop
	blueloop:
        mov r0,#BLUE_PIN
        mov r1, #HIGH
        bl digitalWrite

        ldr r0, =#1000
        bl delay

        mov r0, #BLUE_PIN
        mov r1, #LOW
        bl digitalWrite

	//Red
	cmp r4, #1
	beq endLoop
	redloop:
        mov r0,#RED_PIN
        mov r1, #HIGH
        bl digitalWrite

        ldr r0, =#1000
        bl delay

        mov r0, #RED_PIN
        mov r1, #LOW
        bl digitalWrite

//	add r4, #1
//	cmp r4,#1
//	blt loop
	endLoop:

	butloop:
	mov r0, #BUTTON
	bl digitalRead
	cmp r0, #HIGH
	bne loop

//	beq end


//	mov r0, #RED_PIN
//	mov r1, #HIGH
//	bl digitalWrite

    //    mov r0, #RED_PIN
  //      mov r1, #LOW
//        bl digitalWrite

	bl end

	end:
	add r4, #1
	cmp r4, #1
	bne blue
	mov r0, #RED_PIN
	mov r1, #HIGH
	bl digitalWrite
	mov r0, r4
	ldr r0, =out
	mov r1, r4
	bl printf
	bl loop
	blue:
	cmp r4, #2
	bne green
	mov r0, #BLUE_PIN
	mov r1, #HIGH
	bl digitalWrite
        mov r0, r4
        ldr r0, =out
        mov r1, r4
        bl printf

	bl loop
	green:
	cmp r4, #3
	bne endProg
	mov r0, #GREEN_PIN
	mov r1, #HIGH
	bl digitalWrite
        mov r0, r4
        ldr r0, =out
        mov r1, r4
        bl printf

	bl loop
	yellow:
	cmp r4, #4
	bne endProg
	mov r0, #YEL_PIN
	mov r1, #HIGH
	bl digitalWrite
        mov r0, r4
        ldr r0, =out
        mov r1, r4
        bl printf


	endProg:

	mov r0, #RED_PIN
        mov r1, #LOW
        bl digitalWrite

        mov r0, #BLUE_PIN
        mov r1, #LOW
        bl digitalWrite

        mov r0, #GREEN_PIN
        mov r1, #LOW
        bl digitalWrite

        mov r0, #YEL_PIN
        mov r1, #LOW
        bl digitalWrite


	mov r0, #0
	pop {pc}
