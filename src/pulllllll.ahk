SetDefaultMouseSpeed, 0
WinWait, Scan Panel for Batch: BLOCK_BALL_AEC001, 
IfWinNotActive, Scan Panel for Batch: BLOCK_BALL_AEC001, , WinActivate, Scan Panel for Batch: BLOCK_BALL_AEC001, 
WinWaitActive, Scan Panel for Batch: BLOCK_BALL_AEC001, 
Click, 126,  312, Down
Sleep, 300

MouseMove, 0, 80, ,R 
Click Up
Sleep, 100
