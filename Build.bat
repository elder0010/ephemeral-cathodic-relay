@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

del build\demo.d64
del build\demo.d80
del src\main.prg /f

java -jar %KICKASS% src/main.asm -o src/main.prg -vicesymbols

call bin\cc1541\cc1541.exe -n "e.c.r."  -f main -w src\main.prg build\demo.d64 > build\disk_out_d64.txt
call bin\cc1541\cc1541.exe -n "e.c.r."  -f main -w src\main.prg build\demo.d80 > build\disk_out_d80.txt

Taskkill /IM xpet.exe /F
start xpet.exe -moncommands src\main.vs src\main.prg

