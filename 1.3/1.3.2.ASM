		ORG 0000
		MOV R0,#30H
		MOV R3,#08
LP:		MOV A,41H
		ADD A,@R0
		MOV 41H,A	;低位给41h
		MOV A,40H
		ADDC A,#00	
		MOV 40H,A	;高位给40h
		INC R0
		DJNZ R3,LP
		NOP
		END