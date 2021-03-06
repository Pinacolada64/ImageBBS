#!/bin/bash

# * = works
# *	q0	send DCE responses to DTE
# *	e0	do not echo DCE input
# *	v0	set terse result codes
# *	&Cn	n=0: invert DCD (high when no call)
#		n=1: set CTS high, set DCD pin low when no call
#		n=2: ERROR
#
# *	&d2	ok, no dce_control_line messages
# 	AT&Dx -> Evaluating AT&�2
#
# *	&Kn	n=3: set RTS/CTS flow control
#		n=6: sets RTS/CTS *and* XON/XOFF flow control
# 		(with old tcpser, &Kx is misinterpreted as &Ex, an illegal AT command)
#
# *	&q5	sets DTR?

# *	ats0=n	set number of rings to answer on (n=0: disable auto-answer)
# *	ats2=n	set command mode escape character: 27=Esc, 43=+

# Looking in "modem_core.c" source:
#
# &C0 - sets DCD inverted (high when no call)
# &K3 - sets RTS/CTS flow control

# original                      -i "q0h0e0v0s0=0x1&c1&d2&k3"
tcpser -s 2400 -v 25232 -p 6400 -i "e0v0s0=1s2=27" -tsI -l7 \
# X-Tec
-n ci1=cib.dyndns.org:6400		\ # Image 1.2
-n ci2=cib.dyndns.org:6401		\ # Image 1.2
-n ci3=cib.dyndns.org:6402		\ # Image 1.2
-n tst=cib.dyndns.org:6403		\ # Image 1.2b, SD2IEC test BBS
# 1st Wrong Number 1
-n wn1=cib.dyndns.org:6404		\ # Image 1.2b
# 2nd Wrong Number 2
-n wn2=cib.dyndns.org:6405		\ # Image 2.0
# Image 2.0 HQ
-n hq2=cib.dyndns.org:6407		\ # Image 2.0, test board

# CAPTAIN SULU - System One
-n sys=systemone.ddns.net:6400		\ # Image 1.2b

# Blackflag - Alternate Dimension
-n altd=altd.dyndns.org:6400		\ # Image 1.2

# Darkstar - Atlantis & Avalon Isle
-n atl=atl.ddns.org:6401		\ # Image 2.0
-n avi=avalonisle.ddns.net		\ # Image 1.2b

# Jay Theriot - Bayou BBS
-n bay=jayctheriot.com:6401		\ # Image 1.2b

# Deadman - Remote CPU
-n cpu=remotecpu.com:6502		\ # Image 1.2b

# S0RC3R0R - Retrograde
-n rtg=retrograde.dyndns.org:6400	\ # Image 2.0

# J.ROTTEN - Riktronics
-n rik=rkbbs.net:23			\ # Image 1.2a

# Hoy Brothers - 13th Floor
-n 13f=13th.hoyvision.com:6400		\ # Image 1.3

#  -A connect.txt -B busy.txt -N no-answer.txt
