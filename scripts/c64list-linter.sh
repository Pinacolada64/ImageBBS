#!/bin/bash
# C64List .lbl linter -- fix some issues with .prg -> .lbl conversion

# 2019/02/22: C64List 3.50 handles uppercase characters in listings now;
# removed e.g. "A" -> "{A}" abstraction, is now just "A" in output file

# https://unix.stackexchange.com/questions/95939/how-exactly-do-i-create-a-sed-script-and-use-it-to-edit-a-file

output_file="$1"
cat $output_file | \

# echo <<EOFstring
# string='PRINT"{\$c1}{\$c2}{\$c3}{\$c4}" \
# ifwhateverthenstop\ngosub{:1001}:goto1001\n"
# EOFstring

# Desired output:
# PRINT "ABCD"
#  IF whatever THEN STOP
#  GOSUB {:1001}:GOTO 1001

# TODO: lowercasing keywords, but that will be tricker. maybe use awk/sed

# convert C64List 3.05's "{alpha:upper}" to 3.50's "{alpha:alt}"
# this results in infinitely more readable quoted strings

sed '
s/{alpha:upper}/{alpha:alt}/g
s/{\$a0}/ /g # shift-space -> space

s/{\$c1}/A/g
s/{\$c2}/B/g
s/{\$c3}/C/g
s/{\$c4}/D/g
s/{\$c5}/E/g
s/{\$c6}/F/g
s/{\$c7}/G/g
s/{\$c8}/H/g
s/{\$c9}/I/g
s/{\$ca}/J/g
s/{\$cb}/K/g
s/{\$cc}/L/g
s/{\$cd}/M/g
s/{\$ce}/N/g
s/{\$cf}/O/g
s/{\$d0}/P/g
s/{\$d1}/Q/g
s/{\$d2}/R/g
s/{\$d3}/S/g
s/{\$d4}/T/g
s/{\$d5}/U/g
s/{\$d6}/V/g
s/{\$d7}/W/g
s/{\$d8}/X/g
s/{\$d9}/Y/g
s/{\$da}/Z/g
' "$@"

# change "(if|then)<condition>" to "(if|then) <condition>"
# sed -E s/then\[\^\ \]/then\ /g | \

# change "go(to|sub)<xxxx>" to "go(to|sub) <xxxx>"
# "\^\ " = 'not followed by a space"
# sed -E s/\(goto\|gosub\)\[\^\ \]/\\1\ /g # "goto 1000"
