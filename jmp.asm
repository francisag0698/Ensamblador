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

    msj3 db 10,"La suma es: "
    len3 equ $-msj3

    msj4 db 10,"La resta es: "
    len4 equ $-msj4

    msj5 db 10,"La multiplicacion es: "
    len5 equ $-msj5

    msj6 db 10,"El cociente: "
    len6 equ $-msj6

    msj7 db 10,"El residuo: "
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
;*********************Ingrese el primer numero ********************
    escribir msj1, len1
    leer n1, 2

;*********************Ingrese el segundo numero ********************
    escribir msj2, len2
    leer n2, 2
;**********************jmp*******************************
    jmp dividir

;*********************proceso de suma********************
sumar:
    mov ax, [n1] ;se ubica los numeros en los registros
    mov bx, [n2] ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    sub bx, '0' ;se convierte de caracter a numero
    add ax, bx ;sumamos los valores
    add ax, '0' ;convertimos de carcater a numero

    mov[suma], ax

    escribir msj3, len3
    escribir suma, 1

    jmp multiplicar
;*********************proceso resta**********************
restar:
    mov ax, [n1] ;se ubica los numeros en los registros
    mov bx, [n2] ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    sub bx, '0' ;se convierte de caracter a numero
    sub ax, bx ;sumamos los valores
    add ax, '0' ;convertimos de carcater a numero

    mov[resta], ax

    escribir msj4, len4
    escribir resta, 1

    jmp sumar
;*********************proceso multiplicacion*************
multiplicar:
    mov ax, [n1] ;se ubica los numeros en los registros
    mov bl, [n2] ;se ubica los numeros en los registros
    sub ax, '0' ;se convierte de caracter a numero 
    sub bl, '0' ;se convierte de caracter a numero
    mul bl ;sumamos los valores
    add ax, '0' ;convertimos de carcater a numero

    mov[multiplicacion], ax

    escribir msj5, len5
    escribir multiplicacion, 1

    jmp salir
;*********************proceso de division****************
dividir:
    mov al, [n1] 
    mov bl, [n2] 
    sub ax, '0' 
    sub bl, '0' 
    div bl ;
    add al, '0' 
    add ah, '0'

    mov [cociente], al
    mov [residuo], ah

    escribir msj6, len6
    escribir cociente, 1
    escribir msj7, len7
    escribir residuo, 1

    jmp restar
;****************** operacion salir ******************

salir:
    escribir new_line, 1
    
    mov eax, 1
    int 80h