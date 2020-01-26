#!/bin/bash
# 2020/01/24 - rns
# c64list4.00 puts [] around unknown label #s
# to quell these issues, assign line numbers to those labels
# with preface file to {assign:Label=line #}

E_NOARGS=85
E_NOTFOUND=86
E_NOTPRG=87

if [ $# -eq 0 ]
	then # no command params
		echo "Usage: `basename $0` <.prg_file> [<.lbl_file>]"
cat <<endofhelp

De-tokenize a C64 binary .prg file into C64List 4.0 .lbl file.
Invokes WINE, calls C64List 4.0. Uses Image BBS 3.0
{assign:}s to reduce "unknown label" errors.

If <.lbl_file> is not specified, the base name of <.prg_file> is
used for output, but with a .lbl extension.
endofhelp
exit $E_NOARGS
fi

if [ $# -eq 1 ] # 1 param: input_prg_file. output_lbl_file will be input_prg_file.lbl
then
	input_prg_file=$1
	output_lbl_file=${input_prg_file%.*}.lbl # cut .prg extension, replace with .lbl
	echo "Converting $input_prg_file to $output_lbl_file"
	wine c64list4_00.exe $input_prg_file -verbose -lbl:$output_lbl_file -ovr -keycase -varcase -crunch:off -alpha:alt -pref:image-3_0-assigns.lbl
	exit $?
fi

if [ $# -eq 2 ]
then # 2 params: input_prg_file and output_lbl_file
	input_prg_file="$1"
	output_lbl_file="$2"
	if [ ! -f "$input_prg_file" ]
	then
		echo "File $input_prg_file not found!" >&2
		exit $E_NOTFOUND
	fi

	if [ ${input_prg_file##*.} != "prg" ]
	# use braces in variable substitution
	then
		echo "File $input_prg_file is not a .prg file!" >&2
		exit E_NOTPRG
	fi

	if [ ${output_lbl_file##*.} != "lbl" ]
	# use braces in variable substitution
	then
		echo "File $output_lbl_file is not a .lbl file!" >&2
		exit E_NOTPRG
	fi

	# does $output_lbl_file already exist?
	# if so, back it up with .bak extension
	if [ -f "$output_lbl_file" ]
	then
		echo "Backing up $output_lbl_file as $output_lbl_file.bak" >&1
		# TODO: rotate backups? :P
		cp "$output_lbl_file" "$output_lbl_file.bak"
	fi

	echo "Converting $input_prg_file to $output_lbl_file"
	wine c64list4_00.exe $input_prg_file -verbose -lbl:$output_lbl_file -keycase -varcase -crunch:off -alpha:alt -pref:image-3_0-assigns.lbl

#    -d64:$d64file::`echo {$2}|tr `;
fi

exit $?
