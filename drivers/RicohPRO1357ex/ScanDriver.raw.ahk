;Scan driver auto hotkeys for Ricoh PRO1357ex
;Copyright Noah Birnel 2009
;Licensed under Gnu Public License

;VARIABLES

VERSION=0.72

;;Public functions - name them all pubFn

pubFnScan()
{
    global scan_driver
    fn1Click(scan_driver, 492, 35) 
}

pubFnPreview()
{
    global scan_driver
    fn1Click(scan_driver, 492, 85) 
}

pubFnQuitScanDriver()
{    
    global scan_driver
    IfWinExist, %scan_driver%
    {
        fn1Click(scan_driver, 493, 126) 
    }
}

pubFnContrast1up()            
{
    privFnContrast(512, 347, 429, 393)  
}

pubFnContrast1down()
{
    privFnContrast(429, 347, 512, 393) 
}

pubFnContrast5up()            
{
    privFnContrast(512, 347, 429, 393, 5)  
}

pubFnContrast5down()            
{
    privFnContrast(429, 347, 512, 393, 5)  
}

pubFnContrastIntervalup()
{
    privFnContrast(502, 355, 439, 404) 
}

pubFnContrastIntervaldown()
{
    privFnContrast(439, 355, 502, 396) 
}

pubFnBrightness0()
{
    privFnBrightness(-45, 45)
}

pubFnBrightness1()
{
    privFnBrightness(-35, 35)
}

pubFnBrightness2()
{
    privFnBrightness(-25, 25)
}

pubFnBrightness3()
{
    privFnBrightness(-15, 15)
}

pubFnBrightness4()
{
    privFnBrightness(-5, 5)
}

pubFnBrightness5()
{
    privFnBrightness(5, -5)
}

pubFnBrightness6()
{
    privFnBrightness(15, -15)
}

pubFnBrightness7()
{
    privFnBrightness(25, -25)
}

pubFnBrightness8()
{
    privFnBrightness(35, -35)
}

pubFnBrightness9()
{
    privFnBrightness(45, -45)
}

;;-

pubFnExposureGlass()
{
    global scan_driver
    fn2Click(scan_driver, 150, 183, 80, 197) 
}

pubFnADF()
{
    global scan_driver
    fn2Click(scan_driver, 150, 183, 80, 210) 
}

;;-

pubFnSingleSided()
{
    global scan_driver
    fn2Click(scan_driver, 420, 238, 400, 252) 
}

pubFnDupTop2Top()
{
    global scan_driver
    fn2Click(scan_driver, 420, 238, 400, 265) 
}

pubFnDupReversed()
{
    global scan_driver
    fn2Click(scan_driver, 420, 238, 400, 278) 
}

;;-

pubFnToggleStartFScanner()
{
    global scan_driver
    fn1Click(scan_driver, 15, 251) 
}

;;-

pubFn0deg()
{
    global scan_driver
    fn2Click(scan_driver, 420, 213, 400, 229) 
}

pubFn180deg()
{
    global scan_driver
    fn2Click(scan_driver, 420, 213, 400, 266) 
}

pubFn90degL()
{
    global scan_driver
    fn2Click(scan_driver, 420, 213, 400, 285) 
}

pubFn90degR()
{
    global scan_driver
    fn2Click(scan_driver, 420, 213, 400, 247) 
}

;;-

pubFnCText()
{
   fnPullDown(scan_driver, X_SCAND_CLR, Y_SCAND_CLR, SCAND_TXT) 
}

pubFnCPhoto()
{
   fnPullDown(scan_driver, X_SCAND_CLR, Y_SCAND_CLR, SCAND_PHOTO) 
}

pubFnCGray()
{
   fnPullDown(scan_driver, X_SCAND_CLR, Y_SCAND_CLR, SCAND_GRAY) 
}

pubFnC8C()
{
   fnPullDown(scan_driver, X_SCAND_CLR, Y_SCAND_CLR, SCAND_8C) 
}

pubFnC8CPhoto()
{
   fnPullDown(scan_driver, X_SCAND_CLR, Y_SCAND_CLR, SCAND_8CPHOTO) 
}

pubFnC16KCol()
{
   fnPullDown(scan_driver, X_SCAND_CLR, Y_SCAND_CLR, SCAND_16KCOL) 
}

;;-

pubFnMode1()
{
    privFnFkeys(0, 55)
}

