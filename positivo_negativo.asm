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
	
	msg_n1 db 'Ingresa el primer numero '
	len_n1 equ $ - msg_n1

	msg_n2 db 10,'Ingresa el segundo numero '
	len_n2 equ $ - msg_n2

	msg_positivo db 'Es positivo',10
	len_positivo equ $ - msg_positivo

	msg_negativo db 'Es negativo',10
	len_negativo equ $ - msg_negativo
	
section .bss
	n1 resb 2
	n2 resb 2

section .text
	global _start
_start:
	
	escribir msg_n1,len_n1
	leer n1,2

	escribir msg_n2,len_n2
	leer n2,2

	mov ax,[n1]
	mov bx,[n2]

	sub ax,'0'
	sub bx,'0'
	
	sub ax,bx ;Se realiza la resta para que se cambien las banderas

	js negativo 
	jmp positivo
 
 negativo:
 	escribir msg_negativo,len_negativo
	jmp salir

positivo: 
	escribir msg_positivo,len_positivo
	jmp salir

salir:
	mov eax,1
	int 80h