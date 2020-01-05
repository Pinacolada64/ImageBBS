		* = $a000 ;  C64 , SPLIT

; 27/Jul/2016 135 labels starting with "mod_" are modified by other code - rns

d6510	 = $00
r6510	 = $01
zp_02	 = $02
adray1	 = $03
adray2	 = $05
charac	 = $07
endchr	 = $08
dimflg	 = $0c
valtyp	 = $0d
intflg	 = $0e
tansgn	 = $12
linnum	 = $14
temppt	 = $16
lastpnt	 = $17
tempst	 = $19
z_index	 = $22 ; $22-$25: Miscellaneous Temporary Pointers and Save Area
resho	 = $26
txttab	 = $2b
vartab	 = $2d
arytab	 = $2f
strend	 = $31
fretop	 = $33
frespc	 = $35
memsiz	 = $37
curlin	 = $39
oldlin	 = $3b
oldtxt	 = $3d
datlin	 = $3f
datptr	 = $41
inpptr	 = $43 ; pointer to source of data (read, input, get)
varnam	 = $45
varpnt	 = $47
forpnt	 = $49
opptr	 = $4b
opmask	 = $4d
defpnt	 = $4e
dscpnt	 = $50
four6	 = $53
jmper	 = $54
numwork	 = $57
fac1	 = $0061
fac2	 = $69
arisgn	 = $6f	; arithmetic sign
fbufpt	 = $71
chrget	 = $0073
chrinc	 = $76
chrgot	 = $0079
txtptr	 = $7a
cmpspace = $80
rndx	 = $8b
status	 = $90
svxt	 = $92
verck	 = $93
syno	 = $96
xsav	 = $97
dfltn	 = $99
dfltno	 = $9a
dpsw	 = $9c
ptr1	 = $9e
jiffy	 = $a2
sal	 = $ac
eal	 = $ae
nxtbit	 = $b5
rodata	 = $b6 ; RS-232 Output Byte Buffer
fnlen	 = $b7 ; filename length
la	 = $b8
sa	 = $b9
fa	 = $ba ; current output device
fnadr	 = $bb
fsblk	 = $be
mych	 = $bf
stal	 = $c1
zp_c4	 = $c4
lstx	 = $c5	; Matrix Coordinate of Last Key Pressed, 64=None Pressed
		; saved in var_42ed
ndx	 = $c6
rvs	 = $c7
sfdx	 = $cb
blnsw	 = $cc
blnct	 = $cd
gdbln	 = $ce
blnon	 = $cf
crsw	 = $d0
pnt	 = $d1
pntr	 = $d3
qtsw	 = $d4
lnmx	 = $d5
tblx	 = $d6
zp_d7	 = $d7 ; temp storage for ASCII value of last char printed
insrt	 = $d8
ldtb1	 = $d9
user	 = $f3
ribuf	 = $f7
robuf	 = $f9
z_fb	 = $fb
z_fc	 = $fc
z_fd	 = $fd
z_fe	 = $fe

buf	 = $0200
sat	 = $026d ; secondary address table
keyd	 = $0277 ; keyboard buffer
color	 = $0286 ; Current Foreground Color for Text
gdcol	 = $0287
shflag	 = $028d
ridbe	 = $029b
ridbs	 = $029c
var_02f0 = $02f0
var_02fc = $02fc
bsnpre	 = $02fd ; bbs serial # prefix
bsnvallo = $02fe ; bbs serial # value, lo byte
bsnvalhi = $02ff ; bbs serial # value, hi byte
ierror	 = $0300
imain	 = $0302
igone	 = $0308
sareg	 = $030c
sxreg	 = $030d
syreg	 = $030e
cinv	 = $0314 ; IRQ vector
ibsout	 = $0326 ; CHROUT vector
iload	 = $0330
tbuffer	 = $033c ; tape buffer
idlemax	 = $033e
var_03fe = $03fe
var_03ff = $03ff
videoram = $0400 ; start of sysop status line
light	 = $04f0 ; start of lightbar
var_0518 = $0518 ; 1st line of sysop screen if mask on
var_0519 = $0519
var_051a = $051a
var_051b = $051b
var_051c = $051c
var_051d = $051d
var_051e = $051e
var_072e = $072e
var_0748 = $0748
var_0770 = $0770
mask_bot = $0798 ; start of bottom screen mask - (scn.t3)

; mci flags:
mjump	 = $07e8
mresult	 = $07e9
mspeed	 = $07ea
mprint	 = $07eb
mcolor	 = $07ec
mprtr	 = $07ed
mreverse = $07ee
mci	 = $07ef
mdigits	 = $07f0

carrst	 = $07f1 ; 2033
tsp1	 = $07f2
tsp2	 = $07f3
chk_left = $07f4 ; official label is "chks"
chk_right= $07f5
readmode = $07f6 ; unabortable file read flag
filenum	 = $07f7
tmp5	 = $07f8
abtchar	 = $07f9
clock	 = $07fa
filetyp	 = $07fb
tmp1	 = $07fc
tmp2	 = $07fd
tmp3	 = $07fe
tmp4	 = $07ff
var_0919 = $0919
var_0a90 = $0a90
var_0b14 = $0b14
var_0b15 = $0b15
var_0b45 = $0b45
var_0ba2 = $0ba2
var_0d29 = $0d29
var_0f00 = $0f00
var_0f0e = $0f0e
var_0f4c = $0f4c
var_0f4d = $0f4d
var_119d = $119d
var_119e = $119e
var_120a = $120a
var_128e = $128e
var_1681 = $1681
var_1688 = $1688
tbl_1758 = $1758
var_1b00 = $1b00
var_1b01 = $1b01
var_1b1a = $1b1a
var_1b1b = $1b1b
var_1c4c = $1c4c
var_1d01 = $1d01
var_1f1e = $1f1e
var_1f1f = $1f1f
var_2000 = $2000
var_2020 = $2020
var_2030 = $2030
var_2031 = $2031
var_2033 = $2033
var_2053 = $2053
var_212d = $212d
var_2221 = $2221
var_223a = $223a
var_23ba = $23ba
var_2820 = $2820
var_2a21 = $2a21
var_2a2a = $2a2a
var_2a2d = $2a2d
var_2a5a = $2a5a
var_2ac4 = $2ac4
var_2b41 = $2b41
var_2cc5 = $2cc5
var_2cd2 = $2cd2
var_2d21 = $2d21
var_2e2d = $2e2d
var_2e31 = $2e31
var_2e45 = $2e45
var_2e4c = $2e4c
var_2fb5 = $2fb5
var_3030 = $3030
var_3032 = $3032
var_3120 = $3120
var_31ba = $31ba
var_3931 = $3931
var_3aa9 = $3aa9
var_3b3a = $3b3a
var_3b3b = $3b3b
var_3df5 = $3df5
var_3eb8 = $3eb8
var_3f3e = $3f3e
tempbott = $4000 ; temp text storage under bottom screen mask
tempbotc = $4050 ; temp color storage
var_4051 = $4051
var_4078 = $4078
var_4079 = $4079
pmodetbl = $40a0 ; print mode definition table
tempscn	 = $4100 ; temp storage: text under top screen mask
var_4101 = $4101
var_4120 = $4120
var_4128 = $4128
var_4129 = $4129
var_4142 = $4142
var_4145 = $4145
var_41c8 = $41c8
var_41c9 = $41c9
tempcol	 = $41f0 ; temp color storage under top screen mask
idlejif	 = $42e0
idlesec	 = $42e1
idleten	 = $42e2
idlemin	 = $42e3
curdisp	 = $42e4
bar	 = $42e5
tsr2	 = $42e6
undchr	 = $42e7
undcol	 = $42e8
cphase	 = $42e9
key	 = $42ea
shft	 = $42eb
var_42ec = $42ec
var_42ed = $42ed ; saves lstx ($c5)
var_42ee = $42ee
var_42ef = $42ef
ptrpnfd	 = $42f0
ha577	 = $42f1
mask	 = $42f2 ; 17138: password mask character
scnmode	 = $42f3 ; 17139: 1=full, 0=split
dflag	 = $42f4
dstat	 = $42f5
cytemp	 = $42f6
interm	 = $42f7
cxsav	 = $42f8
len1	 = $42f9
passmode = $42fa
scnlock	 = $42fb
tmp6	 = $42fc
tmp7	 = $42fd
freq	 = $42fe

; rs232 routines
rsInstall= $4300
rsEnable = $4303
rsDisable= $4306
rsGetChar= $4309
rsPutChar= $430c
rsSetBaud= $430f
rsChar   = $4312

var_4320 = $4320
var_4352 = $4352
var_452e = $452e
var_45d2 = $45d2
var_45d4 = $45d4
var_4600 = $4600
var_4620 = $4620
var_46cf = $46cf
var_488a = $488a
var_48d0 = $48d0
var_4c20 = $4c20
var_4c55 = $4c55
var_4cb2 = $4cb2
var_4d12 = $4d12
var_4d55 = $4d55
var_4dc9 = $4dc9
var_4e20 = $4e20
var_4e46 = $4e46
var_4e49 = $4e49
var_4e4d = $4e4d
var_4e57 = $4e57
var_4ecf = $4ecf
var_4f4f = $4f4f
var_4fd4 = $4fd4
var_5020 = $5020
var_5050 = $5050
var_5211 = $5211
var_52c1 = $52c1
var_5349 = $5349
var_5420 = $5420
var_542e = $542e
var_5445 = $5445
var_5520 = $5520
var_5552 = $5552
var_564f = $564f
var_5745 = $5745
var_5746 = $5746
var_5845 = $5845
var_58c1 = $58c1
var_5953 = $5953
var_5b7a = $5b7a
var_5bda = $5bda
var_5e0d = $5e0d
var_5f03 = $5f03
var_5f5e = $5f5e
var_6ab4 = $6ab4
var_6dbe = $6dbe
var_6e6d = $6e6d
var_7857 = $7857
var_7ab6 = $7ab6
var_84be = $84be
var_9b9a = $9b9a
var_9f9e = $9f9e
var_bf7b = $bf7b

protosta = $c000
protoend = $cb00

var_cf0d = $cf0d
var_cf0f = $cf0f
var_cf12 = $cf12
var_cf14 = $cf14
var_cfff = $cfff

; bbs flags:

local	 = $d000
case	 = $d001
editor	 = $d002
tsr	 = $d003
llen	 = $d004
flag	 = $d005
chat	 = $d006
inchat	 = $d007
chatpage = $d008
access	 = $d009
mxor	 = $d00a
mkolor	 = $d00b
mupcase	 = $d00c
irqcount = $d00d
trans	 = $d00e
index	 = $d00f
vicregy	 = $d011
raster	 = $d012
vicregx	 = $d016
vicbase	 = $d018
vicirqf	 = $d019
vicirqm	 = $d01a
bordrclr = $d020
bckgrnd0 = $d021

var_d3c5 = $d3c5

colorram = $d800 ; ends at $dbff
cia1prta = $dc00
cia1dsec = $dc08
cia1sec	 = $dc09
cia1min	 = $dc0a
cia1hour = $dc0b
cia1icr	 = $dc0d ; interrupt control register

cia2prta = $dd00
carrier	 = $dd01
cia2ddrb = $dd03

swiftlnk = $de00

var_e404 = $e404
var_e405 = $e405
var_e406 = $e406

out_scrn = $e716 ; Output to the Screen regardless of current output device

var_e9d2 = $e9d2
var_e9f0 = $e9f0
var_e9ff = $e9ff
var_ea1c = $ea1c
var_ea24 = $ea24
var_ea81 = $ea81
var_ea87 = $ea87

var_f142 = $f142
var_f30f = $f30f
var_f31f = $f31f
var_f701 = $f701

colormem = $d800

var_fe56 = $fe56
var_febc = $febc ; somewhere around the Kernal NMI RS232 handler

; kernal routines:

setmsg	 = $ff90
readst	 = $ffb7
setlfs	 = $ffba
setname	 = $ffbd
chkin	 = $ffc6
chkout	 = $ffc9
clrch	 = $ffcc
chrin	 = $ffcf
chrout	 = $ffd2
load	 = $ffd5
save	 = $ffd8
getin	 = $ffe4
inctime	 = $ffea
plot	 = $fff0

; printables
return	 = #$0d	; 13
comma	 = #$2c	; ","
pound	 = #$5c	;
ImageReturn = #$8b ; "[K]"
clear	 = #$93 ; 147

	; first address in table is modified by $ae78
	; called by $cc77 (main irq switch routine), $cc6c
	;						addr:offset (incl. load address)
amptable:
; ampersand routines table
	word outastr	; &,0  $b567 output a$		a000:0002
	word inline	; &,1  $be23 inline
	word dskin	; &,2  $abdc dskin
	word read0	; &,3  $be68 read0
	word getmdm	; &,4  $a95c getmdm
	word getversn	; &,5  $b773 getversn
	word password	; &,6  $be2d password
	word prg	; &,7  $aa84 prg
	word dskdir	; &,8  $ab3a dskdir
	word btmvar	; &,9  $be63 btmvar
	word term	; &,10 $be4f term
	word clrarr	; &,11 $be59 clrarr		a00c:000e
	word newusr	; &,12 $be6d newusr
	word inchr	; &,13 $a858 inchr
	word $0000	; &,14 $0000 bell1 - maybe self-modifying?
	word convan	; &,15 $a128 convan
	word $c000	; &,16 $c000 sys 49152
	word $c003	; &,17 $c003 sys 49155		a018:001a
	word setmode	; &,18 $b099 setmode
	word disp1	; &,19 $b450 disp1
	word disp2	; &,20 $b426 disp2		a024:0026
	word disp3 	; &,21 $b3fa disp3		a02a:002c
	word tenwait	; &,22 $a6f2 tenwait		a02c:002e
	word xgetin	; &,23 $a827 xgetin		a02e:0030
	word xchrout	; &,24 $a704 xchrout		a030:0032
	word sound	; &,25 $be84 sound		a032:0034
	word getmdm	; &,26 $a95c getmdm (like &,4)	a034:0036
	word arraysav	; &,27 $be72 arraysav		a036:0038
	word arrayres	; &,28 $be77 arrayres		a038:003a
	word usevar	; &,29 $b591 usevar		a03a:003c
	word putvar	; &,30 $b5a5 put $61 in var .x	a03c:003e
	word zero	; &,31 $b5b9			a03e:0040
	word minusone	; &,32 $b5c4 			a040:0042
	word getarr	; &,33 $b4d7			a042:0044
	word putarr	; &,34 $b4ff 			a044:0046
	word getln	; &,35 $b4df (from ml.editor)	a046:0048
	word putln	; &,36 $b507			a048:004a
	word trapon	; &,37 $b75f			a04a:004c
	word trapoff	; &,38 $b758			a04c:004e
	word prtln	; &,39 $b4f9			a04e:0050
	word forcegc	; &,40 $b76a			a050:0052
	word setbaud	; &,41 $b4d3			a052:0054
	word jmp_caed	; &,42 $caed reserved 		a054:0056
	word jmp_aa08	; &,43 $aa08 reserved		a056:0058
	word chatchk	; &,44 $b66c (old notes say garbage collection)		a058:005a
	word prtvar	; &,45 $b57a			a05a:005c
	word prtvar0	; &,46 $b580			a05c:005e
	word carchk	; &,47 $a9c4			a05e:0060
 	word getkbd	; &,48 $a949			a060:0062
	word getmod	; &,49 $ba23			a062:0064
	word outscn	; &,50 $b7a6			a064:0066
	word outmod	; &,51 $ba8d			a066:0068
	word chkflags	; &,52 $b323			a068:006a
	word disp4	; &,53 $b462			a06a:006c
	word editor	; &,54 $be32			a06c:006e
; the & table cuts off here, in the Programmers' Reference Guide
	word sub_a712	; &,55 $a712			a06e:0070
	word jmp_be54	; &,56 $be54			a070:0072
	word jmp_be5e	; &,57 $be5e			a072:0074

	;
	; called from $b4fc, $b577, $b57d
	;
gotoa074:
	lda #$00	; a074:0076	a9 00
lbl_a076:
	sta syno	; a076:0078	85 96
lbl_a078:
	lda fac1	; a078:007a	a5 61
lbl_a07a:
	sta len1	; a07a:007c	8d f9 42
	lda fac1+1	; a07d:007f	a5 62
	sta fbufpt	; a07f:0081	85 71
	lda fac1+2	; a081:0083	a5 63
	sta fbufpt+1	; a083:0085	85 72
	lda tsr		; a085:0087	ad 03 d0
	beq skipa08f	; a088:008a	f0 05
	lda flag	; a08a:008c	ad 05 d0
	bne skipa0b1	; a08d:008f	d0 22
skipa08f:
	lda mjump	; a08f:0091	ad e8 07
	beq skipa0ba	; a092:0094	f0 26
	dec mjump	; a094:0096	ce e8 07
	beq skipa0ba	; a097:0099	f0 21
	bne skipa0b1	; a099:009b	d0 16
gotoa09b:
	ldx #$0f	; a09b:009d	a2 0f
	jsr usevar	; a09d:009f	20 91 b5
	lda fac1	; a0a0:00a2	a5 61
	cmp #$81	; a0a2:00a4	c9 81
	bne skipa0b9	; a0a4:00a6	d0 13
	lda fac1+1	; a0a6:00a8	a5 62
	bne skipa0b9	; a0a8:00aa	d0 0f
	lda #$8b	; a0aa:00ac	a9 8b
	sta z_fe	; a0ac:00ae	85 fe
	jsr sub_a712	; a0ae:00b0	20 12 a7
skipa0b1:
	jsr zero	; a0b1:00b3	20 b9 b5
	ldx #$0f	; a0b4:00b6	a2 0f
	jsr putvar	; a0b6:00b8	20 a5 b5
skipa0b9:
	rts		; a0b9:00bb	60

skipa0ba:
	jsr zero	; a0ba:00bc	20 b9 b5
	ldx #$11	; a0bd:00bf	a2 11
	jsr putvar	; a0bf:00c1	20 a5 b5
	jsr sub_a0fe	; a0c2:00c4	20 fe a0
	jsr zero	; a0c5:00c7	20 b9 b5
	lda chat	; a0c8:00ca	ad 06 d0
	sta fac1+1	; a0cb:00cd	85 62
	ldx #$26	; a0cd:00cf	a2 26
	jsr putvar	; a0cf:00d1	20 a5 b5
	lda chat	; a0d2:00d4	ad 06 d0
	beq skipa0fb	; a0d5:00d7	f0 24
	jsr minusone	; a0d7:00d9	20 c4 b5
	ldx #$11	; a0da:00dc	a2 11
	jsr putvar	; a0dc:00de	20 a5 b5
	jsr zero	; a0df:00e1	20 b9 b5
	ldx #$12	; a0e2:00e4	a2 12
	jsr putvar	; a0e4:00e6	20 a5 b5
	lda chat	; a0e7:00e9	ad 06 d0
	cmp #$2f	; a0ea:00ec	c9 2f
	bne skipa0fb	; a0ec:00ee	d0 0d
	lda #$86	; a0ee:00f0	a9 86
	sta fac1	; a0f0:00f2	85 61
	lda #$3c	; a0f2:00f4	a9 3c
	sta fac1+1	; a0f4:00f6	85 62
	ldx #$12	; a0f6:00f8	a2 12
	jsr putvar	; a0f8:00fa	20 a5 b5
skipa0fb:
	jmp gotoa09b	; a0fb:00fd	4c 9b a0

sub_a0fe:
	lda #$00	; a0fe:0100	a9 00
	sta chat	; a100:0102	8d 06 d0
	jsr carchk	; a103:0105	20 c4 a9
	cmp #$01	; a106:0108	c9 01
	bne skipa110	; a108:010a	d0 06
	lda #$2f	; a10a:010c	a9 2f
	sta chat	; a10c:010e	8d 06 d0
	rts		; a10f:0111	60

skipa110:
	lda len1	; a110:0112	ad f9 42
	beq skipa127	; a113:0115	f0 12
loopa115:
	ldy syno	; a115:0117	a4 96
	lda (fbufpt),y	; a117:0119	b1 71
	sta z_fe	; a119:011b	85 fe
	jsr sub_a288	; a11b:011d	20 88 a2
	inc syno	; a11e:0120	e6 96
	lda syno	; a120:0122	a5 96
	cmp len1	; a122:0124	cd f9 42
	bcc loopa115	; a125:0127	90 ee
skipa127:
	rts		; a127:0129	60

convan:			; &,15
	ldx #$00	; a128:012a	a2 00
	jsr usevar	; a12a:012c	20 91 b5
	ldy #$00	; a12d:012f	a0 00
loopa12f:
	lda (fac1+1),y	; a12f:0131	b1 62
	sta d1day,y	; a131:0133	99 31 a2
	iny		; a134:0136	c8
	cpy #$0b	; a135:0137	c0 0b
	bne loopa12f	; a137:0139	d0 f6
	jsr sub_a14d	; a139:013b	20 4d a1
	lda #$14	; a13c:013e	a9 14
	sta fac1	; a13e:0140	85 61
	lda #$0f	; a140:0142	a9 0f
	sta fac1+1	; a142:0144	85 62
	lda #$ce	; a144:0146	a9 ce
	sta fac1+2	; a146:0148	85 63
	ldx #$00	; a148:014a	a2 00
	jmp putvar	; a14a:014c	4c a5 b5

sub_a14d:
	lda d1day	; a14d:014f	ad 31 a2
	and #$0f	; a150:0152	29 0f
	tax		; a152:0154	aa
	dex		; a153:0155	ca
	txa		; a154:0156	8a
	asl a		; a155:0157	0a
	asl a		; a156:0158	0a
	tay		; a157:0159	a8
	ldx #$00	; a158:015a	a2 00
loopa15a:
	lda days,y	; a15a:015c	b9 15 a2
	sta date_day,x	; a15d:015f	9d 0b ce
	inx		; a160:0162	e8
	iny		; a161:0163	c8
	cpx #$03	; a162:0164	e0 03
	bne loopa15a	; a164:0166	d0 f4
	lda d1mon1	; a166:0168	ad 35 a2
	and #$0f	; a169:016b	29 0f
	tax		; a16b:016d	aa
	lda $a234	; a16c:016e	ad 34 a2
	and #$0f	; a16f:0171	29 0f
	beq skipa178	; a171:0173	f0 05
	txa		; a173:0175	8a
	clc		; a174:0176	18
	adc #$0a	; a175:0177	69 0a
	tax		; a177:0179	aa
skipa178:
	dex		; a178:017a	ca
	txa		; a179:017b	8a
	asl a		; a17a:017c	0a
	asl a		; a17b:017d	0a
	tay		; a17c:017e	a8
	ldx #$00	; a17d:017f	a2 00
loopa17f:
	lda months,y	; a17f:0181	b9 e5 a1
	sta date_mon,x	; a182:0184	9d 0f ce
	inx		; a185:0187	e8
	iny		; a186:0188	c8
	cpx #$03	; a187:0189	e0 03
	bne loopa17f	; a189:018b	d0 f4
	jmp gotoa18e	; a18b:018d	4c 8e a1

gotoa18e:
	lda d1date10	; a18e:0190	ad 36 a2
	sta date_10	; a191:0193	8d 13 ce
	lda d1date1	; a194:0196	ad 37 a2
	sta date_1	; a197:0199	8d 14 ce
	lda $a232	; a19a:019c	ad 32 a2
	sta year_10	; a19d:019f	8d 19 ce
	lda d1year1	; a1a0:01a2	ad 33 a2
	sta year_1	; a1a3:01a5	8d 1a ce
	lda d1min10	; a1a6:01a8	ad 3a a2
	sta tm_mn_10	; a1a9:01ab	8d 1f ce
	lda d1min1	; a1ac:01ae	ad 3b a2
	sta tm_mn_01	; a1af:01b1	8d 20 ce
	lda d1hour1	; a1b2:01b4	ad 39 a2
	sta tm_hr_01	; a1b5:01b7	8d 1d ce
	lda d1hourap	; a1b8:01ba	ad 38 a2
	and #$31	; a1bb:01bd	29 31
	cmp #$30	; a1bd:01bf	c9 30
	bne skipa1c3	; a1bf:01c1	d0 02
	lda #$20	; a1c1:01c3	a9 20
skipa1c3:
	sta tm_hr_10	; a1c3:01c5	8d 1c ce
	lda d1hourap	; a1c6:01c8	ad 38 a2
	cmp #$38	; a1c9:01cb	c9 38
	bcs skipa1d3	; a1cb:01cd	b0 06
	bcs skipa1d3	; a1cd:01cf	b0 04
	lda #$c1	; a1cf:01d1	a9 c1
	bne skipa1d5	; a1d1:01d3	d0 02
skipa1d3:
	lda #$d0	; a1d3:01d5	a9 d0
skipa1d5:
	sta time_ap	; a1d5:01d7	8d 22 ce
	lda date_10	; a1d8:01da	ad 13 ce
	cmp #$30	; a1db:01dd	c9 30
	bne skipa1e4	; a1dd:01df	d0 05
	lda #$20	; a1df:01e1	a9 20
	sta date_10	; a1e1:01e3	8d 13 ce
skipa1e4:
	rts		; a1e4:01e6	60

months:
	ascii "Jan "	; a1e5:01e7	tbl-a214
	ascii "Feb "	; a1e9:01eb
	ascii "Mar "	; a1ed:01ef
	ascii "Apr "	; a1f1:01f3
	ascii "May "	; a1f5:01f7
	ascii "Jun "	; a1f9:01fb
	ascii "Jul "	; a1fd:01ff
	ascii "Aug "	; a201:0203
	ascii "Sep "	; a205:0207
	ascii "Oct "	; a209:020b
	ascii "Nov "	; a20d:020f
	ascii "Dec "	; a211:0213
			;
days:
	ascii "Sun "	; a215:0217	tbl-a230
	ascii "Mon "	; a219:021b
	ascii "Tue "	; a21d:021f
	ascii "Wed "	; a221:0223
	ascii "Thu "	; a225:0227
	ascii "Fri "	; a229:022b
	ascii "Sat "	; a22d:022f

	; holds d1$, 11-digit representation of time/date
	; "11803248415" -> "Sun May 18, 2018  4:15 PM"
d1day:
	byte $20	; a231:0233 ; d1$ day (1-7)

d1year10:
	byte $20	; a232:0234 ; d1$ year, 10s digit

d1year1:
	byte $20  	; a233:0235 ; d1$ year,  1s digit

d1mon10:
	byte $20	; a234:0236 ; d1$ month, 10s digit

d1mon1:
	byte $20	; a235:0237 ; d1$ month,  1s digit

d1date10:
	byte $20	; a236:0238 ; d1$ month, 10s digit

d1date1:
	byte $20  	; a237:0239 ; d1$ date, 1s digit

d1hourap:
	byte $20 	; a238:023a ; d1$ hour (1-12, +80=PM)

d1hour1:
	byte $20 	; a239:023b ; d1$ hour (1s digit)

d1min10:
	byte $20  	; a23a:023c ; d1$ minute, 10s digit

d1min1:
	byte $20  	; a23b:023d ; d1$ minute, 1s digit

tbl_a23c:
	byte $20,$20	; a23c:023e

	pha		; a23e:0240	48
	lda editor	; a23f:0241	ad 02 d0
	and #$01	; a242:0244	29 01
	beq skipa255	; a244:0246	f0 0f
	pla		; a246:0248	68
sub_a247:
	jsr sub_a26e	; a247:0249	20 6e a2
	bcc skipa26a	; a24a:024c	90 1e
	cmp #$12	; a24c:024e	c9 12
	beq skipa26a	; a24e:0250	f0 1a
	cmp #$92	; a250:0252	c9 92
	beq skipa26a	; a252:0254	f0 16
	pha		; a254:0256	48
skipa255:
	pla		; a255:0257	68
	cmp #$20	; a256:0258	c9 20
	bcc skipa26c	; a258:025a	90 12
	cmp #$80	; a25a:025c	c9 80
	bcc skipa26a	; a25c:025e	90 0c
	cmp #$a0	; a25e:0260	c9 a0
	bcs skipa26a	; a260:0262	b0 08
	cmp #$85	; a262:0264	c9 85
	bcc skipa26c	; a264:0266	90 06
	cmp #$8d	; a266:0268	c9 8d
	bcs skipa26c	; a268:026a	b0 02
skipa26a:
	sec		; a26a:026c	38
	rts		; a26b:026d	60

skipa26c:
	clc		; a26c:026e	18
	rts		; a26d:026f	60

sub_a26e:
	sty cytemp	; a26e:0270	8c f6 42
	ldy #$0f	; a271:0273	a0 0f
	cmp prntcolr,y	; a273:0275	d9 70 a3
	beq skipa280	; a276:0278	f0 08
	dey		; a278:027a	88
	bne loopa273	; a279:027b	d0 f8
	ldy cytemp 	; a27b:027d	ac f6 42
	sec		; a27e:0280	38
	rts		; a27f:0281	60

skipa280:
	ldy cytemp	; a280:0282	ac f6 42
	clc		; a283:0285	18
	rts		; a284:0286	60

loopa285:
	jmp gotoa659	; a285:0287	4c 59 a6

; interpret MCI commands?
sub_a288:
	cmp #pound	; a288:028a	c9 5c
	bne loopa285	; a28a:028c	d0 f9
	ldx mci		; a28c:028e	ae ef 07
	bne loopa285	; a28f:0291	d0 f4
	inc syno	; a291:0293	e6 96
	ldy syno	; a293:0295	a4 96
	lda (fbufpt),y	; a295:0297	b1 71
	cmp #pound	; a297:0299	c9 5c
	beq loopa285	; a299:029b	f0 ea
	and #$3f	; a29b:029d	29 3f
	sta lbl_a2ea	; a29d:029f	8d ea a2
	inc syno	; a2a0:02a2	e6 96
	iny		; a2a2:02a4	c8
	lda (fbufpt),y	; a2a3:02a5	b1 71
	sta lbl_a2ec	; a2a5:02a7	8d ec a2
	and #$0f	; a2a8:02aa	29 0f
	sta lbl_a2eb	; a2aa:02ac	8d eb a2
	iny		; a2ad:02af	c8
	lda (fbufpt),y	; a2ae:02b0	b1 71
	sta lbl_a2ee	; a2b0:02b2	8d ee a2
	and #$0f	; a2b3:02b5	29 0f
	sta lbl_a2ed	; a2b5:02b7	8d ed a2
	lda lbl_a2eb	; a2b8:02ba	ad eb a2
	asl a		; a2bb:02bd	0a
	asl a		; a2bc:02be	0a
	clc		; a2bd:02bf	18
	adc lbl_a2eb	; a2be:02c0	6d eb a2
	asl a		; a2c1:02c3	0a
	clc		; a2c2:02c4	18
	adc lbl_a2ed	; a2c3:02c5	6d ed a2
	sta lbl_a2ef	; a2c6:02c8	8d ef a2
	iny		; a2c9:02cb	c8
	lda (fbufpt),y	; a2ca:02cc	b1 71
	sta lbl_a2f0	; a2cc:02ce	8d f0 a2
	lda lbl_a2ea	; a2cf:02d1	ad ea a2
	cmp #$28	; a2d2:02d4	c9 28
	bcs skipa2e7	; a2d4:02d6	b0 11
	asl a		; a2d6:02d8	0a
	tax		; a2d7:02d9	aa

; self-modifying jump table: get address, rewrite jmp instruction

	lda jmptable,x	; a2d8:02da	bd f1 a2
	sta mod_a2e4+1	; a2db:02dd	8d e5 a2
	lda jmptable+1,x; a2de:02e0	bd f2 a2
	sta mod_a2e4+2	; a2e1:02e3	8d e6 a2
mod_a2e4:
	jmp $ffff	; a2e4:02e6	4c ff ff

skipa2e7:
	jmp gotoa653	; a2e7:02e9	4c 53 a6

lbl_a2ea:
	byte $00	; a2ea:02ec	00

lbl_a2eb:
	byte $03	; a2eb:02ed	03

lbl_a2ec:
	byte $00	; a2ec:02ee	00

