    WinGet, Win_Array, List, ahk_class ThunderRT6FormDC
    loop %Win_Array%
    {
        space = " "
        winid := Win_Array%A_Index% 
        WinGetTitle, window, ahk_id %winid%
        if RegExMatch(window, "^[0-9]{4}[ ].+$") = 1
            previewid = %winid%
        else if RegExMatch(window, "^[ ]") = 1 
            MsgBox blank
        else ifInString, window, PREPFLAG
            prepflagid = %winid%
        else ifInString, window, Zoom
            zoomid = %winid%
        else ifInString, window, Extended
            extendid = %winid%


            FileAppend, %window%%winid%next, file%winid%
        MsgBox  %winid%foo%window%f
    }
