@ assembly project 3ds
	.data 
	.balign 4
str:.asciz "\nHello World!"
	.text
	.global main
	.extern gfxInitDefault
	.extern gfxExit
	.extern consoleInit
	.extern kDown
	.extern aptMainLoop

main:
	 push {ip, lr}	@ push return address + dummy register for alignment
	 bl gfxInitDefault @do function gfxInitdefault
	 mov r0, #0	@ r0 here represents the first argument of func consoleInit(Note:- GFX_TOP = 0, GFX_BOTTOM = 1)
	 mov r1, r0 @ r1 here is the sencond argument for the function consoleInit
	 bl consoleInit @ consoleInit(0,0) 
	 ldr r0, =str @ pass Hello world into r0
	 bl printf @ printf("\nHello World!")
	 mov r0, #0 
	 bl loop
loop:
	bl aptMainLoop
	cmp r0, #1
	bne loop
	bl exit	 
exit:
	bl gfxExit @ do func gfxExit
	pop {ip,pc}
	bx lr @ return 