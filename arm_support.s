@ ============================================================
@
@ Low Level Programming - CYBR 2250-850
@
@ Assignment 4 - Table Crypt Part Two
@
@ Author: Steve Tarr
@
@ Purpose: Two functions, rotate and encrypt
@
@ ============================================================

  .text
  .global rotate
  .type rotate, %function
rotate:
        MOV R4, #0
        MOV R5, #0

        @ Reverse line 0
        LDRB R4, [R0]
        LDRB R5, [R0, #3]
        STRB R5, [R0]
        STRB R4, [R0, #3]
        LDRB R4, [R0, #1]
        LDRB R5, [R0, #2]
        STRB R5, [R0, #1]
        STRB R4, [R0, #2]

        @ Reverse line 1
        LDRB R4, [R0, #4]
        LDRB R5, [R0, #7]
        STRB R5, [R0, #4]
        STRB R4, [R0, #7]
        LDRB R4, [R0, #5]
        LDRB R5, [R0, #6]
        STRB R5, [R0, #5]
        STRB R4, [R0, #6]

        @ Reverse line 2
        LDRB R4, [R0, #8]
        LDRB R5, [R0, #11]
        STRB R5, [R0, #8]
        STRB R4, [R0, #11]
        LDRB R4, [R0, #9]
        LDRB R5, [R0, #10]
        STRB R5, [R0, #9]
        STRB R4, [R0, #10]

        @ Reverse line 3
        LDRB R4, [R0, #12]
        LDRB R5, [R0, #15]
        STRB R5, [R0, #12]
        STRB R4, [R0, #15]
        LDRB R4, [R0, #13]
        LDRB R5, [R0, #14]
        STRB R5, [R0, #13]
        STRB R4, [R0, #14]

        @ Remaining Swaps
        @ (0,1) <-> (1,0)
        LDRB R4, [R0, #1]
        LDRB R5, [R0, #4]
        STRB R5, [R0, #1]
        STRB R4, [R0, #4]

        @ (0,2) <-> (2,0)
        LDRB R4, [R0, #2]
        LDRB R5, [R0, #8]
        STRB R5, [R0, #2]
        STRB R4, [R0, #8]

        @ (0,3) <-> (3,0)
        LDRB R4, [R0, #3]
        LDRB R5, [R0, #12]
        STRB R5, [R0, #3]
        STRB R4, [R0, #12]

        @ (1,2) <-> (2,1)
        LDRB R4, [R0, #6]
        LDRB R5, [R0, #9]
        STRB R5, [R0, #6]
        STRB R4, [R0, #9]

        @ (1,3) <-> (3,1)
        LDRB R4, [R0, #7]
        LDRB R5, [R0, #13]
        STRB R5, [R0, #7]
        STRB R4, [R0, #13]

        @ (2,3) <-> (3,2)
        LDRB R4, [R0, #11]
        LDRB R5, [R0, #14]
        STRB R5, [R0, #11]
        STRB R4, [R0, #14]

        MOV PC,LR

  .text
  .global encrypt
  .type encrypt, %function
encrypt:
          @ Using R6 through R9 for the 4 counters
          MOV R4, #0
          MOV R5, #0
          MOV R6, #0
          MOV R7, #0
          MOV R8, #0
          MOV R9, #0

          @ Char 0
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R6, #1
          ADD R1, #1
          @ Char 1
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R7, #1
          ADD R1, #1
          @ Char 2
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R8, #1
          ADD R1, #1
          @ Char 3
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R9, #1
          ADD R1, #1
          @ Char 4
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R6, #1
          ADD R1, #1
          @ Char 5
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R7, #1
          ADD R1, #1
          @ Char 6
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R8, #1
          ADD R1, #1
          @ Char 7
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R9, #1
          ADD R1, #1
          @ Char 8
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R6, #1
          ADD R1, #1
          @ Char 9
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R7, #1
          ADD R1, #1
          @ Char 10
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R8, #1
          ADD R1, #1
          @ Char 11
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R9, #1
          ADD R1, #1
          @ Char 12
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R6, #1
          ADD R1, #1
          @ Char 13
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R7, #1
          ADD R1, #1
          @ Char 14
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R8, #1
          ADD R1, #1
          @ Char 15
          LDRB R5, [R1]
          CMP R5, #0x53
          ADDEQ R9, #1
          MOV R5, #0

          B comp_one

comp_one:
          CMP R6, #1
          BEQ first
          CMP R6, #3
          BEQ first

comp_two:
          CMP R7, #1
          BEQ second
          CMP R7, #3
          BEQ second

comp_three:
          CMP R8, #1
          BEQ third
          CMP R8, #3
          BEQ third

comp_four:
          CMP R9, #1
          BEQ fourth
          CMP R9, #3
          BEQ fourth

          MOV PC, LR

first:
          @ if anding value in R0 w/ 0x80 and 0x40 produce one 0 value
          @ and one non-zero value AND the value in R6 is 1 or 3, XOR
          @ the value in R0 with 0xC0
          MOV R5, #0
          MOV R4, R0
          AND R4, #0x80
          CMP R4, #0
          ADDNE R5, #1
          MOV R4, R0
          AND R4, #0x40
          CMP R4, #0
          ADDNE R5, #1

          CMP R5, #1
          EOREQ R0, #0xC0

          B comp_two

second:
          @ if anding value in R0 w/ 0x20 and 0x10 produce one 0 value
          @ and one non-zero value AND the value in R7 is 1 or 3, XOR
          @ the value in R0 with 0x30
          MOV R5, #0
          MOV R4, R0
          AND R4, #0x20
          CMP R4, #0
          ADDNE R5, #1
          MOV R4, R0
          AND R4, #0x10
          CMP R4, #0
          ADDNE R5, #1

          CMP R5, #1
          EOREQ R0, #0x30

          B comp_three

third:
          @ if anding value in R0 w/ 0x08 and 0x04 produce one 0 value
          @ and one non-zero value AND the value in R8 is 1 or 3, XOR
          @ the value in R0 with 0x0C
          MOV R5, #0
          MOV R4, R0
          AND R4, #0x08
          CMP R4, #0
          ADDNE R5, #1
          MOV R4, R0
          AND R4, #0x04
          CMP R4, #0
          ADDNE R5, #1

          CMP R5, #1
          EOREQ R0, #0x0C

          B comp_four

fourth:
          @ if anding value in R0 w/ 0x02 and 0x01 produce one 0 value
          @ and one non-zero value AND the value in R9 is 1 or 3, XOR
          @ the value in R0 with 0x03
          MOV R5, #0
          MOV R4, R0
          AND R4, #0x02
          CMP R4, #0
          ADDNE R5, #1
          MOV R4, R0
          AND R4, #0x01
          CMP R4, #0
          ADDNE R5, #1

          CMP R5, #1
          EOREQ R0, #0x03

          MOV PC, LR