		ORG 	0000
		MOV		R0,#30H
		MOV		R1,#00H
		MOV 	R2,#16
LOOP:	CJNE	@R0,#55H,JUMP
		INC		R1
JUMP:	INC 	R0
		DJNZ	R2,LOOP
		MOV		50H,R1
		END