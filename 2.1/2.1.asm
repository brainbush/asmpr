		ORG 0000
		MOV R0,#30H
		MOV R3,#0FH
LP1:	MOV A,41H
		ADD A,@R0
		MOV 41H,A
		MOV A,40H
		ADDC A,#00H
		MOV 40H,A
		INC R0
		DJNZ R3,LP1
;----------------------------L41H,H40H
		MOV A,#40H
		MOV B,#10H
		DIV AB
		
		MOV 40H,A
		MOV A,B
		SWAP A
		ANL A,#11110000B
		MOV R0,A
		MOV A,41H
		SWAP A
		ANL A,#00001111B
		ORL A,R0
		MOV B,#10H
		DIV AB
		
		SWAP A
		ANL A,#11110000B
		MOV R3,A
		MOV A,B
		SWAP A
		ANL A,#11110000B
		MOV R0,A
		MOV A,41H
		ANL A,#00001111B
		ORL A,R0
		MOV B,#10H
		DIV AB
		
		ORL A,R3
		
		END
		