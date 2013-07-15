;iscan.ahk Copyright Noah Birnel 2009
;free license : do what you want with this software

critical
;CONSTANTS

nums = 1,2,3,4,5,6,7,8,9,0
lc_alpha = a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
lc_punc = ``,-,=,[,],\,`;,',/
UC_punc = ~,_,+,{,},|,:,",<,>,?
num_punc = !,@,#,$,`%,^,&,*,(,)
    ; FIXME not really all characters - can't seem to get , and . in.
all_chars = %nums%,%lc_alpha%,%lc_punc%,%UC_punc%,%num_punc%

SetDefaultMouseSpeed, 0 ; bump to 30 to debug

StandardLibrary=%A_AppDataCommon%\AutoHotKey\iscan
Library=%A_AppData%\AutoHotKey\iscan
StringIni=%Library%\user_strings.ini
batch_record=%Library%\batch_record.txt

;VARIABLES

HotkeyOn=Hotkeys ON
SuperScanOn=SuperScan off ( press \ to activate )
Info:="......? for help......Win-[ to suspend......ZZ to quit"
Status=%HotkeyOn%  %SuperScanOn% %Info%
StatusBar=%Status%
Zoom=off

my_editor=%A_WinDir%\Notepad.exe
macro_editor=%A_WinDir%\Notepad.exe
my_viewer=%A_WinDir%\Notepad.exe
my_macros=%Library%\iscan_macros\
;FIXME we should check to see this exists, once we have loaded iscan_rc
my_network=%Library%\network\
scan_staging=C:\SCAN
scan_holding=C:\SCANHOLD
repo=C:\SCANREPO
parent_tif=%repo%\PREP_SHEETS\parent.tif
tabs=%repo%\TABS

;DO WE HAVE WHAT WE NEED TO RUN? 

IfNotExist, %Library%
    FileCreateDir, %Library%

RestartFlag = 
If fnDependenciesMissing()
    RestartFlag = True    

; FIXME should always overwrite, in case we updated?
IfNotExist, %Library%\single_user.txt
{
   ; 0 for don't overwrite local copies
   FileCopyDir, %StandardLibrary%\iscan_macros,    %Library%\iscan_macros, 0
   FileCopy,    %StandardLibrary%\macro.ahk,       %Library%,              0
   FileCopy,    %StandardLibrary%\iscan_rc.ahk,    %Library%,              0
}

If fnDependenciesMissing()
{
    MsgBox, Missing Dependencies - Please see Administrator
    ExitApp
}

if RestartFlag       ;FIXME fail loudly if copying didn't work
    fnRestart()

        
;HERE WE GO

; Personal startup... reset variables, do things...
#include *i %A_AppDataCommon%\AutoHotKey\iscan\iscan_rc.ahk
; personal overrides global     FIXME installers
#include *i %A_AppData%\AutoHotKey\iscan\iscan_rc.ahk
; iscn_fns has the other needed includes.
#include *i %A_AppDataCommon%\AutoHotKey\iscan\iscan_fns.ahk
; recover our user strings
fnReadUserStrings()

;START-UP FUNCTIONS

fnDependenciesMissing()
{
    global
    ;global Library

    functions=%StandardLibrary%\iscan_fns.ahk
    driver=%StandardLibrary%\ScanDriver.ahk
    toolkit=%StandardLibrary%\toolkit.ahk
    keybindings=%StandardLibrary%\keybindings.ahk
    iscan_rc=%Library%\iscan_rc.ahk
    macro=%Library%\macro.ahk
    
    IfNotExist, %functions%
        Return True
    IfNotExist, %driver%
        Return True
    IfNotExist, %macro%
        Return True
    IfNotExist, %toolkit%
        Return True
    IfNotExist, %iscan_rc%
        Return True
    IfNotExist, %keybindings%
        Return True
}

fnRestart()
{
    Reload
    Sleep 1000 ; If successful, the reload will close this instance during
               ; the Sleep, so the line below will never be reached.
    MsgBox, 4,, Can't reload script. Would you like to open it for editing?
    IfMsgBox, Yes, Edit
}

