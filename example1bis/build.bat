del *.o
del *.elf
arm-none-eabi-gcc -x assembler-with-cpp -c -O0 -mcpu=cortex-m4 -mthumb -Wall init.S -o init.o
arm-none-eabi-gcc init.o -mcpu=cortex-m3 -mthumb -Wall --specs=nosys.specs -nostdlib -lgcc -T./linker_script.ld -o main.elf
echo "=============================="
arm-none-eabi-nm main.elf
arm-none-eabi-objdump -d init.o
