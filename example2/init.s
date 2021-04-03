// STM32F411x

.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.global vectortable
.global reset_func

.section  .isr_vector,"a",%progbits
.type vectortable, %object
.size vectortable, .-vectortable
// Page 201 of STM32F411CEU6_ReferenceManual
vectortable:
     .word _estack
     .word reset_func




/*  * The Reset handler. Called on reset.  */
.section  .text.reset_func
.weak  reset_func
.type reset_func, %function

reset_func:
   // Set the stack pointer to the end of the stack.
   // The '_estack' value is defined in our linker script.
   LDR  sp, =_estack


   // Set some dummy values. When we see these values
   // in our debugger, we'll know that our program
   // is loaded on the chip and working.
   LDR  r7, =0xDEADBEEF
   MOVS r0, #0
   main_loop:
     // Add 1 to register 'r0'.
     ADDS r0, r0, #1
     // Loop back.
     B    main_loop
.size reset_func, .-reset_func
