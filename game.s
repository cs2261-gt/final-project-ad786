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
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #17
	mov	r5, #125
	mov	r4, #6
	mov	r2, #217
	mov	r0, #66
	mov	lr, #146
	mov	ip, #56
	mov	r1, #46
	ldr	r7, .L4
	str	r3, [r7]
	ldr	r7, .L4+4
	str	r3, [r7]
	ldr	r7, .L4+8
	str	r3, [r7]
	ldr	r7, .L4+12
	str	r3, [r7]
	ldr	r7, .L4+16
	str	r3, [r7]
	ldr	r7, .L4+20
	str	r3, [r7]
	ldr	r7, .L4+24
	str	r3, [r7]
	ldr	r7, .L4+28
	str	r3, [r7]
	ldr	r7, .L4+32
	str	r3, [r7]
	ldr	r3, .L4+36
	str	r6, [r3]
	ldr	r3, .L4+40
	str	r5, [r3]
	ldr	r3, .L4+44
	str	r4, [r3]
	ldr	r3, .L4+48
	str	r2, [r3]
	ldr	r2, .L4+52
	ldr	r3, .L4+56
	str	r0, [r2]
	ldr	r2, .L4+60
	ldr	r0, .L4+64
	str	lr, [r3]
	ldr	r3, .L4+68
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+76
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+80
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	endGame
	.word	barrierIndex
	.word	coronaTimer
	.word	onesIndex
	.word	tensIndex
	.word	hundIndex
	.word	scoreTimer
	.word	scoreTimer2
	.word	scoreTimer3
	.word	topBoundary
	.word	bottomBoundary
	.word	soapIndex
	.word	soapCol
	.word	onesCol
	.word	scoreRow
	.word	hundCol
	.word	tensCol
	.word	initHelicopter
	.word	initBarriers
	.word	initSoap
	.word	initCoronavirus
	.size	initGame, .-initGame
	.align	2
	.global	updateScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScore, %function
updateScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L11
	ldr	r3, [r1]
	cmp	r3, #70
	push	{r4, lr}
	bne	.L7
	mov	lr, #0
	ldr	ip, .L11+4
	ldr	r2, .L11+8
	ldr	r3, [ip]
	smull	r4, r0, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r0, asr #2
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r2, lsl #1
	add	r3, r3, #1
	str	r3, [ip]
	str	lr, [r1]
.L7:
	ldr	r1, .L11+12
	ldr	r3, [r1]
	cmp	r3, #700
	bne	.L8
	mov	lr, #0
	ldr	ip, .L11+16
	ldr	r2, .L11+8
	ldr	r3, [ip]
	smull	r4, r0, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r0, asr #2
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r2, lsl #1
	add	r3, r3, #1
	str	r3, [ip]
	str	lr, [r1]
.L8:
	ldr	r1, .L11+20
	ldr	r3, .L11+24
	ldr	r2, [r1]
	cmp	r2, r3
	bne	.L6
	mov	lr, #0
	ldr	ip, .L11+28
	ldr	r2, .L11+8
	ldr	r3, [ip]
	smull	r4, r0, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r0, asr #2
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r2, lsl #1
	add	r3, r3, #1
	str	r3, [ip]
	str	lr, [r1]
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	scoreTimer
	.word	onesIndex
	.word	1717986919
	.word	scoreTimer2
	.word	tensIndex
	.word	scoreTimer3
	.word	7000
	.word	hundIndex
	.size	updateScore, .-updateScore
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
	ldr	r4, .L15
	ldr	lr, .L15+4
	ldr	r3, [r4]
	ldr	ip, .L15+8
	ldr	r0, .L15+12
	ldr	r1, [lr]
	add	r3, r3, #1
	ldr	r2, [ip]
	str	r3, [r4]
	ldr	r3, [r0]
	add	r1, r1, #1
	str	r1, [lr]
	add	r2, r2, #1
	ldr	r1, .L15+16
	add	r3, r3, #1
	str	r2, [ip]
	str	r3, [r0]
	mov	lr, pc
	bx	r1
	ldr	r3, .L15+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	updateScore
.L16:
	.align	2
