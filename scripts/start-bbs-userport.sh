#!/bin/bash
# 2020-01-11
basedir=$HOME/c64/Image\ BBS/v2
diskname=image-1_3-boot-e-user_port-fresh.d81

# tcpser is in ~/bin

# test Image 1.3 at 2400 bps on user port
# using VICE 3.3 r37286: mouseover drive 11 crash bug
# using VICE 3.3 r37354: fixed!!! happy hacker

# +acia		disable ACIA emulation
# -rsdev1	define device, address:port for tcpser to connect to
# -rsuser	enable user port RS232 emulation
# -drive10type	0=none, 1581=1581
# -10		attach disk image

# im: (use &,16,0 in line 3086)
# +/modem (have &,41 limited to 2400 bps)

# 'ss -t' shows ala 'netstat' the tcp connections
# shut down vice, shut down tcpser - still 'broken pipe' error on next run of vice?

# RS232 options:
# 'nc -q 1' waits 1 second after connection closes to exit
# *no colon needed between address and port*, despite VICE docs (maybe in Windows)
# nc: '-u' specifies UDP connection instead of TCP

# "-default" is just here temporarily to make sure command-line parameters are being used
x64sc -drive8type 0 -drive9type 0 -drive10type 1581 -drive11type 1581 -10 "$basedir/$diskname" -11 "$basedir/image-1_3-s-nm.d81" +acia1 -rsuser -rsdev1 "|nc -p 3007 -q 1 127.0.0.1 25232" -rsdev1baud 2400 -rsuserdev 0 -rsdev1ip232

exit

# enable remote monitor for quick detach/rewrite/re-attach cycle
-remotemonitor \
-remotemonitoraddress 127.0.0.1:6510

x64sc \
# -verbose \

# drive/disk image options:
-drive8type 0 \
-drive9type 0 \
-drive10type 1581 \
-drive11type 1581 \
-10 "$basedir/$diskname" \
-11 "$basedir/image-1_3-s-nm.d81" \

# RS232 options:
# 'nc -q 1' waits 1 second after connection closes to exit
# *no colon needed between address and port*, despite VICE docs (maybe in Windows)
+acia1 -rsuser -rsdev1 "|nc -p 3000 -q 1 127.0.0.1 25232" -rsdev1baud 2400 -rsuserdev 0 -rsdev1ip232 \

# enable remote monitor for quick detach/rewrite/re-attach cycle
-remotemonitor \
-remotemonitoraddress 127.0.0.1:6510