lbl_a2ed:
	byte $00	; a2ed:02ef	00

lbl_a2ee:
	byte $00	; a2ee:02f0	00

lbl_a2ef:
	byte $00	; a2ef:02f1	00

lbl_a2f0:
	byte $00	; a2f0:02f2	00

; 8/28/14 - jump table ($02e7)

jmptable:
	word jmp_a653,jmp_a380,jmp_a3bf,jmp_a3c4,jmp_a3d8,jmp_a3e1	; a2f1:02f3
	word jmp_a3ea,jmp_a3f1,jmp_a3fc,jmp_a401,jmp_a43e,jmp_a44d	; a2fd:02ff
	word jmp_a45e,jmp_a653,jmp_a467,jmp_a46c,jmp_a477,jmp_a47e	; a309:030b
	word jmp_a4a9,jmp_a4ba,jmp_a4c1,jmp_a4e5,jmp_a4f6,jmp_a55c	; a315:0317
	word jmp_a575,jmp_a653,jmp_a653,jmp_a653,jmp_a653,jmp_a653	; a321:0323
	word jmp_a653,jmp_a600,jmp_a653,jmp_a653,jmp_a653,jmp_a57a	; a32d:032f
	word jmp_a597,jmp_a5a7,jmp_a653,jmp_a653			; a339:033b

; mci variables
mci_vars:
	byte $44,$31 ; v0 - d1$ current date		; a341:0343
	byte $4c,$44 ; v1 - ld$ last call date
	byte $4e,$41 ; v2 - na$ user's handle
	byte $52,$4e ; v3 - rn$ user's real name
	byte $50,$48 ; v4 - ph$ user's phone number
	byte $42,$4e ; v5 - bn$ BBS name		; a34b:034d
	byte $42,$80 ; v6 - b_$ system variable
	byte $41,$4e ; v7 - an$ last user input
	byte $44,$32 ; v8 - d2$ board name at entry
	byte $44,$33 ; v9 - d3$ last user on BBS
	byte $41,$4b ; vj - ak$ separator line		; a355:0357
	byte $4c,$54 ; vk - d5$ true last call date
	byte $44,$34 ; vl - d4$ current ML protocol
	byte $41,$47 ; vm - ag$ access group name
	byte $43,$43 ; vn - cc$ two-character login ID
	byte $44,$44 ; vo - dd$ board ID + user ID	; a35f:0361

sub_a361
; enter with MCI variable in .x
	txa		; a361:0363	8a
	asl a		; a362:0364	0a
	tay		; a363:0365	a8
	lda mci_vars+1,y; a364:0366	b9 42 a3
	ora #$80	; a367:0369	09 80
	tax		; a369:036b	aa
	lda mci_vars,y	; a36a:036c	b9 41 a3
	jmp sub_b597	; a36d:036f	4c 97 b5
; exit with variable name in .ax

		 ; from $a273, $a3d0, $bb78, $b7ed, $bb70
		 ; $0F bytes - printable c= colors, black excluded
prntcolr:
	byte 159,  5, 28,159,156, 30, 31,158	; a370:0372
	byte 129,149,150,151,152,153,154,155	; a378:037a

jmp_a380:
	ldx lbl_a2eb	; a380:0382	ae eb a2
	jsr sub_a361	; a383:0385	20 61 a3
	lda fac1+1	; a386:0388	a5 62
	sta mod_a39c+1	; a388:038a	8d 9d a3
	lda fac1+2	; a38b:038d	a5 63
	sta mod_a39c+2	; a38d:038f	8d 9e a3
	ldx #$00	; a390:0392	a2 00
gotoa392:
	inc syno	; a392:0394	e6 96
	ldy syno	; a394:0396	a4 96
	lda (fbufpt),y	; a396:0398	b1 71
	cmp #pound	; a398:039a	c9 5c
	beq skipa3a5	; a39a:039c	f0 09

mod_a39c:
	cmp $ffff,x	; a39c:039e	dd ff ff
	bne skipa3ab	; a39f:03a1	d0 0a
	inx		; a3a1:03a3	e8
	jmp gotoa392	; a3a2:03a4	4c 92 a3

skipa3a5:
	lda #$01	; a3a5:03a7	a9 01
	sta mresult	; a3a7:03a9	8d e9 07
	rts		; a3aa:03ac	60

skipa3ab:
	lda #$00	; a3ab:03ad	a9 00
	sta mresult	; a3ad:03af	8d e9 07
loopa3b0:
	inc syno	; a3b0:03b2	e6 96
	ldy syno	; a3b2:03b4	a4 96
	cpy #$50	; a3b4:03b6	c0 50
	beq skipa3be	; a3b6:03b8	f0 06
lbl_a3b8:
	lda (fbufpt),y	; a3b8:03ba	b1 71
	cmp #pound	; a3ba:03bc	c9 5c
	bne loopa3b0	; a3bc:03be	d0 f2
skipa3be:
	rts		; a3be:03c0	60

jmp_a3bf:
	lda #$07	; a3bf:03c1	a9 07
	jmp gotoa637	; a3c1:03c3	4c 37 a6

jmp_a3c4:
	lda lbl_a2eb	; a3c4:03c6	ad eb a2
	bne skipa3cc	; a3c7:03c9	d0 03
	lda lbl_a4a8	; a3c9:03cb	ad a8 a4
skipa3cc:
	sta mcolor	 ; a3cc:03ce	8d ec 07
	tay		; a3cf:03d1	a8
	lda prntcolr,y	; a3d0:03d2	b9 70 a3
	sta z_fe	; a3d3:03d5	85 fe
	jmp sub_a712	; a3d5:03d7	4c 12 a7

jmp_a3d8:
	lda mresult	; a3d8:03da	ad e9 07
	bne skipa3e0	; a3db:03dd	d0 03
	jmp jmp_a43e	; a3dd:03df	4c 3e a4
skipa3e0:
	rts		; a3e0:03e2	60

jmp_a3e1:
	lda mresult	; a3e1:03e3	ad e9 07
	beq skipa3e9	; a3e4:03e6	f0 03
	jmp jmp_a43e	; a3e6:03e8	4c 3e a4

skipa3e9:
	rts		; a3e9:03eb	60

jmp_a3ea:
	lda #clear	; a3ea:03ec	a9 93
	sta z_fe	; a3ec:03ee	85 fe
	jmp sub_a712	; a3ee:03f0	4c 12 a7

jmp_a3f1:
	lda lbl_a2eb	; a3f1:03f3	ad eb a2
	and #$01	; a3f4:03f6	29 01
	sta case	; a3f6:03f8	8d 01 d0
	jmp inchr	; a3f9:03fb	4c 58 a8

jmp_a3fc:
	lda #$14	; a3fc:03fe	a9 14
	jmp $a637  	; a3fe:0400	4c 37 a6

jmp_a401:
	lda lbl_a2eb	; a401:0403	ad eb a2
	and #$01	; a404:0406	29 01
	sta case	; a406:0408	8d 01 d0
	lda #$00	; a409:040b	a9 00
	sta tmp1	; a40b:040d	8d fc 07
	lda #$04	; a40e:0410	a9 04
	sta editor 	; a410:0412	8d 02 d0
	lda #$00	; a413:0415	a9 00
	sta passmode	; a415:0417	8d fa 42
	jsr zero	; a418:041a	20 b9 b5
	ldx #$00	; a41b:041d	a2 00
	jsr putvar	; a41d:041f	20 a5 b5
	lda syno	; a420:0422	a5 96
	pha		; a422:0424	48
	lda fbufpt	; a423:0425	a5 71
	pha		; a425:0427	48
	lda fbufpt+1	; a426:0428	a5 72
	pha		; a428:042a	48
	lda len1	; a429:042b	ad f9 42
	pha		; a42c:042e	48
	jsr sub_be28	; a42d:042f	20 28 be
	pla		; a430:0432	68
	sta len1	; a431:0433	8d f9 42
	pla		; a434:0436	68
	sta fbufpt+1	; a435:0437	85 72
gotoa437:
	pla		; a437:0439	68
	sta fbufpt	; a438:043a	85 71
	pla		; a43a:043c	68
	sta syno	; a43b:043d	85 96
	rts		; a43d:043f	60

jmp_a43e:
	lda lbl_a2eb	; a43e:0440	ad eb a2
gotoa441:
	cmp #$00	; a441:0443	c9 00
	beq skipa44c	; a443:0445	f0 07
	sta mjump	; a445:0447	8d e8 07
	lda #$f0	; a448:044a	a9 f0
	sta syno	; a44a:044c	85 96
skipa44c:
	rts		; a44c:044e	60

jmp_a44d:
	lda lbl_a2eb	; a44d:044f	ad eb a2
	cmp #$00	; a450:0452	c9 00
	bne skipa458	; a452:0454	d0 04
	sta mkolor	; a454:0456	8d 0b d0
	rts		; a457:0459	60

skipa458:
	sta mkolor	; a458:045a	8d 0b d0
	jmp jmp_a3c4	; a45b:045d	4c c4 a3

jmp_a45e:
	lda lbl_a2eb	; a45e:0460	ad eb a2
	and #$01	; a461:0463	29 01
	sta mprtr	; a463:0465	8d ed 07
	rts		; a466:0468	60

jmp_a467:
	lda #$0d	; a467:0469	a9 0d
	jmp gotoa637	; a469:046b	4c 37 a6

jmp_a46c:
	lda #$13	; a46c:046e	a9 13
	sta lbl_a2eb	; a46e:0470	8d eb a2
	lda lbl_a2ec	; a471:0473	ad ec a2
	jmp gotoa61e	; a474:0476	4c 1e a6

jmp_a477:
	lda lbl_a2eb	; a477:0479	ad eb a2
	sta mprint	; a47a:047c	8d eb 07
	rts		; a47d:047f	60

jmp_a47e:
sub_a47e:
	lda lbl_a2eb	; a47e:0480	ad eb a2
	beq skipa486	; a481:0483	f0 03

;
; "image 1.2a" bootloader transfers control here at startup
;

lbl_a483:
	sta lbl_a4a8	; a483:0485	8d a8 a4
skipa486:
	lda #$00	; a486:0488	a9 00
	sta mjump	; a488:048a	8d e8 07
	sta lbl_a2eb	; a48b:048d	8d eb a2
	sta mreverse	; a48e:0490	8d ee 07
	sta mprtr	; a491:0493	8d ed 07
	sta mprint	; a494:0496	8d eb 07
	sta mspeed	; a497:0499	8d ea 07
	sta mkolor	; a49a:049c	8d 0b d0
	sta mci		; a49d:049f	8d ef 07
	jsr jmp_a3c4	; a4a0:04a2	20 c4 a3
	lda #$00	; a4a3:04a5	a9 00
	jmp gotoa4e8	; a4a5:04a7	4c e8 a4

lbl_a4a8:
	byte $03	; a4a8:04aa	03

jmp_a4a9:
	lda lbl_a2eb	; a4a9:04ab	ad eb a2
	and #$01	; a4ac:04ae	29 01
	sta mreverse	; a4ae:04b0	8d ee 07
	lsr a		; a4b1:04b3	4a
	ror a		; a4b2:04b4	6a
	eor #var_3451	; a4b3:04b5	49 92
	sta z_fe	; a4b5:04b7	85 fe
	jmp gotoa74b	; a4b7:04b9	4c 4b a7

jmp_a4ba:
	lda lbl_a2eb	; a4ba:04bc	ad eb a2
	sta mspeed	; a4bd:04bf	8d ea 07
	rts		; a4c0:04c2	60

jmp_a4c1:
	lda lbl_a2eb	; a4c1:04c3	ad eb a2
	cmp #$02	; a4c4:04c6	c9 02
	bne skipa4d6	; a4c6:04c8	d0 0e
	ldx #$18	; a4c8:04ca	a2 18
	jsr usevar	; a4ca:04cc	20 91 b5
	lda fac1+1	; a4cd:04cf	a5 62
	and #$0f	; a4cf:04d1	29 0f
	ora #$30	; a4d1:04d3	09 30
	sta buffer	; a4d3:04d5	8d 77 ce
skipa4d6:
	lda #<buffer	; a4d6:04d8	a9 77
	sta mod_a39c+1	; a4d8:04da	8d 9d a3
	lda #>buffer	; a4db:04dd	a9 ce
	sta mod_a39c+2	; a4dd:04df	8d 9e a3
	ldx #$00	; a4e0:04e2	a2 00
	jmp gotoa392	; a4e2:04e4	4c 92 a3

jmp_a4e5:
	lda lbl_a2eb	; a4e5:04e7	ad eb a2
gotoa4e8:
	and #$01	; a4e8:04ea	29 01
	sta mupcase	; a4ea:04ec	8d 0c d0
	lsr a		; a4ed:04ef	4a
	ror a		; a4ee:04f0	6a
	eor #$0e	; a4ef:04f1	49 0e
	sta z_fe	; a4f1:04f3	85 fe
	jmp gotoa74b	; a4f3:04f5	4c 4b a7

jmp_a4f6:
	ldx lbl_a2eb	; a4f6:04f8	ae eb a2
	stx lbl_a2ea	; a4f9:04fb	8e ea a2
	jsr sub_a361	; a4fc:04fe	20 61 a3
gotoa4ff:
	lda fac1	; a4ff:0501	a5 61
	sta gotoa513+1	; a501:0503	8d 14 a5
	lda fac1+1	; a504:0506	a5 62
	sta mod_051c+1	; a506:0508	8d 1d a5
	lda fac1+2	; a509:050b	a5 63
	sta mod_051c+2	; a50b:050d	8d 1e a5
	lda #$00	; a50e:0510	a9 00
	sta mod_a515+1	; a510:0512	8d 16 a5
gotoa513:
	lda #$ff	; a513:0515	a9 ff
mod_a515:
	cmp #$ff	; a515:0517	c9 ff
	beq skipa537	; a517:0519	f0 1e
	ldy mod_a515+1	; a519:051b	ac 16 a5
mod_051c:
	lda $ffff,y	; a51c:051e	b9 ff ff
	sta z_fe	; a51f:0521	85 fe
	ldx lbl_a2ea	; a521:0523	ae ea a2
	cpx #$02	; a524:0526	e0 02
	bcs skipa52e	; a526:0528	b0 06
	sta d1day,y	; a528:052a	99 31 a2
	jmp gotoa531	; a52b:052d	4c 31 a5

skipa52e:
	jsr sub_a68b	; a52e:0530	20 8b a6
gotoa531:
	inc mod_a515+1	; a531:0533	ee 16 a5
	jmp gotoa513	; a534:0536	4c 13 a5

skipa537:
	ldx lbl_a2ea	; a537:0539	ae ea a2
	cpx #$02	; a53a:053c	e0 02
	bcs skipa55b	; a53c:053e	b0 1d
	jsr sub_a14d	; a53e:0540	20 4d a1
lbl_a541:
	lda #$00	; a541:0543	a9 00
	sta mod_a515+1	; a543:0545	8d 16 a5
loopa546:
	ldy mod_a515+1	; a546:0548	ac 16 a5
	lda date_day,y	; a549:054b	b9 0b ce
	sta z_fe	; a54c:054e	85 fe
	jsr sub_a712	; a54e:0550	20 12 a7
	inc mod_a515+1	; a551:0553	ee 16 a5
	lda mod_a515+1	; a554:0556	ad 16 a5
	cmp #$19	; a557:0559	c9 19
	bcc loopa546	; a559:055b	90 eb
skipa55b:
	rts		; a55b:055d	60

jmp_a55c:
	lda lbl_a2eb	; a55c:055e	ad eb a2
	beq skipa574	; a55f:0561	f0 13
	inc lbl_a2eb	; a561:0563	ee eb a2
loopa564:
	lda cia1sec	; a564:0566	ad 09 dc
	cmp lbl_a2ea	; a567:0569	cd ea a2
	beq loopa564	; a56a:056c	f0 f8
	sta lbl_a2ea	; a56c:056e	8d ea a2
	dec lbl_a2eb	; a56f:0571	ce eb a2
	bne loopa564	; a572:0574	d0 f0
skipa574:
	rts		; a574:0576	60

jmp_a575:
	lda #$f0	; a575:0577	a9 f0
	jmp gotoa441	; a577:0579	4c 41 a4

jmp_a57a:
	lda lbl_a2ec	; a57a:057c	ad ec a2
	cmp #$30	; a57d:057f	c9 30
	bcc skipa593	; a57f:0581	90 12
	cmp #$3a	; a581:0583	c9 3a
	bcs skipa593	; a583:0585	b0 0e
	lda lbl_a2eb	; a585:0587	ad eb a2
	cmp #$05	; a588:058a	c9 05
	bcc skipa58e	; a58a:058c	90 02
	lda #$05	; a58c:058e	a9 05
skipa58e:
	sta mdigits	; a58e:0590	8d f0 07
	lda #$30	; a591:0593	a9 30
skipa593:
	sta lbl_a5ff	; a593:0595	8d ff a5
	rts		; a596:0598	60

jmp_a597:
	lda #$02	; a597:0599	a9 02
	sta lbl_a2ea	; a599:059b	8d ea a2
	lda lbl_a2ec	; a59c:059e	ad ec a2
	ldx #$80	; a59f:05a1	a2 80
	jsr sub_b597	; a5a1:05a3	20 97 b5
	jmp gotoa4ff	; a5a4:05a6	4c ff a4

; output a number
jmp_a5a7:
	lda lbl_a2ec	; a5a7:05a9	ad ec a2
	ora #$80	; a5aa:05ac	09 80
	ldx #$80	; a5ac:05ae	a2 80
	jsr sub_b597	; a5ae:05b0	20 97 b5
	ldx fac1	; a5b1:05b3	a6 61
	lda fac1+1	; a5b3:05b5	a5 62
	jsr sub_b61c	; a5b5:05b7	20 1c b6
	ldy #$00	; a5b8:05ba	a0 00
	sty lbl_a5fd	; a5ba:05bc	8c fd a5
	ldx mdigits	; a5bd:05bf	ae f0 07
	beq skipa5c9	; a5c0:05c2	f0 07
	lda #$05	; a5c2:05c4	a9 05
	sec		; a5c4:05c6	38
	sbc mdigits	; a5c5:05c7	ed f0 07
	tay		; a5c8:05ca	a8
skipa5c9:
	sty lbl_a5fe	; a5c9:05cb	8c fe a5
	lda lbl_cedb,y	; a5cc:05ce	b9 db ce
	cpy #$04	; a5cf:05d1	c0 04
	bcs skipa5ec	; a5d1:05d3	b0 19
	ldx lbl_a5fd	; a5d3:05d5	ae fd a5
	bne skipa5ec	; a5d6:05d8	d0 14
	cmp #$30	; a5d8:05da	c9 30
	bne skipa5ec	; a5da:05dc	d0 10
	ldx mdigits	; a5dc:05de	ae f0 07
	beq skipa5f4	; a5df:05e1	f0 13
	lda lbl_a5ff	; a5e1:05e3	ad ff a5
	sta z_fe	; a5e4:05e6	85 fe
	jsr sub_a68b	; a5e6:05e8	20 8b a6
	jmp skipa5f4	; a5e9:05eb	4c f4 a5

skipa5ec:
	sta z_fe	; a5ec:05ee	85 fe
	jsr sub_a68b	; a5ee:05f0	20 8b a6
	inc lbl_a5fd	; a5f1:05f3	ee fd a5
skipa5f4:
	ldy lbl_a5fe	; a5f4:05f6	ac fe a5
	iny		; a5f7:05f9	c8
	cpy #$05	; a5f8:05fa	c0 05
	bne skipa5c9	; a5fa:05fc	d0 cd
	rts		; a5fc:05fe	60

lbl_a5fd:
	byte $00	; a5fd:05ff

lbl_a5fe:
	byte $00	; a5fe:0600	00

lbl_a5ff:
	byte $30	; a5ff:0601

lbl_0600:
	inc syno	; a600:0602	e6 96
	lda lbl_a2ef	; a602:0604	ad ef a2
	cmp zp_02	; a605:0607	c5 02
	bcc skipa61d	; a607:0609	90 14
	beq skipa61d	; a609:060b	f0 12
	cmp #$28	; a60b:060d	c9 28
	bcs skipa61d	; a60d:060f	b0 0e
loopa60f:
	lda #$20	; a60f:0611	a9 20
	sta z_fe	; a611:0613	85 fe
	jsr sub_a712	; a613:0615	20 12 a7
	lda lbl_a2ef	; a616:0618	ad ef a2
	cmp zp_02	; a619:061b	c5 02
	bne loopa60f	; a61b:061d	d0 f2
skipa61d:
	rts		; a61d:061f	60

gotoa61e:
	sta tmp5	; a61e:0620	8d f8 07
	lda lbl_a2eb	; a621:0623	ad eb a2
	beq skipa636	; a624:0626	f0 10
	sta tmp2	; a626:0628	8d fd 07
loopa629:
	lda tmp5	; a629:062b	ad f8 07
	sta z_fe	; a62c:062e	85 fe
	jsr sub_a68b	; a62e:0630	20 8b a6
	dec tmp2	; a631:0633	ce fd 07
	bne loopa629	; a634:0636	d0 f3
skipa636:
	rts		; a636:0638	60

gotoa637:
	ldx lbl_a2eb	; a637:0639	ae eb a2
	stx tmp6	; a63a:063c	8e fc 42
	sta tmp7	; a63d:063f	8d fd 42
	lda tmp6	; a640:0642	ad fc 42
	beq skipa652	; a643:0645	f0 0d
loopa645:
	lda tmp7	; a645:0647	ad fd 42
	sta z_fe	; a648:064a	85 fe
	jsr sub_a712	; a64a:064c	20 12 a7
	dec tmp6	; a64d:064f	ce fc 42
	bne loopa645	; a650:0652	d0 f3
skipa652:
	rts		; a652:0654	60

jmp_a653:
; called many times from jmptable
	dec syno	; a653:0655	c6 96
	dec syno	; a655:0657	c6 96
	lda #pound	; a657:0659	a9 5c
gotoa659:
	cmp #$04	; a659:065b	c9 04
	bne sub_a68b	; a65b:065d	d0 2e
	ldx #$00	; a65d:065f	a2 00
loopa65f
	inc syno	; a65f:0661	e6 96
	ldy syno	; a661:0663	a4 96
	lda (fbufpt),y	; a663:0665	b1 71
	sta d1day,x	; a665:0667	9d 31 a2
	inx		; a668:066a	e8
	cpx #$0b	; a669:066b	e0 0b
	bne loopa65f	; a66b:066d	d0 f2
	jsr sub_a14d	; a66d:066f	20 4d a1
	lda #$00	; a670:0672	a9 00
	sta index	; a672:0674	8d 0f d0
	ldy index	; a675:0677	ac 0f d0
loopa678
	lda date_day,y	; a678:067a	b9 0b ce
	sta z_fe	; a67b:067d	85 fe
	jsr sub_a712	; a67d:067f	20 12 a7
	inc index	; a680:0682	ee 0f d0
	ldy index	; a683:0685	ac 0f d0
	cpy #$19	; a686:0688	c0 19
	bne loopa678	; a688:068a	d0 ee
	rts		; a68a:068c	60

sub_a68b jsr sub_a9ae	; a68b:068d	20 ae a9
	sta tmp4	; a68e:0690	8d ff 07
	and #$7f	; a691:0693	29 7f
	cmp #$20	; a693:0695	c9 20
	bcs skipa69f	; a695:0697	b0 08
	lda tmp4	; a697:0699	ad ff 07
	sta z_fe	; a69a:069c	85 fe
	jmp sub_a712	; a69c:069e	4c 12 a7

skipa69f lda mprint	; a69f:06a1	ad eb 07
	and #$0f	; a6a2:06a4	29 0f
	asl a		; a6a4:06a6	0a
	tax		; a6a5:06a7	aa
	lda pmodetbl,x	; a6a6:06a8	bd a0 40
	sta mod_a6b3+1	; a6a9:06ab	8d b4 a6
	inx		; a6ac:06ae	e8
	lda pmodetbl,x	; a6ad:06af	bd a0 40
	sta mod_a6b3+2	; a6b0:06b2	8d b5 a6
mod_a6b3:
	lda $ffff	; a6b3:06b5	ad ff ff
	beq skipa6cb	; a6b6:06b8	f0 13
	cmp #$ff	; a6b8:06ba	c9 ff
	beq skipa6cc	; a6ba:06bc	f0 10
gotoa6bc:
	sta z_fe	; a6bc:06be	85 fe
	jsr sub_a712	; a6be:06c0	20 12 a7
	inc mod_a6b3+1	; a6c1:06c3	ee b4 a6
	bne mod_a6b3	; a6c4:06c6	d0 ed
	inc mod_a6b3+2	; a6c6:06c8	ee b5 a6
	bne mod_a6b3	; a6c9:06cb	d0 e8
skipa6cb:
	rts		; a6cb:06cd	60

skipa6cc:
	jsr sub_a6d5	; a6cc:06ce	20 d5 a6
	lda tmp4	; a6cf:06d1	ad ff 07
	jmp gotoa6bc	; a6d2:06d4	4c bc a6
			;
sub_a6d5:
	ldx mspeed	; a6d5:06d7	ae ea 07
	beq skipa6dd	; a6d8:06da	f0 03
	jsr sub_a6f2	; a6da:06dc	20 f2 a6
skipa6dd:
	lda mkolor	; a6dd:06df	ad 0b d0
	beq skipa6f1	; a6e0:06e2	f0 0f
	ldx mcolor	; a6e2:06e4	ae ec 07
loopa6e5:
	inx		; a6e5:06e7	e8
	txa		; a6e6:06e8	8a
	and #$0f	; a6e7:06e9	29 0f
	beq loopa6e5	; a6e9:06eb	f0 fa
	sta lbl_a2eb	; a6eb:06ed	8d eb a2
	jsr jmp_a3c4	; a6ee:06f0	20 c4 a3
skipa6f1:
	rts		; a6f1:06f3	60

tenwait:		; &,22,.x - wait for .x/10 seconds
	cpx #$00	; a6f2:06f4	e0 00
	beq skipa701	; a6f4:06f6	f0 0b
loopa6f6:
	lda cia1dsec	; a6f6:06f8	ad 08 dc
loopa6f9:
	cmp cia1dsec	; a6f9:06fb	cd 08 dc
	beq loopa6f9	; a6fc:06fe	f0 fb
	dex		; a6fe:0700	ca
	bne loopa6f6	; a6ff:0701	d0 f5
skipa701:
	rts		; a701:0703	60

gotoa702:
	sta z_fe	; a702:0704	85 fe
xchrout:		; &,24
	tya		; a704:0706	98
	pha		; a705:0707	48
	txa		; a706:0708	8a
	pha		; a707:0709	48
	jsr gotoa74b	; a708:070a	20 4b a7
	pla		; a70b:070d	68
	tax		; a70c:070e	aa
	pla		; a70d:070f	68
	tay		; a70e:0710	a8
	lda z_fe	; a70f:0711	a5 fe
	rts		; a711:0713	60

sub_a712:		; &,55?
	jsr gotoa74b	; a712:0714	20 4b a7
	jsr sub_a871	; a715:0717	20 71 a8
	ldx #$a0	; a718:071a	a2 a0
	lda z_fe	; a71a:071c	a5 fe
	beq skipa735	; a71c:071e	f0 17
	cmp #$13	; a71e:0720	c9 13
	beq skipa739	; a720:0722	f0 17
gotoa722:
	ldx #$a0	; a722:0724	a2 a0
	cmp #$2f	; a724:0726	c9 2f
	beq skipa730	; a726:0728	f0 08
	cmp #$20	; a728:072a	c9 20
	beq skipa730	; a72a:072c	f0 04
	cmp #$03	; a72c:072e	c9 03
	bne skipa735	; a72e:0730	d0 05
skipa730:
	sta chat	; a730:0732	8d 06 d0
	ldx #$c1	; a733:0735	a2 c1	; A - Abort indicator
skipa735:
	stx videoram+32	; a735:0737	8e 20 04
	rts		; a738:073a	60

skipa739:
	lda #$d0	; a739:073b	a9 d0	; P - Pause indicator
	sta videoram+30	; a73b:073d	8d 1e 04
	jsr sub_a83f	; a73e:0740	20 3f a8
	lda #$a0	; a741:0743	a9 a0
	sta videoram+30	; a743:0745	8d 1e 04
	lda z_fe	; a746:0748	a5 fe
	jmp gotoa722	; a748:074a	4c 22 a7

gotoa74b:
	lda z_fe	; a74b:074d	a5 fe
	jsr sub_a9ae	; a74d:074f	20 ae a9
	sta z_fe	; a750:0752	85 fe
	and #$7f	; a752:0754	29 7f
	cmp #$20	; a754:0756	c9 20
	bcc skipa765	; a756:0758	90 0d
	ldx passmode	; a758:075a	ae fa 42
	beq skipa788	; a75b:075d	f0 2b
	lda mask	; a75d:075f	ad f2 42
	sta z_fe	; a760:0762	85 fe
	jmp skipa788	; a762:0764	4c 88 a7

skipa765:
	lda mci		; a765:0767	ad ef 07
	bpl skipa788	; a768:076a	10 1e
	lda z_fe	; a76a:076c	a5 fe
	jsr sub_a247	; a76c:076e	20 47 a2
	bcc skipa788	; a76f:0771	90 17
	ora #$40	; a771:0773	09 40
	pha		; a773:0775	48
	lda mreverse	; a774:0776	ad ee 07
	bne skipa785	; a777:0779	d0 0c
	lda #$12	; a779:077b	a9 12
	jsr sub_a786	; a77b:077d	20 86 a7
	pla		; a77e:0780	68
	jsr sub_a786	; a77f:0781	20 86 a7
	lda #$92	; a782:0784	a9 92
	pha		; a784:0786	48
skipa785:
	pla		; a785:0787	68
sub_a786:
	sta z_fe	; a786:0788	85 fe
skipa788:
	jsr outscn	; a788:078a	20 a6 b7
	ldx inchat	; a78b:078d	ae 07 d0

; called from new IERROR routine
	bne skipa795	; a78e:0790	d0 05
	jsr sub_a9f8	; a790:0792	20 f8 a9
	bne skipa798	; a793:0795	d0 03
skipa795:
	jsr outmod	; a795:0797	20 8d ba
skipa798:
	jmp gotoa79b	; a798:079a	4c 9b a7

gotoa79b:
	lda mprtr	; a79b:079d	ad ed 07
	bne skipa7a7	; a79e:07a0	d0 07
	lda chk_left	; a7a0:07a2	ad f4 07
	and #$40	; a7a3:07a5	29 40
	beq skipa7cd	; a7a5:07a7	f0 26
skipa7a7:
	lda z_fe	; a7a7:07a9	a5 fe
	and #$7f	; a7a9:07ab	29 7f
	cmp #$20	; a7ab:07ad	c9 20
lbl_a7ad:
	bcs skipa7b3	; a7ad:07af	b0 04
	cmp #$0d	; a7af:07b1	c9 0d
	bne skipa7cd	; a7b1:07b3	d0 1a
skipa7b3:
	ldx #$04	; a7b3:07b5	a2 04
	jsr chkout	; a7b5:07b7	20 c9 ff
	lda status	; a7b8:07ba	a5 90
	bmi skipa7ca	; a7ba:07bc	30 0e
	lda z_fe	; a7bc:07be	a5 fe
	jsr chrout	; a7be:07c0	20 d2 ff
	cmp #$0d	; a7c1:07c3	c9 0d
	bne skipa7ca	; a7c3:07c5	d0 05
	lda #$00	; a7c5:07c7	a9 00
	sta mprtr	; a7c7:07c9	8d ed 07
skipa7ca:
	jmp clrch	; a7ca:07cc	4c cc ff

skipa7cd:
	rts		; a7cd:07cf	60

sub_a7ce:
; output character in .a to modem
	sta ptr1	; a7ce:07d0	85 9e
	txa		; a7d0:07d2	8a
	pha		; a7d1:07d3	48
	tya		; a7d2:07d4	98
	pha		; a7d3:07d5	48
	jmp gotoa7f0	; a7d4:07d6	4c f0 a7

