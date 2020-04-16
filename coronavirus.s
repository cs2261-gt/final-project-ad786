	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"coronavirus.c"
	.text
	.align	2
	.global	updateCoronavirus
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoronavirus, %function
updateCoronavirus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r7, .L31
	mov	r9, r5
	mov	r6, r7
	mov	r1, #1
	ldr	r4, .L31+4
	ldr	r8, .L31+8
	ldr	r10, .L31+12
	ldr	fp, .L31+16
.L9:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	mov	ip, r5
	add	r5, r5, #1
	beq	.L2
	ldr	r0, [r4, #32]
	ldr	r2, [r4, #4]
	ldr	lr, [r4]
	ldr	r3, [r4, #28]
	add	r2, r0, r2
	sub	r3, lr, r3
	sub	lr, r2, #16
	cmp	lr, #104
	rsbhi	r0, r0, #0
	strhi	r0, [r4, #32]
	cmp	r3, #4
	str	r2, [r4, #4]
	str	r3, [r4]
	strle	r9, [r4, #16]
	bgt	.L5
.L2:
	ldr	r3, [r8]
	cmp	r3, #100
	beq	.L28
.L5:
	cmp	r5, #3
	add	r4, r4, #36
	add	r6, r6, #32
	bne	.L9
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L28:
	add	ip, ip, #2
	umull	r3, r2, r10, ip
	umull	r0, r3, r10, r5
	bic	r0, r2, #1
	add	r0, r0, r2, lsr #1
	ldr	r2, [r6, #16]
	cmp	r2, #0
	bic	r2, r3, #1
	add	r3, r2, r3, lsr #1
	str	r1, [r4, #16]
	sub	ip, ip, r0
	sub	r3, r5, r3
	bne	.L29
.L6:
	add	r2, r7, r3, lsl #5
	ldr	r2, [r2, #16]
	cmp	r2, #0
	beq	.L8
	ldr	r3, [r7, r3, lsl #5]
	sub	r2, r3, #111
	cmp	r2, #108
	bls	.L26
.L8:
	add	r3, r7, ip, lsl #5
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L30
.L13:
	mov	r3, #240
.L7:
	str	r3, [r4]
	mov	lr, pc
	bx	fp
	ldr	r2, .L31+20
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #4
	sub	r3, r0, r3
	add	r3, r3, #16
	mov	r1, #1
	str	r9, [r8]
	str	r3, [r4, #4]
	b	.L5
.L29:
	ldr	r2, [r6]
	sub	r0, r2, #111
	cmp	r0, #108
	bhi	.L6
	ldr	r3, [r4, #8]
	add	r3, r2, r3
	b	.L7
.L30:
	ldr	r3, [r7, ip, lsl #5]
	sub	r2, r3, #111
	cmp	r2, #108
	bhi	.L13
.L26:
	ldr	r2, [r4, #8]
	add	r3, r3, r2
	b	.L7
.L32:
	.align	2
.L31:
	.word	barriers
	.word	coronavirus
	.word	coronaTimer
	.word	-1431655765
	.word	rand
	.word	1616928865
	.size	updateCoronavirus, .-updateCoronavirus
	.align	2
	.global	initCoronavirus
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoronavirus, %function
initCoronavirus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #0
	ldr	r9, .L37
	mov	r8, r10
	mov	r4, r9
	mov	r7, #220
	ldr	r6, .L37+4
	ldr	r5, .L37+8
.L34:
	str	r7, [r4]
	mov	lr, pc
	bx	r6
	mov	r2, #1
	mov	r1, #25
	smull	r3, ip, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #5
	add	r3, r3, r3, lsl #2
	str	r10, [r4, #24]
	sub	r0, r0, r3, lsl #4
	add	r10, r10, r2
	add	r0, r0, #16
	cmp	r10, #3
	str	r8, [r4, #16]
	str	r0, [r4, #4]
	str	r2, [r4, #28]
	str	r2, [r4, #32]
	str	r1, [r4, #12]
	str	r1, [r4, #8]
	add	r4, r4, #36
	bne	.L34
	str	r2, [r9, #16]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	coronavirus
	.word	rand
	.word	1717986919
	.size	initCoronavirus, .-initCoronavirus
	.comm	coronaTimer,4,4
	.comm	coronaIndex,4,4
	.comm	coronavirus,108,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
