DISKIMAGE = test-disk.d64
DISKHEADER = swiftlink/t232
DISKID = rs

WINE = wine
C64LIST = $(WINE) c64list4_00.exe
C64LISTFLAGS = -ovr -verbose
CASM = $(C64LIST) # c64list 4.0 now includes former casm functionality
C1541 = c1541

# must be in reverse case to import as "ml.rs232"
C64_FILENAME =	ML.RS232

# $(basename names...)
# Extracts all but the suffix of each file name in names.

# input_file = $<
# c64_disk_filename = (`echo $input_file | sed s/.prg//`) # remove .prg file extension

# % is a wildcard
# $< is the first dependency
# $@ is the target
# $^ is all dependencies

all: $(DISKIMAGE)

# I want to generate "ml.rs232" on disk which includes ml.rs232-user and ml.rs232-swift
# 1) wine c64list4_00.exe rs232-user.asm -bin
# 2) wine c64list4_00.exe rs232-swift.asm -bin
# 3) wine c64list4_00.exe rs232.asm -prg # this includes both rs232-{user,swift}.bin

rs232.prg: rs232.asm rs232-user.bin rs232-swift.bin

%.prg:%.asm
	$(CASM) $< -prg:$@ $(C64LISTFLAGS)

%.bin:%.asm
	$(CASM) $< -bin:$@ $(C64LISTFLAGS)

$(DISKIMAGE): rs232.prg
	# import rs232.prg into $(DISKIMAGE) as "ml.rs232"
	$(C64LIST) $< $(C64LISTFLAGS) -d64:$@::$(C64_FILENAME)
	# show contents
	$(C1541) $(DISKIMAGE) -dir

clean:
	rm -f *.bin *.prg $(DISKIMAGE)
	# format a fresh disk image
	$(C1541) -format $(DISKHEADER),$(DISKID) d64 $(DISKIMAGE)
