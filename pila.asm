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
    msj db 10,'*'
    len equ $-msj

section .bss

section .text
    global _start

_start:
    mov ecx, 9
    jmp principal

principal:    

    cmp ecx, 0
    jz salir ;o... jr se activa solo si hay cero
    jmp imprimir

imprimir:
    dec ecx
    push ecx
    escribir msj, len
    pop ecx
    jmp principal

salir:
    mov eax, 1
    int 80h
