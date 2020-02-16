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
    msj1 db "Ingrese el primer numero", 10
    len1 equ $-msj1

    msj2 db 10,"Ingrese el segundo numero", 10
    len2 equ $-msj2

    msj3 db 10,"La suma es:", 10
    len3 equ $-msj3

    msj4 db 10,"La resta es:", 10
    len4 equ $-msj4

    msj5 db 10,"La multiplicacion es:", 10
    len5 equ $-msj5

    msj6 db 10,"El cociente es:", 10
    len6 equ $-msj6

    msj7 db 10,"EL residuo es:", 10
    len7 equ $-msj7

    new_line db 10,

section .bss
    n1 resb 1
    n2 resb 1
    suma resb 1
    resta resb 1
    multiplicacion resb 1
    cociente resb 1
    residuo resb 1

section .text
    global _start

_start:
    escribir msj1, len1
    leer n1, 2

    escribir msj2, len2
    leer n2, 2

    mov ax, [n1]
    mov bx, [n2]
    sub ax, '0'
    sub bx, '0'
    add ax, bx
    add ax, '0'
    mov [suma], ax

    mov ax, [n1]
    mov bx, [n2]
    sub ax, '0'
    sub bx, '0'
    sub ax, bx
    add ax, '0'
    mov [resta], ax

    mov ax, [n1]
    mov bl, [n2]
    sub ax, '0'
    sub bl, '0'
    mul bl
    add ax, '0'
    mov [multiplicacion], ax

    mov al, [n1]
    mov bl, [n2]
    sub al, '0'
    sub bl, '0'
    div bl
    add al, '0'
    mov [cociente], al
    add ah, '0'
    mov [residuo], ah

    escribir msj3, len3
    escribir suma, 1

    escribir msj4, len4
    escribir resta, 1

    escribir msj5, len5
    escribir multiplicacion, 1

    escribir msj6, len6
    escribir cociente, 1

    escribir msj7, len7
    escribir residuo, 1

    escribir new_line, 1

    mov eax, 1
    int 80h