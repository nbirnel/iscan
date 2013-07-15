fnRet1()
{
    return 1
}

fnRet0()
{
    return 0
}

if fnRet1()
    MsgBox, %foo% ret1

if fnRet0()
    MsgBox, %foo% ret0


