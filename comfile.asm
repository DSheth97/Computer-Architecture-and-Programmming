_code segment
    assume cs:_code, ds:_code
    ;   org 100
start: jmp skip
    msg db "Welcome to Assembly Programming$"
skip: mov ax,cs
      mov ds, ax
      
      mov ah,09h
      mov dx,offset msg
      int 21h
      
      mov ah,4ch
      int 21h
  _code ends
      end start