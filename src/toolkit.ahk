
toolkit_AddCodingToPage()
{
    fnHistory("fnScanOptions", 75, 119)  ;FIXME Should suspend?
}

toolkit_BrightnessDnLarge()
{
    pubFnContrastIntervaldown()
}

toolkit_BrightnessDownMedium()
{
    pubFnContrast5down()
}

toolkit_BrightnessDownSmallest()
{
    pubFnContrast1down()
}

toolkit_BrightnessUpLarge()
{
    pubFnContrastIntervalup()
}

toolkit_BrightnessUpMedium()
{
    pubFnContrast5up()
}

toolkit_BrightnessUpSmallest()
{
    pubFnContrast1up()
}

toolkit_BrightnessSetting0()
{
    pubFnBrightness0()
}

toolkit_BrightnessSetting1()
{
    pubFnBrightness1()
}

toolkit_BrightnessSetting2()
{
    pubFnBrightness2()
}

toolkit_BrightnessSetting3()
{
    pubFnBrightness3()
}

toolkit_BrightnessSetting4()
{
    pubFnBrightness4()
}

toolkit_BrightnessSetting5()
{
    pubFnBrightness5()
}

toolkit_BrightnessSetting6()
{
    pubFnBrightness6()
}

toolkit_BrightnessSetting7()
{
    pubFnBrightness7()
}

toolkit_BrightnessSetting8()
{
    pubFnBrightness8()
}

toolkit_BrightnessSetting9()
{
    pubFnBrightness9()
}

toolkit_CommandLineFocus() ;FIXME new
{
    global shell
    fnWindow(shell)
    fnSuspend()
    Suspend
}

toolkit_CommandLinePass2() ;FIXME new
{
    global shell
    IfWinExist, %shell%
    {
        fnSuspend()
        Suspend
        InputBox, CommandLine, Pass through to shell, Enter text to pass to shell:
        If ErrorLevel
            return
        fnWindow(shell)
        SendPlay %CommandLine%
        Sleep 100
        SendPlay {Enter}
        fnSuspend()
        Suspend
    }
    else return      ; don't cause problems for those not running shells - be quiet
}
    
toolkit_CommandLineRepeatLast()
{
    global shell
    fnWindow(shell)
    SendPlay {Up}
    sleep 100
    SendPlay {Enter}
}

toolkit_Debug()
{
    primitive_Debug()
}

toolkit_DeleteLastScannedPage()
{
    global scan
    fn1Click(scan, 346, 207) 
}

toolkit_DeleteMarkPage()
{
    fnHistory("fnScanOptions", 73, 57) 
}

toolkit_DeleteMultiplePages()
{
    global scan
    fnSuspend()
    Suspend
    delete_prompt =
    (
    How many pages would you like to delete?
    Careful - Deletion is forever.
    )
    InputBox, pages_to_delete, Delete pages, %delete_prompt%, , , 180
    if ErrorLevel
    {
        fnSuspend()
        Suspend
        return
    }
    if pages_to_delete is not integer
        MsgBox %pages_to_delete% is not an integer. Not deleting anything.
    else if pages_to_delete <= 0
        MsgBox %pages_to_delete% is not a positive integer. Not deleting anything.
    else
    {
        fnWindow(scan)
        loop %pages_to_delete%
        {
            Send .
        }
        fnHistoryTop()
    }
    fnSuspend()
    Suspend
}

toolkit_DisplayHelp()
{
    global StandardLibrary
    fnSuspend()
    Suspend
    Run, "%StandardLibrary%\iscan_help.html"
}

toolkit_DisplayVersion()
{
    primitive_DisplayVersion()
}

toolkit_DocBox()
{
    global scan
    fnSuperScan(scan, 361, 49) 
}

toolkit_DocChild()
{
    global scan
    fnSuperScan(scan, 361, 97) 
}

toolkit_DocChildSticky()
{
    global
    fnSuperScan("Prep Sheet Flags", 122, 150) 
}

toolkit_DocFolder()
{
    global scan
    fnSuperScan(scan, 361, 65) 
}

toolkit_DocNone()
{
    global scan
    fnSuperScan(scan, 361, 113) 
}

toolkit_DocParent()
{
    global scan
    fnSuperScan(scan, 361, 113, 2, 361, 81)  
}

toolkit_DocParentSticky()
{
    global
    fnSuperScan("Prep Sheet Flags", 122, 134) 
}

toolkit_DocSource()
{
    global scan
    fnSuperScan(scan, 361, 33) 
}

toolkit_wCommands()
{
    global
    fnStatus("w")
    Input, User_Input, L1 C T3, {enter}.{esc}{tab}, %all_chars%
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
    {
        fnStatus()
        return
    }
    if ErrorLevel = NewInput
    {
        fnStatus()
        return
    }
    IfInString, ErrorLevel, EndKey:
    {
        fnStatus()
        return
    }
    ; Otherwise, a match was found.
    SetKeyDelay, -1  ; Most editors can handle the fastest speed.
    driver_function := "ScanDriver_w" . User_Input
    If IsFunc(driver_function)
        %driver_function%()
    fnStatus()
}

toolkit_DuplexOff()
{
    pubFnSingleSided()
}

toolkit_DuplexReversed()
{
    pubFnDupReversed()
}

toolkit_DuplexTopToTop()
{
    pubFnDupTop2Top()
}

toolkit_EditHelp()
{
    global
    fnSuspend()
    Suspend
    Run, %my_viewer% "%StandardLibrary%\iscan_help.txt"
}

toolkit_EditStartupFile()
{
    global
    fnSuspend()
    Suspend
    Run, %my_editor% "%Library%\iscan_rc.ahk"
}

