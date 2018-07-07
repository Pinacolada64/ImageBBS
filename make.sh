#!/bin/bash

DISKIMAGE="test-disk.d64"

# declare an array variable
declare -a array=("one" "two" "three")

# get length of an array
arraylength=${#array[@]}

# use for loop to read all values and indexes
for (( i=1; i<${arraylength}+1; i++ ));
	do
		echo $i " / " ${arraylength} " : " ${array[$i-1]}
	done

# declare an array of base filenames (minus prefixes or suffixes)
# TODO: use sed to change plus to +, _ to ., slash to /
declare -a source=("UD" "UD_edit" "MM_load" "MM_maint" "MM_subop" "MM_ud-sort")
declare -a c64_file=("UD" "UD.edit" "MM.load" "MM.maint" "MM.subop" "MM.ud-sort")

# get length of an array
arraylength=${#source[@]}

for (( i=1; i<${arraylength}+1; i++ ));
do
	base="plus_${source[i-1]}"
	c64="+.${c64_file[$i-1]}"
#	echo -e "$i. $base.prg\t->\t+.$c64"

	wine c64list3_05.exe $base.lbl -prg:$base.prg -ovr -crunch
	c1541 $DISKIMAGE -del $c64 -write $base.prg $c64
done

	c1541 $DISKIMAGE -dir
