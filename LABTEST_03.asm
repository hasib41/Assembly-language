.MODEL SMALL
.STACK 100H

.DATA
N DB ?
S DB ?
X DB ?
RES DB ?
REM DB ?


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DL,10
    MOV BL,00  
    
SCAN:
    
    MOV AH,01H
    INT 21H
    
    CMP AL,13
    JE NEXT
          
    SUB AL,48
    MOV AH,00
    
    MOV CL,AL
    MOV AL,BL
    MUL DL
    
    ADD AL,CL
    MOV BL,AL
    MOV N,AL
    
    JMP SCAN
    
NEXT:
    
    MOV DL,10
    MOV AH,02H
    INT 21H
     
    MOV AH,00
    MOV AL,00
    
    MOV AH,01H
    INT 21H
    SUB AL,48
    MOV S,AL
            
    MOV AH,00
    MOV AL,00
    MOV DL,00  
    MOV BL,S

DIVISION:

    MOV DL,10
    MOV AH,02H
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,48
    MOV X,AL
    
    CMP AL,BL
    JE EXIT
    
    MOV AL,00
    MOV AH,00
    MOV DL,00
    MOV DH,00  
    
    MOV AL,N
    MOV DL,X
    DIV DL
    MOV N,AL
    MOV REM,AH
    
    MOV AL,N
    MOV DL,10
    DIV DL
    MOV RES,AL
    MOV REM,AH 
    
    MOV DL,10
    MOV AH,02H
    INT 21H
    
    MOV DL,RES
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV DL,REM
    ADD DL,48
    MOV AH,02H
    INT 21H 
    
    JMP DIVISION
    
    
EXIT:    
    
    MOV AX,4C00H
    INT 21H
MAIN ENDP
END MAIN