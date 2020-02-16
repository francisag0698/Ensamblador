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
    msj db 'Ingrese el tamaño del cubo: ', 10
    len equ $-msj

    msj1 db '*'
    len1 equ $-msj1

    msj_enter db 10,""
section .bss
    n1 resb 1
    numero resb 1
section .text
    global _start

_start:
    escribir msj, len
    leer n1, 1 

    mov ebx, [n1]
    sub ebx, '0'
    mov ecx, ebx

i:
    push ebx
    cmp ebx, 0
    jz salir
    jnz j  

j:
    push ecx
    escribir msj1, len1
    pop ecx
    dec ecx
    cmp ecx, 0
    jz salto_linea
    jnz j

salto_linea:
    escribir msj_enter, 1
    pop ebx
    dec ebx

    mov ecx, [n1]
    sub ecx, '0'

    jmp i

salir:
    mov eax, 1
    int 80h