%macro escribir 2
	mov eax,4  
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax,3  
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data

    msj db "Ingrese el numero de mensajes", 10
    len equ $-msj

    msj1 db 10,"mesaje: "
    len1 equ $-msj1

    msj_enter db 10,""

section .bss
    n1 resb 1
    numero resb 2

section .text
    global _start

_start:

    escribir msj, len
    leer n1, 1

    mov ecx, [n1]
    sub ecx, '0'

ciclo: 
    push ecx
    add ecx, '0'
    mov [numero], ecx
    escribir msj1, len1
    escribir numero, 1
    pop ecx
    loop ciclo

    mov eax, 1
    int 80h
