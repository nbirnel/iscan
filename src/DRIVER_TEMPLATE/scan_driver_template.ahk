;Scan driver auto hotkeys for <SCANNER DRIVER VERSION> FIXME
;Copyright <AUTHOR YEAR> FIXME
;Licensed under Gnu Public License

;VARIABLES

VERSION=0.1

;;Public functions - name them all pubFn

pubFnScan()
{
}

pubFnPreview()
{
}

pubFnQuitScanDriver()
{    
}

pubFnContrast1up()            
{
}

pubFnContrast1down()
{
}

pubFnContrast5up()           ;5 is stupid. It just means a size of 
                             ;jump bigger than the smallest, but not
                             ;as big as "Interval"
{
}

pubFnContrast5down()            
{
}

pubFnContrastIntervalup()
{
}

pubFnContrastIntervaldown()
{
}

pubFnBrightness0()           ;Ten brightness commands, not
                             ;necessarily from darkest possible to
                             ;lightest possible, but darkest to
                             ;lightest usable.
{
}

pubFnBrightness1()
{
}

pubFnBrightness2()
{
}

pubFnBrightness3()
{
}

pubFnBrightness4()
{
}

pubFnBrightness5()
{
}

pubFnBrightness6()
{
}

pubFnBrightness7()
{
}

pubFnBrightness8()
{
}

pubFnBrightness9()
{
}

;;-

pubFnExposureGlass()
{
}

pubFnADF()                     ;Automatic Document Feeder.
                               ;could be known as Rapid Document
                               ;Handler.
{
}

;;-

pubFnSingleSided()
{
}

pubFnDupTop2Top()
{
}

pubFnDupReversed()
{
}

;;-

pubFnToggleStartFScanner()     ;start from scanner
{
}

;;-                            orientation

pubFn0deg()
{
}

pubFn180deg()
{
}

pubFn90degL()
{
}

pubFn90degR()
{
}

;;-                            "Modes" - could be presets
                               ;on your machine, or user-defined
                               ;presets. 

pubFnMode1()
{
}

pubFnMode2()
{
}

pubFnMode3()
{
}

pubFnMode4()
{
}

pubFnMode5()
{
}

pubFnMode6()
{
}

pubFnMode7()
{
}

pubFnMode8()
{
}

pubFnMode9()
{
}

pubFnMode10()
{
}

pubFnMode11()
{
}

pubFnMode12()
{
}

pubFnMode13()
{
}

pubFnMode14()
{
}

pubFnMode15()
{
}

pubFnMode16()
{
}

pubFnMode17()
{
}

pubFnMode18()
{
}

pubFnMode19()
{
}

pubFnMode20()
{
}

pubFnMode21()
{
}

pubFnMode22()
{
}

pubFnMode23()
{
}

pubFnMode24()
{
}

;;-                   Arbitrary commands for things useful on your 
                     ;machine, that no other machine likely has.

ScanDriver_w1()
{
}

ScanDriver_w2()
{
}

ScanDriver_w3()
{
}

ScanDriver_w4()
{
}

ScanDriver_w5()
{
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

ScanDriver_wh()
{
}

ScanDriver_wi()
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

ScanDriver_wo()
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

ScanDriver_ws()   ;;Best used for save mode
{
}

ScanDriver_wt()
{
}

ScanDriver_wu()
{
}

ScanDriver_wv()
{
}

ScanDriver_ww()
{
}

ScanDriver_wx()
{
}

ScanDriver_wy()
{
}

ScanDriver_wz()
{
}

ScanDriver_w``()
{
}

ScanDriver_w-()
{
}

ScanDriver_w=()
{
}

ScanDriver_w[()
{
}

ScanDriver_w]()
{
}

ScanDriver_w\()
{
}

ScanDriver_w`;()
{
}

ScanDriver_w'()
{
}

ScanDriver_w/()   ;;Driver's built-in help
{
}

ScanDriver_w~()
{
}

ScanDriver_w_()
{
}

ScanDriver_w+()
{
}

ScanDriver_w{()
{
}

ScanDriver_w}()
{
}

ScanDriver_w|()
{
}

ScanDriver_w:()
{
}

ScanDriver_w"()
{
}

ScanDriver_w<()
{
}

ScanDriver_w>()
{
}

ScanDriver_w?()
{
}

ScanDriver_w!()
{
}

ScanDriver_w@()
{
}

ScanDriver_w#()
{
}

ScanDriver_w$()
{
}

ScanDriver_w`%()
{
}

ScanDriver_w^()
{
}

ScanDriver_w&()
{
}

ScanDriver_w*()
{
}

ScanDriver_w(()
{
}

ScanDriver_w)()
{
}

;;Special stuff (Public)

pubFnGetScanDriver()
{
    global scan_driver
    global scan_driver_x
    global scan_driver_y
    WinGetTitle, scan_driver, <THE DRIVER> ;FIXME
    WinGetPos, , , scan_driver_w, scan_driver_h, %scan_driver%
    scan_driver_x := A_ScreenWidth - scan_driver_w
    scan_driver_y := A_ScreenHeight - scan_driver_h
    WinMove, %scan_driver%, , %scan_driver_x%, %scan_driver_y%
}

;;Private functions - name them all privFn

;These are not to called by outside programs - they
;are things specific to the driver. pubFnBrightness1() is
;called externally, and if it has to do some bizarre acrobatics
;to get things done in your machine, you can have it call
;privFnBrightness(1) down here.

