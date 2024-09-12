
@echo call ..\..\bin\exomizer.exe mem -B skull.pet,$4a00 -o skull_exo.bin  





@echo off
set KICKASS="..\bin\KickAss\KickAss.jar"

del Skull.prg /f
java -jar %KICKASS% Skull.asm -o Skull.prg -vicesymbols

Taskkill /IM xpet.exe /F
start xpet.exe -moncommands Skull.vs Skull.prg

