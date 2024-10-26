@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set CC1541_PATH = "c1541.exe"

@echo python src\image_converter.py
python src/image_processor.py
python src/petscii_processor.py

java -jar %KICKASS% src/data/images/img_00.asm -o src/data/images/img00.prg
