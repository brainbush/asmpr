		ORG 0000
		MOV P2,#20H
		MOV R0,#20H
		MOV DPTR,#1010H
		MOV R3,#16
LOOP:	MOVX A,@DPTR
		MOVX @R0,A
		INC R0
		INC DPTR
		DJNZ R3,LOOP
		END