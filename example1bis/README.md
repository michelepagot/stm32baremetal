Directly inspired by greate article at https://vivonomicon.com/2018/04/02/bare-metal-stm32-programming-part-1-hello-arm/
It is an attempt to port original article code to STM32F103x

It is a Cortex-M3 with  128KB Flash and 20KB RAM

Build it with:

    build.bat

Start the debug server with:

    > st-util
    

connect with dbg, load and run the code:

    > arm-none-eabi-gdb main.elf -ex="target extended-remote :4242"
    c:\10_2020q4\bin\arm-none-eabi-gdb.exe: warning: Couldn't determine a path for the index cache directory.
    GNU gdb (GNU Arm Embedded Toolchain 10-2020-q4-major) 10.1.90.20201028-git
    Copyright (C) 2020 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
    Type "show copying" and "show warranty" for details.
    This GDB was configured as "--host=i686-w64-mingw32 --target=arm-none-eabi".
    Type "show configuration" for configuration details.
    For bug reporting instructions, please see:
    <https://www.gnu.org/software/gdb/bugs/>.
    Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

    For help, type "help".
    Type "apropos word" to search for commands related to "word"...
    Reading symbols from main.elf...
    (No debugging symbols found in main.elf)
    Remote debugging using :4242
    0x00000000 in ?? ()
    (gdb) load
    Loading section .text, size 0x1c lma 0x8000000
    Start address 0x08000000, load size 28
    Transfer rate: 250 bytes/sec, 28 bytes/write.
    (gdb) c
    Continuing.
    
    Program received signal SIGTRAP, Trace/breakpoint trap.
    0xfffffffe in ?? ()
    (gdb) info registers
    r0             0x81d5a4            8508836
    r1             0x0                 0
    r2             0x902940            9447744
    r3             0x0                 0
    r4             0x0                 0
    r5             0x40022000          1073881088
    r6             0x4002200c          1073881100
    r7             0x40022010          1073881104
    r8             0xdeadbeef          3735928559
    r9             0x7ff8fffd          2147024893
    r10            0xfffffedc          4294967004
    r11            0xeda8de17          3987267095
    r12            0x8a556fc6          2320854982
    sp             0x3e                0x3e
    lr             0x20020000          537001984
    pc             0xffffffff          0xffffffff
    cpsr           0x1000000           16777216