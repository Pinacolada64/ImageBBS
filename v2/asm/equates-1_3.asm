	; Image BBS 1.3 equates
	;
	; Since there ARE some differences in variable definitions (make a list),
	; try assembling with "equ13" instead. Maybe that will build working "ml 2.0"

	var	= $0061	;
	chrget	= $73
	chrgot	= $79

;
; serial # stuff
;
	ridbe	= $029b
	ridbs	= $029c

	bsnpre	= $02fd	; 765 serial # prefix (a/b/g...)
	bsnval	= $02fe	; 766 serial # lo byte, 767=hi byte


	jmptbl	= $a000 ; table of IRQ routines

	linkprg	= $a533
	gone1	= $a7e7
	gone2	= $a7ea
	frmnum	= $ad8a
	eval1	= $ae8d
	parchk	= $aef1
	synerr	= $af08
	ptrget1	= $b0e7	; set up descriptor stored in ($45) [varname],
			; returns address in (varpnt)
	ilqerr	= $b248
	makerm1	= $b475
	getbytc	= $b79b
	getnum	= $b7eb
	retval	= $bc49
	getadr	= $b7f7
	retbyt	= $b3a2

	ten	= $dc08
	scs	= $dc09
	min	= $dc0a
	hrs	= $dc0b

;	carrier = $dd01

	syscll	= $e130
	comma	= $aefd
	getfile	= $e1d4 ; 57812 (print last filename in BASIC)

	colors	= $e8da	; flashing chat page colors

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

	outastrp= $cd00
	usetbl1	= $cd03
	swapper	= $cd06
	swapagn	= $cd09
	buffer	= $ce77
	buf2	= $ce27

	death	= $0800
	prgstart= $0801
	bmpstart= $1001
	mmpstart= $2001
	lmpstart= $3001
	prgend	= $4000
	imstart	= $4a01
	protostart= $c000
	protoend= $ca80

	mainline= 1000
	trapline= 2000
	imodline= 2300
	immdline= 3000
	immdsize= $a00

	light	= $04f0 ; lightbar screen RAM start

	fkeybuf	= 679 ; $20

	cassbuff= 828
	idlemax	= 830
	datebuf	= 831 ;11
	daytbl	= 842 ;24
	tzoneh	= 866
	tzonem	= 867
	uzoneh	= 868
	uzonem	= 869
	wrapbuf	= 870 ;80
	wrapflg	= 950
	modclmn	= 951
	ptrclmn	= 952
	wrapind	= 953
	wrapdmp	= 954
	ptrclm	= 955
	modclm	= 956
	sndtim1	= 957
	sndtim2	= 958
	sndwav1	= 959
	sndwav2	= 960
	sndwav3	= 961
	sndrept	= 962
	sndtim1a= 963
	sndtim2a= 964
	jiffy	= 965
	blnkflag= 966
	blnkcntr= 967
	ptrlin	= 968
	ptrlinm	= 969
	usrlin	= 970
	usrlinm	= 971
	fredmode= 972
	montbl	= 973 ; 36
	emptym1	= 1009 ;1
	timeset	= 1010
	flag1	= 1011
	case1	= 1012
	temp3	= 1015
	mline	= 1016
	comm	= 1017
	flags	= 1018
	cline	= 1019
	lines	= 1022
	modes	= 1023

	gc	= $c000
	gchide	= $e000
	gclen	= 4

	ecs	= $c000
	ecshide	= $e400
	ecslen	= 10
;
; screen parameters
;
	mreverse= 199
	crsrflg	= 204
	undchr	= 206
	crsrmode= 207
	curptr	= 209
	scnpos	= 211
	scnclm	= scnpos
	sline	= 214
	colptr	= 243
	mcolor	= 646
	undcol	= 647

	mjump	= $07e8
	mresult	= $07e9
	mspeed	= $07ea
	mprint	= $07eb
;	mcolor	= $07ec
;	mprtr	= $07ed
;	mreverse= $07ee
	mci	= $07ef
	mdigits	= $07f0
	carrst	= $07f1
	tsp1	= $07f2
	tsp2	= $07f3
	chks	= $07f4
	readmode= $07f6
	filenum	= $07f7
	tmp5	= $07f8
	abtchr	= $07f9
	clock	= $07fa
	filetyp	= $07fb
	tmp1	= $07fc
	tmp2	= $07fd
	tmp3	= $07fe
	tmp4	= $07ff

	local	= $d000
	case	= $d001
	editor	= $d002
;	tsr	= $d003
	llen	= $d004
	flag	= $d005
	chat	= $d006
	inchat	= $d007
	chatpage= $d008
	carrier	= $d009
	mxor	= $d00a
	mkolor	= $d00b
	mupcase	= $d00c
	irqcount= $d00d
	trans	= $d00e
	index	= $d00f

	tempbott= $4000
	tempbotc= $4050
	pmodetbl= $40a0 ; $50

	tempscn	= $4100 ; $f0
	tempcol	= $41f0 ; $f0

	idlejif	= $42e0
	idlesec	= $42e1
	idleten	= $42e2
	idlemin	= $42e3
	curdsp	= $42e4
	bar	= $42e5
	tsr2	= $42e6
	mright	= $42e7
	mleft	= $42e8
	cphase	= $42e9
	key	= $42ea
	shft	= $42eb
	ptrlnfd	= $42f0 ; 17136: printer linefeeds, 10	=yes, 0=no
	ha577	= $42f1
	mask	= $42f2 ; 17138: password mask character
	scnmode	= $42f3 ; 17139: screen mask: 0=on
	dflag	= $42f4
	dstat	= $42f5
	cytmp	= $42f6
	interm	= $42f7
	cxsav	= $42f8
	len1	= $42f9
	passmode= $42fa
	scnlock	= $42fb
	tmp6	= $42fc
	tmp7	= $42fd
	freq	= $42fe

	rs232	= $4300
	rsinabl	= rs232+ $03
	rsdisab	= rs232+ $06
	rsget	= rs232+ $09
	rsout	= rs232+ $0c
	rsbaud	= rs232+ $0f
	rschar	= rs232+ $12

	chktbl	= $4600 ;$10
	bartbl	= $4610 ;$c0
	arryptrs= $46d0 ;$10
	daysofm	= $46e0 ;$0c
	emptym2	= $46ec ;$04
	sndtbl	= $46f0 ;$60
	netalrm	= $4750 ;$30
	tblatc	= $4780 ;$80
	tblcta	= $4800 ;$100
	tblcta1	= $4900 ;$20
	tblcta2	= $4920 ;$20
	tblcta3	= $4940 ;$20
	alarmtb	= $4960 ;$80
	date1	= $49e0 ;$20

	ribuf	= $ca80 ; rs232 input buffer
	robuf	= $cac0	; rs232 output buffer
