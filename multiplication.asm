.model small
.stack 100h

.data

num1 db 5
num2 db 3
sum db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    

    mov al,num1
    add al,num2
    mov sum,al
    
    mov dl,al
    add dl,48
    mov ah,02h
    int 21h
    
    
    mov ax,4c00h
    int 21h
    
    main endp
   
    
    
