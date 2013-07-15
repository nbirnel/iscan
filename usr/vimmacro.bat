@echo off

setlocal

set vim=%A_ProgramFiles%\Vim\vim73\gvim.exe

set flags=-S %APPDATA%\AutoHotkey\iscan\imacro.vim

%vim% %flags% %1
