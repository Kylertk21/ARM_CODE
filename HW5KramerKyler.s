* ARM Program Framework
* by Dr. Weiying Zhu
MAX_LEN EQU 100
	
	AREA	ARMex, CODE, READONLY
	EXPORT	main		;required by the startup code
	ENTRY

main	
	LDR R1, =str1
	LDR R2, =str2
	LDR R3, =mixStr

start
	LDRB R4, [R1], #1
	CBZ R4, DoneStrOne
	STRB R4, [R3], #1
	LDRB R4, [R2], #1
	CBZ R4, DoneStrTwo
	STRB R4, [R3], #1
	B start
DoneStrOne
	LDRB R4, [R2], #1
	CBZ R4, DoneBoth
	STRB R4, [R3], #1
	B DoneStrOne
DoneStrTwo
	LDRB R4, [R1], #1
	CBZ R4, DoneBoth
	STRB R4, [R3], #1
	B DoneStrTwo
DoneBoth
	STRB R4, [R3]
	SVC #0x11
	
	AREA	ARMexData, DATA, READWRITE
		
	EXPORT	adrStr1		;only needed for display in memory-window
	EXPORT	adrStr2		;only needed for display in memory-window
	EXPORT 	adrmixStr
	
adrStr1		DCD	str1	;only needed for display in memory-window
adrStr2		DCD	str2	;only needed for display in memory-window
adrmixStr	DCD mixStr

str1	DCB	"Hello world!", 0	; the str one
str2	DCB	"This is the 2nd string in this program", 0	; the str one
mixStr SPACE MAX_LEN +1
	
	ALIGN

	END		; MUST be AFTER all CODE/DATA areas

