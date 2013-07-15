WinWait, RICOH Scanner Driver Ver.4 Pro 1357EX(RNPFC5092), 
IfWinNotActive, RICOH Scanner Driver Ver.4 Pro 1357EX(RNPFC5092), , WinActivate, RICOH Scanner Driver Ver.4 Pro 1357EX(RNPFC5092), 
WinWaitActive, RICOH Scanner Driver Ver.4 Pro 1357EX(RNPFC5092), 

x1=55
x2=145
x3=235
x4=325
x5=415
y=24

MouseClick, left,  %x1%,  %y%
Sleep, 100
MouseClick, left,  %x2%,  %y%
Sleep, 100
MouseClick, left,  %x3%,  %y%
Sleep, 100
MouseClick, left,  %x4%,  %y%
Sleep, 100
MouseClick, left,  %x5%,  %y%
Sleep, 100



z::
PixelGetColor, color, %x1%, %y%
if color = 0xFFFFFF
    cname = white
else if color = 0x000000
    cname = black
else if color = 0xC56A31
    cname = blue
else
    cname = gray

MsgBox %cname%
return

q::
ExitApp
return
