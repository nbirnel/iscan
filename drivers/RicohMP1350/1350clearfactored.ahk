logfile=%A_AppData%\AutoHotKey\iscan\errors.txt
is_running=%A_Desktop%\AutoClear.txt

unix2dos="G:\cygwin\bin\unix2dos.exe"
dos2unix="G:\cygwin\bin\dos2unix.exe"

fnClickThrough(x, y, title, text="")
{
    global
    IfWinNotActive, %title%, %text%, WinActivate, %title%, 
    WinWaitActive, %title%, %text%
    WinGetText, message
    WinGetTitle, full_title, A
    MouseClick, left,  %x%,  %y%
    Sleep, 100
    FormatTime, TimeStamp
    FileAppend, `n------------------------------------------------------`n, %logfile%
    FileAppend, %TimeStamp%`n, %logfile%
    FileAppend, %full_title%`n, %logfile%
    FileAppend, %message%, %logfile%
    Sleep, 500
    ;run, %dos2unix% %logfile%
    ;run, %unix2dos% %logfile%
    
    ;MsgBox, %message%
}

MsgBox, To stop AutoClear, `n delete the AutoClear.txt document on the Desktop 
FileAppend, Auto Clear is running. Delete this file to stop it., %is_running%

Loop {
    IfNotExist, %is_running%
    {
        MsgBox, Quitting AutoClear. `n Your jams are your own problem now.
        ExitApp
    }

    IfWinExist, WARNING, OK
    {
        fnClickThrough(186,  116, WARNING, OK)
        ;Send, window[
        ;Sleep 100
        ;Send, !s
        ;Sleep 100
        ;Send, |
    }

    IfWinExist, RICOH Scanner Driver Ver, OK
    {
        fnClickThrough(95,  84, RICOH Scanner Driver Ver, OK)
    }

    IfWinExist, Scan Error
    {
        fnClickThrough(173,  84, Scan Error)
    ;    IfWinExist, , Hotkeys suspended, Send, !s
    ;    IfWinExist, , Hotkeys ON, Send, !s
        Send, !s
    }
}

;this muhfuh works
