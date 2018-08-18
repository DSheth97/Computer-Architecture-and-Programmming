;Program to Reverse A String Using Stack
prnstr macro msg
    mov ah, 09h
    lea dx, msg
    int 21h
    endm
data segment
    buf1 db "Enter a string : $"
    buf2 db 0ah, "Reversed String : $"
    buf3 db 41
         db 0
         db 41 dup(' ')
data ends

stack_str segment stack
    db 40 dup(0)
    stack_top label word
stack_str ends

code segment
    assume cs:code, ds:data
start :
    mov ax, data
    mov ds, ax
    ;    mov es, ax

    mov ax, stack_str
    mov ss, ax
    mov sp, offset stack_top

    prnstr buf1

    mov ah, 0ah
    lea dx, buf3
    int 21h

    mov si, offset buf3 + 2
    mov cl, [si-1]
    mov ch, 00h
    mov ah, 00h
again :
    mov al, [si]
    push ax
    inc si
    loop again

    mov si, offset buf3 + 2
    mov cl,[si-1]
    ;mov ah, 00h
next :
    pop ax
    mov [si], al
    inc si
    loop next

    mov [si],'$'
    prnstr buf2
    prnstr buf3+2
    mov ax, 4c00h
    int 21h
code ends
    end start