pubFnMode2()
{
    privFnFkeys(0, 145)
}

pubFnMode3()
{
    privFnFkeys(0, 235)
}

pubFnMode4()
{
    privFnFkeys(0, 325)
}

pubFnMode5()
{
    privFnFkeys(1, 55)
}

pubFnMode6()
{
    privFnFkeys(1, 145)
}

pubFnMode7()
{
    privFnFkeys(1, 235)
}

pubFnMode8()
{
    privFnFkeys(1, 325)
}

pubFnMode9()
{
    privFnFkeys(2, 55)
}

pubFnMode10()
{
    privFnFkeys(2, 145)
}

pubFnMode11()
{
    privFnFkeys(2, 235)
}

pubFnMode12()
{
    privFnFkeys(2, 325)
}

pubFnMode13()
{
    privFnFkeys(3, 55)
}

pubFnMode14()
{
    privFnFkeys(3, 145)
}

pubFnMode15()
{
    privFnFkeys(3, 235)
}

pubFnMode16()
{
    privFnFkeys(3, 325)
}

pubFnMode17()
{
    privFnFkeys(4, 55)
}

pubFnMode18()
{
    privFnFkeys(4, 145)
}

pubFnMode19()
{
    privFnFkeys(4, 235)
}

pubFnMode20()
{
    privFnFkeys(4, 325)
}

pubFnMode21()
{
    privFnFkeys(5, 55)
}

pubFnMode22()
{
    privFnFkeys(5, 145)
}

pubFnMode23()
{
    privFnFkeys(5, 235)
}

pubFnMode24()
{
    privFnFkeys(5, 325)
}

;;-                   Arbitrary commands for things useful on your 
                     ;machine, that no other machine likely has.

ScanDriver_w1()
{
    global scan_driver
    fn1Click(scan_driver,  55, 48) 
}

ScanDriver_w2()
{
    global scan_driver
    fn1Click(scan_driver, 145, 48) 
}

ScanDriver_w3()
{
    global scan_driver
    fn1Click(scan_driver, 235, 48) 
}

ScanDriver_w4()
{
    global scan_driver
    fn1Click(scan_driver, 325, 48) 
}

ScanDriver_w5()
{
    global scan_driver
    fn1Click(scan_driver, 415, 48) 
}

ScanDriver_w6()
{
}

ScanDriver_w7()
{
}

ScanDriver_w8()
{
}

ScanDriver_w9()   ;;Mode bar scroll right
{
    global scan_driver
    fn1Click(scan_driver,  30, 110) 
}

ScanDriver_w0()   ;;Mode bar scroll right
{
    global scan_driver
    fn1Click(scan_driver, 407, 110) 
}

ScanDriver_wa()
{
}

ScanDriver_wb()  ;blue drop brightness  363,352
{
    global scan_driver
    fn1Click(scan_driver, 480, 495) 
    fn1Click("Advanced", 35, 100) 
    fn1Click("Advanced", 295, 120) 
    fn1Click("Advanced", 225, 180) 
    fn1Click("Advanced", 375, 20) 
}

ScanDriver_wc()  ;chromatic drop contrast   363, 378
{
    global scan_driver
    fn1Click(scan_driver, 480, 495) 
    fn1Click("Advanced", 35, 100) 
    fn1Click("Advanced", 295, 120) 
    fn1Click("Advanced", 225, 200) 
    fn1Click("Advanced", 375, 20) 
}

ScanDriver_wd()
{
}

ScanDriver_we()  ;;export a driver library
{
    global RicohPRO1357ex
    fnSuspend()
    suspend
    SelectFileMsg=Select or create a scanner setting to export.
    FileSelectFile, selected, S24, %RicohPRO1357ex%, %SelectFileMsg%, Registry patches (*.reg)
    If ErrorLevel = 0
    {
        If RegExMatch(selected, "i)\.reg$")
            patch := selected
        else patch := selected . ".reg"
        Run, regedit /e %patch% "HKEY_CURRENT_USER\Software\Ricoh\Twain_V4\C:`%WINDOWS`%twain_32`%Ricoh_V4`%TP1357\English" 
    }
    fnSuspend()
    suspend
}

ScanDriver_wf()
{
}

