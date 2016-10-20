		ORG		0000
		MOV		A,R5
		MOV		B,R7
		MUL		AB
		MOV		32H,A
		MOV		31H,B
		MOV		A,R6
		MOV		B,R7
		MUL		AB
		ADD		A,31H
		MOV		31H,A
		XCH		A,B
		ADDC	A,#00
		MOV		30H,A
		END