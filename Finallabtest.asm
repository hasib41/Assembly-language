.MODEL SMALL
.STACK 100H

.DATA 

MSG1 DB "ENTER A NUMBER :$" 

MSG2 DB "HELLO... $" 

MSG4 DB "1 $"

MSG5 DB "ENTER A TWO DIGIT NUMBER : $"

NUM1 DB 00 

NUM2 DB 00

NUM7 DB 5 

RES DB 00 
REM DB 00



.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV DL,OFFSET MSG1
    MOV AH,09H
    INT 21H  
    
    ;SJBDJ
    MOV AL,00
    MOV AH,00
    
    MOV AH,01H
    INT 21H
    
    SUB AL,48
    
    CMP AL,5
    JE PRINTMSG
    
    CMP AL,7
    JE PRINTMSG 
    
    CMP AL,1
    JE PRINT1
    
    ;HJSHDJAHDFJKSHFJKSBDFJKSDBFJKDSBFJKSDBGDSBGFJKDSBJGKB
    CMP AL,2
    JE  EXTRA  
    
     CMP AL,4
    JE  EXTRA
    
     CMP AL,6
    JE  EXTRA
    
     CMP AL,8
    JE  EXTRA 
    
     CMP AL,3
    JE  EXTRA
    
     CMP AL,9
    JE  EXTRA
    
    
    
    JMP EXIT
    
PRINTMSG: 

    MOV DL,10
    MOV AH,02H
    INT 21H 
    
    MOV DL,13
    MOV AH,02H
    INT 21H  
    
    MOV DL,OFFSET MSG2
    MOV AH,09H
    INT 21H
    
    JMP EXIT 
    
PRINT1: 

    MOV DL,10
    MOV AH,02H
    INT 21H 
    
    MOV DL,13
    MOV AH,02H
    INT 21H 
     
    MOV DL,OFFSET MSG4
    MOV AH,09H
    INT 21H 
    
    JMP EXIT
    
    
EXTRA: 

    MOV DL,10
    MOV AH,02H
    INT 21H 
    
    MOV DL,13
    MOV AH,02H
    INT 21H 
     
    MOV DL,OFFSET MSG5
    MOV AH,09H
    INT 21H

  

    
    
INPUTNUM:  
     
    
    MOV AH,01H
    INT 21H 

    CMP AL,13
    JE FINALSUM

    MOV AH,0
    SUB AL,48

    MOV CL,AL
    MOV AL,BL

    MUL DL
    ADD AL,CL

    MOV BL,AL
    MOV NUM2,BL 
    
    
JMP INPUTNUM
    
FINALSUM: 

      MOV DL,10
      MOV AH,02H
      INT 21H 
     
      MOV DL,13
      MOV AH,02H
      INT 21H 
     
     MOV AL,00
     MOV AH,00
     MOV RES,00 
     
       
     MOV AL,5
     SUB AL,48
     ADD AL,NUM2  
     
     MOV RES,AL
     MOV AL,RES
     MOV BL,10
     DIV BL
     MOV REM,AH


     MOV DL,AL
     MOV AH,02H
     ADD DL,48
     INT 21H 

     MOV DL,REM
     MOV AH,02H
     ADD DL,48
     INT 21H
   

     
   
    
EXIT:
    MOV AX,4C00H
    INT 21H
    
MAIN ENDP

END MAIN
    
    


