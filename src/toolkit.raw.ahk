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
    fn1Click(scan, X_SCAN_DELETE, Y_SCAN_BTN_ROW1) 
}

toolkit_DeleteMarkPage()
{
    fnHistory("fnScanOptions", X_OPTIONS, Y_OPTIONS_DEL) 
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
    fnSuperScan(scan, X_SCAN_COL_DOC, Y_SCAN_BOX) 
}

toolkit_DocChild()
{
    global scan
    fnSuperScan(scan, X_SCAN_COL_DOC, Y_SCAN_CHILD) 
}

toolkit_DocChildSticky()
{
    global
    fnSuperScan("PREPFLAG", X_PREP_COL_DOC, Y_PREP_CHILD) 
}

toolkit_DocFolder()
{
    global scan
    fnSuperScan(scan, X_SCAN_COL_DOC, Y_SCAN_FLDR) 
}

toolkit_DocNone()
{
    global scan
    fnSuperScan(scan, X_SCAN_COL_DOC, Y_SCAN_NONE) 
}

toolkit_DocParent()
{
    global scan
    fnSuperScan(scan, X_SCAN_COL_DOC, Y_SCAN_NONE, 2, X_SCAN_COL_DOC, Y_SCAN_PRNT)  
}

toolkit_DocParentSticky()
{
    global
    fnSuperScan("PREPFLAG", X_PREP_COL_DOC, Y_PREP_PRNT) 
}

toolkit_DocSource()
{
    global scan
    fnSuperScan(scan, X_SCAN_COL_DOC, Y_SCAN_SRC) 
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
    fn1Click(scan, X_SCAN_HIST, Y_SCAN_HIST5)
}

toolkit_GoTo2nd()
{
    global scan
    fn1Click(scan, X_SCAN_HIST, Y_SCAN_HIST2)
}

toolkit_GoTo3rd()
{
    global scan
    fn1Click(scan, X_SCAN_HIST, Y_SCAN_HIST3)
}

toolkit_GoTo4th()
{
    global scan
    fn1Click(scan, X_SCAN_HIST, Y_SCAN_HIST4)
}

toolkit_GoToNext100()
{
    fnHistoryBigNavigate(X_SCAN_FF, Y_SCAN_HIST1)
}

toolkit_GoToPrevious100()
{
    fnHistoryBigNavigate(X_SCAN_RW, Y_SCAN_HIST1)
}

toolkit_GoToLast()
{
    fnHistoryBigNavigate(X_SCAN_END, Y_SCAN_HIST1)
}

toolkit_GoToFirst()
{
    fnHistoryBigNavigate(X_SCAN_BEG, Y_SCAN_HIST5)
}

toolkit_GoToSuspend()
{
    global
    ;global goto
    fn1Click(scan, X_SCAN_GOTO, Y_SCAN_BTN_ROW1)
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
    code = CODE
    fn1Click(scan, X_SCAN_CODE, Y_SCAN_BTN_ROW2)
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
    fnHistoryBigNavigate(X_SCAN_BACK, Y_SCAN_HIST1) 
}

toolkit_HistoryUp1Screen()
{
    fnHistoryBigNavigate(X_SCAN_FWD, Y_SCAN_HIST1) 
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
        if User_Input between 1 and PREP_MAX
            toolkit_Hotkey%User_Input%()
        else if User_Input between PREP_MAX + 1 and EXTF_MAX
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
    relflag := flag - PREP_MAX

    if width <= EXTF_MIN_W
        cols = EXTF_MIN_COLS
    else if width >= EXTF_MAX_W
        cols = EXTF_MAX_COLS
    else 
        cols := floor((width - EXTF_COL_W_OFFS) / EXTF_COL_W)

    row := ceil(relflag / cols)

    col := mod(relflag, cols)
    if col = 0
        col := cols

    x := col * EXTF_COL_W - EXTF_COL_OFFS
    y := row * EXTF_ROW_H - EXTF_ROW_NEG_OFFS + Y_offset

    MouseMove, %x%, %y%
    Click 
}

