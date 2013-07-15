@echo on

REM This script must be run with administrative priviledges.
REM Silence equals success.

setlocal

set DRIVER=RicohPRO1357ex

set ALL_USERS=c:\Documents and Settings\All Users
set PROGRAMS=%ALL_USERS%\Start Menu\Programs
set LIBRARY=%ALL_USERS%\Application Data\AutoHotKey\iscan
set DOC=doc
set SRC=src
set BIN=%SRC%\bin
set DRIVERS=%SRC%\drivers

xcopy /R /K /Y    "%BIN%\iscan_fns.ahk"   "%LIBRARY%\"
xcopy /R /K /Y    "%BIN%\iscan_rc.ahk"    "%LIBRARY%\"
xcopy /R /K /Y    "%BIN%\keybindings.txt" "%LIBRARY%\"
xcopy /R /K /Y    "%BIN%\toolkit.ahk"     "%LIBRARY%\"
xcopy /R /K /Y    "%BIN%\macro.ahk"       "%LIBRARY%\"



xcopy /R /K /Y    "%BIN%\iscan.ahk"       "%PROGRAMS%\"

xcopy /R /K /Y /I "%SRC%\iscan_macros"    "%LIBRARY%\iscan_macros"

xcopy /R /K /Y    "%DRIVERS%\%DRIVER%.ahk"      "%LIBRARY%\ScanDriver.ahk"
xcopy /R /K /Y    "%DOC%\%DRIVER%.txt"          "%LIBRARY%\iscan_help.txt"
xcopy /R /K /Y    "%DOC%\%DRIVER%.html"         "%LIBRARY%\iscan_help.html"

echo "You should be good to go!"
pause
