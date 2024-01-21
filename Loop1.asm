.MODEL SMALL
.STACK 100H

.DATA
NUM DB ?
RES DB ?
REM DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,00
    MOV AL,00
    MOV DL,10
    MOV DH,00
    MOV BL,00
    XOR CX,CX
    MOV CX,02
    
SCANNUM:

    MOV AH,01H
    INT 21H
    
    MOV AH,00
    SUB AL,48
    
    MOV DH,AL
    MOV AL,BL
    MUL DL
    
    ADD AL,DH
    MOV BL,AL
    MOV NUM,AL
    
    LOOP SCANNUM  
    
PRINTNEWLINE:
    
    MOV DL,10
    MOV AH,02H
    INT 21H
    
PRINTNUMBER:

    MOV AL,00
    MOV AH,00

    MOV AL,NUM
    MOV BL,10
    DIV BL
    MOV RES,AL
    MOV REM,AH
    
    MOV DL,RES
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV DL,REM
    ADD DL,48
    MOV AH,02H
    INT 21H
    
EXIT:

    MOV AX,4C00H
    INT 21H 
    
MAIN ENDP
END MAIN