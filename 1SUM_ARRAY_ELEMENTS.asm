           .MODEL SMALL

.STACK 100H


.DATA

ARR DB 5 DUP(?)
SUM DB 0 
D DB 10
E DB ?
F DB ?

.CODE

MAIN PROC
    
MOV AX,@DATA
MOV DS,AX  


LEA SI,ARR
MOV CX,5

INPUT:

MOV AH,01H
INT 21H
SUB AL,48
MOV [SI],AL

MOV AL,SUM
ADD AL,[SI]
MOV SUM,AL

INC SI



LOOP INPUT

MOV DL,10
MOV AH,02H
INT 21H

MOV DL,13
MOV AH,02H
INT 21H

MOV AL,SUM
MOV AH,0
DIV D
MOV E,AL
MOV F,AH

MOV DL,E
ADD DL,48
MOV AH,02H
INT 21H

MOV DL,F
ADD DL,48
MOV AH,02H
INT 21H  



MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN