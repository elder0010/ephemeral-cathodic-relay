@echo off
set KICKASS_PATH="..\bin\KickAss\KickAss.jar"
Taskkill /IM xpet.exe /F
java -jar %KICKASS_PATH% skull.asm -o skull.pet

@echo call ..\..\bin\exomizer.exe mem -B skull.pet,$4a00 -o skull_exo.bin  
start skull.pet

