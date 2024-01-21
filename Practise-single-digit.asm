.MODEL SMALL
.STACK 100H

.DATA
A DB 4
B DB 4
SUM DB ?

.CODE
 MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV AL,A
    ADD AL,B
    MOV SUM,AL
    
    MOV DL,AL
    ADD DL,48
    MOV AH,2
    INT 21H
    
    MOV AX,4C00H
    INT 21H
    
    MAIN ENDP
    
        

END MAIN 