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
        mov   r0, #0
        mov   r5, #5
        b     loop

@ Loops through until r4 is greater than r5, printing letters, and waiting after each
loop:
        cmp   r4, r5
        beq   last
        ldr   r2, =letters
        ldr   r0, [r2, r4, lsl#2]
        swi   SWI_LED
        mov   r0, #0
        swi   SWI_Wait
        ldr   r1, =1000
        add   r1, r1, r0
        b     wait

@ Waits an amount of time, determined by the value in r1, then goes back to looping
wait:
        swi   SWI_Wait
        cmp   r0, r1
        blt   wait
        add   r4, #1
        b     loop

@ Prints the last letter, waiting an additional second and preparing to loop again
last:
        mov   r4, #2
        ldr   r0,[r2, r4, lsl#2]
        swi   SWI_LED
        mov   r0, #0
        mov   r4, #0
        sub   r4, #1
        swi   SWI_Wait
        ldr   r1, =2000
        add   r1, r1, r0
        b     wait


letters:
        .word SEG_G|SEG_E|SEG_D                   @ L
        .word SEG_A|SEG_G|SEG_E|SEG_D|SEG_C|SEG_B @ O
        .word SEG_A|SEG_G|SEG_F|SEG_C|SEG_D       @ S
        .word SEG_A|SEG_G|SEG_E|SEG_D|SEG_F       @ E
        .word SEG_A|SEG_G|SEG_E|SEG_F|SEG_B|SEG_P @ R
