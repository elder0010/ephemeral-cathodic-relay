@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"
set EXOMIZER = "bin\exomizer\exomizer.exe"

del build\demo.d82
@echo del build\SD\*.* /f
del src\main.prg /f

python src\parse_script.py

@echo call BuildSamples.bat
@echo call BuildImages.bat

python .\src\tscrunch_address_processor.py

java -jar %KICKASS% src/main.asm -o src/main.prg -vicesymbols -symbolfile
c1541.exe -format e.c.r,23 d82 build\demo.d82 -attach build\demo.d82 -write src\main.prg main -write src\data\img\tsx\img00.prg img00 -write src\data\sfx\tsx\sfx00.prg sfx00 -write src\data\img\tsx\img01.prg img01 -write src\data\sfx\tsx\sfx01.prg sfx01 -write src\data\img\tsx\img02.prg img02 -write src\data\sfx\tsx\sfx02.prg sfx02 -write src\data\img\tsx\img03.prg img03 -write src\data\sfx\tsx\sfx03.prg sfx03 -write src\data\img\tsx\img04.prg img04 -write src\data\sfx\tsx\sfx04.prg sfx04 -write src\data\img\tsx\img05.prg img05 -write src\data\sfx\tsx\sfx05.prg sfx05 -write src\data\img\tsx\img06.prg img06 -write src\data\sfx\tsx\sfx06.prg sfx06 -write src\data\img\tsx\img07.prg img07 -write src\data\sfx\tsx\sfx07.prg sfx07 -write src\data\img\tsx\img08.prg img08 -write src\data\sfx\tsx\sfx08.prg sfx08 -write src\data\img\tsx\img09.prg img09 -write src\data\sfx\tsx\sfx09.prg sfx09 -write src\data\img\tsx\img10.prg img10 -write src\data\sfx\tsx\sfx10.prg sfx10 -write src\data\img\tsx\img11.prg img11 -write src\data\sfx\tsx\sfx11.prg sfx11 -write src\data\img\tsx\img12.prg img12 -write src\data\sfx\tsx\sfx12.prg sfx12 -write src\data\img\tsx\img13.prg img13 -write src\data\sfx\tsx\sfx13.prg sfx13 -write src\data\img\tsx\img14.prg img14 -write src\data\sfx\tsx\sfx14.prg sfx14 -write src\data\img\tsx\img15.prg img15 -write src\data\sfx\tsx\sfx15.prg sfx15 -write src\data\img\tsx\img16.prg img16 -write src\data\sfx\tsx\sfx16.prg sfx16 > build\disk_out_d82.txt 

@echo call BuildSD.bat 

Taskkill /IM xpet.exe /F
start xpet.exe -moncommands src\main.vs build\demo.d82 
