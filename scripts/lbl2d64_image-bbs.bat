@echo off
setlocal
set /a debug=1
rem add2d64_image-bbs.bat

rem this batch file compiles "plus-files" (the 2nd command line parameter) for Image BBS
rem with c64list, then puts the resulting renamed file into a disk image specified in the
rem 1st command line parameter. Type the batch filename with no parameters for help.

rem set USESLASHES to 0 if you have a device which creates/accesses subdirectories
rem when "/" is found in filenames. They will be replaced with "-" instead.
set USESLASHES=1

if DEBUG==1 echo --- %0 starting.

set basedir=%userprofile%\My Documents\C64\Image BBS\image-bbs\scripts
pushd %basedir%
cd %basedir%

rem based on a batch file to add a .prg file to a d64 disk image
rem original by Bill Buckels 2013
rem c1541.exe that comes with winvice must be on-path
rem this disk must be used on a c64 and not on a c128
rem the program is a c64 binary with BASIC startup code

rem modified by pinacolada, 2/Apr/2014 20:49

rem again on 11/Jan/2015 17:51:
rem + cleaner logic
rem + errors output to stderr

rem again on 19/Jan/2015 0:01
rem agentfriday to the rescue after great pscug meeting!
rem + setlocal avoids clobbering % variables % between CALLs
rem + discovered variable expansion happens even in rem statements (!)

rem and again 2/Oct/2015 13:25
rem + handles quoted paths with spaces
rem http://stackoverflow.com/questions/5239291/batch-file-parameter-with-spaces-double-quotes-pipes
rem has a solution to this problem

rem and again 30/Nov/2015 13:07
rem + now removes *.prg extension within disk image
rem + now displays usage if no command line params
rem + now changes _ to . within filenames to be written to disk image
rem http://ss64.com/nt/syntax-replace.html
rem Use the syntax below to edit and replace the characters assigned to a string variable.
rem Syntax
rem      %variable:StrToFind=NewStr%

rem and again on 6/Jan/2016 13:25
rem quick addition for changing "plus" prefix to "+" in disk images (illegal DOS filename character)

rem and again on 18/Dec/2017 16:49
rem combined c64list/add2d64 a bit, USESLASHES config option

set oldpath=%path%
set C1541=c:\opt\c1541.exe
set C64LIST=c:\opt\c64list3_05.exe

rem no command line parameters?
rem usually is 'if "%1" == "" goto USAGE' but this barfs if
rem %1 is already enclosed in quotes. thanks, stackoverflow
rem http://stackoverflow.com/questions/26551/how-to-pass-command-line-parameters-in-batch-file
rem also, %~1 may work around quoting parameters

if "%~1" == "" goto USAGE

:FIND_C64LIST
if exist %C64LIST% goto FIND_C1541
echo C64LIST3_05.EXE was not found. It was expected to be in >&2
echo %C64LIST%. >&2
set errorlevel=1
goto :QUIT

:FIND_C1541
if exist %C1541% goto CHECK_LBL_PARAM
echo C1541.EXE was not found. It was expected to be in >&2
echo %C1541%. >&2
set errorlevel=1
goto :QUIT

:CHECK_LBL_PARAM
setlocal DisableDelayedExpansion
rem LBLFILE is "(path)\(filename).lbl" parameter 1 (~1: no quotes):
set LBLFILE=%~1
rem LBL_BASENAME: LBLFILE minus ".lbl" extension (~n):
set LBL_BASENAME=%~n1
rem PRG_PATH: "(drive)\(path)\", .prg added later for c1541:
set PRG_PATH=%~dp1%

setlocal EnableDelayedExpansion
if DEBUG==1 echo LBLFILE: !LBLFILE!
if DEBUG==1 echo LBL_BASENAME: !LBL_BASENAME!
if DEBUG==1 echo prg_path: !prg_path!

pause

if exist %lblfile% goto CHECK_IMAGE_PARAM
echo %LBLFILE% does not exist. Aborting. >&2
goto QUIT

:CHECK_IMAGE_PARAM
rem check disk image name parameter:
setlocal DisableDelayedExpansion
set diskimage="%~2"
setlocal EnableDelayedExpansion
if DEBUG == 1 echo diskimage: !diskimage!