; called from new IBSOUT routine:
sub_a7d7:
	sta ptr1	; a7d7:07d9	85 9e
	txa		; a7d9:07db	8a
	pha		; a7da:07dc	48
	tya		; a7db:07dd	98
	pha		; a7dc:07de	48
	lda dfltno	; a7dd:07df	a5 9a
	cmp #$02	; a7df:07e1	c9 02	; rs232
	beq gotoa7f0	; a7e1:07e3	f0 0d
	ldx #$01	; a7e3:07e5	a2 01
	jsr setmode	; a7e5:07e7	20 99 b0
	lda ptr1	; a7e8:07ea	a5 9e
	jsr out_scrn	; a7ea:07ec	20 16 e7
	jmp gotoa80c	; a7ed:07ef	4c 0c a8

; output to modem:
gotoa7f0:
	lda scnmode	; a7f0:07f2	ad f3 42
	bne skipa807	; a7f3:07f5	d0 12

; update modem I/O window:
	ldx #$00	; a7f5:07f7	a2 00
loopa7f7:
	lda mask_bot+69,x;a7f7:07f9	bd dd 07
	sta mask_bot+68,x;a7fa:07fc	9d dc 07
	inx		; a7fd:07ff	e8
	cpx #$09	; a7fe:0800	e0 09
	bne loopa7f7	; a800:0802	d0 f5
	lda ptr1	; a802:0804	a5 9e
	sta mask_bot+77	; a804:0806	8d e5 07
skipa807:
	lda ptr1	; a807:0809	a5 9e
	jsr rsPutChar	; a809:080b	20 0c 43
gotoa80c:
	pla		; a80c:080e	68
	tay		; a80d:080f	a8
	pla		; a80e:0810	68
	tax		; a80f:0811	aa
	lda ptr1	; a810:0812	a5 9e
	clc		; a812:0814	18
	rts		; a813:0815	60

	sta ptr1	; a814:0816	85 9e
	txa		; a816:0818	8a
	pha		; a817:0819	48
	tya		; a818:081a	98
	pha		; a819:081b	48
	jmp skipa807	; a81a:081c	4c 07 a8

	lda #$0d 	; a81d:081f	a9 0d
	jmp gotoa702	; a81f:0821	4c 02 a7

	lda #$14	; a822:0824	a9 14
	jmp gotoa702	; a824:0826	4c 02 a7

xgetin:			; &,23
	jsr sub_a83f	; a827:0829	20 3f a8
	cmp #$13	; a82a:082c	c9 13
	beq xgetin	; a82c:082e	f0 f9
	cmp #pound	; a82e:0830	c9 5c
	bne skipa83e	; a830:0832	d0 0c
	lda editor	; a832:0834	ad 02 d0
	and #$08	; a835:0837	29 08
	bne skipa83c	; a837:0839	d0 03
	jmp xgetin	; a839:083b	4c 27 a8

skipa83c:
	lda #pound	; a83c:083e	a9 5c
skipa83e:
	rts		; a83e:0840	60

sub_a83f:
	jsr sub_a871	; a83f:0841	20 71 a8
	jsr carchk	; a842:0844	20 c4 a9
	bne skipa851	; a845:0847	d0 0a
	jsr jmp_aa08	; a847:0849	20 08 aa
	bne skipa851	; a84a:084c	d0 05
	lda z_fe	; a84c:084e	a5 fe
	beq sub_a83f	; a84e:0850	f0 ef
	rts		; a850:0852	60

skipa851:
	lda #$0d	; a851:0853	a9 0d
	rts		; a853:0855	60

tabla854:
	byte $80,$80,$00,$00
			; a854:0856

inchr:			; &,13
	jsr xgetin	; a858:085a	20 27 a8
	lda z_fe	; a85b:085d	a5 fe
	sta buffer	; a85d:085f	8d 77 ce
	lda #$01	; a860:0862	a9 01
	sta fac1	; a862:0864	85 61
	lda #<buffer	; a864:0866	a9 77
	sta fac1+1	; a866:0868	85 62
	lda #>buffer	; a868:086a	a9 ce
	sta fac1+2	; a86a:086c	85 63
	ldx #$00	; a86c:086e	a2 00
	jmp putvar	; a86e:0870	4c a5 b5

sub_a871:
	jsr getkbd	; a871:0873	20 49 a9
	bne skipa87e	; a874:0876	d0 08
	jsr sub_a9f8	; a876:0878	20 f8 a9
	bne skipa8b2	; a879:087b	d0 37
	jsr getmod	; a87b:087d	20 23 ba
skipa87e:
	cmp #$60	; a87e:0880	c9 60
	bcc skipa888	; a880:0882	90 06
	cmp #$80	; a882:0884	c9 80
	bcs skipa888	; a884:0886	b0 02
	adc #$60	; a886:0888	69 60
skipa888:
	cmp #$a0	; a888:088a	c9 a0
	bcc skipa892	; a88a:088c	90 06
	cmp #$bf	; a88c:088e	c9 bf
	bcs skipa892	; a88e:0890	b0 02
	adc #$40	; a890:0892	69 40
skipa892:
	cmp #$e0	; a892:0894	c9 e0
	bne skipa898	; a894:0896	d0 02
	lda #$20	; a896:0898	a9 20
skipa898:
	cmp #$de	; a898:089a	c9 de
	bne skipa89e	; a89a:089c	d0 02
	lda #$ff	; a89c:089e	a9 ff
skipa89e:
	tax		; a89e:08a0	aa
l_a89f:
	lda editor	; a89f:08a1	ad 02 d0
;	byte $29	; fixme: and #$01
;sub_a8a3:		; a8a2:08a4	29
;	byte $01	; $cd91 jmps here
			; a8a3:08a5	01
	bne skipa8b4	; a8a4:08a6	d0 0e
	cpx #$e0	; a8a6:08a8	e0 e0
	bcs skipa8b2	; a8a8:08aa	b0 08
	cpx #$7b	; a8aa:08ac	e0 7b
	bcc skipa8b4	; a8ac:08ae	90 06
	cpx #$80	; a8ae:08b0	e0 80
	bcs skipa8b4	; a8b0:08b2	b0 02
skipa8b2:
	ldx #$00	; a8b2:08b4	a2 00
skipa8b4:
	stx z_fe	; a8b4:08b6	86 fe
	lda curdisp	; a8b6:08b8	ad e4 42
	beq skipa8f7	; a8b9:08bb	f0 3c
	lda chk_left	; a8bb:08bd	ad f4 07
	and #$04	; a8be:08c0	29 04
	bne skipa8f7	; a8c0:08c2	d0 35
	lda idlejif	; a8c2:08c4	ad e0 42
	cmp #$3c	; a8c5:08c7	c9 3c
	bcc skipa8f7	; a8c7:08c9	90 2e
	lda #$00	; a8c9:08cb	a9 00
	sta idlejif	; a8cb:08cd	8d e0 42
	lda idlesec	; a8ce:08d0	ad e1 42
	ldx idleten	; a8d1:08d3	ae e2 42
	ldy idlemin	; a8d4:08d6	ac e3 42
	clc		; a8d7:08d9	18
	adc #$01	; a8d8:08da	69 01
	cmp #$0a	; a8da:08dc	c9 0a
	bcc skipa8f4	; a8dc:08de	90 16
	lda #$00	; a8de:08e0	a9 00
	inx		; a8e0:08e2	e8
	cpx #$06	; a8e1:08e3	e0 06
	bne skipa8f4	; a8e3:08e5	d0 0f
	ldx #$00	; a8e5:08e7	a2 00
	iny		; a8e7:08e9	c8
	cpy idlemax	; a8e8:08ea	cc 3e 03
	bcc skipa8f4	; a8eb:08ed	90 07
	pha		; a8ed:08ef	48
	lda #$00	; a8ee:08f0	a9 00
	sta tsr		; a8f0:08f2	8d 03 d0
	pla		; a8f3:08f5	68
skipa8f4:
	jsr sub_a91f	; a8f4:08f6	20 1f a9
skipa8f7:
	lda z_fe	; a8f7:08f9	a5 fe
	ldx case	; a8f9:08fb	ae 01 d0
	beq skipa908	; a8fc:08fe	f0 0a
	cmp #$41	; a8fe:0900	c9 41
	bcc skipa908	; a900:0902	90 06
	cmp #$5b	; a902:0904	c9 5b
	bcs skipa908	; a904:0906	b0 02
	ora #$80	; a906:0908	09 80
skipa908:
	ldx #$07	; a908:090a	a2 07
loopa90a:
	cmp spclchar,x ; a90a:090c	dd a6 a9
	beq skipa914	; a90d:090f	f0 05
	dex		; a90f:0911	ca
	bpl loopa90a	; a910:0912	10 f8
	bmi skipa91c	; a912:0914	30 08
skipa914:
	cpx #$06	; a914:0916	e0 06
	beq skipa91c	; a916:0918	f0 04
	txa		; a918:091a	8a
	clc		; a919:091b	18
	adc #$85	; a91a:091c	69 85
skipa91c:
	sta z_fe	; a91c:091e	85 fe
	rts		; a91e:0920	60

sub_a91f:
	sta idlesec	; a91f:0921	8d e1 42
	stx idleten	; a922:0924	8e e2 42
	sty idlemin	; a925:0927	8c e3 42
	lda scnmode	; a928:092a	ad f3 42
	bne skipa948	; a92b:092d	d0 1b
	lda curdisp	; a92d:092f	ad e4 42
	cmp #$01	; a930:0932	c9 01
	bne skipa948	; a932:0934	d0 14
	lda idlesec	; a934:0936	ad e1 42
	ora #$b0	; a937:0939	09 b0
	sta videoram+225; a939:093b	8d e1 04
	txa		; a93c:093e	8a
	ora #$b0	; a93d:093f	09 b0
	sta videoram+224; a93f:0941	8d e0 04
	tya		; a942:0944	98
	ora #$b0	; a943:0945	09 b0
	sta videoram+222; a945:0947	8d de 04
skipa948:
	rts		; a948:094a	60

getkbd:			&,48
	jsr sub_ad6c	; a949:094b	20 6c ad
	jsr $f142	; a94c:094e	20 42 f1
	cmp #$85	; a94f:0951	c9 85
	bcc skipa959	; a951:0953	90 06
	cmp #$8d	; a953:0955	c9 8d
	bcs skipa959	; a955:0957	b0 02
	lda #$00	; a957:0959	a9 00
skipa959:
	cmp #$00	; a959:095b	c9 00
	rts		; a95b:095d	60

getmdm:			; &,4 / &,26
	jsr rsEnable	; a95c:095e	20 03 43
	sec		; a95f:0961	38
	jsr rsGetChar	; a960:0962	20 09 43
	bcs skipa9a3	; a963:0965	b0 3e
	pha		; a965:0967	48
	lda bar		; a966:0968	ad e5 42
	and #$01	; a969:096b	29 01
	beq skipa971	; a96b:096d	f0 04
	pla		; a96d:096f	68
	and #$7f	; a96e:0970	29 7f
	pha		; a970:0972	48
skipa971:
	lda scnmode	; a971:0973	ad f3 42
	bne skipa9a1	; a974:0976	d0 2b
	ldy #$00	; a976:0978	a0 00
	lda chk_right	; a978:097a	ad f5 07
	and #$01	; a97b:097d	29 01
	beq skipa981	; a97d:097f	f0 02
	ldy #$06	; a97f:0981	a0 06
skipa981:
	lda mask_bot+43,y;a981:0983	b9 c3 07
	sta mask_bot+42,y;a984:0986	99 c2 07
	iny		; a987:0989	c8
	cpy #$09	; a988:098a	c0 09
	bne skipa98	; a98a:098c	d0 f5
	pla		; a98c:098e	68
	pha		; a98d:098f	48
	and #$7f	; a98e:0990	29 7f
	cmp #$20	; a990:0992	c9 20
	pla		; a992:0994	68
	pha		; a993:0995	48
	bcc skipa99e	; a994:0996	90 08
	ldx passmode	; a996:0998	ae fa 42
	beq skipa99e	; a999:099b	f0 03
	lda mask	; a99b:099d	ad f2 42
skipa99e:
	sta mask_bot+51 ; a99e:09a0	8d cb 07
skipa9a1:
	pla		; a9a1:09a3	68
	rts		; a9a2:09a4	60

skipa9a3:
	lda #$00	; a9a3:09a5	a9 00
	rts		; a9a5:09a7	60

spclchar:
	ascii ",:{34}*?={13}^"
			; a9a6:09a8	tbl-a9ad

a9ae:09b0	c9 85	sub_a9ae cmp #$85
a9b0:09b2	90 11		bcc skipa9c3
a9b2:09b4	c9 8d		cmp #$8d
a9b4:09b6	b0 0d		bcs skipa9c3
a9b6:09b8	8e f8 42		stx cxsav
a9b9:09bb	38		sec
a9ba:09bc	e9 85		sbc #$85
a9bc:09be	aa		tax
a9bd:09bf	bd a6 a9		lda spclchar,x
a9c0:09c2	ae f8 42		ldx cxsav
a9c3:09c5	60	skipa9c3 rts

carchk:		; &,47
	lda local	; a9c4:09c6	ad 00 d0
	bne skipa9ef    ; a9c7:09c9	d0 26
	lda chk_left    ; a9c9:09cb	ad f4 07
	and #$04        ; a9cc:09ce	29 04
	bne skipa9ef    ; a9ce:09d0	d0 1f
	jsr sub_a9f2    ; a9d0:09d2	20 f2 a9
	beq skipa9e0    ; a9d3:09d5	f0 0b
	lda #$00        ; a9d5:09d7	a9 00
	sta tsr         ; a9d7:09d9	8d 03 d0
	jsr sub_afdc    ; a9da:09dc	20 dc af
	lda #$01        ; a9dd:09df	a9 01
	rts             ; a9df:09e1	60

skipa9e0:
	lda tsr		; a9e0:09e2	ad 03 d0
	bne skipa9ef    ; a9e3:09e5	d0 0a
	lda editor      ; a9e5:09e7	ad 02 d0
	and #$40        ; a9e8:09ea	29 40
	bne skipa9ef    ; a9ea:09ec	d0 03
	lda #$02        ; a9ec:09ee	a9 02
	rts             ; a9ee:09f0	60

skipa9ef:
	lda #$00	; a9ef:09f1	a9 00
	rts             ; a9f1:09f3	60

sub_a9f2:
	lda carrst	; a9f2:09f4	ad f1 07
	and #$7f        ; a9f5:09f7	29 7f
	rts             ; a9f7:09f9	60

sub_a9f8:
	lda chk_left	; a9f8:09fa	ad f4 07
	and #$04        ; a9fb:09fd	29 04
	bne skipaa07    ; a9fd:09ff	d0 08
	lda local       ; a9ff:0a01	ad 00 d0
	bne skipaa07    ; aa02:0a04	d0 03
	jmp sub_a9f2    ; aa04:0a06	4c f2 a9

skipaa07:
	rts		; aa07:0a09	60

jmp_aa08:		; &,43
	lda chk_left	; aa08:0a0a	ad f4 07
	and #$10        ; aa0b:0a0d	29 10
	rts             ; aa0d:0a0f	60

aa0e:0a10	tbl-aa11 lbl_aa0e byte $77

aa0f:0a11		lbl_aa0f byte $d1

aa10:0a12		lbl_aa10 byte $2f

aa11:0a13		lbl_aa11 byte $88

gotoaa12:
	ldx #$00	; aa12:0a14	a2 00
	ldy #$c0        ; aa14:0a16	a0 c0
	jsr sub_aa36    ; aa16:0a18	20 36 aa
	clc             ; aa19:0a1b	18
	lda lbl_aa0f    ; aa1a:0a1c	ad 0f aa
	adc lbl_aa10    ; aa1d:0a1f	6d 10 aa
	bne skipaa2b    ; aa20:0a22	d0 09
	lda lbl_aa0e    ; aa22:0a24	ad 0e aa
	adc lbl_aa11    ; aa25:0a27	6d 11 aa
	bne skipaa2b    ; aa28:0a2a	d0 01
	rts             ; aa2a:0a2c	60

aa2b:0a2d	a2 00	skipaa2b ldx #$00		; clear proto area
aa2d:0a2f	a9 60		lda #$60
aa2f:0a31	9d 00 c0 loopaa2f sta lbl_c000,x
aa32:0a34	ca		dex
aa33:0a35	d0 fa		bne loopaa2f
aa35:0a37	60		rts

aa36:0a38	86 ac	sub_aa36 stx sal
aa38:0a3a	84 ad		sty sal+1
aa3a:0a3c	c9 00		cmp #$00
aa3c:0a3e	d0 02		bne skipaa40
aa3e:0a40	a9 08		lda #$08
aa40:0a42	8d f7 07 skipaa40 sta filenum
aa43:0a45	a2 01		ldx #$01
aa45:0a47	20 91 b5		jsr usevar
aa48:0a4a	a9 00		lda #$00
aa4a:0a4c	20 90 ff		jsr setmsg
aa4d:0a4f	a9 01		lda #$01
aa4f:0a51	ae f7 07		ldx filenum
aa52:0a54	a0 00		ldy #$00
aa54:0a56	20 ba ff		jsr setlfs
aa57:0a59	a5 61		lda fac1
aa59:0a5b	a6 62		ldx fac1+1
aa5b:0a5d	a4 63		ldy fac1+2
aa5d:0a5f	20 bd ff		jsr setname
aa60:0a62	a9 00		lda #$00
aa62:0a64	a6 ac		ldx sal
aa64:0a66	a4 ad		ldy sal+1
aa66:0a68	20 06 43		jsr rsDisable
aa69:0a6b	20 d5 ff		jsr load
aa6c:0a6e	08		php
aa6d:0a6f	20 03 43		jsr rsEnable
aa70:0a72	28		plp
aa71:0a73	60		rts

aa72:0a74	20 36 aa sub_aa72 jsr sub_aa36
aa75:0a77	b0 09		bcs skipaa80
aa77:0a79	86 71		stx fbufpt
aa79:0a7b	84 72		sty fbufpt+1
aa7b:0a7d	a0 00		ldy #$00
aa7d:0a7f	98		tya
aa7e:0a80	91 71		sta (fbufpt),y
aa80:0a82	60	skipaa80 rts

aa81:0a83	4c 12 aa loopaa81 jmp gotoaa12

prg:			; &,7
	lda lbl_aa0e	; aa84:0a86	ad 0e aa
	and #$0f	; aa87:0a89	29 0f
	sta $02ff	; aa89:0a8b	8d ff 02
	lda lbl_aa0f	; aa8c:0a8e	ad 0f aa
	sta bsnvallo	; aa8f:0a91	8d fe 02
	txa		; aa92:0a94	8a
	cpy #$01	; aa93:0a95	c0 01
	beq skipaacc	; aa95:0a97	f0 35
	cpy #$02	; aa97:0a99	c0 02
	beq loopaa81	; aa99:0a9b	f0 e6
	cpy #$03	; aa9b:0a9d	c0 03
	beq skipaac5	; aa9d:0a9f	f0 26
	cpy #$04	; aa9f:0aa1	c0 04
	beq skipaabe	; aaa1:0aa3	f0 1b
	ldx txttab	; aaa3:0aa5	a6 2b
	ldy txttab+1	; aaa5:0aa7	a4 2c
	jsr sub_aa72	; aaa7:0aa9	20 72 aa
	bcc skipaaad	; aaaa:0aac	90 01
	rts		; aaac:0aae	60

skipaaad:
	ldx txttab	; aaad:0aaf	a6 2b
	ldy txttab+1	; aaaf:0ab1	a4 2c
	stx sal	 ; aab1:0ab3	86 ac
	sty sal+1	; aab3:0ab5	84 ad
	ldx #$01	; aab5:0ab7	a2 01
	ldy #$46	; aab7:0ab9	a0 46
	jmp gotoaafb	; aab9:0abb	4c fb aa

lbl_aabc:
	byte $01	; aabc:0abe	01
lbl_aabd:
	byte $30	; aabd:0abf	30

skipaabe:
	ldx #$01	; aabe:0ac0	a2 01
	ldy #$10	; aac0:0ac2	a0 10
	jmp gotoaad0	; aac2:0ac4	4c d0 aa

skipaac5:
	ldx #$01	; aac5:0ac7	a2 01
	ldy #$20	; aac7:0ac9	a0 20
	jmp gotoaad0	; aac9:0acb	4c d0 aa

skipaacc:
	ldx #$01	; aacc:0ace	a2 01
	ldy #$30	; aace:0ad0	a0 30
gotoaad0:
	stx lbl_aabc	; aad0:0ad2	8e bc aa
	sty lbl_aabd	; aad3:0ad5	8c bd aa
	jsr sub_aa72	; aad6:0ad8	20 72 aa
	bcc skipaadc	; aad9:0adb	90 01
	rts		; aadb:0add	60

skipaadc:
	ldx txttab	; aadc:0ade	a6 2b
	ldy txttab+1	; aade:0ae0	a4 2c
	stx sal	 ; aae0:0ae2	86 ac
	sty sal+1	; aae2:0ae4	84 ad
	ldx lbl_aabc	; aae4:0ae6	ae bc aa
	ldy lbl_aabd	; aae7:0ae9	ac bd aa
	jsr gotoaafb	; aaea:0aec	20 fb aa
	ldx lbl_aabc	; aaed:0aef	ae bc aa
	ldy lbl_aabd	; aaf0:0af2	ac bd aa
	stx sal	 ; aaf3:0af5	86 ac
	sty sal+1	; aaf5:0af7	84 ad
	ldx #$01	; aaf7:0af9	a2 01
	ldy #$46	; aaf9:0afb	a0 46
gotoaafb:
	txa		; aafb:0afd	8a
	pha		; aafc:0afe	48
	tya		; aafd:0aff	98
	pha		; aafe:0b00	48
	lda txttab	; aaff:0b01	a5 2b
	pha		; ab01:0b03	48
	lda txttab+1	; ab02:0b04	a5 2c
	pha		; ab04:0b06	48
	ldx sal	 ; ab05:0b07	a6 ac
	ldy sal+1	; ab07:0b09	a4 ad
	stx txttab	; ab09:0b0b	86 2b
	sty txttab+1	; ab0b:0b0d	84 2c
	jsr sub_cd5c	; ab0d:0b0f	20 5c cd
	pla		; ab10:0b12	68
	sta txttab+1	; ab11:0b13	85 2c
	pla		; ab13:0b15	68
	sta txttab	; ab14:0b16	85 2b
gotoab16:
	ldy #$00	; ab16:0b18	a0 00
	lda (sal),y	; ab18:0b1a	b1 ac
	sta fbufpt	; ab1a:0b1c	85 71
	iny		; ab1c:0b1e	c8
	lda (sal),y	; ab1d:0b1f	b1 ac
	sta fbufpt+1	; ab1f:0b21	85 72
	sta fbufpt+1	; ab21:0b23	85 72
	lda (fbufpt),y  ; ab23:0b25	b1 71
	beq skipab32	; ab25:0b27	f0 0b
	lda fbufpt	; ab27:0b29	a5 71
	sta sal	 ; ab29:0b2b	85 ac
	lda fbufpt+1	; ab2b:0b2d	a5 72
	sta sal+1	; ab2d:0b2f	85 ad
	jmp gotoab16	; ab2f:0b31	4c 16 ab

skipab32:
	pla		; ab32:0b34	68
	sta (sal),y	; ab33:0b35	91 ac
	dey		; ab35:0b37	88
	pla		; ab36:0b38	68
	sta (sal),y	; ab37:0b39	91 ac
	rts		; ab39:0b3b	60

dskdir:			; &,8
	sty dflag	; ab3a:0b3c	8c f4 42
	cpx #$00	; ab3d:0b3f	e0 00
	beq skipab44	; ab3f:0b41	f0 03
	stx filenum	; ab41:0b43	8e f7 07
skipab44:
	cpy #$00	; ab44:0b46	c0 00
	bne skipab54	; ab46:0b48	d0 0c
	ldx filenum	; ab48:0b4a	ae f7 07
	jsr chkin	; ab4b:0b4d	20 c6 ff
	jsr getin	; ab4e:0b50	20 e4 ff
	jsr getin	; ab51:0b53	20 e4 ff
skipab54:
	jsr sub_ab75	; ab54:0b56	20 75 ab
	lda status	; ab57:0b59	a5 90
	bne skipab74	; ab59:0b5b	d0 19
	lda dflag	; ab5b:0b5d	ad f4 42
	bne skipab74	; ab5e:0b60	d0 14
	jsr minusone	; ab60:0b62	20 c4 b5
	ldx #$0f	; ab63:0b65	a2 0f
	jsr putvar	; ab65:0b67	20 a5 b5
	jsr outastr	; ab68:0b6a	20 67 b5
	ldx #$11	; ab6b:0b6d	a2 11
	jsr usevar	; ab6d:0b6f	20 91 b5
	lda fac1	; ab70:0b72	a5 61
	beq skipab54	; ab72:0b74	f0 e0
skipab74:
	rts		; ab74:0b76	60

sub_ab75:
	jsr rsDisable  ; ab75:0b77	20 06 43
	ldx filenum	; ab78:0b7a	ae f7 07
	jsr chkin	; ab7b:0b7d	20 c6 ff
	jsr getin	; ab7e:0b80	20 e4 ff
	jsr getin	; ab81:0b83	20 e4 ff
	jsr getin	; ab84:0b86	20 e4 ff
	pha		; ab87:0b89	48
	jsr getin	; ab88:0b8a	20 e4 ff
	tax		; ab8b:0b8d	aa
	pla		; ab8c:0b8e	68
	jsr sub_b61c	; ab8d:0b8f	20 1c b6
	ldy #$00	; ab90:0b92	a0 00
	ldx #$00	; ab92:0b94	a2 00
loopab94:
	lda lbl_cedb,y ; ab94:0b96	b9 db ce
	cmp #$30	; ab97:0b99	c9 30
	beq skipab9c	; ab99:0b9b	f0 01
	inx		; ab9b:0b9d	e8
skipab9c:
	cpx #$00	; ab9c:0b9e	e0 00
	bne skipaba2	; ab9e:0ba0	d0 02
	lda #$20	; aba0:0ba2	a9 20
skipaba2:
	sta buffer2,y  ; aba2:0ba4	99 27 ce
	iny		; aba5:0ba7	c8
	cpy #$05	; aba6:0ba8	c0 05
	bcc loopab94	; aba8:0baa	90 ea
	ldy #$05	; abaa:0bac	a0 05
	lda #$20	; abac:0bae	a9 20
	sta buffer2,y	; abae:0bb0	99 27 ce
	iny		; abb1:0bb3	c8
loopabb2:
	jsr getin	; abb2:0bb4	20 e4 ff
	cmp #$20	; abb5:0bb7	c9 20
	beq loopabb2	; abb7:0bb9	f0 f9
	sta buffer2,y	; abb9:0bbb	99 27 ce
	iny		; abbc:0bbe	c8
loopabbd:
	jsr getin	; abbd:0bbf	20 e4 ff
	beq skipabca	; abc0:0bc2	f0 08
	sta buffer2,y	; abc2:0bc4	99 27 ce
	iny		; abc5:0bc7	c8
	lda status	; abc6:0bc8	a5 90
	beq loopabbd	; abc8:0bca	f0 f3
skipabca:
	sty fac1	; abca:0bcc	84 61
	lda #$27	; abcc:0bce	a9 27
	sta fac1+1	; abce:0bd0	85 62
	lda #$ce	; abd0:0bd2	a9 ce
	sta fac1+2	; abd2:0bd4	85 63
	ldx #$01	; abd4:0bd6	a2 01
	jsr putvar	; abd6:0bd8	20 a5 b5
	jmp rsEnable	; abd9:0bdb	4c 03 43

dskin:
	cpx #$00	; abdc:0bde	e0 00
	bne skipabe3	; abde:0be0	d0 03
	stx filenum	; abe0:0be2	8e f7 07
skipabe3:
	cpy #$00	; abe3:0be5	c0 00
	bne skipac2d	; abe5:0be7	d0 46
	jsr rsDisable	; abe7:0be9	20 06 43
	jsr chkin	; abea:0bec	20 c6 ff
	lda #$00	; abed:0bef	a9 00
	sta index	; abef:0bf1	8d 0f d0
loopabf2:
	jsr getin	; abf2:0bf4	20 e4 ff
	ldy index	; abf5:0bf7	ac 0f d0
	cmp #$0d	; abf8:0bfa	c9 0d
	beq skipac18	; abfa:0bfc	f0 1c
	sta buffer2,y	; abfc:0bfe	99 27 ce
	iny		; abff:0c01	c8
	sty index	; ac00:0c02	8c 0f d0
	cpy #$50	; ac03:0c05	c0 50
	bcs skipac18	; ac05:0c07	b0 11
	lda status	; ac07:0c09	a5 90
	and #$42	; ac09:0c0b	29 42
	beq loopabf2	; ac0b:0c0d	f0 e5
	lda #$5e	; ac0d:0c0f	a9 5e
	sta buffer2	; ac0f:0c11	8d 27 ce
	lda #$40	; ac12:0c14	a9 40
	sta status	; ac14:0c16	85 90
	ldy #$01	; ac16:0c18	a0 01
skipac18:
	sty fac1	; ac18:0c1a	84 61
	lda #$27	; ac1a:0c1c	a9 27
	sta fac1+1	; ac1c:0c1e	85 62
	lda #$ce	; ac1e:0c20	a9 ce
	sta fac1+2	; ac20:0c22	85 63
	ldx #$01	; ac22:0c24	a2 01
	jsr putvar	; ac24:0c26	20 a5 b5
	jsr clrch	; ac27:0c29	20 cc ff
	jmp rsEnable	; ac2a:0c2c	4c 03 43

skipac2d:
	jsr rsDisable	; ac2d:0c2f	20 06 43
	jsr chkin	; ac30:0c32	20 c6 ff
	cpy #$50	; ac33:0c35	c0 50
	bcc skipac39	; ac35:0c37	90 02
	ldy #$50	; ac37:0c39	a0 50
skipac39:
	sty index	; ac39:0c3b	8c 0f d0


	ldy #$00	; ac3c:0c3e	a0 00
loopac3e:
	jsr chrin	; ac3e:0c40	20 cf ff
	sta buffer2,y	; ac41:0c43	99 27 ce
	iny		; ac44:0c46	c8
	cpy index	; ac45:0c47	cc 0f d0
	bne loopac3e	; ac48:0c4a	d0 f4
	jmp skipac18	; ac4a:0c4c	4c 18 ac

mod_ac4d:
	brk		; ac4d:0c4f	00
sub_ac4e:
	jsr inctime	; ac4e:0c50	20 ea ff
	ldx ndx		; ac51:0c53	a6 c6
	bne skipaca3	; ac53:0c55	d0 4e
	lda mod_ac4d	; ac55:0c57	ad 4d ac
	bne skipaca0	; ac58:0c5a	d0 46
	lda #$05	; ac5a:0c5c	a9 05
	sta mod_ac4d	; ac5c:0c5e	8d 4d ac
	lda cia1prta	; ac5f:0c61	ad 00 dc
	pha		; ac62:0c64	48
	and #$01	; ac63:0c65	29 01
	bne skipac6d	; ac65:0c67	d0 06
	lda #$91	; ac67:0c69	a9 91
	sta keyd,x	; ac69:0c6b	9d 77 02
	inx		; ac6c:0c6e	e8
skipac6d:
	pla		; ac6d:0c6f	68
	pha		; ac6e:0c70	48
	and #$02	; ac6f:0c71	29 02
	bne skipac79	; ac71:0c73	d0 06
	lda #$11	; ac73:0c75	a9 11
	sta keyd,x	; ac75:0c77	9d 77 02
	inx		; ac78:0c7a	e8
skipac79:
	pla		; ac79:0c7b	68
	pha		; ac7a:0c7c	48
	and #$04	; ac7b:0c7d	29 04
	bne skipac85	; ac7d:0c7f	d0 06
	lda #$9d	; ac7f:0c81	a9 9d
	sta keyd,x	; ac81:0c83	9d 77 02
	inx		; ac84:0c86	e8
