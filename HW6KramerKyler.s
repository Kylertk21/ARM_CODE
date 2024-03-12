* ARM Program Framework
* by Dr. Weiying Zhu
	
	AREA	HW6, CODE, READONLY
	EXPORT	main		;required by the startup code
	ENTRY
<<<<<<< HEAD
main
=======
	
>>>>>>> d706acf9b0a9119b38e36be4588b823e42940b6c
	LDR R1, =HexStr
	MOV R2, #0x0
Start
	LDRB R5, [R1], #1
	CMP R5, #0
	BEQ DoneHexStr
	CMP R5, #'0'
	BLO DoneHexStr
	CMP R5, #'9'
	BHI NotADigit
	SUB R5, #'0'
	B Shift
NotADigit
	CMP R5, #'A'
	BLO DoneHexStr
	CMP R5, #'F'
	BHI DoneHexStr
	SUB R5, #'A'
	ADD R5, #10
Shift
	LSL R2, #4 
	ADD R2, R5
	B Start	

DoneHexStr
	LDR R3, =TwosComp
	STR R2, [R3]
	LDR R4, =DecStr
	LDR R3, =RvsDecStr
	TST R2, #0X80000000
	BEQ IsPos
	MOV R5, #'_'
	STRB R5, [R4], #1
	MVN R2, R2
	ADD R2, #1 
IsPos
	BL DivByTen
	ADD R2, #'0'
	STRB R2, [R3], #1
	MOV R2, R6
	CMP R2, #0
	BNE IsPos

DoneRvsDecStr
	LDR R7, =RvsDecStr
IsHi
	SUB R3, #1 
	LDRB R5, [R3]
	STRB R5, [R4], #1 
	CMP R3, R7
	BHI IsHi
	MOV R5, #0X0
	STRB R5, [R4]
	SVC #0X11 

DivByTen
	MOV R6, #0X0
IsLo
	CMP R2, #10
	BLO DoneDiv
	SUB R2, #10
	ADD R6, #1
	B IsLo
DoneDiv
	MOV PC, LR
	
	
	
	
	
	
	
	
	
	
	
	
	
	AREA	HW6Data, DATA, READWRITE
		

HexStr		DCB "A8F", 0 ;init HexStr with arbitrary value
TwosComp    DCD 0
DecStr		SPACE 12
RvsDecStr 	SPACE 11
	
adrHexStr		DCD HexStr
adrTwosComp		DCD	TwosComp
adrDecStr		DCD	DecStr
adrRvsDecStr	DCD	RvsDecStr
	
<<<<<<< HEAD
	EXPORT adrHexStr
	EXPORT adrTwosComp
	EXPORT adrDecStr
	EXPORT adrRvsDecStr
=======
EXPORT adrHexStr
EXPORT adrTwosComp
EXPORT adrDecStr
EXPORT adrRevDecStr
>>>>>>> d706acf9b0a9119b38e36be4588b823e42940b6c
	
	ALIGN

	END		; MUST be AFTER all CODE/DATA areas