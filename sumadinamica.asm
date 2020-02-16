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

    mensaje db "El resultado es: ", 10 ; = new line
    len equ $-mensaje

section .bss

    n1 resb 1
    n2 resb 1
    suma resb 1

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

    mov ax, [n1] ;se ubica los numeros en los registros
    mov bx, [n2] ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    sub bx, '0' ;se convierte de caracter a numero
    add ax,bx ;sumamos los valores
    add ax, '0' ;convertimos de carcater a numero

    mov[suma], ax

;****************** imprime suma ******************
    escribir mensaje, len
    escribir suma, 1
    
    mov eax, 1
    int 80h