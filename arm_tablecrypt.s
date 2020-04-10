	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"arm_tablecrypt.c"
	.text
	.global	table
	.data
	.align	2
	.type	table, %object
	.size	table, 16
table:
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.text
	.align	2
	.global	print
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	print, %function
print:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	mov	r0, #1
	bl	swi_print
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	print, .-print
	.align	2
	.global	putchar
	.syntax unified
	.arm
	.fpu softvfp
	.type	putchar, %function
putchar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	and	r2, r3, #255
	ldr	r3, .L4
	strb	r2, [r3]
	ldr	r1, .L4
	mov	r0, #1
	bl	swi_print
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	out_ch.4207
	.size	putchar, .-putchar
	.global	data
	.data
	.align	2
	.type	data, %object
	.size	data, 705
data:
	.byte	83
	.byte	78
	.byte	83
	.byte	83
	.byte	78
	.byte	78
	.byte	83
	.byte	83
	.byte	78
	.byte	83
	.byte	78
	.byte	83
	.byte	83
	.byte	78
	.byte	83
	.byte	83
	.byte	10
	.byte	67
	.byte	-79
	.byte	117
	.byte	-80
	.byte	120
	.byte	-81
	.byte	91
	.byte	-79
	.byte	81
	.byte	-80
	.byte	84
	.byte	-70
	.byte	28
	.byte	32
	.byte	120
	.byte	-88
	.byte	89
	.byte	32
	.byte	121
	.byte	-77
	.byte	89
	.byte	32
	.byte	95
	.byte	-91
	.byte	16
	.byte	-93
	.byte	95
	.byte	-92
	.byte	89
	.byte	-77
	.byte	16
	.byte	-94
	.byte	94
	.byte	-92
	.byte	16
	.byte	-93
	.byte	85
	.byte	-80
	.byte	84
	.byte	-90
	.byte	114
	.byte	-77
	.byte	16
	.byte	-76
	.byte	95
	.byte	32
	.byte	112
	.byte	-79
	.byte	95
	.byte	-76
	.byte	89
	.byte	-93
	.byte	120
	.byte	32
	.byte	115
	.byte	-90
	.byte	83
	.byte	-79
	.byte	89
	.byte	-76
	.byte	115
	.byte	44
	.byte	16
	.byte	-95
	.byte	89
	.byte	-89
	.byte	81
	.byte	-83
	.byte	6
	.byte	-76
	.byte	84
	.byte	-81
	.byte	121
	.byte	-77
	.byte	81
	.byte	-83
	.byte	88
	.byte	-77
	.byte	16
	.byte	-81
	.byte	90
	.byte	32
	.byte	117
	.byte	-90
	.byte	81
	.byte	-79
	.byte	115
	.byte	32
	.byte	81
	.byte	-89
	.byte	95
	.byte	45
	.byte	16
	.byte	-106
	.byte	94
	.byte	-76
	.byte	85
	.byte	-84
	.byte	16
	.byte	-79
	.byte	89
	.byte	-93
	.byte	89
	.byte	-83
	.byte	120
	.byte	32
	.byte	88
	.byte	-90
	.byte	83
	.byte	-94
	.byte	88
	.byte	-90
	.byte	115
	.byte	44
	.byte	16
	.byte	-86
	.byte	120
	.byte	32
	.byte	84
	.byte	-94
	.byte	115
	.byte	32
	.byte	82
	.byte	-90
	.byte	89
	.byte	-83
	.byte	16
	.byte	-76
	.byte	84
	.byte	-90
	.byte	16
	.byte	-77
	.byte	120
	.byte	-81
	.byte	114
	.byte	-70
	.byte	16
	.byte	-81
	.byte	90
	.byte	9
	.byte	123
	.byte	-88
	.byte	81
	.byte	-76
	.byte	16
	.byte	-82
	.byte	85
	.byte	-89
	.byte	84
	.byte	-76
	.byte	16
	.byte	-95
	.byte	89
	.byte	32
	.byte	83
	.byte	-94
	.byte	92
	.byte	-84
	.byte	89
	.byte	-92
	.byte	16
	.byte	-93
	.byte	92
	.byte	-94
	.byte	115
	.byte	-77
	.byte	85
	.byte	-93
	.byte	16
	.byte	-93
	.byte	114
	.byte	-70
	.byte	112
	.byte	-76
	.byte	95
	.byte	-89
	.byte	114
	.byte	-94
	.byte	112
	.byte	-88
	.byte	117
	.byte	32
	.byte	-46
	.byte	64
	.byte	-88
	.byte	32
	.byte	120
	.byte	-88
	.byte	81
	.byte	-76
	.byte	16
	.byte	-86
	.byte	115
	.byte	44
	.byte	16
	.byte	-81
	.byte	90
	.byte	32
	.byte	93
	.byte	-90
	.byte	120
	.byte	-88
	.byte	95
	.byte	-92
	.byte	115
	.byte	32
	.byte	95
	.byte	-91
	.byte	6
	.byte	-90
	.byte	94
	.byte	-93
	.byte	114
	.byte	-70
	.byte	112
	.byte	-76
	.byte	85
	.byte	-81
	.byte	94
	.byte	32
	.byte	120
	.byte	-88
	.byte	81
	.byte	-76
	.byte	16
	.byte	-74
	.byte	115
	.byte	-90
	.byte	16
	.byte	-80
	.byte	89
	.byte	-83
	.byte	16
	.byte	-94
	.byte	94
	.byte	-92
	.byte	16
	.byte	-80
	.byte	81
	.byte	-80
	.byte	89
	.byte	-79
	.byte	28
	.byte	32
	.byte	95
	.byte	-79
	.byte	16
	.byte	-80
	.byte	89
	.byte	-79
	.byte	84
	.byte	-94
	.byte	112
	.byte	-77
	.byte	16
	.byte	-77
	.byte	85
	.byte	-82
	.byte	112
	.byte	-84
	.byte	89
	.byte	32
	.byte	93
	.byte	-90
	.byte	83
	.byte	-88
	.byte	81
	.byte	-83
	.byte	85
	.byte	-93
	.byte	81
	.byte	-84
	.byte	6
	.byte	-94
	.byte	85
	.byte	-92
	.byte	115
	.byte	45
	.byte	16
	.byte	-118
	.byte	94
	.byte	32
	.byte	120
	.byte	-88
	.byte	89
	.byte	32
	.byte	89
	.byte	-94
	.byte	114
	.byte	-84
	.byte	117
	.byte	32
	.byte	50
	.byte	48
	.byte	120
	.byte	-88
	.byte	16
	.byte	-93
	.byte	89
	.byte	-83
	.byte	120
	.byte	-74
	.byte	114
	.byte	-70
	.byte	28
	.byte	32
	.byte	120
	.byte	-88
	.byte	89
	.byte	32
	.byte	85
	.byte	-83
	.byte	122
	.byte	-90
	.byte	94
	.byte	-76
	.byte	85
	.byte	-81
	.byte	94
	.byte	32
	.byte	95
	.byte	-91
	.byte	16
	.byte	-93
	.byte	95
	.byte	-82
	.byte	112
	.byte	-84
	.byte	89
	.byte	-72
	.byte	16
	.byte	-82
	.byte	89
	.byte	-93
	.byte	84
	.byte	-94
	.byte	94
	.byte	-86
	.byte	83
	.byte	-94
	.byte	92
	.byte	9
	.byte	81
	.byte	-83
	.byte	88
	.byte	32
	.byte	89
	.byte	-84
	.byte	89
	.byte	-93
	.byte	120
	.byte	-79
	.byte	95
	.byte	-82
	.byte	89
	.byte	-93
	.byte	84
	.byte	-94
	.byte	94
	.byte	-86
	.byte	83
	.byte	-94
	.byte	92
	.byte	32
	.byte	93
	.byte	-94
	.byte	83
	.byte	-88
	.byte	85
	.byte	-83
	.byte	89
	.byte	-77
	.byte	28
	.byte	32
	.byte	115
	.byte	-74
	.byte	83
	.byte	-88
	.byte	16
	.byte	-94
	.byte	115
	.byte	32
	.byte	120
	.byte	-88
	.byte	89
	.byte	32
	.byte	73
	.byte	-83
	.byte	85
	.byte	-89
	.byte	93
	.byte	-94
	.byte	16
	.byte	-79
	.byte	95
	.byte	-76
	.byte	95
	.byte	-79
	.byte	16
	.byte	-82
	.byte	81
	.byte	-93
	.byte	84
	.byte	-86
	.byte	94
	.byte	-90
	.byte	28
	.byte	9
	.byte	112
	.byte	-79
	.byte	95
	.byte	-75
	.byte	85
	.byte	-92
	.byte	89
	.byte	-92
	.byte	16
	.byte	-82
	.byte	95
	.byte	-79
	.byte	89
	.byte	32
	.byte	115
	.byte	-81
	.byte	112
	.byte	-88
	.byte	85
	.byte	-77
	.byte	120
	.byte	-86
	.byte	83
	.byte	-94
	.byte	120
	.byte	-90
	.byte	88
	.byte	32
	.byte	81
	.byte	-83
	.byte	88
	.byte	32
	.byte	89
	.byte	-91
	.byte	90
	.byte	-86
	.byte	83
	.byte	-86
	.byte	89
	.byte	-83
	.byte	120
	.byte	32
	.byte	93
	.byte	-90
	.byte	81
	.byte	-83
	.byte	115
	.byte	32
	.byte	95
	.byte	-91
	.byte	16
	.byte	-90
	.byte	94
	.byte	-93
	.byte	114
	.byte	-70
	.byte	112
	.byte	-76
	.byte	85
	.byte	-81
	.byte	94
	.byte	59
	.byte	16
	.byte	-94
	.byte	94
	.byte	-92
	.byte	16
	.byte	-76
	.byte	84
	.byte	-90
	.byte	6
	.byte	-77
	.byte	121
	.byte	-95
	.byte	115
	.byte	-90
	.byte	113
	.byte	-74
	.byte	89
	.byte	-83
	.byte	120
	.byte	32
	.byte	85
	.byte	-83
	.byte	120
	.byte	-79
	.byte	95
	.byte	-92
	.byte	121
	.byte	-93
	.byte	120
	.byte	-86
	.byte	95
	.byte	-83
	.byte	16
	.byte	-81
	.byte	90
	.byte	32
	.byte	89
	.byte	-84
	.byte	89
	.byte	-93
	.byte	120
	.byte	-79
	.byte	95
	.byte	-83
	.byte	85
	.byte	-93
	.byte	115
	.byte	32
	.byte	81
	.byte	-83
	.byte	88
	.byte	32
	.byte	83
	.byte	-81
	.byte	93
	.byte	-80
	.byte	121
	.byte	-76
	.byte	85
	.byte	-83
	.byte	91
	.byte	32
	.byte	84
	.byte	-94
	.byte	115
	.byte	32
	.byte	81
	.byte	-84
	.byte	92
	.byte	-81
	.byte	123
	.byte	-90
	.byte	88
	.byte	9
	.byte	89
	.byte	-84
	.byte	81
	.byte	-95
	.byte	95
	.byte	-79
	.byte	81
	.byte	-76
	.byte	89
	.byte	32
	.byte	115
	.byte	-93
	.byte	84
	.byte	-90
	.byte	93
	.byte	-90
	.byte	115
	.byte	32
	.byte	95
	.byte	-91
	.byte	16
	.byte	-77
	.byte	120
	.byte	-86
	.byte	92
	.byte	-84
	.byte	16
	.byte	-89
	.byte	114
	.byte	-90
	.byte	81
	.byte	-76
	.byte	89
	.byte	-79
	.byte	16
	.byte	-93
	.byte	95
	.byte	-82
	.byte	112
	.byte	-84
	.byte	89
	.byte	-72
	.byte	85
	.byte	-76
	.byte	117
	.byte	44
	.byte	16
	.byte	-82
	.byte	95
	.byte	-77
	.byte	120
	.byte	32
	.byte	95
	.byte	-91
	.byte	16
	.byte	-73
	.byte	84
	.byte	-86
	.byte	83
	.byte	-88
	.byte	16
	.byte	-94
	.byte	114
	.byte	-90
	.byte	6
	.byte	-90
	.byte	94
	.byte	-76
	.byte	85
	.byte	-79
	.byte	89
	.byte	-84
	.byte	117
	.byte	32
	.byte	121
	.byte	-83
	.byte	115
	.byte	-74
	.byte	85
	.byte	-76
	.byte	89
	.byte	-92
	.byte	16
	.byte	-76
	.byte	95
	.byte	32
	.byte	112
	.byte	-90
	.byte	94
	.byte	32
	.byte	81
	.byte	-83
	.byte	88
	.byte	32
	.byte	112
	.byte	-94
	.byte	112
	.byte	-90
	.byte	114
	.byte	45
	.byte	6
	.byte	9
	.byte	76
	.byte	-81
	.byte	95
	.byte	-85
	.byte	115
	.byte	32
	.byte	92
	.byte	-86
	.byte	87
	.byte	-90
	.byte	16
	.byte	-82
	.byte	81
	.byte	-70
	.byte	82
	.byte	-90
	.byte	16
	.byte	-70
	.byte	95
	.byte	-74
	.byte	114
	.byte	32
	.byte	112
	.byte	-79
	.byte	95
	.byte	-89
	.byte	114
	.byte	-94
	.byte	93
	.byte	32
	.byte	123
	.byte	-81
	.byte	114
	.byte	-85
	.byte	115
	.byte	63
	.byte	6
	.byte	9
	.byte	54
	.byte	46
	.byte	21
	.byte	9
	.text
	.align	2
	.global	getchar
	.syntax unified
	.arm
	.fpu softvfp
	.type	getchar, %function