skipac85:
	pla		; ac85:0c87	68
	pha		; ac86:0c88	48
	and #$08	; ac87:0c89	29 08
	bne skipac91	; ac89:0c8b	d0 06
	lda #$1d	; ac8b:0c8d	a9 1d
	sta keyd,x	; ac8d:0c8f	9d 77 02
	inx		; ac90:0c92	e8
skipac91:
	pla		; ac91:0c93	68
	pha		; ac92:0c94	48
	and #$10	; ac93:0c95	29 10
	bne skipac9d	; ac95:0c97	d0 06
	lda #$20	; ac97:0c99	a9 20
	sta keyd,x	; ac99:0c9b	9d 77 02
	inx		; ac9c:0c9e	e8
skipac9d:
	pla		; ac9d:0c9f	68
	stx ndx	 ; ac9e:0ca0	86 c6
skipaca0:
	dec mod_ac4d  ; aca0:0ca2	ce 4d ac
skipaca3:
	lda blnsw	; aca3:0ca5	a5 cc
	bne skipacd0	; aca5:0ca7	d0 29
	dec blnct	; aca7:0ca9	c6 cd
	bne skipacd0	; aca9:0cab	d0 25
	lda #$14	; acab:0cad	a9 14
	sta blnct	; acad:0caf	85 cd
	ldy pntr	; acaf:0cb1	a4 d3
	lsr blnon	; acb1:0cb3	46 cf
	ldx gdcol	; acb3:0cb5	ae 87 02
	lda (pnt),y	; acb6:0cb8	b1 d1
	bcs skipaccb	; acb8:0cba	b0 11
	inc blnon	; acba:0cbc	e6 cf
	sta gdbln	; acbc:0cbe	85 ce
	jsr $ea24	; acbe:0cc0	20 24 ea
	lda (user),y	; acc1:0cc3	b1 f3
	sta gdcol	; acc3:0cc5	8d 87 02
	ldx color	; acc6:0cc8	ae 86 02
	lda gdbln	; acc9:0ccb	a5 ce
skipaccb:
	eor #$80	; accb:0ccd	49 80
	jsr var_ea1c	; accd:0ccf	20 1c ea
skipacd0:
	jsr var_ea87  ; acd0:0cd2	20 87 ea
	inc mod_acf2+1	; acd3:0cd5	ee f3 ac; modifies branch instruction
	inc mod_acf2+1	; acd6:0cd8	ee f3 ac; to jump to different tasks
	inc mod_acf2+1	; acd9:0cdb	ee f3 ac; during cursor blink, apparently
	inc idlejif	; acdc:0cde	ee e0 42
	lda mupcase	; acdf:0ce1	ad 0c d0
	lsr a		; ace2:0ce4	4a
	ror a		; ace3:0ce5	6a
	eor #$ff	; ace4:0ce6	49 ff
	cmp lbl_afaa	; ace6:0ce8	cd aa af; serial # related
	beq skipacf1	; ace9:0ceb	f0 06
	sta lbl_afaa	; aceb:0ced	8d aa af
	jsr sub_aed3	; acee:0cf0	20 d3 ae
skipacf1:
	clc		; acf1:0cf3	18

; infinite loop unless modified
mod_acf2:
	bcc skipacf1	; acf2:0cf4	90 fd
	jmp gotoad0f	; acf4:0cf6	4c 0f ad

lbl_acf7:
	jmp gotoadcb	; acf7:0cf9	4c cb ad

lbl_acfa:
	jmp gotob01c	; acfa:0cfc	4c 1c b0

lbl_acfd:
	jmp gotob1d2	; acfd:0cff	4c d2 b1

; modem carrier status stuff?
lbl_ad00:
	jmp gotob21d	; ad00:0d02	4c 1d b2
lbl_ad03:
	jmp mod_b24f	; ad03:0d05	4c 4f b2
lbl_ad06:
	jmp gotob01c	; ad06:0d08	4c 1c b0

; reset task pointer?
	lda #$fd	; ad09:0d0b	a9 fd
	sta mod_acf2+1  ; ad0b:0d0d	8d f3 ac
	rts		; ad0e:0d10	60

gotoad0f:
	dec lbl_adca	; ad0f:0d11	ce ca ad
	bpl skipad19	; ad12:0d14	10 05
	lda #$04	; ad14:0d16	a9 04
	sta lbl_adca	; ad16:0d18	8d ca ad
skipad19:
	dec var_42ec	; ad19:0d1b	ce ec 42
	bpl skipad23	; ad1c:0d1e	10 05
	lda #$05	; ad1e:0d20	a9 05
	sta var_42ec	; ad20:0d22	8d ec 42
skipad23:
	ldx var_42ec	; ad23:0d25	ae ec 42
	lda scnmode	; ad26:0d28	ad f3 42
	bne skipad3d	; ad29:0d2b	d0 12
	lda chatpage	; ad2b:0d2d	ad 08 d0
	bne skipad32	; ad2e:0d30	d0 02
	ldx #$00	; ad30:0d32	a2 00
skipad32:
	lda colortbl,x	; ad32:0d34	bd c4 ad
	ldx #$0f	; ad35:0d37	a2 0f
loopad37:
	sta colorram+972,x;ad37:0d39	9d cc db
	dex		; ad3a:0d3c	ca
	bpl loopad37	; ad3b:0d3d	10 fa
skipad3d:
	lda #$00	; ad3d:0d3f	a9 00
	beq skipad6b	; ad3f:0d41	f0 2a
	lda lbl_b9c8	; ad41:0d43	ad c8 b9
	cmp lbl_b9c6	; ad44:0d46	cd c6 b9
	bcc skipad6b	; ad47:0d49	90 22
lbl_0d4b:
	cmp lbl_b9c7	; ad49:0d4b	cd c7 b9
	beq skipad50	; ad4c:0d4e	f0 02
	bcs skipad6b	; ad4e:0d50	b0 1b
skipad50:
	lda lbl_adca	; ad50:0d52	ad ca ad
	and #$02	; ad53:0d55	29 02
	tax		; ad55:0d57	aa
	lda key	 ; ad56:0d58	ad ea 42
	cpx #$00	; ad59:0d5b	e0 00
	beq skipad5f	; ad5b:0d5d	f0 02
	eor #$80	; ad5d:0d5f	49 80
skipad5f:
	ldx mcolor	; ad5f:0d61	ae ec 07
sub_ad62:
	ldy zp_02	; ad62:0d64	a4 02
lbl_ad64:
	sta var_0518,y ; ad64:0d66	99 18 05
	txa		; ad67:0d69	8a
lbl_ad68:
	sta colorram+280,y; ad68:0d6a	99 18 d9
skipad6b:
	rts		; ad6b:0d6d	60

sub_ad6c:
	lda skipad3d+1	; ad6c:0d6e	ad 3e ad
	bne skipadaa	; ad6f:0d71	d0 39
	lda lbl_b9c8	; ad71:0d73	ad c8 b9
	cmp lbl_b9c6	; ad74:0d76	cd c6 b9
	bcc skipadaa	; ad77:0d79	90 31
	cmp lbl_b9c7	; ad79:0d7b	cd c7 b9
	beq skipad80	; ad7c:0d7e	f0 02
	bcs skipadaa	; ad7e:0d80	b0 2a
skipad80:
	ldy zp_02	; ad80:0d82	a4 02
lbl_ad82:
	lda lbl_ad64+1 ; ad82:0d84	ad 65 ad
	sta z_fb	; ad85:0d87	85 fb
	lda lbl_ad64+2  ; ad87:0d89	ad 66 ad
	sta z_fc	; ad8a:0d8c	85 fc
	lda (z_fb),y	; ad8c:0d8e	b1 fb
	sta key	 ; ad8e:0d90	8d ea 42
	lda lbl_ad68+1  ; ad91:0d93	ad 69 ad
	sta z_fb	; ad94:0d96	85 fb
	lda lbl_ad68+2  ; ad96:0d98	ad 6a ad
	sta z_fc	; ad99:0d9b	85 fc
	lda (z_fb),y	; ad9b:0d9d	b1 fb
lbl_ad9d:
	sta shft	; ad9d:0d9f	8d eb 42
	lda #$01	; ada0:0da2	a9 01
	sta skipad3d+1  ; ada2:0da4	8d 3e ad
	lda #$03	; ada5:0da7	a9 03
	sta lbl_adca	; ada7:0da9	8d ca ad
skipadaa:
	jmp skipad3d	; adaa:0dac	4c 3d ad

sub_adad:
	php		; adad:0daf	08
	sei		; adae:0db0	78
	lda skipad3d+1  ; adaf:0db1	ad 3e ad
	beq skipadc2	; adb2:0db4	f0 0e
	lda #$00	; adb4:0db6	a9 00
	sta skipad3d+1  ; adb6:0db8	8d 3e ad
	lda key		; adb9:0dbb	ad ea 42
	ldx shft	; adbc:0dbe	ae eb 42
	jsr sub_ad62	; adbf:0dc1	20 62 ad
skipadc2:
	plp		; adc2:0dc4	28
	rts		; adc3:0dc5	60

adc4:0dc6	tbl-adc9 colortbl byte $0e,$03,$01,$03,$0e,$06

lbl_adca:
	brk		; adca:0dcc	00
gotoadcb:
	lda cia1min	; adcb:0dcd	ad 0a dc
	cmp ha577	; adce:0dd0	cd f1 42
	beq skipae3c	; add1:0dd3	f0 69
	sta ha577	; add3:0dd5	8d f1 42
	sta lbl_cecc	; add6:0dd8	8d cc ce
	jsr sub_afc7	; add9:0ddb	20 c7 af
	lda cia1hour	; addc:0dde	ad 0b dc
	sta lbl_cecb	; addf:0de1	8d cb ce
	ldx cia1dsec	; ade2:0de4	ae 08 dc
	cmp #$12	; ade5:0de7	c9 12
	bne skipae39	; ade7:0de9	d0 50
	lda lbl_cecc	; ade9:0deb	ad cc ce
	bne skipae39	; adec:0dee	d0 4b
	inc lbl_cec7	; adee:0df0	ee c7 ce
	lda lbl_cec7	; adf1:0df3	ad c7 ce
	cmp #$08	; adf4:0df6	c9 08
	bcc skipadfd	; adf6:0df8	90 05
	lda #$01	; adf8:0dfa	a9 01
	sta lbl_cec7	; adfa:0dfc	8d c7 ce
skipadfd:
	ldy lbl_cec8	; adfd:0dff	ac c8 ce
	lda lbl_cec9	; ae00:0e02	ad c9 ce
	cmp lbl_ced0,y  ; ae03:0e05	d9 d0 ce
	bne skipae17	; ae06:0e08	d0 0f
	lda #$00	; ae08:0e0a	a9 00
	sta lbl_cec9	; ae0a:0e0c	8d c9 ce
	lda lbl_cec8	; ae0d:0e0f	ad c8 ce
	sed		; ae10:0e12	f8
	clc		; ae11:0e13	18
	adc #$01	; ae12:0e14	69 01
	sta lbl_cec8	; ae14:0e16	8d c8 ce
skipae17:
	lda lbl_cec9	; ae17:0e19	ad c9 ce
	sed		; ae1a:0e1c	f8
	clc		; ae1b:0e1d	18
	adc #$01	; ae1c:0e1e	69 01
	sta lbl_cec9	; ae1e:0e20	8d c9 ce
	cld		; ae21:0e23	d8
	lda lbl_cec8	; ae22:0e24	ad c8 ce
	cmp #$13	; ae25:0e27	c9 13
	bne skipae38	; ae27:0e29	d0 0f
	lda #$01	; ae29:0e2b	a9 01
	sta lbl_cec8	; ae2b:0e2d	8d c8 ce
	lda lbl_ceca	; ae2e:0e30	ad ca ce
	sed		; ae31:0e33	f8
	clc		; ae32:0e34	18
	adc #$01	; ae33:0e35	69 01
	sta lbl_ceca	; ae35:0e37	8d ca ce
skipae38:
	cld		; ae38:0e3a	d8
skipae39:
	jsr sub_ae8f	; ae39:0e3b	20 8f ae
skipae3c:
	lda cia1sec	; ae3c:0e3e	ad 09 dc
	jsr sub_afab	; ae3f:0e41	20 ab af
	pha		; ae42:0e44	48
	txa		; ae43:0e45	8a
	tay		; ae44:0e46	a8
	pla		; ae45:0e47	68
	ldx #$17	; ae46:0e48	a2 17
	jsr sub_af94	; ae48:0e4a	20 94 af
	tya		; ae4b:0e4d	98
	jsr sub_af94	; ae4c:0e4e	20 94 af
	lda tsr	 ; ae4f:0e51	ad 03 d0
	beq skipae5c	; ae52:0e54	f0 08
	lda #$59	; ae54:0e56	a9 59
	sed		; ae56:0e58	f8
	sec		; ae57:0e59	38
	sbc cia1sec	; ae58:0e5a	ed 09 dc
	cld		; ae5b:0e5d	d8
skipae5c:
	jsr sub_afab	; ae5c:0e5e	20 ab af
	pha		; ae5f:0e61	48
	txa		; ae60:0e62	8a
	tay		; ae61:0e63	a8
	pla		; ae62:0e64	68
	ldx #$24	; ae63:0e65	a2 24
	jsr sub_af94	; ae65:0e67	20 94 af
	tya		; ae68:0e6a	98
	jsr sub_af94	; ae69:0e6b	20 94 af
	lda cphase	; ae6c:0e6e	ad e9 42
	bne skipae80	; ae6f:0e71	d0 0f
	lda tsr	 ; ae71:0e73	ad 03 d0
	beq skipae80	; ae74:0e76	f0 0a
	lda #$7c	; ae76:0e78	a9 7c		; $be7c -> ($a000)
	sta amptable	; ae78:0e7a	8d 00 a0
	lda #$be	; ae7b:0e7d	a9 be
	sta amptable+1  ; ae7d:0e7f	8d 01 a0
skipae80:
	lda tsr	; ae80:0e82	ad 03 d0
	cmp cphase	; ae83:0e85	cd e9 42
	sta cphase	; ae86:0e88	8d e9 42
	bne skipae8e	; ae89:0e8b	d0 03
	jsr sub_afdc	; ae8b:0e8d	20 dc af
skipae8e:
	rts		; ae8e:0e90	60

sub_ae8f:
	lda lbl_cec7	; ae8f:0e91	ad c7 ce
	ora #$30	; ae92:0e94	09 30
	sta d1str	; ae94:0e96	8d 00 ce
	lda lbl_cec8	; ae97:0e99	ad c8 ce
	jsr sub_afab	; ae9a:0e9c	20 ab af
	sta d1str+3	; ae9d:0e9f	8d 03 ce
	stx d1str+4	; aea0:0ea2	8e 04 ce
	lda lbl_cec9	; aea3:0ea5	ad c9 ce
	jsr sub_afab	; aea6:0ea8	20 ab af
	sta d1str+5	; aea9:0eab	8d 05 ce
	stx d1str+6	; aeac:0eae	8e 06 ce
	lda lbl_ceca	; aeaf:0eb1	ad ca ce
	jsr sub_afab	; aeb2:0eb4	20 ab af
	sta d1str+1	; aeb5:0eb7	8d 01 ce
	stx d1str+2	; aeb8:0eba	8e 02 ce
	lda lbl_cecb	; aebb:0ebd	ad cb ce
	jsr sub_afab	; aebe:0ec0	20 ab af
	sta d1str+7	; aec1:0ec3	8d 07 ce
	stx d1str+8	; aec4:0ec6	8e 08 ce
	lda lbl_cecc	; aec7:0ec9	ad cc ce
	jsr sub_afab	; aeca:0ecc	20 ab af
	sta d1str+9	; aecd:0ecf	8d 09 ce
	stx d1str+10	; aed0:0ed2	8e 0a ce
sub_aed3:
	ldy lbl_cec7	; aed3:0ed5	ac c7 ce
	dey		; aed6:0ed8	88
	tya		; aed7:0ed9	98
	asl a		; aed8:0eda	0a
	asl a		; aed9:0edb	0a
	tay		; aeda:0edc	a8
	ldx #$00	; aedb:0edd	a2 00
loopaedd:
	lda days,y	; aedd:0edf	b9 15 a2
	jsr sub_af94	; aee0:0ee2	20 94 af
	iny		; aee3:0ee5	c8
	cpx #$04	; aee4:0ee6	e0 04
	bne loopaedd	; aee6:0ee8	d0 f5
	lda lbl_cec8	; aee8:0eea	ad c8 ce
	cmp #$10	; aeeb:0eed	c9 10
	bcc skipaef1	; aeed:0eef	90 02
	sbc #$06	; aeef:0ef1	e9 06
skipaef1:
	tay		; aef1:0ef3	a8
	dey		; aef2:0ef4	88
	tya		; aef3:0ef5	98
	asl a		; aef4:0ef6	0a
	asl a		; aef5:0ef7	0a
	tay		; aef6:0ef8	a8
loopaef7:
	lda months,y	; aef7:0ef9	b9 e5 a1
	jsr sub_af94	; aefa:0efc	20 94 af
	iny		; aefd:0eff	c8
	cpx #$08	; aefe:0f00	e0 08
	bne loopaef7	; af00:0f02	d0 f5
	lda d1str+5	; af02:0f04	ad 05 ce
	cmp #$30	; af05:0f07	c9 30
	bne skipaf0b	; af07:0f09	d0 02
	lda #$20	; af09:0f0b	a9 20
skipaf0b:
	jsr sub_af94	; af0b:0f0d	20 94 af
	lda d1str+6	; af0e:0f10	ad 06 ce
	jsr sub_af94	; af11:0f13	20 94 af
	lda #$2c	; af14:0f16	a9 2c
	jsr sub_af94	; af16:0f18	20 94 af
	lda #$20	; af19:0f1b	a9 20
	jsr sub_af94	; af1b:0f1d	20 94 af
	lda #$31	; af1e:0f20	a9 31
	jsr sub_af94	; af20:0f22	20 94 af
	lda #$39	; af23:0f25	a9 39
	jsr sub_af94	; af25:0f27	20 94 af
	lda d1str+1	; af28:0f2a	ad 01 ce
	jsr sub_af94	; af2b:0f2d	20 94 af
	lda d1str+2	; af2e:0f30	ad 02 ce
	jsr sub_af94	; af31:0f33	20 94 af
	lda #$20	; af34:0f36	a9 20
	jsr sub_af94	; af36:0f38	20 94 af
	lda d1str+7	; af39:0f3b	ad 07 ce
	and #$31	; af3c:0f3e	29 31
	cmp #$30	; af3e:0f40	c9 30
	bne skipaf44	; af40:0f42	d0 02
	lda #$20	; af42:0f44	a9 20
skipaf44:
	jsr sub_af94	; af44:0f46	20 94 af
	lda d1str+8	; af47:0f49	ad 08 ce
	jsr sub_af94	; af4a:0f4c	20 94 af
	lda #$3a	; af4d:0f4f	a9 3a
	jsr sub_af94	; af4f:0f51	20 94 af
	lda d1str+9	; af52:0f54	ad 09 ce
	jsr sub_af94	; af55:0f57	20 94 af
	lda d1str+10	; af58:0f5a	ad 0a ce
	jsr sub_af94	; af5b:0f5d	20 94 af
	lda #$3a	; af5e:0f60	a9 3a
	jsr sub_af94	; af60:0f62	20 94 af
	lda cia1sec	; af63:0f65	ad 09 dc
	pha		; af66:0f68	48
	lsr a		; af67:0f69	4a
	lsr a		; af68:0f6a	4a
	lsr a		; af69:0f6b	4a
	lsr a		; af6a:0f6c	4a
	ora #$30	; af6b:0f6d	09 30
	jsr sub_af94	; af6d:0f6f	20 94 af
	pla		; af70:0f72	68
	and #$0f	; af71:0f73	29 0f
	ora #$30	; af73:0f75	09 30
	jsr sub_af94	; af75:0f77	20 94 af
	lda #$20	; af78:0f7a	a9 20
	jsr sub_af94	; af7a:0f7c	20 94 af
	lda d1str+7	; af7d:0f7f	ad 07 ce
	cmp #$38	; af80:0f82	c9 38
	bcs skipaf88	; af82:0f84	b0 04
	lda #$c1	; af84:0f86	a9 c1
	bne skipaf8a	; af86:0f88	d0 02
skipaf88:
	lda #$d0	; af88:0f8a	a9 d0
skipaf8a:
	jsr sub_af94	; af8a:0f8c	20 94 af
	lda #$cd	; af8d:0f8f	a9 cd
	jsr sub_af94	; af8f:0f91	20 94 af
	lda #$20	; af92:0f94	a9 20
; output long date string to top of sysop screen
sub_af94:
	pha		; af94:0f96	48
	and lbl_afaa	; af95:0f97	2d aa af
	cmp #$80	; af98:0f9a	c9 80
	bcs skipafa2	; af9a:0f9c	b0 06
	cmp #$40	; af9c:0f9e	c9 40
	bcc skipafa2	; af9e:0fa0	90 02
	and #$3f	; afa0:0fa2	29 3f
skipafa2:
	ora #$80	; afa2:0fa4	09 80
	sta $0401,x	; afa4:0fa6	9d 01 04
	inx		; afa7:0fa9	e8
	pla		; afa8:0faa	68
	rts		; afa9:0fab	60

lbl_afaa:
	byte $ff	; afaa:0fac	serial # related

afab:0fad	48	sub_afab pha
afac:0fae	4a		lsr a
afad:0faf	4a		lsr a
afae:0fb0	4a		lsr a
afaf:0fb1	4a		lsr a
afb0:0fb2	09 30		ora #$30
afb2:0fb4	8d ef 42		sta var_42ef
afb5:0fb7	a8		tay
afb6:0fb8	8d ef 42		sta var_42ef
afb9:0fbb	68		pla
afba:0fbc	29 0f		and #$0f
afbc:0fbe	09 30		ora #$30
afbe:0fc0	8d f0 42		sta ptrpnfd
afc1:0fc3	aa		tax
afc2:0fc4	8d f0 42		sta ptrpnfd
afc5:0fc7	98		tya
afc6:0fc8	60		rts

afc7:0fc9	ad 03 d0 sub_afc7 lda tsr
afca:0fcc	f0 07		beq skipafd3
afcc:0fce	c9 65		cmp #$65
afce:0fd0	b0 03		bcs skipafd3
afd0:0fd2	ce 03 d0		dec tsr
afd3:0fd5	60	skipafd3 rts

afd4:0fd6	ad 03 d0		lda tsr
afd7:0fd9	c5 00		cmp d6510
afd9:0fdb	d0 01		bne sub_afdc
afdb:0fdd	60		rts

afdc:0fde	a2 20	sub_afdc ldx #$20
afde:0fe0	a9 20		lda #$20
afe0:0fe2	a9 20		lda #$20
afe2:0fe4	20 94 af		jsr sub_af94
afe5:0fe7	ad 03 d0		lda tsr
afe8:0fea	f0 11		beq skipaffb
afea:0fec	c9 65		cmp #$65
afec:0fee	90 0a		bcc skipaff8
afee:0ff0	a9 65		lda #$65
aff0:0ff2	8d 03 d0		sta tsr
aff3:0ff5	a9 2d		lda #$2d
aff5:0ff7	a8		tay
aff6:0ff8	d0 10		bne skipb008
aff8:0ffa	38	skipaff8 sec
aff9:0ffb	e9 01		sbc #$01
affb:0ffd	a0 30	skipaffb ldy #$30
affd:0fff	c9 0a	loopaffd cmp #$0a
afff:1001	90 05		bcc skipb006
b001:1003	e9 0a		sbc #$0a
b003:1005	c8		iny
b004:1006	d0 f7		bne loopaffd
b006:1008	09 30	skipb006 ora #$30
b008:100a	48	skipb008 pha
b009:100b	98		tya
b00a:100c	20 94 af		jsr sub_af94
b00d:100f	68		pla
b00e:1010	20 94 af		jsr sub_af94
b011:1013	a9 3a		lda #$3a
b013:1015	4c 94 af		jmp sub_af94

b016:1018	4c 12 b1 loopb016 jmp gotob112

b019:101b	4c 7f b1 loopb019 jmp gotob17f

b01c:101e	ad f3 42 gotob01c lda scnmode
b01f:1021	d0 0e		bne skipb02f
b021:1023	ad f4 07		lda chk_left
b024:1026	29 08		and #$08
b026:1028	d0 ee		bne loopb016
b028:102a	ad f4 07		lda chk_left
b02b:102d	29 02		and #$02
b02d:102f	d0 ea		bne loopb019
b02f:1031	ad 8d 02 skipb02f lda shflag
b032:1034	29 01		and #$01
b034:1036	8d ee 42		sta var_42ee
b037:1039	a5 c5		lda lstx
b039:103b	cd ed 42		cmp var_42ed
b03c:103e	f0 2b		beq skipb069
b03e:1040	8d ed 42		sta var_42ed
b041:1043	ae fb 42		ldx scnlock
b044:1046	d0 04		bne skipb04a
b046:1048	c9 04		cmp #$04
b048:104a	f0 49		beq skipb093
b04a:104c	ae f3 42 skipb04a ldx scnmode
b04d:104f	d0 1a		bne skipb069
b04f:1051	c9 03		cmp #$03
b051:1053	f0 33		beq skipb086
b053:1055	ae ee 42		ldx var_42ee
b056:1058	d0 09		bne skipb061
b058:105a	c9 05		cmp #$05
b05a:105c	f0 0e		beq skipb06a
b05c:105e	c9 06		cmp #$06
b05e:1060	f0 18		beq skipb078
b060:1062	60		rts

b061:1063	c9 05	skipb061 cmp #$05
b063:1065	f0 09		beq skipb06e
b065:1067	c9 06		cmp #$06
b067:1069	f0 13		beq skipb07c
b069:106b	60	skipb069 rts

b06a:106c	ce e8 42 skipb06a dec undcol
b06d:106f	60		rts

b06e:1070	38	skipb06e sec
b06f:1071	ad e8 42		lda undcol
b072:1074	e9 08		sbc #$08
b074:1076	8d e8 42		sta undcol
b077:1079	60		rts

b078:107a	ee e8 42 skipb078 inc undcol
b07b:107d	60		rts

b07c:107e	18	skipb07c clc
b07d:107f	ad e8 42		lda undcol
b080:1082	69 08		adc #$08
b082:1084	8d e8 42		sta undcol
b085:1087	60		rts

b086:1088	ad e8 42 skipb086 lda undcol
b089:108b	0a		asl a
b08a:108c	0d ee 42		ora var_42ee
b08d:108f	aa		tax
b08e:1090	a0 02		ldy #$02
b090:1092	4c 23 b3		jmp chkflags

b093:1095	ae f3 42 skipb093 ldx scnmode
b096:1098	4c 9e b0		jmp gotob09e

; set full/split screen
setmode:		; &,18,.x
	cpx scnmode	; b099:109b	ec f3 42
	bne skipb069	; b09c:109e	d0 cb
gotob09e:
	cpx #$00	; b09e:10a0	e0 00
	bne skipb0b5	; b0a0:10a2	d0 13
	jsr sub_b0c3	; b0a2:10a4	20 c3 b0
	ldx #$01	; b0a5:10a7	a2 01
	ldy #$18	; b0a7:10a9	a0 18
	lda #$01	; b0a9:10ab	a9 01
loopb0ab:
	stx lbl_b9c6	; b0ab:10ad	8e c6 b9
	sty lbl_b9c7	; b0ae:10b0	8c c7 b9
	sta scnmode	; b0b1:10b3	8d f3 42
	rts		; b0b4:10b6	60

skipb0b5:
	jsr sub_adad	; b0b5:10b7	20 ad ad
	jsr sub_b0c3	; b0b8:10ba	20 c3 b0
lbl_10bd:
	ldx #$07	; b0bb:10bd	a2 07
	ldy #$16	; b0bd:10bf	a0 16
	lda #$00	; b0bf:10c1	a9 00
	beq loopb0ab	; b0c1:10c3	f0 e8
sub_b0c3:
	ldy #$00	; b0c3:10c5	a0 00
loopb0c5:
	lda videoram+40,y;b0c5:10c7	b9 28 04
	tax		; b0c8:10ca	aa
	lda $4100,y	; b0c9:10cb	b9 00 41
	sta videoram+40,y;b0cc:10ce	99 28 04
	txa		; b0cf:10d1	8a
	sta $4100,y	; b0d0:10d2	99 00 41
	lda $d828,y	; b0d3:10d5	b9 28 d8
	tax		; b0d6:10d8	aa
	lda tempcol,y	; b0d7:10d9	b9 f0 41
	sta $d828,y	; b0da:10dc	99 28 d8
	txa		; b0dd:10df	8a
	sta tempcol,y	; b0de:10e0	99 f0 41
	iny		; b0e1:10e3	c8
	cpy #$f0	; b0e2:10e4	c0 f0
	bne loopb0c5	; b0e4:10e6	d0 df
lbl_b0e6:
	ldy #$00	; b0e6:10e8	a0 00
	; with BASIC ROM banked in, ptrget finds var address:
loopb0e8:
	lda mask_bot,y	; b0e8:10ea	b9 98 07
	tax		; b0eb:10ed	aa
	lda tempbott,y  ; b0ec:10ee	b9 00 40
	sta mask_bot,y  ; b0ef:10f1	99 98 07
	txa		; b0f2:10f4	8a
	sta tempbott,y  ; b0f3:10f5	99 00 40
	lda colorram+920,y;b0f6:10f8	b9 98 db
	tax		; b0f9:10fb	aa
	lda $4050,y	; b0fa:10fc	b9 50 40
	sta colorram+920,y;b0fd:10ff	99 98 db
	txa		; b100:1102	8a
	sta $4050,y	; b101:1103	99 50 40
	iny		; b104:1106	c8
	cpy #$50	; b105:1107	c0 50
	bne loopb0e8	; b107:1109	d0 df
	rts		; b109:110b	60

tbl_bits:	byte %00000001,%00000010,%00000100,%00001000
		byte %00010000,%00100000,%01000000,%10000000
			; b10a:110c	tbl-b111
			; b10e:1110

gotob112:
	lda lstx	; b112:1114	a5 c5
	cmp var_42ed	; b114:1116	cd ed 42
	beq skipb13f	; b117:1119	f0 26
	sta var_42ed	; b119:111b	8d ed 42
	ldx shflag	; b11c:111e	ae 8d 02
	cpx #$01	; b11f:1121	e0 01
	beq skipb12f	; b121:1123	f0 0c
	cmp #$04	; b123:1125	c9 04
	beq skipb158	; b125:1127	f0 31
	cmp #$05	; b127:1129	c9 05
	beq skipb140	; b129:112b	f0 15
	cmp #$06	; b12b:112d	c9 06
	beq skipb14d	; b12d:112f	f0 1e
skipb12f:
	cmp #$03	; b12f:1131	c9 03
	beq skipb176	; b131:1133	f0 43
	cmp #$04	; b133:1135	c9 04
	beq skipb15c	; b135:1137	f0 25
	cmp #$05	; b137:1139	c9 05
	beq skipb160	; b139:113b	f0 25
	cmp #$06	; b13b:113d	c9 06
	beq skipb16b	; b13d:113f	f0 2c
skipb13f:
	rts		; b13f:1141	60

skipb140:
	lda tsr		; b140:1142	ad 03 d0
	cmp #$65	; b143:1145	c9 65
	bcs skipb13f	; b145:1147	b0 f8
	inc tsr	 ; b147:1149	ee 03 d0
	jmp sub_afdc	; b14a:114c	4c dc af

skipb14d:
	lda tsr		; b14d:114f	ad 03 d0
	beq skipb13f	; b150:1152	f0 ed
	dec tsr	 ; b152:1154	ce 03 d0
	jmp sub_afdc	; b155:1157	4c dc af

skipb158:
	lda #$00	; b158:115a	a9 00
	beq skipb179	; b15a:115c	f0 1d
