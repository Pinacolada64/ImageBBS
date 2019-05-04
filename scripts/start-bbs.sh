#!/bin/bash
# 11/May/2018
basedir="~/c64/Image\ BBS/v2"

# tcpser is in ~/bin

# test Image 1.3 in VICE 3.1 at 2400 bps on user port
# +acia		disable ACIA emulation
# -rsdev1	define device, address:port for tcpser to connect to
# -rsuser	enable user port RS232 emulation
# -drive10type	1581
# -10		attach disk image

x64 -verbose \
+acia \
-rsdev1 0 \
# -rsuserdev1 \|nc\ -p\ 3064\ 127.0.0.1\ 25232 
-rsuser \
-rsdev1baud 2400 \
-drive10type 1581 -10 "($basedir)/image\ 2_0\ boot-e.d81" -drive11type 1581 -11 "($basedir)/image\ 2_0\ s-nm.d81"

# FIXME
#Error - Cannot attach disk image `~/c64/Image\ BBS/v2/image\ 2_0\ boot-e.d81' to unit 10.
#Filesystem Image: Error - Cannot open file `~/c64/Image\ BBS/v2/image\ 2_0\ s-nm.d81'.
#Error - Cannot attach disk image `~/c64/Image\ BBS/v2/image\ 2_0\ s-nm.d81' to unit 11.
