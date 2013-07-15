; This file contains macros, which are called by pressing q and another
; character.
; Anything after a semicolon is a comment.

; Each macro has a series of commands it executes. It can use functions
; defined in iscan.ahk or scan_driver.ahk, or raw AutoHotkey commands, or send
; single letter hotkeys.

; The following sample, called by q2,  sends the function called by the key
; sequence w2, then sleeps 1/10th of a second to allow it's commands to execute,
; then sends the hotkey f.

;macro_2()
;{
;   ScanDriver_w2()
;   Sleep 100
;   Send f
;}

macro_1()
{
    ScanDriver_w1()    ; w1 
    toolkit_Scan()      ; Space 
}

macro_2()
{
    ScanDriver_w2()    ; w2 
    toolkit_Scan()      ; Space 
}

macro_3()
{
    ScanDriver_w3()    ; w3 
    toolkit_Scan()      ; Space 
}

macro_4()
{
    ScanDriver_w4()    ; w4 
    toolkit_Scan()      ; Space 
}

macro_5()
{
    ScanDriver_w5()    ; w5 
    toolkit_Scan()      ; Space 
}

macro_6()
{
}

macro_7()
{
}

macro_8()
{
}

macro_9()
{
}

macro_0()
{
}

macro_a()
{
}

macro_b()
{
    toolkit_BlackNWhite()    ; ZB 
    toolkit_Hotkey1Sticky()      ; Shift-1 
    ScanDriver_w1()    ; w1 
    toolkit_Scan()      ; Space 
}

macro_c()
{
    toolkit_ColorHi()    ; ZH 
    toolkit_Hotkey1Sticky()      ; Shift-1 
    ScanDriver_w4()    ; w4 
    toolkit_Scan()      ; Space 
}

macro_d()
{
}

macro_e()
{
    toolkit_DocParent()      ; d 
    ScanDriver_w3()    ; w3 
    toolkit_Scan()      ; Space 
}

macro_f()
{
    toolkit_DocFolder()      ; f 
    ScanDriver_w2()    ; w2 
    toolkit_Scan()      ; Space 
}

macro_g()
{
}

macro_h()
{
}

macro_i()
{
}

macro_j()
{
}

macro_k()
{
}

macro_l()
{
}

macro_m()
{
}

macro_n()
{
}

macro_o()
{
}

macro_p()
{
}

macro_q()
{
    toolkit_DocParent()      ; d 
    ScanDriver_w1()    ; w1 
    toolkit_Scan()      ; Space 
}

macro_r()
{
    toolkit_DocParent()      ; d 
    ScanDriver_w4()    ; w4 
    toolkit_Scan()      ; Space 
}

macro_s()
{
}

macro_t()
{
    toolkit_DocParent()      ; d 
    ScanDriver_w5()    ; w5 
    toolkit_Scan()      ; Space 
}

macro_u()
{
}

macro_v()
{
}

macro_w()
{
    toolkit_DocParent()      ; d 
    ScanDriver_w2()    ; w2 
    toolkit_Scan()      ; Space 
}

macro_x()
{
}

macro_y()
{
}

macro_z()
{
}

macro__()
{
}

macro_?()
{
}

macro_@()
{
}

macro_#()
{
}

macro_$()
{
}

; m macros

macro_m1()
{
}

macro_m2()
{
}

macro_m3()
{
}

macro_m4()
{
}

macro_m5()
{
}

macro_m6()
{
}

macro_m7()
{
}

macro_m8()
{
}

macro_m9()
{
}

macro_m0()
{
}

macro_ma()
{
}

macro_mb()
{
}

macro_mc()
{
}

macro_md()
{
}

macro_me()
{
}

macro_mf()
{
}

macro_mg()
{
}

macro_mh()
{
}

macro_mi()
{
}

macro_mj()
{
}

macro_mk()
{
}

macro_ml()
{
}

macro_mm()
{
}

macro_mn()
{
}

macro_mo()
{
}

macro_mp()
{
}

macro_mq()
{
}

macro_mr()
{
}

macro_ms()
{
}

macro_mt()
{
}

macro_mu()
{
}

macro_mv()
{
}

macro_mw()
{
}

macro_mx()
{
}

macro_my()
{
}

macro_mz()
{
}

macro_m_()
{
}

macro_m?()
{
}

macro_m@()
{
}

macro_m#()
{
}

macro_m$()
{
}

;p macros

macro_p1()
{
}

macro_p2()
{
}

macro_p3()
{
}

macro_p4()
{
}

macro_p5()
{
}

macro_p6()
{
}

macro_p7()
{
}

macro_p8()
{
}

macro_p9()
{
}

macro_p0()
{
}

macro_pa()
{
}

macro_pb() ;box break last page
{
    toolkit_GoToTop()    ; gt                    
    toolkit_ModifyDocBox()      ; Ctl-b 
}

macro_pc() ;child break last page
{
    toolkit_GoToTop()    ; gt                    
    toolkit_ModifyDocChild()      ; Ctl-c 
}

macro_pd() ;doc break last page
{
    toolkit_GoToTop()    ; gt                    
    toolkit_ModifyDocParent()      ; Ctl-d 
}

macro_pe()
{
}

macro_pf() ;folder break last page
{
    toolkit_GoToTop()    ; gt                    
    toolkit_ModifyDocFolder()      ; Ctl-f 
}

macro_pg()
{
}

macro_ph()
{
}

macro_pi()
{
}

macro_pj()
{
}

macro_pk()
{
}

macro_pl()
{
}

macro_pm()
{
}

macro_pn() ;no doc break on last page
{
    toolkit_GoToTop()    ; gt                    
    toolkit_ModifyDocNone()      ; Ctl-n 
}

macro_po()
{
}

macro_pp()
{
}

macro_pq()
{
}

macro_pr()
{
}

macro_ps()
{
}

macro_pt()
{
}

macro_pu()
{
}

macro_pv()
{
}

macro_pw()
{
}

macro_px()
{
    toolkit_DeleteLastScannedPage()      ; x 
    toolkit_Scan()      ; Space 
}

macro_py()
{
}

macro_pz()
{
}

macro_p_()
{
}

macro_p?()
{
}

macro_p@()
{
}

macro_p#()
{
}

macro_p$()
{
}


