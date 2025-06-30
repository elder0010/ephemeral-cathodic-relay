@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

del src\credits.prg /f

java -jar %KICKASS% src/credits.asm -o src/credits.prg -vicesymbols -symbolfile

Taskkill /IM xpet.exe /F
start xpet.exe -moncommands src\credits.vs src\credits.prg
