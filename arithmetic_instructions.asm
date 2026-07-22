; var1 = 20, var2 = 2, var3 = 3
; result = (var1 - 3) / (var3 + var2)
; expected quotient = 3, expected remainder = 2

section .data
    var1 db 20
    var2 db 2
    var3 db 3

section .bss
    result resb 1
    output resb 1

section .text
    global _start

_start:
    mov ax, 0
    mov al, [var1]
    sub al, 3

    mov bl, [var3]
    add bl, [var2]

    div bl

after_division:
    mov [result], al
    add al, '0'
    mov [output], al

    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
