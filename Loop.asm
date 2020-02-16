;Programa que comprueba si el resultado de una resta da un numero positivo o negativo
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

	msg db 10,'Item '
	len equ $ - msg	

section .bss
	n1 resb 2

section .text
	global _start
_start:
	
	mov cx,10

ciclo:
	dec cx

	cmp cx,0
	jz salir
	jnz imprimir


imprimir:
	;imprimir el mensaje de Item
	mov eax,4  
	mov ebx,1
	push cx
	mov ecx, msg
	mov edx, len
	int 80h
	pop cx

	;Transformar a Cadena de texto el numero
	add cx,'0'
	mov [n1],cx

	;Imprimir el numero
	mov eax,4  
	mov ebx,1
	push cx
	mov ecx, n1
	mov edx, 2
	int 80h
	pop cx

	;Transformar la Cadena de texto a numero 
	sub cx,'0'
	jmp ciclo
 
salir:
	mov eax,1
	int 80h