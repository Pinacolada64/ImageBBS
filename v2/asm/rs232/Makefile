DISKIMAGE = test-disk.d64
DISKHEADER = "diff tool"
DISKID = rs

C64LIST		= wine c64list4_02.exe
	# c64list 4.02 now includes former casm functionality
C64LISTFLAGS	= -ovr -verbose
C1541		= c1541
	# for formatting a new disk during "make clean" and
	# showing directory at the end of the "make" script

# must use reverse case in c64list to import as "diff-tool"
C64_FILENAME	= DIFF-TOOL

# "make" placeholders:
# % is a wildcard
# $< is the first dependency
# $@ is the target
# $^ is all dependencies

all: $(DISKIMAGE)

diff-tool.prg: diff-tool.lbl

%.lbl:
	echo "bla"

%.sym: %.lbl
	# wine c64list4_02.exe rs232-swift.asm -sym -ovr | dos2unix
	$(C64LIST) $< -sym:$@ $(C64LISTFLAGS)

%.prg: %.lbl
	$(C64LIST) $< -prg:$@ $(C64LISTFLAGS)

$(DISKIMAGE): diff-tool.prg
	# import diff-tool.prg into $(DISKIMAGE) as "diff-tool"
	# -d64:d64file[.d64]::"C64 FILE NAME"
	$(C64LIST) -d64:$(DISKIMAGE)::$(C64_FILENAME)
	# show contents
	$(C1541) $(DISKIMAGE) -dir

clean:
	rm -f *.prg *.sym $(DISKIMAGE)
	# format a fresh disk image
	$(C1541) -format $(DISKHEADER),$(DISKID) d64 $(DISKIMAGE)
