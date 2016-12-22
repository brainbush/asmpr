      ORG 0000
MAIN:      
      MOV DPTR,#TAB
	  
JUDX: MOV P1,#00H
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
      
      JMP JUDX
      
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
    
err:  jmp $
CHG:
      MOVC A,@A+DPTR
      MOV P3,A  
      JMP JUDX
DELAY10MS:			;@12.000MHz
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
      TAB:	DB 03FH,006H,05BH,04FH,066H,06DH,07DH,007H,07FH,06FH,077H,07CH,039H,05EH,079H,071H
      END
