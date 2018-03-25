.model small
.data
N dw 6
R dw 2
NCR dw 0
.code
mov ax,@data
mov ds,ax
mov ax,N
mov bx,R
call NCRC
INT 3

NCRC PROC
cmp bx,ax;comparing R=N
JE R1;jump if bx=ax, res=1

cmp bx,01
JE R2
dec ax

cmp bx,ax
JE R3
push ax
push bx
call NCRC
pop bx
pop ax
dec dx
push ax
push bx
call NCRC
pop bx
pop ax
ret

R1:inc NCR
   ret
R3:inc NCR
R2:add NCR,ax
   ret
NCRC ENDP
end