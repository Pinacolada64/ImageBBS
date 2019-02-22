#!/bin/bash
# C64List .lbl linter -- fix some issues with .prg -> .lbl conversion

# 2019/02/22: C64List 3.50 handles uppercase characters in listings now;
# removed e.g. "A" -> "{A}" abstraction, is now just "A" in output file

output_file="$1"
cat $output_file | \

# echo <<EOFstring
# string="{\$c1}{\$c2}{\$c3}{\$c4}\nifwhateverthenstop\ngosub1001:goto1001\n"
# EOFstring

# Desired output:
# ABCD
#  ifwhateverthen stop
#  gosub 1001:goto 1001

# echo -e $string | \
sed -e s/\{\$c1\}/A/g | \
sed -e s/\{\$c2\}/B/g | \
sed -e s/\{\$c3\}/C/g | \
sed -e s/\{\$c4\}/D/g | \
sed -e s/\{\$c5\}/E/g | \
sed -e s/\{\$c6\}/F/g | \
sed -e s/\{\$c7\}/G/g | \
sed -e s/\{\$c8\}/H/g | \
sed -e s/\{\$c9\}/I/g | \
sed -e s/\{\$ca\}/J/g | \
sed -e s/\{\$cb\}/K/g | \
sed -e s/\{\$cc\}/L/g | \
sed -e s/\{\$cd\}/M/g | \
sed -e s/\{\$ce\}/N/g | \
sed -e s/\{\$cf\}/O/g | \
sed -e s/\{\$d0\}/P/g | \
sed -e s/\{\$d1\}/Q/g | \
sed -e s/\{\$d2\}/R/g | \
sed -e s/\{\$d3\}/S/g | \
sed -e s/\{\$d4\}/T/g | \
sed -e s/\{\$d5\}/U/g | \
sed -e s/\{\$d6\}/V/g | \
sed -e s/\{\$d7\}/W/g | \
sed -e s/\{\$d8\}/X/g | \
sed -e s/\{\$d9\}/Y/g | \
sed -e s/\{\$da\}/Z/g | \

# change "then<condition>" to "then <condition>"
sed -E s/then\[\^\ \]/then\ /g | \

# change "go(to|sub)<xxxx>" to "go(to|sub) <xxxx>"
sed -E s/\(goto\|gosub\)\[\^\ \]/\\1\ /g # "goto 1000"
