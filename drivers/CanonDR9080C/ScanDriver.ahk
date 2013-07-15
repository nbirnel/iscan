;Scan driver auto hotkeys for Canon DR 9080C
;Copyright Noah Birnel 2009
;Licensed under Gnu Public License

;VARIABLES

VERSION=0.72

;;Public functions - name them all pubFn

pubFnScan()
{
    global scan_driver
    fn1Click(scan_driver, X_SCAND_SCAN, Y_SCAND_SCAN)
}

pubFnPreview()
{
    fnNoop()
}

pubFnQuitScanDriver()
{    
    ;FIXME bunk
    global scan_driver
    IfWinExist, %scan_driver%
    {
        fn1Click(scan_driver, 329, 480) 
    }
}

pubFnContrast1up()            
{
    global scan_driver
    fn1Click(scan_driver, X_SCAND_CONTRAST1_UP, Y_SCAND_CONTRAST)
}

pubFnContrast1down()
{
    global scan_driver
    fn1Click(scan_driver, X_SCAND_CONTRAST1_DN, Y_SCAND_CONTRAST)
}

pubFnContrast5up()            
{
    global scan_driver
    fnWindow(scan_driver)
    SendPlay, {ALTDOWN}B{ALTUP}
    loop, 13
    {
        SendPlay, {Right}
    }
}

pubFnContrast5down()            
{
    global scan_driver
    fnWindow(scan_driver)
    SendPlay, {ALTDOWN}B{ALTUP}
    loop, 13
    {
        SendPlay, {Left}
    }
}

pubFnContrastIntervalup()
{
    global scan_driver
    fn1Click(scan_driver, X_SCAND_CONTRASTBIG_UP, Y_SCAND_CONTRAST)
}

pubFnContrastIntervaldown()
{
    global scan_driver
    fn1Click(scan_driver, X_SCAND_CONTRASTBIG_DN, Y_SCAND_CONTRAST)
}

;; FIXME HERE DOWN
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
;;FIXME good to...
pubFnExposureGlass()
{
}

pubFnADF()
{
}

;;-

;;FIXME ...here
pubFnSingleSided()
{
    global scan_driver
    fn1Click(scan_driver, 358, 262) 
    Sleep, 100
    SendPlay, {HOME}
    Sleep, 100
    SendPlay, {ENTER}
    Sleep, 100
}

pubFnDupTop2Top()
{
    global scan_driver
    fn1Click(scan_driver, 358, 262) 
    Sleep, 100
    SendPlay, {HOME}
    Sleep, 100
    SendPlay, {Down}
    Sleep, 100
    SendPlay, {ENTER}
    Sleep, 100
}

pubFnDupReversed()
{
    ; not implemented 
}

;;-

pubFnToggleStartFScanner()
{
    global scan_driver
    fn1Click(scan_driver, 13, 240) 
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

pubFnMode1()
{
    privFnFkeys(1)
}

pubFnMode2()
{
    privFnFkeys(2)
}

pubFnMode3()
{
    privFnFkeys(3)
}

pubFnMode4()
{
    privFnFkeys(4)
}

pubFnMode5()
{
    privFnFkeys(5)
}

pubFnMode6()
{
    privFnFkeys(6)
}

pubFnMode7()
{
    privFnFkeys(7)
}

pubFnMode8()
{
    privFnFkeys(8)
}

pubFnMode9()
{
    privFnFkeys(9)
}

pubFnMode10()
{
    privFnFkeys(10)
}

pubFnMode11()
{
    privFnFkeys(11)
}

pubFnMode12()
{
    privFnFkeys(12)
}

pubFnMode13()
{
    privFnFkeys(13)
}

pubFnMode14()
{
    privFnFkeys(14)
}

pubFnMode15()
{
    privFnFkeys(15)
}

pubFnMode16()
{
    privFnFkeys(16)
}

pubFnMode17()
{
    privFnFkeys(17)
}

pubFnMode18()
{
    privFnFkeys(18)
}

pubFnMode19()
{
    privFnFkeys(19)
}

pubFnMode20()
{
    privFnFkeys(20)
}

pubFnMode21()
{
    privFnFkeys(21)
}

pubFnMode22()
{
    privFnFkeys(22)
}

pubFnMode23()
{
    privFnFkeys(23)
}

pubFnMode24()
{
    privFnFkeys(24)
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

ScanDriver_w9()
{
}

ScanDriver_w0()
{
}

ScanDriver_wa()
{
}

ScanDriver_wb()
{
}

ScanDriver_wc()
{
}

ScanDriver_wd()
{
}

ScanDriver_we()
{
}

ScanDriver_wf()
{
}

ScanDriver_wg()
{
}

ScanDriver_wh()  ;;driver built-in help
{
}

ScanDriver_wi()  ;;import a driver library 
{
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

ScanDriver_wr()
{
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

ScanDriver_w[()
{
    MsgBox [
}

ScanDriver_w]()
{
    MsgBox ]
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
    WinGetTitle, scan_driver, Canon DR-9080
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

privFnBrightness(brightness, threshold)
{
    global scan_driver
    fn1Click(scan_driver, 363, 348) 
    SendPlay {Del} {Del} {Del} {Del} %brightness%
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

privFnFkeys(num)
{
    global scan_driver
    fn1Click(scan_driver, 358, 21) 
    Sleep, 100
    SendPlay, {HOME}
    Sleep, 100
    Loop, %num%
    {
        SendPlay, {Down}
    }
    Sleep, 100
    SendPlay, {ENTER}
    Sleep, 100
}

privFnScanSize()
{
}
