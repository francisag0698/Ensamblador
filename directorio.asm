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

    msj1 db "Ingrese el path", 10
    len1 equ $ - msj1

    msj db 10,"Carpeta o directorio creado",10
    len_msj equ $ - msj

    path db '/home/pancho/Escritorio/directorio', 0
    len_path equ $ - path

section .bss
    direc resb 1

section .text
	global _start
_start:

    escribir msj1, len1
    leer direc, 60

    mov eax, 39 ; servicio para crear un directorio
    mov ebx, direc ; define la ruta del servicio
    mov ecx, 0x1FF ; definimos el permiso 777
    int 80h


    escribir msj, len_msj

    mov eax, 1
    int 80h 
    