.MODEL SMALL
.STACK 100H

.DATA
RESULT DB ?
REM DB 0

.CODE

MAIN PROC
MOV AX,@DATA
MOV DS,AX

MOV DL,10
MOV BL,0

INPUTNUM: 

MOV AH,01H
INT 21H 

CMP AL,13
JE EXIT

MOV AH,0
SUB AL,48

MOV CL,AL
MOV AL,BL

MUL DL
ADD AL,CL

MOV BL,AL
MOV RESULT,BL

JMP INPUTNUM

EXIT: 

MOV DL,10
MOV AH,02H
INT 21H   

MOV AH,00
MOV BL,00
MOV DL,00

MOV AL,RESULT
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





