.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB "ENTER 1ST NUMBER : $"   
MSG2 DB "ENTER 2ND NUMBER : $"
MSG3 DB "SUM IS : $" 
NUM1 DB 0
NUM2 DB 0
SUM DB 0
REM DB 0


.CODE
MAIN PROC  
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;PRINT MSG1
    MOV DX,OFFSET MSG1  
    MOV AH,09H
    INT 21H 
    
    
    ;INPUT NUMBER 1 
    
    MOV AH,01H
    INT 21H 
    SUB AL,48
    MOV NUM1,AL  
    
    ;PRINT NEWLINE
    MOV DL,10
    MOV AH,02
    INT 21H   
    
     ;PRINT MSG2
    MOV DX,OFFSET MSG2  
    MOV AH,09H
    INT 21H 
    
    
    ;INPUT NUMBER 2 
    
    MOV AH,01H
    INT 21H 
    SUB AL,48
    MOV NUM2,AL  
    
    ;PRINT NEWLINE
    MOV DL,10
    MOV AH,02
    INT 21H 
    
    
    ;PRINT MSG3
    MOV DX,OFFSET MSG3  
    MOV AH,09H
    INT 21H     
    
    
    ;ADD NUMBER 
    
    MOV DL,NUM1
    ADD DL,NUM2
    MOV SUM,DL
    
    
    ;OUTPUT
    MOV AH,0 
    MOV AL,SUM
    MOV BL,10
    DIV BL
    MOV REM,AH
    
    
    MOV DL,AL
    ADD DL,48
    MOV AH,02H
    INT 21H  
    
    MOV DL,REM
    ADD DL,48
    MOV AH,02H
    INT 21H 
    
    
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP 
                                 
    
    
    