toolkit_gCommands()
{
    global
    fnStatus("g")
    Input, User_Input, L1 C T3, {enter}.{esc}{tab}, %nums%,%lc_alpha%,'
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
    {
        fnStatus()
        return
    }
    if ErrorLevel = NewInput
    {
        fnStatus()
        return
    }
    IfInString, ErrorLevel, EndKey:
    {
        fnStatus()
        return
    }
    ; Otherwise, a match was found.
    SetKeyDelay, -1  ; Most editors can handle the fastest speed.
    if User_Input = t                   
        toolkit_GoToTop()
    else if User_Input = b
        toolkit_GoToBottom()
    else if User_Input = 1
        toolkit_GoToTop()
    else if User_Input = 2
        toolkit_GoTo2nd()
    else if User_Input = 3
        toolkit_GoTo3rd()
    else if User_Input = 4
        toolkit_GoTo4th()
    else if User_Input = 5
        toolkit_GoToBottom()
    else if User_Input = n
        toolkit_GoToNext100()
    else if User_Input = p
        toolkit_GoToPrevious100()
    else if User_Input = l
        toolkit_GoToLast()
    else if User_Input = f
        toolkit_GoToFirst()
    else if User_Input = o
        toolkit_GoToSuspend()
    else if User_Input = '
        toolkit_GoToCode()
    fnStatus()
}

toolkit_GoToTop()
{
        fnHistoryTop()
}

toolkit_GoToBottom()
{
    global scan
    fn1Click(scan, 110, 154)
}

toolkit_GoTo2nd()
{
    global scan
    fn1Click(scan, 110, 115)
}

toolkit_GoTo3rd()
{
    global scan
    fn1Click(scan, 110, 128)
}

toolkit_GoTo4th()
{
    global scan
    fn1Click(scan, 110, 141)
}

toolkit_GoToNext100()
{
    fnHistoryBigNavigate(163, 102)
}

toolkit_GoToPrevious100()
{
    fnHistoryBigNavigate(73, 102)
}

toolkit_GoToLast()
{
    fnHistoryBigNavigate(193, 102)
}

toolkit_GoToFirst()
{
    fnHistoryBigNavigate(43, 154)
}

toolkit_GoToSuspend()
{
    global
    ;global goto
    fn1Click(scan, 268, 207)
    fnSuspend()
    Suspend
    ;FIXME - add goto window to header and uncomment this
    ;FIXME and then rename this fucker "GoToHistory"
    ;fnWindow(goto)
    ;WinWaitClose, %goto%
    ;fnSuspend()
    ;Suspend
}

toolkit_GoToCode()
{
    global scan
    code = Coding on Demand
    fn1Click(scan, 354, 273)
    fnSuspend()
    Suspend
    fnWindow(code)
    WinWaitClose, %code%
    fnSuspend()
    Suspend
}

toolkit_HistoryDown1Page()
{
    fnHistory("fnHistoryMove", 13, 0, "fnMouseMove", 13)
}

toolkit_HistoryUp1Page()
{
    fnHistory("fnHistoryMove", -13, 0)
}

toolkit_HistoryDown1Screen()
{
    fnHistoryBigNavigate(103, 102) 
}

toolkit_HistoryUp1Screen()
{
    fnHistoryBigNavigate(133, 102) 
}

toolkit_Hotkey()
{
    WinGetTitle, active_window
    fnStatus("F")
    Input, User_Input,  T3, {enter}.{esc}{tab}
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    If ErrorLevel = EndKey:Enter
    {
        if User_Input between 1 and 30
            toolkit_Hotkey%User_Input%()
        else if User_Input between 30 + 1 and 150
            toolkit_HotkeyExtended(User_Input)
    }

    fnStatus()
    return
}

toolkit_HotkeyExtended(flag)
{
    global Y_offset

    ;FIXME add check for winexist and open it if not
    IfWinNotExist, Extended Issue Tags
        toolkit_HotkeyExtendedOpen()
    ; Timeout after 2 seconds
    WinWait, Extended Issue Tags, , 2
    If ErrorLevel
        return

    IfWinNotActive, Extended Issue Tags, , WinActivate, Extended Issue Tags, 
    WinWaitActive, Extended Issue Tags, 

    WinGetPos, , , width, , Extended Issue Tags
    relflag := flag - 30

    if width <= 148
        cols = 5
    else if width >= 1277
        cols = 53
    else 
        cols := floor((width - 5) / 24)

    row := ceil(relflag / cols)

    col := mod(relflag, cols)
    if col = 0
        col := cols

    x := col * 24 - 10
    y := row * 30 - 5 + Y_offset

    MouseMove, %x%, %y%
    Click 
}

toolkit_HotkeyExtendedOpen()
{
    global scan
    fn1Click(scan, 409, 227) 
}

toolkit_Hotkey1()
{
    fn1Click("Prep Sheet Flags", 48, 30) 
}

toolkit_Hotkey2()
{
    fn1Click("Prep Sheet Flags", 72, 30) 
}

toolkit_Hotkey3()
{
    fn1Click("Prep Sheet Flags", 96, 30) 
}

toolkit_Hotkey4()
{
    fn1Click("Prep Sheet Flags", 120, 30) 
}

toolkit_Hotkey5()
{
    fn1Click("Prep Sheet Flags", 144, 30) 
}

toolkit_Hotkey6()
{
    fn1Click("Prep Sheet Flags", 168, 30) 
}

toolkit_Hotkey7()
{
    fn1Click("Prep Sheet Flags", 192, 30) 
}

toolkit_Hotkey8()
{
    fn1Click("Prep Sheet Flags", 216, 30) 
}

toolkit_Hotkey9()
{
    fn1Click("Prep Sheet Flags", 240, 30) 
}

