
fnStartUp("Verbose")

if preview_w
    status_w := preview_w
else status_w := A_ScreenWidth / 2
SplashTextOn, %status_w%, , %StatusBar%, 
if StatusAtBottom = True
    StatusBarY := A_ScreenHeight - Y_offset - 6
else StatusBarY = 0
WinMove, %StatusBar%, , 0, %StatusBarY%

; This comes last - keybindings end the auto-execute section.
#include *i %A_AppDataCommon%\AutoHotKey\iscan\keybindings.ahk

;FUNCTIONS

; INCLUDED FUNCTIONS

#include *i %A_AppDataCommon%\AutoHotKey\iscan\ScanDriver.ahk
#include *i %A_AppDataCommon%\AutoHotKey\iscan\toolkit.ahk
#include *i %A_AppData%\AutoHotKey\iscan\macro.ahk

; PRIMITIVE FUNCTIONS

primitive_Debug()
{
    global
    MsgBox debuggin' Hotkeys
    ListHotkeys
    MsgBox debuggin' Lines
    ListLines
    MsgBox debuggin' Variables
    ListVars
    MsgBox debuggin' Key History
    KeyHistory
}

primitive_DisplayVersion()
{
    MsgBox version 0.94
}

fn_getY_offset()
{
    global Y_offset
    twips_per_pixel = -15
    key = Control Panel\Desktop\WindowMetrics
    RegRead, Titlebar_height, HKCU, %key%, CaptionHeight
    Y_offset := Titlebar_height / twips_per_pixel
    Transform, Y_offset, Round, %Y_offset%
    return Y_offset
}

fnY_offset(orig_y)
{
    global Y_offset
    return orig_y + Y_offset
}

fnNoOp(a = 0, b = 0, c = 0, d = 0)
{
}

fnClickSleep(x, y)
{
    MouseClick, left,  x,  fnY_offset(y)
    Sleep, 100
}
    
fnWindow(window)
{
    ; Always check the return value of this function!
    WinWait, %window%, ,2
    if ErrorLevel
        exit 1
    IfWinNotActive, %window%, , WinActivate, %window%, 
    WinWaitActive, %window%, 
}

fn1Click(window, x, y)
{
    fnWindow(window)
    fnClickSleep(x, y)
}

fn2Click(window, xa, ya, xb, yb)  ;two clicks
{
    fnWindow(window) 
    fnClickSleep(xa, ya)
    fnClickSleep(xb, yb)
}

fnDoubleClick(window, x, y)   ;double click
{
    fnWindow(window)
    MouseClick, left,  x, fnY_offset(y)
    MouseClick, left,  x,  fnY_offset(y)
    Sleep, 100
}

fnMouseMove(x_Direction = 0, y_Direction = 0)
{
    MouseMove, %x_Direction%, %y_Direction%, , R
    Click
}

fnIsBoundBy(xa, ya, xb, yb)
{
    global mousex
    global mousey
    MouseGetPos, mousex, mousey

    ya := fnY_offset(ya)
    yb := fnY_offset(yb)
    if mousex not between %xa% and %xb%
    {
        return
    }
    else if mousey not between %ya% and %yb% 
    {
        return
    }
    else 
    {
        return 1
    }
}
    
fnLesserOf(a, b)  ;FIXME new
{
    if a <= %b%    ; a takes priority if equal
        return a
    else return b
}

fnGreaterOf(a, b)  ;FIXME new
{
    if a >= %b%    ; a takes priority if equal
        return a
    else return b
}

fnZeroPad(num, pad) ;FIXME new
{
    if StrLen(num) >= pad
        return num
    num := "00000000000000" . num
    StringRight, num, num, %pad%
    return num
}

fnPullDown(window, x, y, rel_y)
{
    fnWindow(window)
    Click, %x%, %y%, Down
    Sleep, 300
    ;MouseMove, -60, rel_y, , R
    MouseMove, 0, rel_y, , R
    Sleep, 300
    Click Up
    Sleep, 100
    return
}

; NOT SO PRIMITIVE FUNCTIONS

