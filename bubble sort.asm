.model small
.data
array dw 2120h,1780h,7132h,5731h
len dw ($-array)/2
.code
mov ax,@data
mov ds,ax
mov dx,len ;initialize outer loop
dec dx
outer: mov cx,dx ;initialize inner loop
	   lea si,array ;si:base address of the array
inner: mov ax,[si]
	   cmp ax,[si+2]
JLE next
xchg [si+2],ax;  to swap adjacent elements
xchg [si],ax;
next: add si,02
	  loop inner
	  dec dx
	  JNZ outer
mov ah,4ch
int 21h
end