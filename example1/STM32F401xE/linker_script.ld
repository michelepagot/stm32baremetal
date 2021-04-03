/* Define the end of RAM and limit of stack memory */
/* Reference chip STM32F401CEU6 */
/* (96KB SRAM on the STM32F401CEU6 line, 96*1024 = 98304 = 0x18000) */
/* (RAM starts at address 0x20000000) */
_estack = 0x20018000; 

MEMORY
{
   FLASH ( rx )      : ORIGIN = 0x08000000, LENGTH = 512K
   RAM ( rxw )       : ORIGIN = 0x20000000, LENGTH = 96K
}
