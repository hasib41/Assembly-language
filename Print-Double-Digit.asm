.MODEL SMALL
.STACK 100H


.DATA
A DW 7
B DW 5
SUM DW ?
REM DB ?

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV AX,A
    ADD AX,B
    MOV SUM,AX
    
    
    MOV AH,0
    MOV BL,10
    DIV BL
    MOV REM,AH
    
    MOV DL,AL
    ADD DL,48
    MOV AH,2
    INT 21H  
    
    MOV DL,AH
    ADD DL,48
    MOV AH,2
    INT 21H
             
    
    MOV AX,4C00H 
    INT 21H
    
    MAIN ENDP
                      