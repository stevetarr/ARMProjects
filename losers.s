@ ============================================================
@
@ Low Level Programming - CYBR 2250-850
@
@ Assignment 2 - LOSERS
@
@ Author: Steve Tarr
@
@ Purpose: Apparently the Patriots are bad, and ARMSim needs
@          to tell them about it.
@
@ Note: I put in an abundance of comments some may be
@ redundant but it helped me to keep track of where I was at.
@ ============================================================

        @ These .equ statments set up our SWI statements.
        .equ  SWI_Wait, 0x6d           @ Waits a second, in miliseconds.
        .equ  SWI_LED, 0x200           @ Lights up the 8 segment LED.
        .equ  SWI_Pressed, 0x202       @ Checks to see if one of the black buttons has been pressed.

        @ These .equ statements correspond to the LED segments we will illuminate.
        .equ  SEG_A, 0x80
        .equ  SEG_B, 0x40
        .equ  SEG_C, 0x20
        .equ  SEG_D, 0x08
        .equ  SEG_E, 0x04
        .equ  SEG_F, 0x02
        .equ  SEG_G, 0x01
        .equ  SEG_P, 0x10

@ Checks to see if one of the two black buttons was pressed, if so starts the loop
_start:
        swi   SWI_Pressed
        cmp   r0, #0x02
        beq   setup
        cmp   r0, #0x01
        beq   setup
        b     _start

@ Sets up the loop by setting r0 to 0 and putting the length of the word to be printed in r5
setup:
        mov   r0, #0                @ Ensure the value of r0 is 0, after swi
        mov   r5, #5                @ bounds for the counter variable
        b     loop

@ Loops through until r4 is greater than r5, printing letters, and waiting after each
loop:
        cmp   r4, r5                @ Check the counter against the bounds
        beq   last                  @ If the counter is equal to the bounds, branch
        ldr   r2, =letters          @ Load the collection of letters into r2
        ldr   r0, [r2, r4, lsl#2]   @ Store the value at the address (array, array position, shift of 2)
        swi   SWI_LED               @ Display the LED patter corresponding to this entry in memory
        mov   r0, #0                @ Reset r0 to a value of 0
        swi   SWI_Wait              @ Get the current time
        ldr   r1, =1000
        add   r1, r1, r0            @ Shift from miliseconds to seconds
        b     wait

@ Waits an amount of time, determined by the value in r1, then goes back to looping
wait:
        swi   SWI_Wait              @ Get the current time
        cmp   r0, r1                @ Compare the current time to the value in r1
        blt   wait                  @ Loop until the specified time
        add   r4, #1                @ Since we just displayed a letter, and waited, increment the array subscript
        b     loop

@ Prints the last letter, waiting an additional second and preparing to loop again
last:
        mov   r4, #2
        ldr   r0,[r2, r4, lsl#2]
        swi   SWI_LED
        mov   r0, #0                @ Since this is the last letter reset the variable values
        mov   r4, #0                @ so that you can loop again from the start.
        sub   r4, #1                @ Set the value to -1, so when wait increments it it will start at 0.
        swi   SWI_Wait
        ldr   r1, =2000             @ Wait twice as long since this is the last letter
        add   r1, r1, r0
        b     wait


letters:
        .word SEG_G|SEG_E|SEG_D                   @ L
        .word SEG_A|SEG_G|SEG_E|SEG_D|SEG_C|SEG_B @ O
        .word SEG_A|SEG_G|SEG_F|SEG_C|SEG_D       @ S
        .word SEG_A|SEG_G|SEG_E|SEG_D|SEG_F       @ E
        .word SEG_A|SEG_G|SEG_E|SEG_F|SEG_B|SEG_P @ R
