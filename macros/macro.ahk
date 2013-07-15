; q macros

macro_1() ;w1 space
{
    ScanDriver_w1()
    Sleep 100
    Send {Space}
}

macro_2() ;w2 space
{
    ScanDriver_w2()
    Sleep 100
    Send {Space}
}

macro_3() ;w3 space
{
    ScanDriver_w3()
    Sleep 100
    Send {Space}
}

macro_4() ;w4 space
{
    ScanDriver_w4()
    Sleep 100
    Send {Space}
}

macro_5() ;w5 space
{
    ScanDriver_w5()
    Sleep 100
    Send {Space}
}

macro_6()
{
    toolkit_DecrementTabAndImport()
}

macro_7()
{
    toolkit_SetTabNumber()
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
    ScanDriver_w2()
    Sleep 100
    Send b
}

macro_c() ;color space
{
    ScanDriver_w4()
    Sleep 100
    Send 1
    Sleep 100
    Send {Space}
}

macro_d()
{
}

macro_e() ;w3, no doc
{
    ScanDriver_w3()
    Sleep 100
    Send n
}

macro_f() ;w2, folder
{
    ScanDriver_w2()
    Sleep 100
    Send f
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

macro_m() ;w2, media
{
    ScanDriver_w2()
    Sleep 100
    Send 3
    Sleep 100
    Send {Space}
}

macro_n()
{
}

macro_o()
{
    toolkit_ToggleSuperScan()
    Sleep 1
    Send d
    Sleep 1
    Send @
    Sleep 1
    ScanDriver_w2()
    Send {Space}
}

macro_p()
{
}

macro_q() ;w1, no break
{
    ScanDriver_w1()
    Sleep 100
    Send n
}

macro_r() ;reverse duplex, no break
{
    Send r
    Sleep 100
    Send n
}

macro_s() ;single, no break
{
    Send s
    Sleep 100
    Send n
}

macro_t() ;top to top, no break
{
    Send t
    Sleep 100
    Send n
}

macro_u()
{
}

macro_v()
{
}

macro_w() ;w2, no break
{
    ScanDriver_w2()
    Sleep 100
    Send n
}

macro_x() ;w3, no break
{
    ScanDriver_w3()
    Sleep 100
    Send n
}

macro_y()
{
}

macro_z()
{
    toolkit_EditPrefixBeginRestartPageNumber()
    Send d
}

macro__() ;edit page number
{
    toolkit_EditPageNumber()
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
    Send {Numpad1}
    Sleep 100
    Send {NumpadMult}
    Sleep 400
    Send d
}

macro_m2() ;edit prefix begin
{
    toolkit_EditPrefixBegin()
}

macro_m3() ;edit prefix number
{
    toolkit_EditPrefixNumber()
}

macro_m4() ;edit prefix end
{
    toolkit_EditPrefixEnd()
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
    Send a
    Sleep 100
    Send {Space}
}

macro_mb()
{
    ScanDriver_w2()
    Sleep 100
    Send b
}

macro_mc()
{
    ScanDriver_w2()
    Sleep 100
    Send c
}

macro_md()
{
    ScanDriver_w2()
    Sleep 100
    Send d
}

macro_me()
{
    Send e
    Sleep 100
    Send {Space}
}

macro_mf()
{
    ScanDriver_w2()
    Sleep 100
    Send f
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
    Send @
    Sleep 1
    ScanDriver_w1()
    Sleep 1
    toolkit_ToggleSuperScan()
    Sleep 1
    Send f
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
    ScanDriver_w2()
    Sleep 100
    Send u
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

macro_m[()
{
}

macro_m]()
{
}

macro_m_()
{
}

macro_m?()
{
}

macro_m@() ;edit prefix 2 begin
{
    toolkit_EditPrefix2Begin()
}

macro_m#() ;edit prefix 2 number
{
    toolkit_EditPrefix2Number()
}

macro_m$() ;edit prefix 2 end
{
    toolkit_EditPrefix2End()
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
    fnHistoryTop()
    Sleep 900
    Send ^b
}

macro_pc() ;child break last page
{
    fnHistoryTop()
    Sleep 900
    Send ^c
}

macro_pd() ;doc break last page
{
    fnHistoryTop()
    Sleep 900
    Send ^d
}

macro_pe()
{
}

macro_pf() ;folder break last page
{
    fnHistoryTop()
    Sleep 900
    Send ^f
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
    fnHistoryTop()
    Sleep 900
    Send ^n
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

macro_ps() ;rescan last page
{
    fnHistoryTop()
    Sleep 900
    Send ^{Space}
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
}

macro_py()
{
}

macro_pz()
{
}

macro_p[()
{
}

macro_p]()
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


