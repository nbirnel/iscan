
z::
WinWait, Scan Panel for Batch, 
IfWinNotActive, Scan Panel for Batch, , WinActivate, Scan Panel for Batch, 
WinWaitActive, Scan Panel for Batch, 
PixelGetColor, color, 13, 348
if color = 0xFFFFFF
    cname = white
else if color = 0x00000
    cname = black
else
    cname = gray

MsgBox %cname%
return

q::
ExitApp
return
