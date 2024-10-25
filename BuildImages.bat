@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "bin\cc1541.exe"

@echo python src\image_converter.py

java -jar %KICKASS% src/data/img_00.asm -o src/data/img00.prg
java -jar %KICKASS% src/data/img_01.asm -o src/data/img01.prg
java -jar %KICKASS% src/data/img_02.asm -o src/data/img02.prg
java -jar %KICKASS% src/data/img_03.asm -o src/data/img03.prg
java -jar %KICKASS% src/data/img_04.asm -o src/data/img04.prg
java -jar %KICKASS% src/data/img_05.asm -o src/data/img05.prg
java -jar %KICKASS% src/data/img_06.asm -o src/data/img06.prg
java -jar %KICKASS% src/data/img_07.asm -o src/data/img07.prg
java -jar %KICKASS% src/data/img_08.asm -o src/data/img08.prg
java -jar %KICKASS% src/data/img_09.asm -o src/data/img09.prg
java -jar %KICKASS% src/data/img_10.asm -o src/data/img10.prg
java -jar %KICKASS% src/data/img_11.asm -o src/data/img11.prg
java -jar %KICKASS% src/data/img_12.asm -o src/data/img12.prg
java -jar %KICKASS% src/data/img_13.asm -o src/data/img13.prg
java -jar %KICKASS% src/data/img_14.asm -o src/data/img14.prg
java -jar %KICKASS% src/data/img_15.asm -o src/data/img15.prg
java -jar %KICKASS% src/data/img_16.asm -o src/data/img16.prg