skipb15c:
	lda #$65	; b15c:115e	a9 65
	bne skipb179	; b15e:1160	d0 19
skipb160:
	lda tsr	; b160:1162	ad 03 d0
	cmp #$65	; b163:1165	c9 65
	bcs skipb13f	; b165:1167	b0 d8
	adc #$0a	; b167:1169	69 0a
	bcc skipb179	; b169:116b	90 0e
skipb16b:
	lda tsr	; b16b:116d	ad 03 d0
	cmp #$0a	; b16e:1170	c9 0a
	bcc skipb13f	; b170:1172	90 cd
	sbc #$0a	; b172:1174	e9 0a
	bcs skipb179	; b174:1176	b0 03
skipb176:
	jmp skipb086	; b176:1178	4c 86 b0

skipb179:
	sta tsr	; b179:117b	8d 03 d0
	jmp sub_afdc	; b17c:117e	4c dc af

gotob17f:
	lda lstx	; b17f:1181	a5 c5
	cmp var_42ed	; b181:1183	cd ed 42
	beq skipb195	; b184:1186	f0 0f
	sta var_42ed	; b186:1188	8d ed 42
	cmp #$05	; b189:118b	c9 05
	beq skipb1ae	; b18b:118d	f0 21
	cmp #$06	; b18d:118f	c9 06
	beq skipb19e	; b18f:1191	f0 0d
	cmp #$03	; b191:1193	c9 03
	beq skipb1be	; b193:1195	f0 29
skipb195:
	lda videoram+156; b195:1197	ad 9c 04
	ora #$80	; b198:119a	09 80
	sta videoram+156; b19a:119c	8d 9c 04
	rts		; b19d:119f	60

skipb19e:
	dec videoram+156; b19e:11a0	ce 9c 04
	lda videoram+156; b1a1:11a3	ad 9c 04
	cmp #$b0        ; b1a4:11a6	c9 b0
	bcs skipb1ad    ; b1a6:11a8	b0 05
	lda #$b9        ; b1a8:11aa	a9 b9
	sta videoram+156; b1aa:11ac	8d 9c 04
	skipb1ad rts    ; b1ad:11af	60

skipb1ae:
	inc videoram+156; b1ae:11b0	ee 9c 04
	lda videoram+156; b1b1:11b3	ad 9c 04
	cmp #$ba        ; b1b4:11b6	c9 ba
	bcc skipb1bd    ; b1b6:11b8	90 05
	lda #$b0        ; b1b8:11ba	a9 b0
	sta videoram+156; b1ba:11bc	8d 9c 04
skipb1bd:
	rts		; b1bd:11bf	60

b1be:11c0	ad 9c 04 skipb1be lda videoram+156
b1c1:11c3	29 7f		and #$7f
b1c3:11c5	8d 9c 04		sta videoram+156
b1c6:11c8	29 0f		and #$0f
b1c8:11ca	09 80		ora #$80
b1ca:11cc	8d 09 d0		sta access
b1cd:11cf	4c 86 b0		jmp skipb086

b1d0:11d2	tbl-b1d1 lbl_b1d0 byte $d1	; fixme: cmp ($77),y

b1d1:11d3		lbl_b1d1 byte $77

b1d2:11d4	a2 fa	gotob1d2 ldx #$fa
b1d4:11d6	ad ff cf		lda var_cfff
b1d7:11d9	4d 0a d0		eor mxor
b1da:11dc	29 10		and #$10
b1dc:11de	f0 09		beq skipb1e7
b1de:11e0	a9 01		lda #$01
b1e0:11e2	8d f1 07		sta carrst
b1e3:11e5	a2 a0		ldx #$a0
b1e5:11e7	d0 08		bne skipb1ef
b1e7:11e9	ad f1 07 skipb1e7 lda carrst
b1ea:11ec	09 80		ora #$80
b1ec:11ee	8d f1 07		sta carrst
b1ef:11f1	ad c6 b9 skipb1ef lda lbl_b9c6
b1f2:11f4	f0 11		beq skipb205
b1f4:11f6	8e 27 04		stx videoram+39
b1f7:11f9	a2 a0		ldx #$a0
b1f9:11fb	ad e5 42		lda bar
b1fc:11fe	29 01		and #$01
b1fe:1200	d0 02		bne skipb202
b200:1202	a2 fa		ldx #$fa
b202:1204	8e 00 04 skipb202 stx videoram
b205:1207	ad 1b b2 skipb205 lda lbl_b21b
b208:120a	cd d0 b1		cmp lbl_b1d0
b20b:120d	d0 09		bne skipb216
b20d:120f	ad 1c b2		lda lbl_b21c
b210:1212	cd d1 b1		cmp lbl_b1d1
b213:1215	d0 01		bne skipb216
b215:1217	60		rts

b216:1218	a2 01	skipb216 ldx #$01
b218:121a	4c 99 b0		jmp setmode

b21b:121d	tbl-b21c lbl_b21b byte $d1

b21c:121e		lbl_b21c byte $77

; modem carrier status stuff:
b21d:121f	ad f1 07 gotob21d lda carrst
b220:1222	29 7f		and #$7f
b222:1224	c9 01	mod_b222 cmp #$01
b224:1226	f0 0c		beq skipb232
b226:1228	8d 23 b2		sta mod_b222+1
b229:122b	c9 00		cmp #$00
b22b:122d	d0 05		bne skipb232
b22d:122f	a9 01		lda #$01
b22f:1231	8d 05 d0		sta flag
b232:1234	ad f4 07 skipb232 lda chk_left
b235:1237	29 04		and #$04
b237:1239	c9 00	mod_b237 cmp #$00
b239:123b	f0 13		beq skipb24e
b23b:123d	8d 38 b2		sta mod_b237+1
b23e:1240	c9 00		cmp #$00
b240:1242	f0 0c		beq skipb24e
b242:1244	ad f1 07		lda carrst
b245:1247	29 7f		and #$7f
b247:1249	f0 05		beq skipb24e
b249:124b	a9 01		lda #$01
b24b:124d	8d 05 d0		sta flag
b24e:1250	60	skipb24e rts

b24f:1251	a9 01	mod_b24f lda #$01
b251:1253	48		pha
b252:1254	ad e8 42		lda undcol
b255:1257	29 0f		and #$0f
b257:1259	8d e8 42		sta undcol
b25a:125c	4a		lsr a
b25b:125d	29 fc		and #$fc
b25d:125f	aa		tax
b25e:1260	a5 14		lda linnum
b260:1262	8d 97 b3		sta lbl_b397
b263:1265	a5 15		lda linnum+1
b265:1267	8d 98 b3		sta lbl_b398
b268:126a	a0 00		ldy #$00
b26a:126c	bd 9e b3		lda lbl_b39e,x
b26d:126f	85 14		sta linnum
b26f:1271	bd 9f b3		lda lbl_b39e+1,x
b272:1274	85 15		sta linnum+1
b274:1276	b1 14		lda (linnum),y
b276:1278	8d 9a b3		sta lbl_b39a
b279:127b	bd a0 b3		lda lbl_b39e+2,x
b27c:127e	85 14		sta linnum
b27e:1280	bd a1 b3		lda lbl_b3a1,x
b281:1283	85 15		sta linnum+1
b283:1285	b1 14		lda (linnum),y
b285:1287	8d 9b b3		sta lbl_b39b
b288:128a	ad e8 42		lda undcol
b28b:128d	4a		lsr a
b28c:128e	4a		lsr a
b28d:128f	4a		lsr a
b28e:1290	0a		asl a
b28f:1291	aa		tax
b290:1292	bd a6 b3		lda lbl_b3a6,x
b293:1295	85 14		sta linnum
b295:1297	bd a7 b3		lda lbl_b3a7,x
b298:129a	85 15		sta linnum+1
b29a:129c	68		pla
b29b:129d	d0 23		bne skipb2c0
b29d:129f	ad 9a b3		lda lbl_b39a
b2a0:12a2	cd 9c b3		cmp lbl_b39c
b2a3:12a5	d0 1b		bne skipb2c0
b2a5:12a7	ad 9b b3		lda lbl_b39b
b2a8:12aa	cd 9d b3		cmp lbl_b39d
b2ab:12ad	d0 13		bne skipb2c0
b2ad:12af	ad e8 42		lda undcol
b2b0:12b2	cd e7 42		cmp undchr
b2b3:12b5	d0 0b	lbl_b2b3 bne skipb2c0
b2b5:12b7	ad 97 b3 loopb2b5 lda lbl_b397
b2b8:12ba	85 14		sta linnum
b2ba:12bc	ad 98 b3		lda lbl_b398
b2bd:12bf	85 15		sta linnum+1
b2bf:12c1	60		rts

b2c0:12c2	ae f3 42 skipb2c0 ldx scnmode
b2c3:12c5	d0 f0		bne loopb2b5
b2c5:12c7	a2 00		ldx #$00
b2c7:12c9	a0 00		ldy #$00
b2c9:12cb	8c 50 b2		sty mod_b24f+1
b2cc:12ce	ad e8 42		lda undcol
b2cf:12d1	8d e7 42		sta undchr
b2d2:12d4	29 07		and #$07
b2d4:12d6	8d 99 b3		sta lbl_b399
b2d7:12d9	ad 9a b3		lda lbl_b39a
b2da:12dc	8d 9c b3		sta lbl_b39c
b2dd:12df	ad 9b b3		lda lbl_b39b
b2e0:12e2	8d 9d b3		sta lbl_b39d
b2e3:12e5	ad 9a b3 loopb2e3 lda lbl_b39a
b2e6:12e8	20 00 b3		jsr sub_b300
b2e9:12eb	20 1e b3		jsr sub_b31e
b2ec:12ee	20 1e b3		jsr sub_b31e
b2ef:12f1	20 1e b3		jsr sub_b31e
b2f2:12f4	ad 9b b3		lda lbl_b39b
b2f5:12f7	20 00 b3		jsr sub_b300
b2f8:12fa	e8		inx
b2f9:12fb	e0 08		cpx #$08
b2fb:12fd	90 e6		bcc loopb2e3
b2fd:12ff	4c b5 b2		jmp loopb2b5

b300:1302	3d 0a b1 sub_b300 and $b10a,x
b303:1305	f0 04		beq skipb309
b305:1307	a9 fa		lda #$fa
b307:1309	d0 02		bne skipb30b
b309:130b	a9 20	skipb309 lda #$20
b30b:130d	09 80	skipb30b ora #$80
b30d:130f	99 f0 04		sta light,y
b310:1312	a9 fe		lda #$fe
b312:1314	ec 99 b3		cpx lbl_b399
b315:1317	d0 02		bne skipb319
b317:1319	a9 f3		lda #$f3
b319:131b	99 f0 d8 skipb319 sta $d8f0,y
b31c:131e	c8		iny
b31d:131f	60		rts

b31e:1320	b1 14	sub_b31e lda (linnum),y
b320:1322	4c 0b b3		jmp skipb30b

chkflags:		; &,52,chknum,op
	lda linnum	; b323:1325	a5 14
	pha             ; b325:1327	48
	lda linnum+1    ; b326:1328	a5 15
	pha             ; b328:132a	48
lbl_b329:
	stx lbl_b399   ; b329:132b	8e 99 b3
	txa             ; b32c:132e	8a
	lsr a           ; b32d:132f	4a
	pha             ; b32e:1330	48
	php             ; b32f:1331	08
	lsr a           ; b330:1332	4a
	lsr a           ; b331:1333	4a
	lsr a           ; b332:1334	4a
	asl a           ; b333:1335	0a
	plp             ; b334:1336	28
	adc #$00        ; b335:1337	69 00
	asl a           ; b337:1339	0a
	tax             ; b338:133a	aa
	lda lbl_b39e,x  ; b339:133b	bd 9e b3
	sta linnum      ; b33c:133e	85 14
	lda lbl_b39e+1,x; b33e:1340	bd 9f b3
	sta linnum+1    ; b341:1343	85 15
	pla             ; b343:1345	68
	and #$07        ; b344:1346	29 07
	tax             ; b346:1348	aa
	lda $b10a,x     ; b347:1349	bd 0a b1
	cpy #$00        ; b34a:134c	c0 00
	bne skipb359    ; b34c:134e	d0 0b
	eor #$ff        ; b34e:1350	49 ff
	ldy #$00        ; b350:1352	a0 00
	and (linnum),y  ; b352:1354	31 14
	sta (linnum),y  ; b354:1356	91 14
	jmp gotob387    ; b356:1358	4c 87 b3

skipb359:
	cpy #$01	; b359:135b	c0 01
	bne skipb366    ; b35b:135d	d0 09
	ldy #$00        ; b35d:135f	a0 00
	ora (linnum),y  ; b35f:1361	11 14
	sta (linnum),y  ; b361:1363	91 14
	jmp gotob387    ; b363:1365	4c 87 b3

skipb366:
	cpy #$02	; b366:1368	c0 02
	bne skipb373    ; b368:136a	d0 09
	ldy #$00        ; b36a:136c	a0 00
	eor (linnum),y  ; b36c:136e	51 14
	sta (linnum),y  ; b36e:1370	91 14
	jmp gotob387    ; b370:1372	4c 87 b3

skipb373:
	cpy #$03	; b373:1375	c0 03
	bne skipb38e    ; b375:1377	d0 17
	ldy #$00        ; b377:1379	a0 00
	sty fac1        ; b379:137b	84 61
	and (linnum),y  ; b37b:137d	31 14
	beq skipb380    ; b37d:137f	f0 01
	iny             ; b37f:1381	c8
skipb380:
	sty fac1+1     ; b380:1382	84 62
	ldx #$1e        ; b382:1384	a2 1e
	jsr putvar      ; b384:1386	20 a5 b5
gotob387:
	pla            ; b387:1389	68
	sta linnum+1    ; b388:138a	85 15
	pla             ; b38a:138c	68
	sta linnum      ; b38b:138d	85 14
	rts             ; b38d:138f	60

skipb38e:
	lda lbl_b399	; b38e:1390	ad 99 b3
	sta undcol      ; b391:1393	8d e8 42
	jmp gotob387    ; b394:1396	4c 87 b3

b397:1399	tbl-b3af lbl_b397 byte $00

b398:139a		lbl_b398 byte $00

b399:139b		lbl_b399 byte $00

b39a:139c		lbl_b39a byte $00

b39b:139d		lbl_b39b byte $00

b39c:139e		lbl_b39c byte $00

b39d:139f		lbl_b39d byte $00

b39e:13a0	tbl-b3a0 lbl_b39e byte $f4,$07
b3a0:13a2			byte $f5

b3a1:13a3	tbl-b3a1 lbl_b3a1 byte $07

b3a2:13a4			byte $e5,$42,$e6,$42
			;	ascii "�B�B"

b3a6:13a8		lbl_b3a6 byte $aa
			;	ascii "�"

b3a7:13a9	tbl-b3d1 lbl_b3a7 byte $d2,$b3
			;	ascii "�ҳ"

b3aa:13ac	tbl-b3f9 litebar	ascii " Sys "
b3af:13b1			ascii " Acs "
b3b4:13b6			ascii " Loc "
b3b9:13bb			ascii " Tsr "
b3be:13c0			ascii " Cht "
b3c3:13c5			ascii " New "
b3c8:13ca			ascii " Prt "
b3cd:13cf			ascii " U/D "
b3d2:13d4			ascii " Asc "
b3d7:13d9			ascii " Ans "
b3dc:13de			ascii " Exp "
b3e1:13e3			ascii " Fn5 "
b3e6:13e8			ascii " Fn4 "
b3eb:13ed			ascii " Fn3 "
b3f0:13f2			ascii " Fn2 "
b3f5:13f7			ascii " Fn1 "

disp3:                  ; &,21
	stx lbl_b4d1	; b3fa:13fc	8e d1 b4
	sty lbl_b4d2	; b3fd:13ff	8c d2 b4
lbl_b400:
	lda #$02	; b400:1402	a9 02
	jsr sub_b478	; b402:1404	20 78 b4
	lda #clear	; b405:1407	a9 93
	sta z_fe	; b407:1409	85 fe
	jsr outscn	; b409:140b	20 a6 b7
	inc mod_b24f+1	; b40c:140e	ee 50 b2
	rts		; b40f:1411	60

b410:1412	a2 27	sub_b410 ldx #$27
b412:1414	a9 06		lda #$06
b414:1416	9d 00 d8 loopb414 sta colormem,x
b417:1419	ca		dex
b418:141a	10 fa		bpl loopb414
b41a:141c	a9 a0		lda #$a0
b41c:141e	8d 1e 04		sta videoram+30
b41f:1421	8d 1f 04		sta videoram+31
b422:1424	8d 20 04		sta videoram+32
b425:1427	60		rts

disp2:                  ; &,20
	stx lbl_b4d1	; b426:1428	8e d1 b4
	sty lbl_b4d2	; b429:142b	8c d2 b4
	lda #$00	; b42c:142e	a9 00
	jsr sub_b475	; b42e:1430	20 75 b4
	lda #$00	; b431:1433	a9 00
	sta chatpage	; b433:1435	8d 08 d0
	sta tsr		; b436:1438	8d 03 d0
	jsr sub_afdc	; b439:143b	20 dc af
	lda chk_left	; b43c:143e	ad f4 07
	and #$fb	; b43f:1441	29 fb
	sta chk_left	; b441:1443	8d f4 07
	lda chk_right	; b444:1446	ad f5 07
	and #$fb	; b447:1449	29 fb
	sta chk_right	; b449:144b	8d f5 07
	inc mod_b24f+1	; b44c:144e	ee 50 b2
	rts		; b44f:1451	60

disp1:                  ; &,19
	stx lbl_b4d1	; b450:1452	8e d1 b4
	sty lbl_b4d2	; b453:1455	8c d2 b4
	lda #$01	; b456:1458	a9 01
	jsr sub_b475	; b458:145a	20 75 b4
	jsr sub_b410	; b45b:145d	20 10 b4
	inc mod_b24f+1	; b45e:1460	ee 50 b2
	rts		; b461:1463	60

disp4:			; &,53
	stx lbl_b4d1	; b462:1464	8e d1 b4
	sty lbl_b4d2	; b465:1467	8c d2 b4
	lda #$03	; b468:146a	a9 03		l
	jmp sub_b475	; b46a:146c	4c 75 b4


scnfiles:
	ascii "0:scn."	; b46d:146f


scntype:
	ascii "t"	; b473:1475
	; screen type: "t" for "text", "c" for "color"


scnnum:
	ascii "1"	; b474:1476
	; screen number: 1-4

sub_b475:
	sta curdisp	; b475:1477	8d e4 42
sub_b478:
	clc		; b478:147a	18
	adc #$31	; b479:147b	69 31
	sta scnnum	; b47b:147d	8d 74 b4
	ldx #$01	; b47e:1480	a2 01
	jsr setmode	; b480:1482	20 99 b0
	lda #$54	; b483:1485	a9 54
	sta scntype	; b485:1487	8d 73 b4
	jsr sub_b4ac	; b488:148a	20 ac b4
	lda #$43	; b48b:148d	a9 43
	sta scntype	; b48d:148f	8d 73 b4
	jsr sub_b4ac	; b490:1492	20 ac b4
	lda #$13	; b493:1495	a9 13
	jsr chrout	; b495:1497	20 d2 ff
	lda #$0b	; b498:149a	a9 0b
	sta fac1	; b49a:149c	85 61
	lda #$00	; b49c:149e	a9 00
	sta fac1+1	; b49e:14a0	85 62
	lda #$ce	; b4a0:14a2	a9 ce
	sta fac1+2	; b4a2:14a4	85 63
	ldx #$04	; b4a4:14a6	a2 04
	jsr putvar	; b4a6:14a8	20 a5 b5
skipb4a9:
	jmp sub_b410	; b4a9:14ab	4c 10 b4

sub_b4ac:
	lda lbl_b4d2	; b4ac:14ae	ad d2 b4
	ora #$30	; b4af:14b1	09 30
	sta scnfiles	; b4b1:14b3	8d 6d b4
	lda #$08	; b4b4:14b6	a9 08
lbl_b4b6:
	ldx #>scnfiles	; b4b6:14b8	a2 6d
lbl_b4b8:
	ldy #<scnfiles	; b4b8:14ba	a0 b4
	jsr setname	; b4ba:14bc	20 bd ff
	lda #$01	; b4bd:14bf	a9 01
	tay		; b4bf:14c1	a8
	ldx lbl_b4d1	; b4c0:14c2	ae d1 b4
	jsr setlfs	; b4c3:14c5	20 ba ff
	jsr rsDisable	; b4c6:14c8	20 06 43	; disable rs-232 comms
	lda #$00	; b4c9:14cb	a9 00
	jsr load	; b4cb:14cd	20 d5 ff
	jmp rsEnable	; b4ce:14d0	4c 03 43

lbl_b4d1:
	byte $08	; b4d1:14d3	00

lbl_b4d2:
	byte $00	; b4d2:14d4	00

setbaud:		; &,41
	 txa		; b4d3:14d5	8a
	 jmp rsSetBaud	; b4d4:14d6	4c 0f 43

getarr:			; &,33
	jsr sub_b522	; b4d7:14d9	20 22 b5
	ldy #$02	; b4da:14dc	a0 02
	jmp gotob59c	; b4dc:14de	4c 9c b5

getln:			; &,35
	jsr getarr	; b4df:14e1	20 d7 b4
	ldy fac1	; b4e2:14e4	a4 61
	sty index	; b4e4:14e6	8c 0f d0
loopb4e7:
	dey		; b4e7:14e9	88
	cpy #$ff	; b4e8:14ea	c0 ff
	beq skipb4f8	; b4ea:14ec	f0 0c
	cpy #$50	; b4ec:14ee	c0 50
	bcs loopb4e7	; b4ee:14f0	b0 f7
	lda (fac1+1),y	; b4f0:14f2	b1 62
	sta buffer,y	; b4f2:14f4	99 77 ce
	jmp loopb4e7	; b4f5:14f7	4c e7 b4

skipb4f8:
	rts		; b4f8:14fa	60

prtln:			; &,39
	jsr getarr	; b4f9:14fb	20 d7 b4
	jmp gotoa074	; b4fc:14fe	4c 74 a0

putarr:			; &,34
	jsr sub_b522	; b4ff:1501	20 22 b5
	ldy #$02	; b502:1504	a0 02
	jmp gotob5b0	; b504:1506	4c b0 b5

putln:			; &,36
	txa		; b507:1509	8a
	pha		; b508:150a	48
	lda index	; b509:150b	ad 0f d0
	jsr sub_cd69	; b50c:150e	20 69 cd
	ldy index	; b50f:1511	ac 0f d0
	beq skipb51d	; b512:1514	f0 09
	dey		; b514:1516	88
loopb515:
	lda buffer,y	; b515:1517	b9 77 ce
	sta (fac1+1),y	; b518:151a	91 62
	dey		; b51a:151c	88
	bpl loopb515	; b51b:151d	10 f8
skipb51d:
	pla		; b51d:151f	68
	tax		; b51e:1520	aa
	jmp putarr	; b51f:1521	4c ff b4

sub_b522:
; search for variable in .x?
	stx varpnt	; b522:1524	86 47
	lda #$00	; b524:1526	a9 00
	asl varpnt	; b526:1528	06 47
	rol a		; b528:152a	2a
	sta varpnt+1	; b529:152b	85 48
	txa		; b52b:152d	8a
	clc		; b52c:152e	18
	adc varpnt	; b52d:152f	65 47
	sta varpnt	; b52f:1531	85 47
	lda #$00	; b531:1533	a9 00
	adc varpnt+1	; b533:1535	65 48
	sta varpnt+1	; b535:1537	85 48
	clc		; b537:1539	18
	lda arytab	; b538:153a	a5 2f
	adc varpnt	; b53a:153c	65 47
	sta varpnt	; b53c:153e	85 47
	lda arytab+1	; b53e:1540	a5 30
	adc varpnt+1	; b540:1542	65 48
	sta varpnt+1	; b542:1544	85 48
	clc		; b544:1546	18
	lda #$07	; b545:1547	a9 07
	adc varpnt	; b547:1549	65 47
	sta varpnt	; b549:154b	85 47
	lda #$00	; b54b:154d	a9 00
	adc varpnt+1	; b54d:154f	65 48
	sta varpnt+1	; b54f:1551	85 48
	rts		; b551:1553	60

sub_b552:
; enter with variable # in .x
	txa		; b552:1554	8a
	asl a		; b553:1555	0a
	tay		; b554:1556	a8
	lda vartable+1,y; b555:1557	b9 cd b5
	sta varpnt+1	; b558:155a	85 48
	lda vartable,y	; b55a:155c	b9 cc b5
	sta varpnt	; b55d:155f	85 47
	rts		; b55f:1561	60

sub_b560:
	sta varnam	; b560:1562	85 45
	stx varnam+1	; b562:1564	86 46
	jmp gotocd4f	; b564:1566	4c 4f cd

outastr:		; &[,0]
	ldx #$01	; b567:1569	a2 01
	jsr chrgot	; b569:156b	20 79 00
	beq prtvar	; b56c:156e	f0 0c
	jsr sub_cddf	; b56e:1570	20 df cd
	sta fac1	; b571:1573	85 61
	stx fac1+1	; b573:1575	86 62
	sty fac1+2	; b575:1577	84 63
	jmp gotoa074	; b577:1579	4c 74 a0

prtvar:			; &,45
	jsr usevar	; b57a:157c	20 91 b5
	jmp gotoa074	; b57d:157f	4c 74 a0

prtvar0:		; &,46
	lda mci		; b580:1582	ad ef 07
	pha		; b583:1585	48
	lda #$00	; b584:1586	a9 00
loopb586:
	sta mci		; b586:1588	8d ef 07
	jsr prtvar	; b589:158b	20 7a b5
	pla		; b58c:158e	68
	sta mci		; b58d:158f	8d ef 07
	rts		; b590:1592	60

usevar:			; &,29
	jsr sub_b552	; b591:1593	20 52 b5
	jmp gotob59a	; b594:1596	4c 9a b5

; called from $a36d, $a5a1, $a5ae
sub_b597:
	jsr sub_b560	; b597:1599	20 60 b5
gotob59a:
	ldy #$04	; b59a:159c	a0 04
gotob59c:
	lda (varpnt),y	; b59c:159e	b1 47
	sta fac1,y	; b59e:15a0	99 61 00
	dey		; b5a1:15a3	88
	bpl gotob59c	; b5a2:15a4	10 f8
	rts		; b5a4:15a6	60

putvar:			; &,30
; put value at $61 into variable .x
	jsr sub_b552	; b5a5:15a7	20 52 b5
	jmp gotob5ae	; b5a8:15aa	4c ae b5

	jsr sub_b560	; b5ab:15ad	20 60 b5
gotob5ae:
	ldy #$04	; b5ae:15b0	a0 04
gotob5b0:
	lda fac1,y	; b5b0:15b2	b9 61 00
	sta (varpnt),y	; b5b3:15b5	91 47
	dey		; b5b5:15b7	88
	bpl gotob5b0	; b5b6:15b8	10 f8
	rts		; b5b8:15ba	60

zero:			; &,31
	lda #$00	; b5b9:15bb	a9 00
	ldy #$04        ; b5bb:15bd	a0 04
loopb5bd:
	sta fac1,y	; b5bd:15bf	99 61 00
	dey             ; b5c0:15c2	88
	bpl loopb5bd    ; b5c1:15c3	10 fa
	rts             ; b5c3:15c5	60

minusone:               ; &,32
	jsr zero	; b5c4:15c6	20 b9 b5
	lda #$81	; b5c7:15c9	a9 81
	sta fac1	; b5c9:15cb	85 61
	rts		; b5cb:15cd	60

vartable:
	byte $41,$ce	; b5cc:15ce 0  an$
	byte $41,$80	; b5ce:15d0 1  a$
	byte $42,$80	; b5d0:15d2 2  b$
	byte $54,$d2	; b5d2:15d4 3  tr$
	byte $44,$b1	; b5d4:15d6 4  d1$
	byte $44,$b2	; b5d6:15d8 5  d2$
	byte $44,$b3	; b5d8:15da 6  d3$
	byte $44,$b4	; b5da:15dc 7  d4$
	byte $44,$b5	; b5dc:15de 8  d5$
	byte $4c,$c4	; b5de:15e0 9  ld$
	byte $54,$d4	; b5e0:15e2 10 tt$
	byte $4e,$c1	; b5e2:15e4 11 na$
	byte $52,$ce	; b5e4:15e6 12 rn$
	byte $50,$c8	; b5e6:15e8 13 ph$
	byte $41,$cb	; b5e8:15ea 14 ak$
	byte $4c,$50	; b5ea:15ec 15 lp
	byte $50,$4c	; b5ec:15ee 16 pl
	byte $52,$43	; b5ee:15f0 17 rc
	byte $53,$48	; b5f0:15f2 18 sh
	byte $4d,$57	; b5f2:15f4 19 mw
	byte $4e,$4c	; b5f4:15f6 20 nl
	byte $55,$4c	; b5f6:15f8 21 ul
	byte $51,$45	; b5f8:15fa 22 qe
	byte $52,$51	; b5fa:15fc 23 rq
	byte $c1,$c3	; b5fc:15fe 24 ac%
	byte $45,$46	; b5fe:1600 25 ef
	byte $4c,$46	; b600:1602 26 lf
	byte $57,$80	; b602:1604 27 w$
	byte $50,$80	; b604:1606 28 p$
	byte $d4,$d2	; b606:1608 29 tr%
	byte $c1,$80	; b608:160a 30 a%
	byte $c2,$80	; b60a:160c 31 b%
	byte $c4,$d6	; b60c:160e 32 dv%
	byte $44,$d2	; b60e:1610 33 dr$
	byte $43,$b1	; b610:1612 34 c1$
	byte $43,$b2	; b612:1614 35 c2$
	byte $43,$cf	; b614:1616 36 co$
	byte $43,$c8	; b616:1618 37 ch$
	byte $cb,$d0	; b618:161a 39 kp%
	; not listed in programmer's ref guide:
	; "Returning To Editor"
	byte $43,$b3	; b61a:161c 40 c3$

sub_b61c:
	sta lbl_cecd	; b61c:161e	8d cd ce
	stx lbl_cece	; b61f:1621	8e ce ce
	ldy #$00	; b622:1624	a0 00
loopb624:
	lda lbl_b659,y	; b624:1626	b9 59 b6
	ldx tbl_b65e,y	; b627:1629	be 5e b6
	sta lbl_cecf	; b62a:162c	8d cf ce
	stx lbl_ced0	; b62d:162f	8e d0 ce
	ldx #$30	; b630:1632	a2 30
loopb632:
	lda lbl_cecd	; b632:1634	ad cd ce
	cmp lbl_cecf	; b635:1637	cd cf ce
	lda lbl_cece	; b638:163a	ad ce ce
	sbc lbl_ced0	; b63b:163d	ed d0 ce
	bcc skipb64f	; b63e:1640	90 0f
	sta lbl_cece	; b640:1642	8d ce ce
loopb643:
	lda lbl_cecd	; b643:1645	ad cd ce
	sbc lbl_cecf	; b646:1648	ed cf ce
	sta lbl_cecd	; b649:164b	8d cd ce
	inx		; b64c:164e	e8
	bne loopb632	; b64d:164f	d0 e3
skipb64f:
	txa		; b64f:1651	8a
	sta lbl_cedb,y	; b650:1652	99 db ce
	iny		; b653:1655	c8
	cpy #$05	; b654:1656	c0 05
	bne loopb624	; b656:1658	d0 cc
	rts		; b658:165a	60

lbl_b659:
	byte $10,$e8,$64,$0a,$01	; b659:165b

tbl_b65e
	byte $27,$03,$00,$00,$00	; b65e:1660

sub_b663:
	lda #$c0	; b663:1665	a9 c0
	ldy #$e0	; b665:1667	a0 e0
	ldx #$04	; b667:1669	a2 04
	jmp swapper	; b669:166b	4c 80 ca

	; garbage collection
