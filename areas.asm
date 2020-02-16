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

    msj0 db 10,"Ingrese una opcion: ", 10
    len0 equ $-msj0

    msj1 db "Ingrese el lado del cuadrado: ", 10
    len1 equ $-msj1

    msj2 db "Ingrese la base del rectangulo ", 10
    len2 equ $-msj2

    msj3 db "Ingrese la altura del rectangulo ", 10
    len3 equ $-msj3

    msj4 db "Ingrese el radio del circulo", 10
    len4 equ $-msj4




    msj5 db 10,"El area del cuadrado es: "
    len5 equ $-msj5

    msj6 db 10,"El area del rectangulo es: "
    len6 equ $-msj6

    msj7 db 10,"El area del circulo es: "
    len7 equ $-msj7

    new_line db 10,

section .bss
    opcion resb 1
    n1 resb 1
    n2 resb 1
    n3 resb 1
    n4 resb 1
    cuadrado resb 1
    rectangulo resb 1
    operacion resb 1
    circulo resb 1

section .text
    global _start
_start:
;*********************Ingrese la opcion ***************************
opciones:
    escribir msj0, len0
    leer opcion, 2
    mov bh, [opcion]
    sub bh, '0'    
;**********************cmp*******************************
    cmp bh, 1
        je cuadrados
    cmp bh, 2
        je rectangulos
    cmp bh, 3
        je circulos
    cmp bh, 4
        je salir 

;*********************area cuadrado**********************
cuadrados:
    escribir msj1, len1
    leer n1, 2

    mov ax, [n1] ;se ubica los numeros en los registros
    mov bl, [n1] ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    sub bl, '0' ;se convierte de caracter a numero
    mul bl ;sumamos los valores
    add ax, '0' ;convertimos de carcater a numero

    mov[cuadrado], ax

    escribir msj5, len5
    escribir cuadrado, 1

    jmp opciones

;*******************area rectangulo**********************
rectangulos:
    escribir msj2, len2
    leer n2, 2

    escribir msj3, len3
    leer n3, 2

    mov ax, [n2] ;se ubica los numeros en los registros
    mov bl, [n3] ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    sub bl, '0' ;se convierte de caracter a numero
    mul bl ;sumamos los valores
    add ax, '0' ;convertimos de carcater a numero

    mov[rectangulo], ax

    escribir msj6, len6
    escribir rectangulo, 1   

    jmp opciones

;******************area del circulo**********************
circulos:
    escribir msj4, len4
    leer n4, 2
    
    mov ax, [n4] ;se ubica los numeros en los registros
    mov bl, [n4] ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    sub bl, '0' ;se convierte de caracter a numero
    mul bl ;sumamos los valores
    add ax, '0' ;convertimos de carcater a numero

    mov[operacion], ax

    mov ax, [operacion] ;se ubica los numeros en los registros
    mov bl, 3 ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    ;sub bl, '0' ;se convierte de caracter a numero
    mul bl ;sumamos los valores
    add ax, '0' ;convertimos de carcater a numero

    mov[circulo], ax

    escribir msj7, len7
    escribir circulo, 1   

    jmp opciones

;****************** operacion salir ******************
salir:
    escribir new_line, 1
    
    mov eax, 1
    int 80h