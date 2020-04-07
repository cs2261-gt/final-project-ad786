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
	.file	"game.c"
	.text
	.align	2
	.global	drawGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	ip, .L8
	ldr	r0, .L8+4
	mov	lr, #0
	mov	r7, ip
	mov	r2, r0
	mov	r6, #512
	mov	r5, #128
	ldr	r1, .L8+8
	ldr	r3, [r1, #4]
	ldr	r4, [r1]
	ldr	r1, .L8+12
	orr	r3, r3, ip
	strh	r3, [r1, #82]	@ movhi
	strh	lr, [r1, #84]	@ movhi
	strh	r4, [r1, #80]	@ movhi
	add	r4, r0, #84
.L4:
	ldr	r3, [r2, #16]
	cmp	r3, #0
	ldr	r3, [r2, #24]
	rsb	ip, r3, r3, lsl #3
	add	lr, r1, r3, lsl #3
	lsl	r8, r3, #3
	add	r9, r0, ip, lsl #2
	ldrne	r3, [r0, ip, lsl #2]
	ldrne	ip, [r9, #4]
	orrne	r3, r3, r7
	lsleq	r3, r3, #3
	add	r2, r2, #28
	strhne	r3, [lr, #2]	@ movhi
	strhne	ip, [r1, r8]	@ movhi
	strhne	r5, [lr, #4]	@ movhi
	strheq	r6, [r1, r3]	@ movhi
	cmp	r2, r4
	bne	.L4
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	-32768
	.word	barriers
	.word	helicopter
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	updateHelicopter
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHelicopter, %function
updateHelicopter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldreq	r2, .L13+4
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, .L13
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r2, .L13+4
	ldreq	r3, [r2]
	addeq	r3, r3, #1
	streq	r3, [r2]
	bx	lr
.L14:
	.align	2
.L13:
	.word	67109120
	.word	helicopter
	.size	updateHelicopter, .-updateHelicopter
	.align	2
	.global	drawHelicopter
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHelicopter, %function
drawHelicopter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L16
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r0, [r2]
	ldr	r2, .L16+4
	strh	r3, [r2, #82]	@ movhi
	strh	r0, [r2, #80]	@ movhi
	strh	r1, [r2, #84]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	helicopter
	.word	shadowOAM
	.size	drawHelicopter, .-drawHelicopter
	.align	2
	.global	drawBarriers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBarriers, %function
drawBarriers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L24
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r2, r1
	mov	r7, #512
	mov	r6, #128
	ldr	ip, .L24+4
	ldr	r5, .L24+8
	add	r4, r1, #84
.L21:
	ldr	r3, [r2, #16]
	cmp	r3, #0
	ldr	r3, [r2, #24]
	rsb	r0, r3, r3, lsl #3
	add	lr, ip, r3, lsl #3
	lsl	r8, r3, #3
	add	r9, r1, r0, lsl #2
	ldrne	r3, [r1, r0, lsl #2]
	ldrne	r0, [r9, #4]
	orrne	r3, r3, r5
	lsleq	r3, r3, #3
	add	r2, r2, #28
	strhne	r3, [lr, #2]	@ movhi
	strhne	r0, [ip, r8]	@ movhi
	strhne	r6, [lr, #4]	@ movhi
	strheq	r7, [ip, r3]	@ movhi
	cmp	r2, r4
	bne	.L21
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	barriers
	.word	shadowOAM
	.word	-32768
	.size	drawBarriers, .-drawBarriers
	.align	2
	.global	updateBarriers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBarriers, %function
updateBarriers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, lr}
	mov	r4, r0
	ldr	lr, .L39
	ldr	r3, .L39+4
	ldr	r1, [lr]
	add	ip, r3, #84
.L29:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldr	r2, [r3]
	subne	r2, r2, #1
	strne	r2, [r3]
	cmp	r2, #49
	movle	r0, #1
	strle	r4, [r3, #16]
	add	r3, r3, #28
	addle	r1, r1, r0
	cmp	r3, ip
	bne	.L29
	cmp	r0, #0
	strne	r1, [lr]
	pop	{r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	barrierIndex
	.word	barriers
	.size	updateBarriers, .-updateBarriers
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateHelicopter
	bl	updateBarriers
	mov	r1, #67108864
	ldr	r2, .L43
	ldr	r0, .L43+4
	ldr	r3, [r2]
	ldrh	r0, [r0]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	strh	r0, [r1, #16]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
	.word	barrierTimer
	.word	hOff
	.size	updateGame, .-updateGame
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
	@ link register save eliminated.
	mov	r2, #32
	mov	r0, #30
	mov	r1, #80
	ldr	r3, .L46
	str	r0, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	bx	lr
.L47:
	.align	2
.L46:
	.word	helicopter
	.size	initHelicopter, .-initHelicopter
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
	ldr	r7, .L52
	mov	r9, #0
	mov	r8, r7
	mov	r6, #200
	mov	r10, #32
	ldr	r5, .L52+4
	ldr	r4, .L52+8
.L49:
	str	r6, [r8]
	mov	lr, pc
	bx	r5
	mov	r2, #0
	smull	r3, r1, r4, r0
	asr	r3, r0, #31
	add	r1, r1, r0
	rsb	r3, r3, r1, asr #6
	rsb	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #4
	str	r9, [r8, #24]
	sub	r3, r0, r3
	add	r9, r9, #1
	add	r3, r3, #20
	cmp	r9, #3
	stmib	r8, {r3, r10}
	str	r10, [r8, #12]
	str	r2, [r8, #16]
	str	r2, [r8, #20]
	add	r8, r8, #28
	bne	.L49
	mov	r3, #1
	str	r3, [r7, #16]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	barriers
	.word	rand
	.word	-1677082467
	.size	initBarriers, .-initBarriers
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	str	lr, [sp, #-4]!
	mov	lr, #28
	mov	r2, #32
	mov	r0, #30
	mov	r1, #80
	ldr	ip, .L56
	str	r3, [ip]
	ldr	ip, .L56+4
	str	r3, [ip]
	ldr	ip, .L56+8
	ldr	r3, .L56+12
	str	lr, [ip]
	ldr	lr, [sp], #4
	str	r0, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	b	initBarriers
.L57:
	.align	2
.L56:
	.word	hOff
	.word	playerHOff
	.word	screenBlock
	.word	helicopter
	.size	initGame, .-initGame
	.comm	playerHOff,4,4
	.comm	screenBlock,4,4
	.comm	hOff,4,4
	.comm	barrierIndex,4,4
	.comm	barrierTimer,4,4
	.comm	coronavirus,20,4
	.comm	barriers,84,4
	.comm	soap,144,4
	.comm	helicopter,16,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
