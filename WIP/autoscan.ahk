

Loop, 
{
    IfWinNotExist, RICOH Scanner Driver Ver.4, Scanning...
    { 
        Sleep 3000
        Send {Space}
    }
}


NumPadDot::
MsgBox Exiting autoscan
ExitApp
return

NumPadEnter::
Suspend
return


