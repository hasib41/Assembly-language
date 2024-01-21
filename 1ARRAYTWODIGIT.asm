                  include 'emu8086.inc'
.model small
.stack 100h
.data
arr db 50 dup (?) 
n db ?
res db ?
rem db ?
.code
main proc 
    
    print "Enter number of inputs : "
    mov dl,10
    mov ah,1h
    int 21h
    sub al,48
    mul dl
    mov n,al
    mov ah,1h
    int 21h
    sub al,48
    add al,n
    mov ah,0 
    mov bl,al
    xor cx,cx
    mov cx,ax
    printn ""
    mov si,0
    print "Enter Numbers : "
    l1:
        
       ;Two digit input
    mov dl,10
    mov ah,1h
    int 21h
    sub al,48
    mul dl
    mov n,al
    mov ah,1h
    int 21h
    sub al,48
    add al,n
    mov arr[si] ,al
    inc si
    print " "
    loop l1 
    
    
     mov al,bl
     mov ah,0
     xor cx,cx
     mov cx,ax
     mov si,0
     printn ""
     print "Numbers : "
    l2:
        
     ;Two digit output 
    mov al,00
    mov ah,00
    mov bl,0
    mov al,arr[si]
    inc si
    mov bl,10
    div bl
    mov res,al
    mov rem,ah
        
    mov dl,res
    add dl,48
    mov ah,2h
     int 21h
        
    mov dl,rem
    add dl,48
    mov ah,2h  
    int 21h 
    print " "
     loop l2
     
    main endp
end main