toolkit_HotkeyExtendedOpen()
{
    global scan
    fn1Click(scan, X_SCAN_BTN_COL, Y_SCAN_XISSUE) 
}

toolkit_Hotkey1()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL1, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey2()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL2, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey3()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL3, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey4()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL4, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey5()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL5, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey6()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL6, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey7()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL7, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey8()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL8, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey9()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL9, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey10()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL10, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey11()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL11, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey12()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL12, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey13()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL13, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey14()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL14, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey15()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL15, Y_PREP_HK_ROW1) 
}

toolkit_Hotkey16()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL1, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey17()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL2, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey18()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL3, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey19()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL4, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey20()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL5, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey21()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL6, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey22()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL7, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey23()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL8, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey24()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL9, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey25()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL10, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey26()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL11, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey27()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL12, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey28()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL13, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey29()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL14, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey30()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL15, Y_PREP_HK_ROW3) 
}

toolkit_Hotkey1Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL1, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey2Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL2, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey3Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL3, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey4Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL4, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey5Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL5, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey6Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL6, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey7Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL7, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey8Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL8, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey9Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL9, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey10Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL10, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey11Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL11, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey12Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL12, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey13Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL13, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey14Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL14, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey15Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL15, Y_PREP_HK_ROW2) 
}

toolkit_Hotkey16Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL1, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey17Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL2, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey18Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL3, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey19Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL4, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey20Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL5, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey21Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL6, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey22Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL7, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey23Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL8, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey24Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL9, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey25Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL10, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey26Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL11, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey27Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL12, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey28Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL13, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey29Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL14, Y_PREP_HK_ROW4) 
}

toolkit_Hotkey30Sticky()
{
    fn1Click("PREPFLAG", X_PREP_HK_COL15, Y_PREP_HK_ROW4) 
}

toolkit_ImportAll()
{
    global scan
    fn1Click(scan, X_SCAN_IMPORT, Y_SCAN_BTN_ROW2) 
    fn1Click("IMPORT", X_IMPORT_ALL, Y_IMPORT_ROW_BTN)
    MouseMove, X_IMPORT_EXIT, fnY_offset(Y_IMPORT_ROW_BTN)
    
    Loop 
    {
        IfWinNotExist, IMPORT
            break
    }
}

toolkit_ImportDialog()
{
    global scan
    import = IMPORT
    fn1Click(scan, X_SCAN_IMPORT, Y_SCAN_BTN_ROW2) 
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
    fnHistory("fnDocBreak", X_DOC, Y_DOC_SRC) 
}

toolkit_ModifyDocBox()
{
    fnHistory("fnDocBreak", X_DOC, Y_DOC_BOX) 
}

toolkit_ModifyDocFolder()
{
    fnHistory("fnDocBreak", X_DOC, Y_DOC_FLDR) 
}

toolkit_ModifyDocParent()
{
    fnHistory("fnDocBreak", X_DOC, Y_DOC_PRNT) 
}

toolkit_ModifyDocChild()
{
    fnHistory("fnDocBreak", X_DOC, Y_DOC_CHILD) 
}

toolkit_ModifyDocNone()
{
    fnHistory("fnDocBreak", X_DOC, Y_DOC_NONE) 
}
 
toolkit_ModifyKey()
{
    global Y_offset
    toolkit_ModifyKeyOpen()
    key = Enter Image Key Field
    WinGetPos, , , , height, %key%
    y_ok := height - Y_IMGKEY_OK_FROM_H

    fnSuspend()
    Suspend
    fnWindow(key)
    MouseMove, X_IMGKEY_OK, y_ok
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
    fn1Click(scan, X_SCAN_KEY, Y_SCAN_BTN_ROW1) 
}

toolkit_ModifyKeyClose()
{
    global Y_offset
    key = Enter Image Key Field
    WinGetPos, , , , height, %key%
    y_ok := height - Y_IMGKEY_OK_FROM_H
    MouseMove, X_IMGKEY_OK, y_ok
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
    fn1Click(scan, X_SCAN_OPTIONS, Y_SCAN_BTN_ROW2) 
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
    fnOptionSet(X_SCOPTION, Y_SCOPTION_PREP)
}

