.MODEL SMALL


.STACK 100H


.DATA

ARR1 DB 1,2,3,4,5  
A DB 10 
D DB 10 
E DB ?
F DB ? 
SPACE DW ' $'


.CODE

MAIN PROC
    
MOV AX,@DATA
MOV DS,AX 


LEA SI,ARR1
MOV CX,5



INPUT:
MOV AH,01H
INT 21H
SUB AL,48
MOV [SI],AL
INC SI

LEA DX,SPACE
MOV AH,09H
INT 21H


LOOP INPUT 



LEA SI,ARR1
MOV CX,5

ADD_NUMBERS:

MOV AL,[SI]
ADD AL,A 
 
MOV [SI],AL

 
INC SI

LOOP ADD_NUMBERS

MOV DL,10
MOV AH,02H
INT 21H

MOV DL,13
MOV AH,02H
INT 21H


LEA SI,ARR1
MOV CX,5

OUTPUT:

MOV AL,[SI]
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

LEA DX,SPACE
MOV AH,09H
INT 21H

INC SI


LOOP OUTPUT



MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN