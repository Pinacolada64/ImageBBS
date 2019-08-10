DISKIMAGE = test-disk.d64
DISKHEADER = swiftlink/t232
DISKID = rs

WINE = wine
C64LIST = c64list3_50.exe
C64LISTFLAGS = -ovr -verbose
CASM = casm.exe
C1541 = c1541

# must be in reverse case to import as "ml.rs232"
C64_FILENAME =	ML.RS232

# $(basename names…)
# Extracts all but the suffix of each file name in names.

# input_file = $<
# c64_disk_filename = (`echo $input_file | sed s/.prg//`) # remove .prg file extension

# % is a wildcard
# $< is the first dependency
# $@ is the target
# $^ is all dependencies

all: rs232.prg rs232-swift.prg rs232-user.prg
	@echo $^

rs232: rs232.lbl rs232-user.prg rs232-swift.prg
# assemble rs232.prg file (which embeds rs232-user.prg and rs232-swift.prg).
	$(WINE) $(CASM) $< -prg:$@ $(C64LISTFLAGS)
# import rs232.prg into ($DISKIMAGE) as "ml.rs232"
	$(WINE) $(C64LIST) $@.prg $(C64LISTFLAGS) -d64:$(DISKIMAGE)::$(C64_FILENAME)
# show contents
	$(C1541) $(DISKIMAGE) -dir
	
rs232-user: rs232-user.lbl
# assemble rs232-user.lbl into rs232-user.prg file
	$(WINE) $(CASM) $< -prg:$@ $(C64LISTFLAGS)
# dereference symlink (-L), get file size (%s), subtract load address (-2) of target ($@):
#	FILE_SIZE = $(eval $(shell $(stat -L -c %s $@))-2)
#	echo "$FILE_SIZE bytes."

rs232-swift: rs232-swift.lbl
# assemble rs232-swift.lbl into rs232-swift.prg file
	$(WINE) $(CASM) $< -prg:$@ $(C64LISTFLAGS)

clean:
	rm -f *.prg $(DISKIMAGE)
# format a fresh disk image
	$(C1541) -format $(DISKHEADER),$(DISKID) d64 $(DISKIMAGE)
