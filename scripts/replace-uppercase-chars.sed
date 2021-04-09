# sed i.UD.lbl -e s/\{$d4\}/T/g
# escaping {} is not necessary
# escaping $ is necessary

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

# change "then<condition>" to "then <condition>"
s/then\[\^\ \]/then\ /g

# change "go(to|sub)<xxxx>" to "go(to|sub) <xxxx>"
s/\(goto\|gosub\)\[\^\ \]/\\1\ /g