toolkit_Hotkey10()
{
    fn1Click("Prep Sheet Flags", 264, 30) 
}

toolkit_Hotkey11()
{
    fn1Click("Prep Sheet Flags", 288, 30) 
}

toolkit_Hotkey12()
{
    fn1Click("Prep Sheet Flags", 312, 30) 
}

toolkit_Hotkey13()
{
    fn1Click("Prep Sheet Flags", 336, 30) 
}

toolkit_Hotkey14()
{
    fn1Click("Prep Sheet Flags", 360, 30) 
}

toolkit_Hotkey15()
{
    fn1Click("Prep Sheet Flags", 384, 30) 
}

toolkit_Hotkey16()
{
    fn1Click("Prep Sheet Flags", 48, 81) 
}

toolkit_Hotkey17()
{
    fn1Click("Prep Sheet Flags", 72, 81) 
}

toolkit_Hotkey18()
{
    fn1Click("Prep Sheet Flags", 96, 81) 
}

toolkit_Hotkey19()
{
    fn1Click("Prep Sheet Flags", 120, 81) 
}

toolkit_Hotkey20()
{
    fn1Click("Prep Sheet Flags", 144, 81) 
}

toolkit_Hotkey21()
{
    fn1Click("Prep Sheet Flags", 168, 81) 
}

toolkit_Hotkey22()
{
    fn1Click("Prep Sheet Flags", 192, 81) 
}

toolkit_Hotkey23()
{
    fn1Click("Prep Sheet Flags", 216, 81) 
}

toolkit_Hotkey24()
{
    fn1Click("Prep Sheet Flags", 240, 81) 
}

toolkit_Hotkey25()
{
    fn1Click("Prep Sheet Flags", 264, 81) 
}

toolkit_Hotkey26()
{
    fn1Click("Prep Sheet Flags", 288, 81) 
}

toolkit_Hotkey27()
{
    fn1Click("Prep Sheet Flags", 312, 81) 
}

toolkit_Hotkey28()
{
    fn1Click("Prep Sheet Flags", 336, 81) 
}

toolkit_Hotkey29()
{
    fn1Click("Prep Sheet Flags", 360, 81) 
}

toolkit_Hotkey30()
{
    fn1Click("Prep Sheet Flags", 384, 81) 
}

toolkit_Hotkey1Sticky()
{
    fn1Click("Prep Sheet Flags", 48, 45) 
}

toolkit_Hotkey2Sticky()
{
    fn1Click("Prep Sheet Flags", 72, 45) 
}

toolkit_Hotkey3Sticky()
{
    fn1Click("Prep Sheet Flags", 96, 45) 
}

toolkit_Hotkey4Sticky()
{
    fn1Click("Prep Sheet Flags", 120, 45) 
}

toolkit_Hotkey5Sticky()
{
    fn1Click("Prep Sheet Flags", 144, 45) 
}

toolkit_Hotkey6Sticky()
{
    fn1Click("Prep Sheet Flags", 168, 45) 
}

toolkit_Hotkey7Sticky()
{
    fn1Click("Prep Sheet Flags", 192, 45) 
}

toolkit_Hotkey8Sticky()
{
    fn1Click("Prep Sheet Flags", 216, 45) 
}

toolkit_Hotkey9Sticky()
{
    fn1Click("Prep Sheet Flags", 240, 45) 
}

toolkit_Hotkey10Sticky()
{
    fn1Click("Prep Sheet Flags", 264, 45) 
}

toolkit_Hotkey11Sticky()
{
    fn1Click("Prep Sheet Flags", 288, 45) 
}

toolkit_Hotkey12Sticky()
{
    fn1Click("Prep Sheet Flags", 312, 45) 
}

toolkit_Hotkey13Sticky()
{
    fn1Click("Prep Sheet Flags", 336, 45) 
}

toolkit_Hotkey14Sticky()
{
    fn1Click("Prep Sheet Flags", 360, 45) 
}

toolkit_Hotkey15Sticky()
{
    fn1Click("Prep Sheet Flags", 384, 45) 
}

toolkit_Hotkey16Sticky()
{
    fn1Click("Prep Sheet Flags", 48, 98) 
}

toolkit_Hotkey17Sticky()
{
    fn1Click("Prep Sheet Flags", 72, 98) 
}

toolkit_Hotkey18Sticky()
{
    fn1Click("Prep Sheet Flags", 96, 98) 
}

toolkit_Hotkey19Sticky()
{
    fn1Click("Prep Sheet Flags", 120, 98) 
}

toolkit_Hotkey20Sticky()
{
    fn1Click("Prep Sheet Flags", 144, 98) 
}

toolkit_Hotkey21Sticky()
{
    fn1Click("Prep Sheet Flags", 168, 98) 
}

toolkit_Hotkey22Sticky()
{
    fn1Click("Prep Sheet Flags", 192, 98) 
}

toolkit_Hotkey23Sticky()
{
    fn1Click("Prep Sheet Flags", 216, 98) 
}

toolkit_Hotkey24Sticky()
{
    fn1Click("Prep Sheet Flags", 240, 98) 
}

toolkit_Hotkey25Sticky()
{
    fn1Click("Prep Sheet Flags", 264, 98) 
}

toolkit_Hotkey26Sticky()
{
    fn1Click("Prep Sheet Flags", 288, 98) 
}

toolkit_Hotkey27Sticky()
{
    fn1Click("Prep Sheet Flags", 312, 98) 
}

toolkit_Hotkey28Sticky()
{
    fn1Click("Prep Sheet Flags", 336, 98) 
}

toolkit_Hotkey29Sticky()
{
    fn1Click("Prep Sheet Flags", 360, 98) 
}

