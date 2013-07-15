; This file contains customizations for iscan. 
; Anything after a semicolon is a comment.

; These are the defaults:

;my_editor=$A_WinDir%\Notepad.exe
;macro_editor=$A_WinDir%\Notepad.exe
;my_viewer=$A_WinDir%\Notepad.exe
;my_macros=%Library%
;scan_staging=C:\SCAN

; StatusAtBottom sets whether the status bar will be at the top of bottom of 
; the screen. Most people like it at the top, so it doesn't interfere with
; the default Windows Start Menu. Set it to True if you like.

StatusAtBottom=False

; my_editor is the program that will open configuration files for
; reading and editing. Change it from Notepad if you would like a more powerful
; editor such as vim, emacs, or textpad. Don't change it to a word processor.

;my_editor=%A_ProgramFiles%\Vim\vim73\gvim.exe

; macro_editor is the program to open macros for editing. There are some
; nice shortcuts in vimmacro.bat, if you know how to use vim.

;macro_editor=%Library%/vimmacro.bat

; my_viewer is the program that will open text files for viewing. You might 
; choose a lighter weight program than your editor for this.


; my_macros is the folder that holds your customized macro files. The only
; reason I can think of to change this is to make it a network location that can
; be accessed from any of several scanning stations. (And that's a useful 
; trick, so consider it.)

;my_macros=\\a\network\path\to\my\iscan_macros\

; scan_staging is the folder ipro-scan imports from. Change this to whatever
; that folder is if you use ipro-scan's import feature.

;scan_staging=C:\SCAN

; Name the path(s) to store your driver settings in if you would like to use
; the w-i and w-e import and export settings features. You'll need to create
; these folders. (Sorry. This will be changed in the future.)

RicohPRO1357ex=\\a\network\path\to\%A_UserName%\1357TwainV4\
RicohMP1350=\\a\network\path\to\%A_UserName%\1350TwainV4\

;FIXME 
; driver settings, my_macros, my_userstrings will all be subfolders of
; my_network in the future.
; 
