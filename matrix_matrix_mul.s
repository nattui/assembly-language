	AREA myCode, CODE
	EXPORT __main
	ALIGN
	ENTRY

__main PROC
	
	ldr R0, =a
	ldr R1, =b
	ldr R2, =c

	mov R3, #0

i
	cmp R3, #4
	bgt exit
	
	mov R4, #0
j
	cmp R4, #4
	bgt exit_j

	; Resets R5
	mov R5, #0
k
	cmp R5, #4
    bgt exit_k
	
	mov R6, #5 						
	mov R7, #4 						
	mla R6, R3, R6, R5 		
	mla R6, R6, R7, R0 			
	ldr R6, [R6] 					
	   
	mov R7, #5
	mov R8, #4
	mla R7, R5, R7, R4 				
	mla R7, R7, R8, R1
	ldr R7, [R7] 
	   
	mov R8, #5
	mov R9, #4						
	mla R8, R3, R8, R4 
	mla R8, R8, R9, R2 	
	ldr R9, [R8] 	
	   
	mul R10, R6, R7				
	add R10, R10, R9
	str R10, [R8] 
	
	add R5, R5, #1
	B k

exit_k 
	add R4, R4, #1
	B j
	  
exit_j
	add R3, R3, #1
	B i
exit

stop B stop
	
	ENDP	
	AREA myData, DATA
	ALIGN

a	DCD  0,  1,  2,  3,  4
	DCD  5,  6,  7,  8,  9
	DCD 10, 11, 12, 13, 14
	DCD 15 ,16, 17, 18, 19
	DCD 20, 21, 22, 23, 24
b	DCD 24, 23, 22, 21, 20
	DCD 19, 18, 17, 16, 15
	DCD 14, 13, 12, 11, 10
	DCD  9,  8,  7,  6,  5
	DCD  4,  3,  2,  1,  0
c   DCD  0,  0,  0,  0,  0
	DCD  0,  0,  0,  0,  0
	DCD  0,  0,  0,  0,  0
	DCD  0,  0,  0,  0,  0
	DCD  0,  0,  0,  0,  0
	
	END
