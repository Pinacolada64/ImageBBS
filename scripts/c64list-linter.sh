#!/bin/bash
# C64List .lbl linter
# fix uppercase characters in quoted strings when converting .prg -> .lbl

# updated 04/09/2020
# + change e.g., {A} to A for versions of C64List < 3.xx
# + no longer invokes 26 copies of sed, but uses -e <expression> instead

output_file="$1"
sed $output_file --file replace-uppercase-chars.sed

# echo <<EOFstring
# string="{\$c1}{\$c2}{\$c3}{\$c4}\nifwhateverthenstop\ngosub1001:goto1001\n"
# EOFstring

# Desired output:
# print"ABCD"
#  ifwhateverthen stop
#  gosub 1001:goto 1001

# this works:
# sed i.UD.lbl -e s/\{$d4\}/T/g
