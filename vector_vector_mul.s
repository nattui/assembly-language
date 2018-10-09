	AREA myCode, CODE
	EXPORT __main
	ALIGN
	ENTRY

__main PROC

	LDR R0, =a
	LDR R1, =b
	LDR R2, =c

	LDR R10, [R2]

	LDR R4, [R0, #0]		; A[0]
	LDR R5, [R1, #0]		; B[0]
	MLA R10, R4, R5, R10	; (A[0] * B[0]) + c

	LDR R4, [R0, #4]		; A[1]
	LDR R5, [R1, #4]		; B[1]
	MLA R10, R4, R5, R10	; (A[1] * B[1]) + c
	
	LDR R4, [R0, #8]		; A[2]
	LDR R5, [R1, #8]		; B[2]
	MLA R10, R4, R5, R10	; (A[2] * B[2]) + c

	LDR R4, [R0, #12]		; A[3]
	LDR R5, [R1, #12]		; B[3]
	MLA R10, R4, R5, R10	; (A[3] * B[3]) + c

	LDR R4, [R0, #16]		; A[4]
	LDR R5, [R1, #16]		; B[4]
	MLA R10, R4, R5, R10	; (A[4] * B[4]) + c
	
	STR R10, [R2]

stop B stop

	ENDP
		
	AREA myData, DATA
	ALIGN

a	DCD 0, -1, 2, -3, 4
b	DCD 1, 2, 3, 4, 5
c   DCD 0

	END