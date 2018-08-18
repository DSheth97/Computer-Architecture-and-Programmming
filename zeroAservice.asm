Mydata SEGMENT
     msg1 db 0ah,0dh,"Enter the string using 0AH Service : $"
    str1 db 100
        db 0
        db 100 dup("$")
     nl db 0ah,0dh,'$'    
Mydata Ends

Mycode SEGMENT
    Assume CS:Mycode, DS:Mydata
start:
    mov ax,Mydata
    mov ds,ax

    mov ah,09h
    lea dx,msg1
    int 21h
    
    Mov ah,0ah
    lea dx,str1
    int 21h
    
    mov ah,09h
    lea dx,nl
    int 21h
    
    mov ah,09h
    mov dx,offset str1+2
    int 21h

    Mov ah,4ch
    int 21h

Mycode Ends
  END Start

    