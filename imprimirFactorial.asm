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
    msj db 'Ingrese un numero: ', 10
    len equ $-msj

    msj_enter db 10,""
section .bss
    n1 resb 2
section .text
    global _start

_start:
    escribir msj, len
    leer n1, 1 
    jmp imprimir

imprimir:

    mov eax, [n1]
    push eax

    escribir n1, 1
    escribir msj_enter, 1

    pop eax
    sub eax, '0'
    dec eax
    mov ecx, eax
    add eax, '0'
    mov [n1], eax
    cmp ecx, 0
    jz salir
    jmp imprimir

salir:
    mov eax, 1
    int 80h