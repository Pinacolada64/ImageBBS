@echo off
rem build-empire-module.bat
rem a quick hack for your disgust

set script_dir=.

rem the lbl file should {include:build-date_basic.lbl}
C:\opt\C64List3_03.exe "%1" -alpha:invert -crunch -prg -verbose -ovr
rem ~nF1.txt or %filenameroot% in editpad pro

set script_dir=