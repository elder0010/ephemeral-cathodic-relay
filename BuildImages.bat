@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

python src\image_converter.py

java -jar %KICKASS% src/data/img_00.asm -o src/data/img00.prg
java -jar %KICKASS% src/data/img_01.asm -o src/data/img01.prg
java -jar %KICKASS% src/data/img_02.asm -o src/data/img02.prg
java -jar %KICKASS% src/data/img_03.asm -o src/data/img03.prg
java -jar %KICKASS% src/data/img_04.asm -o src/data/img04.prg
java -jar %KICKASS% src/data/img_05.asm -o src/data/img05.prg
java -jar %KICKASS% src/data/img_06.asm -o src/data/img06.prg