toolkit_OptionBlank()
{
    fnOptionSet(X_SCOPTION, Y_SCOPTION_BLANK)
}

toolkit_OptionInvert()
{
    fnOptionSet(X_SCOPTION, Y_SCOPTION_INVERT)
}

toolkit_OptionDeskew()
{
    fnOptionSet(X_SCOPTION, Y_SCOPTION_DESKEW)
}

toolkit_OptionRemoveBlackBorder()
{
    fnOptionSet(X_SCOPTION, Y_SCOPTION_BORDER)
}

toolkit_OptionDespeckle()
{
    fnOptionSet(X_SCOPTION, Y_SCOPTION_SPECKLE)
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
    ; read in numbers from ini at startup
    ; after that, write them each time they are updated
    ; have a "display string" command
    ; have a "restore defaults" command
    ; have a "restore last" command
    ; each write creates a backup. Infinite, single, or limited?

    mP=P0,P1,P2,P3,P4,P5,P6,P7,P8,P9
    mS=S0,S1,S2,S3,S4,S5,S6,S7,S8,S9
    mN=N0,N1,N2,N3,N4,N5,N6,N7,N8,N9
    mR=R0,R1,R2,R3,R4,R5,R6,R7,R8,R9
    mZ=Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9
    mplus=+0,+1,+2,+3,+4,+5,+6,+7,+8,+9
    mmin=-0,-1,-2,-3,-4,-5,-6,-7,-8,-9
    mA=A1,A2,A3,A4,A5,A6,A7,A8
    mF=F0,F1,F2,F3,F4,F5,F6,F7,F8,F9
    mD=D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA
    match=%mP%,%mS%,%mN%,%mR%,%mZ%,%mplus%,%mmin%,%mA%,%mF%,%mD%,I,E

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
    else if User_Input = D0
        toolkit_StringDisplay(0)
    else if User_Input = D1
        toolkit_StringDisplay(1)
    else if User_Input = D2
        toolkit_StringDisplay(2)
    else if User_Input = D3
        toolkit_StringDisplay(3)
    else if User_Input = D4
        toolkit_StringDisplay(4)
    else if User_Input = D5
        toolkit_StringDisplay(5)
    else if User_Input = D6
        toolkit_StringDisplay(6)
    else if User_Input = D7
        toolkit_StringDisplay(7)
    else if User_Input = D8
        toolkit_StringDisplay(8)
    else if User_Input = D9
        toolkit_StringDisplay(9)
    else if User_Input = DA
        toolkit_StringDisplayAll()
    else if User_Input = I
        toolkit_StringImport()
    else if User_Input = E
        toolkit_StringExport()

    fnStatus()
}

toolkit_StringEditPrefix(Num)
{
    global StrPre0, StrPre1, StrPre2, StrPre3, StrPre4, StrPre5, StrPre6, StrPre7, StrPre8, StrPre9, StringIni
    Default := StrPre%Num%
    fnSuspend()
    Suspend
    InputBox, StrPre%Num%, Prefix %Num%, Enter prefix for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    toWrite := StrPre%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrPre
    fnSuspend()
    Suspend
    return StrPre%Num%
}

toolkit_StringEditSuffix(Num)
{
    global StrSuf0, StrSuf1, StrSuf2, StrSuf3, StrSuf4, StrSuf5, StrSuf6, StrSuf7, StrSuf8, StrSuf9,StringIni
    Default := StrSuf%Num%
    fnSuspend()
    Suspend
    InputBox, StrSuf%Num%, Suffix %Num%, Enter suffix for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    toWrite := StrSuf%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrSuf
    fnSuspend()
    Suspend
    return StrSuf%Num%
}

toolkit_StringEditNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9,StringIni
    Default := StrNum%Num%
    fnSuspend()
    Suspend
    InputBox, StrNum%Num%, Number %Num%, Enter number for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    fnSuspend()
    Suspend
    return StrNum%Num%
}

