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
	ldr r0, Constant
	ldr r1, =var1
	adds r2, r0, r0, asr #1
	str r2, [r1]

	
STOP  B  STOP

Constant dcd 0x20
     AREA    MYdata, DATA, READWRITE
var1 dcd 0
 
          END	