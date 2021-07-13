DISKIMAGE = test-disk.d64
DISKHEADER = "rs232 ml v1.2"
DISKID = rs


	# for formatting a new disk during "make clean" and
	# showing directory at the end of the "make" script:
C1541		= c1541

	# -ovr: overwrite existing file
	# -verbose: more output
	# when invoked, $(C64LISTFLAGS) comes last on command line
C64LISTFLAGS= -ovr -verbose

C64LIST		= $(WINE) c64list4_04.exe
	# c64list 4.02 now includes former casm.exe functionality


C64_FILENAME	= ML.RS232

# "make" placeholders:
# % is a wildcard
# $< is the first dependency
# $@ is the target
# $^ is all dependencies

all: $(DISKIMAGE)

rs232: rs232.asm rs232-user.prg rs232-swift.prg
	$(C64LIST) $< -prg:$@ $(C64LISTFLAGS)
# import rs232.prg into $(DISKIMAGE) as "ml.rs232"
	$(C64LIST) $@.prg $(C64LISTFLAGS) -d64:$(DISKIMAGE)::$(C64_FILENAME)

# rs232-swift.prg rs232-user.prg
# rs232.prg depends on rs232-{user,swift}.prg: -bin strips load address from .prg
#	$(C64LIST) $< -bin:$@ $(C64LISTFLAGS)
#	@echo $^

# I want ml.rs232 which includes ml.rs232-user and ml.rs232-swift
# 1) $(C64LIST) rs232-user.asm  -bin:ml.rs232-user.prg
# 2) $(C64LIST) rs232-swift.asm -bin:ml.rs232-swift.prg
# 3) $(C64LIST) rs232.asm -prg:ml.rs232 # this includes both ml.rs232-{user,swift}

rs232.prg: rs232.asm rs232-user.prg rs232-swift.prg

%.prg: %.asm
	$(C64LIST) $< -prg:$@ -bin:$@ $(C64LISTFLAGS)

%.bin: %.lbl
	$(C64LIST) $< -bin:$@ $(C64LISTFLAGS)

$(DISKIMAGE): rs232.prg
	# import rs232.prg into ($DISKIMAGE) as "ml.rs232"
	$(C64LIST) $< $(C64LISTFLAGS) -d64:$@::$(C64_FILENAME)
	# show contents
	$(C1541) $(DISKIMAGE) -dir

rs232-user: rs232-user.asm
# assemble rs232-user.asm into rs232-user.prg file
	$(C64LIST) $< -prg:$@ $(C64LISTFLAGS)

rs232-swift: rs232-swift.asm
# assemble rs232-swift.asm into rs232-swift.prg file
	$(C64LIST) $< -prg:$@ $(C64LISTFLAGS)
clean:

	rm -f *.prg *.sym $(DISKIMAGE)
	# format a fresh disk image
	$(C1541) -format $(DISKHEADER),$(DISKID) d64 $(DISKIMAGE)
