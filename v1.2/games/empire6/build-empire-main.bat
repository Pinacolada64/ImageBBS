@echo off
rem build-empire-main.bat
rem a quick hack for your disgust

set script_dir=.

rem output build date/time to "build-date_basic.lbl":
rem this includes BASIC PRINT statement to print date/time of build
if exist %script_dir%\build-date_basic.bat call %script_dir%\build-date_basic.bat

rem the lbl file should {include:build-date_basic.lbl}
C:\opt\C64List3_03.exe "Empire6.lbl" -alpha:invert -crunch -prg -verbose -ovr -labels > includes.lbl
rem ~nF1.txt or %filenameroot% in editpad pro

set script_dir=
type includes.lbl
