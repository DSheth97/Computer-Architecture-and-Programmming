readnum macro num
    mov ah,01h
    int 21h
    sub al,'0'
    mov bh,0ah
    mul bh
    mov num,al
    mov ah,01h
    int 21h
    sub al,'0'
    add num, al
    endm
    
    printstring macro msg
        mov ah,09h
        mov dx,offset msg
        int 21h
        endm

 _data segment
     nl db 0ah,0dh,'$'
     msg1 db "Enter Number <XX> $"
     msg2 db 0ah,0dh,"Even number $"
     msg3 db 0ah,0dh,"Odd number $"
     num db ?
 _data ends
 _code segment
     assume cs:_code, ds:_data
     start: mov ax,_data
            mov ds, ax
            
            printstring msg1
            readnum num
            
            mov ah,00
            mov al,num
            mov bl,02
            div bl
            cmp ah,00
            je evennum
            printstring msg3
            jmp skip
 evennum: printstring msg2
 skip: mov ah,4ch
        int 21h
    _code ends
    end start