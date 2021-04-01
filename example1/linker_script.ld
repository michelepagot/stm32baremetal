/* Define the end of RAM and limit of stack memory */
/* Reference chip STM32F411x */
/* (128KB SRAM on the STM32F411 line, 128*1024 = 131072 = 0x20000) */
/* (RAM starts at address 0x20000000) */
_estack = 0x20020000; 

MEMORY
{
   FLASH ( rx )      : ORIGIN = 0x08000000, LENGTH = 512K
   RAM ( rxw )       : ORIGIN = 0x20000000, LENGTH = 128K
}
