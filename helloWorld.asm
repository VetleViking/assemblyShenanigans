global _start

section .data
    hello: db "Hello World!", 10
    helloLen: equ $-hello

section .text

_start:

    mov cx, 10

label:   

    push cx


    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, helloLen
    int 0x80

    pop cx 
    
    dec cx
    jnz label

    mov eax, 1
    mov ebx, 0
    int 0x80 