.L15:
	.word	coronaTimer
	.word	scoreTimer
	.word	scoreTimer2
	.word	scoreTimer3
	.word	updateCoronavirus
	.word	updateBarriers
	.word	updateSoap
	.word	updateHelicopter
	.size	updateGame, .-updateGame
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r3, [r3]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	push	{r4, r5, r6, lr}
	ldr	r4, .L22+4
	ldr	ip, [r4]
	ldr	r2, .L22+8
	cmp	ip, #10
	strh	r3, [r2, #2]	@ movhi
	moveq	r3, #0
	moveq	ip, r3
	streq	r3, [r4]
	ldr	r3, .L22+12
	ldr	r3, [r3]
	mvn	r3, r3, lsl #17
	ldr	lr, .L22+16
	ldr	r1, .L22+20
	ldrh	r0, [r1]
	mov	r1, lr
	mvn	r3, r3, lsr #17
	ldr	r5, .L22+24
	strh	r0, [r2]	@ movhi
	ldr	r2, .L22+28
	ldr	r6, [r2, ip, lsl #2]
	ldr	ip, [r5]
	strh	r0, [r1, #4]!	@ movhi
	cmp	ip, #10
	strh	r3, [r1, #2]	@ movhi
	moveq	r3, #0
	moveq	ip, r3
	streq	r3, [r5]
	ldr	r3, .L22+32
	ldr	r3, [r3]
	mvn	r3, r3, lsl #17
	strh	r6, [lr]	@ movhi
	ldr	lr, .L22+36
	mov	r1, lr
	mvn	r3, r3, lsr #17
	ldr	r6, [r2, ip, lsl #2]
	ldr	ip, .L22+40
	strh	r0, [r1, #4]!	@ movhi
	ldr	r0, [ip]
	cmp	r0, #10
	strh	r3, [r1, #2]	@ movhi
	moveq	r3, #0
	moveq	r0, r3
	streq	r3, [r5]
	streq	r3, [r4]
	streq	r3, [ip]
	ldr	r2, [r2, r0, lsl #2]
	ldr	r3, .L22+44
	strh	r6, [lr]	@ movhi
	strh	r2, [r3]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	onesCol
	.word	onesIndex
	.word	shadowOAM+320
	.word	tensCol
	.word	shadowOAM+324
	.word	scoreRow
	.word	tensIndex
	.word	.LANCHOR0
	.word	hundCol
	.word	shadowOAM+332
	.word	hundIndex
	.word	shadowOAM+340
	.size	drawScore, .-drawScore
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
	ldr	r2, .L25
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r0, #0
	mvn	r3, r3, lsr #17
	ldr	r1, [r2]
	ldr	r2, .L25+4
	asr	r1, r1, #8
	strh	r3, [r2, #82]	@ movhi
	strh	r1, [r2, #80]	@ movhi
	strh	r0, [r2, #84]	@ movhi
	bx	lr
.L26:
	.align	2
.L25:
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
	push	{r4, r5, r6, r7, lr}
	mov	r7, #512
	mov	r6, #128
	ldr	r3, .L33
	ldr	r1, .L33+4
	ldr	r5, .L33+8
	add	lr, r3, #96
.L30:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldr	r2, [r3, #24]
	add	r0, r1, r2, lsl #3
	lsl	ip, r2, #3
	ldmne	r3, {r2, r4}
	lsleq	r2, r2, #3
	orrne	r2, r2, r5
	add	r3, r3, #32
	strhne	r6, [r0, #4]	@ movhi
	strhne	r2, [r0, #2]	@ movhi
	strhne	r4, [r1, ip]	@ movhi
	strheq	r7, [r1, r2]	@ movhi
	cmp	r3, lr
	bne	.L30
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	barriers
	.word	shadowOAM
	.word	-32768
	.size	drawBarriers, .-drawBarriers
	.align	2
	.global	drawCoronavirus
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoronavirus, %function
drawCoronavirus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #512
	mov	r5, #4
	ldr	r3, .L41
	ldr	r1, .L41+4
	ldr	r4, .L41+8
	ldr	lr, .L41+12
	add	ip, r3, #108
.L38:
	ldr	r0, [r3, #16]
	ldr	r2, [r3, #24]
	cmp	r0, #0
	add	r2, r2, #25
	add	r0, r1, r2, lsl #3
	lsl	r7, r2, #3
	ldrne	r2, [r3]
	ldrbne	r8, [r3, #4]	@ zero_extendqisi2
	andne	r2, r2, r4
	orrne	r2, r2, lr
	lsleq	r2, r2, #3
	add	r3, r3, #36
	strhne	r5, [r0, #4]	@ movhi
	strhne	r2, [r0, #2]	@ movhi
	strhne	r8, [r1, r7]	@ movhi
	strheq	r6, [r1, r2]	@ movhi
	cmp	r3, ip
	bne	.L38
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	coronavirus
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawCoronavirus, .-drawCoronavirus
	.align	2
	.global	drawSoap
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSoap, %function
drawSoap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, #512
	mov	r5, #256
	ldr	r2, .L50
	ldr	r1, .L50+4
	ldr	r4, .L50+8
	add	lr, r2, #168
.L46:
	add	r0, r2, #20
	ldm	r0, {r0, r3}
	cmp	r0, #0
	add	r3, r3, #15
	add	r0, r1, r3, lsl #3
	lsl	ip, r3, #3
	ldrne	r3, [r2, #4]
	ldrne	r7, [r2]
	orrne	r3, r3, r4
	lsleq	r3, r3, #3
	add	r2, r2, #28
	strhne	r5, [r0, #4]	@ movhi
	strhne	r3, [r0, #2]	@ movhi
	strhne	r7, [r1, ip]	@ movhi
	strheq	r6, [r1, r3]	@ movhi
	cmp	lr, r2
	bne	.L46
	ldr	r3, .L50+12
	ldr	r3, [r3]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, .L50+16
	ldr	r2, [r0]
	ldr	r1, .L50+20
	cmp	r2, #0
	strh	r3, [r1, #2]	@ movhi
	movlt	r3, #0
	movlt	r2, r3
	ldr	ip, .L50+24
	ldr	ip, [ip]
	strh	ip, [r1]	@ movhi
	ldr	r1, .L50+28
	strlt	r3, [r0]
	ldr	r2, [r1, r2, lsl #2]
	ldr	r3, .L50+32
	pop	{r4, r5, r6, r7, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L51:
	.align	2
.L50:
	.word	soap
	.word	shadowOAM
	.word	-32768
	.word	soapCol
	.word	soapIndex
	.word	shadowOAM+400
	.word	scoreRow
	.word	.LANCHOR0
	.word	shadowOAM+404
	.size	drawSoap, .-drawSoap
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L58
	mov	ip, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	mov	r5, #512
	mov	r4, #128
	ldr	r2, .L58+4
	ldr	r3, [r2]
	ldr	r1, .L58+8
	ldr	r2, [r2, #4]
	asr	r3, r3, #8
	strh	r3, [r1, #80]	@ movhi
	orr	r2, r2, r0
	ldr	r3, .L58+12
	strh	r2, [r1, #82]	@ movhi
	strh	ip, [r1, #84]	@ movhi
	add	lr, r3, #96
.L55:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldr	r2, [r3, #24]
	add	r0, r1, r2, lsl #3
	lsl	ip, r2, #3
	ldmne	r3, {r2, r7}
	lsleq	r2, r2, #3
	orrne	r2, r2, r6
	add	r3, r3, #32
	strhne	r4, [r0, #4]	@ movhi
	strhne	r2, [r0, #2]	@ movhi
	strhne	r7, [r1, ip]	@ movhi
	strheq	r5, [r1, r2]	@ movhi
	cmp	r3, lr
	bne	.L55
	bl	drawSoap
	bl	drawCoronavirus
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawScore
.L59:
	.align	2
.L58:
	.word	-32768
	.word	helicopter
	.word	shadowOAM
	.word	barriers
	.size	drawGame, .-drawGame
	.comm	scoreTimer3,4,4
	.comm	scoreTimer2,4,4
	.comm	scoreTimer,4,4
	.comm	hundIndex,4,4
	.comm	tensIndex,4,4
	.comm	onesIndex,4,4
	.comm	hundCol,4,4
	.comm	tensCol,4,4
	.comm	onesCol,4,4
	.comm	scoreRow,4,4
	.global	sprite_tile_index
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sprite_tile_index, %object
	.size	sprite_tile_index, 40
sprite_tile_index:
	.word	384
	.word	388
	.word	392
	.word	396
	.word	400
	.word	512
	.word	516
	.word	520
	.word	524
	.word	528
	.ident	"GCC: (devkitARM release 53) 9.1.0"
