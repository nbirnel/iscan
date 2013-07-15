StringIni = iscan_strings.ini

Num = 7
StrPre%Num% = 21

toWrite := StrPre%Num%
IniWrite, %toWrite%, %StringIni%, String%Num%, StrPre

Num = 8
StrPre%Num% = 22

toWrite := StrPre%Num%
IniWrite, %toWrite%, %StringIni%, String%Num%, StrPre