toolkit_Hotkey30Sticky()
{
    fn1Click("Prep Sheet Flags", 384, 98) 
}

toolkit_ImportAll()
{
    global scan
    fn1Click(scan, 264, 273) 
    fn1Click("External File Import", 75, 588)
    MouseMove, 400, fnY_offset(588)
    
    Loop 
    {
        IfWinNotExist, External File Import
            break
    }
}

toolkit_ImportDialog()
{
    global scan
    import = External File Import
    fn1Click(scan, 264, 273) 
    fnSuspend()
    Suspend
    ;FIXME new
    fnWindow(import)
    WinWaitClose, %import%
    fnSuspend()
    Suspend
}

toolkit_ImportDirectoryEmpty()
{
    global scan_staging
    FileDelete, %scan_staging%\*.*
}

toolkit_MacrosEdit()
{
    global
    fnSuspend()
    Suspend
    Run, %macro_editor% "%Library%\macro.ahk"
}

toolkit_MacroLibraryExport()
{
    global
    fnSuspend()
    suspend
    SelectFileMsg=Select or create a macro library to export to.
    FileSelectFile, macro, S24, %my_macros%, %SelectFileMsg%, AutoHotKey scripts (*.ahk)
    If ErrorLevel = 0
        FileCopy, %Library%\macro.ahk, %macro%.ahk, 1
    fnSuspend()
    suspend
}

toolkit_MacroLibraryImport()
{
    global
    fnSuspend()
    suspend
    SelectFileMsg=Select a macro library to import.
    FileSelectFile, macro, S3, %my_macros%, %SelectFileMsg%, AutoHotKey scripts (*.ahk)
    If ErrorLevel = 0
        FileCopy, %macro%, %Library%\macro.ahk, 1
    reload
}

toolkit_MacroLibraryOpen()
{
    global
    fnSuspend()
    suspend
    Run, explore %my_macros%
}

toolkit_MacrosPlayBack()
{
    global
    fnStatus("q")
    Input, User_Input, L1 C T3, {enter}.{esc}{tab}, %all_chars%
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
        {
            fnStatus()
            return
        }
    if ErrorLevel = NewInput
        {
            fnStatus()
            return
        }
    IfInString, ErrorLevel, EndKey:
        {
            fnStatus()
            return
        }
    ; Otherwise, a match was found.
    SetKeyDelay, -1  ; Most editors can handle the fastest speed.
    macro := "macro_" . User_Input
    If IsFunc(macro)
        %macro%()
    else
        return
    fnStatus()
}

toolkit_MacrosMPlayBack()
{
    global
    fnStatus("m")
    Input, User_Input, L1 C T3, {enter}.{esc}{tab}, %all_chars%
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
        {
            fnStatus()
            return
        }
    if ErrorLevel = NewInput
        {
            fnStatus()
            return
        }
    IfInString, ErrorLevel, EndKey:
        {
            fnStatus()
            return
        }
    ; Otherwise, a match was found.
    SetKeyDelay, -1  ; Most editors can handle the fastest speed.
    macro := "macro_m" . User_Input
    If IsFunc(macro)
        %macro%()
    else
        return
    fnStatus()
}

toolkit_MacrosPPlayBack()
{
    global
    fnStatus("p")
    Input, User_Input, L1 C T3, {enter}.{esc}{tab}, %all_chars%
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
        {
            fnStatus()
            return
        }
    if ErrorLevel = NewInput
        {
            fnStatus()
            return
        }
    IfInString, ErrorLevel, EndKey:
        {
            fnStatus()
            return
        }
    ; Otherwise, a match was found.
    SetKeyDelay, -1  ; Most editors can handle the fastest speed.
    macro := "macro_p" . User_Input
    If IsFunc(macro)
        %macro%()
    else
        return
    fnStatus()
}

toolkit_MacroReloadStandard()
{
    global
    FileCopy, %StandardLibrary%\*macro*.ahk, %Library%, 1
    reload
}

toolkit_Mode1()
{
    pubFnMode1()
}

toolkit_Mode2()
{
    pubFnMode2()
}

toolkit_Mode3()
{
    pubFnMode3()
}

toolkit_Mode4()
{
    pubFnMode4()
}

toolkit_Mode5()
{
    pubFnMode5()
}

toolkit_Mode6()
{
    pubFnMode6()
}

toolkit_Mode7()
{
    pubFnMode7()
}

toolkit_Mode8()
{
    pubFnMode8()
}

toolkit_Mode9()
{
    pubFnMode9()
}

toolkit_Mode10()
{
    pubFnMode10()
}

toolkit_Mode11()
{
    pubFnMode11()
}

toolkit_Mode12()
{
    pubFnMode12()
}

toolkit_Mode13()
{
    pubFnMode13()
}

toolkit_Mode14()
{
    pubFnMode14()
}

toolkit_Mode15()
{
    pubFnMode15()
}

toolkit_Mode16()
{
    pubFnMode16()
}

toolkit_Mode17()
{
    pubFnMode17()
}

toolkit_Mode18()
{
    pubFnMode18()
}

toolkit_Mode19()
{
    pubFnMode19()
}

toolkit_Mode20()
{
    pubFnMode20()
}

toolkit_Mode21()
{
    pubFnMode21()
}

toolkit_Mode22()
{
    pubFnMode22()
}

toolkit_Mode23()
{
    pubFnMode23()
}

toolkit_Mode24()
{
    pubFnMode24()
}

toolkit_ModifyDocSource()
{
    fnHistory("fnDocBreak", 40, 42) 
}

toolkit_ModifyDocBox()
{
    fnHistory("fnDocBreak", 40, 58) 
}

