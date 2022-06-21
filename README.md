# Image BBS
Two versions (1.2a and 2.0) of a bulletin board program for the Commodore 64.
They are feature-packed and fun to use.

Version 3.0 is a radical departure in terms of module line numbering, and can be found in a [separate repository](https://github.com/Pinacolada64/ImageBBS3).

# C64List

Source code (both BASIC and assembly language) can be handled using Jeff Hoag's
"C64List" utility.

C64List is a Windows command-line utility (which also works under WINE in Linux) to convert BASIC programs into a more easily-edited text
format. Or, it can go the other way around, and convert text files into native PRG binaries. An assembler is included to either add assembly code
to the end of a BASIC program, or write a standalone assembly program. There are many other features.
Visit the [Bit 64 Blog](http://commodoreserver.com/BlogView.asp?BID=620460DB83BF4CC1AE7FEF4E9AB4A228)
for more information.

With the release of [C64List 4.04](http://facebook.com/groups/c64listgroup),
BASIC code and quoted uppercase characters are now more easily readable.
BASIC code can be lowercased with `-keycase`.

## Previous versions
When converting .prg (BASIC binaries) to .lbl files (where line number references are replaced with editable labels) with previous versions of
C64List, continue to use `-alpha:upper`. There is a `bash` shell script which
converts `{$c1-$da}` to `{A-Z}` (which are interpreted with C64List's `{quoter:}`
directive).

Check out our [wiki in progress](https://github.com/Pinacolada64/ImageBBS/wiki).

Need a modem emulator? Here's [tcpser source](https://github.com/FozzTexx/tcpser).

Want to telnet to some Image BBSes? Our network has 13 nodes! Check out the
[Commodore BBS Outpost](cbbsoutpost.servebbs.com/index.php)!