toolkit_StringRestartNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9,StringIni
    StrNum%Num% = 1
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    return StrNum%Num%
}

toolkit_StringZeroNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9,StringIni
    StrNum%Num% = 0
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    return StrNum%Num%
}

toolkit_StringIncrementNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9,StringIni
    ++StrNum%Num%
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    return StrNum%Num%
}

toolkit_StringDecrementNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9,StringIni
    --StrNum%Num%
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    return StrNum%Num%
}

toolkit_StringFormatNumber(Num)
{
    global StrFmt0, StrFmt1, StrFmt2, StrFmt3, StrFmt4, StrFmt5, StrFmt6, StrFmt7, StrFmt8, StrFmt9,StringIni
    Default := StrFmt%Num%
    fnSuspend()
    Suspend
    InputBox, StrFmt%Num%, Format Number %Num%, Enter number of zeros to pad number %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    toWrite := StrFmt%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrFmt
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
    y_line := Y_IMGKEY_PER_LINE * Num + Y_IMGKEY_TOP_OFFSET 

    key = Enter Image Key Field
    ;FIXME if it doesn' exist, open it, apply, and exit - else just apply
    fn1Click(key, X_IMGKEY_LINE, y_line)
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
    y_ok := height - Y_IMGKEY_OK_FROM_H
    MouseMove, X_IMGKEY_OK, y_ok
    ;FIXME should move to OK
    ;FIXME Use case is: open the window Sh-i
    ;      toolkit_ModifyKeyOpen
    ;      Send the string ( this function )
    ;      close it Ctl-i
    ;      toolkit_ModifyKeyClose
}


toolkit_StringDisplay(Num)
{
    global StrNum1, StrFmt1, StrPre1, StrSuf1
    global StrNum2, StrFmt2, StrPre2, StrSuf2
    global StrNum3, StrFmt3, StrPre3, StrSuf3
    global StrNum4, StrFmt4, StrPre4, StrSuf4
    global StrNum5, StrFmt5, StrPre5, StrSuf5
    global StrNum6, StrFmt6, StrPre6, StrSuf6
    global StrNum7, StrFmt7, StrPre7, StrSuf7
    global StrNum8, StrFmt8, StrPre8, StrSuf8
    global StrNum9, StrFmt9, StrPre9, StrSuf9
    global StrNum0, StrFmt0, StrPre0, StrSuf0

    stringpre := StrPre%Num%
    fNum := fnZeroPad(StrNum%Num%, StrFmt%Num%)
    stringsuf := StrSuf%Num%
    string = %stringpre%%fNum%%stringsuf%
    len := StrLen(string)

    MsgBox, User String %Num% is: %string%
}

toolkit_StringDisplayAll()
{
    global StrNum1, StrFmt1, StrPre1, StrSuf1
    global StrNum2, StrFmt2, StrPre2, StrSuf2
    global StrNum3, StrFmt3, StrPre3, StrSuf3
    global StrNum4, StrFmt4, StrPre4, StrSuf4
    global StrNum5, StrFmt5, StrPre5, StrSuf5
    global StrNum6, StrFmt6, StrPre6, StrSuf6
    global StrNum7, StrFmt7, StrPre7, StrSuf7
    global StrNum8, StrFmt8, StrPre8, StrSuf8
    global StrNum9, StrFmt9, StrPre9, StrSuf9
    global StrNum0, StrFmt0, StrPre0, StrSuf0

    i=0
    Loop, 10
    {
        stringpre := StrPre%i%
        fNum := fnZeroPad(StrNum%i%, StrFmt%i%)
        stringsuf := StrSuf%i%
        string = %stringpre%%fNum%%stringsuf%
        substring := "user string "
        isstring := " is "
        linestring = %substring%%i%%isstring%%string%
        MsgBox %linestring%
        allstring = 
        (
        %allstring%
        %linestring%
        )

        i++
    }
        MsgBox, %allstring%
}

