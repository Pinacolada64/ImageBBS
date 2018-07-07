DISKIMAGE = test-disk.d64
DISKNAME = ud-backport
DISKID = rs

WINE = wine
C64LIST = c64list3_05.exe
C64LISTFLAGS = -ovr -verbose
CASM = casm.exe
C1541 = c1541

SRCS =	plus_UD.lbl \
	plus_UD_edit.lbl \
	plus_MM_load.lbl \
	plus_MM_maint.lbl \
	plus_MM_subop.lbl \
	plus_MM_ud-sort.lbl

OBJS =	plus_UD.prg \
	plus_UD_edit.prg \
	plus_MM_load.prg \
	plus_MM_maint.prg \
	plus_MM_subop.prg \
	plus_MM_ud-sort.prg

C64_FILENAME =	+.UD \
		+.UD.edit \
		+.MM.load \
		+.MM.maint \
		+.MM.subop \
		+.MM.ud-sort

# $(basename names…)
# Extracts all but the suffix of each file name in names.

# input_file = $<
# c64_disk_filename = (`echo $input_file | sed s/.prg//`) # remove .prg file extension

# % is a wildcard
# $< is the first dependency
# $@ is the target
# $^ is all dependencies

%-casm.prg: %-casm.lbl # $(wildcard %-casm.lbl)
# assemble single *-casm.lbl file with casm.exe into *.prg file, import to .d64
	$(WINE) $(CASM) $< -prg:$@ $(C64LISTFLAGS) 
	$(C1541) $(DISKIMAGE) \
	-del $(C64_FILENAME) \
	-write $@ $(C64_FILENAME)

%.prg: %.lbl
# assemble single *.lbl file with c64list3_05.exe into *.prg file, import to .d64
	$(WINE) $(C64LIST) $< -prg:$@ $(C64LISTFLAGS)
	$(C1541) $(DISKIMAGE) \
	-del $(C64_FILENAME) \
	-write $@ $(C64_FILENAME)

all: $(SRCS)
# assemble all *.lbl files with c64list3.05, import *.prgs into .d64
# since c64list doesn't understand multiple input filenames on the command line,
# use a bash-style loop to feed it each filename in $(SRCS) one at a time, e.g.:
# for filename in 1.prg 2.prg 3.prg; do echo $filename; done
# 1.prg
# 2.prg
# 3.prg

# this, alas, does not work in the way I thought it would...
# want to output each element of $(SRCS) one at a time
# that semicolon at the end? very necessary...
#	$(foreach source_file, $(SRCS), echo $(source_file) ;)
	$(foreach source_file, $(SRCS), $(WINE) $(C64LIST) $(source_file) -prg:$(OBJS) $(C64LISTFLAGS))
#	$(C1541) $(DISKIMAGE) \
#	-del $(C64_FILENAME) \
#	-write $(source_file) $(C64_FILENAME);)

clean:
	rm -f $(OBJS) $(DISKIMAGE)
# format a fresh disk image
	$(C1541) -format $(DISKNAME),$(DISKID) d64 $(DISKIMAGE)
