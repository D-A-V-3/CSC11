.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1
.equ YEL_PIN, 0  //BCM 17, Phys 11
.equ GREEN_PIN, 2
.equ BLUE_PIN, 3
.equ RED_PIN, 25

.align 4
.text
.global main
main:
	push {lr}
	bl wiringPiSetup

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

	mov r4, #0
	loop:
	//Yellow
	mov r0,#YEL_PIN
	mov r1, #HIGH
	bl digitalWrite

	ldr r0, =#1000
	bl delay

	mov r0, #YEL_PIN
	mov r1, #LOW
	bl digitalWrite

	//Green
	mov r0,#GREEN_PIN
        mov r1, #HIGH
        bl digitalWrite

        ldr r0, =#1000
        bl delay

        mov r0, #GREEN_PIN
        mov r1, #LOW
        bl digitalWrite

	//Blue
        mov r0,#BLUE_PIN
        mov r1, #HIGH
        bl digitalWrite

        ldr r0, =#1000
        bl delay

        mov r0, #BLUE_PIN
        mov r1, #LOW
        bl digitalWrite

	//Red
        mov r0,#RED_PIN
        mov r1, #HIGH
        bl digitalWrite

        ldr r0, =#1000
        bl delay

        mov r0, #RED_PIN
        mov r1, #LOW
        bl digitalWrite

	add r4, #1
	cmp r4,#2
	blt loop

	mov r0, #0
	pop {pc}

