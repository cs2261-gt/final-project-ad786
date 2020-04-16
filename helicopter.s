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
	.file	"helicopter.c"
	.text
	.align	2
	.global	updateHelicopter
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHelicopter, %function
updateHelicopter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L44
	ldr	r1, .L44+4
	ldr	r3, [r8, #16]
	ldr	r2, [r8]
	ldr	r1, [r1]
	add	r2, r3, r2
	cmp	r1, r2, asr #8
	movle	r3, #0
	sub	sp, sp, #20
	ble	.L2
	ldr	r1, .L44+8
	ldr	r1, [r1]
	asr	r0, r2, #8
	cmp	r0, r1
	movlt	r3, #0
	lsllt	r1, r1, #8
	str	r2, [r8]
	strlt	r1, [r8]
.L2:
	ldr	r2, .L44+12
	ldrh	r2, [r2, #48]
	tst	r2, #64
	ldr	r2, .L44+16
	ldrh	r2, [r2]
	subeq	r3, r3, #46
	add	r3, r3, #22
	tst	r2, #1
	str	r3, [r8, #16]
	beq	.L4
	ldr	r3, .L44+20
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L40
.L4:
	ldr	r7, .L44+24
	mov	fp, #0
	mov	r5, r7
	ldr	r6, .L44+28
	ldr	r10, .L44+32
	add	r9, r7, #108
.L9:
	ldr	r4, .L44+36
.L8:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L6
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L41
.L6:
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L8
	add	r5, r5, #36
	cmp	r5, r9
	bne	.L9
	mov	r5, #1
	ldr	r4, .L44+32
	ldr	r6, .L44+40
.L10:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bne	.L42
.L12:
	add	r7, r7, #36
	cmp	r7, r9
	bne	.L10
	mov	r9, #1
	ldr	r4, .L44+44
	ldr	r6, .L44+32
	ldr	r7, .L44+40
	add	r5, r4, #96
.L17:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L43
.L15:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L17
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L41:
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	strne	fp, [r4, #20]
	strne	fp, [r5, #16]
	b	.L6
.L43:
	add	r0, r4, #8
	ldm	r0, {r0, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	ldr	r1, [r8]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldmib	r8, {r0, r2, r3}
	asr	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	strne	r9, [r7]
	b	.L15
.L42:
	add	r0, r7, #8
	ldm	r0, {r0, ip}
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	ldr	r1, [r8]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldmib	r8, {r0, r2, r3}
	asr	r1, r1, #8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	strne	r5, [r6]
	b	.L12
.L40:
	ldr	r4, .L44+48
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L4
	ldr	r3, .L44+52
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
	b	.L4
.L45:
	.align	2
.L44:
	.word	helicopter
	.word	bottomBoundary
	.word	topBoundary
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	coronavirus
	.word	soap+168
	.word	collision
	.word	soap
	.word	endGame
	.word	barriers
	.word	soapIndex
	.word	fireSoap
	.size	updateHelicopter, .-updateHelicopter
	.align	2
	.global	initHelicopter
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHelicopter, %function
initHelicopter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #15360
	mov	lr, #12
	mov	r0, #19
	mov	r1, #30
	mov	r2, #1
	ldr	r3, .L48
	stm	r3, {ip, lr}
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	helicopter
	.size	initHelicopter, .-initHelicopter
	.comm	endGame,4,4
	.comm	bottomBoundary,4,4
	.comm	topBoundary,4,4
	.comm	helicopter,20,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
