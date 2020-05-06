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
	ldr	r7, .L4
	mov	r4, #8
	str	r3, [r7]
	ldr	r7, .L4+4
	mov	r2, #217
	str	r3, [r7]
	ldr	r7, .L4+8
	mov	r0, #66
	str	r3, [r7]
	ldr	r7, .L4+12
	mov	lr, #146
	str	r3, [r7]
	mov	ip, #57
	mov	r1, #48
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
	ldr	r7, .L4+36
	str	r3, [r7]
	ldr	r7, .L4+40
	str	r3, [r7]
	ldr	r7, .L4+44
	str	r3, [r7]
	ldr	r7, .L4+48
	str	r3, [r7]
	ldr	r7, .L4+52
	str	r3, [r7]
	ldr	r3, .L4+56
	str	r6, [r3]
	ldr	r3, .L4+60
	str	r5, [r3]
	ldr	r3, .L4+64
	str	r4, [r3]
	ldr	r3, .L4+68
	str	r2, [r3]
	ldr	r2, .L4+72
	ldr	r3, .L4+76
	str	r0, [r2]
	ldr	r0, .L4+80
	ldr	r2, .L4+84
	str	lr, [r3]
	ldr	r3, .L4+88
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+92
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+96
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+100
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	endGame
	.word	end
	.word	barrierIndex
	.word	coronaTimer
	.word	onesIndex
	.word	tensIndex
	.word	hundIndex
	.word	scoreTimer
	.word	scoreTimer2
	.word	scoreTimer3
	.word	helicopterTimer
	.word	barrierTimer
	.word	coronavirusTimer
	.word	cheat
	.word	topBoundary
	.word	bottomBoundary
	.word	soapIndex
	.word	soapCol
	.word	onesCol
	.word	scoreRow
	.word	tensCol
	.word	hundCol
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L15
	ldr	r3, [r5]
	ldr	r2, .L15+4
	add	r3, r3, #1
	str	r3, [r5]
	ldr	r3, [r2]
	ldr	r1, .L15+8
	ldr	r4, .L15+12
	add	r3, r3, #1
	str	r3, [r2]
	ldr	r2, [r1]
	ldr	lr, .L15+16
	ldr	r3, [r4]
	ldr	ip, .L15+20
	ldr	r0, .L15+24
	add	r2, r2, #1
	str	r2, [r1]
	add	r3, r3, #1
	ldr	r1, [lr]
	ldr	r2, [ip]
	str	r3, [r4]
	ldr	r3, [r0]
	add	r1, r1, #1
	str	r1, [lr]
	add	r2, r2, #1
	ldr	r1, .L15+28
	add	r3, r3, #1
	str	r3, [r0]
	str	r2, [ip]
	mov	lr, pc
	bx	r1
	ldr	r3, .L15+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	updateScore
.L16:
	.align	2
.L15:
	.word	coronaTimer
	.word	scoreTimer
	.word	scoreTimer2
	.word	scoreTimer3
	.word	helicopterTimer
	.word	barrierTimer
	.word	coronavirusTimer
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
	.global	displayScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	displayScore, %function
displayScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	ip, #68
	ldr	r8, .L26
	ldr	r7, .L26+4
	ldr	r3, [r8]
	ldr	r2, .L26+8
	ldr	r5, [r7]
	smull	r0, r1, r2, r3
	ldr	r6, .L26+12
	smull	r0, r9, r2, r5
	ldr	r4, [r6]
	smull	r0, r2, r4, r2
	asr	r0, r3, #31
	rsb	r0, r0, r1, asr #2
	asr	r1, r5, #31
	rsb	r1, r1, r9, asr #2
	add	r1, r1, r1, lsl #2
	sub	r1, r5, r1, lsl #1
	asr	r5, r4, #31
	ldr	lr, .L26+16
	rsb	r2, r5, r2, asr #2
	add	r0, r0, r0, lsl #2
	sub	r0, r3, r0, lsl #1
	add	r2, r2, r2, lsl #2
	ldr	r3, .L26+20
	sub	r2, r4, r2, lsl #1
	ldr	r4, [lr, r0, lsl #2]
	str	r0, [r8]
	add	r0, r3, #324
	strh	r4, [r0]	@ movhi
	ldr	r0, [lr, r1, lsl #2]
	ldr	r5, [lr, r2, lsl #2]
	str	r1, [r7]
	add	r1, r3, #332
	strh	r0, [r1]	@ movhi
	ldr	r4, .L26+24
	ldr	lr, .L26+28
	str	r2, [r6]
	ldr	r0, .L26+32
	add	r2, r3, #340
	strh	r5, [r2]	@ movhi
	add	r1, r3, #320
	add	r2, r3, #328
	add	r3, r3, #336
	strh	r4, [r1, #2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	onesIndex
	.word	tensIndex
	.word	1717986919
	.word	hundIndex
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-32602
	.word	-32611
	.word	-32620
	.size	displayScore, .-displayScore
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
	ldr	r2, .L32
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	push	{r4, lr}
	ldr	lr, .L32+4
	ldr	r1, .L32+8
	ldr	r0, [r2]
	ldr	ip, [r2, #20]
	ldr	r4, [lr]
	strh	r3, [r1, #82]	@ movhi
	asr	r0, r0, #8
	add	r3, ip, #640
	cmp	r4, #15
	strh	r0, [r1, #80]	@ movhi
	strh	r3, [r1, #84]	@ movhi
	bne	.L28
	mov	r3, #0
	cmp	ip, #7
	addle	ip, ip, #4
	str	r3, [lr]
	strle	ip, [r2, #20]
	strgt	r3, [r2, #20]
.L28:
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	helicopter
	.word	helicopterTimer
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
	ldr	r1, .L47
	push	{r4, r5, r6, r7, lr}
	mov	r3, r1
	mov	r6, #512
	ldr	r0, .L47+4
	ldr	r5, .L47+8
	add	r4, r1, #96
.L37:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldrne	lr, [r3]
	ldr	r2, [r3, #24]
	orrne	lr, lr, r5
	add	ip, r0, r2, lsl #3
	lsl	r7, r2, #3
	ldrne	r2, [r3, #20]
	strhne	lr, [ip, #2]	@ movhi
	ldrne	lr, [r3, #4]
	addne	r2, r2, #128
	lsleq	r2, r2, #3
	add	r3, r3, #32
	strhne	r2, [ip, #4]	@ movhi
	strhne	lr, [r0, r7]	@ movhi
	strheq	r6, [r0, r2]	@ movhi
	cmp	r3, r4
	bne	.L37
	ldr	r3, .L47+12
	ldr	r2, [r3]
	cmp	r2, #20
	beq	.L46
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L46:
	mov	r2, #0
	str	r2, [r3]
.L40:
	ldr	r3, [r1, #20]
	cmp	r3, #15
	movgt	r3, #0
	addle	r3, r3, #4
	str	r3, [r1, #20]
	add	r1, r1, #32
	cmp	r1, r4
	bne	.L40
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	barriers
	.word	shadowOAM
	.word	-32768
	.word	barrierTimer
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
	ldr	r1, .L62
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, r1
	mov	r6, #512
	ldr	r0, .L62+4
	ldr	r5, .L62+8
	ldr	r4, .L62+12
	add	lr, r1, #108
.L52:
	ldr	ip, [r3, #16]
	ldr	r2, [r3, #24]
	cmp	ip, #0
	add	r2, r2, #25
	add	ip, r0, r2, lsl #3
	lsl	r7, r2, #3
	ldrne	r2, [r3]
	andne	r2, r2, r5
	orrne	r2, r2, r4
	ldrbne	r8, [r3, #4]	@ zero_extendqisi2
	strhne	r2, [ip, #2]	@ movhi
	ldrne	r2, [r3, #20]
	lsleq	r2, r2, #3
	add	r3, r3, #36
	strhne	r8, [r0, r7]	@ movhi
	strhne	r2, [ip, #4]	@ movhi
	strheq	r6, [r0, r2]	@ movhi
	cmp	r3, lr
	bne	.L52
	ldr	r3, .L62+16
	ldr	r2, [r3]
	cmp	r2, #20
	beq	.L61
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L61:
	mov	r2, #0
	str	r2, [r3]
.L55:
	ldr	r3, [r1, #20]
	cmp	r3, #15
	movgt	r3, #4
	addle	r3, r3, #4
	str	r3, [r1, #20]
	add	r1, r1, #36
	cmp	r1, lr
	bne	.L55
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	coronavirus
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	coronavirusTimer
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
	ldr	r2, .L71
	ldr	r1, .L71+4
	ldr	r4, .L71+8
	add	lr, r2, #168
.L67:
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
	bne	.L67
	ldr	r3, .L71+12
	ldr	r3, [r3]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, .L71+16
	ldr	r2, [r0]
	ldr	r1, .L71+20
	cmp	r2, #0
	strh	r3, [r1, #2]	@ movhi
	movlt	r3, #0
	movlt	r2, r3
	ldr	ip, .L71+24
	ldr	ip, [ip]
	strh	ip, [r1]	@ movhi
	ldr	r1, .L71+28
	strlt	r3, [r0]
	ldr	r2, [r1, r2, lsl #2]
	ldr	r3, .L71+32
	pop	{r4, r5, r6, r7, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L72:
	.align	2
.L71:
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
	push	{r4, lr}
	bl	drawHelicopter
	bl	drawBarriers
	bl	drawSoap
	bl	drawCoronavirus
	pop	{r4, lr}
	b	drawScore
	.size	drawGame, .-drawGame
	.align	2
	.global	drawPauseScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPauseScreen, %function
drawPauseScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #120
	push	{r4, r5, r6, r7, lr}
	mov	r6, #640
	mov	r5, #130
	mov	r4, #264
	mov	lr, #272
	mov	ip, #110
	mov	r0, #268
	ldr	r3, .L77
	ldr	r7, .L77+4
	add	r2, r3, #480
	strh	r1, [r2]	@ movhi
	strh	r7, [r2, #2]	@ movhi
	add	r2, r3, #496
	strh	r1, [r2]	@ movhi
	ldr	r1, .L77+8
	strh	r1, [r2, #2]	@ movhi
	add	r2, r3, #484
	strh	r6, [r2]	@ movhi
	add	r1, r1, #25
	add	r2, r3, #488
	strh	r5, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	add	r2, r3, #492
	strh	r4, [r2]	@ movhi
	add	r2, r3, #500
	strh	lr, [r2]	@ movhi
	add	r1, r1, #10
	add	r2, r3, #504
	add	r3, r3, #508
	strh	ip, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	shadowOAM
	.word	-32678
	.word	-32603
	.size	drawPauseScreen, .-drawPauseScreen
	.comm	coronavirusTimer,4,4
	.comm	barrierTimer,4,4
	.comm	helicopterTimer,4,4
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
	.size	sprite_tile_index, 44
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
	.word	260
	.ident	"GCC: (devkitARM release 53) 9.1.0"
