; Input 5 numbers in an array. Add 1 with all values. Output the array. 
.model small
.data
    array db 5 dup(?)      ; Define an array to hold 5 numbers
    msg db 10, 13, "Modified Array: $"

.code
    mov ax, @data
    mov ds, ax

    ; Input 5 numbers into the array and add 10
    mov cx, 5
    mov si, 0
input_loop:
    mov ah, 01h            ; Input function
    int 21h                ; Call DOS interrupt for input
    sub al, '0'            ; Convert ASCII to integer
    add al, 1            ; Add 10
    mov [array+si], al    ; Store the modified value in the array
    inc si
    loop input_loop

    ; Output the modified array
    mov cx, 5
    mov si, 0
output_loop:
    mov dl, [array+si]     ; Load an element from the array
    add dl, 48            ; Convert integer to ASCII
    mov ah, 02h            ; Print function
    int 21h                ; Call DOS interrupt for output

    ; Output a space character for formatting
    mov dl, ' '            
    mov ah, 02h
    int 21h

    inc si
    loop output_loop

    ; Output a newline character
    mov dl, 10
    mov ah, 02h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

end









