@echo on

REM This script copies scan.ahk in the directory it was run from to the
REM Program Menu of any computers named in computers.txt (also in the
REM directory the script was run from).

REM computers.txt should contain the bare name of each computer to be
REM installed to, one name per line, DOS newlines.

REM Of course, the script must be run with administrative priviledges
REM to those computers.

REM Silence equals success.

setlocal

if not exist computers.txt echo "Did you read the README? No, you didn't."

for /f %%i in (computers.txt) do call .\installer.bat %%i

pause
