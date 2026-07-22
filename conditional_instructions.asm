section .data
    number dd -7

    positive_msg db 'The number is positive', 10
    positive_len equ $ - positive_msg

    negative_msg db 'The number is negative', 10
    negative_len equ $ - negative_msg

    zero_msg db 'The number is zero', 10
    zero_len equ $ - zero_msg

section .text
    global _start

_start:
    mov eax, [number]
    cmp eax, 0
    jg positive
    jl negative

zero:
    mov ecx, zero_msg
    mov edx, zero_len
    jmp display

positive:
    mov ecx, positive_msg
    mov edx, positive_len
    jmp display

negative:
    mov ecx, negative_msg
    mov edx, negative_len

display:
    mov eax, 4
    mov ebx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
