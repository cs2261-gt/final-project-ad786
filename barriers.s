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
	.file	"barriers.c"
	.text
	.align	2
	.global	updateBarriers
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBarriers, %function
updateBarriers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r6, .L11
	mov	r7, r5
	mov	r4, r6
	mov	r2, #1
	ldr	fp, .L11+4
	ldr	r8, .L11+8
	ldr	r10, .L11+12
	ldr	r9, .L11+16
.L6:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L3
	ldr	r3, [r4]
	ldr	r1, [r4, #28]
	sub	r3, r3, r1
	cmp	r3, #90
	str	r3, [r4]
	beq	.L10
.L4:
	cmp	r3, #4
	strle	r7, [r4, #16]
.L3:
	cmp	r5, #3
	add	r4, r4, #32
	bne	.L6
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L10:
	mov	r0, #200
	umull	r3, r1, fp, r5
	bic	r3, r1, #1
	add	r3, r3, r1, lsr #1
	sub	r3, r5, r3
	add	r1, r6, r3, lsl #5
	str	r2, [r1, #16]
	str	r3, [r8]
	str	r0, [r6, r3, lsl #5]
	mov	lr, pc
	bx	r10
	smull	r3, r1, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r1, [r8]
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #18
	add	r1, r6, r1, lsl #5
	str	r3, [r1, #4]
	mov	r2, #1
	ldr	r3, [r4]
	b	.L4
.L12:
	.align	2
.L11:
	.word	barriers
	.word	-1431655765
	.word	barrierIndex
	.word	rand
	.word	1374389535
	.size	updateBarriers, .-updateBarriers
	.align	2
	.global	initBarriers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBarriers, %function
initBarriers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r9, .L17
	mov	r10, #0
	mov	r4, r9
	mov	r8, #200
	mov	r7, #25
	ldr	r6, .L17+4
	ldr	r5, .L17+8
.L14:
	str	r8, [r4]
	mov	lr, pc
	bx	r6
	mov	r1, #1
	mov	r2, #0
	mov	ip, #8
	smull	r3, lr, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #5
	add	r3, r3, r3, lsl #2
	str	r10, [r4, #24]
	sub	r0, r0, r3, lsl #4
	add	r10, r10, r1
	add	r0, r0, #16
	cmp	r10, #3
	stmib	r4, {r0, ip}
	str	r7, [r4, #12]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r1, [r4, #28]
	add	r4, r4, #32
	bne	.L14
	str	r1, [r9, #16]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	barriers
	.word	rand
	.word	1717986919
	.size	initBarriers, .-initBarriers
	.comm	barrierIndex,4,4
	.comm	barriers,96,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
