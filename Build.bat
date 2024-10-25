@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

del build\demo.d64
del build\demo.d80
del src\main.prg /f

python src\parse_script.py

call BuildSamples.bat

java -jar %KICKASS% src/main.asm -o src/main.prg -vicesymbols

call bin\cc1541\cc1541.exe -n "e.c.r." -f main -w src\main.prg -f img00 -w src\data\img00.prg -f img01 -w src\data\img01.prg -f img02 -w src\data\img02.prg -f img03 -w src\data\img03.prg -f img04 -w src\data\img04.prg -f img05 -w src\data\img05.prg -f img06 -w src\data\img06.prg -f img07 -w src\data\img07.prg -f img08 -w src\data\img08.prg -f img09 -w src\data\img09.prg -f img10 -w src\data\img10.prg -f img11 -w src\data\img11.prg -f img12 -w src\data\img12.prg -f img13 -w src\data\img13.prg -f img14 -w src\data\img14.prg -f img15 -w src\data\img15.prg -f img16 -w src\data\img16.prg  build\demo.d64 > build\disk_out_d64.txt
call bin\cc1541\cc1541.exe -n "e.c.r." -f main -w src\main.prg -f img00 -w src\data\img00.prg -f sfx00 -w src\data\sfx_00.prg -f img01 -w src\data\img01.prg -f sfx01 -w src\data\sfx_01.prg -f img02 -w src\data\img02.prg -f img03 -w src\data\img03.prg -f img04 -w src\data\img04.prg -f img05 -w src\data\img05.prg -f img06 -w src\data\img06.prg build\demo.d80 > build\disk_out_d80.txt

Taskkill /IM xpet.exe /F
start xpet.exe -moncommands src\main.vs build\demo.d64

