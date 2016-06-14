rem pina is to blame for this:
set output_filename=build-date_basic.lbl
set script_dir=.

rem output c64list comment describing {uses:} path:
echo ' {uses:%script_dir%\%output_filename%} > %output_filename%

rem conditionally write build date/time
echo {ifdef:debug}			>> %output_filename%
echo print "%date% %time%"	>> %output_filename%
echo {endif}				>> %output_filename%

set output_filename=
set script_dir=

echo Done.
