@echo on

REM This script must be run with administrative priviledges.
REM Silence equals success.

setlocal


set ALL_USERS=c:\Documents and Settings\All Users
set PROGRAMS=%ALL_USERS%\Start Menu\Programs
set LIBRARY=%ALL_USERS%\Application Data\AutoHotKey\iscan

set SRC=..\src
set USR=..\usr

xcopy /R /K /Y    "%SRC%\iscan_fns.ahk"   "%LIBRARY%\"
xcopy /R /K /Y    "%SRC%\keybindings.ahk" "%LIBRARY%\"
xcopy /R /K /Y    "%SRC%\toolkit.ahk"     "%LIBRARY%\"
xcopy /R /K /Y    "%SRC%\macro.ahk"       "%LIBRARY%\"


xcopy /R /K /Y    "%USR%\iscan_rc.ahk"    "%LIBRARY%\"

xcopy /R /K /Y    "%SRC%\iscan.ahk"       "%PROGRAMS%\"

xcopy /R /K /Y /I "..\macros"    "%LIBRARY%\iscan_macros"

xcopy /R /K /Y    "ScanDriver.ahk"      "%LIBRARY%\"
xcopy /R /K /Y    "iscan_help.txt"          "%LIBRARY%\"
xcopy /R /K /Y    "iscan_help.html"         "%LIBRARY%\"

echo "You should be good to go!"
pause
