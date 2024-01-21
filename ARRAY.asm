.STACK 100H
.MODEL SMALL
INCLUDE 'EMU8086.INC' 

.DATA

 NUMBER DB 10 DUB(?)
 NUMBER2 DB 1,2,3,4,5,6,7,8,9

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA SI,NUMBER2
    
    MOV CX,9
    MOV AH,02
    
    FOR:  
    
    
    
    MOV DL,[SI]  
    ADD DL,48
    INT 21H
    ADD SI,1
    
    
    LOOP FOR
    
    
    
    
    
    
    
    
    
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN 




