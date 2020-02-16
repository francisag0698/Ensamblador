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

    msj2 db 10,'Item '
    len2 equ $-msj2
section .bss
    n1 resb 1
    numero resb 1
section .text
    global _start

_start:
    
    escribir msj1, len1
    leer n1, 1
    mov ecx, [n1]
    sub ecx, '0'

ciclo:

    cmp ecx, 0
    jz salir
    jnz imprimir

imprimir:
    add ecx, '0'
    mov [numero], ecx
    sub ecx, '0'
    push ecx
    escribir msj2, len2
    escribir numero, 2
    pop ecx
    dec ecx
    jmp ciclo

salir:
    mov eax, 1
    int 80h    
    
    
