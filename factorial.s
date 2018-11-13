		AREA myCode, CODE
		EXPORT __main
		ALIGN
		ENTRY

__main 	PROC
	
		MOV R0, #0x03		; arg = 3
		BL 	factorial		; call factorial
stop 	B 	stop            ; while(1)
		ENDP

factorial PROC
		PUSH {R4, LR}       ; preserve regs
		MOV R4, R0          ; use R4 to keep input value
		CMP R4, #0x01       ; if (n == 1)
		BNE recur           ; if not equal, jump to recur
		MOV R0, #0x01       ; otherwise, return value is 1
		B ret               ; return f
recur 	SUB R0, R4, #1      ; arg  = n-1
		BL factorial        ; call factorial
		MUL R0, R4, R0      ; once returned, multiply
                            ; preserved input and return value
ret 	POP {R4, PC}        ; return to the caller by
                            ; popping preserved regs
		
		ENDP
