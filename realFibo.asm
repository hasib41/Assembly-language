;double digit fib
.MODEL SMALL
.STACK 100H

.DATA
A DB 1
B DB 1 
res db ?
rem db ?
SUM DB ?
SPACE DB " $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    mov al,a
    MOV DL,al
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV DL,OFFSET SPACE
    MOV AH,09H
    INT 21H
    
    mov al,b
    MOV DL,al
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV DL,OFFSET SPACE
    MOV AH,09H
    INT 21H
    
    XOR CX,CX
    MOV CX,08
    MOV BL,00
    MOV AL,00
    MOV AH,00
   
LOOP1:
    
    MOV AL,00
    MOV AH,00
    
    MOV BL,A
    ADD BL,B
    MOV SUM,BL
    MOV AL,B
    MOV A,AL
    
    mov al,sum
    mov dl,10
    div dl
    mov res,al
    mov rem,ah
    
    MOV DL,res
    ADD DL,48
    MOV AH,02H
    INT 21H 
    
    MOV DL,rem
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
MAIN ENDP
END MAIN