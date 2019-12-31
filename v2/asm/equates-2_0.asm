;
; Image BBS v2.0 equates
;

; [1.2]: labels/memory address is the same as 1.2
; [?]  : not certain of purpose of routine
; ($xx): Indirect addressing: $xx *256+ ($xx+1)

	var	= $0061	; $61-$66: FAC1, Floating Point Accumulator #1
	chrget	= $0073	; two bytes for zero-page JSR
	chrgot	= $0079 ; same
	vartab	= $2d	; start of BASIC variables
	status	= $90	; Kernal I/O Status Word
	xsav	= $97	; Temporary .X Register Save Area
;
; rs232
;
	dfltn	= $99	; Default Input Device (Set to 0 for Keyboard)
	dflto	= $9a	; default output device
	ptr1	= $9e	; temp storage

;
; screen parameters
;
	rvs	= 199	; $c7 Flag: Print Reverse Characters? 0=No
	crsrflg	= 204	; $cc
	undchr	= 206	; $ce
	crsrmode= 207	; $cf Flag: Was Last Cursor Blink on or off?
	curptr	= 209	; $d1
	scnpos	= 211	; $d3, current screen column (0-39)
	scnclm	= scnpos; screen column
	sline	= 214	; $d6, current screen row (0-24)
	colptr	= 243	; $f3

; original docs had this labeled "mcolor," same as $07ec (MCI color).
; I'm favoring "color," "Mapping the C64"'s label:
	color	= 646	; $0286: Current Foreground Color for Text
	undcol	= 647	; $0287

; Location Range: 667-670 ($29B-$29E)
; Byte Indices to the Beginning and End of Receive and Transmit Buffers

	ridbe	= $029b ; 667, RS-232: Index to End of Receive Buffer
	ridbs	= $029c ; 668, RS-232: Index to Start of Receive Buffer
	rodbs	= $029d ; 669, RS-232: Index to Start of Transmit Buffer
	rodbe	= $029e ; 670, RS-232: Index to End of Transmit Buffer

; $02a7-$02ff ($58 bytes) (679-767, 88 bytes): unused by OS

	fkeybuf	= 679 ; $02a7-$02c6 (679-710), $1f (31) bytes
	emptym0	= 711 ; $02c7-$02ff (711-767), $39 (57) bytes
;
; serial # stuff
;
	bsnpre	= $02fd	; 765 BBS serial # prefix (a/b/g...)
	bsnval	= $02fe	; 766 BBS serial # lo byte, 767=hi byte

	cassbuff= 828
	idlemax	= 830 ; maximum idle time allowed
	datebuf	= 831 ; 11 bytes
	daytbl	= 842 ; 24 bytes (8*3)
	tzoneh	= 866 ; bbs  time zone hour
	tzonem	= 867 ; bbs  time zone minute
	uzoneh	= 868 ; user time zone hour
	uzonem	= 869 ; user time zone minute
	wrapbuf	= 870 ; 80 bytes
	wrapflg	= 950
	modclmn	= 951 ; user's screen width
	ptrclmn	= 952 ; printer column [?]
	wrapind	= 953
	wrapdmp	= 954
	ptrclm	= 955
	modclm	= 956
	sndtim1	= 957
	sndtim2	= 958
	sndwav1	= 959
	sndwav2	= 960
	sndwav3	= 961
	sndrept = 962
	sndtim1a= 963
	sndtim2a= 964
	jiffy	= 965
	blnkflag= 966	; screen blank flag
	blnkcntr= 967	; screen blank counter
	ptrlin	= 968
	ptrlinm	= 969
	usrlin	= 970   ; mp%: user's screen height [?]
	usrlinm	= 971	; how many lines output to modem [?]
	fredmode= 972
	montbl	= 973	; month names, 36 bytes (12*3)
	emptym1	= 1009	; 1 byte
	timeset	= 1010	; "time has been set" flag: 0=no, flash bottom screen line
	flag1	= 1011
	case1	= 1012
	temp3	= 1015
	mline	= 1016
	comm	= 1017
	flags	= 1018
	cline	= 1019
	lines	= 1022 ; $03f8: kk, # of lines in text editor buffer
	modes	= 1023

;
; screen display stuff:
; screen RAM is  1024-2023  ($0400-$07e7)
;  color RAM is 55296-56296 ($d800-$dbe7)
;
	ldisp	= $0400+640
	lcolr	= $d800+640
	adisp	= $0400+880
	acolr	= $d800+880
	sdisp	= $0400+920
	scolr	= $d800+920
	tdisp	= $0400+960
	tcolr	= $d800+960

;
; Message Command Interpreter variables:
;
	mjump	= $07e8	; 2024: # of lines to skip for £J, £E, £D
	mresult	= $07e9	; 2025: Result of £A, £T
	mspeed	= $07ea	; 2026: Print speed for £S
	mprint	= $07eb	; 2027: Print mode for £P
	mcolor	= $07ec	; 2028: Current color for £C
	mprtr	= $07ed	; 2029: Printer flag for £L
	mreverse= $07ee	; 2030: Reverse mode flag for £R
	mci	= $07ef	; 2031: 0=don't interpret MCI
	mdigits	= $07f0	; 2032: Number of digits for £#

	carrst	= $07f1	; 2033: modem carrier status (check mark/no check mark, displayed on screen)
	tsp1	= $07f2	; 2034: transmit speed lo-byte
	tsp2	= $07f3	; 2035: transmit speed hi-byte
	chks	= $07f4	; 2036: Checkmark flag for Lightbar (left side)
; unofficially added by Pinacolada:
	chk_rt	= $07f5 ; 2037: Checkmark flag for Lightbar (right side)
	readmode= $07f6	; 2038: [1.2] Unabortable file read flag
	filenum	= $07f7	; 2039: [1.2] [Logical] file number for read0/dskin
	tmp5	= $07f8	; 2040
	abtchr	= $07f9	; 2041: [1.2] Alternate abort character (works like <space>)
	clock	= $07fa ; 2042: [1.2] 1=Turns on idle screen clock
	filetyp	= $07fb	; 2043: [1.2] Filetype for Punter transfer protocol (1=PRG, 2=SEQ)
	tmp1	= $07fc	; 2044
	tmp2	= $07fd	; 2045
	tmp3	= $07fe	; 2046
	tmp4	= $07ff	; 2047

;
; rs232 jump table
;
	rs232	= $0800
	rsinabl = rs232 + $03
	rsdisab = rs232 + $06
	rsget	= rs232 + $09
	rsout	= rs232 + $0c
	rsbaud	= rs232 + $0f
	rschar	= rs232 + $12

	ribuf	= $0b00	; rs232 input buffer
	robuf	= $0b80	; rs232 output buffer

	wedgemem= $0c00
	trapoff	= wedgemem+0
	trapon	= wedgemem+3
	loadprg	= wedgemem+6
	arraysav= wedgemem+9
	arrayres= wedgemem+12
	forcegc	= wedgemem+15

;
; temporary storage for screen mask?
;
	tempscn = $1000 ; 4096, $140 (320) bytes
	tempscn0= tempscn+000
	tempscn1= tempscn+040
	tempscn2= tempscn+080
	tempscn3= tempscn+120
	tempscn4= tempscn+160
	tempscn5= tempscn+200
	tempscn6= tempscn+240
	tempscn7= tempscn+280
	tempcol	= $1140	; 4416, $140 bytes
	tempcol0= tempcol+000
	tempcol1= tempcol+040
	tempcol2= tempcol+080
	tempcol3= tempcol+120
	tempcol4= tempcol+160
	tempcol5= tempcol+200
	tempcol6= tempcol+240
	tempcol7= tempcol+280
	emptym3	= $1280 ; 4736, 96 bytes

	idlejif	= $12e0	; 4832
	idlesec	= $12e1	; 4833
	idleten	= $12e2	; 4834
	idlemin	= $12e3	; 4835
	curdsp	= $12e4	; 4836
	bar	= $12e5	; 4837
	tsr2	= $12e6	; 4838
	mright	= $12e7	; 4839: £m> right margin
	mleft	= $12e8	; 4840: £m< left margin
	cphase	= $12e9	; 4841
	key	= $12ea	; 4842
	shft	= $12eb	; 4843

	ptrlnfd	= $12f0	; 4848: printer linefeed. 1.3's +/IM.misc is $42f0 (17136)
	ha577	= $12f1	; 4849
	mask	= $12f2	; 4850: password mask character (1.3 is 17138)
	scnmode	= $12f3	; 4851
	dflag	= $12f4	; 4852
	dstat	= $12f5	; 4853
	cytmp 	= $12f6	; 4854
	interm	= $12f7	; 4855
	cxsav	= $12f8	; 4856
	len1	= $12f9	; 4857
	passmode= $12fa	; 4858
	scnlock	= $12fb	; 4859
	tmp6	= $12fc	; 4860
	tmp7	= $12fd	; 4861
	freq	= $12fe	; 4862

;
; tables
;
	chktbl	= $1300 ;$10 bytes (8 lightbar positions*2 checks per page, 8 pages=128 bits)
	bartbl	= $1310 ;$c0 bytes
	arryptrs= $13d0 ;$10 bytes
	daysofm	= $13e0 ;$0c bytes: Days of months
	emptym2	= $13ec ;$04 bytes
	sndtbl	= $13f0 ;$60 bytes
	netalrm	= $1450 ;$30 bytes: Net Alarm table
	tblatc	= $1480 ;$80 bytes: ASCII -> C= translation [?]
	tblcta	= $1500 ;$100 bytes: C= -> ASCII translation [?]
	tblcta1	= $1600 ;$20 bytes
	tblcta2	= $1620 ;$20 bytes
	tblcta3	= $1640 ;$20 bytes
	alarmtb	= $1660 ;$80 bytes: Alarm table [?]
	date1	= $16e0 ;$20 bytes "Thu Sep 13, 2018 02:17 PM PSTxxx"
	lobytes	= $1700 ;25 bytes
	hibytes	= $1719 ;25 bytes
	lobytec	= $1732 ;25 bytes
	hibytec	= $174b ;25 bytes
	emptym4	= $1764 ;28 bytes
	pmodetbl= $1780 ;$80 bytes: MCI print mode table

