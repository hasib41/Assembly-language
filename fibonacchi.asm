.MODEL SMALL
.STACK 100H

.DATA
A DB 1
B DB 1
SUM DB ?
SPACE DB " $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    XOR CX,CX
    MOV CX,04
    MOV BL,00
    MOV AL,00
    MOV AH,00
    
    MOV DL,A
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV DL,OFFSET SPACE
    MOV AH,09H
    INT 21H
    
    MOV DL,B
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV DL,OFFSET SPACE
    MOV AH,09H
    INT 21H

LOOP1:
    
    MOV AL,00
    MOV AH,00
    
    MOV BL,A
    ADD BL,B
    MOV SUM,BL
    MOV AL,B
    MOV A,AL
    
    MOV DL,SUM
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV DL,OFFSET SPACE
    MOV AH,09H
    INT 21H
    
    MOV AL,SUM
    MOV B,AL 
    
    LOOP LOOP1
    
MOV AX,4C00H
INT 21H
MAIN�ENDP
END�MAIN



