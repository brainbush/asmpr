		ORG 	0000
		MOV		30H,#11111111B
		MOV		31H,#00000000B
		MOV		A,30H
		ANL		A,#00011111B
		MOV		R0,A
		MOV		A,31H
		SWAP	A
		RL		A
		ANL		A,#11100000B
		MOV		R1,A
		ORL		A,R0
		MOV		40H,A
		END
		
		