# Image BBS
Two versions (1.2a and 2.0) of a bulletin board system for the Commodore 64.
They are feature-packed and fun to use.

Version 3.0 is a radical departure in terms of module line numbering, and can be found in a [separate repository](https://github.com/Pinacolada64/ImageBBS3).

# C64List

Source code (both BASIC and assembly language) can be handled using Jeff Hoag's "C64List" utility.

C64List is a Windows command-line utility (which also works under WINE in Linux) to convert BASIC programs into a more easily-edited text format.
Or, it can go the other way around, and convert text files into native PRG binaries.
An assembler is included to either add assembly code to the end of a BASIC program, or write a standalone assembly program. There are many other features.
Visit the [Bit 64 Blog](http://commodoreserver.com/BlogView.asp?BID=620460DB83BF4CC1AE7FEF4E9AB4A228) for more information.

With the release of [C64List 4.04](http://facebook.com/groups/c64listgroup), BASIC code and quoted uppercase characters are now more easily readable.
BASIC code can be lowercased with `-keycase`.

## Previous Versions
When converting .prg (BASIC binaries) to .lbl files (where line number references are replaced with editable labels) with previous versions of C64List, continue to use `-alpha:upper`.
There is a `bash` shell script which converts `{$c1-$da}` to `{A-Z}` (which are interpreted with C64List's `{quoter:}` directive).

Check out our [wiki in progress](https://github.com/Pinacolada64/ImageBBS/wiki).

Need a modem emulator? Here's [tcpser source](https://github.com/go4retro/tcpser).

Want to telnet to some Image BBSes? Our network has 13 nodes! Check out the [Commodore BBS Outpost](http://cbbsoutpost.servebbs.com/index.php)!

# Docker Build

Thanks to the efforts of user `jcobol`, we have the beginnings of a Docker-based build for the assembly language.
See `https://github.com/Pinacolada64/ImageBBS/tree/master/v2/docker` for more information.

# Sysop Documentation

Both the Image BBS sysop documentation and various quick-reference guides are in the process of being converted to a web-based format:

[Image BBS 1.x, 2.0 and 3.0](https://pinacolada64.github.io/ImageBBS3-docs.github.io/)

# Connect With Us

Need technical support or just want to chat about stuff?

Image 1.x and 2.0: [Facebook](https://www.facebook.com/groups/141819789446)

Image 3.x: [Facebook](https://www.facebook.com/groups/1645970598934549)

This [#image-bbs Discord channel](https://discord.com/channels/775490546943787019/775979830612197377) is a subset of Pinacolada's _Puget Sound Commodore User's Group_ (PSCUG) server.

[Brent's World Forum](http://www.catracing.org/hendrb/forum/viewforum.php?f=33&sid=8da74b60ce741513760a3a38b03a7897)

[8-Bit Boyz Forum](https://8bitboyz.com/messageboards/)