if not "!diskimage!." == "." goto CHECK_IMAGE_EXISTS
echo Missing ^<disk_image.d64^> parameter. >&2
set errorlevel=2
goto :QUIT

:CHECK_IMAGE_EXISTS
if exist !diskimage! goto C64LIST
echo Disk image !diskimage! not found. Aborting. >&2
set errorlevel=3
goto :QUIT

rem output build date/time to "build-date_basic.lbl":
rem this includes BASIC PRINT statement to print date/time of build
if exist %basedir%\scripts\build-date_image-bbs.bat call %basedir%\scripts\build-image-bbs.bat

:C64LIST
rem compile using c64list3.05... chars must be in uppercase for Image BBS to recognize quoted chars
rem the lbl file can, if you want, {include:build-date_image-bbs.lbl} to show a debug build date
%c64list% "%lblfile%" -alpha:upper -crunch -prg -verbose -ovr

rem unfortunately c64list does not output errorlevel info that i know of, so we blindly soldier on:

rem disk image filename transformations:

rem 1) lbl_basename: command-line (filename).lbl parameter minus .lbl extension
rem    dos_basename: (LBL_BASENAME) to be written to disk image, minus .prg extension
rem    c64_filename: dos_basename is renamed to this in disk image
set dos_basename=%LBL_BASENAME%
set c64_filename=%dos_basename%
if DEBUG == 1 echo c64_filename = %c64_filename%

rem 2a) within c64_filename, change "_" to ".":
set c64_filename=%c64_filename:_=.%
if DEBUG == 1 echo [_ -^> .]: %c64_filename%

rem 2b) within dos_basename, change "plus" to "+":
set c64_filename="%c64_filename:plus=+%"
if DEBUG == 1 echo plus -^> +: c64_filename = %c64_filename%

rem 2c) c64_filename: change "slash" to either
rem USESLASHES=0: "-"
rem USESLASHES=1: "/"
if DEBUG == 1 echo c64_filename = %c64_filename%
if %USESLASHES%==1 (
	set c64_filename=%c64_filename:slash=/%
) else (
	set c64_filename=%c64_filename:slash=-%
)

echo dos_basename = %dos_basename%
echo c64_filename = %c64_filename%

:WORK
rem 1) attach disk image
rem 2) delete (possibly existing) c64_filename
rem 3) write new dos_basename.prg as c64_filename
rem 4) directory

rem the thing to remember here is the following parameters need not be quoted twice:
rem c1541 will throw "wrong number of parameters" errors if so

setlocal EnableDelayedExpansion
if debug==1 echo %c1541% -attach !diskimage! -delete !c64_filename! -write "!prg_path!!dos_basename!.prg" %c64_filename% -dir
%c1541% -attach !diskimage! -delete !c64_filename! -write "!prg_path!!dos_basename!.prg" %c64_filename% -dir
setlocal DisableDelayedExpansion
goto :QUIT

:USAGE
rem must escape < > | ^ symbols with ^ first.
echo Syntax: %0 ^<filename.lbl^> ^<disk_image.d64^> 
echo         (.lbl and .d64 extensions are currently required)
echo.
echo 1) Process ^<filename.lbl^> file with C64LIST
echo 2) Transform output filename as below:
echo    (Mostly to avoid problems with Style's DirMaster)
echo.
echo    .lbl             .prg
echo    plus    .......    +
echo    slash   .......    /    [Set USESLASHES=1]
echo                       -    [Set USESLASHES=0]
echo    _ (underscore)     .    (period)
echo.
echo             Example:
echo    plusslashlo_on.lbl   -^>   +/lo.on
echo.
echo 3) Add resulting .prg file to ^<disk_image.d64^>,
echo    overwriting existing file.
echo.

:QUIT
rem clean up after ourselves
if not errorlevel 0 echo [%0]: Exited with status %errorlevel%. >&2
set diskimage=
set prgfile=
set prgfile_basename=
set C1541=
set C64LIST=
set path=%oldpath%
set useslashes=

echo --- %0 done.
popd
endlocal
