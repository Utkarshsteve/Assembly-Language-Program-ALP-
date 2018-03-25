.model small
.data
str db "MADAM"
len dw $-str
rstr db 10 dup(0)
msg1 db "Palindrome$"
msg2 db "Not a Palindrome$"
.code
mov ax,@data
mov ds,ax
mov es,ax
mov cx,len
lea si,str
lea di,rstr
add si,len
dec si
back:mov al,[si]
	 mov [di],al
	 dec si
	 inc di
	 loop back
lea si,str
lea di,rstr
mov cx,len

CLD
REPZ CMPSB
JZ viola
lea dx,msg2
mov ah,09h
int 21h
JMP term
viola: lea dx,msg1
	   mov ah,09h
	   int 21h 
term:mov ah,4ch
	 end