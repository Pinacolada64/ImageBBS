#!/bin/bash

# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

# echo "$? params"
# echo "$argv value"

# http://tldp.org/LDP/abs/html/string-manipulation.html
# (Substring Replacement)
use_slashes=1

function translate_filename()
# this translates the filename given and returns in $test
{
	stringZ="$1"
# // delimiter replaces globally; / replaces first occurrence
	echo "Input : $stringZ"
	test=${stringZ//plus/+}		# plus to +
	echo "Step 1: $test"
		if [ "$use_slashes" == "1" ]; then
			test=${test//slash/\/}		# slash to / -- escape /!
		else
			test=${test//slash/-}		# slash to -
		fi;
	echo "Step 2: $test"
	test=${test//_/.}		# _ to .
	echo "Step 3: $test"
}

disk_image=$2

input_lbl=$1 # "plusslashMM_load.lbl"
input_prg=${input_lbl//.lbl/.prg}		# change .lbl extension to .prg

translate_filename "$input_lbl" # "+/MM.load.lbl"
C64_FILE=${test//.lbl/}	# remove .lbl extension

# translate_filename "plusplus 2" # "++ 2.prg"

echo "input_lbl=$input_lbl"
echo "C64_FILE=$C64_FILE"

# quote filenames since some have spaces in them
echo "wine c64list3_05.exe \"$input_lbl\" -prg -ovr"
echo "c1541 \"$disk_image\" \
-del \"$C64_FILE\" \
-write \"$input_prg\" \"$C64_FILE\""

wine c64list3_05.exe \"$input_lbl\" -prg -ovr
c1541 "$disk_image" \
-del "$C64_FILE" \
-write "$input_prg" "$C64_FILE"

# echo "Setting 'use_slashes' to 0."
# use_slashes=0
# translate_filename "slashslashslash_" # "---."
# FILE=$test; echo $FILE
