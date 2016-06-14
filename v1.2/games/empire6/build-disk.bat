echo off
rem import-files.bat
rem pinacolada did this
rem it's supposed to import a list of files from "file-list.txt",
rem invoke c1541.exe to copy them with the correct name supplied on
rem the next line

rem 3/Oct/2014 18:09
rem just picked gene's pumpkin

set utils_path=c:\opt

if exist %utils_path%\c1541.exe goto :ok 
echo %utils_path%\c1541.exe not found.
goto :quit

:ok
if exist file-list.txt goto :new_disk
echo file-list.txt not found.
goto :quit

:new_disk
REM c1541.exe format "-empire 6 alpha-,--" d64 test,d64

REM for /F %%a in (file-list.txt) do @echo %%a ; @echo ---

REM FOR /F "tokens=* usebackq" %i IN (`type "C:\path\to\titles.txt"`) DO COPY "C:\Temp\OriginalFilename.mp4" "C:\Temp\%i.mp4"

REM To parse a file, ignoring commented lines, type:
REM 
REM for /F "eol=; tokens=2,3* delims=," %i in (myfile.txt) do @echo %i %j %k

for /F "eol=; tokens=1,2 delims=, %i in (file-list.txt) do @echo %%i, %%j, %%k

:quit
REM Bye.
