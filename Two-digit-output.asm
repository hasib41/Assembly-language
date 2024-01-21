.MODEL SMALL
.STACK 100H

.DATA

A DB 10
B DB 6
SUM DB ?
REM DB ?


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AL,A
    ADD AL,B
    MOV SUM,AL  
    
    MOV AL,SUM
    MOV AH,00
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