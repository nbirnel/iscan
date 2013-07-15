shown() 
{
    MsgBox shownfn
}

hidden() 
{
    MsgBox hiddenfn
}

;IniRead, MacroFn1, g:/devel/iscan/checkout/src/initest/beg.ini, MacroA, fn1, hidden
;IniRead, MacroFn2, g:/devel/iscan/checkout/src/initest/beg.ini, MacroA, fn2, %A_Space%
;IniRead, MacroFn3, g:/devel/iscan/checkout/src/initest/beg.ini, MacroA, fn3, hidden
;
;MsgBox, %MacroFn1%
;MsgBox, %MacroFn2%
;
;%MacroFn1%()
;%MacroFn2%()
;%MacroFn3%()

foo = hidden
%foo%()


i=0

loop
{
    ++i
    IniRead, ToRun, g:/devel/iscan/checkout/src/initest/beg.ini, MacroA, fn%i%
    If ToRun = ERROR
        break
    %ToRun%()
}

IniRead, pref, g:/devel/iscan/checkout/src/initest/beg.ini, stringA, prefix, hidden
IniRead, numb, g:/devel/iscan/checkout/src/initest/beg.ini, stringA, number, hidden
IniRead, suff, g:/devel/iscan/checkout/src/initest/beg.ini, stringA, suffix, hidden

MsgBox %pref%%numb%%suff%
