.model small
.stack 100h

.data

msg1 db "enter 1 for add and enter 2 for multiple :$" 
msg2 db "enter 1st number : $"
msg3 db "enter 2nd number : $" 
msg4 db "enter 3rd number : $"
msg5 db "enter 1 for add two numbers& 2 for add three numbers: "
                                 
addnum db ?
mulnum db ?
num1 db ?
num2 db ?
num3 db ?
rem db ?

.code

start:

mov dx,offset msg1
mov ah,09h
int 21h

mov ah,01h ;input for add/mul
int 21h

cmp al,1
je add_numbers
                 
cmp al,2
je mul_numbers   
    
jmp exit


add_numbers: 
         
         mov dx, offset msg5
         mov ah,09h
         int 21h
         
         mov ah,01h
         int 21h    
         
         cmp al,1
         je add_two_numbers 
         
         cmp al,1
         je add_three_numbers
        
         jmp exit:
                
add_two_numbers:
         mov ah,01h
         int 21h
         sub al,48
         mov num1,al 
         
         mov ah,01h
         int 21h
         sub al,48
         mov num2,al 
         
         mov dl,num1
         add dl,num2
         mov addnum,dl 
         
         mov ah,0
         mov al,addnum
         div bl
         mov rem,ah
         
         mov ah,02h
         int 21h
         mov dl,al
         add dl,48  
         
         mov ah,02h
         int 21h
         mov dl,rem
         add dl,48
         
         
add_three_numbers:
 
mul_numbers:

exit:   

end start