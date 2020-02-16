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
    msj1 db 10,"Numero mayor ",10
    len1 equ $-msj1

    msj2 db 10,"Numero menor ",10
    len2 equ $-msj2

    msj3 db 10,"Numero igual",10
    len3 equ $-msj3

    msj4 db "Ingrese el primer numero: ", 10
    len4 equ $-msj4

    msj5 db "Ingrese el segundo numero: ", 10
    len5 equ $-msj5

    new_line db 10,

section .bss
    n1 resb 2
    n2 resb 2

section .text
    global _start
_start:

;*********************Ingrese el primer numero ********************
    escribir msj4, len4
    leer n1, 2

;*********************Ingrese el segundo numero ********************
    escribir msj5, len5
    leer n2, 2

    mov ax, [n1] ; estaticos
    mov bx, [n2]; estaticos
    sub ax, '0' ;se convierte de caracter a numero 
    sub bx, '0' ;se convierte de caracter a numero
    cmp ax, bx ; resta binaria
    
    jg mayor ; ZF = 0, CF = 0
    je igual
    jmp menor;

mayor:         
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, len1
    int 80h
    jmp salir 

menor:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len2
    int 80h
    jmp salir      

igual:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj3
    mov edx, len3
    int 80h
       

salir:
    escribir new_line, 1
    
    mov eax, 1
    int 80h    