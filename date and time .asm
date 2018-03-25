.model small
.data
dispm MACRO msg
lea dx,msg
mov ah,09h
int 21h
ENDM
disp MACRO
mov ah,02h
int 21h
ENDM
msg1 db "The Time is:$"
msg2 db 10,13, "The Date is:$"
.code

mov ax,@data
mov ds,ax

dispm msg1
mov ah,2ch
int 21h
mov al,ch
call disp1
mov dl,':'
disp
mov al,cl
call disp1

dispm msg2
mov ah,2ah
int 21h
mov al,dl
call disp1
mov dl,'/'
disp
mov al,dh
call disp1
mov dl,'/'
disp
add cx,0C30h
mov al,ch
call disp1
mov al,cl
call disp1
INT 3

disp1 PROC
AAM
add ax,3030h
mov bx,ax
mov dl,bh
disp
mov dl,bl
disp
ret
disp1 ENDP
end
