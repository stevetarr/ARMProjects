@ ============================================================
@
@ Andorians can not navigate...
@
@ The Odometer Problem
@
@ Author: Bill Mahoney
@
@ ============================================================

        .equ SWI_Exit, 0x11             @ exit gracefully
        .equ SWI_Close, 0x68            @ close file
        .equ SWI_Open, 0x66             @ open file
        .equ SWI_ReadINT, 0x6c          @ read integer from fd in R0 -> R0
        .equ SWI_WriteINT, 0x6b         @ write integer in R1 to fd in R0
        .equ SWI_WriteS, 0x69           @ write string to stdout

        .text
        .global _start
_start:
        ldr     r0, =filename           @ Open up the file
        mov     r1, #0                  @ Read only
        swi     SWI_Open
        bcs     file_not_found
        ldr     r1, =file_handle
        str     r0, [r1]

a_set:  ldr     r1, =file_handle
        ldr     r0, [r1]
        swi     SWI_ReadINT
        cmp     r0, #0                  @ Bail out on -1
        ble     end_of_file

        mov     r6, #0                  @ R6 will be the (running) answer
        mov     r7, #0                  @ R7 will be elapsed time in hours
        mov     r8, r0                  @ R8 will count the records

calc:   ldr     r1, =file_handle
        ldr     r0, [r1]
        swi     SWI_ReadINT
        mov     r4, r0                  @ R4 = MPH
        ldr     r1, =file_handle
        ldr     r0, [r1]
        swi     SWI_ReadINT
        mov     r5, r0                  @ R5 = hours

        @ We could multiply it out but this is more of a
        @ "by the hour" approach.
hour:   add     r6, r6, r4              @ Another hour at R4 MPH
        add     r7, r7, #1              @ And an hour ticks off
        cmp     r7, r5                  @ If we are still "not there"
        blt     hour                    @ Then add it in again

        subs    r8, r8, #1              @ N--
        bgt     calc

        mov     r0, #1                  @ stdout
        mov     r1, r6                  @ The actual answer
        swi     SWI_WriteINT
        mov     r0, #1                  @ Miles
        ldr     r1, =miles
        swi     SWI_WriteS

        b       a_set                   @ Next set please.

end_of_file:
        ldr     r0, =file_handle
        ldr     r0, [r0]
        swi     SWI_Close
        swi     SWI_Exit

file_not_found:
        mov     r0, #1                  @ Stdout
        ldr     r1, =in_file_error
        swi     SWI_WriteS
        swi     SWI_Exit

@ ============================================================
@ Data
@ ============================================================

        .data
        .align  4
file_handle:    .word 0x00
filename:       .asciz   "ODO.TXT"
in_file_error:  .asciz   "No such file???\n"
miles:          .asciz  " miles\n"
