;Realizado por: Francisco Agreda
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
    msj1 db "Ingrese un numero:", 10
    len1 equ $-msj1

    msj2 db 10,"El numero es primo", 10
    len2 equ $-msj2

    msj3 db 10,"El numero no es primo", 10
    len3 equ $-msj3

    new_line db 10,

section .bss
    n1 resb 1
    operacion resb 1
section .text
    global _start

_start:     

    escribir msj1, len1
    leer n1, 2

    mov al, [n1]
    mov bl, 1
    mov cl, 1
    sub ax, '0'

    cmp al, 2
    jg primo
    je comparar
    jmp primo


primo: 
    inc bl
    cmp al, bl
    jg division
    je division
    jmp comparar

division:
    mov al, [n1]
    sub ax, '0'
    div bl
    cmp ah, 0
    jg primo
    je contador 
    jmp primo

contador: 
    inc cl    
    jmp primo

comparar:
    cmp cl, 1
    jg Nprimo
    je Yprimo
    jmp Yprimo

Nprimo:
    escribir msj3, len3
    jmp salir

Yprimo:
    escribir msj2, len2
    jmp salir

salir:
    escribir new_line, 1

    mov eax, 1
    int 80h
    

    ;add cl, '0'
    ;mov [operacion], cl
    
    ;escribir msj2, len2
    ;escribir operacion, 1

    
