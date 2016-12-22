      ORG 0000
      JMP MAIN
      ORG 01BH
      JMP JUDX
   
MAIN:
      MOV 20H,#00H
      MOV 30H,#00H
      MOV 31H,#00H
      MOV 32H,#00H
      MOV 43H,#03H 
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
	  
	  
JUDX: 
	  
	  MOV TL1,#0B0H
      MOV TH1,#3CH
      DJNZ 43H,RETURN
      MOV 43H,#03H
	  
	  MOV P1,#00H
      SETB P1.0
      CALL DELAY10MS
      MOV A,P1
      ANL A,#11110000B
      CJNE A,#00H,JUDY1
      CLR P1.0
      
      SETB P1.1
      CALL DELAY10MS
      MOV A,P1
      ANL A,#11110000B
      CJNE A,#00H,JUDY2
      CLR P1.1
      
      SETB P1.2
      CALL DELAY10MS
      MOV A,P1
      ANL A,#11110000B
      CJNE A,#00H,JUDY3
      CLR P1.2
      
      SETB P1.3
      CALL DELAY10MS
      MOV A,P1
      ANL A,#11110000B
      CJNE A,#00H,JUDY4
      CLR P1.3
      
      JMP RETURN
   
RETURN:
      RETI 
	  
JUDY1:
      MOV R0,A
      MOV A,#0
      JMP Y1
JUDY2:
      MOV R0,A
      MOV A,#4
      JMP Y1
JUDY3:
      MOV R0,A
      MOV A,#8
      JMP Y1
JUDY4:
      MOV R0,A
      MOV A,#0CH
      JMP Y1
Y1:   CJNE R0,#10H,Y2
      ADD A,#0
      JMP CHG
Y2:   CJNE R0,#20H,Y3
      ADD A,#1
      JMP CHG
Y3:   CJNE R0,#40H,Y4
      ADD A,#2
      JMP CHG
Y4:   CJNE R0,#80H,err
      ADD A,#3
      JMP CHG
	  
	  JMP RETURN
    
err:  jmp $

     
      
      
CHG:       
      MOV 55H,54H
      MOV 54H,53H
      MOV 53H,52H
      MOV 52H,51H
      MOV 51H,50H
      MOVC A,@A+DPTR 
      MOV 50H,A
	  
	  JMP RETURN
            

      
      TAB:	DB 0FCH,060H,0DAH,0F2H,066H,0B6H,0BEH,0E0H,0FEH,0F6H,0EEH,0FFH,09CH,09EH,08EH
      
DELAY:
      NOP
      MOV 60H,#2
      MOV 61H,#2
NEXT2:
      DJNZ 61H,NEXT2
      DJNZ 60H,NEXT2
      RET
DELAY10MS:			;@12.000MHz
      NOP
      MOV 62H,#94
      MOV 63H,#93
NEXT:
	DJNZ 63H,NEXT
	DJNZ 62H,NEXT
	RET

 END
