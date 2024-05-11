org 100h



.data

    promptx db "Enter First number: $ "

    promptn db 10,13,"Enter Second number: $ " 

    result db 10,13,"Result of subtraction: $"

    results db 10,13,"Result of summation: $" 

    resultm db 10,13,"Result of multi : $" 

    resultd db 10,13,"Result of division : $"  

    zero_divisor_error_message db "Error: Division by zero! Please enter a non-zero divisor.", 10, 13, "$"

    value db "00000 $"

    newline db 10, 13, '$'

    

    numx dw ?

    numn dw ? 

    

.code

main proc

    mov ax, @data

    mov ds, ax

    mov ax, 0

    

    ; receiving values of x, n

    

    mov dx, offset promptx

    mov ah, 09h

    int 21h

    

    mov ah, 01h

    int 21h

    

    mov bl, al

    sub bl, 30h

    mov bh, 0

    mov numx, bx

    

    ;bx for x

    

    mov dx, offset promptn

    mov ah, 09h

    int 21h

    

    mov ah, 01h

    int 21h

    

    mov cl, al

    sub cl, 30h

    mov ch, 0

    mov numn, cx

    

    ;cx for n 

    

        

   ; Check if divisor (numn) is zero

    mov ax, numn

    test ax, ax           ; Test if numn is zero

    jz divisor_is_zero    ; Jump if zero



    ; If numn is not zero, proceed with division

    mov ax, numx

    xor dx, dx            ; Clear dx before division

    div numn



    ; converting result to ASCII

    mov cx, 10

    mov di, offset value

    mov bx, 4

    

    convert_to_ascii:

        xor dx, dx

        div cx

        add dl, '0'

        mov [di+bx], dl

        dec bx

        cmp ax, 0

        jnz convert_to_ascii

    

    ; printing result

    mov dx, offset resultd

    mov ah, 09h

    int 21h

    mov dx, offset value 

    int 21h



    jmp end_program   ; Jump to end_program to terminate the program



divisor_is_zero:

    ; Display error message

    mov dx, offset zero_divisor_error_message

    mov ah, 09h

    int 21h



end_program:  

    

    ; finding subtraction of x and n

    mov ax, numx

    sub ax, numn

    

    

    ; converting result to ASCII

    mov cx, 10

    mov di, offset value

    mov bx, 4

    

    convert_to_asciio:

        xor dx, dx

        div cx

        add dl, '0'

        mov [di+bx], dl

        dec bx

        cmp ax, 0

        jnz convert_to_asciio

    

    ; printing result

    mov dx, offset result

    mov ah, 09h

    int 21h

    mov dx, offset value 

    int 21h

    

     ; finding addition of x and n (replacing subtraction)

    mov ax, numx

    add ax, numn

    

    

    ; converting result to ASCII

    mov cx, 10

    mov di, offset value

    mov bx, 4

    

    convert_to_asciix:

        xor dx, dx

        div cx

        add dl, '0'

        mov [di+bx], dl

        dec bx

        cmp ax, 0

        jnz convert_to_asciix

    

    ; printing result

    mov dx, offset results

    mov ah, 09h

    int 21h

    mov dx, offset value 

    int 21h

                     

     

          ; finding multiplicatin

    mov ax, numx    

    mov bx, numn    

    mul bx

    

    

    ; converting result to ASCII

    mov cx, 10

    mov di, offset value

    mov bx, 4

    

    convert_to_asciixw:

        xor dx, dx

        div cx

        add dl, '0'

        mov [di+bx], dl

        dec bx

        cmp ax, 0

        jnz convert_to_asciixw

    

    ; printing result

    mov dx, offset resultm

    mov ah, 09h

    int 21h

    mov dx, offset value 

    int 21h  
                

     mov dx, offset newline      ; Newline

    mov ah, 09h                 ; Print string

    int 21h


    

    mov ah, 00h

    int 21h

    

    

    

    main endp

end mains