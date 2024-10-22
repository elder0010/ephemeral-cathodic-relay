@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

java -jar %KICKASS% src/data/sample_00.asm -o src/data/sample_00.prg
