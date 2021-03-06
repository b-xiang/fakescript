.code
	CallNativeFunc proc 
	
	push	rbp
	mov		rbp,rsp
	push	rsi
	push	rax
	push	rbx
	push	rcx
	push	rdx
	push	r8
	push	r9
	push	r10

	; 函数指针在rcx
	; 参数地址在rdx
	; 参数个数在r8
	; 返回指针在r9

	; 塞上参数
	mov		rax,0
	mov		r10,rsp
	sub		r10,20h
LOOPBEGIN:
	cmp		rax,r8
	jae		LOOPEND

	; 循环copy参数
	; type
	mov		rbx,qword ptr [rdx]
	mov		qword ptr [r10],rbx
	; data
	mov		rbx,qword ptr [rdx+8h]
	mov		qword ptr [r10+8h],rbx
	
	add		rdx,10h
	sub		r10,10h

	add		rax,1
	jmp		LOOPBEGIN

LOOPEND:
	call    rcx

	; 返回值
	mov		qword ptr [r9],rax
	mov		qword ptr [r9+8h],rdx
	
	pop		r10
	pop		r9
	pop		r8
	pop		rdx
	pop		rcx
	pop		rbx
	pop		rax
	pop		rsi
	leave
	ret 
	CallNativeFunc endp
end