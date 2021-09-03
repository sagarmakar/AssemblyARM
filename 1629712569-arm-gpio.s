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
	
	; enable clock to port B
	; Configure pin 8 and 9  of port B as output pins
	; reset these pins

	mov32 r0, #0x40021000 ; This is the base address of RCC register
    mov r1, #0x8          ; 8 has bit 3 = 1
	str r1,[r0,#0x18]     ; r0 + #0x18 = address of RCC_APB2ENR
	
	
	mov32 r0,#0x40010C00   ; GPIOB base address
	mov r1, #0x77          ; 0x77 needs to be written to GPIOB_config register_high to make
						   ; pin 8 and 9 open-drain output
	str r1, [r0, #0x4]     ; write 0x77 to the register
	
main	
	mov r1,#0x100          ; 100 Hex = 0001 0000 0000   Bit8= 1, Bit9 = 0 
	str r1, [r0,#0xc]      ; r0+0xc gives us the address of GPIOB_ODR  
	
	mov32 r2, #0x1fffff    ; beginning of delay loop 
loop
	subs r2,r2,#0x1
	bne loop               ;end of delay loop?  
	
	mov r1,#0x200		   ; 200H = 0010 0000 0000 	 
	str r1, [r0,#0xc]
	
	mov32 r2, #0x1fffff    ; another delay loop
loop1
	subs r2,r2,#1
	bne loop1
	
	b main
 
          END	