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
	.file	"soap.c"
	.text
	.align	2
	.global	cheatSoap
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	cheatSoap, %function
cheatSoap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #10
	mov	r2, #1
	ldr	r1, .L3
	ldr	r3, .L3+4
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	soapIndex
	.word	cheat
	.size	cheatSoap, .-cheatSoap
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
	ldr	r3, .L14
	add	r1, r3, #168
.L8:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L6
	ldr	r2, [r3, #4]
	cmp	r2, #204
	ldrle	r0, [r3, #16]
	addle	r2, r0, r2
	strle	r2, [r3, #4]
	strgt	ip, [r3, #20]
.L6:
	add	r3, r3, #28
	cmp	r3, r1
	bne	.L8
	bx	lr
.L15:
	.align	2
.L14:
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
	ldr	r0, .L27
	mov	r2, r0
	ldr	r1, [r2, #20]
	cmp	r1, #0
	mov	r3, #0
	beq	.L26
.L17:
	add	r3, r3, #1
	cmp	r3, #6
	add	r2, r2, #28
	bxeq	lr
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L17
.L26:
	mov	ip, #1
	ldr	r1, .L27+4
	ldr	r2, [r1]
	str	lr, [sp, #-4]!
	rsb	r3, r3, r3, lsl #3
	ldmib	r1, {r1, lr}
	add	lr, r1, lr
	asr	r2, r2, #8
	add	r1, r0, r3, lsl #2
	add	r2, r2, #2
	str	lr, [r1, #4]
	str	r2, [r0, r3, lsl #2]
	str	ip, [r1, #20]
	ldr	lr, [sp], #4
	bx	lr
.L28:
	.align	2
.L27:
	.word	soap
	.word	helicopter
	.size	fireSoap, .-fireSoap
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
	ldr	r3, .L33
.L30:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, #6
	stmib	r3, {r1, lr}
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3]
	add	r3, r3, #28
	bne	.L30
	ldr	lr, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	soap
	.size	initSoap, .-initSoap
	.comm	cheat,4,4
	.comm	soapCol,4,4
	.comm	soapIndex,4,4
	.comm	soap,168,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
