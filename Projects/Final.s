.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1
.equ LED_PIN, 0  //BCM 17, Phys 11

.align 4
.text
.global main
main:
	push {lr}
	bl wiringPiSetup

	mov r0, #LED_PIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0,#LED_PIN
	mov r1, #HIGH
	bl digitalWrite

	ldr r0, =#5000
	bl delay

	mov r0, #LED_PIN
	mov r1, #LOW
	bl digitalWrite

	mov r0, #0
	pop {pc}

