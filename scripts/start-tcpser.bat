tcpser -s 19200 -v 25232 -p 6400 -i "e1v0h0x4s0=1&D2&C1&K3" -l7 -tmM

rem -s 19200: 19.2k bps
rem -v 25232: connect to vice instance, using default rs232 port #
rem -p 6400: incoming connection port #
rem -i "...": init string (see start-bbs*.sh for explanation)
rem -l7: logging level
rem -tmM: trace inbound and outbound modem activity
