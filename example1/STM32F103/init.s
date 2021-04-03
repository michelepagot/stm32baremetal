// STM32F103x

.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb

.global vectortable
.global reset_func

.type vectortable, %object
// Page 204 of the ReferenceManual
vectortable:
     .word _estack
     .word reset_func
.size vectortable, .-vectortable



/*  * The Reset handler. Called on reset.  */
.type reset_func, %function

reset_func:
   // Set the stack pointer to the end of the stack.
   // The '_estack' value is defined in our linker script.
   LDR  r0, =_estack
   MOV  sp, r0

   // Set some dummy values. When we see these values
   // in our debugger, we'll know that our program
   // is loaded on the chip and working.
   LDR  r6, =0xDEADBEE6
   LDR  r7, =0xDEADBEE7
   LDR  r8, =0xDEADBEE8
   LDR  r9, =0xDEADBEE9
   MOVS r0, #0
   main_loop:
     // Add 1 to register 'r0'.
     ADDS r0, r0, #1
     // Loop back.
     B    main_loop
.size reset_func, .-reset_func
