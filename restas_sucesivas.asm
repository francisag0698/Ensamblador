
;elaborado por: Francisco Agreda



%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro ammm 1
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, 1
        int 80h
%endmacro


section .data
        msj db "Ingrese el numero del dividendo:",10
        len1 equ $ - msj
        msj2 db "Ingrese el numero del divisor:",10
        len2 equ $ - msj2

        mensajen1 db 10,"El cociente: ",10
        lenn1 equ $ - mensajen1

        mensajen2 db 10,"El residuo: ",10
        lenn2 equ $ - mensajen2

        new_line db 10,

section .bss
        n1 resb 1
        n2 resb 2
        resta resb 1
        coc resb 1
        resid resb 1
section .text
        global _start ; establece una posición de memoria
_start:

      
; ingreso del dividendo

        escribir msj, len1 

        leer n1, 2


; ingreso del divisor

        escribir msj2, len2

        leer n2, 2 

        mov al, [n1]
	    mov bl, [n2]
	    mov cx, 0
	    sub al, '0'
	    sub bl, '0'

division: 
        sub al, bl
	    inc cx
	    cmp al,bl
	    jg division
        je division
	    jmp mostrar
mostrar: 
	    add al,'0'
	    add cx,'0'
	    mov [coc], cx
	    mov [resid], al

        escribir mensajen1, lenn1
        ammm coc

        escribir mensajen2, lenn2
        ammm resid

        jmp salir
salir: 

        escribir new_line, 1
        mov eax, 1
        int 80h 