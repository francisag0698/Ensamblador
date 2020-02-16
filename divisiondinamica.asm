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
    msj1 db "Ingrese el primer numero: ", 10
    len1 equ $-msj1

    msj2 db "Ingrese el segundo numero: ", 10
    len2 equ $-msj2

    mensaje db 10,"El cociente: ", 10; = new line
    len equ $-mensaje

    mensaje02 db 10,"El residuo: ", 10
    len02 equ $-mensaje02

section .bss

    n1 resb 1
    n2 resb 1
    division resb 1
    residuo resb 1

section .text
    global _start
_start:

 ;*********************Ingrese el primer numero ********************
    escribir msj1, len1
    leer n1, 2

;*********************Ingrese el segundo numero ********************
    escribir msj2, len2
    leer n2, 2

;*********************proceso de suma********************
    ;mov ah, 0
    mov al, [n1] ;se ubica los numeros en los registros
    mov bl, [n2] ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    sub bl, '0' ;se convierte de caracter a numero
    div bl ;division los valores
    add al, '0' ;convertimos de carcater a numero
    add ah, '0'

    mov [division], al
    mov [residuo], ah
;****************** imprime division ******************
    escribir mensaje, len
    escribir division, 1
    escribir mensaje02, len02
    escribir residuo, 1

    mov eax, 1
    int 80h