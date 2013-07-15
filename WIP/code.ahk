
z::
Click 2
Sleep, 100
WinWait, Scan Options, 
IfWinNotActive, Scan Options, , WinActivate, Scan Options, 
WinWaitActive, Scan Options, 
MouseClick, left,  79,  131
Sleep, 100
WinWait, Coding on Demand, 
IfWinNotActive, Coding on Demand, , WinActivate, Coding on Demand, 
WinWaitActive, Coding on Demand, 
Send, {TAB}{TAB}{TAB}{TAB}No Info{TAB}{ENTER}
return

q::
ExitApp
return