toolkit_StringExport()
{
    global my_network, StringIni

    inifiles = %my_network%user_strings
;FIXME make sure it exists
    fnSuspend()
    suspend
    SelectFileMsg=Select or create a user string set to export to.
    FileSelectFile, stringset, S24, %inifiles%, %SelectFileMsg%, ini files (*.ini)
    If ErrorLevel = 0
        FileCopy, %StringIni%, %stringset%.ini, 1
    fnSuspend()
    suspend
;FIXME new
}

toolkit_StringImport()
{
    global my_network, StringIni

    inifiles = %my_network%user_strings
;FIXME make sure it exists
    fnSuspend()
    suspend
    SelectFileMsg=Select user string set to import.
    FileSelectFile, stringset, S3, %inifiles%, %SelectFileMsg%, ini files (*.ini)
    If ErrorLevel = 0
        FileCopy, %stringset%.ini, %StringIni%, 1
    fnSuspend()
    suspend
;FIXME new
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
        fn1Click(scan, X_SCAN_EXIT, Y_SCAN_STARTSTOP) 
    }
    ExitApp
}

toolkit_BlackNWhite()
{
    global scan
    fnPullDown(scan, X_SCAN_COLORS, Y_SCAN_COLORS, Y_SCAN_BW)
}

toolkit_ColorLow()
{
    global scan
    fnPullDown(scan, X_SCAN_COLORS, Y_SCAN_COLORS, Y_SCAN_COLORLO)
}

toolkit_ColorMed()
{
    global scan
    fnPullDown(scan, X_SCAN_COLORS, Y_SCAN_COLORS, Y_SCAN_COLORMED)
}

toolkit_ColorHi()
{
    global scan
    fnPullDown(scan, X_SCAN_COLORS, Y_SCAN_COLORS, Y_SCAN_COLORHI)
}

toolkit_GrayLow()   ;FIXME, might be bad posns
{
    global scan
    fnPullDown(scan, X_SCAN_COLORS, Y_SCAN_COLORS, Y_SCAN_GRAYLO)
}

toolkit_GrayMed()
{
    global scan
    fnPullDown(scan, X_SCAN_COLORS, Y_SCAN_COLORS, Y_SCAN_GRAYMED)
}

toolkit_GrayHi()
{
    global scan
    fnPullDown(scan, X_SCAN_COLORS, Y_SCAN_COLORS, Y_SCAN_GRAYHI)
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
    fnHistory("fnScanOptions", X_OPTIONS, Y_OPTIONS_RESCAN) 
}

toolkit_RotateLeftIpro()
{
    global
    fn1Click("PREPFLAG", X_PREP_LEFT, Y_PREP_ROT) 
}

toolkit_RotateRightIpro()
{
    global
    fn1Click("PREPFLAG", X_PREP_RIGHT, Y_PREP_ROTSTICKY) 
}

toolkit_RotateLeftIproSticky()
{
    global
    fn1Click("PREPFLAG", X_PREP_LEFT, Y_PREP_ROT) 
}

toolkit_RotateRightIproSticky()
{
    global
    fn1Click("PREPFLAG", X_PREP_RIGHT, Y_PREP_ROTSTICKY) 
}

toolkit_Scan()
{
    global
    if SuperScanOn = SuperScan ON
    {
       fn1Click(scan, X_SCAN_COL_DOC, Y_SCAN_PRNT) 
    }
    
    pubFnScan()
}

toolkit_StartScan()
{
    global
    fn1Click(scan, X_SCAN_START, Y_SCAN_STARTSTOP) 
    Sleep, 1000
    fnStartUp()
}

toolkit_SuffixDecrement()
{
    global
    fn1Click(scan, X_SCAN_SUFF, Y_SCAN_DECR) 
}

toolkit_SuffixIncrement()
{
    global
    fn1Click(scan, X_SCAN_SUFF, Y_SCAN_INCR) 
}

toolkit_SuffixSticky()
{
    global
    fn1Click("PREPFLAG", X_PREP_SUFF, Y_PREP_SUFF) 
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
    fn1Click(scan, X_SCAN_AUTODET, Y_SCAN_AUTODET) 
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
    fn1Click(scan, X_SCAN_BTN_COL, Y_SCAN_ZOOM) 
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

