WinWait, Save/Delete Mode, 
IfWinNotActive, Save/Delete Mode, , WinActivate, Save/Delete Mode, 
WinWaitActive, Save/Delete Mode, 

Sleep, 100
Send, {ALTDOWN}g{ALTUP}
WinWait, Change, 
IfWinNotActive, Change, , WinActivate, Change, 
WinWaitActive, Change, 
Send, {ALTDOWN}w{ALTUP}
WinWait, Overwrite Mode, 
IfWinNotActive, Overwrite Mode, , WinActivate, Overwrite Mode, 
WinWaitActive, Overwrite Mode, 
Send, {ALTDOWN}o{ALTUP}
WinWait, Change, 
IfWinNotActive, Change, , WinActivate, Change, 
WinWaitActive, Change, 
Send, {ALTDOWN}o{ALTUP}
WinWait, RICOH Scanner Driver Ver.4, 
IfWinNotActive, RICOH Scanner Driver Ver.4, , WinActivate, RICOH Scanner Driver Ver.4, 
WinWaitActive, RICOH Scanner Driver Ver.4, 
;fixme get more info on this window
Send, {ENTER}
WinWait, Save/Delete Mode, 
IfWinNotActive, Save/Delete Mode, , WinActivate, Save/Delete Mode, 
WinWaitActive, Save/Delete Mode, 
Send, {ALTDOWN}c{ALTUP}