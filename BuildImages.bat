@echo off
set KICKASS="bin\KickAss\KickAss.jar"

python src/image_processor.py
python src/petscii_processor.py

java -jar %KICKASS% src/data/img/img_00.asm -o src/data/img/img00.prg
java -jar %KICKASS% src/data/img/img_01.asm -o src/data/img/img01.prg
java -jar %KICKASS% src/data/img/img_02.asm -o src/data/img/img02.prg
java -jar %KICKASS% src/data/img/img_03.asm -o src/data/img/img03.prg
java -jar %KICKASS% src/data/img/img_04.asm -o src/data/img/img04.prg
java -jar %KICKASS% src/data/img/img_05.asm -o src/data/img/img05.prg
java -jar %KICKASS% src/data/img/img_06.asm -o src/data/img/img06.prg
java -jar %KICKASS% src/data/img/img_07.asm -o src/data/img/img07.prg
java -jar %KICKASS% src/data/img/img_08.asm -o src/data/img/img08.prg
java -jar %KICKASS% src/data/img/img_09.asm -o src/data/img/img09.prg
java -jar %KICKASS% src/data/img/img_10.asm -o src/data/img/img10.prg
java -jar %KICKASS% src/data/img/img_11.asm -o src/data/img/img11.prg
java -jar %KICKASS% src/data/img/img_12.asm -o src/data/img/img12.prg
java -jar %KICKASS% src/data/img/img_13.asm -o src/data/img/img13.prg
java -jar %KICKASS% src/data/img/img_14.asm -o src/data/img/img14.prg
java -jar %KICKASS% src/data/img/img_15.asm -o src/data/img/img15.prg
java -jar %KICKASS% src/data/img/img_16.asm -o src/data/img/img16.prg
java -jar %KICKASS% src/data/img/img_17.asm -o src/data/img/img17.prg
java -jar %KICKASS% src/data/img/img_18.asm -o src/data/img/img18.prg
java -jar %KICKASS% src/data/img/img_19.asm -o src/data/img/img19.prg

del src\data\img\tsx\tscrunch_out.txt
echo Crunching img files..
bin\tscrunch -i src\data\img\img00.prg src\data\img\tsx\img00.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img01.prg src\data\img\tsx\img01.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img02.prg src\data\img\tsx\img02.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img03.prg src\data\img\tsx\img03.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img04.prg src\data\img\tsx\img04.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img05.prg src\data\img\tsx\img05.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img06.prg src\data\img\tsx\img06.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img07.prg src\data\img\tsx\img07.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img08.prg src\data\img\tsx\img08.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img09.prg src\data\img\tsx\img09.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img10.prg src\data\img\tsx\img10.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img11.prg src\data\img\tsx\img11.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img12.prg src\data\img\tsx\img12.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img13.prg src\data\img\tsx\img13.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img14.prg src\data\img\tsx\img14.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img15.prg src\data\img\tsx\img15.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img16.prg src\data\img\tsx\img16.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img17.prg src\data\img\tsx\img17.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img18.prg src\data\img\tsx\img18.prg >> src\data\img\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\img\img19.prg src\data\img\tsx\img19.prg >> src\data\img\tsx\tscrunch_out.txt

echo done.