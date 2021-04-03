/* Define the end of RAM and limit of stack memory */
/* Reference chip STM32F411x */
/* (128KB SRAM on the STM32F411 line, 128*1024 = 131072 = 0x20000) */
/* (RAM starts at address 0x20000000) */
_estack = 0x20020000; 

MEMORY
{
   RAM ( xrw )       : ORIGIN = 0x20000000, LENGTH = 128K
   FLASH ( rx )      : ORIGIN = 0x8000000, LENGTH = 512K
}
SECTIONS
{
  /* The startup code goes first into FLASH */
  .isr_vector :
  {
    . = ALIGN(4);
    KEEP(*(.isr_vector)) /* Startup code */
    . = ALIGN(4);
  } >FLASH
  .text :
  {
    . = ALIGN(4);
    *(.text)           /* .text sections (code) */
    *(.text*)          /* .text* sections (code) */
    KEEP (*(.init))
    KEEP (*(.fini))

    . = ALIGN(4);
    _etext = .;        /* define a global symbols at end of code */
  } >FLASH
}


