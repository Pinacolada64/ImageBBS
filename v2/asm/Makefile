# % is a wildcard
# $< is the first dependency
# $@ is the target
# $^ is all dependencies

WINE = wine
C1541 = c1541
C64LIST4BETAA = $(WINE) c64list4_00-beta-a.exe # needed for .bin generation/inclusion
C64LIST4BETAC = $(WINE) c64list4_00-beta-c.exe # latest version
DISKIMAGE = test-ml20.d64
C64_FILENAME = "ml 2.0"
	# c64list: petscii translation results in "ml 2.0", but it can't output both .prg and to .d64 in a single command line
	# c1541: needs no translation

all: ml20.prg

# from 'make' documentation ('files' function):
# If the command required each argument to be on a separate line of the input
# file [which c64list does!], you might write your recipe like this:
# program: $(OBJECTS)
#	$(foreach O,$^,$(file >>$@.in,$O))
#	$(CMD) $(CMDFLAGS) @$@.in
#	@rm $@.in

#	(foreach variable,list,text)
#	$(foreach O,$(basename $(OBJECTS)),$(echo "wine $(C64LIST4BETAC) @$@.asm -prg" $O))
#	echo wine $(C64LIST4BETAC) @$@ -prg
#	@rm $@.in

# *.lbl files are being kept as BASIC programs.
# The "basic" build target builds "*.lbl" files into "*.prg" files,
# then puts them on (currently) "test.d81" disk image, with some
# filename transformation (see "build-plus_file.lbl" for examples)

# 1) prerequisites must be built before build.asm can embed the .bin files
PREREQS = wedge.bin editor.bin garbage-collect.bin ecs.bin struct.bin \
	swap1.bin swap2.bin swap3.bin

%.bin: %.asm
	# this must stay beta a for now; this version outputs and includes .bin files
	$(C64LIST4BETAA) $< -bin:$@

# 2) call build.asm, include *.asm files not listed in $(PREREQS)
ml20.prg: $(PREREQS) build.asm
	# need beta a since it embeds .bin files
	$(C64LIST4BETAA) build.asm -verbose -prg:ml20.prg # -d64:$(DISKIMAGE)::$(C64_FILENAME) [can't output two targets?]
	$(C1541) $(DISKIMAGE) -write $@ $(C64_FILENAME) -dir

# $(DISKIMAGE): ml20.prg
# 	$(C1541) -format "test,rs" d64 $(DISKIMAGE)
# 	# import ml20.prg into $(DISKIMAGE) as "ml 2.0"
# 	$(C64LIST4BETAC) $< -d64:$@::$(C64_FILENAME)
# 	# show contents
# 	$(C1541) $(DISKIMAGE) -dir

### historical dependencies:

# jump-table.asm: build.sym modem.sym

# string-io.asm: character-io.sym

# mci-commands.asm: character-io.sym

# character-io.asm: string-io.sym

# disk-io.asm: build.sym varbl.sym screen-handler.sym

# irqhn.asm: build.sym irqhn.sym

# intro.asm: irqhn.sym varbl.sym

# miscl.asm: equates-2_0.sym irqhn.sym

# modem.asm: screen-handler.sym

# screen-handler.asm: irqhn.sym wedge.sym equates-2_0.sym

# varbl.asm: equates-2_0.sym build.sym string-io.sym

# wedge.asm: equates-2_0.sym

# ...should resolve to:
# ($OUTPUT_PATH) is just the current directory
#	$(shell echo "# wine casm.exe $(OUTPUT_PATH)/$(basename $@).asm -prg:$(OUTPUT_PATH)/$(basename $@).prg -ovr -verbose")
#	                wine casm.exe $(OUTPUT_PATH)/$(basename $@).asm -prg:$(OUTPUT_PATH)/$(basename $@).prg -ovr -verbose
# and
#	           c1541 test.d81 -del "boot" -write "boot.prg" "boot"