toolkit_ModifyDocFolder()
{
    fnHistory("fnDocBreak", 40, 74) 
}

toolkit_ModifyDocParent()
{
    fnHistory("fnDocBreak", 40, 90) 
}

toolkit_ModifyDocChild()
{
    fnHistory("fnDocBreak", 40, 106) 
}

toolkit_ModifyDocNone()
{
    fnHistory("fnDocBreak", 40, 122) 
}
 
toolkit_ModifyKey()
{
    global Y_offset
    toolkit_ModifyKeyOpen()
    key = Enter Image Key Field
    WinGetPos, , , , height, %key%
    y_ok := height - 30

    fnSuspend()
    Suspend
    fnWindow(key)
    MouseMove, 187, y_ok
    Loop
    {
        IfWinNotExist, %key%
            break
    }
    fnSuspend()
    Suspend
}

toolkit_ModifyKeyOpen()
{
    ; FIXME not in help?
    global scan
    fn1Click(scan, 309, 207) 
}

toolkit_ModifyKeyClose()
{
    global Y_offset
    key = Enter Image Key Field
    WinGetPos, , , , height, %key%
    y_ok := height - 30
    MouseMove, 187, y_ok
    Click
}

toolkit_MCommands()
{
    global
    WinGetTitle, active_window
    fnStatus("M")
    Input, User_Input, L1 C T3, {enter}.{esc}{tab}, f,F,r,R,A,S
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
        {
            fnStatus()
            return
        }
    if ErrorLevel = NewInput
        {
            fnStatus()
            return
        }
    IfInString, ErrorLevel, EndKey:
        {
            fnStatus()
            return
        }
    SetKeyDelay, -1
    if User_Input = A
        toolkit_MoveHoldAll2Scan()
    else if User_Input = f
        toolkit_MoveHoldFirst2Scan()
    else if User_Input = F
        toolkit_MoveHoldFirst2ScanWithParent()
    else if User_Input = r
        toolkit_MoveRepo2Scan()
    else if User_Input = R
        toolkit_MoveRepo2ScanWithParent()
    else if User_Input = S
        toolkit_MoveScanAll2Hold()
    fnStatus()
}

toolkit_MoveHoldAll2Scan()
{
    global
    toolkit_ImportDirectoryEmpty()

    FileMove, %scan_holding%\*.*, %scan_staging%
}

toolkit_MoveHoldFirst2Scan()
{
    global 
    toolkit_ImportDirectoryEmpty()
    
    ; We're using ! as out delimiter here to avoid confusing the m4
    ; macro language with backtick n in ahk's newline construction.

    FileList=
    Loop, %scan_holding%\*.*
        FileList = %FileList%%A_LoopFileName%!
    Sort, FileList , D!   ;  order might be bad, depending of filesystem

    Loop, parse, FileList, !
    {
        if A_LoopField =    ; ignore blank at end of list
            continue
        f2mv = %A_LoopField%
        break
    }

    FileMove, %scan_holding%\%f2mv%, %scan_staging%
}

toolkit_MoveHoldFirst2ScanWithParent()
{
    global 
    toolkit_MoveHoldFirst2Scan()

    FileCopy, %parent_tif%, %scan_staging%\_parent.tif
    FileCopy, %parent_tif%, %scan_staging%\ZZZZZZZZ_parent.tif
}

toolkit_MoveRepo2Scan()
{
    global
    toolkit_ImportDirectoryEmpty()

    fnSuspend()
    suspend
    FileSelectFile, f2cp, 3, %repo%, Select an image to import.
    If f2cp = 
        return

    FileCopy, %f2cp%, %scan_staging%
    fnSuspend()
    suspend
}

toolkit_MoveRepo2ScanWithParent()
{
    global 
    toolkit_MoveRepo2Scan()

    FileCopy, %parent_tif%, %scan_staging%\_parent.tif
    FileCopy, %parent_tif%, %scan_staging%\__parent.tif
    FileCopy, %parent_tif%, %scan_staging%\ZZZZZZZZ_parent.tif
}

toolkit_MoveScanAll2Hold()
{
    global

    FileMove, %scan_staging%\*.*, %scan_holding%
}

toolkit_OpenBatch()
{
    global
    fnSuspend()
    suspend
    IfExist, %Library%\batch_path.txt
    {
        FileRead, batch_path, %Library%\batch_path.txt
        Run, explore %batch_path%
    }
}

toolkit_Options()
{
    global scan
    fn1Click(scan, 309, 273) 
}

toolkit_PCommands()
{
    fnStatus("P")
    Input, User_Input, L1 C T3, {enter}.{esc}{tab}, P,B,I,K,O,S
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
        {
            fnStatus()
            return
        }
    if ErrorLevel = NewInput
        {
            fnStatus()
            return
        }
    IfInString, ErrorLevel, EndKey:
        {
            fnStatus()
            return
        }
    SetKeyDelay, -1
    if User_Input = P
        toolkit_OptionPrep()
    else if User_Input = B
        toolkit_OptionBlank()
    else if User_Input = I
        toolkit_OptionInvert()
    else if User_Input = K
        toolkit_OptionDeskew()
    else if User_Input = O
        toolkit_OptionRemoveBlackBorder()
    else if User_Input = S
        toolkit_OptionDespeckle()
    fnStatus()
}

toolkit_OptionPrep()
{
    fnOptionSet(25, 20)
}

toolkit_OptionBlank()
{
    fnOptionSet(25, 42)
}

toolkit_OptionInvert()
{
    fnOptionSet(25, 63)
}

toolkit_OptionDeskew()
{
    fnOptionSet(25, 133)
}

toolkit_OptionRemoveBlackBorder()
{
    fnOptionSet(25, 152)
}

