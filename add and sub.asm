nclude 'emu8086.inc'
.model small
.stack 100h
.data
x db ?
y db ?
sum db ?
r db ?
rem db ?
z db ?
.code
main proc 
    
     
     
     mov ax, @data
     mov ds,ax

     
     print 'Enter X : '
     
     mov ah,1
     int 21h
     sub al,48
     mov x,al
     
     
     printn ''
     print 'Enter Y : '
     
     mov ah,1
     int 21h
     sub al,48
     mov y,al
     
     printn ''
     
     
    operation:
         print 'Enter Choice 1 for addition 2 for subtraction : ' 
          mov ah,1
          int 21h 
          printn ''
          sub al,48
          cmp al,1
          je plus
          
          cmp al,2
          je minus
          
    plus:
         printn ''
         MOV BL,x
        ADD BL,y
        MOV z,BL
        
        MOV AH,00
        
        MOV AL,z
        
        MOV BL,10
        
        DIV BL
        
        MOV r,AH
        
        MOV DL,AL
        ADD DL,48
        
        print 'The sum is :'
        
        MOV AH,2
        INT 21H
        
        MOV DL,r
        ADD DL,48
        
        MOV AH,2
        INT 21H
         printn ''       
         
         print 'press 2 if you want to see subtraction or 0 to exit :' 
         
         
         mov ah,1
         int 21h 
         sub al,48
         cmp al, 2
         
         je minus
         
         cmp al,0
         je exit
          
    minus:
         printn '' 
         mov bl,x
         sub bl,y
         mov rem, bl   
         
         print 'the rem is : '
         
         mov ah,2 
         mov dl,rem 
         add dl,48
         int 21h 
         
         printn ''
         
         
         print 'press 1 if you want to see addition or 0 to exit :' 
         
         
         mov ah,1
         int 21h 
         sub al,48
         cmp al, 1
         
         je plus
         
         cmp al,0
         je exit
         
         
          
    exit:      
         
         
        
    main endp
end main



