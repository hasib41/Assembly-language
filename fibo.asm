.MODEL SMALL
.STACK 100H
INCLUDE 'emu8086.inc'

.DATA
A DB 1
B DB 1
SUM DB ?
I DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1H
    INT 21H
    SUB AL,48
    
    MOV AH,00
    

    XOR CX,CX
    MOV CX,AX
    
    MOV AL,00
    MOV BL,00
    MOV AH,00
    
    MOV DL,A
    ADD DL,48
    MOV AH,02H
    INT 21H 
    
    PRINT ","
    
    
    MOV DL,A
    ADD DL,48
    MOV AH,02H
    INT 21H  
    
    PRINT ","
    

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
          
   PRINT ","
   
   MOV AL,SUM
   MOV B,AL
   
   LOOP LOOP1
   
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN


    