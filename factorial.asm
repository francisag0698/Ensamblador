%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj1 db "Ingrese un numero", 10
    len1 equ $-msj1

    msj2 db "El factorial es:", 10
    len2 equ $-msj2

    new_line db 10,

section .bss
    n1 resb 1
    operacion resb 1
section .text
    global _start

_start:     

    escribir msj1, len1
    leer n1, 2

    mov al, 1
    mov bl, 0
    mov cl, [n1]
    sub cl, '0'
    
factorial: 
    inc bl
    mul bl
    cmp bl, cl
    jg cero
    je mostrar
    jmp factorial  

cero: 
    mov al, 1
    jmp mostrar   

mostrar:
    add al, '0'
    mov [operacion], al
    
    escribir msj2, len2
    escribir operacion, 1

    jmp salir

salir: 
    escribir new_line, 1

    mov eax, 1
    int 80h
