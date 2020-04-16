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
	.global	updateSoap
	.arch armv4t
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
	ldr	r3, .L11
	add	r1, r3, #168
.L4:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L2
	ldr	r2, [r3, #4]
	cmp	r2, #204
	ldrle	r0, [r3, #16]
	addle	r2, r0, r2
	strle	r2, [r3, #4]
	strgt	ip, [r3, #20]
.L2:
	add	r3, r3, #28
	cmp	r3, r1
	bne	.L4
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r0, .L24
	mov	r2, r0
	ldr	r1, [r2, #20]
	cmp	r1, #0
	mov	r3, #0
	beq	.L23
.L14:
	add	r3, r3, #1
	cmp	r3, #6
	add	r2, r2, #28
	bxeq	lr
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L14
.L23:
	mov	ip, #1
	ldr	r1, .L24+4
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
.L25:
	.align	2
.L24:
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
	ldr	r3, .L30
.L27:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, #6
	stmib	r3, {r1, lr}
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3]
	add	r3, r3, #28
	bne	.L27
	ldr	lr, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	soap
	.size	initSoap, .-initSoap
	.comm	scoreRow,4,4
	.comm	soapCol,4,4
	.comm	soapIndex,4,4
	.comm	soap,168,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
