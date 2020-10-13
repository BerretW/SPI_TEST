for %%a in (".\src\*.asm") do (
ca65.exe -o .\output\%%~na.o .\%%a
)
cd .\output
cl65.exe main.o acia.o zeropage.o -C ..\config\APP_RAM_DISK.cfg -o ramdisk.bin
cl65.exe main.o acia.o zeropage.o -C ..\config\APP.cfg -o ROM.bin
cl65.exe main.o acia.o zeropage.o -C ..\config\bank_ram_disk.cfg -o BANK.bin
