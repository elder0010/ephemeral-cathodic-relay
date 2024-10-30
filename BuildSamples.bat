@echo off
set KICKASS="bin\KickAss\KickAss.jar"
set EXOMIZER_PATH = "bin\exomizer\exomizer.exe"
set SAMPLE_ADDRESS = $2704

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

del src\data\sfx\tsx\tscrunch_out.txt

bin\tscrunch -i src\data\sfx\sfx00.prg src\data\sfx\tsx\sfx00.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx01.prg src\data\sfx\tsx\sfx01.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx02.prg src\data\sfx\tsx\sfx02.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx03.prg src\data\sfx\tsx\sfx03.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx04.prg src\data\sfx\tsx\sfx04.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx05.prg src\data\sfx\tsx\sfx05.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx06.prg src\data\sfx\tsx\sfx06.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx07.prg src\data\sfx\tsx\sfx07.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx08.prg src\data\sfx\tsx\sfx08.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx09.prg src\data\sfx\tsx\sfx09.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx10.prg src\data\sfx\tsx\sfx10.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx11.prg src\data\sfx\tsx\sfx11.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx12.prg src\data\sfx\tsx\sfx12.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx13.prg src\data\sfx\tsx\sfx13.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx14.prg src\data\sfx\tsx\sfx14.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx15.prg src\data\sfx\tsx\sfx15.prg >> src\data\sfx\tsx\tscrunch_out.txt
bin\tscrunch -i src\data\sfx\sfx16.prg src\data\sfx\tsx\sfx16.prg >> src\data\sfx\tsx\tscrunch_out.txt