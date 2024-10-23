@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

java -jar %KICKASS% src/data/sfx_00.asm -o src/data/sfx_00.prg
java -jar %KICKASS% src/data/sfx_01.asm -o src/data/sfx_01.prg