@ ============================================================
@ Just a quick demo to show you how you can test bits, set bits, etc.
@ ============================================================

		.text
		.global	_start
_start:		mov	r0, #0x08	@ 0x08 00001000
		mov	r1, #0x08	@ Flip bit 3 and ...
		mov	r2, #0x04	@ ... bit 2
		bl	flipper		@ 0x04 00000100

		mov	r0, #0x42	@ 0x42 01000010
		mov	r1, #0x80	@ Flip bit 7 and ...
		mov	r2, #0x02	@ ... bit 1
		bl	flipper		@ 0xc0 11000000

		mov	r0, #0x44	@ 0x44 01000100
		mov	r1, #0x40	@ Flip bit 6 and ...
		mov	r2, #0x04	@ ... bit 3
		bl	flipper		@ 0x44 01000100 - unscathed!

		swi	0x11		@ Stop


@ ============================================================
@ unsigned flipper( unsigned val, unsigned bit1, unsigned bit2 )
@ val  = a value that we want to swap bits in
@ bit1 = a value with one bit set corresponding to the first of the pair
@ bit2 = a value with one bit set corresponding to the second
@ See also: https://www.youtube.com/watch?v=YQRbTNN-jNE
@ ============================================================
flipper:	push	{r4}		@ Be a good citizen
		bic	r4, r0, r1	@ bic == bit clear
		bic	r4, r4, r2	@ R4 is now R0 with bit1 and bit2 off
		tst	r0, r1		@ Test bit1
		orrne	r4, r4, r2	@ If it's a 1, set the bit for bit2
		tst	r0, r2		@ Test bit2
		orrne	r4, r4, r1	@ If it's a 1, set the bit for bit1
		mov	r0, r4		@ Return value goes in R0
		pop	{r4}		@ Restore
		mov	pc, lr		@ Return
