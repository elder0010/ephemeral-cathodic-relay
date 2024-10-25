@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

java -jar %KICKASS% src/data/sfx/sfx_00.asm -o src/data/sfx/sfx00.prg
java -jar %KICKASS% src/data/sfx/sfx_01.asm -o src/data/sfx/sfx01.prg
java -jar %KICKASS% src/data/sfx/sfx_02.asm -o src/data/sfx/sfx02.prg
java -jar %KICKASS% src/data/sfx/sfx_03.asm -o src/data/sfx/sfx03.prg
java -jar %KICKASS% src/data/sfx/sfx_04.asm -o src/data/sfx/sfx04.prg
java -jar %KICKASS% src/data/sfx/sfx_05.asm -o src/data/sfx/sfx05.prg
java -jar %KICKASS% src/data/sfx/sfx_06.asm -o src/data/sfx/sfx06.prg
java -jar %KICKASS% src/data/sfx/sfx_07.asm -o src/data/sfx/sfx07.prg
java -jar %KICKASS% src/data/sfx/sfx_08.asm -o src/data/sfx/sfx08.prg
java -jar %KICKASS% src/data/sfx/sfx_09.asm -o src/data/sfx/sfx09.prg
java -jar %KICKASS% src/data/sfx/sfx_10.asm -o src/data/sfx/sfx10.prg
java -jar %KICKASS% src/data/sfx/sfx_11.asm -o src/data/sfx/sfx11.prg
java -jar %KICKASS% src/data/sfx/sfx_12.asm -o src/data/sfx/sfx12.prg
java -jar %KICKASS% src/data/sfx/sfx_13.asm -o src/data/sfx/sfx13.prg
java -jar %KICKASS% src/data/sfx/sfx_14.asm -o src/data/sfx/sfx14.prg
java -jar %KICKASS% src/data/sfx/sfx_15.asm -o src/data/sfx/sfx15.prg
java -jar %KICKASS% src/data/sfx/sfx_16.asm -o src/data/sfx/sfx16.prg
