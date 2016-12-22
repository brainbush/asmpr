      ORG 0000
      JMP MAIN
      ORG 01BH
      JMP TIME
      
TIME:     
      
      ;MOV 30H,#12H
      ;MOV 31H,#34H
      ;MOV 32H,#56H
      MOV TL1,#0B0H
      MOV TH1,#3CH
      DJNZ 43H,RETURN
      MOV 43H,#05H
      
      MOV A,20H
      CJNE A,00H,DIAN
      INC A
      MOV 20H,A
      JMP CHG2
      
DIAN: MOV 20H,#00H
      MOV A,32H
      MOV PSW,#00H
      INC A
      DA  A
      CJNE A,#60H,MIAO
      
      MOV 32H,#00H
      MOV A,31H
      MOV PSW,#00H
      INC A
      DA  A
      CJNE A,#60H,FEN
      
      MOV 31H,#00H
      MOV A,30H
      MOV PSW,#00H
      INC A
      DA  A
      MOV 30H,A
      JMP CHG
      
FEN:  MOV 31H,A
      JMP CHG
MIAO: MOV 32H,A
      JMP CHG
      
      
      
CHG:  MOV A,32H
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV 50H,A
      JMP CHG3
      
CHG2: MOV A,32H
      ANL A,#00001111B
      MOVC A,@A+DPTR
      INC A
      MOV 50H,A
	
CHG3: MOV A,32H
      SWAP A
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV 51H,A
      
      MOV A,31H
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV 52H,A
	
      MOV A,31H
      SWAP A
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV 53H,A
	 
      MOV A,30H
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV 54H,A
	 
      MOV A,30H
      SWAP A
      ANL A,#00001111B
      MOVC A,@A+DPTR
      MOV 55H,A
   
RETURN:
      RETI
      
MAIN:
      MOV 20H,#00H
      MOV 30H,#00H
      MOV 31H,#00H
      MOV 32H,#00H
      MOV 43H,#05H 
      MOV TMOD,#10H
      MOV TL1,#0B0H
      MOV TH1,#3CH
      SETB TR1
      MOV IE,#88H
      MOV DPTR,#TAB
	 	       
LOOP:
      CLR P3.1
      MOV P2,#0FFH
      SETB P3.1
      MOV P2,50H
      SETB P3.0  
      CLR P3.1
      MOV P2,#0DFH
      CLR P3.0
      SETB P3.1
      CALL DELAY
      
      CLR P3.1
      MOV P2,#0FFH
      SETB P3.1
      MOV P2,51H
      SETB P3.0  
      CLR P3.1
      MOV P2,#0EFH
      CLR P3.0
      SETB P3.1
      CALL DELAY

      CLR P3.1
      MOV P2,#0FFH
      SETB P3.1
      MOV P2,52H
      SETB P3.0  
      CLR P3.1
      MOV P2,#0F7H
      CLR P3.0
      SETB P3.1
      CALL DELAY

      CLR P3.1
      MOV P2,#0FFH
      SETB P3.1
      MOV P2,53H
      SETB P3.0  
      CLR P3.1
      MOV P2,#0FBH
      CLR P3.0
      SETB P3.1
      CALL DELAY
      
      CLR P3.1
      MOV P2,#0FFH
      SETB P3.1
      MOV P2,54H
      SETB P3.0  
      CLR P3.1
      MOV P2,#0FDH
      CLR P3.0
      SETB P3.1
      CALL DELAY
      
      CLR P3.1
      MOV P2,#0FFH
      SETB P3.1
      MOV P2,55H
      SETB P3.0  
      CLR P3.1
      MOV P2,#0FEH
      CLR P3.0
      SETB P3.1
      CALL DELAY
      JMP LOOP
      TAB:	DB 0FCH,060H,0DAH,0F2H,066H,0B6H,0BEH,0E0H,0FEH,0F6H,0EEH,0FFH,09CH,09EH,08EH
      
DELAY:
      NOP
      MOV 60H,#10
      MOV 61H,#81
NEXT:
      DJNZ 61H,NEXT
      DJNZ 60H,NEXT
      RET

	END
