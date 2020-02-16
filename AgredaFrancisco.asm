;-------------------------------Examen de pilas
;Por: Francisco Agreda 
;Fecha: 03/02/2020
;Curso: 6to "A" 


; psdt: el siguiente codigo esta aun incompleto, solo esta funcionando cuando en una suposicion que el numero mayor estuviese en la primera posicion y tendria que moverse a la ultima posicion 
;ejemplo : (5-4-4-4-4) o cualquier otro con la condicion de que el primer valor sea mayor al resto
;falta hacer que el siguiente la etiqueta ciclo se repita 5 veces

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
    msj1 db "Ingrese el primer  numero", 10
    len1 equ $-msj1

    msj2 db "Ingrese el segundo  numero", 10
    len2 equ $-msj2

    msj3 db "Ingrese el tercer  numero", 10
    len3 equ $-msj3

    msj4 db "Ingrese el cuarto  numero", 10
    len4 equ $-msj4

    msj5 db "Ingrese el quinto  numero", 10
    len5 equ $-msj5

    msj6 db "El mayor es: "
    len6 equ $-msj6

    msj7 db "El menor es:"
    len7 equ $-msj7

    msj8 db "Los numeros ordenados de menor a mayor son:", 10
    len8 equ $-msj8

    new_line db 10,''

section .bss
    n1 resb 1
    n2 resb 2
    n3 resb 2
    n4 resb 2
    n5 resb 2

    numero1 resb 2
    numero2 resb 2
    numero3 resb 2
    numero4 resb 2
    numero5 resb 2

    mayor resb 1
    menor resb 1

section .text
    global _start

_start:
    escribir msj1, len1
    leer n1, 2

    escribir msj2, len2
    leer n2, 2

    escribir msj3, len3
    leer n3, 2

    escribir msj4, len4
    leer n4, 2

    escribir msj5, len5
    leer n5, 2

ciclo:    ;aqui se almacena los valores ingresados en los registros, excepto el valor 5 

    mov eax, [n1]
    mov ebx, [n2]
    mov ecx, [n3]
    mov edx, [n4]
    sub eax, '0'
    sub ebx, '0'
    sub ecx, '0'
    sub edx, '0'

    cmp eax, ebx ; se realiza una comparacion para ver si el primer numero es mayor al segundo 
    jg mayor1 ; si es mayor se va a la etiqueta mayor1
    jmp otro   

mayor1: 
    mov eax, [n2] ; el segundo valor se almacena en el primer registro
    mov ebx, [n1] ; el primer valor en el segundo registro
    sub eax, '0'
    sub ebx, '0'
    cmp ebx, ecx ; se compara el segundo registro con el tercer registro
    jg mayor2 ;si es mayor se va a la etiqueta mayor2
    jmp otro

mayor2:
    mov ebx, [n3] ; se almacena el tercer valor en el segundo registro
    mov ecx, [n1] ; se almacena el primer valor en el tercer registro
    sub ebx, '0'
    sub ecx, '0'
    cmp ecx, edx ; se compara el primer tercer registro con el cuarto registro
    jg mayor3 ; si es mayo se va  a la etiqueta mayor3 
    jmp otro

mayor3: 
    mov ecx, [n4] ; se almacena el cuarto valor en el tercer registro
    mov edx, [n1] ; se almacena el primer valor en el cuarto registro
    sub ecx, '0' 
    sub edx, '0'  
     
    push eax ; se rescata con un push el valor del primer registro para perderlo 
    mov eax, [n5] ; una ves rescatado el valor, se puede utilizar el primer registro para almacenar el quinto valor
    sub eax, '0'
    ;push eax 
    push edx
    cmp eax, edx ; se compara el primer registro con el cuarto registro
    jg mayor4 ; si es mayor se va a la etiqueta mayor4
    jmp menor4 ; si es menor se va a la etiqueta menor4

mayor4:
    pop edx
    pop eax
    add eax, '0'
    add ebx, '0'
    add ecx, '0'
    add edx, '0'
    push eax
    mov [mayor], eax ; como fue mayor el registro eax , en teoria el mayor numero de todos quinto valor del registro eax
    pop eax
    mov [n5], eax 
    mov [n4], edx
    mov [n3], ecx 
    mov [n2], ebx
    pop eax ; una ves utilizado el registro eax para el quinto valor, se devuelve el valor rescatodo con pop al registro eax 
    add eax, '0'
    mov [n1], eax 
    ;jmp ciclo
    jmp presentar

menor4:
    ;pop eax
    ;pop edx
    add eax, '0'
    add ebx, '0'
    add ecx, '0'
    add edx, '0'
    mov [mayor], edx ; como fue mayor el registro edx , en teoria el mayor numero de todos primer valor del registro edx      
    mov [n5], edx
    mov [n4], eax
    mov [n3], ecx 
    mov [n2], ebx
    pop eax ; una ves utilizado el registro eax para el quinto valor, se devuelve el valor rescatodo con pop al registro eax 
    
    add eax, '0'
    mov [menor], eax
    
    mov [n1], eax
    ;jmp ciclo
    jmp presentar

presentar:
    mov [numero1], eax
    mov [numero2], ebx
    mov [numero3], ecx
    mov [numero4], edx
    mov eax, [n5]
    mov [numero5], eax

    escribir msj8, len8

    escribir numero1, 1 
    escribir numero2, 1 
    escribir numero3, 1 
    escribir numero4, 1 
    escribir numero5, 1 

    escribir new_line, 1
    escribir msj6, len6
    escribir mayor, 1

    escribir new_line, 1
    escribir msj7, len7
    escribir menor, 1

    jmp salir

otro:
    jmp ciclo    


salir: 
    mov eax, 1
    int 80h