# TODO: filename transformations: _ to . ("ml_rs232.prg" -> "ml.rs232", mainly)
#	$(shell echo "# $(C1541) $(OUTPUT_PATH)/$(OUTPUT_DISK) -del ml.$(basename $@) -write $(OUTPUT_PATH)/$(basename $@).prg ml.$(basename $@)")
#	                $(C1541) $(OUTPUT_PATH)/$(OUTPUT_DISK) -del ml.$(basename $@) -write $(OUTPUT_PATH)/$(basename $@).prg ml.$(basename $@)

# Include build date of module
# C64LIST4BETAC does this with build revision tracking
# Example usage: bd$={usedef:__BuildDate}:bt$={usedef:__BuildTime}

# The "make disk" target will add all the *.prg files to a .d81 at once
# TODO: update disk directory timestamp, maybe with
# "cc1541 -f `date <format_code>` (output: "wed jun 27, 2018")?
# -- con: won't work with 1581
# https://bitbucket.org/PTV_Claus/cc1541/src

# disk: $(OBJECTS)
#	$(C1541) $(OUTPUT_DISK) \
#	-write "source.prg"		"c64 filename"
#	-write "boot 2_0.prg"		"boot 2.0" \
#	-write "ml\ 2_0.prg"		"ml 2.0" \
#	-write "im.prg"			"im" \
#	-write "plus_new.prg"		"+.new")
#	$@

clean:
	# "-" prefix allows 'clean' to continue despite possible missing files
	-rm *.bin *.prg $(DISKIMAGE)
	$(C1541) -format "test,rs" d64 $(DISKIMAGE)

# FIXME: not sure this really works
#	$(C1541) -format $(DISKNAME),$(ID) d64 $(DISKFILENAME)
# swap _ for . (/g = global, don't stop on 1st replacement), remove .prg extension:
#	for inputfile in $(EXASWMDIR)/*.swm.prg ; do outputfile=`echo $inputfile | sed "s/_/./g" | sed "s/.prg//"` ; \
#	$(CBMDISK) -attach $@ -write $$inputfile $${outputfile%.*} ; done;

# The "test" target just creates a few files for "make clean" to clean up
test:
	touch bla.prg bla.bin $(OUTPUT_DISK)
# list files in directories $(dirs) to $(files):
# https://www.gnu.org/software/make/manual/make.html#Foreach-Function

# From KDE documentation:
# This simple example sets the variable 'files' to the list of all files in the
# directories in the list 'dirs':
#      dirs := a b c d
#		  foreach <var>,<list>,<text>
#      files := $(foreach dir,$(dirs),$(wildcard $(dir)/*))

# Here TEXT is '$(wildcard $(dir)/*)'. The first repetition finds the value 'a'
# for 'dir', so it produces the same result as '$(wildcard a/*)'; the second
# repetition produces the result of '$(wildcard b/*)'; and the third, that of '$
# (wildcard c/*)'.

	dirs=$(OUTPUT_PATH)
# desired output:
# build.asm calls.asm character-io.asm ecs.asm [...]
	files=$(foreach dir,$(OBJECTS),$(wildcard $(dir)/*.asm))

	VAR="bla bla bla"

	echo I am writing to ${OUTPUT_PATH}!
	$(info [Info]: VAR is [$(VAR)])

	echo Files ending in *.asm:
	echo $(files)

transform: %.asm %.prg
# desired command line (this does work!):
# c1541 test.d81 -write boot.prg boot -write bla.prg bla -dir

# c64 filename: _ -> ., .prg extension removed:
	C64_FILENAME="$(subst _,.,$(patsubst %.asm,%,$^)"

# filesystem filename:
	FS_FILENAME=$@
# attach target disk image:
	echo $(C1541) $(OUTPUT_DISK) \
# delete already existing filename:
	-del "$(C64_FILENAME)" \
# write file from filesystem into disk image with c64 filename transformation:
	-write "$(FS_FILENAME)" "$(C64_FILENAME)")
