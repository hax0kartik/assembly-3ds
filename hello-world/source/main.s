@ assembly project 3ds
	.data 
	.balign 4
str:.asciz "\nHello World!"
val:.int 990000	
	.text
	.global main
	.extern gfxInitDefault
	.extern gfxExit
	.extern consoleInit
	.extern kDown
	.extern aptMainLoop

main:
	 push {ip, lr}
	 bl gfxInitDefault
	 mov r0, #0
	 mov r1, r0
	 bl consoleInit
	 ldr r0, =str
	 bl printf
	 mov r0, #0
	 bl loop
loop:
	bl aptMainLoop
	cmp r0, #1
	bne loop
	bl exit	 
exit:
	bl gfxExit
	pop {ip,pc}
	bx lr