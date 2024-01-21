.model small
.data
    array db 5 dup(?)      ; Define an array to hold 5 numbers
    msg db 10, 13, "Modified Array: $"

.code
    mov ax, @data
    mov ds, ax

    ; Input 5 double-digit numbers into the array and add 10
    mov cx, 5
    mov si, 0
input_loop:
    mov ah, 01h            ; Input function
    int 21h                ; Call DOS interrupt for input

    sub al, '0'            ; Convert ASCII to integer (tens digit)
    mov ah, 0              ; Clear AH
    mov bl, 10             ; BL = 10
    mul bl                 ; Multiply AL by 10 to shift to tens place
    mov bl, al             ; Store tens digit in BL

    mov ah, 01h            ; Input function (ones digit)
    int 21h                ; Call DOS interrupt for input

    sub al, '0'            ; Convert ASCII to integer (ones digit)
    add al, 10             ; Add 10
    add al, bl             ; Add tens digit
    mov [array+si], al    ; Store the modified value in the array
    inc si
    loop input_loop

    ; Output the modified array
    mov cx, 5
    mov si, 0
output_loop:
    mov al, [array+si]     ; Load an element from the array
    mov ah, 0              ; Clear AH
    mov bl, 10             ; BL = 10 for division
    div bl                 ; Divide AL by 10, quotient in AL, remainder in AH

    ; Convert quotient and remainder to ASCII
    add al, '0'
    add ah, '0'

    mov dl, al             ; Output the tens digit
    mov ah, 02h            ; Print function
    int 21h                ; Call DOS interrupt for output

    mov dl, ah             ; Output the ones digit
    mov ah, 02h
    int 21h

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













