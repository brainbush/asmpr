			ORG 	0000
BALANCED:	CLR		A
			MOV		40H,A
			MOV 	41H,A
			MOV 	42H,A
			MOV		43H,A
			MOV		R7,#24
START:		CLR		C
			MOV		A,32H
			RLC		A
			MOV		32H,A
			MOV		A,31H
			RLC		A
			MOV		31H,A
			MOV		A,30H
			RLC		A
			MOV		30H,A
			
			MOV		A,43H
			ADDC	A,43H
			DA		A
			MOV 	43H,A
			MOV		A,42H
			ADDC	A,42H
			DA		A
			MOV 	42H,A
			MOV		A,41H
			ADDC	A,41H
			DA		A
			MOV 	41H,A
			MOV		A,40H
			ADDC	A,40H
			DA		A
			MOV 	40H,A
			DJNZ	R7,START
			
	
	;ORG 30H
	;	DB 10101010B,11111111B,10100101B
	END