fnReadUserStrings()
{
    global StrNum0, StrFmt0, StrPre0, StrSuf0
    global StrNum1, StrFmt1, StrPre1, StrSuf1
    global StrNum2, StrFmt2, StrPre2, StrSuf2
    global StrNum3, StrFmt3, StrPre3, StrSuf3
    global StrNum4, StrFmt4, StrPre4, StrSuf4
    global StrNum5, StrFmt5, StrPre5, StrSuf5
    global StrNum6, StrFmt6, StrPre6, StrSuf6
    global StrNum7, StrFmt7, StrPre7, StrSuf7
    global StrNum8, StrFmt8, StrPre8, StrSuf8
    global StrNum9, StrFmt9, StrPre9, StrSuf9
    global StringIni

    i=0
    Loop, 10
    {
        IniRead, StrNum%i%, %StringIni%, String%i%, StrNum, %A_Space%
        IniRead, StrFmt%i%, %StringIni%, String%i%, StrFmt, %A_Space%
        IniRead, StrPre%i%, %StringIni%, String%i%, StrPre, %A_Space%
        IniRead, StrSuf%i%, %StringIni%, String%i%, StrSuf, %A_Space%
        ++i
    }
}

fnStatus(prefix = "")
{
    global HotkeyOn
    global SuperScanOn
    global StatusBar
    global Status
    global Info
    if HotkeyOn = Hotkeys ON
    {
        Status=%prefix% %HotkeyOn% %SuperScanOn% %Info%
    }   else
    {
        Status=Hotkeys suspended.......Win-[ to activate
    }
    WinSetTitle, %StatusBar%, , %Status% 
    StatusBar=%Status%
}

fnSuspend()
{
    global HotkeyOn
    If HotKeyOn = Hotkeys ON
    {
        HotKeyOn=Hotkeys suspended
    }   else 
    {
        HotKeyOn=Hotkeys ON
    }
    fnStatus()
}

fnSuperScan(window, x, y, clicks = 1, xb = 0, yb = 0) 
{
    global SuperScanOn
    if clicks = 1
    {
       fn1Click(window, x, y) 
    }  else
    {
       fn2Click(window, x, y, xb, yb)
    }
    If SuperScanOn = SuperScan ON
    {
        pubFnScan()
    }
}

fnHistoryBigNavigate(xa, yb)
{
    global scan
    fn1Click(scan, xa, 207) 
    sleep, 400
    fnClickSleep(110, yb)
}

fnHistoryTop()
{
    global scan
    ;FIXME workaround for Ipro 
    ;until refresh bug is fixed,
    ;then proper form will be:
    ; fn1Click(scan, 110, 102)
    If not fnIsBoundBy(10, 102, 227, 114) 
    {
        fn2Click(scan, 110, 115, 110, 102)
        Sleep 100
    }
}

fnScanOptions(x, y)
{
    global mousex
    global mousey
    global scan
    global Y_offset
    Click 2
    Sleep, 100
    fn1Click("Scan Options", x, y)
    mousey := mousey - Y_offset
    fn1Click(scan, mousex, mousey) ; return to where we were
}

fnOptionSet(x, y)
{
    global scan
    fn1Click(scan, 309, 273)
    set_options = Set Processing Options
    fn1Click(set_options, x, y)
    Sleep, 100
    fn1Click(set_options, 120, 394)
}

fnDocBreak(x, y)
{
    global mousex
    global mousey
    global scan
    global Y_offset
    Click 2
    Sleep, 100
    fn1Click("Scan Options", 73, 83) 
    Sleep 100
    fn1Click("Modify Document Flag", x, y)
    Sleep 100
    fnClickSleep(44, 162)
    Sleep 100
    mousey := mousey - Y_offset
    fn1Click(scan, mousex, mousey) ; return to where we were
}

fnHistoryMove(Direction, GarbageParameter = 0)
{
    If Direction = 13
    {
            Top = 154
            Bottom = 166
            ClickX = 103
            MoveY = 102
    }
    else 
    {
            Top = 102
            Bottom = 114
            ClickX = 133
            MoveY = 154 
    }

    If fnIsBoundBy(10, Top, 227, Bottom) 
        {
            fnClickSleep(ClickX, 207) 
            fnClickSleep(110, MoveY)
        }
    else fnMouseMove(0, Direction)
}

    
fnHistory(Fn1, Fn1Par1, Fn1Par2, Fn2 = "fnNoop", Fn2Par1 =  "")
{
    global scan
    fnWindow(scan)
    If fnIsBoundBy(10, 102, 227, 166)
    {
        Sleep 100
        %Fn1%(Fn1Par1, Fn1Par2) 
        return 1
    }
    else
    {
        fnHistoryTop()
        %Fn2%(Fn2Par1)
    }
}

fnStartUp(StartupVerbose = "")
{
    global
    
    pubFnGetScanDriver()
    
    WinGetTitle, scan, Scan Panel for Batch, 
    StringTrimLeft, batch, scan, 22
    FileDelete %batch_record%
    FileAppend, %batch%, %batch_record%
    IfExist, %Library%\batch_path.txt
        FileDelete %Library%\batch_path.txt
    IfExist, %StandardLibrary%\findbatch.exe
        Run, %StandardLibrary%\findbatch.exe
    else IfExist, %StandardLibrary%\findbatch.bat
        Run, %StandardLibrary%\findbatch.bat
    WinGetPos, scan_x, scan_y, scan_w, scan_h, %scan%
    Y_offset := fn_getY_offset()
    SetTitleMatchMode, 2
    IfWinExist, cmd.exe
    {
        WinGetTitle, shell, cmd.exe
    }
    IfWinExist, Console
    {
        WinGetTitle, shell, Console
    }
    IfWinExist, bash
    {
        WinGetTitle, shell, bash
    }
    SetTitleMatchMode, 1

    IfWinExist, Prep Sheet Flags
    {
        IfWinNotActive, Prep Sheet Flags, , WinActivate, Prep Sheet Flags, 
        WinWaitActive, Prep Sheet Flags, 
        WinGetPos, , , , prepflag_h, Prep Sheet Flags
        prepflag_x := scan_driver_x
        prepflag_y := scan_driver_y - prepflag_h
        WinMove, Prep Sheet Flags, , %prepflag_x%, %prepflag_y% 
    }
    
    SetCapsLockState , Off
    SetNumLockState , On

    StartUpMessage=
    (
    %A_ScriptName% ver. 0.94

    ? for help
    Win-[ to suspend
    ZZ to quit
    )

    WinGet, Win_Array, List, ahk_class ThunderRT6FormDC
    loop %Win_Array%
    {
        winid := Win_Array%A_Index% 
        WinGetTitle, window, ahk_id %winid%
        ; preview window title is one space if no docs,
        ; or 4 digits, a space, and some other stuff
        if RegExMatch(window, "^[ ]$|^[0-9]{4}[ ].+$") = 1
            previewid = %winid%
        else ifInString, window, %scan%
            scanid = %winid%
        else ifInString, window, Prep Sheet Flags
            prepflagid = %winid%
        else ifInString, window, Zoom
            zoomid = %winid%
        else ifInString, window, Extended
            extendid = %winid%
    }

    max_preview_w := fnLesserOf(scan_driver_x, scan_x)
    max_preview_h := A_ScreenHeight - 6 - (Y_offset * 2)
    If 1.3 * max_preview_w > max_preview_h
    {
        preview_h := max_preview_h + Y_offset
        preview_w := preview_h / 1.3
    }
    else
    {
        preview_w := max_preview_w
        preview_h := preview_w * 1.3
    }

    preview_x := 0
    if StatusAtBottom
        preview_y := A_ScreenHeight - preview_h - Y_offset - 6
    else preview_y := Y_offset + 6
    WinMove, ahk_ID %previewid%, , preview_x, preview_y, preview_w, preview_h
 
    If %StartupVerbose%
    {
        MsgBox, 1, ,%StartUpMessage%
        IfMsgBox Cancel
            ExitApp
    }
    Send !{Tab}
}
