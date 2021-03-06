# Image BBS
Two versions (1.2a and 2.0) of a bulletin board program for the Commodore 64.
They are feature-packed and fun to use.

Source code (both BASIC and assembly language) can be handled using Jeff Hoag's
"C64List" utility.

C64List is a command-line utility to convert BASIC programs from a friendly text
format to its native C64 PRG format and back. You can also add assembly code
that gets loaded at the end of a BASIC program. There are many other features.
Visit the [Bit 64 Blog](http://commodoreserver.com/BlogView.asp?BID=620460DB83BF4CC1AE7FEF4E9AB4A228)
for more information.

## C64List 4.00
With the release of [C64List 4.00](http://facebook.com/groups/c64listgroup),
BASIC code and quoted uppercase characters are now more easily readable.
BASIC code can be lowercased with `-keycase`.

## Previous versions
When converting .prg binaries to .lbl text files with previous versions of
C64List, continue to use `-alpha:upper`. There is a Bash shell script which
converts `{$c1-$da}` to `{A-Z}`, interpreted with C64List's `{quoter:}`
directive.

Check out our [wiki in progress](https://github.com/Pinacolada64/ImageBBS/wiki).

[Need tcpser source?](https://github.com/FozzTexx/tcpser)

Want to telnet to some Image BBSes? Our network has 13 nodes! Check out the
[Commodore BBS Outpost](cbbsoutpost.servebbs.com/index.php)!