getchar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L9
	ldr	r3, [r3]
	cmp	r3, #704
	bls	.L7
	mvn	r3, #0
	b	.L8
.L7:
	ldr	r3, .L9
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r1, .L9
	str	r2, [r1]
	ldr	r2, .L9+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
.L8:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L10:
	.align	2
.L9:
	.word	pos.4212
	.word	data
	.size	getchar, .-getchar
	.syntax divided
	


@ ============================
@ Bill's glue logic for ARMsim
@ ============================
             .global _start
_start:      ldr   sp,=0x4000 @ Just in case
             bl    main
             swi   0x11 @ Halt

swi_print:   swi   0x69
             mov   pc, lr


	.section	.rodata
	.align	2
.LC0:
	.ascii	"There's not enough table settings!\012\000"
	.align	2
.LC1:
	.ascii	"Bad table setting!\012\000"
	.align	2
.LC2:
	.ascii	"The table settings are too long!\012\000"
	.arm
	.syntax unified
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, .L23
	mov	r2, #0
	str	r2, [r3]
	b	.L12
.L19:
	ldr	r3, .L23+4
	mov	r2, #0
	str	r2, [r3]
	b	.L13
.L18:
	bl	getchar
	mov	r1, r0
	ldr	r3, .L23
	ldr	r2, [r3]
	ldr	r3, .L23+4
	ldr	r3, [r3]
	and	r0, r1, #255
	ldr	r1, .L23+8
	lsl	r2, r2, #2
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, r0
	strb	r2, [r3]
	ldr	r3, .L23
	ldr	r2, [r3]
	ldr	r3, .L23+4
	ldr	r3, [r3]
	ldr	r1, .L23+8
	lsl	r2, r2, #2
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar
	ldr	r3, .L23
	ldr	r2, [r3]
	ldr	r3, .L23+4
	ldr	r3, [r3]
	ldr	r1, .L23+8
	lsl	r2, r2, #2
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #83
	beq	.L14
	ldr	r3, .L23
	ldr	r2, [r3]
	ldr	r3, .L23+4
	ldr	r3, [r3]
	ldr	r1, .L23+8
	lsl	r2, r2, #2
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #78
	beq	.L14
	ldr	r3, .L23
	ldr	r2, [r3]
	ldr	r3, .L23+4
	ldr	r3, [r3]
	ldr	r1, .L23+8
	lsl	r2, r2, #2
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L15
	ldr	r0, .L23+12
	bl	print
	b	.L16
