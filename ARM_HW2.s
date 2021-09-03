; Template for all our STM3F103RB assembly programs

; Assember directives
          PRESERVE8
          THUMB       
 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     ; Stack is descending stack in ARM
		
          DCD  Reset_Handler  ; reset vector
  
          ALIGN
 
; Entry to your program

 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler
	mov r0, #0x7
	mov r1, #0x9
	cmp r1, R1
	
	ITTE LT
	addlt r2, r1, r0
	addlt r3, r1, r0
	subge r2, r1, r0
	
	ITE GT
	addgt r4, r1, r0
	suble r4, r1, r0
	
	 
STOP  
	   	  B  STOP
 
          END
			  
			  
			  
			  
			  