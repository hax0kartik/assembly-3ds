@ assembly project 3ds
@ all the code is basically same with that of simple-add
	.data
	.balign 4
str:.asciz "a-b = %d"
a:	.word 78
b:	.word 22
c:	.word 0

	.text
	.extern gfxInitDefault
	.extern gfxExit
	.extern apMainLoop
	.extern printf
	.extern consoleInit
	.global main
	
main:
	push {ip, lr}
	bl gfxInitDefault
	mov r0, #0
	mov r1, r0
	bl consoleInit
	ldr r1, =a
	ldr r1, [r1]
	ldr r2, =b
	ldr r2, [r2]
	sub r1, r1, r2
	ldr r2, =c
	str r1, [r2]
	ldr r0, =str
	ldr r1, =c
	ldr r1, [r1]
	bl printf
	bl loop
	
loop:
	bl aptMainLoop
	bl hidScanInput
	bl hidKeysDown
	mov r1, #0x1u
	lsl r1, r1, #3
	cmp r0, r1
	bne loop
	bl exit
	
exit:
	bl gfxExit
	pop {ip, pc}
	bx lr