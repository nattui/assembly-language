		AREA myCode, CODE
		EXPORT __main
		ALIGN
		ENTRY

__main PROC

		LDR R0, =a								; Stores array A in R0
		LDR R1, =b								; Stores array B in R1
		LDR R2, =c								; Stores variable C in R2

		MOV R3, #0    							; Variable i=0 initially
		LDR R4, [R2]  							; Sum

loop 	CMP R3, #10 							; Compares i and 10
		BGE endloop
		LDR R6, [R0], #4 						; Loads a[i] to R6
		LDR R7, [R1], #4 						; Loads b[i] to R7
		MLA R4, R6, R7, R4 						; Sum += a[i] * b[i]
		ADD R3, R3, #1 							; Increments i
		B loop
endloop
		STR R4, [R2] 							; Stores the sum into address C
	
stop B stop
		ENDP
		AREA myData, DATA
		ALIGN
	
a		DCD 0, 1, 2, 3, 4, 5, 6, 7, 8, 9   		; int array A
b		DCD -2, -1, 0, 1, 2, 3, 4, 5, 6, 7		; int array B
c   	DCD 0 									; int variable C
	
	END
