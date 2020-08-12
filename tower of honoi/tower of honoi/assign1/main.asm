TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data

titlename byte "Course Project Computer Orgnization and Assembly Language",0

myname byte "Course Project By faizan",0

projectname byte "Project : InsertionSort Algorithm",0
ask byte "enter number of inputs you want to insert ",0
IA byte "insert at index ",0
space byte ": ",0
VA byte "Value at index ",0
Sortedarray byte "=========================Sorted array looks like =========================="

 temp Dword 0
insSort Dword 100 DUP(0)
l dword ?
n dword ?


.code


main PROC
	call Clrscr

	mov edx , offset titlename
	 call writestring
	 
	 call crlf
	 call crlf

	   mov edx , offset myname
	 call writestring
	 
	 call crlf
	 
	 call crlf
	   mov edx , offset projectname
	 call writestring
	 
	 call crlf
	 
	 call crlf
	 mov edx , OFFSET ask
	 call writestring 
	  sub eax,eax
	 sub ebx,ebx
	 sub ecx,ecx
	 call readint
	
	 mov n,eax
	 mov ecx,0
	 mov ebx,0
	 call crlf
	
	 .while(ecx<n)
	   mov edx,OFFSET IA
	   call writestring
	   mov eax ,ecx
	   call writedec 
	   mov edx , OFFSET space
	   call writestring 
	   
	   call readint
	   mov insSort[ebx],eax
	   add ebx,4
	   add ecx,1
	 .endw

	 mov l,ebx

		mov ecx , 0
	.while(ecx < l)
	

	mov eax , insSort[ecx]
	mov	temp ,eax

	push ecx
	mov eax , ecx
	
	sub eax , 4
	mov ecx , eax
		
		mov ebx , temp
		.while(ebx<insSort[ecx] && ecx>=0)
		
			mov edx , insSort[ecx]
			
			mov eax, ecx 
			add eax , 4

			mov insSort[eax] , edx

			sub ecx, 4
		
		.endw
		mov eax, ecx 
		add eax , 4

		mov insSort[eax] , ebx
		
		pop ecx

		add ecx,4


	.endw

	call crlf
	call crlf
	mov edx,OFFSET sortedarray
	call writestring
	call crlf 
	call crlf

	mov ebx,0
	
	mov ecx , 0
	.while(ecx < l)
		 mov edx,OFFSET VA
	   call writestring
	   mov eax ,ebx
	   call writedec 
	   mov edx , OFFSET space
	   call writestring 
	   inc ebx
		mov eax, insSort[ecx] 
		call writeint
		call crlf
		 add ecx ,4
    .endw

	exit

main ENDP

END main