.L15:
	ldr	r0, .L23+16
	bl	print
.L16:
	mov	r3, #1
	b	.L17
.L14:
	ldr	r3, .L23+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L23+4
	str	r3, [r2]
.L13:
	ldr	r3, .L23+4
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L18
	ldr	r3, .L23
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L23
	str	r3, [r2]
.L12:
	ldr	r3, .L23
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L19
	bl	getchar
	mov	r3, r0
	cmp	r3, #10
	beq	.L20
	ldr	r0, .L23+20
	bl	print
	mov	r3, #2
	b	.L17
.L20:
	mov	r0, #10
	bl	putchar
	b	.L21
.L22:
	ldr	r3, .L23+24
	ldr	r3, [r3]
	ldr	r1, .L23+8
	mov	r0, r3
	bl	encrypt
	mov	r3, r0
	mov	r0, r3
	bl	putchar
	ldr	r0, .L23+8
	bl	rotate
.L21:
	bl	getchar
	mov	r2, r0
	ldr	r3, .L23+24
	str	r2, [r3]
	ldr	r3, .L23+24
	ldr	r3, [r3]
	cmn	r3, #1
	bne	.L22
	mov	r3, #0
.L17:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	i.4217
	.word	j.4218
	.word	table
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	ch.4225
	.size	main, .-main
	.bss
	.align	2
out_ch.4207:
	.space	2
	.size	out_ch.4207, 2
	.align	2
pos.4212:
	.space	4
	.size	pos.4212, 4
	.align	2
i.4217:
	.space	4
	.size	i.4217, 4
	.align	2
j.4218:
	.space	4
	.size	j.4218, 4
	.align	2
ch.4225:
	.space	4
	.size	ch.4225, 4
	.ident	"GCC"

