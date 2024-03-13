* ARM Program Framework
* by Dr. Weiying Zhu
MAX_LEN EQU 100
	
	AREA	HW7, CODE, READONLY
	EXPORT	main		;required by the startup code
	ENTRY

main	
	LDR R1, =HCode-1
	MOV R2, #1
	MOV R3, #0 
Start
	LDRB R4, [R1, R2]
	CMP R4, #0
	BEQ IsBitZero
	CMP R4, 1
	BNE DoneErrDet
	EOR R3, R3, R2
IsBitZero
	ADD R2, #1
	B Start
DoneErrDet
	CMP R3, #0
	BEQ DoneErrCorr
	LDRB R4, [R1, R3]
	CMP R4, #0
	BEQ AZero
	MOV R4, #0
	B Hop
AZero
	MOV R4, #1
Hop
	STRB R4, [R1, R3]
DoneErrCorr
	MOV R2, #1
	LDR R5, =SrcWord
	MOV R6, #1
Loop
	LDRB [R1, R2]
	CMP R4, #0
	BEQ DoneSrcWord
	CMP R2, R6
	BLO ADataBit
	LSL R6, R6, #1 ; DOUBLE CHECK
	B Hop2
ADataBit
	STRB R4, [R5], #1
	ADD R2, #1 
DoneSrcWord
	STRB R4, [R5] 
	SVC #0x11
	
	AREA	HW7Data, DATA, READWRITE
		
	
	
	ALIGN

	END		; MUST be AFTER all CODE/DATA areas

