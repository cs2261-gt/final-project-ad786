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
	ldr	r5, .L55
	ldr	r1, .L55+4
	ldr	r3, [r5, #16]
	ldr	r2, [r5]
	ldr	r1, [r1]
	add	r2, r3, r2
	cmp	r1, r2, asr #8
	movle	r3, #0
	sub	sp, sp, #20
	ble	.L2
	ldr	r1, .L55+8
	ldr	r1, [r1]
	asr	r0, r2, #8
	cmp	r0, r1
	movlt	r3, #0
	lsllt	r1, r1, #8
	str	r2, [r5]
	strlt	r1, [r5]
.L2:
	ldr	r2, .L55+12
	ldr	r4, .L55+16
	ldrh	r2, [r2, #48]
	tst	r2, #64
	ldrh	r2, [r4]
	subeq	r3, r3, #46
	add	r3, r3, #22
	tst	r2, #1
	str	r3, [r5, #16]
	beq	.L6
	ldr	r6, .L55+20
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L50
.L6:
	ldr	r4, .L55+24
	mov	fp, #0
	mov	r8, r4
	ldr	r9, .L55+28
	ldr	r10, .L55+32
	add	r6, r4, #108
.L11:
	ldr	r7, .L55+36
.L10:
	ldr	r3, [r8, #16]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L51
.L8:
	add	r7, r7, #28
	cmp	r7, r9
	bne	.L10
	add	r8, r8, #36
	cmp	r8, r6
	bne	.L11
	ldr	r7, .L55+32
	ldr	fp, .L55+40
	ldr	r10, .L55+44
	ldr	r9, .L55+48
	ldr	r8, .L55+52
.L12:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L52
.L14:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L12
	ldr	r4, .L55+56
	ldr	r7, .L55+32
	ldr	fp, .L55+40
	ldr	r10, .L55+44
	ldr	r9, .L55+48
	ldr	r8, .L55+52
	add	r6, r4, #96
.L19:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L53
.L17:
	add	r4, r4, #32
	cmp	r6, r4
	bne	.L19
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L51:
	ldr	r0, [r8, #12]
	ldr	r1, [r8, #8]
	ldr	r2, [r8, #4]
	ldr	r3, [r8]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r7, #8
	ldm	r2, {r2, r3}
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	strne	fp, [r7, #20]
	strne	fp, [r8, #16]
	b	.L8
.L53:
	add	r0, r4, #8
	ldm	r0, {r0, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	ldr	r1, [r5]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldmib	r5, {r0, r2, r3}
	asr	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L17
	mov	r3, #1
	mov	r2, #0
	str	r3, [fp]
	str	r2, [r5, #16]
	mov	lr, pc
	bx	r10
	mov	r2, #0
	mov	r1, r9
	mov	r0, r8
	ldr	r3, .L55+60
	mov	lr, pc
	bx	r3
	b	.L17
.L52:
	add	r0, r4, #8
	ldm	r0, {r0, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	ldr	r1, [r5]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldmib	r5, {r0, r2, r3}
	asr	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L14
	mov	r3, #1
	mov	r2, #0
	str	r3, [fp]
	str	r2, [r5, #16]
	mov	lr, pc
	bx	r10
	mov	r2, #0
	mov	r1, r9
	mov	r0, r8
	ldr	r3, .L55+60
	mov	lr, pc
	bx	r3
	b	.L14
.L50:
	ldr	r8, .L55+64
	ldr	r3, [r8]
	cmp	r3, #0
	ldr	r7, .L55+68
	ble	.L5
	ldr	r2, [r7]
	cmp	r2, #0
	beq	.L54
.L5:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L6
	mov	r2, #0
	ldr	r1, .L55+72
	ldr	r0, .L55+76
	ldr	r3, .L55+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+84
	mov	lr, pc
	bx	r3
	b	.L6
.L54:
	ldr	r1, .L55+72
	ldr	r0, .L55+76
	ldr	r3, .L55+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+84
	mov	lr, pc
	bx	r3
	ldr	r3, [r8]
	ldrh	r2, [r4]
	sub	r3, r3, #1
	tst	r2, #1
	str	r3, [r8]
	beq	.L6
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L5
	b	.L6
.L56:
	.align	2
.L55:
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
	.word	end
	.word	stopSound
	.word	140883
	.word	loseSong
	.word	barriers
	.word	playSoundA
	.word	soapIndex
	.word	cheat
	.word	1998
	.word	shoot
	.word	playSoundB
	.word	fireSoap
	.size	updateHelicopter, .-updateHelicopter
	.align	2
	.global	endScene
	.syntax unified
	.arm
	.fpu softvfp
	.type	endScene, %function
endScene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L59
	ldr	r3, [r2, #16]
	ldr	r0, [r2]
	add	r1, r3, #15
	add	r3, r3, r0
	add	r0, r3, r1
	cmp	r0, #37376
	str	r3, [r2]
	str	r1, [r2, #16]
	movge	r2, #1
	ldrge	r3, .L59+4
	strge	r2, [r3]
	bx	lr
.L60:
	.align	2
.L59:
	.word	helicopter
	.word	endGame
	.size	endScene, .-endScene
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
	push	{r4, lr}
	mov	ip, #19
	mov	r4, #12
	mov	lr, #15360
	mov	r0, #30
	mov	r1, #1
	mov	r2, #0
	ldr	r3, .L63
	str	r4, [r3, #4]
	str	lr, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #8]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	helicopter
	.size	initHelicopter, .-initHelicopter
	.comm	end,4,4
	.comm	endGame,4,4
	.comm	bottomBoundary,4,4
	.comm	topBoundary,4,4
	.comm	helicopter,24,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
