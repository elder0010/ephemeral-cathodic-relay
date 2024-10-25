@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "c1541.exe"

@echo python src\image_converter.py
python src\image_processor.py

java -jar %KICKASS% src/data/images/img_00.asm -o src/data/images/img00.prg
java -jar %KICKASS% src/data/images/img_01.asm -o src/data/images/img01.prg
java -jar %KICKASS% src/data/images/img_02.asm -o src/data/images/img02.prg
java -jar %KICKASS% src/data/images/img_03.asm -o src/data/images/img03.prg
java -jar %KICKASS% src/data/images/img_04.asm -o src/data/images/img04.prg
java -jar %KICKASS% src/data/images/img_05.asm -o src/data/images/img05.prg
java -jar %KICKASS% src/data/images/img_06.asm -o src/data/images/img06.prg
java -jar %KICKASS% src/data/images/img_07.asm -o src/data/images/img07.prg
java -jar %KICKASS% src/data/images/img_08.asm -o src/data/images/img08.prg
java -jar %KICKASS% src/data/images/img_09.asm -o src/data/images/img09.prg
java -jar %KICKASS% src/data/images/img_10.asm -o src/data/images/img10.prg
java -jar %KICKASS% src/data/images/img_11.asm -o src/data/images/img11.prg
java -jar %KICKASS% src/data/images/img_12.asm -o src/data/images/img12.prg
java -jar %KICKASS% src/data/images/img_13.asm -o src/data/images/img13.prg
java -jar %KICKASS% src/data/images/img_14.asm -o src/data/images/img14.prg
java -jar %KICKASS% src/data/images/img_15.asm -o src/data/images/img15.prg
java -jar %KICKASS% src/data/images/img_16.asm -o src/data/images/img16.prg
