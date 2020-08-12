Include Irvine32.inc

.data

TitleName1 Byte "  ================================",0dh,0ah,0
TitleName2 Byte "   DEVELOPED BY ===> Spiders",0dh,0ah,0
TitleName3 Byte "   PROJECT NAME :: TOWER OF HANOI",0dh,0ah,0
TitleName4 Byte "  ================================",0dh,0ah,0
Mymessage Byte "Enter Number Of Discs In Range[2-8] :: ",0
Mymessage1 Byte "Enter Tower1 :: ",0
Mymessage2 Byte "Enter Tower2 :: ",0
Mymessage3 Byte "Enter Tower3 :: ",0
print Byte "Invalid Entry...!!!",0dh,0ah,0
print1 Byte "Valid Entry...!!!",0dh,0ah,0
print2 Byte "DISC ",0
print3 Byte " FROM TOWER ",0
print4 Byte " TO TOWER ",0
print5 Byte "REQUIRED NUMBER OF MOVES FROM TOWER ",0
print6 Byte " TO TOWER ",0
print7 Byte " ARE :: ",0
input dword ?
char1 Byte ?
char2 Byte ?
char3 Byte ?

.code
main Proc

mov edx,offset TitleName1
call writestring
call crlf
mov edx,offset TitleName2
call writestring
call crlf
mov edx,offset TitleName3
call writestring
call crlf
mov edx,offset TitleName4
call writestring
call crlf
mov edx,offset Mymessage
call writestring
call readint
mov input,eax

mov ebx,1
cmp ebx,input
je L1
jl L2
jg L1

L1:
call clrscr
call main
exit

L2:
mov ebx,9
cmp ebx,input
je L1
jl L1
jg L3
exit

L3:

mov edx,offset Mymessage1
call writestring
call readchar
mov char1,al
call writechar
Call crlf

mov edx,offset Mymessage2
call writestring
call readchar
mov char2,al
call writechar
call crlf

mov edx,offset Mymessage3
call writestring
call readchar
mov char3,al
call writechar
call crlf

Mov eax,dword ptr char3
push eax
mov eax,dword ptr char2
push eax
mov eax,dword ptr char1
push eax
mov eax,input
push eax

call crlf
mov edx,offset print5
call writestring
mov eax,dword ptr char1
call writechar
mov edx,offset print6
call writestring
mov eax,dword ptr char3
call writechar
mov edx,offset print7
call writeString

mov eax,1
mov ebx,2
.while(input > 0)
mul ebx
dec input

.endw

sub eax,1
call writeint
Call crlf
Call crlf
Call crlf
call TOH

Call crlf
call crlf
exit


main endp

TOH Proc
Push ebp
mov ebp,esp
Push ebx
push edx
mov ebx,[ebp+8]
.if(ebx<=0)

.Else
push [ebp+16]
push [ebp+20]
push [ebp+12]
mov ebx,[ebp+8]
dec ebx
push ebx
call TOH
mov edx,offset print2
call writestring


mov eax,[ebp+8]
call writeint

mov edx,offset print3
call writestring

mov eax,[ebp+12]
call writechar

mov edx,offset print4
call writestring

mov eax,[ebp+20]
call writechar
call crlf
push [ebp+20]
push [ebp+12]
push [ebp+16]
mov ebx,[ebp+8]
dec ebx
push ebx
call TOH

.endif

pop edx
pop ebx
Mov esp,ebp
pop ebp
ret
exit
TOH endp
end main