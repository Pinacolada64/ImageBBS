#!/bin/bash

# Loop through a directory of *.lbl filenames, fixing an issue where
# DirMaster for Windows exports Commodore filenames with "/" in them
# "i/lo.blah" -> "i- lo.blah"

# http://tldp.org/LDP/abs/html/string-manipulation.html
# (Substring Replacement)
use_slashes=1

function translate_filename()
# this translates the filename given and returns in $test
{
	stringZ=(basename "$1")
#	compare=(basename "$1")
# // delimiter replaces globally; / replaces first occurrence
	echo "Input : $stringZ"
	test=${stringZ//plus/+}		# plus to +
	echo "Step 1: $test"
		if [ "$use_slashes" == "1" ]; then
			test=${test//\ -\ /\/}		# " - " to / -- escape " " and /!
		else
			test=${test//slash/-}		# slash to -
		fi;
	echo "Step 2: $test"
	test=${test//./_}		# . to _
	echo "Step 3: $test $stringZ"
	[ "$stringZ" != "$test" ] && echo "Unequal."; exit 0 # success, git mv them
	echo "Strings equal." && exit 1
}

CURRENT_DIR=$PWD
cd ../v2/core/jack
# can't use "find ../v2/core/jack/foo_bar.lbl" because ".." will be translated to "__"

translate_filename "i - bla.bla"; echo $test

find . -name '*.lbl' | \
    while read fname ;
	fname=${fname//.lbl/}	# strip .lbl extension to not transform to "_lbl"
	do translate_filename "$fname";
	    echo "Status: $?"
	    if [ "$?" == "1" ]; then
		echo "$fname.lbl: No transformation required"
	    else
		echo "git mv $fname.lbl $test.lbl"
	    fi;
    done

echo ${file##*/}

# old_filename="$1" # "plusslashMM_load.lbl"

translate_filename "$old_filename" # "+/MM.load.lbl"
C64_FILE=${test//.lbl/}	# remove .lbl extension

# translate_filename "plusplus 2" # "++ 2.prg"
echo "input_lbl=$input_lbl"
echo "C64_FILE=$C64_FILE"

# quote filenames since some have spaces in them
echo "wine c64list3_05.exe \"$input_lbl\" -prg -ovr"

# fluffy's sed script
# find . -name '*.lua' | while read fname ; do sed s/cat/dog/g "$fname" > "$fname.new" ; mv "$fname.new" "$fname" ; done

# find ../v2/core/jack -name '*.lbl' | while read fname ;
#    do translate_filename $fname ;
#	if [ "$?" = "1" ]; then
#	    echo "git mv $fname $test";
#	fi;
#    done

cd $CURRENT_DIR # return to where we were
