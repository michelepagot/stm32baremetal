Directly inspired by greate article at https://vivonomicon.com/2018/04/02/bare-metal-stm32-programming-part-1-hello-arm/
It is an attempt to port original article code to STM32F411x

It is a Cortex4 with  512KB Flash and 128KB RAM

Build it with:

    build.bat

Start the debug server with https://github.com/stlink-org/stlink/releases/tag/v1.6.1:

    > st-util
    st-util
    libusb: warning [enumerate_hcd_root_hub] could not infer VID/PID of HCD root hub from 'ROOT\NXUSBH\0000'
    libusb: warning [winusb_get_device_list] could not retrieve port number for device 'NXUSBS\DEVICES\0000': [13] The data is invalid.
    2021-04-01T01:46:18 INFO common.c: stm32f411re: 128 KiB SRAM, 512 KiB flash in at least 16 KiB pages.
    2021-04-01T01:46:18 INFO gdb-server.c: Listening at *:4242...

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
    Transfer rate: 46 bytes/sec, 28 bytes/write.
    (gdb) c
    Continuing.
    
    Program received signal SIGTRAP, Trace/breakpoint trap.
    0xfffffffe in ?? ()
    (gdb) info registers
    r0             0x74                116
    r1             0x0                 0
    r2             0x93bfb0            9682864
    r3             0x0                 0
    r4             0x0                 0
    r5             0x0                 0
    r6             0x0                 0
    r7             0xdeadbee6          3735928550
    r8             0xdeadbee7          3735928551
    r9             0xdeadbee8          3735928552
    r10            0xdeadbee9          3735928553
    r11            0x0                 0
    r12            0x0                 0
    sp             0x0                 0x0
    lr             0x20018000          536969216
    pc             0xffffffff          0xffffffff
    cpsr           0x1000000           16777216



And yes the DeadBeef is in R8 and not R7 as expected ... why?

Using openocd  OpenOCD-20210301-0.10.0 there's no issue:

    > openocd -f scripts\interface\stlink-v2.cfg -f scripts\target\stm32f4x.cfg
    > arm-none-eabi-gdb main.elf -ex="target extended-remote :3333"
    ...
    (gdb) info registers
    r0             0x8f80e7            9404647
    r1             0x0                 0
    r2             0x0                 0
    r3             0x0                 0
    r4             0x0                 0
    r5             0x0                 0
    r6             0xdeadbee6          -559038746
    r7             0xdeadbee7          -559038745
    r8             0xdeadbee8          -559038744
    r9             0xdeadbee9          -559038743
    r10            0x0                 0
    r11            0x0                 0
    r12            0x0                 0
    sp             0x20018000          0x20018000
    lr             0xffffffff          -1
    pc             0x800001a           0x800001a <reset_func+18>
    xPSR           0x1000000           16777216
    fpscr          0x0                 0
    msp            0x20018000          0x20018000
    psp            0x0                 0x0
    primask        0x0                 0
    basepri        0x0                 0
    faultmask      0x0                 0
    control        0x0                 0