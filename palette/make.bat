@echo off
set KICKASS_PATH="..\..\bin\Kickass.jar"
Taskkill /IM xpet.exe /F
call java -jar %KICKASS_PATH% palette.asm -o palette.pet

@echo call ..\..\bin\exomizer.exe mem -B palette.pet,$4a00 -o palette_exo.bin  
start palette.pet