toolkit_OptionDespeckle()
{
    fnOptionSet(25, 241)
}

toolkit_Orientation0()
{
    pubFn0deg()
}

toolkit_Orientation180()
{
    pubFn180deg()
}

toolkit_OrientationLeft90()
{
    pubFn90degL()
}

toolkit_OrientationRight90()
{
    pubFn90degR()
}

toolkit_SCommands()
{
    global
    ;FIXME the whole numbering section needs refactoring

    mP=P0,P1,P2,P3,P4,P5,P6,P7,P8,P9
    mS=S0,S1,S2,S3,S4,S5,S6,S7,S8,S9
    mN=N0,N1,N2,N3,N4,N5,N6,N7,N8,N9
    mR=R0,R1,R2,R3,R4,R5,R6,R7,R8,R9
    mZ=Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9
    mplus=+0,+1,+2,+3,+4,+5,+6,+7,+8,+9
    mmin=-0,-1,-2,-3,-4,-5,-6,-7,-8,-9
    mA=A1,A2,A3,A4,A5,A6,A7,A8
    mF=F0,F1,F2,F3,F4,F5,F6,F7,F8,F9
    match=%mP%,%mS%,%mN%,%mR%,%mZ%,%mplus%,%mmin%,%mA%,%mF%

    WinGetTitle, active_window
    fnStatus("S")
    Input, User_Input, L2 C T3, {enter}.{esc}{tab}, %match%
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
        {
            fnStatus()
            return
        }
    if ErrorLevel = NewInput
        {
            fnStatus()
            return
        }
    IfInString, ErrorLevel, EndKey:
        {
            fnStatus()
            return
        }
    SetKeyDelay, -1
    ; careful of Sp clashing with imacro.vim for "Space"
;    S1P  StringEditPrefix(1)
    if User_Input = P0
        toolkit_StringEditPrefix(0)
    else if User_Input = P1
        toolkit_StringEditPrefix(1)
    else if User_Input = P2
        toolkit_StringEditPrefix(2)
    else if User_Input = P3
        toolkit_StringEditPrefix(3)
    else if User_Input = P4
        toolkit_StringEditPrefix(4)
    else if User_Input = P5
        toolkit_StringEditPrefix(5)
    else if User_Input = P6
        toolkit_StringEditPrefix(6)
    else if User_Input = P7
        toolkit_StringEditPrefix(7)
    else if User_Input = P8
        toolkit_StringEditPrefix(8)
    else if User_Input = P9
        toolkit_StringEditPrefix(9)
    else if User_Input = S0
        toolkit_StringEditSuffix(0)
    else if User_Input = S1
        toolkit_StringEditSuffix(1)
    else if User_Input = S2
        toolkit_StringEditSuffix(2)
    else if User_Input = S3
        toolkit_StringEditSuffix(3)
    else if User_Input = S4
        toolkit_StringEditSuffix(4)
    else if User_Input = S5
        toolkit_StringEditSuffix(5)
    else if User_Input = S6
        toolkit_StringEditSuffix(6)
    else if User_Input = S7
        toolkit_StringEditSuffix(7)
    else if User_Input = S8
        toolkit_StringEditSuffix(8)
    else if User_Input = S9
        toolkit_StringEditSuffix(9)
    else if User_Input = N0
        toolkit_StringEditNumber(0)
    else if User_Input = N1
        toolkit_StringEditNumber(1)
    else if User_Input = N2
        toolkit_StringEditNumber(2)
    else if User_Input = N3
        toolkit_StringEditNumber(3)
    else if User_Input = N4
        toolkit_StringEditNumber(4)
    else if User_Input = N5
        toolkit_StringEditNumber(5)
    else if User_Input = N6
        toolkit_StringEditNumber(6)
    else if User_Input = N7
        toolkit_StringEditNumber(7)
    else if User_Input = N8
        toolkit_StringEditNumber(8)
    else if User_Input = N9
        toolkit_StringEditNumber(9)
    else if User_Input = R0
        toolkit_StringRestartNumber(0)
    else if User_Input = R1
        toolkit_StringRestartNumber(1)
    else if User_Input = R2
        toolkit_StringRestartNumber(2)
    else if User_Input = R3
        toolkit_StringRestartNumber(3)
    else if User_Input = R4
        toolkit_StringRestartNumber(4)
    else if User_Input = R5
        toolkit_StringRestartNumber(5)
    else if User_Input = R6
        toolkit_StringRestartNumber(6)
    else if User_Input = R7
        toolkit_StringRestartNumber(7)
    else if User_Input = R8
        toolkit_StringRestartNumber(8)
    else if User_Input = R9
        toolkit_StringRestartNumber(9)
    else if User_Input = Z0
        toolkit_StringZeroNumber(0)
    else if User_Input = Z1
        toolkit_StringZeroNumber(1)
    else if User_Input = Z2
        toolkit_StringZeroNumber(2)
    else if User_Input = Z3
        toolkit_StringZeroNumber(3)
    else if User_Input = Z4
        toolkit_StringZeroNumber(4)
    else if User_Input = Z5
        toolkit_StringZeroNumber(5)
    else if User_Input = Z6
        toolkit_StringZeroNumber(6)
    else if User_Input = Z7
        toolkit_StringZeroNumber(7)
    else if User_Input = Z8
        toolkit_StringZeroNumber(8)
    else if User_Input = Z9
        toolkit_StringZeroNumber(9)
    else if User_Input = +0
        toolkit_StringIncrementNumber(0)
    else if User_Input = +1
        toolkit_StringIncrementNumber(1)
    else if User_Input = +2
        toolkit_StringIncrementNumber(2)
    else if User_Input = +3
        toolkit_StringIncrementNumber(3)
    else if User_Input = +4
        toolkit_StringIncrementNumber(4)
    else if User_Input = +5
        toolkit_StringIncrementNumber(5)
    else if User_Input = +6
        toolkit_StringIncrementNumber(6)
    else if User_Input = +7
        toolkit_StringIncrementNumber(7)
    else if User_Input = +8
        toolkit_StringIncrementNumber(8)
    else if User_Input = +9
        toolkit_StringIncrementNumber(9)
    else if User_Input = -0
        toolkit_StringDecrementNumber(0)
    else if User_Input = -1
        toolkit_StringDecrementNumber(1)
    else if User_Input = -2
        toolkit_StringDecrementNumber(2)
    else if User_Input = -3
        toolkit_StringDecrementNumber(3)
    else if User_Input = -4
        toolkit_StringDecrementNumber(4)
    else if User_Input = -5
        toolkit_StringDecrementNumber(5)
    else if User_Input = -6
        toolkit_StringDecrementNumber(6)
    else if User_Input = -7
        toolkit_StringDecrementNumber(7)
    else if User_Input = -8
        toolkit_StringDecrementNumber(8)
    else if User_Input = -9
        toolkit_StringDecrementNumber(9)
    else if User_Input = A1
        toolkit_String2ImgKeyField(1)
    else if User_Input = A2
        toolkit_String2ImgKeyField(2)
    else if User_Input = A3
        toolkit_String2ImgKeyField(3)
    else if User_Input = A4
        toolkit_String2ImgKeyField(4)
    else if User_Input = A5
        toolkit_String2ImgKeyField(5)
    else if User_Input = A6
        toolkit_String2ImgKeyField(6)
    else if User_Input = A7
        toolkit_String2ImgKeyField(7)
    else if User_Input = A8
        toolkit_String2ImgKeyField(8)
    else if User_Input = F0
        toolkit_StringFormatNumber(0)
    else if User_Input = F1
        toolkit_StringFormatNumber(1)
    else if User_Input = F2
        toolkit_StringFormatNumber(2)
    else if User_Input = F3
        toolkit_StringFormatNumber(3)
    else if User_Input = F4
        toolkit_StringFormatNumber(4)
    else if User_Input = F5
        toolkit_StringFormatNumber(5)
    else if User_Input = F6
        toolkit_StringFormatNumber(6)
    else if User_Input = F7
        toolkit_StringFormatNumber(7)
    else if User_Input = F8
        toolkit_StringFormatNumber(8)
    else if User_Input = F9
        toolkit_StringFormatNumber(9)

    fnStatus()
}

