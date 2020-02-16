section .data
	mensaje1 db "Ingrese su nombre",10
	len1 equ $-mensaje1
	mensaje2 db "Nombre ingresado es: "
	len2 equ $-mensaje2

section .bss
	nombre resb 5
	len3 equ $-nombre

section .text
	global _start
_start: 
	
	mov eax, 4
	mov ebx, 1 
	mov ecx, mensaje1 
	mov edx, len1 
	int 80H
	
	mov eax, 3 
	mov ebx, 2 
	mov ecx, nombre 
	mov edx, 5 
	int 80H

	mov eax, 4
	mov ebx, 1 
	mov ecx, mensaje2 
	mov edx, len2 
	int 80H

	mov eax, 4 
	mov ebx, 1 
	mov ecx, nombre 
	mov edx, len3 
	int 80H

	mov eax, 1
	int 80H
