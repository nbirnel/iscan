Library=%A_AppData%\AutoHotKey\iscan
StringIni=%Library%\user_strings.ini


;toolkit_StringFormatNumber(7)
;toolkit_StringEditNumber(7)
;toolkit_StringEditPrefix(7)
;toolkit_StringEditSuffix(7)
fnReadUserStrings()
toolkit_StringDisplay(7)
toolkit_StringDisplayAll()

toolkit_StringDisplay(Num)
{
    global StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7
    global StrFmt1, StrFmt2, StrFmt3, StrFmt4, StrFmt5, StrFmt6, StrFmt7
    global StrPre1, StrPre2, StrPre3, StrPre4, StrPre5, StrPre6, StrPre7
    global StrSuf1, StrSuf2, StrSuf3, StrSuf4, StrSuf5, StrSuf6, StrSuf7

    stringpre := StrPre%Num%
    fNum := fnZeroPad(StrNum%Num%, StrFmt%Num%)
    stringsuf := StrSuf%Num%
    string = %stringpre%%fNum%%stringsuf%
    len := StrLen(string)

    MsgBox, User String %Num% is: %string%
}

fnZeroPad(num, pad) ;FIXME new
{
    if StrLen(num) >= pad
        return num
    num := "00000000000000" . num
    StringRight, num, num, %pad%
    return num
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
;        endstring = `n
;        linestring = %substring%%i%%isstring%%string%%endstring%
;        MsgBox %linestring%
;        allstring = %allstring%%linestring%
        linestring = %substring%%i%%isstring%%string%
        allstring = 
        (
        %allstring%
        %linestring%
        )


        i++
    }
        MsgBox, %allstring%
    ;FIXME stupid interface
}

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

toolkit_StringEditPrefix(Num)
{
    global StrPre0, StrPre1, StrPre2, StrPre3, StrPre4, StrPre5, StrPre6, StrPre7, StrPre8, StrPre9, StringIni
    Default := StrPre%Num%
    
    
    InputBox, StrPre%Num%, Prefix %Num%, Enter prefix for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    toWrite := StrPre%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrPre
    return StrPre%Num%
}

toolkit_StringEditSuffix(Num)
{
    global StrSuf0, StrSuf1, StrSuf2, StrSuf3, StrSuf4, StrSuf5, StrSuf6, StrSuf7, StrSuf8, StrSuf9
    global StringIni
    Default := StrSuf%Num%
    
    
    InputBox, StrSuf%Num%, Suffix %Num%, Enter suffix for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    toWrite := StrSuf%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrSuf
    return StrSuf%Num%
}

toolkit_StringEditNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    global StringIni
    Default := StrNum%Num%
    
    
    InputBox, StrNum%Num%, Number %Num%, Enter number for string %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    
    
    return StrNum%Num%
}

toolkit_StringRestartNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    global StringIni
    StrNum%Num% = 1
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    return StrNum%Num%
}

toolkit_StringZeroNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    global StringIni
    StrNum%Num% = 0
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    return StrNum%Num%
}

toolkit_StringIncrementNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    global StringIni
    ++StrNum%Num%
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    return StrNum%Num%
}

toolkit_StringDecrementNumber(Num)
{
    global StrNum0, StrNum1, StrNum2, StrNum3, StrNum4, StrNum5, StrNum6, StrNum7, StrNum8, StrNum9
    global StringIni
    --StrNum%Num%
    toWrite := StrNum%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrNum
    return StrNum%Num%
}

toolkit_StringFormatNumber(Num)
{
    global StrFmt0, StrFmt1, StrFmt2, StrFmt3, StrFmt4, StrFmt5, StrFmt6, StrFmt7, StrFmt8, StrFmt9
    global StringIni
    Default := StrFmt%Num%
    
    
    InputBox, StrFmt%Num%, Format Number %Num%, Enter number of zeros to pad number %Num%:,,,,,,,, %Default%
    If ErrorLevel
        return False
    toWrite := StrFmt%Num%
    IniWrite, %toWrite%, %StringIni%, String%Num%, StrFmt
    
    
    return StrFmt%Num%
}


