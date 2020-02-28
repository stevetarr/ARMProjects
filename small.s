@ ============================================================
@
@ Simple ARM program to play with to make sure your simulator is set
@ up.
@
@ Author: Bill Mahoney
@
@ ============================================================

/* This kind of comment is OK but not the slash-slash kind */

SWI_StringOut	=	0x02	@ Print an ASCII string to stdout
SWI_Exit	=	0x11	@ Exit the simulator
SWI_PrInt	=	0x6b	@ Print an integer to the fd in R0
SWI_7_seg	=	0x200	@ Display on the 7-segment number
	
	@@ Here's another way to do an equate
	.equ SWI_Exit2, 0x11 @ Stop execution

	.text
	.global	_start
	
_start:	mov	R2, #10
	mov	r3, #30
	mul	r1, r2, r3
	mov	r0, #1		@ stdout
	swi	0x6b

@	adr	r0, mystring	@ Can't do this from a different section
	ldr	r0, =mystring	@ Calculated PC-relative but 
	swi	SWI_StringOut	@ ends up absolute in the register.

	ldr	r0, =more	@ Oddly, this SWI goes to the "console"
	swi	SWI_StringOut	@ tab and not the stdout tab.

	mov	r0, #0xff	@ Light up the 7-segment LED (everything on)
	swi	SWI_7_seg
	
	mov	r0, #1		@ X coordinate (column)
	mov	r1, #1		@ Y coordinate (line)
	ldr	r2, =Message	@ String to put on the LCD
	swi	0x204		@ Display it to LCD

	mov	r0, #3		@ Let's display a 3 now
	mov	r1, #1		@ With the dot on
	bl	Disp8		@ Go do it via the function.
	
	mov	r5, #0xa5	@ x = 0xa5 ;
	ldr	r6, =x
	str	r5, [r6]
	ldr	r6, =y		@ y = x ; 
	ldr	r5, [r6]	
	
	swi	SWI_Exit	@ Bye!

@@@ ============================================================
@@@
@@@ Disp8 - show the number in R0 on the 7-segment display, and
@@@ if R1 is not zero, also light up the decimal point.
@@@
@@@ ============================================================
	
Disp8:	stmfd	sp!,{r0-r2,lr}			@ Store list of registers onto the stack
	ldr	r2, =Digits			@ Aim R2 at the digits table
	ldr	r0,[r2,r0,lsl#2]		@ Set R0 to the specific segments needed
	tst	r1,#0x01			@ If R1 then ...
	orrne	r0,r0,#SEG_P			@ ... show the decimal point
	swi	SWI_7_seg
	ldmfd	sp!,{r0-r2,pc}			@ Reload all registers and return

	.data

mystring:	.asciz	" was the answer!\n"
more:		.asciz	"And now we are done, except let's light up the LED.\n"
Message:	.asciz "Hello There\n"

x:		.word	4	@ Generates a 32-bit with 4 in it
y:		.word		@ Generates a 32-bit word with garbage
	
	.equ SEG_A, 0x80	@  patterns for 8 segment display
	.equ SEG_B, 0x40	@ byte values for each segment
	.equ SEG_C, 0x20	@ of the 8 segment display
	.equ SEG_D, 0x08
	.equ SEG_E, 0x04
	.equ SEG_F, 0x02
	.equ SEG_G, 0x01
	.equ SEG_P, 0x10
Digits:
	.word SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_G 	@ zero
	.word SEG_B|SEG_C				@ one
	.word SEG_A|SEG_B|SEG_F|SEG_E|SEG_D		@ two ...
	.word SEG_A|SEG_B|SEG_F|SEG_C|SEG_D
	.word SEG_G|SEG_F|SEG_B|SEG_C
	.word SEG_A|SEG_G|SEG_F|SEG_C|SEG_D
	.word SEG_A|SEG_G|SEG_F|SEG_E|SEG_D|SEG_C
	.word SEG_A|SEG_B|SEG_C
	.word SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G
	.word SEG_A|SEG_B|SEG_F|SEG_G|SEG_C 		@ nine
	.word 0						@ blank display
