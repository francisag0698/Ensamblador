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
    asterisco db '*'

    new_line db 10,''
section .bss
        contador_bx resb 1
        contador_cx resb 1

section .text
    global _start

_start:

    mov ecx, 9

l1:
    push ecx
    ;mov ebx, ecx
    ;push ebx
    call imprimir
    pop ecx
    ;mov ecx, ebx
    push ecx

l2:
    push ecx
    call imprimir_asterisco
    pop ecx

    loop l2

    pop ecx
    ;mov ecx, ebx
    loop l1

    jmp salir

imprimir:
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, 1
    int 80h

    ret 

imprimir_asterisco:
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h

    ret
            

salir:    
    mov eax, 1
    int 80h

    