ScanDriver_wg()  ; green drop
{
    global scan_driver
    fn1Click(scan_driver, 480, 495) 
    fn1Click("Advanced", 35, 100) 
    fn1Click("Advanced", 295, 120) 
    fn1Click("Advanced", 225, 160) 
    fn1Click("Advanced", 375, 20) 
}

ScanDriver_wh()  ;;driver built-in help
{
    global scan_driver
    fnSuspend()
    Suspend
    fn1Click(scan_driver, 495, 154)
}

ScanDriver_wi()  ;;import a driver library 
{
    global RicohPRO1357ex
    fnSuspend()
    suspend
    SelectFileMsg=Select a scanner setting to import.
    FileSelectFile, selected, 3, %RicohPRO1357ex%, %SelectFileMsg%, Registry patches (*.reg)
    If ErrorLevel = 0
    {
        Run, regedit /s %selected%
        pubFnQuitScanDriver()
        Sleep 300
        toolkit_StartScan()
        Sleep 200
        pubFnMode1()
    }
    fnSuspend()
    suspend
}


ScanDriver_wj()
{
}

ScanDriver_wk()
{
}

ScanDriver_wl()
{
}

ScanDriver_wm()
{
}

ScanDriver_wn()
{
}

ScanDriver_wo()   ;;Change and overwrite mode
{
}

ScanDriver_wp()
{
}

ScanDriver_wq()
{
}

ScanDriver_wr()     ;red drop
{
    global scan_driver

    fn1Click(scan_driver, 480, 495) 
    fn1Click("Advanced", 35, 100) 
    fn1Click("Advanced", 295, 120) 
    fn1Click("Advanced", 225, 140) 
    fn1Click("Advanced", 375, 20) 
}

ScanDriver_ws()   ;;Save mode
{
    global scan_driver
    fn1Click(scan_driver, 360, 138) 
    fnSuspend()
    Suspend
}

ScanDriver_wt()   ;;threshold  363, 400
{
}

ScanDriver_wu()
{
}

ScanDriver_wv()
{
}

ScanDriver_wx()  ;;x width 204,328
{
}

ScanDriver_wy()  ;;y height 204,352
{
}

ScanDriver_wz()
{
}

ScanDriver_w_()
{
    MsgBox underscore
}

ScanDriver_w?()   ;;Driver-specific help
{
    global my_editor
    global Library
    fnSuspend()
    Suspend
    Run, %my_editor% "%Library%\driver_help.txt"
}

ScanDriver_w@()
{
    MsgBox at
}

ScanDriver_w#()
{
    MsgBox num
}

ScanDriver_w$()
{
    MsgBox dol
}

;;Special stuff (Public)

pubFnGetScanDriver()
{
    global scan_driver
    global scan_driver_x
    global scan_driver_y
    WinGetTitle, scan_driver, RICOH Scanner Driver Ver, 
    WinGetPos, , , scan_driver_w, scan_driver_h, %scan_driver%
    scan_driver_x := A_ScreenWidth - scan_driver_w
    scan_driver_y := A_ScreenHeight - scan_driver_h
    WinMove, %scan_driver%, , %scan_driver_x%, %scan_driver_y%
}

;;Private functions - name them all privFn

privFnSendValue(x, y, value)
{
    global scan_driver
    fn1Click(scan_driver, x, y)
    SendPlay {Del} {Del} {Del} {Del} %value%
}

privFnFkeys(scrollTimes, clickX)  
{
    global scan_driver

    fnWindow(scan_driver)
    Loop, 5  ; bring the scrollbar to the far left 
    {
        fnClickSleep(30,  110) 
    }
    Loop, %scrollTimes%  ; move scrollbar to correct position
    {
        fnClickSleep(407,  110) 
    }
    fnClickSleep(clickX, 48) 
}

privFnBrightness(brightness, threshold)
{
    global scan_driver
    fn1Click(scan_driver, 363, 348) 
    SendPlay {Del} {Del} {Del} {Del} %brightness% ;FIXME mousesweep instead
    fn1Click(scan_driver, 363, 394) 
    SendPlay {Del} {Del} {Del} {Del} %threshold%
}
    
privFnContrast(xa, ya, xb, yb, loops = 1)
{
    global scan_driver
    fnWindow(scan_driver)
    loop %loops%
    {
        fnClickSleep(xa, ya)
    }
    loop %loops%
    {
        fnClickSleep(xb, yb) 
    }
}
