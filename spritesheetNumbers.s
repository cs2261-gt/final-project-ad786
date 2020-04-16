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
	.file	"spritesheetNumbers.c"
	.text
	.global	spritesheetNumbersPal
	.global	spritesheetNumbersTiles
	.section	.rodata
	.align	2
	.type	spritesheetNumbersPal, %object
	.size	spritesheetNumbersPal, 512
spritesheetNumbersPal:
	.space	512
	.type	spritesheetNumbersTiles, %object
	.size	spritesheetNumbersTiles, 32768
spritesheetNumbersTiles:
	.space	32768
	.ident	"GCC: (devkitARM release 53) 9.1.0"