; Image IRQ jump table (under ROM):
	jmptbl	= $a000

; BASIC routines:
	error	= $a437
	linkprg	= $a533
	gone1	= $a7e7
	gone2	= $a7ea
	linget	= $a96b
	frmnum	= $ad8a
	frmevl	= $ad9e ; evaluate string/math expressions
	eval1	= $ae8d
	parchk	= $aef1 ; parentheses check: '('
	comma	= $aefd ; check next character is comma, ...
	chkcom	= $aefd ; ...return "?syntax  error" if not
	synerr	= $af08 ; emit "?syntax  error"

	ptrget1	= $b0e7	; set up descriptor stored in ($45) [varname],
		; returns address in (varpnt)
	ilqerr	= $b248
	retbyt	= $b3a2
	makerm1	= $b475
	getbytc	= $b79b
	getnum	= $b7eb
	getadr	= $b7f7
	retval	= $bc49

; transfer protocol area

	protosta	= $c000
	protoend	= $ca80	; 2680 bytes

;
; garbage collection stuff
;
	gc	= $c000	; module load addr
	gchide	= $e000	; swaps to
	gclen	= 4	; # pages
;
; extended command set stuff:
;
	ecs	= $c000	; module load addr
	ecshide	= $e400	; swaps to
	ecslen	= 10	; # pages (seems like a lot)

; Image routines:

	outastrp= $cd00	; output a$ [?]
	usetbl1	= $cd03	; irq addresses table at $a000
	swapper	= $cd06	; swap pages of memory
	swapagn	= $cd09	; re-swap same pages set up by 'swapper'
	trace	= $cd0c	; BASIC line number trace
	chkspcl	= $cd0f	; check for special chars in a$ [?]
	convchr	= $cd12	; convert special characters in a$ [?]

; buffers:

	buf2	= $ce27	; 80 bytes
	buffer	= $ce77	; 80 bytes
;	longdate= $ceca ; ""

; BBS flags (really, unused VIC-II registers)

	local	= $d000 ; 53248: 1=no modem output with &
	case	= $d001 ; 53249: &,1 or £Ix: can POKE this or set pl=1: UPPERCASE, pl=0: Mixed Case
	editor	= $d002 ; 53250: flags for &,1 routine
	tsr	= $d003 ; 53251: time remaining on call - needed by inline.s [?]
	llen	= $d004 ; 53252: max input line length for &,1 or £Ix
	flag	= $d005 ; 53253
	chat	= $d006 ; 53254: [1.2] Flag for returning from & for an abort
	inchat	= $d007 ; 53255
	chatpage= $d008 ; 53256: [1.2] 1=flashing chat page on
	carrier	= $d009 ; 53257: *** modem carrier status [?] ***
	mxor	= $d00a ; 53258: [1.2] carrier XOR value
	mkolor	= $d00b ; 53259: [1.2] MCI Kolorific mode flag
	mupcase	= $d00c ; 53260: [1.2] Uppercase mode flag
	irqcount= $d00d ; 53261: [1.2] IRQ slowdown flag
	trans	= $d00e ; 53262: [1.2] ASCII translation flag
	index	= $d00f ; 53263: [1.2] length of string returned by &,1 or £Ix

; CIA #2 Time-of-Day clock stuff
	ten	= $dc08	; tenths of second
	scs	= $dc09 ; seconds
	min	= $dc0a ; minutes
	hrs	= $dc0b ; hours

;	carrier = $dd01 ; This definition conflicts with $d009;
			; "carrier" is referenced by irqhn.s
			; 56577: CIA #2 Data Port B
			; Bit 4: RS-232 carrier detect (DCD)/ Pin H of User Port

	colors	= $e8da	; flashing chat page color table

; Kernal routines:

	syscll	= $e130
	getfile	= $e1d4 ; 57812 (print last filename in BASIC)

	setmsg	= $ff90
	readst	= $ffb7
	setlfs	= $ffba
	setnam	= $ffbd
	openf	= $ffc0
	closef	= $ffc3
	chkin	= $ffc6
	chkout	= $ffc9
	clrchn	= $ffcc
	chrin	= $ffcf
	chrout	= $ffd2
	loadf	= $ffd5
	savef	= $ffd8
	getin	= $ffe4

;
; Extended BASIC tokens:
;

	poketok	= 151	; poke $addr,$val
	peektok	= 194	; peek($addr)
	systok	= 158	; sys $addr
	loadtok	= 147	; load"filename",<device>,<segment>
	newtok	= 162	; "new <line_num>" erases <line_num>-

;
; module addresses:
;
	death	= $1800 ; 1.3 is $0800
	prgstart= $1801	; im
	bmpstart= $2001
	mmpstart= $3001
	lmpstart= $4001
	prgend	= $5000
	imstart	= $5001
;
; module line #s/sizes:
;
	mainline= 1000
	trapline= 2000
	imodline= 2300
	immdline= 3000
	immdsize= $a00
