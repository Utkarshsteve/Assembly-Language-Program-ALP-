.model small
.data
array dw 11h,22h,33h,44h,55h
len dw ($-array)/2
key dw 55h
msg1 db "Key Found$"
msg2 db "Key not found$"
.code
mov ax,@data
mov ds,ax
mov bx,1
mov dx,len
mov cx,key
back:cmp bx,dx
	 JA exit
	 mov ax,bx
	 add ax,dx
	 SHR ax,1
	 mov si,ax
	 add si,si
	 sub si,02
	 cmp cx,array[si]
	 JE found
	 JA incbx
	 mov dx,ax
	 dec dx
	 JMP back
incbx:mov bx,ax
	  inc bx
	  JMP back
found:lea dx,msg1
	  mov ah,09h
	  int 21h
	  JMP term
exit:lea dx,msg2
	 mov ah,09h
	 int 21h
term:int 3
end