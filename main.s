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
	mov	r3, #3344
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L4+28
	ldr	r1, .L4+32
	ldr	r0, .L4+36
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+40
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
	.word	playSoundA
	.word	354039
	.word	startSong
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
	ldr	r2, .L8+24
	mov	r0, #3
	ldr	r1, .L8+28
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+36
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+40
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
	.word	setupInterrupts
	.word	setupSounds
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
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, lr}
	ldr	r1, .L17
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L17+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L10
	ldr	r3, .L17+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
.L10:
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L17+16
	ldr	r0, .L17+20
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L18:
	.align	2
.L17:
	.word	displayScore
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	354039
	.word	startSong
	.word	playSoundA
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
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r4, .L21+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L21+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L21+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L21+16
	ldr	r1, .L21+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L21+24
	mov	r0, #3
	ldr	r1, .L21+28
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L21+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	instructionsPal
	.word	6928
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
	mov	r2, #67108864
	mov	r1, #4864
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L25
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L25+4
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L25+8
	ldr	r1, .L25+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L25+16
	ldr	r1, .L25+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+24
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L25+32
	mov	r0, #3
	ldr	r1, .L25+36
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
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
	mov	r2, #67108864
	mov	r1, #0
	push	{r4, r5, r6, lr}
	ldr	r4, .L39
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	ldr	r5, .L39+4
	strh	r1, [r2, #16]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L38
.L27:
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	ldr	r3, .L39+12
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r3, .L39+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L37:
	ldr	r3, .L39+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L39+28
	ldr	r0, .L39+32
	ldr	r3, .L39+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+16
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r5]
	b	.L28
.L40:
	.align	2
.L39:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	pauseSound
	.word	srand
	.word	initGame
	.word	stopSound
	.word	738104
	.word	gameSong
	.word	playSoundA
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
	ldr	r4, .L53
	strh	r2, [r3, #20]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L42
	ldr	r2, .L53+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L51
.L42:
	tst	r3, #8
	beq	.L41
	ldr	r3, .L53+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L52
.L41:
	pop	{r4, lr}
	bx	lr
.L52:
	ldr	r3, .L53+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L53+12
	ldr	r0, .L53+16
	ldr	r3, .L53+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L51:
	ldr	r3, .L53+24
	mov	lr, pc
	bx	r3
	bl	goToStart
	ldrh	r3, [r4]
	b	.L42
.L54:
	.align	2
.L53:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	738104
	.word	gameSong
	.word	playSoundA
	.word	unpauseSound
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
	push	{r4, lr}
	ldr	r4, .L69
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L56
	ldr	r2, .L69+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L67
.L56:
	tst	r3, #4
	beq	.L57
	ldr	r3, .L69+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L68
.L57:
	ldr	r3, .L69+8
	ldr	r2, .L69+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldrh	r3, [r2]
	subeq	r3, r3, #1
	lsleq	r3, r3, #16
	lsreq	r3, r3, #16
	strheq	r3, [r2]	@ movhi
	ldr	r1, .L69+8
	ldrh	r1, [r1, #48]
	tst	r1, #16
	addeq	r3, r3, #1
	lsleq	r3, r3, #16
	lsreq	r3, r3, #16
	strheq	r3, [r2]	@ movhi
	mov	r2, #67108864
	lsr	r1, r3, #1
	strh	r3, [r2, #16]	@ movhi
	ldr	r3, .L69+16
	strh	r1, [r2, #20]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L68:
	ldr	r3, .L69+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L69+24
	ldr	r0, .L69+28
	ldr	r3, .L69+32
	mov	lr, pc
	bx	r3
	bl	goToStart
	b	.L57
.L67:
	ldr	r3, .L69+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+36
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L56
.L70:
	.align	2
.L69:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	hOff
	.word	waitForVBlank
	.word	stopSound
	.word	354039
	.word	startSong
	.word	playSoundA
	.word	unpauseSound
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L73
	mov	lr, pc
	bx	r5
	ldr	r3, .L73+4
	ldr	r4, .L73+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L73+12
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	mov	r1, #4864
	mov	r3, #3920
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	ldr	r2, .L73+16
	ldr	r1, .L73+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L73+24
	ldr	r1, .L73+28
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L73+32
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L73+36
	ldr	r1, .L73+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L73+44
	ldr	r1, .L73+48
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r2, #3
	ldr	r1, .L73+52
	ldr	r3, .L73+56
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	hideSprites
	.word	drawPauseScreen
	.word	DMANow
	.word	shadowOAM
	.word	100679680
	.word	pausebg1Tiles
	.word	100724736
	.word	pausebg1Map
	.word	pausePal
	.word	5456
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.word	hOff
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
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L77+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L77+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L77+24
	mov	lr, pc
	bx	r4
	mov	r3, #2256
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L77+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L77+32
	mov	r0, #3
	ldr	r1, .L77+36
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L77+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L78:
	.align	2
.L77:
	.word	unpauseSound
	.word	hideSprites
	.word	displayScore
	.word	waitForVBlank
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
	ldr	r3, .L98
	push	{r4, r5, r6, lr}
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L80
	ldr	r3, .L98+4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldr	r1, .L98+8
	strh	r4, [r2, #16]	@ movhi
	ldrh	r3, [r1]
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #20]	@ movhi
.L81:
	ldr	r3, .L98+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L98+16
	ldr	r3, .L98+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L98+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L98+28
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L82
	ldr	r3, .L98+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L95
.L82:
	ldr	r3, .L98+36
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L96
.L83:
	ldrh	r3, [r4]
	tst	r3, #512
	beq	.L79
	tst	r3, #256
	beq	.L79
	ldr	r3, .L98+32
	ldrh	r3, [r3]
	tst	r3, #768
	beq	.L97
.L79:
	pop	{r4, r5, r6, lr}
	bx	lr
.L80:
	ldr	r3, .L98+40
	mov	lr, pc
	bx	r3
	b	.L81
.L96:
	ldr	r3, .L98+44
	mov	lr, pc
	bx	r3
	bl	goToLose
	b	.L83
.L95:
	ldr	r3, .L98+44
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L98+48
	ldr	r0, .L98+52
	ldr	r3, .L98+56
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L82
.L97:
	ldr	r3, .L98+60
	mov	lr, pc
	bx	r3
	b	.L79
.L99:
	.align	2
.L98:
	.word	end
	.word	updateGame
	.word	hOff
	.word	drawGame
	.word	oldButtons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	buttons
	.word	endGame
	.word	endScene
	.word	pauseSound
	.word	617606
	.word	pauseSong
	.word	playSoundB
	.word	cheatSoap
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
	ldr	r3, .L112
	mov	lr, pc
	bx	r3
	ldr	r6, .L112+4
	ldr	r7, .L112+8
	ldr	r5, .L112+12
	ldr	fp, .L112+16
	ldr	r10, .L112+20
	ldr	r9, .L112+24
	ldr	r8, .L112+28
	ldr	r4, .L112+32
.L101:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L102:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L102
.L104:
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L105
	.word	.L103
.L103:
	ldr	r3, .L112+36
	mov	lr, pc
	bx	r3
	b	.L101
.L105:
	mov	lr, pc
	bx	r8
	b	.L101
.L106:
	mov	lr, pc
	bx	r9
	b	.L101
.L107:
	mov	lr, pc
	bx	r10
	b	.L101
.L108:
	mov	lr, pc
	bx	fp
	b	.L101
.L113:
	.align	2
.L112:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	pause
	.word	67109120
	.word	lose
	.size	main, .-main
	.comm	seed,4,4
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
