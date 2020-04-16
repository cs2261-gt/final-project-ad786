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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #768
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+20
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	startPal
	.word	startTiles
	.word	100720640
	.word	startMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #7168
	mov	r1, #4352
	ldr	r2, .L8
	push	{r4, r5, r6, lr}
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r5, .L8+4
	mov	lr, pc
	bx	r5
	ldr	r4, .L8+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L8+24
	mov	r0, #3
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L8+32
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	7684
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hOff
	.size	initialize, .-initialize
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L15
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	ldrh	r3, [r1]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L15+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L16:
	.align	2
.L15:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldr	r4, .L19+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L19+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L19+12
	mov	lr, pc
	bx	r4
	mov	r3, #1440
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L19+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L19+20
	mov	r0, #3
	ldr	r1, .L19+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L19+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	instructionsPal
	.word	instructionsTiles
	.word	100720640
	.word	instructionsMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L23
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L23+4
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L23+8
	ldr	r1, .L23+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L23+16
	ldr	r1, .L23+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L23+24
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L23+32
	mov	r0, #3
	ldr	r1, .L23+36
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L23+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	DMANow
	.word	gameBack1Pal
	.word	100679680
	.word	gameBack1Tiles
	.word	100724736
	.word	gameBack1Map
	.word	gameBackgroundPal
	.word	gameBackgroundTiles
	.word	100720640
	.word	gameBackgroundMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r4, .L37
	ldr	r0, [r4]
	add	r0, r0, #1
	str	r0, [r4]
	ldr	r5, .L37+4
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L26
	ldr	r2, .L37+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L35
.L26:
	tst	r3, #4
	beq	.L25
	ldr	r3, .L37+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L36
.L25:
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	ldr	r0, [r4]
	ldr	r3, .L37+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L35:
	ldr	r3, .L37+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r5]
	b	.L26
.L38:
	.align	2
.L37:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	ldr	r4, .L51
	strh	r2, [r3, #20]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L40
	ldr	r2, .L51+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L49
.L40:
	tst	r3, #8
	beq	.L39
	ldr	r3, .L51+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L39:
	pop	{r4, lr}
	bx	lr
.L50:
	pop	{r4, lr}
	b	goToGame
.L49:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L40
.L52:
	.align	2
.L51:
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	ldr	r4, .L65
	strh	r2, [r3, #20]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L54
	ldr	r2, .L65+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L63
.L54:
	tst	r3, #4
	beq	.L53
	ldr	r3, .L65+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L64
.L53:
	pop	{r4, lr}
	bx	lr
.L64:
	pop	{r4, lr}
	b	goToStart
.L63:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L54
.L66:
	.align	2
.L65:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L69+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L69+12
	mov	lr, pc
	bx	r4
	mov	r3, #944
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L69+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L69+20
	mov	r0, #3
	ldr	r1, .L69+24
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L69+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L70:
	.align	2
.L69:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pausePal
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L73
	mov	lr, pc
	bx	r3
	ldr	r4, .L73+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L73+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L73+12
	mov	lr, pc
	bx	r4
	mov	r3, #880
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L73+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L73+20
	mov	r0, #3
	ldr	r1, .L73+24
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L73+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L74:
	.align	2
.L73:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	losePal
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L84+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L84+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #0
	ldr	r1, .L84+20
	strh	r3, [r2, #16]	@ movhi
	ldrh	r3, [r1]
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r1]	@ movhi
	ldr	r1, .L84+24
	strh	r3, [r2, #20]	@ movhi
	ldrh	r3, [r1]
	tst	r3, #8
	beq	.L76
	ldr	r3, .L84+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
.L76:
	ldr	r3, .L84+32
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L83
	pop	{r4, lr}
	bx	lr
.L83:
	pop	{r4, lr}
	b	goToLose
.L82:
	bl	goToPause
	b	.L76
.L85:
	.align	2
.L84:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	endGame
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	mov	r8, #67108864
	mov	r7, #0
	ldr	r6, .L99
	ldr	r9, .L99+4
	ldr	r3, .L99+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L99+12
	ldr	r1, [r6]
	ldrh	r3, [r9]
	ldr	fp, .L99+16
	ldr	r10, .L99+20
	ldr	r5, .L99+24
.L88:
	strh	r3, [r4]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r9]	@ movhi
	cmp	r1, #4
	ldrls	pc, [pc, r1, asl #2]
	b	.L88
.L90:
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L89
.L89:
	strh	r7, [r8, #16]	@ movhi
	strh	r7, [r8, #20]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #8
	ldrh	r3, [r9]
	beq	.L88
	tst	r3, #8
	bne	.L88
	ldr	r3, .L99+28
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldrh	r3, [r9]
	b	.L88
.L91:
	ldr	r3, .L99+32
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldrh	r3, [r9]
	b	.L88
.L93:
	mov	lr, pc
	bx	r10
	ldr	r1, [r6]
	ldrh	r3, [r9]
	b	.L88
.L94:
	mov	lr, pc
	bx	fp
	ldr	r1, [r6]
	ldrh	r3, [r9]
	b	.L88
.L92:
	ldr	r3, .L99+36
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldrh	r3, [r9]
	b	.L88
.L100:
	.align	2
.L99:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	67109120
	.word	goToStart
	.word	pause
	.word	game
	.size	main, .-main
	.comm	seed,4,4
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
