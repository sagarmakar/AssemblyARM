          PRESERVE8
          THUMB      
  
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors
 DCD  0x20001000     ; Stack is descending stack in ARM

          DCD  Reset_Handler  ; reset vector
          ALIGN
 
          AREA    MYCODE, CODE, READONLY
 
     ENTRY
     EXPORT Reset_Handler
  
Reset_Handler
	mov r0, #0x1
	mov r1, #0x5
	mov r2, #0x6
	mov r5, r1
	mov r7, r0
	mul r1, r1, r1
	mul r0, r0, r2
	sub r1,  r0, lsl #2
	mov r0, #0x0
	mov r3,#0x1
	cmp r1, #0x0
	beq STOP
Loop
	add r0, r0, #0x1
	mul r3, r0, r0
	cmp r1, r3 
	bne Loop
	
	
	subs r6, r6, r0
	subs r6, r6, r5
	subs r5, r0, r5
div
	mov r6, r6, asr #1
	mov r5, r5, asr #1
	sub r7, #1
	cmp r7, #0
	bne div
	

STOP  
   B  STOP
 
          END 
