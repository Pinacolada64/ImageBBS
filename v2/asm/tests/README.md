# ML Tests

`ml patcher.asm` - _(Unfinished)_ Patch ML files by supplying the original ML filename, the patch filename, and the output filename.

The format of the patch file is unknown.
Most likely it would just be a single file starting with a two-byte `load` address, followed by the bytes to patch, for each patch required.
This requires saving the start and end address, which I have tried to do in a save routine I added, but it's still broken.

When converted into `.prg` files, `base.asm` is the ML that will get patched by `patch.asm` - these are just sample files to test `ml patcher` with.

`break2.lbl` - BASIC stub with ML tail that displays 6510 processor registers (and an unknown memory location) when a `BRK` instruction is hit (like an ML monitor).
It also displays locations:
* `$00` (6510 On-Chip I/O Data Direction Register)
* `$01` (RAM banking), and
* `$df02` (either CIA #2 Register Images or perhaps the SwiftLink/Turbo232 cartridge's Command Register when its I/O base address is set to `$df00`)

An interesting discovery: the Image 1.2a SwiftLink driver code contained code very similar to this, so it was probably left in as a debugging aid and not removed.

`break.asm` - _(Unfinished)_ An alternate, not-as-featureful version of `break2.lbl`.
This will probably get deleted eventually; `break2.lbl` contains everything in this file, and then some.

`chatmode.asm` - _(Unfinished)_ Presumably view a chat log between two ports on a multiplexed Lt. Kernal hard drive.
A Lt. Kernal DOS contiguous file type is used to hold the session information.
More information about how to set up and read this file is contained in a Lt. Kernal programming information archive.

I added a routine to copy the file header block out of the LtK's host adapter memory to a separate block of memory as per Fiscal Information, Inc.'s programming guidelines.

Beyond that, I don't have the corresponding code to initiate or log a chat session within Image BBS.
I do hope that code from the either the aforementioned Lt. Kernal programming archive, or already-written code in the Commodore 128's _Centipede 128_ BBS package, will prove helpful to complete this code fragment in the future.
It would be a really neat feature to have this working.

`dtoi.asm` - 11-digit Image date string to int conversion tests

`dumpm.asm` - dump arrays to disk, like `&,14`

`remote.asm` - purpose unknown, currently locks up the BBS under Image v3.0.
Perhaps it is strictly an Image v1.2- or 2.0-only module, but this is untested.

`serial.asm` - _(Unfinished)_ serial number manipulations. Missing `rand` routine.

`swiftlink-craig-bruce.asm` - SwiftLink driver by Craig Bruce, for reference purposes.
Not used by Image BBS ML.

`visual.asm` - _(Unfinished)_ Start of a visual text editor.

## Building "+.test remote"

Not sure of this module's purpose other than reducing available RAM to `$0a01-$4000` and hooking into a bunch of vectors.

Build steps:

1. Assemble the binary:

`C64List4_04.exe remote.asm -prg`

2. Put `remote.prg` into a disk image, named as `++ remote` (note that 
with C64List, the destination filename must be in uppercase to be recognized as a lowercase filename on the 1541 filesystem):

`C64List4_04.exe remote.prg -d64:remote::"++ REMOTE"`

3. Generate `+.test remote`:

`C64List4_04.exe "plus_test remote.lbl" -prg`

4. Put the `plus_test remote.prg` into the same disk image, named as `+.test remote`:

`C64List4_04.exe "plus_test remote.prg" -d64:remote::"+.TEST REMOTE"`

5. Boot your BBS.

6. Use the `CP` (file copy) utility to copy `++ remote` and `+.test remote` to your Plus Files disk.

7. Use the `R` command to Run `+.test remote`.

???

8. Profit.
