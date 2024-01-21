.model small
.stack 100h

.data

msg1 db "Enter 1st msg:$"  
msg2 db "Enter 2nd msg:$"
msg3 db "Enter 3rd msg:$"  
num1 db 00
num2 db 00
sum db 00
rem db 00



.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;1
    mov dx,offset msg1
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    sub al,48
    mov num1,al
    
    mov dl,10
    mov ah,02h
    int 21h    
    
    ;2
    mov dx,offset msg1
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    sub al,48
    mov num2,al
    
    mov dl,10
    mov ah,02h
    int 21h
    
    ;3
    mov dx,offset msg3
    mov ah,09h
    int 21h
    
    ;add
    mov al,num1
    mul num2
    mov sum,al
    
    mov ah,00
    mov al,sum
    mov bl,10
    div bl
    mov rem,ah
    
    ;print
    mov dl,al
    add dl,48
    mov ah,02h
    int 21h 
    
    mov dl,rem
    add dl,48
    mov ah,02h
    int 21h
    
    
    mov ax,4c00h
    int 21h
    
    main endp
    
    