sub_b66c:		; &,44
	clc		; b66c:166e	18
	lda fretop	; b66d:166f	a5 33
	cmp strend	; b66f:1671	c5 31
	lda fretop+1	; b671:1673	a5 34
	sbc strend+1	; b673:1675	e5 32
	bne skipb69f	; b675:1677	d0 28
	lda #$c7	; b677:1679	a9 c7	; "G" - garbage collection indicator
	sta videoram+31	; b679:167b	8d 1f 04
	jsr sub_b663	; b67c:167e	20 63 b6
	jsr lbl_c000	; b67f:1681	20 00 c0
	jsr sub_b663	; b682:1684	20 63 b6
	lda #$a0	; b685:1687	a9 a0
	sta videoram+31	; b687:1689	8d 1f 04
	clc		; b68a:168c	18
	lda fretop	; b68b:168d	a5 33
	cmp strend	; b68d:168f	c5 31
	lda fretop+1	; b68f:1691	a5 34
	sbc strend+1	; b691:1693	e5 32
	bne skipb69f	; b693:1695	d0 0a
	ldx #$00	; b695:1697	a2 00
	jsr sub_be59	; b697:1699	20 59 be
	ldx #$10	; b69a:169c	a2 10
	jmp gotocc2b	; b69c:169e	4c 2b cc

skipb69f:
	lda #$00	; b69f:16a1	a9 00
	sta fac1	; b6a1:16a3	85 61
sub_b6a3:
	lda tsr		; b6a3:16a5	ad 03 d0
	cmp lbl_b756	; b6a6:16a8	cd 56 b7
	beq skipb6b5	; b6a9:16ab	f0 0a
	sta lbl_b756	; b6ab:16ad	8d 56 b7
	sta fac1+1	; b6ae:16b0	85 62
	ldx #$1d	; b6b0:16b2	a2 1d
	jsr putvar	; b6b2:16b4	20 a5 b5
skipb6b5:
	inc scnlock	; b6b5:16b7	ee fb 42
	lda scnmode	; b6b8:16ba	ad f3 42
	bne skipb6c0	; b6bb:16bd	d0 03
	jsr sub_b6c4	; b6bd:16bf	20 c4 b6
skipb6c0:
	dec scnlock	; b6c0:16c2	ce fb 42
	rts		; b6c3:16c5	60

b6c4:16c6	38	sub_b6c4 sec
b6c5:16c7	a5 33		lda fretop
b6c7:16c9	e5 31		sbc strend
b6c9:16cb	8d 50 b7		sta lbl_b750
b6cc:16ce	a5 34		lda fretop+1
b6ce:16d0	e5 32		sbc strend+1
b6d0:16d2	8d 51 b7		sta lbl_b751
b6d3:16d5	a5 31		lda strend
b6d5:16d7	cd 54 b7		cmp lbl_b754
b6d8:16da	d0 07		bne skipb6e1
b6da:16dc	a5 32		lda strend+1
b6dc:16de	cd 55 b7		cmp lbl_b755
b6df:16e1	f0 13		beq skipb6f4
b6e1:16e3	ad 50 b7 skipb6e1 lda lbl_b750
b6e4:16e6	8d 54 b7		sta lbl_b754
b6e7:16e9	ad 51 b7		lda lbl_b751
b6ea:16ec	8d 55 b7		sta lbl_b755
b6ed:16ef	a9 9b		lda #$9b
b6ef:16f1	a2 07		ldx #$07
b6f1:16f3	20 36 b7		jsr sub_b736
b6f4:16f6	a5 39	skipb6f4 lda curlin
b6f6:16f8	a6 3a		ldx curlin+1
b6f8:16fa	8d 50 b7		sta lbl_b750
b6fb:16fd	8e 51 b7		stx lbl_b751
b6fe:1700	cd 52 b7		cmp lbl_b752
b701:1703	d0 06		bne skipb709
b703:1705	ec 53 b7		cpx lbl_b753
b706:1708	d0 01		bne skipb709
b708:170a	60		rts

b709:170b	8d 52 b7 skipb709 sta lbl_b752
b70c:170e	8e 53 b7		stx lbl_b753
b70f:1711	ad f5 07		lda chk_right
b712:1714	29 01		and #$01
b714:1716	f0 1f		beq skipb735
b716:1718	a0 01		ldy #$01
b718:171a	b1 7a		lda (txtptr),y
b71a:171c	8d c7 07		sta mask_bot+47
b71d:171f	a2 00		ldx #$00
b71f:1721	a0 c8		ldy #$c8
b721:1723	ad 8d 02 loopb721 lda shflag
b724:1726	29 01		and #$01
b726:1728	f0 06		beq skipb72e
b728:172a	ca		dex
b729:172b	d0 f6		bne loopb721
b72b:172d	88		dey
b72c:172e	d0 f3		bne loopb721
b72e:1730	a9 c2	skipb72e lda #$c2
b730:1732	a2 07		ldx #$07
b732:1734	20 36 b7		jsr sub_b736
b735:1737	60	skipb735 rts

b736:1738	85 fb	sub_b736 sta z_fb
b738:173a	86 fc		stx z_fc
b73a:173c	ad 50 b7		lda lbl_b750
b73d:173f	ae 51 b7		ldx lbl_b751
b740:1742	20 1c b6		jsr sub_b61c
b743:1745	a0 04		ldy #$04
b745:1747	b9 db ce loopb745 lda lbl_cedb,y
b748:174a	09 80		ora #$80
b74a:174c	91 fb		sta (z_fb),y
b74c:174e	88		dey
b74d:174f	10 f6		bpl loopb745
b74f:1751	60		rts

b750:1752	tbl-b757 lbl_b750 byte $00

b751:1753		lbl_b751 byte $00

b752:1754		lbl_b752 byte $00

b753:1755		lbl_b753 byte $00

b754:1756		lbl_b754 byte $00

b755:1757		lbl_b755 byte $00

b756:1758		lbl_b756 byte $00,$00

trapoff:		; &,38
; restore standard error handler
	lda #$8b	; b758:175a	a9 8b
	ldx #$e3	; b75a:175c	a2 e3
	jmp gotob763	; b75c:175e	4c 63 b7

trapon:			; &,37
; install custom error handler
	lda #$79	; b75f:1761	a9 79
	ldx #$cd	; b761:1763	a2 cd
gotob763:
	sta ierror	; b763:1765	8d 00 03
	stx ierror+1	; b766:1768	8e 01 03
	rts		; b769:176b	60

forcegc:		; &,40
	lda strend	; b76a:176c	a5 31
	sta fretop	; b76c:176e	85 33
	lda strend+1	; b76e:1770	a5 32
	sta fretop+1	; b770:1772	85 34
	rts		; b772:1774	60

getversn:		; &,5
	lda #$0f	; b773:1775	a9 0f
	sta fac1	; b775:1777	85 61
	lda #$e7	; b777:1779	a9 e7
	sta fac1+1	; b779:177b	85 62
	lda #$ce	; b77b:177d	a9 ce
	sta fac1+2	; b77d:177f	85 63
	ldx #$01	; b77f:1781	a2 01
	jsr putvar	; b781:1783	20 a5 b5
	ldy #$04	; b784:1786	a0 04
loopb786:
	lda tablcef6,y	; b786:1788	b9 f6 ce
	sta fac1,y	; b789:178b	99 61 00
	dey		; b78c:178e	88
	bpl loopb786	; b78d:178f	10 f7
	ldx #$0f	; b78f:1791	a2 0f
	jsr putvar	; b791:1793	20 a5 b5
	jsr zero	; b794:1796	20 b9 b5
	lda lbl_cee5	; b797:1799	ad e5 ce
lbl_b79a:
	sta fac1+1	; b79a:179c	85 62
	lda lbl_cee6	; b79c:179e	ad e6 ce
	sta fac1	; b79f:17a1	85 61
	ldx #$1e	; b7a1:17a3	a2 1e
	jmp putvar	; b7a3:17a5	4c a5 b5

outscn:			; &,50
	lda #$00	; b7a6:17a8	a9 00
	sta idlejif	; b7a8:17aa	8d e0 42
	tax		; b7ab:17ad	aa
	tay		; b7ac:17ae	a8
	jsr sub_a91f	; b7ad:17af	20 1f a9
	jsr sub_adad	; b7b0:17b2	20 ad ad
	jsr sub_b9f7	; b7b3:17b5	20 f7 b9
	jsr sub_b9b1	; b7b6:17b8	20 b1 b9
	lda tblx	; b7b9:17bb	a5 d6
	cmp lbl_b9c6	; b7bb:17bd	cd c6 b9
	bcs skipb7c5	; b7be:17c0	b0 05
	lda lbl_b9c6	; b7c0:17c2	ad c6 b9
	sta tblx	; b7c3:17c5	85 d6
skipb7c5:
	lda tblx	; b7c5:17c7	a5 d6
	cmp lbl_b9c7	; b7c7:17c9	cd c7 b9
	beq skipb7d4	; b7ca:17cc	f0 08
	bcc skipb7d4	; b7cc:17ce	90 06
	jsr sub_b8d5	; b7ce:17d0	20 d5 b8
	jmp skipb7c5	; b7d1:17d3	4c c5 b7
skipb7d4:
	jsr sub_b89b	; b7d4:17d6	20 9b b8
	lda z_fe	; b7d7:17d9	a5 fe
	and #$7f	; b7d9:17db	29 7f
	cmp #$20	; b7db:17dd	c9 20
	bcs skipb7f8	; b7dd:17df	b0 19
	lda z_fe	; b7df:17e1	a5 fe
	ldy #$0c	; b7e1:17e3	a0 0c
loopb7e3:
	cmp lbl_b9a4,y  ; b7e3:17e5	d9 a4 b9
	beq skipb827	; b7e6:17e8	f0 3f
	dey		; b7e8:17ea	88
	bpl loopb7e3	; b7e9:17eb	10 f8
	ldy #$0f	; b7eb:17ed	a0 0f
	cmp prntcolr,y  ; b7ed:17ef	d9 70 a3 loopb7ed
	beq skipb7f8	; b7f0:17f2	f0 06
	dey		; b7f2:17f4	88
	bne loopb7ed	; b7f3:17f5	d0 f8
	jmp gotob81b	; b7f5:17f7	4c 1b b8

skipb7f8:
	ldx pntr	; b7f8:17fa	a6 d3
	cpx #$27	; b7fa:17fc	e0 27
	bne skipb808	; b7fc:17fe	d0 0a
	ldx tblx	; b7fe:1800	a6 d6
	cpx lbl_b9c7	; b800:1802	ec c7 b9
	bne skipb808	; b803:1805	d0 03
	jsr sub_b8d5	; b805:1807	20 d5 b8
skipb808:
	lda z_fe	; b808:180a	a5 fe
	jsr out_scrn	; b80a:180c	20 16 e7
	ldx pntr	; b80d:180f	a6 d3
	cpx #$28	; b80f:1811	e0 28
	bcc gotob81b	; b811:1813	90 08
	lda #$00	; b813:1815	a9 00
	sta pntr	; b815:1817	85 d3
	lda #$27	; b817:1819	a9 27
	sta lnmx	; b819:181b	85 d5
gotob81b:
	jsr sub_b89b	; b81b:181d	20 9b b8
	jsr sub_b9c9	; b81e:1820	20 c9 b9
	jsr sub_b9b1	; b821:1823	20 b1 b9
	jmp sub_ad6c	; b824:1826	4c 6c ad

skipb827:
	tya		; b827:1829	98
	asl a		; b828:182a	0a
	tay		; b829:182b	a8
	lda lbl_b98a,y  ; b82a:182c	b9 8a b9
	sta mod_b838+1  ; b82d:182f	8d 39 b8
	lda lbl_b98b,y  ; b830:1832	b9 8b b9
	sta mod_b838+2  ; b833:1835	8d 3a b8
	lda z_fe	; b836:1838	a5 fe
mod_b838:
	jsr $ffff	; b838:183a	20 ff ff
	jmp gotob81b	; b83b:183d	4c 1b b8

; reset some MCI defaults
b83e:1840	a2 00		ldx #$00
b840:1842	8e eb 07		stx mprint
b843:1845	8e ea 07		stx mspeed
b846:1848	8e f0 07		stx mdigits
b849:184b	a2 30		ldx #$30
b84b:184d	8e ff a5		stx lbl_a5ff
b84e:1850	4c a9 b8		jmp gotob8a9

b851:1853	29 80		and #$80
b853:1855	0a			asl a
b854:1856	2a			rol a
b855:1857	8d 0c d0		sta mupcase
b858:185a	60			rts

b859:185b	ad f3 42		lda scnmode
b85c:185e	d0 24		bne skipb882
b85e:1860	a0 00		ldy #$00
b860:1862	a9 20	loopb860	lda #$20
b862:1864	99 00 41		sta $4100,y
b865:1867	ad ec 07		lda mcolor
b868:186a	99 f0 41		sta tempcol,y
b86b:186d	c8			iny
b86c:186e	c0 f0		cpy #$f0
b86e:1870	d0 f0		bne loopb860
b870:1872	a0 00		ldy #$00
b872:1874	a9 20	loopb872 lda #$20
b874:1876	99 00 40		sta tempbott,y
b877:1879	ad ec 07		lda mcolor
b87a:187c	99 50 40		sta $4050,y
b87d:187f	c8		iny
b87e:1880	c0 50		cpy #$50
b880:1882	d0 f0		bne loopb872
b882:1884	ae c6 b9 skipb882 ldx lbl_b9c6
b885:1887	ca		dex
b886:1888	e8	loopb886 inx
b887:1889	20 75 b9		jsr sub_b975
b88a:188c	20 bf b9		jsr sub_b9bf
b88d:188f	ec c7 b9		cpx lbl_b9c7
b890:1892	90 f4		bcc loopb886
b892:1894	ad c6 b9		lda lbl_b9c6
b895:1897	85 d6		sta tblx
b897:1899	a9 00		lda #$00
b899:189b	85 d3		sta pntr
b89b:189d	a6 d6	sub_b89b ldx tblx
b89d:189f	20 f0 e9 sub_b89d jsr var_e9f0
b8a0:18a2	4c 24 ea		jmp $ea24

b8a3:18a5	a6 d3		ldx pntr
b8a5:18a7	e0 27		cpx #$27
b8a7:18a9	d0 0c		bne skipb8b5
b8a9:18ab	a6 d6	gotob8a9 ldx tblx
b8ab:18ad	ec c7 b9		cpx lbl_b9c7
b8ae:18b0	d0 05		bne skipb8b5
b8b0:18b2	48		pha
b8b1:18b3	20 d5 b8		jsr sub_b8d5
b8b4:18b6	68		pla
b8b5:18b7	4c 16 e7 skipb8b5 jmp out_scrn

b8b8:18ba	a6 d3		ldx pntr
b8ba:18bc	d0 f9		bne skipb8b5
b8bc:18be	a6 d6		ldx tblx
b8be:18c0	ca		dex
b8bf:18c1	ec c6 b9		cpx lbl_b9c6
b8c2:18c4	b0 f1		bcs skipb8b5
b8c4:18c6	60		rts

b8c5:18c7	4c 16 e7		jmp out_scrn

b8c8:18ca	ad f5 07		lda chk_right
b8cb:18cd	29 10		and #$10
b8cd:18cf	f0 05		beq skipb8d4
b8cf:18d1	a2 02		ldx #$02
b8d1:18d3	20 84 be		jsr sound
b8d4:18d6	60	skipb8d4 rts

b8d5:18d7	a5 ac	sub_b8d5 lda sal
b8d7:18d9	48		pha
b8d8:18da	a5 ad		lda sal+1
b8da:18dc	48		pha
b8db:18dd	a5 ae		lda eal
b8dd:18df	48		pha
b8de:18e0	a5 af		lda eal+1
b8e0:18e2	48		pha
b8e1:18e3	ad f3 42		lda scnmode
b8e4:18e6	d0 26		bne skipb90c
b8e6:18e8	a0 00		ldy #$00
b8e8:18ea	b9 28 41 loopb8e8 lda var_4128,y
b8eb:18ed	99 00 41		sta $4100,y
b8ee:18f0	b9 18 42		lda tempcol+40,y
b8f1:18f3	99 f0 41		sta tempcol,y
b8f4:18f6	c8		iny
b8f5:18f7	c0 c8		cpy #$c8
b8f7:18f9	d0 ef		bne loopb8e8
b8f9:18fb	a0 00		ldy #$00
b8fb:18fd	b9 18 05 loopb8fb lda var_0518,y
b8fe:1900	99 c8 41		sta var_41c8,y
b901:1903	b9 18 d9		lda colorram+280,y
b904:1906	99 b8 42		sta tempcol+200,y
b907:1909	c8		iny
b908:190a	c0 28		cpy #$28
b90a:190c	d0 ef		bne loopb8fb
b90c:190e	ae c6 b9 skipb90c ldx lbl_b9c6
b90f:1911	e8	loopb90f inx
b910:1912	20 9d b8		jsr sub_b89d
b913:1915	a5 d1		lda pnt
b915:1917	85 ac		sta sal
b917:1919	a5 d2		lda pnt+1
b919:191b	85 ad		sta sal+1
b91b:191d	a5 f3		lda user
b91d:191f	85 ae		sta eal
b91f:1921	a5 f4		lda user+1
b921:1923	85 af		sta eal+1
b923:1925	ca		dex
b924:1926	20 9d b8		jsr sub_b89d
b927:1929	20 d2 e9		jsr var_e9d2
b92a:192c	e8		inx
b92b:192d	20 bf b9		jsr sub_b9bf
b92e:1930	ec c7 b9		cpx lbl_b9c7
b931:1933	90 dc		bcc loopb90f
b933:1935	20 75 b9		jsr sub_b975
b936:1938	68		pla
b937:1939	85 af		sta eal+1
b939:193b	68		pla
b93a:193c	85 ae		sta eal
b93c:193e	68		pla
b93d:193f	85 ad		sta sal+1
b93f:1941	68		pla
b940:1942	85 ac		sta sal
b942:1944	c6 d6		dec tblx
b944:1946	20 9b b8		jsr sub_b89b
b947:1949	ad f3 42		lda scnmode
b94a:194c	d0 28		bne skipb974
b94c:194e	a0 27		ldy #$27
b94e:1950	b9 00 40 loopb94e lda tempbott,y
b951:1953	99 70 07		sta var_0770,y
b954:1956	b9 50 40		lda $4050,y
b957:1959	99 70 db		sta colorram+880,y
b95a:195c	b9 28 40		lda tempbott+40,y
b95d:195f	99 00 40		sta tempbott,y
b960:1962	b9 78 40		lda var_4078,y
b963:1965	99 50 40		sta $4050,y
b966:1968	a9 20		lda #$20
b968:196a	99 28 40		sta tempbott+40,y
b96b:196d	ad ec 07		lda mcolor
b96e:1970	99 78 40		sta var_4078,y
b971:1973	88		dey
b972:1974	10 da		bpl loopb94e
b974:1976	60	skipb974 rts

b975:1977	20 f0 e9 sub_b975 jsr var_e9f0
b978:197a	20 24 ea		jsr $ea24
b97b:197d	a0 27		ldy #$27
b97d:197f	ad 86 02 loopb97d lda color
b980:1982	91 f3		sta (user),y
b982:1984	a9 20		lda #$20
b984:1986	91 d1		sta (pnt),y
b986:1988	88		dey
b987:1989	10 f4		bpl loopb97d
b989:198b	60		rts

b98a:198c	tbl-b9b0 lbl_b98a byte $51

b98b:198d		lbl_b98b byte $b8,$51,$b8,$c5,$b8,$c5,$b8,$92,$b8,$59
b995:1997			byte $b8,$a3,$b8,$b8,$b8,$a9,$b8,$bc,$b8,$3e
b99f:19a1			byte $b8,$b8,$b8,$c8,$b8

b9a4:19a6		lbl_b9a4 byte $0e,$8e,$12,$92,$13,$93,$1d,$9d,$11,$91
b9ae:19b0			byte $0d,$14,$07

b9b1:19b3	a9 27	sub_b9b1 lda #$27
b9b3:19b5	85 d5		sta lnmx
b9b5:19b7	a9 00		lda #$00
b9b7:19b9	85 d4		sta qtsw
b9b9:19bb	a9 00		lda #$00
b9bb:19bd	85 d8		sta insrt
b9bd:19bf	a6 d6		ldx tblx
b9bf:19c1	b5 d9	sub_b9bf lda ldtb1,x
b9c1:19c3	09 80		ora #$80
b9c3:19c5	95 d9		sta ldtb1,x
b9c5:19c7	60		rts

; these two bytes are modified by outscn, setmode:
lbl_b9c6:
	byte $07	; b9c6:19c8	07

lbl_b9c7:
	byte $16	; b9c7:19c9	16

lbl_b9c8:
	byte $07	; b9c8:19ca	07

sub_b9c9:
	inc scnlock	; b9c9:19cb	ee fb 42
	sei		; b9cc:19ce	78
	lda color	; b9cd:19cf	ad 86 02
	sta mcolor	; b9d0:19d2	8d ec 07
	lda rvs	 ; b9d3:19d5	a5 c7
	sta mreverse	; b9d5:19d7	8d ee 07
	lda pnt	 ; b9d8:19da	a5 d1
	sta lbl_ad64+1  ; b9da:19dc	8d 65 ad
	lda pnt+1	; b9dd:19df	a5 d2
	sta lbl_ad64+2  ; b9df:19e1	8d 66 ad
	lda pntr	; b9e2:19e4	a5 d3
	sta zp_02	; b9e4:19e6	85 02
	lda tblx	; b9e6:19e8	a5 d6
	sta lbl_b9c8	; b9e8:19ea	8d c8 b9
	lda user	; b9eb:19ed	a5 f3
	sta lbl_ad68+1  ; b9ed:19ef	8d 69 ad
	lda user+1	; b9f0:19f2	a5 f4
	sta lbl_ad68+2  ; b9f2:19f4	8d 6a ad
	cli		; b9f5:19f7	58
	rts		; b9f6:19f8	60

sub_b9f7:
	dec scnlock	; b9f7:19f9	ce fb 42
	lda mcolor	; b9fa:19fc	ad ec 07
	sta color	; b9fd:19ff	8d 86 02
	lda mreverse	; ba00:1a02	ad ee 07
	sta rvs	 ; ba03:1a05	85 c7
	lda lbl_ad64+1  ; ba05:1a07	ad 65 ad
	sta pnt	 ; ba08:1a0a	85 d1
	lda lbl_ad64+2  ; ba0a:1a0c	ad 66 ad
	sta pnt+1	; ba0d:1a0f	85 d2
	lda zp_02	; ba0f:1a11	a5 02
	sta pntr	; ba11:1a13	85 d3
	lda lbl_b9c8	; ba13:1a15	ad c8 b9
	sta tblx	; ba16:1a18	85 d6
	lda lbl_ad68+1  ; ba18:1a1a	ad 69 ad
	sta user	; ba1b:1a1d	85 f3
	lda lbl_ad68+2  ; ba1d:1a1f	ad 6a ad
	sta user+1	; ba20:1a22	85 f4
	rts		; ba22:1a24	60

getmod:			; &,49
	jsr getmdm	; ba23:1a25	20 5c a9
	sta z_fe	; ba26:1a28	85 fe
	pha		; ba28:1a2a	48
	lda bar		; ba29:1a2b	ad e5 42
	and #$01	; ba2c:1a2e	29 01
	tax		; ba2e:1a30	aa
	pla		; ba2f:1a31	68
	cpx #$00	; ba30:1a32	e0 00
	beq skipba3a	; ba32:1a34	f0 06
	tax		; ba34:1a36	aa
	lda lbl_bce9,x  ; ba35:1a37	bd e9 bc
	sta z_fe	; ba38:1a3a	85 fe
skipba3a:
	cmp #$00	; ba3a:1a3c	c9 00
	beq skipba77	; ba3c:1a3e	f0 39
	ldx lbl_ba7a	; ba3e:1a40	ae 7a ba
	cmp lbl_ba7b,x  ; ba41:1a43	dd 7b ba
	bne skipba72	; ba44:1a46	d0 2c
	inx		; ba46:1a48	e8
	stx lbl_ba7a	; ba47:1a49	8e 7a ba
	cpx #$05	; ba4a:1a4c	e0 05
	bcc skipba77	; ba4c:1a4e	90 29
	pha		; ba4e:1a50	48
	lda lbl_b21c	; ba4f:1a51	ad 1c b2
	lsr a		; ba52:1a54	4a
	lsr a		; ba53:1a55	4a
	lsr a		; ba54:1a56	4a
	lsr a		; ba55:1a57	4a
	ora #$c0	; ba56:1a58	09 c0
	jsr sub_a7ce	; ba58:1a5a	20 ce a7
	lda lbl_b21c	; ba5b:1a5d	ad 1c b2
	jsr sub_ba80	; ba5e:1a60	20 80 ba
	lda lbl_b21b	; ba61:1a63	ad 1b b2
	lsr a		; ba64:1a66	4a
	lsr a		; ba65:1a67	4a
	lsr a		; ba66:1a68	4a
	lsr a		; ba67:1a69	4a
	jsr sub_ba80	; ba68:1a6a	20 80 ba
	lda lbl_b21b	; ba6b:1a6d	ad 1b b2
	jsr sub_ba80	; ba6e:1a70	20 80 ba
	pla		; ba71:1a73	68
skipba72:
	ldx #$00	; ba72:1a74	a2 00
	stx lbl_ba7a	; ba74:1a76	8e 7a ba
skipba77:
	cmp #$00	; ba77:1a79	c9 00
	rts		; ba79:1a7b	60

lbl_ba7a:
	byte $00	; ba7a:1a7c	00

lbl_ba7b:
			; ba7b:1a7d	09 0d 01 07 05
	byte $09,$0d,$01,$07,$05	; "image"

sub_ba80:
	and #$0f	; ba80:1a82	29 0f
	ora #$30	; ba82:1a84	09 30
	cmp #$3a	; ba84:1a86	c9 3a
	bcc skipba8a	; ba86:1a88	90 02
	adc #$06	; ba88:1a8a	69 06
skipba8a:
	jmp sub_a7ce	; ba8a:1a8c	4c ce a7

outmod:			; &,51
	lda bar		; ba8d:1a8f	ad e5 42
	and #$01	; ba90:1a92	29 01
	tax		; ba92:1a94	aa
	lda z_fe	; ba93:1a95	a5 fe
	cpx #$00	; ba95:1a97	e0 00
	bne skipba9c	; ba97:1a99	d0 03
	jmp sub_a7ce	; ba99:1a9b	4c ce a7

skipba9c:
	lda tsr2	; ba9c:1a9e	ad e6 42
	and #$02	; ba9f:1aa1	29 02
	tax		; baa1:1aa3	aa
	lda z_fe	; baa2:1aa4	a5 fe
	and #$1f	; baa4:1aa6	29 1f
	tay		; baa6:1aa8	a8
	lda z_fe	; baa7:1aa9	a5 fe
	cpx #$00	; baa9:1aab	e0 00
	beq skipbad5	; baab:1aad	f0 28
	cmp #$60	; baad:1aaf	c9 60
	bcc skipbad5	; baaf:1ab1	90 24
	cmp #$80	; bab1:1ab3	c9 80
	bcc skipbac1	; bab3:1ab5	90 0c
	cmp #$a0	; bab5:1ab7	c9 a0
	bcc skipbad5	; bab7:1ab9	90 1c
	cmp #$c0	; bab9:1abb	c9 c0
	bcc skipbad0	; babb:1abd	90 13
	cmp #$e0	; babd:1abf	c9 e0
	bcs skipbad5	; babf:1ac1	b0 14
skipbac1:
	lda mupcase	; bac1:1ac3	ad 0c d0
	bne skipbacb	; bac4:1ac6	d0 05
	lda lbl_bd89,y  ; bac6:1ac8	b9 89 bd
	bne skipbadb	; bac9:1acb	d0 10
skipbacb:
	lda lbl_bda9,y	; bacb:1acd	b9 a9 bd
	bne skipbadb	; bace:1ad0	d0 0b
skipbad0:
	lda lbl_bd69,y  ; bad0:1ad2	b9 69 bd
	bne skipbadb	; bad3:1ad5	d0 06
skipbad5:
	tax		; bad5:1ad7	aa
	lda asciitbl,x  ; bad6:1ad8	bd e9 bb
	beq skipbb0b	; bad9:1adb	f0 30
skipbadb:
	pha		; badb:1add	48
	and #$7f	; badc:1ade	29 7f
	cmp #$20	; bade:1ae0	c9 20
	pla		; bae0:1ae2	68
	bcs skipbb08	; bae1:1ae3	b0 25
	cmp #$08	; bae3:1ae5	c9 08
	beq skipbb0c	; bae5:1ae7	f0 25
	cmp #$0d	; bae7:1ae9	c9 0d
	beq skipbb1e	; bae9:1aeb	f0 33
	cmp #$12	; baeb:1aed	c9 12
	beq skipbb69	; baed:1aef	f0 7a
	cmp #$92	; baef:1af1	c9 92
	beq skipbb62	; baf1:1af3	f0 6f
	cmp #$91	; baf3:1af5	c9 91
	beq skipbb3c	; baf5:1af7	f0 45
	cmp #$11	; baf7:1af9	c9 11
	beq skipbb40	; baf9:1afb	f0 45
	cmp #$1d	; bafb:1afd	c9 1d
	beq skipbb44	; bafd:1aff	f0 45
	cmp #$9d	; baff:1b01	c9 9d
	beq skipbb48	; bb01:1b03	f0 45
	jsr sub_a26e	; bb03:1b05	20 6e a2
	bcc skipbb76	; bb06:1b08	90 6e
skipbb08:
	jmp sub_a7ce	; bb08:1b0a	4c ce a7

skipbb0b:
	rts		; bb0b:1b0d	60

bb0c:1b0e	ae f7 42 skipbb0c ldx interm
bb0f:1b11	d0 08		bne skipbb19
bb11:1b13	20 ce a7	jsr sub_a7ce
bb14:1b16	a9 20		lda #$20
bb16:1b18	20 ce a7	jsr sub_a7ce
bb19:1b1b	a9 08	skipbb19 lda #$08
bb1b:1b1d	4c ce a7	jmp sub_a7ce

bb1e:1b20	ad f7 42 skipbb1e lda interm
bb21:1b23	d0 03		bne skipbb26
bb23:1b25	20 62 bb	jsr skipbb62
bb26:1b28	ad e6 42 skipbb26 lda tsr2
bb29:1b2b	29 01		and #$01
bb2b:1b2d	f0 0a		beq skipbb37
bb2d:1b2f	a9 0d		lda #$0d
bb2f:1b31	20 ce a7	jsr sub_a7ce
bb32:1b34	a9 0a		lda #$0a
bb34:1b36	4c ce a7	jmp sub_a7ce

bb37:1b39	a9 0d	skipbb37 lda #$0d
bb39:1b3b	4c ce a7	jmp sub_a7ce

bb3c:1b3e	a9 41	skipbb3c lda #$41
bb3e:1b40	d0 0a		bne skipbb4a
bb40:1b42	a9 42	skipbb40 lda #$42
bb42:1b44	d0 06		bne skipbb4a
bb44:1b46	a9 43	skipbb44 lda #$43
bb46:1b48	d0 02		bne skipbb4a
bb48:1b4a	a9 44	skipbb48 lda #$44
bb4a:1b4c	48	skipbb4a pha
bb4b:1b4d	ad e5 42		lda bar
bb4e:1b50	29 02		and #$02
bb50:1b52	d0 02		bne skipbb54
bb52:1b54	68		pla
bb53:1b55	60		rts

bb54:1b56	a9 1b	skipbb54 lda #$1b
bb56:1b58	20 ce a7	jsr sub_a7ce
bb59:1b5b	a9 5b		lda #$5b
bb5b:1b5d	20 ce a7	jsr sub_a7ce
bb5e:1b60	68		pla
bb5f:1b61	4c ce a7	jmp sub_a7ce

bb62:1b64	a9 33	skipbb62 lda #$33
bb64:1b66	a2 34		ldx #$34
bb66:1b68	4c 6d bb	jmp gotobb6d

