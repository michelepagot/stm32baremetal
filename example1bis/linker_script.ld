/* Define the end of RAM and limit of stack memory */
/* Reference chip STM32F103x */
/* (20KB SRAM on the STM32F103 line, 20*1024 = 20480 = 0x5000) */
/* (RAM starts at address 0x20000000) */
_estack = 0x20005000; 

MEMORY
{
   FLASH ( rx )      : ORIGIN = 0x08000000, LENGTH = 128K
   RAM ( rxw )       : ORIGIN = 0x20000000, LENGTH = 20K
}
