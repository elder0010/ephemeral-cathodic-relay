@echo off
set KICKASS="..\bin\KickAss\KickAss.jar"

del TextWriter.prg /f
java -jar %KICKASS% TextWriter.asm -o TextWriter.prg -vicesymbols

Taskkill /IM xpet.exe /F
start xpet.exe -moncommands TextWriter.vs TextWriter.prg

