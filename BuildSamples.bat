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

bin\exomizer.exe mem -B src\data\sfx\sfx00.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx00.prg  
bin\exomizer.exe mem -B src\data\sfx\sfx01.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx01.prg
bin\exomizer.exe mem -B src\data\sfx\sfx02.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx02.prg
bin\exomizer.exe mem -B src\data\sfx\sfx03.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx03.prg
bin\exomizer.exe mem -B src\data\sfx\sfx04.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx04.prg
bin\exomizer.exe mem -B src\data\sfx\sfx05.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx05.prg
bin\exomizer.exe mem -B src\data\sfx\sfx06.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx06.prg
bin\exomizer.exe mem -B src\data\sfx\sfx07.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx07.prg
bin\exomizer.exe mem -B src\data\sfx\sfx08.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx08.prg
bin\exomizer.exe mem -B src\data\sfx\sfx09.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx09.prg
bin\exomizer.exe mem -B src\data\sfx\sfx10.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx10.prg
bin\exomizer.exe mem -B src\data\sfx\sfx11.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx11.prg
bin\exomizer.exe mem -B src\data\sfx\sfx12.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx12.prg
bin\exomizer.exe mem -B src\data\sfx\sfx13.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx13.prg
bin\exomizer.exe mem -B src\data\sfx\sfx14.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx14.prg
bin\exomizer.exe mem -B src\data\sfx\sfx15.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx15.prg
bin\exomizer.exe mem -B src\data\sfx\sfx16.prg,%SAMPLE_ADDRESS% -o src\data\sfx\exo\sfx16.prg