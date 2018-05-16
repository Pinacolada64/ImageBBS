#!/bin/bash

# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

# echo "$? params"
# echo "$argv value"

# http://tldp.org/LDP/abs/html/string-manipulation.html
# (Substring Replacement)
use_slashes=1

function translate_filename()
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

translate_filename "plusplus 2.prg" # "++ 2.prg"
PRG_FILE=$test

translate_filename "plusslashMM_load.lbl" # "+/MM.load.lbl"
LBL_FILE=$test

echo "PRG_FILE=$PRG_FILE"
echo "LBL_FILE=$LBL_FILE"

echo "Setting 'use_slashes' to 0."
use_slashes=0
translate_filename "slashslashslash_" # "---."
FILE=$test; echo $FILE
