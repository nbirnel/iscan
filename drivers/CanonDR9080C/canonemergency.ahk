d::
;DONE
WinWait, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
IfWinNotActive, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, , WinActivate, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
WinWaitActive, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
MouseClick, left,  361,  100
Sleep, 100

WinWait, Canon DR-9080C on STI - 0007, 
IfWinNotActive, Canon DR-9080C on STI - 0007, , WinActivate, Canon DR-9080C on STI - 0007, 
WinWaitActive, Canon DR-9080C on STI - 0007, 
MouseClick, left,  153,  456
Sleep, 100

return



n::
;DONE
WinWait, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
IfWinNotActive, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, , WinActivate, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
WinWaitActive, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
MouseClick, left,  363,  133
Sleep, 100
return

Space::
;DONE
WinWait, Canon DR-9080C on STI - 0007, 
IfWinNotActive, Canon DR-9080C on STI - 0007, , WinActivate, Canon DR-9080C on STI - 0007, 
WinWaitActive, Canon DR-9080C on STI - 0007, 
MouseClick, left,  153,  456
Sleep, 100
return

q::
;DONE
ExitApp
return


e::
;
WinWait, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
IfWinNotActive, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, , WinActivate, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
WinWaitActive, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
MouseClick, left,  315,  291
Sleep, 100
WinWait, Set Processing Options, 
IfWinNotActive, Set Processing Options, , WinActivate, Set Processing Options, 
WinWaitActive, Set Processing Options, 
; rot
MouseClick, left,  30,  279
Sleep, 100
; 270
MouseClick, left,  65,  333
Sleep, 100
; exit
MouseClick, left,  59,  457
Sleep, 100
WinWait, Canon DR-9080C on STI - 0007, 
IfWinNotActive, Canon DR-9080C on STI - 0007, , WinActivate, Canon DR-9080C on STI - 0007, 
WinWaitActive, Canon DR-9080C on STI - 0007, 
MouseClick, left,  358,  35
Suspend
Sleep, 300
Send, {HOME}
Sleep, 300
Send, e
Sleep, 100
Send, {ENTER}
Sleep, 100
Suspend
return

h::
WinWait, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
IfWinNotActive, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, , WinActivate, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
WinWaitActive, Scan Panel for Batch: COMARKHC005 - TWAIN/ISIS, 
MouseClick, left,  301,  297
Sleep, 100
WinWait, Set Processing Options, 
IfWinNotActive, Set Processing Options, , WinActivate, Set Processing Options, 
WinWaitActive, Set Processing Options, 
MouseClick, left,  25,  281
Sleep, 100
MouseClick, left,  45,  460
Sleep, 100
WinWait, Canon DR-9080C on STI - 0007, 
IfWinNotActive, Canon DR-9080C on STI - 0007, , WinActivate, Canon DR-9080C on STI - 0007, 
WinWaitActive, Canon DR-9080C on STI - 0007, 
MouseClick, left,  356,  39
Suspend
Sleep, 300
Send, {HOME}
Sleep, 300
Send, h
Sleep, 100
Send, {ENTER}
Sleep, 100
Suspend
return


