      ORG 0000
      
      MOV DPTR,#TAB
      
      MOV 30H,#12H
      MOV 31H,#34H
      MOV A,31H
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV R0,A
	
      MOV A,31H
      SWAP A
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV R1,A
	 
      MOV A,30H
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV R2,A
	 
      MOV A,30H
      SWAP A
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV R3,A    
      
START:
      MOV P1,R0
      MOV P2,#0DFH
      SETB P3.0
      SETB P3.1
      CLR P3.0
      CLR P3.1
      CALL DELAY
      
      
      MOV P1,R1
      MOV P2,#0EFH 
      SETB P3.0
      SETB P3.1
      CLR P3.0
      CLR P3.1
      CALL DELAY

      MOV P1,R2
      MOV P2,#0F7H
      SETB P3.0
      SETB P3.1
      CLR P3.0
      CLR P3.1
      CALL DELAY

      MOV P1,R3
      MOV P2,#0FBH
      SETB P3.0
      SETB P3.1
      CLR P3.0
      CLR P3.1
      CALL DELAY
      JMP START
      TAB:	DB 0FCH,060H,0DAH,0F2H,066H,0B6H,0BEH,0E0H,0FEH,0F6H,0EEH,0FFH,09CH,09EH,08EH
      
	DELAY:
	NOP
	PUSH 30H
	PUSH 31H
	MOV 30H,#94
	MOV 31H,#93
NEXT:
	DJNZ 31H,NEXT
	DJNZ 30H,NEXT
	POP 31H
	POP 30H
	RET




      END
