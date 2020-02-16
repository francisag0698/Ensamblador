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
    msj1 db "Ingrese la base", 10
    len1 equ $-msj1

    msj2 db "Ingrese el exponente", 10
    len2 equ $-msj2

    msj3 db "El resultado es:", 10
    len3 equ $-msj3

    new_line db 10,

section .bss
    n1 resb 1
    n2 resb 1
    operacion resb 1
section .text
    global _start

_start:     

    escribir msj1, len1
    leer n1, 2

    escribir msj2, len2
    leer n2, 2

    mov al, [n1]
    mov bl, [n1]
    mov cl, 0
    mov dl, [n2] 
    sub al, '0'
    sub bl, '0'
    sub dx, '0'

potencia: 
    inc cl
    cmp cl, dl
    jg cero
    je mostrar
    jmp multi

multi:
    mul bl 
    jmp potencia    

cero: 
    mov al, 1
    jmp mostrar   

mostrar:
    add al, '0'
    mov [operacion], al
    
    escribir msj3, len3
    escribir operacion, 1

    jmp salir

salir: 
    escribir new_line, 1

    mov eax, 1
    int 80h