toolkit_StringEditPrefix(Num)
{
    global StrPre0, StrPre1, StrPre2, StrPre3, StrPre4, StrPre5, StrPre6, StrPre7, StrPre8, StrPre9
    Default := StrPre%Num%
    fnSuspend()
    Suspend
    InputBox, StrPre%Num%, Prefix %Num%, Enter prefix for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    fnSuspend()
    Suspend
    return StrPre%Num%
}

toolkit_StringEditSuffix(Num)
{
    global StrSuf0, StrSuf1, StrSuf2, StrSuf3, StrSuf4, StrSuf5, StrSuf6, StrSuf7, StrSuf8, StrSuf9
    Default := StrSuf%Num%
    fnSuspend()
    Suspend
    InputBox, StrSuf%Num%, Suffix %Num%, Enter suffix for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    fnSuspend()
    Suspend
    return StrSuf%Num%
}

toolkit_StringEditNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    Default := StrNum%Num%
    fnSuspend()
    Suspend
    InputBox, StrNum%Num%, Number %Num%, Enter number for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    fnSuspend()
    Suspend
    return StrNum%Num%
}

toolkit_StringRestartNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    StrNum%Num% = 1
    return StrNum%Num%
}

toolkit_StringZeroNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    StrNum%Num% = 0
    return StrNum%Num%
}

toolkit_StringIncrementNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    ++StrNum%Num%
    return StrNum%Num%
}

toolkit_StringDecrementNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    --StrNum%Num%
    return StrNum%Num%
}

toolkit_StringFormatNumber(Num)
{
    global StrFmt0, StrFmt1, StrFmt2, StrFmt3, StrFmt4, StrFmt5, StrFmt6, StrFmt7, StrFmt8, StrFmt9
    Default := StrFmt%Num%
    fnSuspend()
    Suspend
    InputBox, StrFmt%Num%, Format Number %Num%, Enter number of zeros to pad number %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    fnSuspend()
    Suspend
    return StrFmt%Num%
}

toolkit_String2ImgKeyField(Num)
{
    global StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7
    global StrFmt1, StrFmt2, StrFmt3, StrFmt4, StrFmt5, StrFmt6, StrFmt7
    global StrPre1, StrPre2, StrPre3, StrPre4, StrPre5, StrPre6, StrPre7
    global StrSuf1, StrSuf2, StrSuf3, StrSuf4, StrSuf5, StrSuf6, StrSuf7
    global Y_offset

    stringpre := StrPre%Num%
    fNum := fnZeroPad(StrNum%Num%, StrFmt%Num%)
    stringsuf := StrSuf%Num%
    string = %stringpre%%fNum%%stringsuf%
    len := StrLen(string)
    y_line := 32 * Num + 5 

    key = Enter Image Key Field
    ;FIXME if it doesn' exist, open it, apply, and exit - else just apply
    fn1Click(key, 334, y_line)
    Sleep 100
    fnSuspend()
    Suspend
    Send {Backspace 30}
    Sleep 100
    Send %string%
    Sleep 100

    fnSuspend()
    Suspend

    WinGetPos, , , , height, %key%
    y_ok := height - 30
    MouseMove, 187, y_ok
    ;FIXME should move to OK
    ;FIXME Use case is: open the window Sh-i
    ;      toolkit_ModifyKeyOpen
    ;      Send the string ( this function )
    ;      close it Ctl-i
    ;      toolkit_ModifyKeyClose
}