bb69:1b6b	a9 34	skipbb69 lda #$34
bb6b:1b6d	a2 33		ldx #$33
bb6d:1b6f	8d cc bb gotobb6d sta lbl_bbcb+1
bb70:1b72	8e db bb	stx l_bbda+1
bb73:1b75	4c b0 bb	jmp gotobbb0

bb76:1b78	a2 0f	skipbb76 ldx #$0f
bb78:1b7a	dd 70 a3 loopbb78 cmp prntcolr,x
bb7b:1b7d	f0 03		beq skipbb80
bb7d:1b7f	ca		dex
bb7e:1b80	d0 f8		bne loopbb78
bb80:1b82	bd 8f bb skipbb80 lda lbl_bb8f,x
bb83:1b85	8d d1 bb	sta lbl_bbd0+1
bb86:1b88	bd 9f bb	lda lbl_bb9f,x
bb89:1b8b	8d c2 bb	sta lbl_bbc1+1
bb8c:1b8e	4c b0 bb	jmp gotobbb0

; ansi colors?
lbl_bb8f:
	ascii "7716524333107247"

lbl_bb9f:
	ascii "0100000100110110"	; bb8f:1b91	tbl-bb9e

; bb9f:1ba1	30 31	lbl_bb9f bmi skipbbd2
; bba1:1ba3	30 30		bmi skipbbd2+1
; bba3:1ba5	30 30		bmi skipbbd5
; bba5:1ba7	30 31		bmi lbl_bbd7+1
; bba7:1ba9	30 30		bmi lbl_bbd7+2
; bba9:1bab	31 31		and (strend),y
; bbab:1bad	30 31		bmi l_bbdc+2
; bbad:1baf	31 30		and (arytab+1),y

loopbbaf:
	rts		; bbaf:1bb1	60
; ansi codes
gotobbb0:
	lda bar		; bbb0:1bb2	ad e5 42
	and #$02	; bbb3:1bb5	29 02
	beq loopbbaf	; bbb5:1bb7	f0 f8
	lda #$1b	; bbb7:1bb9	a9 1b	; escape (27)
	jsr sub_a7ce	; bbb9:1bbb	20 ce a7
	lda #'['	; bbbc:1bbe	a9 5b
	jsr sub_a7ce	; bbbe:1bc0	20 ce a7
lbl_bbc1:
	lda #'0'	; bbc1:1bc3	a9 30
lbl_bbc3:
	jsr sub_a7ce	; bbc3:1bc5	20 ce a7
	lda #';'	; bbc6:1bc8	a9 3b
	jsr sub_a7ce	; bbc8:1bca	20 ce a7
lbl_bbcb:
	lda #'3'	; bbcb:1bcd	a9 33
	jsr sub_a7ce	; bbcd:1bcf	20 ce a7
lbl_bbd0:
	lda #'1'	; bbd0:1bd2	a9 31
skipbbd2:
	jsr sub_a7ce	; bbd2:1bd4	20 ce a7
skipbbd5:
	lda #';'	; bbd5:1bd7	a9 3b
lbl_bbd7:
	jsr sub_a7ce	; bbd7:1bd9	20 ce a7
l_bbda:
	lda #'4'	; bbda:1bdc	a9 34
l_bbdc:
	jsr sub_a7ce	; bbdc:1bde	20 ce a7
	lda #'0'	; bbdf:1be1	a9 30
	jsr sub_a7ce	; bbe1:1be3	20 ce a7
skipbbe4:
	lda #$6d	; bbe4:1be6	a9 6d
	jmp sub_a7ce	; bbe6:1be8	4c ce a7

bbe9:1beb	tbl-bc84 asciitbl byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09
bbf3:1bf5			byte $0a,$0b,$0c,$0d,$00,$0f,$10,$11,$12,$13
bbfd:1bff			byte $08,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d
bc07:1c09			byte $1e,$1f,$20,$21,$22

bc0c:1c0e		skipbc0c byte $23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c
bc16:1c18			byte $2d,$2e,$2f,$30,$31,$32,$33,$34,$35,$36
bc20:1c22			byte $37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f,$40
bc2a:1c2c			byte $61,$62,$63,$64,$65,$66,$67,$68,$69,$6a
bc34:1c36			byte $6b,$6c,$6d,$6e,$6f,$70,$71,$72,$73,$74
bc3e:1c40			byte $75,$76,$77,$78,$79,$7a,$5b,$5c,$5d,$5e
bc48:1c4a			byte $5f,$2d,$41,$42

bc4c:1c4e		skipbc4c byte $43,$44,$45,$46,$47,$48,$49,$4a,$4b,$4c
bc56:1c58			byte $4d,$4e,$4f,$50,$51,$52,$53,$54,$55,$56
bc60:1c62			byte $57,$58,$59,$5a,$2a,$2d,$21,$2a,$2a,$00
bc6a:1c6c			byte $81,$00,$00,$00,$00,$00,$00,$00,$00,$00
bc74:1c76			byte $00,$00,$0d,$00,$00,$00,$91,$92,$0c,$00
bc7e:1c80			byte $95,$96,$97,$98,$99,$9a,$9b

bc85:1c87	tbl-bce8 tablbc85 byte $9c,$9d,$9e,$9f,$20,$21,$2d,$2d,$2d,$21
bc8f:1c91			byte $2a,$21,$2d,$2a,$21,$2a,$2a,$2a,$2a,$2d
bc99:1c9b			byte $2a,$2a,$2a,$2a,$21,$21,$21,$2d,$2d,$2d
bca3:1ca5			byte $2a,$2a,$2a,$2a,$2a,$2a,$2d,$41,$42

bcac:1cae		skipbcac byte $43,$44,$45,$46,$47,$48,$49,$4a,$4b,$4c
bcb6:1cb8			byte $4d,$4e,$4f,$50,$51,$52,$53,$54,$55,$56
bcc0:1cc2			byte $57,$58,$59,$5a,$2a,$21,$21,$2a,$2a,$20
bcca:1ccc			byte $21,$2d,$2d,$2d,$21,$2a,$21,$2d,$2a,$21
bcd4:1cd6			byte $2a,$2a,$2a,$2a,$2d,$2a,$2a,$2a,$2a,$21
bcde:1ce0			byte $21,$21,$2d,$2d,$2d,$2a,$2a,$2a,$2a,$2a
bce8:1cea			byte $2a

bce9:1ceb	tbl-bd68 lbl_bce9 byte $00,$00,$02,$00,$04,$00,$00,$00,$14,$09
bcf3:1cf5			byte $00,$00,$93,$0d,$0e,$0f,$00,$11,$00,$13
bcfd:1cff			byte $14,$15,$16,$17,$18,$19,$00,$1b,$00,$00
bd07:1d09			byte $00,$00,$20,$21,$22

bd0c:1d0e		skipbd0c byte $23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c
bd16:1d18			byte $2d,$2e,$2f,$30,$31,$32,$33,$34,$35,$36
bd20:1d22			byte $37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f,$40
bd2a:1d2c			byte $c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$ca
bd34:1d36			byte $cb,$cc,$cd,$ce,$cf,$d0,$d1,$d2,$d3,$d4
bd3e:1d40			byte $d5,$d6,$d7,$d8,$d9,$da,$5b,$5c,$5d,$5e
bd48:1d4a			byte $5f,$00,$41,$42

bd4c:1d4e	tbl-bd4d skipbd4c byte $43,$44

bd4e:1d50			byte $45,$46,$47,$48,$49,$4a,$4b,$4c,$4d,$4e
bd58:1d5a			byte $4f,$50,$51,$52,$53,$54,$55,$56,$57,$58
bd62:1d64			byte $59,$5a,$00,$00,$00,$00,$14

bd69:1d6b	tbl-bdc8 lbl_bd69 byte $20,$dd,$dc,$c4,$5f,$b3,$b2,$b3,$dc,$2f
bd73:1d75			byte $de,$c3,$c9,$c0,$bf,$dc,$da,$c1,$c2,$b4
bd7d:1d7f			byte $dd,$dd,$de,$df,$df,$dc,$d9,$bb,$c8,$d9
bd87:1d89			byte $bc,$b0

bd89:1d8b		lbl_bd89 byte $c4,$41,$42,$43,$44,$45,$46,$47,$48,$49
bd93:1d95			byte $4a,$4b,$4c,$4d,$4e,$4f,$50,$51,$52,$53
bd9d:1d9f			byte $54,$55,$56,$57,$58,$59,$5a,$c5,$dd,$b3
bda7:1da9			byte $b2,$5c

bda9:1dab	tbl-bdab lbl_bda9 byte $c4,$2a,$b3

bdac:1dae	tbl-bdad skipbdac byte $c4,$c4

bdae:1db0	tbl-bdb9 tbl_bdae	byte $c4,$c4,$b3,$b3,$bf,$c0,$d9,$c0,$5c,$2f
bdb8:1dba			byte $da,$bf

bdba:1dbc			byte $fe,$c4,$2a,$b3,$da,$2a,$fe,$2a,$b3,$2a
bdc4:1dc6			byte $c5,$dd,$b3,$e3,$5c

gotobdc9:
	cmp mod_be07	; bdc9:1dcb	cd 07 be
	beq mod_be04	; bdcc:1dce	f0 36
	sta mod_be07+1  ; bdce:1dd0	8d 08 be
	lda mod_be07	; bdd1:1dd3	ad 07 be
	pha		; bdd4:1dd6	48
	lda mod_be07+1  ; bdd5:1dd7	ad 08 be
	sta mod_be07	; bdd8:1dda	8d 07 be
	jsr sub_bdef	; bddb:1ddd	20 ef bd
	jsr mod_be04	; bdde:1de0	20 04 be
	jsr sub_bdef	; bde1:1de3	20 ef bd
	sta mod_be07+1  ; bde4:1de6	8d 08 be
	pla		; bde7:1de9	68
	sta mod_be07	; bde8:1dea	8d 07 be
	lda mod_be07+1  ; bdeb:1ded	ad 08 be
	rts		; bdee:1df0	60

sub_bdef:
	pha		; bdef:1df1	48
	txa		; bdf0:1df2	8a
	pha		; bdf1:1df3	48
	tya		; bdf2:1df4	98
	pha		; bdf3:1df5	48
	lda mod_be07	; bdf4:1df6	ad 07 be
	ldy #$c0	; bdf7:1df9	a0 c0
	ldx #$04	; bdf9:1dfb	a2 04
	jsr swapper	; bdfb:1dfd	20 80 ca
	pla		; bdfe:1e00	68
	tay		; bdff:1e01	a8
	pla		; be00:1e02	68
	tax		; be01:1e03	aa
	pla		; be02:1e04	68
	rts		; be03:1e05	60

mod_be04:
	jmp $c000	; be04:1e06	4c 00 c0

mod_be07:
			; be07:1e09	tbl-be09
	byte $00,$00,$d0

lbl_be0a:
	sei		; be0a:1e0c	78
gotobe0b:
	sta mod_be04+1	; be0b:1e0d	8d 05 be
	lda #$f0	; be0e:1e10	a9 f0		l
	jmp gotobdc9	; be10:1e12	4c c9 bd

jmp_be13:
; do routine in .a?
	sta mod_be04+1	; be13:1e15	8d 05 be
	lda #$f4	; be16:1e18	a9 f4
	jmp gotobdc9	; be18:1e1a	4c c9 bd

sub_be1b:
	sta mod_be04+1	; be1b:1e1d	8d 05 be
	lda #$f8	; be1e:1e20	a9 f8
	jmp gotobdc9	; be20:1e22	4c c9 bd

inline:
	lda #$00	; be23:1e25	a9 00
	jmp gotobe0b	; be25:1e27	4c 0b be

sub_be28:
	lda #$03	; be28:1e2a	a9 03
	jmp gotobe0b	; be2a:1e2c	4c 0b be

password:		; &,6
	lda #$06	; be2d:1e2f	a9 06
	jmp gotobe0b	; be2f:1e31	4c 0b be

editor:			; &,54
	lda #$09	; be32:1e34	a9 09
	jsr gotobe0b	; be34:1e36	20 0b be
	pha		; be37:1e39	48
	lda mod_be07+2  ; be38:1e3a	ad 09 be
	cmp lbl_beab	; be3b:1e3d	cd ab be
	bne skipbe4a	; be3e:1e40	d0 0a
	lda lbl_be0a	; be40:1e42	ad 0a be
	cmp lbl_beac	; be43:1e45	cd ac be
	bne skipbe4a	; be46:1e48	d0 02
	pla		; be48:1e4a	68
	rts		; be49:1e4b	60

skipbe4a:
	pla		; be4a:1e4c	68
	ldx #$01	; be4b:1e4d	a2 01
	txa		; be4d:1e4f	8a
	rts		; be4e:1e50	60

term:			; &,10
	lda #$00	; be4f:1e51	a9 00
	jmp jmp_be13	; be51:1e53	4c 13 be

jmp_be54:		; &,56?
	lda #$03	; be54:1e56	a9 03		l
	jmp jmp_be13	; be56:1e58	4c 13 be

clrarr:			; &,11
	lda #$06	; be59:1e5b	a9 06
	jmp jmp_be13	; be5b:1e5d	4c 13 be

jmp_be5e:		; &,57?
	lda #$09	; be5e:1e60	a9 09
	jmp jmp_be13	; be60:1e62	4c 13 be

btmvar:			; &,9
	lda #$0c	; be63:1e65	a9 0c
	jmp jmp_be13	; be65:1e67	4c 13 be

read0:
	lda #$00	; be68:1e6a	a9 00
	jmp sub_be1b	; be6a:1e6c	4c 1b be

newusr:			; &,12
	lda #$03	; be6d:1e6f	a9 03		l
	jmp sub_be1b	; be6f:1e71	4c 1b be

arraysav:		; &,27
	lda #$06	; be72:1e74	a9 06		l
	jmp sub_be1b	; be74:1e76	4c 1b be

arrayres:		; &,28
	lda #$09	; be77:1e79	a9 09
	jmp sub_be1b	; be79:1e7b	4c 1b be

	lda #$0c	; be7c:1e7e	a9 0c
	jsr sub_be1b	; be7e:1e80	20 1b be
	jmp outastr	; be81:1e83	4c 67 b5

; some serial # stuff?
sound:			; &,25
	lda #$0f	; be84:1e86	a9 0f
	jsr sub_be1b	; be86:1e88	20 1b be
	ldx #$02	; be89:1e8b	a2 02
	lda mod_be07+1,x; be8b:1e8d	bd 08 be
	lsr a		; be8e:1e90	4a
	lsr a		; be8f:1e91	4a
	lsr a		; be90:1e92	4a
	lsr a		; be91:1e93	4a
	ora #$c0	; be92:1e94	09 c0
	sta var_02fc,x	; be94:1e96	9d fc 02
	lda mod_be07,x	; be97:1e99	bd 07 be
	sec		; be9a:1e9c	38
	sbc #$ff	; be9b:1e9d	e9 ff
	sta var_02fc,x	; be9d:1e9f	9d fc 02
	lda mod_be07+1,x; bea0:1ea2	bd 08 be
	sbc #$00	; bea3:1ea5	e9 00
	and #$0f	; bea5:1ea7	29 0f
	sta bsnpre,x	; bea7:1ea9	9d fd 02
	rts		; beaa:1eac	60

lbl_beab:
	byte $d0	; beab:1ead	tbl-beac
lbl_beac:
	byte $78	; beac:1eae
tablbead:
bead:1eaf	tbl-bfff  byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
beb7:1eb9			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bec1:1ec3			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
becb:1ecd			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bed5:1ed7			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bedf:1ee1			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bee9:1eeb			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bef3:1ef5			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
befd:1eff			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf07:1f09			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf11:1f13			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf1b:1f1d			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf25:1f27			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf2f:1f31			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf39:1f3b			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf43:1f45			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf4d:1f4f			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf57:1f59			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf61:1f63			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf6b:1f6d			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf75:1f77			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf7f:1f81			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf89:1f8b			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf93:1f95			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf9d:1f9f			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfa7:1fa9			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfb1:1fb3			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfbb:1fbd			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfc5:1fc7			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfcf:1fd1			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfd9:1fdb			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfe3:1fe5			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

bfed:1fef		lbl_bfed byte $00

bfee:1ff0		lbl_bfee byte $00

bfef:1ff1		lbl_bfef byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bff9:1ffb			byte $00

bffa:1ffc		lbl_bffa byte $00

bffb:1ffd		lbl_bffb byte $00,$00

bffd:1fff		lbl_bffd byte $00,$00,$00

lbl_c000:
	jmp gotoc00b	; c000:2002	4c 0b c0

c003:2005	4c 85 c1		jmp gotoc185

c006:2008	tbl-c00a tablc006 byte $ff

; serial # stuff
		; $d1 = 209
		; $77 = 119
		; $f4 = 244
		; $78 = 120
lbl_c007:
	byte $d1	; c007:2009	tbl-c007

c008:200a	tbl-c00a lbl_c008 byte $77,$f4,$78

gotoc00b:
	ldx fa		; c00b:200d	a6 ba
	stx lbl_c184	; c00d:200f	8e 84 c1
	lda #$01	; c010:2012	a9 01
	ldx lbl_c184	; c012:2014	ae 84 c1
	ldy #$01	; c015:2017	a0 01
	jsr setlfs	; c017:2019	20 ba ff
	lda len_screen  ; c01a:201c	ad 5d c1
	ldx <sScreen	; c01d:201f	a2 5e
	ldy >sScreen	; c01f:2021	a0 c1
	jsr setname	; c021:2023	20 bd ff
	ldx #$01	; c024:2026	a2 01
	lda #$02	; c026:2028	a9 02
	sta mod_c03d,x  ; c028:202a	9d 3d c0
	dex		; c02b:202d	ca
	txa		; c02c:202e	8a
	jsr load	; c02d:202f	20 d5 ff
	jsr lbl_c113	; c030:2032	20 13 c1
chk_c033:
	jsr sub_c2b1	; c033:2035	20 b1 c2
	lda lbl_c2d3	; c036:2038	ad d3 c2
	cmp #$02	; c039:203b	c9 02
	bne skipc045	; c03b:203d	d0 08
mod_c03d:
	lda #$02	; c03d:203f	a9 02
	sta lbl_c2d3	; c03f:2041	8d d3 c2
	jsr sub_c2b1	; c042:2044	20 b1 c2
skipc045:
	lda #$01	; c045:2047	a9 01
	sta txttab	; c047:2049	85 2b
	lda #$46	; c049:204b	a9 46
	sta txttab+1	; c04b:204d	85 2c
	lda #$01	; c04d:204f	a9 01
	ldx lbl_c184	; c04f:2051	ae 84 c1
	ldy #$00	; c052:2054	a0 00
	jsr setlfs	; c054:2056	20 ba ff
	lda len_im	; c057:2059	ad 68 c1
	ldx #<sIM	; c05a:205c	a2 69
	ldy #>sIM	; c05c:205e	a0 c1
	jsr setname	; c05e:2060	20 bd ff
	lda #$00	; c061:2063	a9 00
	ldx txttab	; c063:2065	a6 2b
	ldy txttab+1	; c065:2067	a4 2c
	jsr load	; c067:2069	20 d5 ff
	stx vartab	; c06a:206c	86 2d
	sty vartab+1	; c06c:206e	84 2e
	lda vartab	; c06e:2070	a5 2d
	clc		; c070:2072	18
	adc mod_c03d+1	; c071:2073	6d 3e c0
	sta vartab	; c074:2076	85 2d
	bcc skipc07a	; c076:2078	90 02
	inc vartab+1	; c078:207a	e6 2e
skipc07a:
	ldx vartab	; c07a:207c	a6 2d
	ldy vartab+1	; c07c:207e	a4 2e
	stx arytab	; c07e:2080	86 2f
	sty arytab+1	; c080:2082	84 30
	stx strend	; c082:2084	86 31
	sty strend+1	; c084:2086	84 32
	inc vartab+1	; c086:2088	e6 2e
	jsr linkprg	; c088:208a	20 33 a5
	lda #$01	; c08b:208d	a9 01
	sta txttab	; c08d:208f	85 2b
	lda #$08	; c08f:2091	a9 08
	sta txttab+1	; c091:2093	85 2c
	jsr sub_c14a	; c093:2095	20 4a c1
	jsr sub_c116	; c096:2098	20 16 c1
;
; clear out rs232 routines
;
	lda #$60	; c099:209b	a9 60
	ldy #$00	; c09b:209d	a0 00
loopc09d:
	sta rsinit,y	; c09d:209f	99 00 43 loo
	dey		; c0a0:20a2	88
	bne loopc09d	; c0a1:20a3	d0 fa
	lda #$10	; c0a3:20a5	a9 10
	ldy #$e0	; c0a5:20a7	a0 e0
	ldx #$20	; c0a7:20a9	a2 20
	jsr swapper	; c0a9:20ab	20 80 ca
	lda #$01	; c0ac:20ae	a9 01
	ldx lbl_c184	; c0ae:20b0	ae 84 c1
	ldy #$01	; c0b1:20b3	a0 01
	jsr setlfs	; c0b3:20b5	20 ba ff
	lda len_mlextra ; c0b6:20b8	ad 71 c1
	ldx #<sMLextra	; c0b9:20bb	a2 72
	ldy #>sMLextra	; c0bb:20bd	a0 c1
	jsr setname	; c0bd:20bf	20 bd ff
	lda #$00	; c0c0:20c2	a9 00
	jsr load	; c0c2:20c4	20 d5 ff
	lda #$10	; c0c5:20c7	a9 10
	ldy #$e0	; c0c7:20c9	a0 e0
	ldx #$20	; c0c9:20cb	a2 20
	jsr swapper	; c0cb:20cd	20 80 ca
	lda #$10	; c0ce:20d0	a9 10
	ldy #$d0	; c0d0:20d2	a0 d0
	ldx #$10	; c0d2:20d4	a2 10
	jsr swapper	; c0d4:20d6	20 80 ca
	lda #$01	; c0d7:20d9	a9 01
	ldx lbl_c184	; c0d9:20db	ae 84 c1
	ldy #$01	; c0dc:20de	a0 01
	jsr setlfs	; c0de:20e0	20 ba ff
	lda len_mleditor; c0e1:20e3	ad 7a c1
	ldx #<sMLeditor	; c0e4:20e6	a2 7b
	ldy #>sMLeditor	; c0e6:20e8	a0 c1
	jsr setname	; c0e8:20ea	20 bd ff
	lda #$00	; c0eb:20ed	a9 00
	jsr load	; c0ed:20ef	20 d5 ff
	lda #$10	; c0f0:20f2	a9 10
	ldy #$d0	; c0f2:20f4	a0 d0
	ldx #$10	; c0f4:20f6	a2 10
	jsr swapper	; c0f6:20f8	20 80 ca
	ldx #$05	; c0f9:20fb	a2 05
	stx ndx	 ; c0fb:20fd	86 c6
loopc0fd:
	lda tablc10e-1,x; c0fd:20ff	bd 0d c1
	sta keyd-1,x	; c100:2102	9d 76 02
	dex		; c103:2105	ca
	bne loopc0fd	; c104:2106	d0 f7
	lda #$00	; c106:2108	a9 00
	sta color	; c108:210a	8d 86 02
	jmp (imain)	; c10b:210d	6c 02 03

c10e:2110		  tablc10e ascii " run"
				byte 13	; keyboard buffer?

lbl_c113:
	jmp $5f03	; c113:2115	4c 03 5f

sub_c116:
	lda chk_c033	; c116:2118	ad 33 c0
	cmp #$20	; c119:211b	c9 20	; is it JSR?
	bne sub_c116    ; c11b:211d	d0 f9
	lda chk_c033+1  ; c11d:211f	ad 34 c0
	cmp #$b1        ; c120:2122	c9 b1
	bne sub_c116    ; c122:2124	d0 f2
	lda chk_c033+2  ; c124:2126	ad 35 c0
	cmp #$c2        ; c127:2129	c9 c2
	bne sub_c116	; c129:212b	d0 eb	; not JSR $c2b1... loop back
	lda #{%:00010111};c12b:212d	a9 17
	sta vicbase     ; c12d:212f	8d 18 d0
	lda #$1b        ; c130:2132	a9 1b
	sta vicregy     ; c132:2134	8d 11 d0
	lda #$c8        ; c135:2137	a9 c8
	sta vicregx     ; c137:2139	8d 16 d0
	lda #{%:11000111};c13a:213c	a9 c7
	sta cia2prta    ; c13c:213e	8d 00 dd
	lda #clear      ; c13f:2141	a9 93
	jsr chrout      ; c141:2143	20 d2 ff
	lda #$00        ; c144:2146	a9 00
	sta bckgrnd0    ; c146:2148	8d 21 d0
	rts             ; c149:214b	60

sub_c14a:
	lda len_setup	; c14a:214c	ad 6b c1
	sta fac1        ; c14d:214f	85 61
	lda #<sSetup    ; c14f:2151	a9 6c
	sta fac1+1      ; c151:2153	85 62
	lda #>sSetup    ; c153:2155	a9 c1
	sta fac1+2      ; c155:2157	85 63
	lda lbl_c184    ; c157:2159	ad 84 c1
	jmp gotoc355    ; c15a:215c	4c 55 c3

		;
		; length byte, filename
		;
len_screen:
	byte 10	; c15d:215f	tbl-c183

sScreen:
	ascii "screen 1.2"

len_im:
	byte 2		; c168:216a
sIM:
	ascii "im"	; c169:216b

len_setup:
	byte 5
sSetup:
	ascii "setup"	; c16b:216d

len_mlextra:
	byte 8		; c171:2173

sMLextra:
	ascii "ml.extra"

len_mleditor:
	byte 8		; c17a:217c
sMLeditor:
	ascii "ml.editor"

lbl_c184:
	byte $08	; c184:2186	tbl-c184

; looks like some kind of initialization...
gotoc185:
	lda #$00	; c185:2187	a9 00
	sta clock       ; c187:2189	8d fa 07
	sta chatpage    ; c18a:218c	8d 08 d0
	sta tsr         ; c18d:218f	8d 03 d0
	sta chk_left    ; c190:2192	8d f4 07
	sta chk_right   ; c193:2195	8d f5 07
	sta access      ; c196:2198	8d 09 d0
	lda #$01        ; c199:219b	a9 01
	sta local       ; c19b:219d	8d 00 d0
	ldy #$00        ; c19e:21a0	a0 00
	tya             ; c1a0:21a2	98
loopc1a1:
	sta tempbott,y	; c1a1:21a3	99 00 40
	sta $4100,y     ; c1a4:21a6	99 00 41
	sta tempcol+16,y; c1a7:21a9	99 00 42
	dey             ; c1aa:21ac	88
	bne loopc1a1    ; c1ab:21ad	d0 f4
	lda #$60        ; c1ad:21af	a9 60
	ldy #$00        ; c1af:21b1	a0 00
loopc1b1:
	sta rsinit,y	; c1b1:21b3	99 00 43
	dey             ; c1b4:21b6	88
	bne loopc1b1    ; c1b5:21b7	d0 fa
	ldy #$1f        ; c1b7:21b9	a0 1f
loopc1b9:
	lda #$40       ; c1b9:21bb	a9 40
	sta pmodetbl,y  ; c1bb:21bd	99 a0 40
	dey             ; c1be:21c0	88
	lda #$c0        ; c1bf:21c1	a9 c0
	sta pmodetbl,y  ; c1c1:21c3	99 a0 40
	dey             ; c1c4:21c6	88
	bpl loopc1b9    ; c1c5:21c7	10 f2
	lda #$ff        ; c1c7:21c9	a9 ff
	sta $40c0       ; c1c9:21cb	8d c0 40
	lda #$00        ; c1cc:21ce	a9 00
	sta $40c1       ; c1ce:21d0	8d c1 40
	lda #$d8        ; c1d1:21d3	a9 d8
	sta mask        ; c1d3:21d5	8d f2 42
	lda #$02        ; c1d6:21d8	a9 02
	sta undcol      ; c1d8:21da	8d e8 42
	lda #$00        ; c1db:21dd	a9 00
	sta scnmode     ; c1dd:21df	8d f3 42
	jsr sub_c21b    ; c1e0:21e2	20 1b c2
	jsr sub_c240    ; c1e3:21e5	20 40 c2
	jsr sub_c283    ; c1e6:21e8	20 83 c2
	jsr sub_c29a    ; c1e9:21eb	20 9a c2
	jsr sub_c335    ; c1ec:21ee	20 35 c3
	lda #$36        ; c1ef:21f1	a9 36
	sta $01         ; c1f1:21f3	85 01
	jsr sub_c264    ; c1f3:21f5	20 64 c2
	jsr sub_a47e    ; c1f6:21f8	20 7e a4
	jsr $cb00       ; c1f9:21fb	20 00 cb
	lda #$37        ; c1fc:21fe	a9 37
	sta $01         ; c1fe:2200	85 01
		;
		; serial # stuff
		;
	lda lbl_c008	; c200:2202	ad 08 c0
	lsr a           ; c203:2205	4a
	lsr a           ; c204:2206	4a
	lsr a           ; c205:2207	4a
	lsr a           ; c206:2208	4a
	ora #$c0        ; c207:2209	09 c0
	sta bsnprelo    ; c209:220b	8d fd 02
	lda lbl_c008    ; c20c:220e	ad 08 c0
	and #$0f        ; c20f:2211	29 0f
	sta bsnvalhi    ; c211:2213	8d ff 02
	lda lbl_c007    ; c214:2216	ad 07 c0
	sta bsnvallo    ; c217:2219	8d fe 02
	rts             ; c21a:221c	60

; set up bsout vector
sub_c21b:
	lda ibsout	; c21b:221d	ad 26 03
	cmp #$2f        ; c21e:2220	c9 2f
	bne skipc229    ; c220:2222	d0 07
	lda ibsout+1    ; c222:2224	ad 27 03
	cmp #$cd        ; c225:2227	c9 cd
	beq skipc23f    ; c227:2229	f0 16
skipc229:
	lda ibsout    ; c229:222b	ad 26 03
	sta $cd4c+1     ; c22c:222e	8d 4d cd
	lda ibsout+1    ; c22f:2231	ad 27 03
	sta $cd4c+2     ; c232:2234	8d 4e cd
	lda #$2f        ; c235:2237	a9 2f
	sta ibsout      ; c237:2239	8d 26 03
	lda #$cd        ; c23a:223c	a9 cd
	sta ibsout+1    ; c23c:223e	8d 27 03
skipc23f:
	rts            ; c23f:2241	60

sub_c240:
	lda #$7f	; c240:2242	a9 7f
	sta cia1icr     ; c242:2244	8d 0d dc
	lda #$32        ; c245:2247	a9 32
	sta cinv        ; c247:2249	8d 14 03
	lda #$cc        ; c24a:224c	a9 cc
	sta cinv+1      ; c24c:224e	8d 15 03
	lda #{%10000001}; c24f:2251	a9 81
	sta vicirqm     ; c251:2253	8d 1a d0
	lda #$00        ; c254:2256	a9 00
	sta raster      ; c256:2258	8d 12 d0
	lda #{%00011011}; c259:225b	a9 1b
	sta vicregy     ; c25b:225d	8d 11 d0
	lda #$00        ; c25e:2260	a9 00
	sta irqcount    ; c260:2262	8d 0d d0
	rts             ; c263:2265	60

sub_c264:
	lda #$0b	; c264:2266	a9 0b
	sta bordrclr    ; c266:2268	8d 20 d0
	lda #$00        ; c269:226b	a9 00
	sta bckgrnd0    ; c26b:226d	8d 21 d0
	lda #$0e        ; c26e:2270	a9 0e
	jsr chrout      ; c270:2272	20 d2 ff
	lda #$08        ; c273:2275	a9 08
	jsr chrout      ; c275:2277	20 d2 ff
	lda #$05        ; c278:227a	a9 05
	jsr chrout      ; c27a:227c	20 d2 ff
	jsr sub_ae8f    ; c27d:227f	20 8f ae
	jmp sub_aed3    ; c280:2282	4c d3 ae

