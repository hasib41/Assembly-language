.MODEL SMALL
.STACK 100H

.DATA
NUMBER DB 20 DUB(?) 
I DW ?


.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    mov ah,01h
    int 21h 
    sub al,48
    mov ah,0
    MOV I,AX
    
    MOV CX,I
    MOV SI,0
    
    
    FORINPUT:
    MOV AH,01H
    INT 21H
    SUB AL,48
    
     
    ADD AL,2
    MOV [NUMBER+SI],AL 
    
    INC SI
    
    LOOP FORINPUT
     
     
    MOV CX,5
    MOV SI,0
    OUTPUT:
    
    MOV DL,[NUMBER+SI]
    ADD DL,48
    MOV AH,02H
    INT 21H
    INC SI
    
    LOOP OUTPUT
     
    MOV AX,4C00H
    INT 21H
     
    MAIN ENDP
END MAIN