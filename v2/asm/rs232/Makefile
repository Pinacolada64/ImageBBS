DISKIMAGE = test-disk.d64
DISKHEADER = swiftlink/t232
DISKID = rs

WINE = wine
C64LIST = $(WINE) c64list3_50.exe
C64LISTFLAGS = -ovr -verbose
CASM = $(WINE) casm.exe
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

all: $(DISKIMAGE)


# rs232-swift.prg rs232-user.prg
# rs232.prg depends on rs232-{user,swift}-no-load-address.prg
#	$(WINE) $(CASM) $< -bin:$@ $(C64LISTFLAGS)
#	@echo $^

# I want ml.rs232 which includes ml.rs232-user and ml.rs232-swift
# 1) casm.exe rs232-user.lbl -bin:ml.rs232-user
# 2) casm.exe rs232-swift.lbl -bin:ml.rs232-swift
# 3) casm.exe rs232.lbl -prg:ml.rs232 # this includes both ml.rs232-{user,swift}

rs232.prg: rs232.lbl rs232-user.bin rs232-swift.bin

%.prg:%.lbl
	$(CASM) $< -prg:$@ $(C64LISTFLAGS)

%.bin:%.lbl
	$(CASM) $< -bin:$@ $(C64LISTFLAGS)

$(DISKIMAGE): rs232.prg
	# import rs232.prg into ($DISKIMAGE) as "ml.rs232"
	$(C64LIST) $< $(C64LISTFLAGS) -d64:$@::$(C64_FILENAME)
	# show contents
	$(C1541) $(DISKIMAGE) -dir

clean:
	rm -f *.prg $(DISKIMAGE)
	# format a fresh disk image
	$(C1541) -format $(DISKHEADER),$(DISKID) d64 $(DISKIMAGE)