; set up new IGONE vector
sub_c283:
	lda igone	; c283:2285	ad 08 03
	ldx igone+1     ; c286:2288	ae 09 03
	sta mod_cdbd+1  ; c289:228b	8d be cd
	stx mod_cdbd+2  ; c28c:228e	8e bf cd
	lda #$97        ; c28f:2291	a9 97
	ldx #$cd        ; c291:2293	a2 cd
	sta igone       ; c293:2295	8d 08 03
	stx igone+1     ; c296:2298	8e 09 03
	rts             ; c299:229b	60

sub_c29a:
	lda iload	; c29a:229c	ad 30 03
lbl_c29d:
	ldx iload+1	; c29d:229f	ae 31 03
	sta var_e404    ; c2a0:22a2	8d 04 e4
	stx var_e405    ; c2a3:22a5	8e 05 e4
	lda #$c8        ; c2a6:22a8	a9 c8
	ldx #$ca        ; c2a8:22aa	a2 ca
	sta iload       ; c2aa:22ac	8d 30 03
	stx iload+1     ; c2ad:22af	8e 31 03
	rts             ; c2b0:22b2	60

sub_c2b1:
	ldx #$0d	; c2b1:22b3	a2 0d
	sec             ; c2b3:22b5	38
	lda lbl_bffb+1,x; c2b4:22b6	bd fc bf
	sbc lbl_bffa,x  ; c2b7:22b9	fd fa bf
	php             ; c2ba:22bc	08
	cmp #$23        ; c2bb:22bd	c9 23
	bne lbl_c2d3    ; c2bd:22bf	d0 14
	plp             ; c2bf:22c1	28
	lda lbl_bffd,x  ; c2c0:22c2	bd fd bf
	sbc lbl_bffb,x  ; c2c3:22c5	fd fb bf
	cmp #$01        ; c2c6:22c8	c9 01
	bne lbl_c2d3    ; c2c8:22ca	d0 09
	lda lbl_c2d3    ; c2ca:22cc	ad d3 c2
	eor #$62        ; c2cd:22cf	49 62
	sta lbl_c2d2    ; c2cf:22d1	8d d2 c2
lbl_c2d2:
	rts            ; c2d2:22d4	60

lbl_c2d3:
	byte $02	; c2d3:22d5	tbl-c2d3

sub_c2d4:
	txa		; c2d4:22d6	8a
	asl a           ; c2d5:22d7	0a
	tay             ; c2d6:22d8	a8
	lda lbl_c2e5+1,y; c2d7:22d9	b9 e6 c2
	tax             ; c2da:22dc	aa
	lda lbl_c2e5,y  ; c2db:22dd	b9 e5 c2
	sta varnam      ; c2de:22e0	85 45
	stx varnam+1    ; c2e0:22e2	86 46
	jmp gotocd4f    ; c2e2:22e4	4c 4f cd

c2e5:22e7	tbl-c334 lbl_c2e5 byte $41,$ce,$41,$80	; variables
c2e9:22eb			byte $42,$80,$54,$d2
c2ed:22ef			byte $44,$b1,$44,$b2
c2f1:22f3			byte $44,$b3,$44,$b4
c2f5:22f7			byte $44,$b5,$4c,$c4
c2f9:22fb			byte $54,$d4,$4e,$c1
c2fd:22ff			byte $52,$ce,$50,$c8
c301:2303			byte $41,$cb,$4c,$50
c305:2307			byte $50,$4c,$52,$43
c309:230b			byte $53,$48,$4d,$57
c30d:230f			byte $4e,$4c,$55,$4c
c311:2313			byte $51,$45,$52,$51
c315:2317			byte $c1,$c3,$45,$46
c319:231b			byte $4c,$46,$57,$80
c31d:231f			byte $50,$80,$d4,$d2
c321:2323			byte $c1,$80,$c2,$80
c325:2327			byte $c4,$d6,$44,$d2
c329:232b			byte $43,$b1,$43,$b2
c32d:232f			byte $43,$cf,$43,$c8
c331:2333			byte $cb,$d0,$43,$b3

sub_c335:
	lda #$27	; c335:2337	a9 27
	sta tmp1        ; c337:2339	8d fc 07
loopc33a:
	ldx tmp1	; c33a:233c	ae fc 07
	jsr sub_c2d4    ; c33d:233f	20 d4 c2
	lda tmp1        ; c340:2342	ad fc 07
	asl a           ; c343:2345	0a
	tay             ; c344:2346	a8
	lda varpnt      ; c345:2347	a5 47
	sta vartable,y  ; c347:2349	99 cc b5
	lda varpnt+1    ; c34a:234c	a5 48
	sta vartable+1,y; c34c:234e	99 cd b5
	dec tmp1        ; c34f:2351	ce fc 07
	bpl loopc33a    ; c352:2354	10 e6
	rts             ; c354:2356	60

gotoc355:
	ldx txttab	; c355:2357	a6 2b
	ldy txttab+1    ; c357:2359	a4 2c
	jsr sub_c36e    ; c359:235b	20 6e c3
	bcc skipc35f    ; c35c:235e	90 01
	rts             ; c35e:2360	60

skipc35f:
	ldx txttab	; c35f:2361	a6 2b
	ldy txttab+1    ; c361:2363	a4 2c
	stx sal         ; c363:2365	86 ac
	sty sal+1       ; c365:2367	84 ad
	ldx #$01        ; c367:2369	a2 01
	ldy #$46        ; c369:236b	a0 46
	jmp gotoc39c    ; c36b:236d	4c 9c c3

sub_c36e:
	stx sal	; c36e:2370	86 ac
	sty sal+1       ; c370:2372	84 ad
	cmp #$07        ; c372:2374	c9 07
	bcs skipc378    ; c374:2376	b0 02
lbl_2378:
	lda #$08       ; c376:2378	a9 08
skipc378:
	sta filenum   ; c378:237a	8d f7 07
	lda #$00        ; c37b:237d	a9 00
	jsr setmsg      ; c37d:237f	20 90 ff
	lda #$01        ; c380:2382	a9 01
	ldx filenum     ; c382:2384	ae f7 07
	ldy #$00        ; c385:2387	a0 00
	jsr setlfs      ; c387:2389	20 ba ff
	lda fac1        ; c38a:238c	a5 61
	ldx fac1+1      ; c38c:238e	a6 62
	ldy fac1+2      ; c38e:2390	a4 63
	jsr setname     ; c390:2392	20 bd ff
	lda #$00        ; c393:2395	a9 00
	ldx sal         ; c395:2397	a6 ac
	ldy sal+1       ; c397:2399	a4 ad
	jmp load        ; c399:239b	4c d5 ff

gotoc39c:
	txa		; c39c:239e	8a
	pha             ; c39d:239f	48
	tya             ; c39e:23a0	98
	pha             ; c39f:23a1	48
	lda txttab      ; c3a0:23a2	a5 2b
	pha             ; c3a2:23a4	48
	lda txttab+1    ; c3a3:23a5	a5 2c
	pha             ; c3a5:23a7	48
	ldx sal         ; c3a6:23a8	a6 ac
	ldy sal+1       ; c3a8:23aa	a4 ad
	stx txttab      ; c3aa:23ac	86 2b
	sty txttab+1    ; c3ac:23ae	84 2c
	jsr sub_cd5c    ; c3ae:23b0	20 5c cd
	pla             ; c3b1:23b3	68
	sta txttab+1    ; c3b2:23b4	85 2c
	pla             ; c3b4:23b6	68
	sta txttab      ; c3b5:23b7	85 2b
gotoc3b7:
	ldy #$00       ; c3b7:23b9	a0 00
	lda (sal),y     ; c3b9:23bb	b1 ac
	sta fbufpt      ; c3bb:23bd	85 71
	iny             ; c3bd:23bf	c8
	lda (sal),y     ; c3be:23c0	b1 ac
	sta fbufpt+1    ; c3c0:23c2	85 72
	sta fbufpt+1    ; c3c2:23c4	85 72
	lda (fbufpt),y  ; c3c4:23c6	b1 71
	beq skipc3d3    ; c3c6:23c8	f0 0b
	lda fbufpt      ; c3c8:23ca	a5 71
	sta sal         ; c3ca:23cc	85 ac
	lda fbufpt+1    ; c3cc:23ce	a5 72
	sta sal+1       ; c3ce:23d0	85 ad
	jmp gotoc3b7    ; c3d0:23d2	4c b7 c3

skipc3d3:
	pla		; c3d3:23d5	68
	sta (sal),y     ; c3d4:23d6	91 ac
	dey             ; c3d6:23d8	88
	pla             ; c3d7:23d9	68
	sta (sal),y     ; c3d8:23da	91 ac
	rts             ; c3da:23dc	60

c3db:23dd	tbl-ca7f tablc3db byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c3e5:23e7			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c3ef:23f1			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c3f9:23fb			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c403:2405			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c40d:240f			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c417:2419			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c421:2423			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c42b:242d			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c435:2437			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c43f:2441			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c449:244b			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c453:2455			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c45d:245f			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c467:2469			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c471:2473			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c47b:247d			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c485:2487			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c48f:2491			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c499:249b			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4a3:24a5			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4ad:24af			byte $00,$00,$00,$00,$00,$00,$00,$00

c4b5:24b7		lbl_c4b5 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4bf:24c1			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4c9:24cb			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4d3:24d5			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4dd:24df			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4e7:24e9			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4f1:24f3			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4fb:24fd			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c505:2507			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c50f:2511			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c519:251b			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c523:2525			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c52d:252f			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c537:2539			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c541:2543			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c54b:254d			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c555:2557			byte $00,$00,$00,$00,$00

c55a:255c		lbl_c55a byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c564:2566			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c56e:2570			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c578:257a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c582:2584			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c58c:258e			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c596:2598			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5a0:25a2			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5aa:25ac			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5b4:25b6			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5be:25c0			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5c8:25ca			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5d2:25d4			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5dc:25de			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5e6:25e8			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5f0:25f2			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5fa:25fc			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c604:2606			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c60e:2610			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c618:261a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c622:2624			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c62c:262e			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c636:2638			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c640:2642			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c64a:264c			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c654:2656			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c65e:2660			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c668:266a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c672:2674			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c67c:267e			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c686:2688			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c690:2692			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c69a:269c			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6a4:26a6			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6ae:26b0			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6b8:26ba			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6c2:26c4			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6cc:26ce			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6d6:26d8			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6e0:26e2			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6ea:26ec			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6f4:26f6			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6fe:2700			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c708:270a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c712:2714			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c71c:271e			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c726:2728			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c730:2732			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c73a:273c			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c744:2746			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c74e:2750			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c758:275a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c762:2764			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c76c:276e			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c776:2778			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c780:2782			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c78a:278c			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c794:2796			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c79e:27a0			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7a8:27aa			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7b2:27b4			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7bc:27be			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7c6:27c8			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7d0:27d2			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7da:27dc			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7e4:27e6			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7ee:27f0			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7f8:27fa			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c802:2804			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c80c:280e			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c816:2818			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c820:2822			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c82a:282c			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c834:2836			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c83e:2840			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c848:284a			byte $00,$00,$00,$00,$00,$00,$00,$00

c850:2852		lbl_c850 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c85a:285c			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c864:2866			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c86e:2870			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c878:287a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c882:2884			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c88c:288e			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c896:2898			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8a0:28a2			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8aa:28ac			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8b4:28b6			byte $00,$00,$00,$00,$00,$00,$00

c8bb:28bd		lbl_c8bb byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8c5:28c7			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8cf:28d1			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8d9:28db			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8e3:28e5			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8ed:28ef			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8f7:28f9			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c901:2903			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c90b:290d			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c915:2917			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c91f:2921			byte $00

c920:2922		lbl_c920 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c92a:292c			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c934:2936			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c93e:2940			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c948:294a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c952:2954			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c95c:295e			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c966:2968			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c970:2972			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c97a:297c			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c984:2986			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c98e:2990			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c998:299a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9a2:29a4			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9ac:29ae			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9b6:29b8			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9c0:29c2			byte $00,$00,$00

c9c3:29c5		lbl_c9c3 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9cd:29cf			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9d7:29d9			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9e1:29e3			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9eb:29ed			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9f5:29f7			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9ff:2a01			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca09:2a0b			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca13:2a15			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca1d:2a1f			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca27:2a29			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca31:2a33			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca3b:2a3d			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca45:2a47			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca4f:2a51			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca59:2a5b			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca63:2a65			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca6d:2a6f			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca77:2a79			byte $00,$00,$00,$00,$00,$00,$00,$00,$00

; .a: source page
; .y: target page
; .x: # of pages to swap

swapper:
	sta SrcPgSv	; ca80:2a82	8d c5 ca
	sty DestPgSv	; ca83:2a85	8c c6 ca
	stx NumPgSv	; ca86:2a88	8e c7 ca
swapagn:
	jsr rsDisable	; ca89:2a8b	20 06 43
	sei		; ca8c:2a8e	78
	lda $01		; ca8d:2a8f	a5 01
	pha		; ca8f:2a91	48
	lda #$34	; ca90:2a92	a9 34
	sta r6510	; ca92:2a94	85 01
	lda SrcPgSv	; ca94:2a96	ad c5 ca
	sta fac2+1	; ca97:2a99	85 6a
	lda DestPgSv	; ca99:2a9b	ad c6 ca
	sta fac2+3	; ca9c:2a9e	85 6c
	lda NumPgSv	; ca9e:2aa0	ad c7 ca
	sta fac2+4	; caa1:2aa3	85 6d
	ldy #$00	; caa3:2aa5	a0 00
	sty fac2	; caa5:2aa7	84 69
	sty fac2+2	; caa7:2aa9	84 6b
loopcaa9:
	lda (fac2),y	; caa9:2aab	b1 69
	tax		; caab:2aad	aa
	lda (fac2+2),y  ; caac:2aae	b1 6b
	sta (fac2),y	; caae:2ab0	91 69
	txa		; cab0:2ab2	8a
	sta (fac2+2),y  ; cab1:2ab3	91 6b
	iny		; cab3:2ab5	c8
	bne loopcaa9	; cab4:2ab6	d0 f3
	inc fac2+1	; cab6:2ab8	e6 6a
	inc fac2+3	; cab8:2aba	e6 6c
	dec fac2+4	; caba:2abc	c6 6d
	bne loopcaa9	; cabc:2abe	d0 eb
	pla		; cabe:2ac0	68
	sta r6510	; cabf:2ac1	85 01
	cli		; cac1:2ac3	58
	jmp rsEnable	; cac2:2ac4	4c 03 43
SrcPgSv:
	brk		; cac5:2ac7	00  Source Page Save
DestPgSv:
	brk		; cac6:2ac8	00  Target Page Save
NumPgSv:
	brk		; cac7:2ac9	00  # of Pages Save

; FIXME: orphan code?
	lda #$00	; cac8:2aca	a9 00
	sta $e406	; caca:2acc	8d 06 e4
	php		; cacd:2acf	08
	pha		; cace:2ad0	48
	lda #$46	; cacf:2ad1	a9 46
	ldy #$e4	; cad1:2ad3	a0 e4
	ldx #$04	; cad3:2ad5	a2 04
	jsr swapper	; cad5:2ad7	20 80 ca
	pla		; cad8:2ada	68
	plp		; cad9:2adb	28
	jsr $4600	; cada:2adc	20 00 46
	php		; cadd:2adf	08
	pha		; cade:2ae0	48
	txa		; cadf:2ae1	8a
	pha		; cae0:2ae2	48
	tya		; cae1:2ae3	98
	pha		; cae2:2ae4	48
	jsr swapagn	; cae3:2ae5	20 89 ca
	pla		; cae6:2ae8	68
	tay		; cae7:2ae9	a8
	pla		; cae8:2aea	68
	tax		; cae9:2aeb	aa
	pla		; caea:2aec	68
	plp		; caeb:2aed	28
	rts		; caec:2aee	60

jmp_caed:		; &,42
; swap $c000 with $e800 & back
	txa		; caed:2aef	8a
	pha		; caee:2af0	48
	lda #$c0	; caef:2af1	a9 c0
	ldy #$e8	; caf1:2af3	a0 e8
	ldx #$08	; caf3:2af5	a2 08
	jsr swapper	; caf5:2af7	20 80 ca
	pla		; caf8:2afa	68
	tax		; caf9:2afb	aa
	jsr $c000	; cafa:2afc	20 00 c0
	jmp swapagn	; cafd:2aff	4c 89 ca

; initial setup, display boot message
	lda #$01	; cb00:2b02	a9 01
	sta local	; cb02:2b04	8d 00 d0
	ldx #$00	; cb05:2b07	a2 00
	jsr setmode	; cb07:2b09	20 99 b0
	lda #$05	; cb0a:2b0c	a9 05
	jsr usetbl1	; cb0c:2b0e	20 03 cd
	lda #$1b	; cb0f:2b11	a9 1b	; message length
	sta fac1	; cb11:2b13	85 61
	lda #<bootmsg	; cb13:2b15	a9 25
	sta fac1+1	; cb15:2b17	85 62
	lda #>bootmsg	; cb17:2b19	a9 cb
	sta fac1+2	; cb19:2b1b	85 63
	ldx #$00	; cb1b:2b1d	a2 00
	jsr putvar	; cb1d:2b1f	20 a5 b5
	ldx #$00	; cb20:2b22	a2 00
	jmp prtvar0	; cb22:2b24	4c 80 b5

cb25:2b27	tbl-cb3f bootmsg	byte $93		; 147 - clear screen
				ascii " 1.2 Image2000 By IronAxe"
				byte ImageReturn ; $8b

cb40:2b42	tbl-cbff tablcb40 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb4a:2b4c			byte $00,$00

cb4c:2b4e		lbl_cb4c byte $00,$00,$00,$00,$00,$00,$00,$00,$00

cb55:2b57		skipcb55 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb5f:2b61			byte $00,$00,$00,$00

cb63:2b65		skipcb63 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb6d:2b6f			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb77:2b79			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb81:2b83			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb8b:2b8d			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb95:2b97			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb9f:2ba1			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cba9:2bab			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbb3:2bb5			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbbd:2bbf			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbc7:2bc9			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbd1:2bd3			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbdb:2bdd			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbe5:2be7			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbef:2bf1			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbf9:2bfb			byte $00,$00,$00,$00,$00,$00,$00

cc00:2c02	tbl-cc01 tablcc00 byte $67,$b5

cc02:2c04	20 79 00 sub_cc02 jsr chrgot
cc05:2c07	a2 00		ldx #$00
cc07:2c09	c9 2c		cmp #$2c	; ","
cc09:2c0b	d0 03		bne skipcc0e
cc0b:2c0d	20 9b b7		jsr lbl_b79a+1
cc0e:2c10	60	skipcc0e rts

cc0f:2c11	20 02 cc sub_cc0f jsr sub_cc02
cc12:2c14	8e 0c 03		stx sareg
cc15:2c17	20 02 cc		jsr sub_cc02
cc18:2c1a	8e 0d 03		stx sxreg
cc1b:2c1d	20 02 cc		jsr sub_cc02
cc1e:2c20	8e 0e 03		stx syreg
cc21:2c23	ad 0c 03		lda sareg
cc24:2c26	ae 0d 03		ldx sxreg
cc27:2c29	ac 0e 03		ldy syreg
cc2a:2c2c	60		rts

cc2b:2c2d	a9 37	gotocc2b lda #$37
cc2d:2c2f	85 01		sta $01
cc2f:2c31	4c 37 a4		jmp gotoa437

cc32:2c34	a9 00	mod_cc32 lda #$00
cc34:2c36	d0 1a		bne skipcc50
cc36:2c38	ad f3 42		lda scnmode
cc39:2c3b	d0 05		bne skipcc40
cc3b:2c3d	a9 17		lda #$17
cc3d:2c3f	8d 18 d0		sta vicbase
cc40:2c42	a9 6a	skipcc40 lda #$6a
cc42:2c44	8d 12 d0		sta raster
cc45:2c47	a9 01		lda #$01
cc47:2c49	8d 19 d0		sta vicirqf
cc4a:2c4c	ee 33 cc		inc mod_cc32+1
cc4d:2c4f	4c bc fe		jmp var_febc

skipcc50:
	nop			; cc50:2c52	ea
	lda mupcase		; cc51:2c53	ad 0c d0
	and #$01		; cc54:2c56	29 01
	asl a			; cc56:2c58	0a
	eor #{%:00010111}	; cc57:2c59	49 17
	sta vicbase		; cc59:2c5b	8d 18 d0
	lda #$ea		; cc5c:2c5e	a9 ea
	sta raster		; cc5e:2c60	8d 12 d0
	lda #$01		; cc61:2c63	a9 01
	sta vicirqf		; cc63:2c65	8d 19 d0
	dec mod_cc32+1	  ; cc66:2c68	ce 33 cc
	jmp gotocdc0		; cc69:2c6b	4c c0 cd

	; get & routine address
sub_cc6c:
	asl a		; cc6c:2c6e	0a
	tax             ; cc6d:2c6f	aa
	lda $01         ; cc6e:2c70	a5 01
	pha             ; cc70:2c72	48
	lda #$36        ; cc71:2c73	a9 36
	sta $01         ; cc73:2c75	85 01
	php             ; cc75:2c77	08
	sei             ; cc76:2c78	78
	lda amptable,x  ; cc77:2c79	bd 00 a0
	tay             ; cc7a:2c7c	a8
	lda amptable+1,x; cc7b:2c7d	bd 01 a0
	tax             ; cc7e:2c80	aa
	plp             ; cc7f:2c81	28
	pla             ; cc80:2c82	68
	sta $01         ; cc81:2c83	85 01
	rts             ; cc83:2c85	60

cc84:2c86	tbl-ccff tablcc84 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cc8e:2c90			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cc98:2c9a			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cca2:2ca4			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccac:2cae			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccb6:2cb8			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccc0:2cc2			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccca:2ccc			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccd4:2cd6			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccde:2ce0			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cce8:2cea			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccf2:2cf4			byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccfc:2cfe			byte $00,$00,$00,$00

; & dispatch
sub_cd00:
	jsr sub_cc0f	; cd00:2d02	20 0f cc
usetbl1:
	sta sareg       ; cd03:2d05	8d 0c 03
	stx sxreg       ; cd06:2d08	8e 0d 03
	sty syreg       ; cd09:2d0b	8c 0e 03
	jsr sub_cc6c    ; cd0c:2d0e	20 6c cc
	sty mod_cd22+1  ; cd0f:2d11	8c 23 cd
	stx mod_cd22+2  ; cd12:2d14	8e 24 cd
	lda $01         ; cd15:2d17	a5 01
	pha             ; cd17:2d19	48
	lda #$36        ; cd18:2d1a	a9 36
	sta $01         ; cd1a:2d1c	85 01
	ldx sxreg       ; cd1c:2d1e	ae 0d 03
	ldy syreg       ; cd1f:2d21	ac 0e 03
mod_cd22:
	jsr $ffff      ; cd22:2d24	20 ff ff
	sta sareg       ; cd25:2d27	8d 0c 03
	pla             ; cd28:2d2a	68
	sta $01         ; cd29:2d2b	85 01
	lda sareg       ; cd2b:2d2d	ad 0c 03
	rts             ; cd2e:2d30	60

; new ibsout vector:
	pha		; cd2f:2d31	48
	lda dfltno      ; cd30:2d32	a5 9a
	cmp #$04        ; cd32:2d34	c9 04
	bcs skipcd4b    ; cd34:2d36	b0 15
	lda $01         ; cd36:2d38	a5 01
	sta lbl_cee4    ; cd38:2d3a	8d e4 ce
	lda #$36        ; cd3b:2d3d	a9 36
	sta $01         ; cd3d:2d3f	85 01
	pla             ; cd3f:2d41	68
	jsr sub_a7d7    ; cd40:2d42	20 d7 a7
	pha             ; cd43:2d45	48
	lda lbl_cee4    ; cd44:2d46	ad e4 ce
	sta $01         ; cd47:2d49	85 01
	pla             ; cd49:2d4b	68
	rts             ; cd4a:2d4c	60

skipcd4b:
	pla		; cd4b:2d4d	68
save_bsout:             ; save bsout vector
	jmp $ffff	; cd4c:2d4e	4c ff ff

cd4f:2d51	a5 01	gotocd4f lda $01
cd51:2d53	48		pha
cd52:2d54	a9 37		lda #$37
cd54:2d56	85 01		sta $01
cd56:2d58	20 e7 b0		jsr ptrget1
cd59:2d5b	4c 75 cd		jmp gotocd75

cd5c:2d5e	a5 01	sub_cd5c lda $01
cd5e:2d60	48		pha
cd5f:2d61	a9 37		lda #$37
cd61:2d63	85 01		sta $01
cd63:2d65	20 33 a5		jsr linkprg
cd66:2d68	4c 75 cd		jmp gotocd75

cd69:2d6b	aa	sub_cd69 tax
cd6a:2d6c	a5 01		lda $01
cd6c:2d6e	48		pha
cd6d:2d6f	a9 37		lda #$37
cd6f:2d71	85 01		sta $01
cd71:2d73	8a		txa
cd72:2d74	20 75 b4		jsr sub_b475
cd75:2d77	68	gotocd75 pla
cd76:2d78	85 01		sta $01
cd78:2d7a	60		rts

; new IERROR vector
	stx sareg	; cd79:2d7b	8e 0c 03
	lda curlin      ; cd7c:2d7e	a5 39
	sta sxreg       ; cd7e:2d80	8d 0d 03
	lda curlin+1    ; cd81:2d83	a5 3a
	sta syreg       ; cd83:2d85	8d 0e 03
	lda #>inchat    ; cd86:2d88	a9 d0
	sta linnum      ; cd88:2d8a	85 14
	lda #<inchat    ; cd8a:2d8c	a9 07
	sta linnum+1    ; cd8c:2d8e	85 15
	ldx #$fa        ; cd8e:2d90	a2 fa
	txs             ; cd90:2d92	9a
	jsr sub_a8a3    ; cd91:2d93	20 a3 a8
	; FIXME: this is into the middle of an instruction!
	jmp lbl_a7ad+1  ; cd94:2d96	4c ae a7

; new IGONE vector:
	lda #$36	; cd97:2d99	a9 36
	sta $01         ; cd99:2d9b	85 01
	jsr sub_b66c    ; cd9b:2d9d	20 6c b6
	lda #$37        ; cd9e:2da0	a9 37
	sta $01         ; cda0:2da2	85 01
	jsr chrget      ; cda2:2da4	20 73 00
gotocda5:
	cmp #$26	; cda5:2da7	c9 26	; "&"
	bne skipcdb5    ; cda7:2da9	d0 0c
	jsr chrget      ; cda9:2dab	20 73 00
	jsr sub_cd00    ; cdac:2dae	20 00 cd
	jsr chrgot      ; cdaf:2db1	20 79 00
	jmp gotocda5    ; cdb2:2db4	4c a5 cd

skipcdb5:
	lda txtptr	; cdb5:2db7	a5 7a
	bne skipcdbb    ; cdb7:2db9	d0 02
	dec txtptr+1    ; cdb9:2dbb	c6 7b
skipcdbb:
	dec txtptr     ; cdbb:2dbd	c6 7a
mod_cdbd:
	jmp $ffff      ; cdbd:2dbf	4c ff ff

gotocdc0:
	lda $01	; cdc0:2dc2	a5 01
	pha             ; cdc2:2dc4	48
	lda #$36        ; cdc3:2dc5	a9 36
	sta $01         ; cdc5:2dc7	85 01
lbl_cdc7:
	lda #$00       ; cdc7:2dc9	a9 00
	beq skipcdd0    ; cdc9:2dcb	f0 05
	dec $cdc8       ; cdcb:2dcd	ce c8 cd
	bne skipcdd9    ; cdce:2dd0	d0 09
skipcdd0:
	jsr sub_ac4e  ; cdd0:2dd2	20 4e ac
	lda irqcount    ; cdd3:2dd5	ad 0d d0
	sta lbl_cdc7+1  ; cdd6:2dd8	8d c8 cd
skipcdd9:
	pla            ; cdd9:2ddb	68
	sta $01         ; cdda:2ddc	85 01
	jmp $ea81       ; cddc:2dde	4c 81 ea

sub_cddf:
	lda $01		; cddf:2de1	a5 01
	pha             ; cde1:2de3	48
	lda #$37        ; cde2:2de4	a9 37
	sta $01         ; cde4:2de6	85 01
	jsr lbl_ad9d+1  ; cde6:2de8	20 9e ad
	jsr sub_b6a3    ; cde9:2deb	20 a3 b6
	tax             ; cdec:2dee	aa
	pla             ; cded:2def	68
	sta $01         ; cdee:2df0	85 01
	txa             ; cdf0:2df2	8a
loopcdf1:
	ldx z_index    ; cdf1:2df3	a6 22
	ldy z_index+1   ; cdf3:2df5	a4 23
	rts             ; cdf5:2df7	60

cdf6:2df8	tbl-ce0a tablcdf6 byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

		;
		; d1$ (11 digits)
		;
ce00:2e02	tbl-ce0a d1str	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce0a:2e0c			byte $20

		;
		; long date format
		;
date_day:
	ascii "Sat "	; ce0b:2e0d	tbl-ce26

date_mon:
	ascii "Jan "	; ce0f:2e11	tbl-ce12

date_10:
	ascii " "	; ce13:2e15	tbl-ce13

		;
		; 20 isn't modified as far as I know
		;
date_1:
	ascii "1, 20"	; ce14:2e16	tbl-ce18

year_10:
	ascii "0"	; ce19:2e1b	tbl-ce19

year_1:
	ascii "0 "	; ce1a:2e1c	tbl-ce1b

tm_hr_10:
	ascii "1"	; ce1c:2e1e	tbl-ce1f

tm_hr_01:
	ascii "2:"	; ce1d:2e1f	tbl-ce1e

tm_mn_10:
	ascii "0"	; ce1f:2e21	tbl-ce1f

tm_mn_01:
	ascii "0 "	; ce20:2e22	tbl-ce21

time_ap:
	ascii "PM"	; ce22:2e24	tbl-ce23

tablce24:
	byte $20,$20,$20; ce24:2e26	tbl-ce26

buffer2:
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20	; ce27:2e29	tbl-ce76
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce31:2e33
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce3b:2e3d
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce45:2e47
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce4f:2e51
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce59:2e5b
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce63:2e65
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce6d:2e6f

buffer:
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20	; ce77:2e79	tbl-cec6
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce81:2e83
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce8b:2e8d
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce95:2e97
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ce9f:2ea1
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; cea9:2eab
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; ceb3:2eb5
	byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20    ; cebd:2ebf

; short (11-byte) d1$ format?
lbl_cec7:
	byte $05	; cec7:2ec9	tbl-ced0

lbl_cec8:
	byte $03	; cec8:2eca

lbl_cec9:
	byte $10	; cec9:2ecb

ceca:2ecc		lbl_ceca byte $88

cecb:2ecd		lbl_cecb byte $12

cecc:2ece		lbl_cecc byte $00

cecd:2ecf		lbl_cecd byte $00

cece:2ed0		lbl_cece byte $00

cecf:2ed1		lbl_cecf byte $00

ced0:2ed2		lbl_ced0 byte $00

;
; looks like bcd-encoded days of month (1-10)
;
ced1:2ed3	tbl-cee6 tablced1 byte $31,$28,$31,$30,$31,$30,$31,$31,$30,$00

cedb:2edd	tbl-cee3 lbl_cedb ascii "00000101",$00

cee4:2ee6		lbl_cee4 byte $00	; saves $01

cee5:2ee7		lbl_cee5 byte $00

cee6:2ee8		lbl_cee6 byte $00

cee7:2ee9	tbl-cef5 blddate	ascii "12/30/99 09:45P"

cef6:2ef8	tbl-cef9 tablcef6 byte $81,$19,$99,$99

cefa:2efc	tbl-cefc tablcefa byte $9a ' "�"
				byte $00
cefc:2efe			byte $00

cefd:2eff	tbl-cf00 tablcefd byte $ff,$35,$ff,$20
