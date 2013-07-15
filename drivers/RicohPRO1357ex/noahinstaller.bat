@echo off

REM This script must be run with administrative priviledges.
REM Silence equals success.

setlocal

if [%1]==[] (
    set DRIVE=C:
) else (
    set DRIVE=%1\C$
)

set noah=%DRIVE%\Documents and Settings\noah
set PROGRAMS=%noah%\Start Menu\Programs
set LIBRARY=%noah%\Application Data\AutoHotKey\iscan

if not exist "%LIBRARY%" mkdir "%LIBRARY%"

set SRC=..\..\src
set USR=..\..\usr

xcopy /R /K /Y    "%SRC%\iscan_fns.ahk"   "%LIBRARY%\"
xcopy /R /K /Y    "%SRC%\keybindings.ahk" "%LIBRARY%\"
xcopy /R /K /Y    "%SRC%\toolkit.ahk"     "%LIBRARY%\"
xcopy /R /K /Y    "%SRC%\macro.ahk"       "%LIBRARY%\"


xcopy /R /K /Y    "%USR%\*"    "%LIBRARY%\"

xcopy /R /K /Y    "%SRC%\iscan.ahk"       "%PROGRAMS%\"

xcopy /R /K /Y /I "..\..\macros"    "%LIBRARY%\iscan_macros"

xcopy /R /K /Y    "ScanDriver.ahk"      "%LIBRARY%\"
xcopy /R /K /Y    "iscan_help.txt"          "%LIBRARY%\"
xcopy /R /K /Y    "iscan_help.html"         "%LIBRARY%\"


if %DRIVE%==C: pause
