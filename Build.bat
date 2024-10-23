@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

del build\demo.d64
del build\demo.d80
del src\main.prg /f

python src\parse_script.py

call BuildSamples.bat

java -jar %KICKASS% src/main.asm -o src/main.prg -vicesymbols

call bin\cc1541\cc1541.exe -n "e.c.r."  -f main -w src\main.prg -f img00 -w src\data\img00.prg -f sam00 -w src\data\sample_00.prg -f img01 -w src\data\img01.prg -f img02 -w src\data\img02.prg -f img03 -w src\data\img03.prg -f img04 -w src\data\img04.prg -f img05 -w src\data\img05.prg -f img06 -w src\data\img06.prg build\demo.d64 > build\disk_out_d64.txt
call bin\cc1541\cc1541.exe -n "e.c.r."  -f main -w src\main.prg -f img00 -w src\data\img00.prg -f sam00 -w src\data\sample_00.prg -f img01 -w src\data\img01.prg -f img02 -w src\data\img02.prg -f img03 -w src\data\img03.prg -f img04 -w src\data\img04.prg -f img05 -w src\data\img05.prg -f img06 -w src\data\img06.prg build\demo.d80 > build\disk_out_d80.txt

Taskkill /IM xpet.exe /F
start xpet.exe -moncommands src\main.vs build\demo.d64

