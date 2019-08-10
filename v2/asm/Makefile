# % is a wildcard
# $< is the first dependency
# $@ is the target
# $^ is all dependencies

C1541 = c1541
OUTPUT_DISK = test.d81
OUTPUT_PATH = .

OBJECTS	= $(OUTPUT_PATH)/wedge.prg \
editor.prg \
garbage-collect.prg \
ecs.prg \
struct.prg \
swap1.prg \
swap2.prg \
swap3.prg

# "build.lbl" needs $OBJECTS assembled first
prereqs: $(OUTPUT_PATH)/$(OBJECTS)
#	wine casm.exe $(OBJECTS) -prg:$@ -ovr -verbose
#	$(C1541) $(OUTPUT_DISK) -del $@ -write $@

# from 'make' documentation ('files' function):
# If the command required each argument to be on a separate line of the input
# file [which c64list does!], you might write your recipe like this:
# program: $(OBJECTS)
#	$(foreach O,$^,$(file >>$@.in,$O))
#	$(CMD) $(CMDFLAGS) @$@.in
#	@rm $@.in

#	(foreach variable,list,text)
	$(foreach O,$(basename $(OBJECTS)),$(echo "wine casm.exe @$@.lbl -prg" $O))
#	echo wine casm.exe @$@ -prg
#	@rm $@.in

# The "basic" build target builds "*.lbl" files into "*.prg" files,
# then puts them on (currently) "test.d81" disk image, with some
# filename transformation (see "build-plus_file.lbl" for examples)

# So giving "make wedge.prg"...
%.prg:
# ...should resolve to:
# ($OUTPUT_PATH) is just the current directory
#	$(shell echo "# wine casm.exe $(OUTPUT_PATH)/$(basename $@).lbl -prg:$(OUTPUT_PATH)/$(basename $@).prg -ovr -verbose")
	                wine casm.exe $(OUTPUT_PATH)/$(basename $@).lbl -prg:$(OUTPUT_PATH)/$(basename $@).prg -ovr -verbose
# and
#	           c1541 test.d81 -del "boot" -write "boot.prg" "boot"

# continue build script:
	wine casm.exe build.lbl -prg:"ml\ 2_0" -ovr -verbose


# TODO: filename transformations: _ to . (ml_rs232.prg -> ml.rs232, mainly)
#	$(shell echo "# $(C1541) $(OUTPUT_PATH)/$(OUTPUT_DISK) -del ml.$(basename $@) -write $(OUTPUT_PATH)/$(basename $@).prg ml.$(basename $@)")
	                $(C1541) $(OUTPUT_PATH)/$(OUTPUT_DISK) -del ml.$(basename $@) -write $(OUTPUT_PATH)/$(basename $@).prg ml.$(basename $@)

ml\ 2_0.prg: $(OBJECTS) 
# 'casm' targets are *.lbl files, but only for assembly language
# (c64list3_05.exe has an assembler built in, but it's slightly buggy)
# a convention is that the filename end in "-casm.lbl"
casm: %-casm.lbl
# TODO: establish build rules (mostly the same as "module" target)

# Include build date of module
# Example output: "Fri Jun 29 10:36:18 PDT 2018"
# FIXME: Do this with every module build, make a function of this?
# FIXME: Might not need "PDT" displayed
# Must end in CR/LF to keep DOS/wine happy
build-date:
	$(shell echo "print \"`date`\"\r\n" > build-date_basic.lbl)

# The "make disk" target will add all the *.prg files to a .d81 at once
# TODO: update disk directory timestamp, maybe with
# "cc1541 -f `date <format_code>` (output: "wed jun 27, 2018")?
# -- con: won't work with 1581
# https://bitbucket.org/PTV_Claus/cc1541/src

disk: test.d81

disk: $(OBJECTS)
	$(C1541) $(OUTPUT_DISK) \
#	-write "source.prg"		"c64 filename"
	-write "boot 2_0.prg"		"boot 2.0" \
	-write "ml\ 2_0.prg"		"ml 2.0" \
	-write "im.prg"			"im" \
	-write "plus_new.prg"		"+.new")
	$@

clean:
# "-" prefix allows 'clean' to continue despite possible missing files
	-rm $(OUTPUT_PATH)/*.prg $(OUTPUT_DISK)
	$(C1541) -format "test,rs" d81 $(OUTPUT_PATH)/$(OUTPUT_DISK)

# FIXME: not sure this really works
#	$(C1541) -format $(DISKNAME),$(ID) d64 $(DISKFILENAME)
# swap _ for . (/g = global, don't stop on 1st replacement), remove .prg extension:
#	for inputfile in $(EXASWMDIR)/*.swm.prg ; do outputfile=`echo $inputfile | sed "s/_/./g" | sed "s/.prg//"` ; \
#	$(CBMDISK) -attach $@ -write $$inputfile $${outputfile%.*} ; done;

# The "test" target just creates a few files for "make clean" to clean up
test:
	touch $(OUTPUT_PATH)/bla.prg test.d81
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
# build.lbl calls.lbl character-io.lbl ecs.lbl [...]
	files=$(foreach dir,$(OBJECTS),$(wildcard $(dir)/*.lbl))

	VAR="bla bla bla"

	echo I am writing to ${OUTPUT_PATH}!
	$(info [Info]: VAR is [$(VAR)])

	echo Files ending in *.lbl:
	echo $(files)

transform: $(OUTPUT_PATH)/*.lbl
# desired command line (this does work!):
# c1541 test.d81 -write boot.prg boot -write bla.prg bla -dir

# c64 filename: _ -> ., .prg extension removed:
	C64_FILENAME="$(subst _,.,$(patsubst %.lbl,%,$^)"
# filesystem filename:
	FS_FILENAME=$@
# attach target disk image:
	echo $(C1541) $(OUTPUT_PATH)/$(OUTPUT_DISK) \
# delete already existing filename:
	-del "$(C64_FILENAME)" \
# write file from filesystem into disk image with c64 filename transformation:
	-write "$(FS_FILENAME)" "$(C64_FILENAME)")