toolkit_Preview()
{
    pubFnPreview()
}

toolkit_ZCommands()
{
    global
    StringCaseSense On
    WinGetTitle, active_window
    fnStatus("Z")
    Input, User_Input, L1 C T3, {enter}.{esc}{tab}, B,L,M,H,l,m,h,Z,Q,V
    if ErrorLevel = Timeout
    {
        fnStatus()
        return
    }
    if ErrorLevel = Max
        {
            fnStatus()
            return
        }
    if ErrorLevel = NewInput
        {
            fnStatus()
            return
        }
    IfInString, ErrorLevel, EndKey:
        {
            fnStatus()
            return
        }
    SetKeyDelay, -1
    if User_Input = Z
        toolkit_SuperQuit()
    else if User_Input = Q
        toolkit_Quit()
    else if User_Input = B
        toolkit_BlackNWhite()
    else if User_Input = L
        toolkit_ColorLow()
    else if User_Input = M
        toolkit_ColorMed()
    else if User_Input = H
        toolkit_ColorHi()
    else if User_Input = l
        toolkit_GrayLow()
    else if User_Input = m
        toolkit_GrayMed()
    else if User_Input = h
        toolkit_GrayHi()
    fnStatus()
}

toolkit_Quit()
{
    ExitApp
}

toolkit_SuperQuit()
{
    global scan
    pubFnQuitScanDriver()
    IfWinExist, %scan%
    {
        fn1Click(scan, 279, 334) 
    }
    ExitApp
}

toolkit_BlackNWhite()
{
    global scan
    fnPullDown(scan, 124, 331, 20)
}

toolkit_ColorLow()
{
    global scan
    fnPullDown(scan, 124, 331, 33)
}

toolkit_ColorMed()
{
    global scan
    fnPullDown(scan, 124, 331, 46)
}

toolkit_ColorHi()
{
    global scan
    fnPullDown(scan, 124, 331, 59)
}

toolkit_GrayLow()   ;FIXME, might be bad posns
{
    global scan
    fnPullDown(scan, 124, 331, 72)
}

toolkit_GrayMed()
{
    global scan
    fnPullDown(scan, 124, 331, 85)
}

toolkit_GrayHi()
{
    global scan
    fnPullDown(scan, 124, 331, 98)
}


toolkit_RefreshScanWindow()
{
    global
    fnWindow(scan_staging)
    SendPlay {F5}
}

toolkit_ReloadScript()
{
    fnRestart()
}

toolkit_RepeatStartup()
{
    fnStartUp()
}

toolkit_RescanPage()
{
    global
    fnHistory("fnScanOptions", 73, 23) 
}

toolkit_RotateLeftIpro()
{
    global
    fn1Click("Prep Sheet Flags", 280, 134) 
}

toolkit_RotateRightIpro()
{
    global
    fn1Click("Prep Sheet Flags", 341, 150) 
}

toolkit_RotateLeftIproSticky()
{
    global
    fn1Click("Prep Sheet Flags", 280, 134) 
}

toolkit_RotateRightIproSticky()
{
    global
    fn1Click("Prep Sheet Flags", 341, 150) 
}

toolkit_Scan()
{
    global
    if SuperScanOn = SuperScan ON
    {
       fn1Click(scan, 361, 81) 
    }
    
    pubFnScan()
}

toolkit_StartScan()
{
    global
    fn1Click(scan, 364, 334) 
    Sleep, 1000
    fnStartUp()
}

toolkit_SuffixDecrement()
{
    global
    fn1Click(scan, 298, 36) 
}

toolkit_SuffixIncrement()
{
    global
    fn1Click(scan, 298, 66) 
}

toolkit_SuffixSticky()
{
    global
    fn1Click("Prep Sheet Flags", 202, 142) 
}

toolkit_TabDecrementAndImport()
{
    global TabNumber
    global tabs
    global scan_staging

    Sleep 100
    toolkit_ImportDirectoryEmpty()
    Sleep 100
    FileCopy, %tabs%\NUMBER\%TabNumber%.tif, %scan_staging%, 1
    toolkit_ImportAll()
    TabNumber -= 1
}

toolkit_TabSetNumber()
{
    global TabNumber
    fnSuspend()
    Suspend
    InputBox, TabNumber, Tab Number, Enter tab number:
    fnSuspend()
    Suspend
}

toolkit_ToggleAutoDetectColor()
{
    global
    fn1Click(scan, 13, 336) 
}

toolkit_ToggleHotkeys()
{
    fnSuspend()
}

toolkit_ToggleStartFromScanner()
{
    pubFnToggleStartFScanner()
}

toolkit_ToggleSuperScan()
{
    global
    If SuperScanOn = SuperScan ON
    {
        SuperScanOn=SuperScan off ( press \ to activate )
    }   else {
        SuperScanOn=SuperScan ON
    }
    fnStatus()
}

toolkit_ToggleZoom()
{
    global
    fn1Click(scan, 409, 283) 
    ifWinExist, Zoom window
    {
        WinWait, Zoom window, 
        IfWinNotActive, Zoom window, , WinActivate, Zoom window, 
        WinWaitActive, Zoom window, 
        if preview_y
            zoom_y := preview_y + Y_offset + 5
        else zoom_y := 60
        WinMove, Zoom window, , 0, zoom_y 
    }
}

toolkit_UseADF()
{
    pubFnADF()
}

toolkit_UseExposureGlass()
{
    pubFnExposureGlass()
}

