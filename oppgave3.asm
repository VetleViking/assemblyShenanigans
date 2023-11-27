section .data 
    num1: db "1",0
    num2: db "-1",0
    num3: db "8",0
    num4: db "-5",0
    
    allNum: dd num1, num2, num3, num4

    newLine: db 10

section .text

global _start
_start:
    mov eax, 0
    mov esi, 0
    mov edi, 0

find_lowest: 
    mov ecx, 0
    mov ebx, 1
    cmp eax, ebx
    jg update_min

    mov ecx, 1
    mov ebx, -1
    cmp eax, ebx
    jg update_min

    mov ecx, 2
    mov ebx, 8
    cmp eax, ebx
    jg update_min

    mov ecx, 3
    mov ebx, -5
    cmp eax, ebx
    jg update_min

    jmp print_lowest

update_min:
    mov eax, ebx
    mov edi, ecx
    jmp find_lowest

print_lowest: 
    mov eax, 4 
    mov ebx, 1      
    mov ecx, allNum[edi*4]
    mov edx, 2      
    int 0x80  

    mov eax, 4 
    mov ebx, 1      
    mov ecx, newLine
    mov edx, 1       
    int 0x80  

    jmp exit

exit:
    mov eax, 1
    int 0x80 