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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L32
	ldrh	r3, [r3, #48]
	tst	r3, #64
	sub	sp, sp, #20
	bne	.L2
	ldr	r2, .L32+4
	ldr	r3, [r2]
	cmp	r3, #18
	subgt	r3, r3, #1
	strgt	r3, [r2]
.L2:
	ldr	r3, .L32
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L3
	ldr	r2, .L32+4
	ldr	r3, [r2]
	cmp	r3, #124
	addle	r3, r3, #1
	strle	r3, [r2]
.L3:
	ldr	r3, .L32+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L4
	ldr	r3, .L32+12
	ldrh	r3, [r3]
	ands	r3, r3, #1
	beq	.L29
.L4:
	mov	r9, #0
	ldr	r5, .L32+16
	ldr	r6, .L32+20
	ldr	r8, .L32+24
	add	r7, r5, #108
.L11:
	ldr	r4, .L32+28
.L10:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L30
.L8:
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L10
	add	r5, r5, #36
	cmp	r5, r7
	bne	.L11
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L30:
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	strne	r9, [r4, #20]
	strne	r9, [r5, #16]
	b	.L8
.L29:
	ldr	r0, .L32+28
	mov	r2, r0
.L6:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L31
	add	r3, r3, #1
	cmp	r3, #6
	add	r2, r2, #28
	bne	.L6
	b	.L4
.L31:
	mov	ip, #1
	ldr	r1, .L32+4
	ldr	r2, [r1]
	rsb	r3, r3, r3, lsl #3
	ldmib	r1, {r1, lr}
	add	lr, r1, lr
	add	r2, r2, #2
	add	r1, r0, r3, lsl #2
	str	r2, [r0, r3, lsl #2]
	str	lr, [r1, #4]
	str	ip, [r1, #20]
	b	.L4
.L33:
	.align	2
.L32:
	.word	67109120
	.word	helicopter
	.word	oldButtons
	.word	buttons
	.word	coronavirus
	.word	soap+168
	.word	collision
	.word	soap
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
	ldr	r2, .L35
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r0, [r2]
	ldr	r2, .L35+4
	strh	r3, [r2, #82]	@ movhi
	strh	r0, [r2, #80]	@ movhi
	strh	r1, [r2, #84]	@ movhi
	bx	lr
.L36:
	.align	2
.L35:
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
	ldr	r3, .L43
	ldr	r1, .L43+4
	ldr	r5, .L43+8
	add	lr, r3, #96
.L40:
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
	bne	.L40
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L44:
	.align	2
.L43:
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r6, .L54
	mov	r7, r5
	mov	r4, r6
	mov	r2, #1
	ldr	fp, .L54+4
	ldr	r8, .L54+8
	ldr	r10, .L54+12
	ldr	r9, .L54+16
.L50:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L47
	ldr	r3, [r4]
	ldr	r1, [r4, #28]
	sub	r3, r3, r1
	cmp	r3, #110
	str	r3, [r4]
	beq	.L53
.L48:
	cmp	r3, #4
	strle	r7, [r4, #16]
.L47:
	cmp	r5, #3
	add	r4, r4, #32
	bne	.L50
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L53:
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
	add	r3, r3, #16
	add	r1, r6, r1, lsl #5
	str	r3, [r1, #4]
	mov	r2, #1
	ldr	r3, [r4]
	b	.L48
.L55:
	.align	2
.L54:
	.word	barriers
	.word	-1431655765
	.word	barrierIndex
	.word	rand
	.word	1374389535
	.size	updateBarriers, .-updateBarriers
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
	ldr	r3, .L62
	ldr	r1, .L62+4
	ldr	r4, .L62+8
	ldr	lr, .L62+12
	add	ip, r3, #108
.L59:
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
	bne	.L59
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	coronavirus
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawCoronavirus, .-drawCoronavirus
	.align	2
	.global	updateCoronavirus
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
	ldr	r8, .L93
	mov	r9, r5
	mov	r6, r8
	mov	r1, #1
	ldr	r4, .L93+4
	ldr	r7, .L93+8
	ldr	fp, .L93+12
	ldr	r10, .L93+16
.L72:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	mov	ip, r5
	add	r5, r5, #1
	beq	.L65
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
	bgt	.L68
.L65:
	ldr	r3, [r7]
	cmp	r3, #100
	beq	.L92
.L68:
	cmp	r5, #3
	add	r4, r4, #36
	add	r6, r6, #32
	bne	.L72
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L92:
	ldr	r3, [r6, #16]
	cmp	r3, #0
	str	r1, [r4, #16]
	beq	.L69
	ldr	r3, [r6]
	cmp	r3, #110
	ble	.L69
.L91:
	ldr	r2, [r4, #8]
	add	r3, r3, r2
.L70:
	str	r3, [r4]
	mov	lr, pc
	bx	fp
	ldr	r2, .L93+20
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #16
	mov	r1, #1
	str	r9, [r7]
	str	r0, [r4, #4]
	b	.L68
.L69:
	umull	r3, r2, r10, r5
	bic	r3, r2, #1
	add	r3, r3, r2, lsr #1
	sub	r3, r5, r3
	add	r2, r8, r3, lsl #5
	ldr	r2, [r2, #16]
	cmp	r2, #0
	beq	.L71
	ldr	r3, [r8, r3, lsl #5]
	cmp	r3, #110
	bgt	.L91
.L71:
	add	ip, ip, #2
	umull	r3, r2, r10, ip
	bic	r3, r2, #1
	add	r3, r3, r2, lsr #1
	sub	ip, ip, r3
	add	r3, r8, ip, lsl #5
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L70
	ldr	r3, [r8, ip, lsl #5]
	cmp	r3, #110
	movle	r3, #0
	ble	.L70
	b	.L91
.L94:
	.align	2
.L93:
	.word	barriers
	.word	coronavirus
	.word	coronaTimer
	.word	rand
	.word	-1431655765
	.word	1717986919
	.size	updateCoronavirus, .-updateCoronavirus
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
	ldr	r2, .L104
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	str	r3, [r2]
	bl	updateCoronavirus
	bl	updateBarriers
	mov	ip, #0
	ldr	r3, .L104+4
	add	r1, r3, #168
.L98:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L96
	ldr	r2, [r3, #4]
	cmp	r2, #204
	ldrle	r0, [r3, #16]
	addle	r2, r0, r2
	strle	r2, [r3, #4]
	strgt	ip, [r3, #20]
.L96:
	add	r3, r3, #28
	cmp	r3, r1
	bne	.L98
	pop	{r4, lr}
	b	updateHelicopter
.L105:
	.align	2
.L104:
	.word	coronaTimer
	.word	soap
	.size	updateGame, .-updateGame
	.align	2
	.global	updateSoap
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSoap, %function
updateSoap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, .L115
	add	r1, r3, #168
.L109:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L107
	ldr	r2, [r3, #4]
	cmp	r2, #204
	ldrle	r0, [r3, #16]
	addle	r2, r0, r2
	strle	r2, [r3, #4]
	strgt	ip, [r3, #20]
.L107:
	add	r3, r3, #28
	cmp	r3, r1
	bne	.L109
	bx	lr
.L116:
	.align	2
.L115:
	.word	soap
	.size	updateSoap, .-updateSoap
	.align	2
	.global	fireSoap
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireSoap, %function
fireSoap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L128
	mov	r2, r0
	ldr	r1, [r2, #20]
	cmp	r1, #0
	mov	r3, #0
	beq	.L127
.L118:
	add	r3, r3, #1
	cmp	r3, #6
	add	r2, r2, #28
	bxeq	lr
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L118
.L127:
	mov	ip, #1
	ldr	r1, .L128+4
	ldr	r2, [r1]
	str	lr, [sp, #-4]!
	rsb	r3, r3, r3, lsl #3
	ldmib	r1, {r1, lr}
	add	lr, r1, lr
	add	r2, r2, #2
	add	r1, r0, r3, lsl #2
	str	lr, [r1, #4]
	str	r2, [r0, r3, lsl #2]
	str	ip, [r1, #20]
	ldr	lr, [sp], #4
	bx	lr
.L129:
	.align	2
.L128:
	.word	soap
	.word	helicopter
	.size	fireSoap, .-fireSoap
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
	ldr	r2, .L136
	ldr	r1, .L136+4
	ldr	r4, .L136+8
	add	lr, r2, #168
.L133:
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
	cmp	r2, lr
	bne	.L133
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	soap
	.word	shadowOAM
	.word	-32768
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
	mov	r0, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #512
	mov	r4, #128
	ldr	r1, .L144
	ldr	r3, .L144+4
	ldr	r2, [r1, #4]
	ldr	ip, [r1]
	ldr	r1, .L144+8
	orr	r2, r2, r3
	mov	r6, r3
	ldr	r3, .L144+12
	strh	ip, [r1, #80]	@ movhi
	strh	r2, [r1, #82]	@ movhi
	strh	r0, [r1, #84]	@ movhi
	add	lr, r3, #96
.L141:
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
	bne	.L141
	bl	drawSoap
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCoronavirus
.L145:
	.align	2
.L144:
	.word	helicopter
	.word	-32768
	.word	shadowOAM
	.word	barriers
	.size	drawGame, .-drawGame
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
	mov	ip, #12
	mov	r0, #80
	mov	r1, #19
	mov	r2, #30
	ldr	r3, .L147
	stm	r3, {r0, ip}
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	bx	lr
.L148:
	.align	2
.L147:
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
	ldr	r9, .L153
	mov	r10, #0
	mov	r4, r9
	mov	r8, #200
	mov	r7, #25
	ldr	r6, .L153+4
	ldr	r5, .L153+8
.L150:
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
	bne	.L150
	str	r1, [r9, #16]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L154:
	.align	2
.L153:
	.word	barriers
	.word	rand
	.word	1717986919
	.size	initBarriers, .-initBarriers
	.align	2
	.global	initSoap
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSoap, %function
initSoap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	str	lr, [sp, #-4]!
	mov	r1, r2
	mov	lr, #26
	mov	ip, #13
	mov	r0, #2
	ldr	r3, .L159
.L156:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, #6
	stmib	r3, {r1, lr}
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3]
	add	r3, r3, #28
	bne	.L156
	ldr	lr, [sp], #4
	bx	lr
.L160:
	.align	2
.L159:
	.word	soap
	.size	initSoap, .-initSoap
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
	ldr	r9, .L165
	mov	r8, r10
	mov	r4, r9
	mov	r7, #220
	ldr	r6, .L165+4
	ldr	r5, .L165+8
.L162:
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
	bne	.L162
	str	r2, [r9, #16]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L166:
	.align	2
.L165:
	.word	coronavirus
	.word	rand
	.word	1717986919
	.size	initCoronavirus, .-initCoronavirus
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
	push	{r4, lr}
	mov	r4, #0
	mov	ip, #12
	mov	r1, #19
	mov	r2, #30
	mov	r0, #80
	ldr	r3, .L171
	ldr	lr, .L171+4
	str	r4, [r3]
	ldr	r3, .L171+8
	str	r4, [lr]
	stm	r3, {r0, ip}
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	bl	initBarriers
	mov	r2, r4
	mov	lr, #26
	mov	r1, r4
	mov	ip, #13
	mov	r0, #2
	ldr	r3, .L171+12
.L168:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, #6
	stmib	r3, {r1, lr}
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3]
	add	r3, r3, #28
	bne	.L168
	pop	{r4, lr}
	b	initCoronavirus
.L172:
	.align	2
.L171:
	.word	barrierIndex
	.word	coronaTimer
	.word	helicopter
	.word	soap
	.size	initGame, .-initGame
	.comm	coronaTimer,4,4
	.comm	coronaIndex,4,4
	.comm	barrierIndex,4,4
	.comm	coronavirus,108,4
	.comm	barriers,96,4
	.comm	soap,168,4
	.comm	helicopter,16,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
