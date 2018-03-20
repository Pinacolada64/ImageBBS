
		       *	=   $a000 ;  C64 , SPLIT

; 27/Jul/2016 13:15 labels starting with "mod_" are modified by other code - rns

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
lstx	 = $c5
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
free_fb	 = $fb
free_fc	 = $fc
free_fd	 = $fd
free_fe	 = $fe
free_ff	 = $ff
buf	 = $0200
sat	 = $026d ; secondary address table
keyd	 = $0277 ; keyboard buffer
color	 = $0286 ; fix this label
gdcol	 = $0287
shflag	 = $028d
ridbe	 = $029b
ridbs	 = $029c
var_02f0 = $02f0
var_02fc = $02fc
bsnpre	 = $02fd ; bbs serial # prefix
bsnvallo = $02fe ; bbs serial # value, lo byte?
bsnvalhi = $02ff ; bbs serial # value, hi byte?
ierror	 = $0300
imain	 = $0302
igone	 = $0308
sareg	 = $030c
sxreg	 = $030d
syreg	 = $030e
cinv	 = $0314 ; IRQ vector
ibsout	 = $0326 ; CHROUT vector
iload	 = $0330
tbuffer	 = $033c
idlemax	 = $033e
v_03fe	 = $03fe
v_03ff	 = $03ff
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
t_1758	 = $1758
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
v_2820	 = $2820
var_2a21 = $2a21
var_2a2a = $2a2a
var_2a2d = $2a2d
var_2a5a = $2a5a
var_2ac4 = $2ac4
var_2b41 = $2b41
v_2cc5	 = $2cc5
v_2cd2	 = $2cd2
var_2d21 = $2d21
var_2e2d = $2e2d
var_2e31 = $2e31
v_2e45	 = $2e45
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
var_42ed = $42ed
var_42ee = $42ee
var_42ef = $42ef
ptrpnfd	 = $42f0
ha577	 = $42f1
mask     = $42f2 ; 17138 - password mask character
scnmode	 = $42f3
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
v_45d2	 = $45d2
v_45d4	 = $45d4
var_4600 = $4600
var_4620 = $4620
v_46cf	 = $46cf
var_488a = $488a
v_48d0	 = $48d0
var_4c20 = $4c20
var_4c55 = $4c55
var_4cb2 = $4cb2
v_4d12	 = $4d12
v_4d55	 = $4d55
var_4dc9 = $4dc9
var_4e20 = $4e20
var_4e46 = $4e46
v_4e49	 = $4e49
var_4e4d = $4e4d
var_4e57 = $4e57
v_4ecf	 = $4ecf
var_4f4f = $4f4f
v_4fd4	 = $4fd4
var_5020 = $5020
var_5050 = $5050
v_5211	 = $5211
var_52c1 = $52c1
v_5349	 = $5349
var_5420 = $5420
var_542e = $542e
v_5445	 = $5445
var_5520 = $5520
var_5552 = $5552
v_564f	 = $564f
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
sub_b5a5 = $b5a5 ; somewhere in garbage collection
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
sprtcol5 = $d02c ; sprites not used
var_d3c5 = $d3c5
colorram = $d800 ; ends at $dbff
cia1prta = $dc00
cia1dsec = $dc08
cia1sec	 = $dc09
cia1min	 = $dc0a
cia1hour = $dc0b
cia1icr	 = $dc0d ; interrupt control register
var_dcdd = $dcdd
cia2prta = $dd00
carrier	 = $dd01
cia2ddrb = $dd03
swiftlnk = $de00
v_df02	 = $df02 ; swiftlink command register?
var_dfde = $dfde
var_dfdf = $dfdf
var_e404 = $e404
var_e405 = $e405
var_e406 = $e406
var_e716 = $e716 ; Output to the Screen
var_e9d2 = $e9d2
var_e9f0 = $e9f0
var_e9ff = $e9ff
var_ea1c = $ea1c
var_ea24 = $ea24
var_ea81 = $ea81
var_ea87 = $ea87
var_f142 = $f142
v_f30f	 = $f30f
v_f31f	 = $f31f
v_f701	 = $f701
colormem = $d800
v_fe56	 = $fe56
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

var_ffff = $ffff ; usually self-modifying addresses

; printables
return	 = #$0d
pound	 = #$5c

	      ;
	      ; called by $ae78, $cc77, $cc6c
	      ;
a000:0002:1   tbl-a029 irqtable .word $b567,$be23,$abdc,$be68,$a95c,$b773 ; index $06
a00c:000e:1			.word $be2d,$aa84,$ab3a,$be63,$be4f,$be59 ; index $0c
a018:001a:1			.word $be6d,$a858,$0000,$a128,$c000,$c003 ; index $12
a024:0026:1			.word $b099,$b450,$b426

a02a:002c:1   tbl-a073		.word $b3fa
a02c:002e:1			.word $a6f2 ; index $17 - wait for .x seconds?
a02e:0030:1			.word $a827 ; index $18
a030:0032:1			.word $a704
a032:0034:1			.word $be84
a034:0036:1			.word $a95c
a036:0038:1			.word $be72
a038:003a:1			.word $be77
a03a:003c:1			.word $b591
a03c:003e:1			.word $b5a5 ; index $1f - inside garbage collection
a03e:0040:1			.word $b5b9
a040:0042:1			.word $b5c4
a042:0044:1			.word $b4d7
a044:0046:1			.word $b4ff
a046:0048:1			.word $b4df ; index $24 - called from ml.editor
a048:004a:1			.word $b507
a04a:004c:1			.word $b75f
a04c:004e:1			.word $b758
a04e:0050:1			.word $b4f9
a050:0052:1			.word $b76a
a052:0054:1			.word $b4d3
a054:0056:1			.word $caed
a056:0058:1			.word $aa08
a058:005a:1			.word $b66c ; index $2d - garbage collection
a05a:005c:1			.word $b57a
a05c:005e:1			.word $b580 ; index $2f
a05e:0060:1			.word $a9c4
a060:0062:1			.word $a949
a062:0064:1			.word $ba23
a064:0066:1			.word $b7a6
a066:0068:1			.word $ba8d
a068:006a:1			.word $b323
a06a:006c:1			.word $b462
a06c:006e:1			.word $be32
a06e:0070:1			.word $a712
a070:0072:1			.word $be54
a072:0074:1			.word $be5e ; index $3a

	      ;
	      ; $b4fc, $b577, $b57d
	      ;
a074:0076:1   a9 00    gotoa074 lda #$00
a076:0078:1   85 96    lbl_a076 sta syno
a078:007a:1   a5 61    lbl_a078 lda fac1
a07a:007c:1   8d f9 42 lbl_a07a sta len1
a07d:007f:1   a5 62		lda fac1+1
a07f:0081:1   85 71		sta fbufpt
a081:0083:1   a5 63		lda fac1+2
a083:0085:1   85 72		sta fbufpt+1
a085:0087:1   ad 03 d0		lda tsr
a088:008a:1   f0 05		beq skipa08f
a08a:008c:1   ad 05 d0		lda flag
a08d:008f:1   d0 22		bne skipa0b1
a08f:0091:1   ad e8 07 skipa08f lda mjump
a092:0094:1   f0 26		beq skipa0ba
a094:0096:1   ce e8 07		dec mjump
a097:0099:1   f0 21		beq skipa0ba
a099:009b:1   d0 16		bne skipa0b1
a09b:009d:1   a2 0f    gotoa09b ldx #$0f
a09d:009f:1   20 91 b5		jsr sub_b591
a0a0:00a2:1   a5 61		lda fac1
a0a2:00a4:1   c9 81		cmp #$81
a0a4:00a6:1   d0 13		bne skipa0b9
a0a6:00a8:1   a5 62		lda fac1+1
a0a8:00aa:1   d0 0f		bne skipa0b9
a0aa:00ac:1   a9 8b		lda #$8b
a0ac:00ae:1   85 fe		sta free_fe
a0ae:00b0:1   20 12 a7		jsr sub_a712
a0b1:00b3:1   20 b9 b5 skipa0b1 jsr sub_b5b9
a0b4:00b6:1   a2 0f		ldx #$0f
a0b6:00b8:1   20 a5 b5		jsr sub_b5a5
a0b9:00bb:1   60       skipa0b9 rts

a0ba:00bc:1   20 b9 b5 skipa0ba jsr sub_b5b9
a0bd:00bf:1   a2 11		ldx #$11
a0bf:00c1:1   20 a5 b5		jsr sub_b5a5
a0c2:00c4:1   20 fe a0		jsr sub_a0fe
a0c5:00c7:1   20 b9 b5		jsr sub_b5b9
a0c8:00ca:1   ad 06 d0		lda chat
a0cb:00cd:1   85 62		sta fac1+1
a0cd:00cf:1   a2 26		ldx #$26
a0cf:00d1:1   20 a5 b5		jsr sub_b5a5
a0d2:00d4:1   ad 06 d0		lda chat
a0d5:00d7:1   f0 24		beq skipa0fb
a0d7:00d9:1   20 c4 b5		jsr sub_b5c4
a0da:00dc:1   a2 11		ldx #$11
a0dc:00de:1   20 a5 b5		jsr sub_b5a5
a0df:00e1:1   20 b9 b5		jsr sub_b5b9
a0e2:00e4:1   a2 12		ldx #$12
a0e4:00e6:1   20 a5 b5		jsr sub_b5a5
a0e7:00e9:1   ad 06 d0		lda chat
a0ea:00ec:1   c9 2f		cmp #$2f
a0ec:00ee:1   d0 0d		bne skipa0fb
a0ee:00f0:1   a9 86		lda #$86
a0f0:00f2:1   85 61		sta fac1
a0f2:00f4:1   a9 3c		lda #$3c
a0f4:00f6:1   85 62		sta fac1+1
a0f6:00f8:1   a2 12		ldx #$12
a0f8:00fa:1   20 a5 b5		jsr sub_b5a5
a0fb:00fd:1   4c 9b a0 skipa0fb jmp gotoa09b

a0fe:0100:1   a9 00    sub_a0fe lda #$00
a100:0102:1   8d 06 d0		sta chat
a103:0105:1   20 c4 a9		jsr sub_a9c4
a106:0108:1   c9 01		cmp #$01
a108:010a:1   d0 06		bne skipa110
a10a:010c:1   a9 2f		lda #$2f
a10c:010e:1   8d 06 d0		sta chat
a10f:0111:1   60		rts

a110:0112:1   ad f9 42 skipa110 lda len1
a113:0115:1   f0 12		beq skipa127
a115:0117:1   a4 96    loopa115 ldy syno
a117:0119:1   b1 71		lda (fbufpt),y
a119:011b:1   85 fe		sta free_fe
a11b:011d:1   20 88 a2		jsr sub_a288
a11e:0120:1   e6 96		inc syno
a120:0122:1   a5 96		lda syno
a122:0124:1   cd f9 42		cmp len1
a125:0127:1   90 ee		bcc loopa115
a127:0129:1   60       skipa127 rts

a128:012a:1   a2 00		ldx #$00
a12a:012c:1   20 91 b5		jsr sub_b591
a12d:012f:1   a0 00		ldy #$00
a12f:0131:1   b1 62    loopa12f lda (fac1+1),y
a131:0133:1   99 31 a2		sta d1day,y
a134:0136:1   c8		iny
a135:0137:1   c0 0b		cpy #$0b
a137:0139:1   d0 f6		bne loopa12f
a139:013b:1   20 4d a1		jsr sub_a14d
a13c:013e:1   a9 14		lda #$14
a13e:0140:1   85 61		sta fac1
a140:0142:1   a9 0f		lda #$0f
a142:0144:1   85 62		sta fac1+1
a144:0146:1   a9 ce		lda #$ce
a146:0148:1   85 63		sta fac1+2
a148:014a:1   a2 00		ldx #$00
a14a:014c:1   4c a5 b5		jmp sub_b5a5

a14d:014f:1   ad 31 a2 sub_a14d lda d1day
a150:0152:1   29 0f		and #$0f
a152:0154:1   aa		tax
a153:0155:1   ca		dex
a154:0156:1   8a		txa
a155:0157:1   0a		asl a
a156:0158:1   0a		asl a
a157:0159:1   a8		tay
a158:015a:1   a2 00		ldx #$00
a15a:015c:1   b9 15 a2 loopa15a lda days,y
a15d:015f:1   9d 0b ce		sta date_day,x
a160:0162:1   e8		inx
a161:0163:1   c8		iny
a162:0164:1   e0 03		cpx #$03
a164:0166:1   d0 f4		bne loopa15a
a166:0168:1   ad 35 a2		lda d1mon1
a169:016b:1   29 0f		and #$0f
a16b:016d:1   aa		tax
a16c:016e:1   ad 34 a2		lda $a234
a16f:0171:1   29 0f		and #$0f
a171:0173:1   f0 05		beq skipa178
a173:0175:1   8a		txa
a174:0176:1   18		clc
a175:0177:1   69 0a		adc #$0a
a177:0179:1   aa		tax
a178:017a:1   ca       skipa178 dex
a179:017b:1   8a		txa
a17a:017c:1   0a		asl a
a17b:017d:1   0a		asl a
a17c:017e:1   a8		tay
a17d:017f:1   a2 00		ldx #$00
a17f:0181:1   b9 e5 a1 loopa17f lda months,y
a182:0184:1   9d 0f ce		sta date_mon,x
a185:0187:1   e8		inx
a186:0188:1   c8		iny
a187:0189:1   e0 03		cpx #$03
a189:018b:1   d0 f4		bne loopa17f
a18b:018d:1   4c 8e a1		jmp gotoa18e

a18e:0190:1   ad 36 a2 gotoa18e lda d1date10
a191:0193:1   8d 13 ce		sta date_10
a194:0196:1   ad 37 a2		lda d1date1
a197:0199:1   8d 14 ce		sta date_1
a19a:019c:1   ad 32 a2		lda $a232
a19d:019f:1   8d 19 ce		sta year_10
a1a0:01a2:1   ad 33 a2		lda d1year1
a1a3:01a5:1   8d 1a ce		sta year_1
a1a6:01a8:1   ad 3a a2		lda d1min10
a1a9:01ab:1   8d 1f ce		sta tm_mn_10
a1ac:01ae:1   ad 3b a2		lda d1min1
a1af:01b1:1   8d 20 ce		sta tm_mn_01
a1b2:01b4:1   ad 39 a2		lda d1hour12
a1b5:01b7:1   8d 1d ce		sta tm_hr_01
a1b8:01ba:1   ad 38 a2		lda d1hourap
a1bb:01bd:1   29 31		and #$31
a1bd:01bf:1   c9 30		cmp #$30
a1bf:01c1:1   d0 02		bne skipa1c3
a1c1:01c3:1   a9 20		lda #$20
a1c3:01c5:1   8d 1c ce skipa1c3 sta tm_hr_10
a1c6:01c8:1   ad 38 a2		lda d1hourap
a1c9:01cb:1   c9 38		cmp #$38
a1cb:01cd:1   b0 06		bcs skipa1d3
a1cd:01cf:1   b0 04		bcs skipa1d3
a1cf:01d1:1   a9 c1		lda #$c1
a1d1:01d3:1   d0 02		bne skipa1d5
a1d3:01d5:1   a9 d0    skipa1d3 lda #$d0
a1d5:01d7:1   8d 22 ce skipa1d5 sta time_ap
a1d8:01da:1   ad 13 ce		lda date_10
a1db:01dd:1   c9 30		cmp #$30
a1dd:01df:1   d0 05		bne skipa1e4
a1df:01e1:1   a9 20		lda #$20
a1e1:01e3:1   8d 13 ce		sta date_10
a1e4:01e6:1   60       skipa1e4 rts

a1e5:01e7:1   tbl-a214 months	.text "Jan "
a1e9:01eb:1			.text "Feb "
a1ed:01ef:1			.text "Mar "
a1f1:01f3:1			.text "Apr "
a1f5:01f7:1			.text "May "
a1f9:01fb:1			.text "Jun "
a1fd:01ff:1			.text "Jul "
a201:0203:1			.text "Aug "
a205:0207:1			.text "Sep "
a209:020b:1			.text "Oct "
a20d:020f:1			.text "Nov "
a211:0213:1			.text "Dec "

a215:0217:1   tbl-a230 days	.text "Sun "
a219:021b:1			.text "Mon "
a21d:021f:1			.text "Tue "
a221:0223:1			.text "Wed "
a225:0227:1			.text "Thu "
a229:022b:1			.text "Fri "
a22d:022f:1			.text "Sat "

	      ;
	      ; holds d1$, 11-digit representation of time/date
	      ;
a231:0233:1   tbl-a231 d1day	.byte $20

a232:0234:1   tbl-a232 d1year10 .byte $20

a233:0235:1   tbl-a233 d1year1	.byte $20

a234:0236:1   tbl-a234 d1mon10	.byte $20

a235:0237:1   tbl-a235 d1mon1	.byte $20

a236:0238:1   tbl-a236 d1date10 .byte $20

a237:0239:1   tbl-a237 d1date1	.byte $20

a238:023a:1   tbl-a238 d1hourap .byte $20

a239:023b:1   tbl-a239 d1hour12 .byte $20

a23a:023c:1   tbl-a23a d1min10	.byte $20

a23b:023d:1   tbl-a23b d1min1	.byte $20

a23c:023e:1   tbl-a23d t_a23c	.byte $20,$20

a23e:0240:1   48		pha
a23f:0241:1   ad 02 d0		lda editor
a242:0244:1   29 01		and #$01
a244:0246:1   f0 0f		beq skipa255
a246:0248:1   68		pla
a247:0249:1   20 6e a2 sub_a247 jsr sub_a26e
a24a:024c:1   90 1e		bcc skipa26a
a24c:024e:1   c9 12		cmp #$12
a24e:0250:1   f0 1a		beq skipa26a
a250:0252:1   c9 92		cmp #$92
a252:0254:1   f0 16		beq skipa26a
a254:0256:1   48		pha
a255:0257:1   68       skipa255 pla
a256:0258:1   c9 20		cmp #$20
a258:025a:1   90 12		bcc skipa26c
a25a:025c:1   c9 80		cmp #$80
a25c:025e:1   90 0c		bcc skipa26a
a25e:0260:1   c9 a0		cmp #$a0
a260:0262:1   b0 08		bcs skipa26a
a262:0264:1   c9 85		cmp #$85
a264:0266:1   90 06		bcc skipa26c
a266:0268:1   c9 8d		cmp #$8d
a268:026a:1   b0 02		bcs skipa26c
a26a:026c:1   38       skipa26a sec
a26b:026d:1   60		rts

a26c:026e:1   18       skipa26c clc
a26d:026f:1   60		rts

a26e:0270:1   8c f6 42 sub_a26e sty cytemp
a271:0273:1   a0 0f		ldy #$0f
a273:0275:1   d9 70 a3 loopa273 cmp prntcolr,y
a276:0278:1   f0 08		beq skipa280
a278:027a:1   88		dey
a279:027b:1   d0 f8		bne loopa273
a27b:027d:1   ac f6 42		ldy cytemp
a27e:0280:1   38		sec
a27f:0281:1   60		rts

a280:0282:1   ac f6 42 skipa280 ldy cytemp
a283:0285:1   18		clc
a284:0286:1   60		rts

a285:0287:1   4c 59 a6 loopa285 jmp gotoa659

; interpret MCI commands?
a288:028a:1   c9 5c    sub_a288 cmp #$5c	; pound sign
a28a:028c:1   d0 f9		bne loopa285
a28c:028e:1   ae ef 07		ldx mci
a28f:0291:1   d0 f4		bne loopa285
a291:0293:1   e6 96		inc syno
a293:0295:1   a4 96		ldy syno
a295:0297:1   b1 71		lda (fbufpt),y
a297:0299:1   c9 5c		cmp #$5c	; pound sign
a299:029b:1   f0 ea		beq loopa285
a29b:029d:1   29 3f		and #$3f
a29d:029f:1   8d ea a2		sta lbl_a2ea
a2a0:02a2:1   e6 96		inc syno
a2a2:02a4:1   c8		iny
a2a3:02a5:1   b1 71		lda (fbufpt),y
a2a5:02a7:1   8d ec a2		sta lbl_a2ec
a2a8:02aa:1   29 0f		and #$0f
a2aa:02ac:1   8d eb a2		sta lbl_a2eb
a2ad:02af:1   c8		iny
a2ae:02b0:1   b1 71		lda (fbufpt),y
a2b0:02b2:1   8d ee a2		sta lbl_a2ee
a2b3:02b5:1   29 0f		and #$0f
a2b5:02b7:1   8d ed a2		sta lbl_a2ed
a2b8:02ba:1   ad eb a2		lda lbl_a2eb
a2bb:02bd:1   0a		asl a
a2bc:02be:1   0a		asl a
a2bd:02bf:1   18		clc
a2be:02c0:1   6d eb a2		adc lbl_a2eb
a2c1:02c3:1   0a		asl a
a2c2:02c4:1   18		clc
a2c3:02c5:1   6d ed a2		adc lbl_a2ed
a2c6:02c8:1   8d ef a2		sta lbl_a2ef
a2c9:02cb:1   c8		iny
a2ca:02cc:1   b1 71		lda (fbufpt),y
a2cc:02ce:1   8d f0 a2		sta lbl_a2f0
a2cf:02d1:1   ad ea a2		lda lbl_a2ea
a2d2:02d4:1   c9 28		cmp #$28
a2d4:02d6:1   b0 11		bcs skipa2e7
a2d6:02d8:1   0a		asl a
a2d7:02d9:1   aa		tax
	      ;
	      ; self-modifying jump table
	      ;
a2d8:02da:1   bd f1 a2		lda jmptable,x
a2db:02dd:1   8d e5 a2		sta mod_a2e4+1
a2de:02e0:1   bd f2 a2		lda jmptable+1,x
a2e1:02e3:1   8d e6 a2		sta mod_a2e4+2
a2e4:02e6:1   4c ff ff mod_a2e4 jmp $ffff

a2e7:02e9:1   4c 53 a6 skipa2e7 jmp gotoa653

a2ea:02ec:1   tbl-a2f3 lbl_a2ea .byte $00

a2eb:02ed:1	       lbl_a2eb .byte $03

a2ec:02ee:1	       lbl_a2ec .byte $00

a2ed:02ef:1	       lbl_a2ed .byte $00

a2ee:02f0:1	       lbl_a2ee .byte $00

a2ef:02f1:1	       lbl_a2ef .byte $00

a2f0:02f2:1	       lbl_a2f0 .byte $00

	      ;
	      ; 8/28/14 - jump table ($02e7)
	      ;
a2f1:02f3:1   tbl-a340 jmptable .word $a653,$a380,$a3bf,$a3c4,$a3d8,$a3e1
a2fd:02ff:1			.word $a3ea,$a3f1,$a3fc,$a401,$a43e,$a44d
a309:030b:1			.word $a45e,$a653,$a467,$a46c,$a477,$a47e
a315:0317:1			.word $a4a9,$a4ba,$a4c1,$a4e5,$a4f6,$a55c
a321:0323:1			.word $a575,$a653,$a653,$a653,$a653,$a653
a32d:032f:1			.word $a653,$a600,$a653,$a653,$a653,$a57a
a339:033b:1			.word $a597,$a5a7,$a653,$a653

; mci variables
a341:0343:1   tbl-a360 mci_vars .byte $44,$31 ; v0 - d1$ current date
				.byte $4c,$44 ; v1 - ld$ last call date
				.byte $4e,$41 ; v2 - na$ user's handle
				.byte $52,$4e ; v3 - rn$ user's real name
				.byte $50,$48 ; v4 - ph$ user's phone number
a34b:034d:1			.byte $42,$4e ; v5 - bn$ BBS name
				.byte $42,$80 ; v6 - b_$ system variable
				.byte $41,$4e ; v7 - an$ last user input
				.byte $44,$32 ; v8 - d2$ board name at entry
				.byte $44,$33 ; v9 - d3$ last user on BBS
a355:0357:1			.byte $41,$4b ; vj - ak$ separator line
				.byte $4c,$54 ; vk - d5$ true last call date
				.byte $44,$34 ; vl - d4$ current ML protocol
				.byte $41,$47 ; vm - ag$ access group name
				.byte $43,$43 ; vn - cc$ two-character login ID
a35f:0361:1			.byte $44,$44 ; vo - dd$ login ID + user ID

	; enter with MCI variable in .x
a361:0363:1   8a       sub_a361 txa
a362:0364:1   0a		asl a
a363:0365:1   a8		tay
a364:0366:1   b9 42 a3		lda mci_vars+1,y
a367:0369:1   09 80		ora #$80
a369:036b:1   aa		tax
a36a:036c:1   b9 41 a3		lda mci_vars,y
a36d:036f:1   4c 97 b5		jmp sub_b597
	; exit with variable name in .ax

	      ; from $a273, $a3d0, $bb78, $b7ed, $bb70
	      ; $0F bytes - printable c= colors
a370:0372:1   tbl-a37f prntcolr .byte 159,5,28,159,156,30,31,158
a378:037a:1			.byte 129,149,150,151,152,153,154,155

a380:0382:1   ae eb a2		ldx lbl_a2eb
a383:0385:1   20 61 a3		jsr sub_a361
a386:0388:1   a5 62		lda fac1+1
a388:038a:1   8d 9d a3		sta mod_a39c+1
a38b:038d:1   a5 63		lda fac1+2
a38d:038f:1   8d 9e a3		sta mod_a39c+2
a390:0392:1   a2 00		ldx #$00
a392:0394:1   e6 96    gotoa392 inc syno
a394:0396:1   a4 96		ldy syno
a396:0398:1   b1 71		lda (fbufpt),y
a398:039a:1   c9 5c		cmp #pound
a39a:039c:1   f0 09		beq skipa3a5

a39c:039e:1   dd ff ff mod_a39c cmp $ffff,x
a39f:03a1:1   d0 0a		bne skipa3ab
a3a1:03a3:1   e8		inx
a3a2:03a4:1   4c 92 a3		jmp gotoa392

a3a5:03a7:1   a9 01    skipa3a5 lda #$01
a3a7:03a9:1   8d e9 07		sta mresult
a3aa:03ac:1   60		rts

a3ab:03ad:1   a9 00    skipa3ab lda #$00
a3ad:03af:1   8d e9 07		sta mresult
a3b0:03b2:1   e6 96    loopa3b0 inc syno
a3b2:03b4:1   a4 96		ldy syno
a3b4:03b6:1   c0 50		cpy #$50
a3b6:03b8:1   f0 06		beq skipa3be
a3b8:03ba:1   b1 71    lbl_a3b8 lda (fbufpt),y
a3ba:03bc:1   c9 5c		cmp #pound
a3bc:03be:1   d0 f2		bne loopa3b0
a3be:03c0:1   60       skipa3be rts

a3bf:03c1:1   a9 07		lda #$07
a3c1:03c3:1   4c 37 a6		jmp gotoa637

a3c4:03c6:1   ad eb a2 gotoa3c4 lda lbl_a2eb
a3c7:03c9:1   d0 03		bne skipa3cc
a3c9:03cb:1   ad a8 a4		lda lbl_a4a8
a3cc:03ce:1   8d ec 07 skipa3cc sta mcolor
a3cf:03d1:1   a8		tay
a3d0:03d2:1   b9 70 a3		lda prntcolr,y
a3d3:03d5:1   85 fe		sta free_fe
a3d5:03d7:1   4c 12 a7		jmp sub_a712

a3d8:03da:1   ad e9 07		lda mresult
a3db:03dd:1   d0 03		bne skipa3e0
a3dd:03df:1   4c 3e a4		jmp gotoa43e

a3e0:03e2:1   60       skipa3e0 rts

a3e1:03e3:1   ad e9 07		lda mresult
a3e4:03e6:1   f0 03		beq skipa3e9
a3e6:03e8:1   4c 3e a4		jmp gotoa43e

a3e9:03eb:1   60       skipa3e9 rts

a3ea:03ec:1   a9 93		lda #$93
a3ec:03ee:1   85 fe		sta free_fe
a3ee:03f0:1   4c 12 a7		jmp sub_a712

a3f1:03f3:1   ad eb a2		lda lbl_a2eb
a3f4:03f6:1   29 01		and #$01
a3f6:03f8:1   8d 01 d0		sta case
a3f9:03fb:1   4c 58 a8		jmp lbl_a858

a3fc:03fe:1   a9 14		lda #$14
a3fe:0400:1   4c 37 a6		jmp $a637

a401:0403:1   ad eb a2		lda lbl_a2eb
a404:0406:1   29 01		and #$01
a406:0408:1   8d 01 d0		sta case
a409:040b:1   a9 00		lda #$00
a40b:040d:1   8d fc 07		sta tmp1
a40e:0410:1   a9 04		lda #$04
a410:0412:1   8d 02 d0		sta editor
a413:0415:1   a9 00		lda #$00
a415:0417:1   8d fa 42		sta passmode
a418:041a:1   20 b9 b5		jsr sub_b5b9
a41b:041d:1   a2 00		ldx #$00
a41d:041f:1   20 a5 b5		jsr sub_b5a5
a420:0422:1   a5 96		lda syno
a422:0424:1   48		pha
a423:0425:1   a5 71		lda fbufpt
a425:0427:1   48		pha
a426:0428:1   a5 72		lda fbufpt+1
a428:042a:1   48		pha
a429:042b:1   ad f9 42		lda len1
a42c:042e:1   48		pha
a42d:042f:1   20 28 be		jsr sub_be28
a430:0432:1   68		pla
a431:0433:1   8d f9 42		sta len1
a434:0436:1   68		pla
a435:0437:1   85 72		sta fbufpt+1
a437:0439:1   68       gotoa437 pla
a438:043a:1   85 71		sta fbufpt
a43a:043c:1   68		pla
a43b:043d:1   85 96		sta syno
a43d:043f:1   60		rts

a43e:0440:1   ad eb a2 gotoa43e lda lbl_a2eb
a441:0443:1   c9 00    gotoa441 cmp #$00
a443:0445:1   f0 07		beq skipa44c
a445:0447:1   8d e8 07		sta mjump
a448:044a:1   a9 f0		lda #$f0
a44a:044c:1   85 96		sta syno
a44c:044e:1   60       skipa44c rts

a44d:044f:1   ad eb a2		lda lbl_a2eb
a450:0452:1   c9 00		cmp #$00
a452:0454:1   d0 04		bne skipa458
a454:0456:1   8d 0b d0		sta mkolor
a457:0459:1   60		rts

a458:045a:1   8d 0b d0 skipa458 sta mkolor
a45b:045d:1   4c c4 a3		jmp gotoa3c4

a45e:0460:1   ad eb a2		lda lbl_a2eb
a461:0463:1   29 01		and #$01
a463:0465:1   8d ed 07		sta mprtr
a466:0468:1   60		rts

a467:0469:1   a9 0d		lda #$0d
a469:046b:1   4c 37 a6		jmp gotoa637

a46c:046e:1   a9 13		lda #$13
a46e:0470:1   8d eb a2		sta lbl_a2eb
a471:0473:1   ad ec a2		lda lbl_a2ec
a474:0476:1   4c 1e a6		jmp gotoa61e

a477:0479:1   ad eb a2		lda lbl_a2eb
a47a:047c:1   8d eb 07		sta mprint
a47d:047f:1   60		rts

a47e:0480:1   ad eb a2 sub_a47e lda lbl_a2eb
a481:0483:1   f0 03		beq skipa486
	      ;
	      ; "image 1.2a" transfers control here at startup
	      ;
a483:0485:1   8d a8 a4 l_a483	sta lbl_a4a8
a486:0488:1   a9 00    skipa486 lda #$00
a488:048a:1   8d e8 07		sta mjump
a48b:048d:1   8d eb a2		sta lbl_a2eb
a48e:0490:1   8d ee 07		sta mreverse
a491:0493:1   8d ed 07		sta mprtr
a494:0496:1   8d eb 07		sta mprint
a497:0499:1   8d ea 07		sta mspeed
a49a:049c:1   8d 0b d0		sta mkolor
a49d:049f:1   8d ef 07		sta mci
a4a0:04a2:1   20 c4 a3		jsr gotoa3c4
a4a3:04a5:1   a9 00		lda #$00
a4a5:04a7:1   4c e8 a4		jmp gotoa4e8

a4a8:04aa:1   tbl-a4a8 lbl_a4a8 .byte $03

a4a9:04ab:1   ad eb a2		lda lbl_a2eb
a4ac:04ae:1   29 01		and #$01
a4ae:04b0:1   8d ee 07		sta mreverse
a4b1:04b3:1   4a		lsr a
a4b2:04b4:1   6a		ror a
a4b3:04b5:1   49 92		eor #var_3451
a4b5:04b7:1   85 fe		sta free_fe
a4b7:04b9:1   4c 4b a7		jmp gotoa74b

a4ba:04bc:1   ad eb a2		lda lbl_a2eb
a4bd:04bf:1   8d ea 07		sta mspeed
a4c0:04c2:1   60		rts

a4c1:04c3:1   ad eb a2		lda lbl_a2eb
a4c4:04c6:1   c9 02		cmp #$02
a4c6:04c8:1   d0 0e		bne skipa4d6
a4c8:04ca:1   a2 18		ldx #$18
a4ca:04cc:1   20 91 b5		jsr sub_b591
a4cd:04cf:1   a5 62		lda fac1+1
a4cf:04d1:1   29 0f		and #$0f
a4d1:04d3:1   09 30		ora #$30
a4d3:04d5:1   8d 77 ce		sta buffer
a4d6:04d8:1   a9 77    skipa4d6 lda #<buffer
a4d8:04da:1   8d 9d a3		sta mod_a39c+1
a4db:04dd:1   a9 ce		lda #>buffer
a4dd:04df:1   8d 9e a3		sta mod_a39c+2
a4e0:04e2:1   a2 00		ldx #$00
a4e2:04e4:1   4c 92 a3		jmp gotoa392

a4e5:04e7:1   ad eb a2		lda lbl_a2eb
a4e8:04ea:1   29 01    gotoa4e8 and #$01
a4ea:04ec:1   8d 0c d0		sta mupcase
a4ed:04ef:1   4a		lsr a
a4ee:04f0:1   6a		ror a
a4ef:04f1:1   49 0e		eor #$0e
a4f1:04f3:1   85 fe		sta free_fe
a4f3:04f5:1   4c 4b a7		jmp gotoa74b

a4f6:04f8:1   ae eb a2		ldx lbl_a2eb
a4f9:04fb:1   8e ea a2		stx lbl_a2ea
a4fc:04fe:1   20 61 a3		jsr sub_a361
a4ff:0501:1   a5 61    gotoa4ff lda fac1
a501:0503:1   8d 14 a5		sta gotoa513+1
a504:0506:1   a5 62		lda fac1+1
a506:0508:1   8d 1d a5		sta mod_051c+1
a509:050b:1   a5 63		lda fac1+2
a50b:050d:1   8d 1e a5		sta mod_051c+2
a50e:0510:1   a9 00		lda #$00
a510:0512:1   8d 16 a5		sta mod_0515+1
a513:0515:1   a9 ff    gotoa513 lda #$ff
a515:0517:1   c9 ff    mod_0515 cmp #$ff
a517:0519:1   f0 1e		beq skipa537
a519:051b:1   ac 16 a5		ldy mod_0515+1
a51c:051e:1   b9 ff ff mod_051c lda $ffff,y
a51f:0521:1   85 fe		sta free_fe
a521:0523:1   ae ea a2		ldx lbl_a2ea
a524:0526:1   e0 02		cpx #$02
a526:0528:1   b0 06		bcs skipa52e
a528:052a:1   99 31 a2		sta d1day,y
a52b:052d:1   4c 31 a5		jmp gotoa531

a52e:0530:1   20 8b a6 skipa52e jsr sub_a68b
	      ;
	      ; linked addr for self-modifying code
	      ; also start of linkprg
	      ;
a531:0533:1   ee 16 a5 gotoa531 inc mod_0515+1
a534:0536:1   4c 13 a5		jmp gotoa513

a537:0539:1   ae ea a2 skipa537 ldx lbl_a2ea
a53a:053c:1   e0 02		cpx #$02
a53c:053e:1   b0 1d		bcs skipa55b
a53e:0540:1   20 4d a1		jsr sub_a14d
a541:0543:1   a9 00    lbl_a541 lda #$00
a543:0545:1   8d 16 a5		sta mod_0515+1
a546:0548:1   ac 16 a5 loopa546 ldy mod_0515+1
a549:054b:1   b9 0b ce		lda date_day,y
a54c:054e:1   85 fe		sta free_fe
a54e:0550:1   20 12 a7		jsr sub_a712
a551:0553:1   ee 16 a5		inc mod_0515+1
a554:0556:1   ad 16 a5		lda mod_0515+1
a557:0559:1   c9 19		cmp #$19
a559:055b:1   90 eb		bcc loopa546
a55b:055d:1   60       skipa55b rts

a55c:055e:1   ad eb a2		lda lbl_a2eb
a55f:0561:1   f0 13		beq skipa574
a561:0563:1   ee eb a2		inc lbl_a2eb
a564:0566:1   ad 09 dc loopa564 lda cia1sec
a567:0569:1   cd ea a2		cmp lbl_a2ea
a56a:056c:1   f0 f8		beq loopa564
a56c:056e:1   8d ea a2		sta lbl_a2ea
a56f:0571:1   ce eb a2		dec lbl_a2eb
a572:0574:1   d0 f0		bne loopa564
a574:0576:1   60       skipa574 rts

a575:0577:1   a9 f0		lda #$f0
a577:0579:1   4c 41 a4		jmp gotoa441

a57a:057c:1   ad ec a2		lda lbl_a2ec
a57d:057f:1   c9 30		cmp #$30
a57f:0581:1   90 12		bcc skipa593
a581:0583:1   c9 3a		cmp #$3a
a583:0585:1   b0 0e		bcs skipa593
a585:0587:1   ad eb a2		lda lbl_a2eb
a588:058a:1   c9 05		cmp #$05
a58a:058c:1   90 02		bcc skipa58e
a58c:058e:1   a9 05		lda #$05
a58e:0590:1   8d f0 07 skipa58e sta mdigits
a591:0593:1   a9 30		lda #$30
a593:0595:1   8d ff a5 skipa593 sta lbl_a5ff
a596:0598:1   60		rts

a597:0599:1   a9 02		lda #$02
a599:059b:1   8d ea a2		sta lbl_a2ea
a59c:059e:1   ad ec a2		lda lbl_a2ec
a59f:05a1:1   a2 80		ldx #$80
a5a1:05a3:1   20 97 b5		jsr sub_b597
a5a4:05a6:1   4c ff a4		jmp gotoa4ff

a5a7:05a9:1   ad ec a2		lda lbl_a2ec
a5aa:05ac:1   09 80		ora #$80
a5ac:05ae:1   a2 80		ldx #$80
a5ae:05b0:1   20 97 b5		jsr sub_b597
a5b1:05b3:1   a6 61		ldx fac1
a5b3:05b5:1   a5 62		lda fac1+1
a5b5:05b7:1   20 1c b6		jsr sub_b61c
a5b8:05ba:1   a0 00		ldy #$00
a5ba:05bc:1   8c fd a5		sty lbl_a5fd
a5bd:05bf:1   ae f0 07		ldx mdigits
a5c0:05c2:1   f0 07		beq skipa5c9
a5c2:05c4:1   a9 05		lda #$05
a5c4:05c6:1   38		sec
a5c5:05c7:1   ed f0 07		sbc mdigits
a5c8:05ca:1   a8		tay
a5c9:05cb:1   8c fe a5 skipa5c9 sty lbl_a5fe
a5cc:05ce:1   b9 db ce		lda lbl_cedb,y
a5cf:05d1:1   c0 04		cpy #$04
a5d1:05d3:1   b0 19		bcs skipa5ec
a5d3:05d5:1   ae fd a5		ldx lbl_a5fd
a5d6:05d8:1   d0 14		bne skipa5ec
a5d8:05da:1   c9 30		cmp #$30
a5da:05dc:1   d0 10		bne skipa5ec
a5dc:05de:1   ae f0 07		ldx mdigits
a5df:05e1:1   f0 13		beq skipa5f4
a5e1:05e3:1   ad ff a5		lda lbl_a5ff
a5e4:05e6:1   85 fe		sta free_fe
a5e6:05e8:1   20 8b a6		jsr sub_a68b
a5e9:05eb:1   4c f4 a5		jmp skipa5f4

a5ec:05ee:1   85 fe    skipa5ec sta free_fe
a5ee:05f0:1   20 8b a6		jsr sub_a68b
a5f1:05f3:1   ee fd a5		inc lbl_a5fd
a5f4:05f6:1   ac fe a5 skipa5f4 ldy lbl_a5fe
a5f7:05f9:1   c8		iny
a5f8:05fa:1   c0 05		cpy #$05
a5fa:05fc:1   d0 cd		bne skipa5c9
a5fc:05fe:1   60		rts

a5fd:05ff:1   tbl-a5fe lbl_a5fd .byte $00

a5fe:0600:1	       lbl_a5fe .byte $00

a5ff:0601:1   tbl-a5ff lbl_a5ff .byte $30

a600:0602:1   e6 96    lbl_0602 inc syno
a602:0604:1   ad ef a2		lda lbl_a2ef
a605:0607:1   c5 02		cmp zp_02
a607:0609:1   90 14		bcc skipa61d
a609:060b:1   f0 12		beq skipa61d
a60b:060d:1   c9 28		cmp #$28
a60d:060f:1   b0 0e		bcs skipa61d
a60f:0611:1   a9 20    loopa60f lda #$20
a611:0613:1   85 fe		sta free_fe
a613:0615:1   20 12 a7		jsr sub_a712
a616:0618:1   ad ef a2		lda lbl_a2ef
a619:061b:1   c5 02		cmp zp_02
a61b:061d:1   d0 f2		bne loopa60f
a61d:061f:1   60       skipa61d rts

a61e:0620:1   8d f8 07 gotoa61e sta tmp5
a621:0623:1   ad eb a2		lda lbl_a2eb
a624:0626:1   f0 10		beq skipa636
a626:0628:1   8d fd 07		sta tmp2
a629:062b:1   ad f8 07 loopa629 lda tmp5
a62c:062e:1   85 fe		sta free_fe
a62e:0630:1   20 8b a6		jsr sub_a68b
a631:0633:1   ce fd 07		dec tmp2
a634:0636:1   d0 f3		bne loopa629
a636:0638:1   60       skipa636 rts

a637:0639:1   ae eb a2 gotoa637 ldx lbl_a2eb
a63a:063c:1   8e fc 42		stx tmp6
a63d:063f:1   8d fd 42		sta tmp7
a640:0642:1   ad fc 42		lda tmp6
a643:0645:1   f0 0d		beq skipa652
a645:0647:1   ad fd 42 loopa645 lda tmp7
a648:064a:1   85 fe		sta free_fe
a64a:064c:1   20 12 a7		jsr sub_a712
a64d:064f:1   ce fc 42		dec tmp6
a650:0652:1   d0 f3		bne loopa645
a652:0654:1   60       skipa652 rts

a653:0655:1   c6 96    gotoa653 dec syno
a655:0657:1   c6 96		dec syno
a657:0659:1   a9 5c		lda #$5c
a659:065b:1   c9 04    gotoa659 cmp #$04
a65b:065d:1   d0 2e		bne sub_a68b
a65d:065f:1   a2 00		ldx #$00
a65f:0661:1   e6 96    loopa65f inc syno
a661:0663:1   a4 96		ldy syno
a663:0665:1   b1 71		lda (fbufpt),y
a665:0667:1   9d 31 a2		sta d1day,x
a668:066a:1   e8		inx
a669:066b:1   e0 0b		cpx #$0b
a66b:066d:1   d0 f2		bne loopa65f
a66d:066f:1   20 4d a1		jsr sub_a14d
a670:0672:1   a9 00		lda #$00
a672:0674:1   8d 0f d0		sta index
a675:0677:1   ac 0f d0		ldy index
a678:067a:1   b9 0b ce loopa678 lda date_day,y
a67b:067d:1   85 fe		sta free_fe
a67d:067f:1   20 12 a7		jsr sub_a712
a680:0682:1   ee 0f d0		inc index
a683:0685:1   ac 0f d0		ldy index
a686:0688:1   c0 19		cpy #$19
a688:068a:1   d0 ee		bne loopa678
a68a:068c:1   60		rts

a68b:068d:1   20 ae a9 sub_a68b jsr sub_a9ae
a68e:0690:1   8d ff 07		sta tmp4
a691:0693:1   29 7f		and #$7f
a693:0695:1   c9 20		cmp #$20
a695:0697:1   b0 08		bcs skipa69f
a697:0699:1   ad ff 07		lda tmp4
a69a:069c:1   85 fe		sta free_fe
a69c:069e:1   4c 12 a7		jmp sub_a712

a69f:06a1:1   ad eb 07 skipa69f lda mprint
a6a2:06a4:1   29 0f		and #$0f
a6a4:06a6:1   0a		asl a
a6a5:06a7:1   aa		tax
a6a6:06a8:1   bd a0 40		lda pmodetbl,x
a6a9:06ab:1   8d b4 a6		sta mod_a6b3+1
a6ac:06ae:1   e8		inx
a6ad:06af:1   bd a0 40		lda pmodetbl,x
a6b0:06b2:1   8d b5 a6		sta mod_a6b3+2
a6b3:06b5:1   ad ff ff mod_a6b3 lda $ffff
a6b6:06b8:1   f0 13		beq skipa6cb
a6b8:06ba:1   c9 ff		cmp #$ff
a6ba:06bc:1   f0 10		beq skipa6cc
a6bc:06be:1   85 fe    gotoa6bc sta free_fe
a6be:06c0:1   20 12 a7		jsr sub_a712
a6c1:06c3:1   ee b4 a6		inc mod_a6b3+1
a6c4:06c6:1   d0 ed		bne mod_a6b3
a6c6:06c8:1   ee b5 a6		inc mod_a6b3+2
a6c9:06cb:1   d0 e8		bne mod_a6b3
a6cb:06cd:1   60       skipa6cb rts

a6cc:06ce:1   20 d5 a6 skipa6cc jsr sub_a6d5
a6cf:06d1:1   ad ff 07		lda tmp4
a6d2:06d4:1   4c bc a6		jmp gotoa6bc

a6d5:06d7:1   ae ea 07 sub_a6d5 ldx mspeed
a6d8:06da:1   f0 03		beq skipa6dd
a6da:06dc:1   20 f2 a6		jsr sub_a6f2
a6dd:06df:1   ad 0b d0 skipa6dd lda mkolor
a6e0:06e2:1   f0 0f		beq skipa6f1
a6e2:06e4:1   ae ec 07		ldx mcolor
a6e5:06e7:1   e8       loopa6e5 inx
a6e6:06e8:1   8a		txa
a6e7:06e9:1   29 0f		and #$0f
a6e9:06eb:1   f0 fa		beq loopa6e5
a6eb:06ed:1   8d eb a2		sta lbl_a2eb
a6ee:06f0:1   20 c4 a3		jsr gotoa3c4
a6f1:06f3:1   60       skipa6f1 rts

; wait for .x seconds?
a6f2:06f4:1   e0 00    sub_a6f2 cpx #$00
a6f4:06f6:1   f0 0b		beq skipa701
a6f6:06f8:1   ad 08 dc loopa6f6 lda cia1dsec
a6f9:06fb:1   cd 08 dc loopa6f9 cmp cia1dsec
a6fc:06fe:1   f0 fb		beq loopa6f9
a6fe:0700:1   ca		dex
a6ff:0701:1   d0 f5		bne loopa6f6
a701:0703:1   60       skipa701 rts

a702:0704:1   85 fe    gotoa702 sta free_fe
a704:0706:1   98		tya
a705:0707:1   48		pha
a706:0708:1   8a		txa
a707:0709:1   48		pha
a708:070a:1   20 4b a7		jsr gotoa74b
a70b:070d:1   68		pla
a70c:070e:1   aa		tax
a70d:070f:1   68		pla
a70e:0710:1   a8		tay
a70f:0711:1   a5 fe		lda free_fe
a711:0713:1   60		rts

a712:0714:1   20 4b a7 sub_a712 jsr gotoa74b
a715:0717:1   20 71 a8		jsr sub_a871
a718:071a:1   a2 a0		ldx #$a0
a71a:071c:1   a5 fe		lda free_fe
a71c:071e:1   f0 17		beq skipa735
a71e:0720:1   c9 13		cmp #$13
a720:0722:1   f0 17		beq skipa739
a722:0724:1   a2 a0    gotoa722 ldx #$a0
a724:0726:1   c9 2f		cmp #$2f
a726:0728:1   f0 08		beq skipa730
a728:072a:1   c9 20		cmp #$20
a72a:072c:1   f0 04		beq skipa730
a72c:072e:1   c9 03		cmp #$03
a72e:0730:1   d0 05		bne skipa735
a730:0732:1   8d 06 d0 skipa730 sta chat
a733:0735:1   a2 c1		ldx #$c1		; A - abort indicator
a735:0737:1   8e 20 04 skipa735 stx videoram+32
a738:073a:1   60		rts

a739:073b:1   a9 d0    skipa739 lda #$d0		; P - pause indicator
a73b:073d:1   8d 1e 04		sta videoram+30
a73e:0740:1   20 3f a8		jsr sub_a83f
a741:0743:1   a9 a0		lda #$a0
a743:0745:1   8d 1e 04		sta videoram+30
a746:0748:1   a5 fe		lda free_fe
a748:074a:1   4c 22 a7		jmp gotoa722

a74b:074d:1   a5 fe    gotoa74b lda free_fe
a74d:074f:1   20 ae a9		jsr sub_a9ae
a750:0752:1   85 fe		sta free_fe
a752:0754:1   29 7f		and #$7f
a754:0756:1   c9 20		cmp #$20
a756:0758:1   90 0d		bcc skipa765
a758:075a:1   ae fa 42		ldx passmode
a75b:075d:1   f0 2b		beq skipa788
a75d:075f:1   ad f2 42		lda mask
a760:0762:1   85 fe		sta free_fe
a762:0764:1   4c 88 a7		jmp skipa788

a765:0767:1   ad ef 07 skipa765 lda mci
a768:076a:1   10 1e		bpl skipa788
a76a:076c:1   a5 fe		lda free_fe
a76c:076e:1   20 47 a2		jsr sub_a247
a76f:0771:1   90 17		bcc skipa788
a771:0773:1   09 40		ora #$40
a773:0775:1   48		pha
a774:0776:1   ad ee 07		lda mreverse
a777:0779:1   d0 0c		bne skipa785
a779:077b:1   a9 12		lda #$12
a77b:077d:1   20 86 a7		jsr sub_a786
a77e:0780:1   68		pla
a77f:0781:1   20 86 a7		jsr sub_a786
a782:0784:1   a9 92		lda #$92
a784:0786:1   48		pha
a785:0787:1   68       skipa785 pla
a786:0788:1   85 fe    sub_a786 sta free_fe
a788:078a:1   20 a6 b7 skipa788 jsr sub_b7a6
a78b:078d:1   ae 07 d0		ldx inchat
a78e:0790:1   d0 05		bne skipa795
a790:0792:1   20 f8 a9		jsr sub_a9f8
a793:0795:1   d0 03		bne skipa798
a795:0797:1   20 8d ba skipa795 jsr sub_ba8d
a798:079a:1   4c 9b a7 skipa798 jmp gotoa79b

a79b:079d:1   ad ed 07 gotoa79b lda mprtr
a79e:07a0:1   d0 07		bne skipa7a7
a7a0:07a2:1   ad f4 07		lda chk_left
a7a3:07a5:1   29 40		and #$40
a7a5:07a7:1   f0 26		beq skipa7cd
a7a7:07a9:1   a5 fe    skipa7a7 lda free_fe
a7a9:07ab:1   29 7f		and #$7f
a7ab:07ad:1   c9 20		cmp #$20
a7ad:07af:1   b0 04    lbl_a7ad bcs skipa7b3
a7af:07b1:1   c9 0d		cmp #$0d
a7b1:07b3:1   d0 1a		bne skipa7cd
a7b3:07b5:1   a2 04    skipa7b3 ldx #$04
a7b5:07b7:1   20 c9 ff		jsr chkout
a7b8:07ba:1   a5 90		lda status
a7ba:07bc:1   30 0e		bmi skipa7ca
a7bc:07be:1   a5 fe		lda free_fe
a7be:07c0:1   20 d2 ff		jsr chrout
a7c1:07c3:1   c9 0d		cmp #$0d
a7c3:07c5:1   d0 05		bne skipa7ca
a7c5:07c7:1   a9 00		lda #$00
a7c7:07c9:1   8d ed 07		sta mprtr
a7ca:07cc:1   4c cc ff skipa7ca jmp clrch

a7cd:07cf:1   60       skipa7cd rts

a7ce:07d0:1   85 9e    sub_a7ce sta ptr1
a7d0:07d2:1   8a		txa
a7d1:07d3:1   48		pha
a7d2:07d4:1   98		tya
a7d3:07d5:1   48		pha
a7d4:07d6:1   4c f0 a7		jmp gotoa7f0

; called from new IBSOUT routine:
a7d7:07d9:1   85 9e    sub_a7d7 sta ptr1
a7d9:07db:1   8a		txa
a7da:07dc:1   48		pha
a7db:07dd:1   98		tya
a7dc:07de:1   48		pha
a7dd:07df:1   a5 9a		lda dfltno
a7df:07e1:1   c9 02		cmp #$02
a7e1:07e3:1   f0 0d		beq gotoa7f0
a7e3:07e5:1   a2 01		ldx #$01
a7e5:07e7:1   20 99 b0		jsr sub_b099
a7e8:07ea:1   a5 9e		lda ptr1
a7ea:07ec:1   20 16 e7		jsr $e716
a7ed:07ef:1   4c 0c a8		jmp gotoa80c

; output to modem:
a7f0:07f2:1   ad f3 42 gotoa7f0 lda scnmode
a7f3:07f5:1   d0 12		bne skipa807

; update modem I/O window:
a7f5:07f7:1   a2 00		ldx #$00
a7f7:07f9:1   bd dd 07 loopa7f7 lda mask_bot+69,x
a7fa:07fc:1   9d dc 07		sta mask_bot+68,x
a7fd:07ff:1   e8		inx
a7fe:0800:1   e0 09		cpx #$09
a800:0802:1   d0 f5		bne loopa7f7
a802:0804:1   a5 9e		lda ptr1
a804:0806:1   8d e5 07		sta mask_bot+77
a807:0809:1   a5 9e    skipa807 lda ptr1
a809:080b:1   20 0c 43		jsr rsPutChar
a80c:080e:1   68       gotoa80c pla
a80d:080f:1   a8		tay
a80e:0810:1   68		pla
a80f:0811:1   aa		tax
a810:0812:1   a5 9e		lda ptr1
a812:0814:1   18		clc
a813:0815:1   60		rts

a814:0816:1   85 9e		sta ptr1
a816:0818:1   8a		txa
a817:0819:1   48		pha
a818:081a:1   98		tya
a819:081b:1   48		pha
a81a:081c:1   4c 07 a8		jmp skipa807

a81d:081f:1   a9 0d		lda #$0d
a81f:0821:1   4c 02 a7		jmp gotoa702

a822:0824:1   a9 14		lda #$14
a824:0826:1   4c 02 a7		jmp gotoa702

a827:0829:1   20 3f a8 loopa827 jsr sub_a83f
a82a:082c:1   c9 13		cmp #$13
a82c:082e:1   f0 f9		beq loopa827
a82e:0830:1   c9 5c		cmp #$5c
a830:0832:1   d0 0c		bne skipa83e
a832:0834:1   ad 02 d0		lda editor
a835:0837:1   29 08		and #$08
a837:0839:1   d0 03		bne skipa83c
a839:083b:1   4c 27 a8		jmp loopa827

a83c:083e:1   a9 5c    skipa83c lda #$5c
a83e:0840:1   60       skipa83e rts

a83f:0841:1   20 71 a8 sub_a83f jsr sub_a871
a842:0844:1   20 c4 a9		jsr sub_a9c4
a845:0847:1   d0 0a		bne skipa851
a847:0849:1   20 08 aa		jsr sub_aa08
a84a:084c:1   d0 05		bne skipa851
a84c:084e:1   a5 fe		lda free_fe
a84e:0850:1   f0 ef		beq sub_a83f
a850:0852:1   60		rts

a851:0853:1   a9 0d    skipa851 lda #$0d
a853:0855:1   60		rts

a854:0856:1   tbl-a857 tabla854 .byte $80,$80,$00,$00

a858:085a:1   20 27 a8 lbl_a858 jsr loopa827
a85b:085d:1   a5 fe		lda free_fe
a85d:085f:1   8d 77 ce		sta buffer
a860:0862:1   a9 01		lda #$01
a862:0864:1   85 61		sta fac1
a864:0866:1   a9 77		lda #$77
a866:0868:1   85 62		sta fac1+1
a868:086a:1   a9 ce		lda #$ce
a86a:086c:1   85 63		sta fac1+2
a86c:086e:1   a2 00		ldx #$00
a86e:0870:1   4c a5 b5		jmp sub_b5a5

a871:0873:1   20 49 a9 sub_a871 jsr sub_a949
a874:0876:1   d0 08		bne skipa87e
a876:0878:1   20 f8 a9		jsr sub_a9f8
a879:087b:1   d0 37		bne skipa8b2
a87b:087d:1   20 23 ba		jsr sub_ba23
a87e:0880:1   c9 60    skipa87e cmp #$60
a880:0882:1   90 06		bcc skipa888
a882:0884:1   c9 80		cmp #$80
a884:0886:1   b0 02		bcs skipa888
a886:0888:1   69 60		adc #$60
a888:088a:1   c9 a0    skipa888 cmp #$a0
a88a:088c:1   90 06		bcc skipa892
a88c:088e:1   c9 bf		cmp #$bf
a88e:0890:1   b0 02		bcs skipa892
a890:0892:1   69 40		adc #$40
a892:0894:1   c9 e0    skipa892 cmp #$e0
a894:0896:1   d0 02		bne skipa898
a896:0898:1   a9 20		lda #$20
a898:089a:1   c9 de    skipa898 cmp #$de
a89a:089c:1   d0 02		bne skipa89e
a89c:089e:1   a9 ff		lda #$ff
a89e:08a0:1   aa       skipa89e tax
a89f:08a1:1   ad 02 d0 l_a89f	lda editor
a8a2:08a4:1   29   		BAD		; fixme: and #$01
a8a3:08a5:1   01       sub_a8a3 BAD		; $cd91 jmps here
a8a4:08a6:1   d0 0e		bne skipa8b4
a8a6:08a8:1   e0 e0		cpx #$e0
a8a8:08aa:1   b0 08		bcs skipa8b2
a8aa:08ac:1   e0 7b		cpx #$7b
a8ac:08ae:1   90 06		bcc skipa8b4
a8ae:08b0:1   e0 80		cpx #$80
a8b0:08b2:1   b0 02		bcs skipa8b4
a8b2:08b4:1   a2 00    skipa8b2 ldx #$00
a8b4:08b6:1   86 fe    skipa8b4 stx free_fe
a8b6:08b8:1   ad e4 42		lda curdisp
a8b9:08bb:1   f0 3c		beq skipa8f7
a8bb:08bd:1   ad f4 07		lda chk_left
a8be:08c0:1   29 04		and #$04
a8c0:08c2:1   d0 35		bne skipa8f7
a8c2:08c4:1   ad e0 42		lda idlejif
a8c5:08c7:1   c9 3c		cmp #$3c
a8c7:08c9:1   90 2e		bcc skipa8f7
a8c9:08cb:1   a9 00		lda #$00
a8cb:08cd:1   8d e0 42		sta idlejif
a8ce:08d0:1   ad e1 42		lda idlesec
a8d1:08d3:1   ae e2 42		ldx idleten
a8d4:08d6:1   ac e3 42		ldy idlemin
a8d7:08d9:1   18		clc
a8d8:08da:1   69 01		adc #$01
a8da:08dc:1   c9 0a		cmp #$0a
a8dc:08de:1   90 16		bcc skipa8f4
a8de:08e0:1   a9 00		lda #$00
a8e0:08e2:1   e8		inx
a8e1:08e3:1   e0 06		cpx #$06
a8e3:08e5:1   d0 0f		bne skipa8f4
a8e5:08e7:1   a2 00		ldx #$00
a8e7:08e9:1   c8		iny
a8e8:08ea:1   cc 3e 03		cpy idlemax
a8eb:08ed:1   90 07		bcc skipa8f4
a8ed:08ef:1   48		pha
a8ee:08f0:1   a9 00		lda #$00
a8f0:08f2:1   8d 03 d0		sta $d003
a8f3:08f5:1   68		pla
a8f4:08f6:1   20 1f a9 skipa8f4 jsr sub_a91f
a8f7:08f9:1   a5 fe    skipa8f7 lda free_fe
a8f9:08fb:1   ae 01 d0		ldx case
a8fc:08fe:1   f0 0a		beq skipa908
a8fe:0900:1   c9 41		cmp #$41
a900:0902:1   90 06		bcc skipa908
a902:0904:1   c9 5b		cmp #$5b
a904:0906:1   b0 02		bcs skipa908
a906:0908:1   09 80		ora #$80
a908:090a:1   a2 07    skipa908 ldx #$07
a90a:090c:1   dd a6 a9 loopa90a cmp spclchar,x
a90d:090f:1   f0 05		beq skipa914
a90f:0911:1   ca		dex
a910:0912:1   10 f8		bpl loopa90a
a912:0914:1   30 08		bmi skipa91c
a914:0916:1   e0 06    skipa914 cpx #$06
a916:0918:1   f0 04		beq skipa91c
a918:091a:1   8a		txa
a919:091b:1   18		clc
a91a:091c:1   69 85		adc #$85
a91c:091e:1   85 fe    skipa91c sta free_fe
a91e:0920:1   60		rts

a91f:0921:1   8d e1 42 sub_a91f sta idlesec
a922:0924:1   8e e2 42		stx idleten
a925:0927:1   8c e3 42		sty idlemin
a928:092a:1   ad f3 42		lda scnmode
a92b:092d:1   d0 1b		bne skipa948
a92d:092f:1   ad e4 42		lda curdisp
a930:0932:1   c9 01		cmp #$01
a932:0934:1   d0 14		bne skipa948
a934:0936:1   ad e1 42		lda idlesec
a937:0939:1   09 b0		ora #$b0
a939:093b:1   8d e1 04		sta videoram+225
a93c:093e:1   8a		txa
a93d:093f:1   09 b0		ora #$b0
a93f:0941:1   8d e0 04		sta videoram+224
a942:0944:1   98		tya
a943:0945:1   09 b0		ora #$b0
a945:0947:1   8d de 04		sta videoram+222
a948:094a:1   60       skipa948 rts

a949:094b:1   20 6c ad sub_a949 jsr sub_ad6c
a94c:094e:1   20 42 f1		jsr $f142
a94f:0951:1   c9 85		cmp #$85
a951:0953:1   90 06		bcc skipa959
a953:0955:1   c9 8d		cmp #$8d
a955:0957:1   b0 02		bcs skipa959
a957:0959:1   a9 00		lda #$00
a959:095b:1   c9 00    skipa959 cmp #$00
a95b:095d:1   60		rts

; irq routine #5
a95c:095e:1   20 03 43 lbl_a95c jsr rsEnable
a95f:0961:1   38		sec
a960:0962:1   20 09 43		jsr rsGetChar
a963:0965:1   b0 3e		bcs skipa9a3
a965:0967:1   48		pha
a966:0968:1   ad e5 42		lda bar
a969:096b:1   29 01		and #$01
a96b:096d:1   f0 04		beq skipa971
a96d:096f:1   68		pla
a96e:0970:1   29 7f		and #$7f
a970:0972:1   48		pha
a971:0973:1   ad f3 42 skipa971 lda scnmode
a974:0976:1   d0 2b		bne skipa9a1
a976:0978:1   a0 00		ldy #$00
a978:097a:1   ad f5 07		lda chk_right
a97b:097d:1   29 01		and #$01
a97d:097f:1   f0 02		beq skipa981
a97f:0981:1   a0 06		ldy #$06
a981:0983:1   b9 c3 07 skipa981 lda mask_bot+43,y
a984:0986:1   99 c2 07		sta mask_bot+42,y
a987:0989:1   c8		iny
a988:098a:1   c0 09		cpy #$09
a98a:098c:1   d0 f5		bne skipa981
a98c:098e:1   68		pla
a98d:098f:1   48		pha
a98e:0990:1   29 7f		and #$7f
a990:0992:1   c9 20		cmp #$20
a992:0994:1   68		pla
a993:0995:1   48		pha
a994:0996:1   90 08		bcc skipa99e
a996:0998:1   ae fa 42		ldx passmode
a999:099b:1   f0 03		beq skipa99e
a99b:099d:1   ad f2 42		lda mask
a99e:09a0:1   8d cb 07 skipa99e sta mask_bot+51
a9a1:09a3:1   68       skipa9a1 pla
a9a2:09a4:1   60		rts

a9a3:09a5:1   a9 00    skipa9a3 lda #$00
a9a5:09a7:1   60		rts

a9a6:09a8:1   tbl-a9ad spclchar .text ",:"
				.byte 34
				.text "*?="
				.byte 13
				.text "^"

a9ae:09b0:1   c9 85    sub_a9ae cmp #$85
a9b0:09b2:1   90 11		bcc skipa9c3
a9b2:09b4:1   c9 8d		cmp #$8d
a9b4:09b6:1   b0 0d		bcs skipa9c3
a9b6:09b8:1   8e f8 42		stx cxsav
a9b9:09bb:1   38		sec
a9ba:09bc:1   e9 85		sbc #$85
a9bc:09be:1   aa		tax
a9bd:09bf:1   bd a6 a9		lda spclchar,x
a9c0:09c2:1   ae f8 42		ldx cxsav
a9c3:09c5:1   60       skipa9c3 rts

a9c4:09c6:1   ad 00 d0 sub_a9c4 lda local
a9c7:09c9:1   d0 26		bne skipa9ef
a9c9:09cb:1   ad f4 07		lda chk_left
a9cc:09ce:1   29 04		and #$04
a9ce:09d0:1   d0 1f		bne skipa9ef
a9d0:09d2:1   20 f2 a9		jsr sub_a9f2
a9d3:09d5:1   f0 0b		beq skipa9e0
a9d5:09d7:1   a9 00		lda #$00
a9d7:09d9:1   8d 03 d0		sta tsr
a9da:09dc:1   20 dc af		jsr sub_afdc
a9dd:09df:1   a9 01		lda #$01
a9df:09e1:1   60		rts

a9e0:09e2:1   ad 03 d0 skipa9e0 lda tsr
a9e3:09e5:1   d0 0a		bne skipa9ef
a9e5:09e7:1   ad 02 d0		lda editor
a9e8:09ea:1   29 40		and #$40
a9ea:09ec:1   d0 03		bne skipa9ef
a9ec:09ee:1   a9 02		lda #$02
a9ee:09f0:1   60		rts

a9ef:09f1:1   a9 00    skipa9ef lda #$00
a9f1:09f3:1   60		rts

a9f2:09f4:1   ad f1 07 sub_a9f2 lda carrst
a9f5:09f7:1   29 7f		and #$7f
a9f7:09f9:1   60		rts

a9f8:09fa:1   ad f4 07 sub_a9f8 lda chk_left
a9fb:09fd:1   29 04		and #$04
a9fd:09ff:1   d0 08		bne skipaa07
a9ff:0a01:1   ad 00 d0		lda local
aa02:0a04:1   d0 03		bne skipaa07
aa04:0a06:1   4c f2 a9		jmp sub_a9f2

aa07:0a09:1   60       skipaa07 rts

aa08:0a0a:1   ad f4 07 sub_aa08 lda chk_left
aa0b:0a0d:1   29 10		and #$10
aa0d:0a0f:1   60		rts

aa0e:0a10:1   tbl-aa11 lbl_aa0e .byte $77

aa0f:0a11:1	       lbl_aa0f .byte $d1

aa10:0a12:1	       lbl_aa10 .byte $2f

aa11:0a13:1	       lbl_aa11 .byte $88

aa12:0a14:1   a2 00    gotoaa12 ldx #$00
aa14:0a16:1   a0 c0		ldy #$c0
aa16:0a18:1   20 36 aa		jsr sub_aa36
aa19:0a1b:1   18		clc
aa1a:0a1c:1   ad 0f aa		lda lbl_aa0f
aa1d:0a1f:1   6d 10 aa		adc lbl_aa10
aa20:0a22:1   d0 09		bne skipaa2b
aa22:0a24:1   ad 0e aa		lda lbl_aa0e
aa25:0a27:1   6d 11 aa		adc lbl_aa11
aa28:0a2a:1   d0 01		bne skipaa2b
aa2a:0a2c:1   60		rts

aa2b:0a2d:1   a2 00    skipaa2b ldx #$00	      ; clear proto area
aa2d:0a2f:1   a9 60		lda #$60
aa2f:0a31:1   9d 00 c0 loopaa2f sta lbl_c000,x
aa32:0a34:1   ca		dex
aa33:0a35:1   d0 fa		bne loopaa2f
aa35:0a37:1   60		rts

aa36:0a38:1   86 ac    sub_aa36 stx sal
aa38:0a3a:1   84 ad		sty sal+1
aa3a:0a3c:1   c9 00		cmp #$00
aa3c:0a3e:1   d0 02		bne skipaa40
aa3e:0a40:1   a9 08		lda #$08
aa40:0a42:1   8d f7 07 skipaa40 sta filenum
aa43:0a45:1   a2 01		ldx #$01
aa45:0a47:1   20 91 b5		jsr sub_b591
aa48:0a4a:1   a9 00		lda #$00
aa4a:0a4c:1   20 90 ff		jsr setmsg
aa4d:0a4f:1   a9 01		lda #$01
aa4f:0a51:1   ae f7 07		ldx filenum
aa52:0a54:1   a0 00		ldy #$00
aa54:0a56:1   20 ba ff		jsr setlfs
aa57:0a59:1   a5 61		lda fac1
aa59:0a5b:1   a6 62		ldx fac1+1
aa5b:0a5d:1   a4 63		ldy fac1+2
aa5d:0a5f:1   20 bd ff		jsr setname
aa60:0a62:1   a9 00		lda #$00
aa62:0a64:1   a6 ac		ldx sal
aa64:0a66:1   a4 ad		ldy sal+1
aa66:0a68:1   20 06 43		jsr rsDisable
aa69:0a6b:1   20 d5 ff		jsr load
aa6c:0a6e:1   08		php
aa6d:0a6f:1   20 03 43		jsr rsEnable
aa70:0a72:1   28		plp
aa71:0a73:1   60		rts

aa72:0a74:1   20 36 aa sub_aa72 jsr sub_aa36
aa75:0a77:1   b0 09		bcs skipaa80
aa77:0a79:1   86 71		stx fbufpt
aa79:0a7b:1   84 72		sty fbufpt+1
aa7b:0a7d:1   a0 00		ldy #$00
aa7d:0a7f:1   98		tya
aa7e:0a80:1   91 71		sta (fbufpt),y
aa80:0a82:1   60       skipaa80 rts

aa81:0a83:1   4c 12 aa loopaa81 jmp gotoaa12

aa84:0a86:1   ad 0e aa		lda lbl_aa0e
aa87:0a89:1   29 0f		and #$0f
aa89:0a8b:1   8d ff 02		sta $02ff
aa8c:0a8e:1   ad 0f aa		lda lbl_aa0f
aa8f:0a91:1   8d fe 02		sta bsnvallo
aa92:0a94:1   8a		txa
aa93:0a95:1   c0 01		cpy #$01
aa95:0a97:1   f0 35		beq skipaacc
aa97:0a99:1   c0 02		cpy #$02
aa99:0a9b:1   f0 e6		beq loopaa81
aa9b:0a9d:1   c0 03		cpy #$03
aa9d:0a9f:1   f0 26		beq skipaac5
aa9f:0aa1:1   c0 04		cpy #$04
aaa1:0aa3:1   f0 1b		beq skipaabe
aaa3:0aa5:1   a6 2b		ldx txttab
aaa5:0aa7:1   a4 2c		ldy txttab+1
aaa7:0aa9:1   20 72 aa		jsr sub_aa72
aaaa:0aac:1   90 01		bcc skipaaad
aaac:0aae:1   60		rts

aaad:0aaf:1   a6 2b    skipaaad ldx txttab
aaaf:0ab1:1   a4 2c		ldy txttab+1
aab1:0ab3:1   86 ac		stx sal
aab3:0ab5:1   84 ad		sty sal+1
aab5:0ab7:1   a2 01		ldx #$01
aab7:0ab9:1   a0 46		ldy #$46
aab9:0abb:1   4c fb aa		jmp gotoaafb

aabc:0abe:1   tbl-aabd lbl_aabc .byte $01

aabd:0abf:1	       lbl_aabd .byte $30

aabe:0ac0:1   a2 01    skipaabe ldx #$01
aac0:0ac2:1   a0 10		ldy #$10
aac2:0ac4:1   4c d0 aa		jmp gotoaad0

aac5:0ac7:1   a2 01    skipaac5 ldx #$01
aac7:0ac9:1   a0 20		ldy #$20
aac9:0acb:1   4c d0 aa		jmp gotoaad0

aacc:0ace:1   a2 01    skipaacc ldx #$01
aace:0ad0:1   a0 30		ldy #$30
aad0:0ad2:1   8e bc aa gotoaad0 stx lbl_aabc
aad3:0ad5:1   8c bd aa		sty lbl_aabd
aad6:0ad8:1   20 72 aa		jsr sub_aa72
aad9:0adb:1   90 01		bcc skipaadc
aadb:0add:1   60		rts

aadc:0ade:1   a6 2b    skipaadc ldx txttab
aade:0ae0:1   a4 2c		ldy txttab+1
aae0:0ae2:1   86 ac		stx sal
aae2:0ae4:1   84 ad		sty sal+1
aae4:0ae6:1   ae bc aa		ldx lbl_aabc
aae7:0ae9:1   ac bd aa		ldy lbl_aabd
aaea:0aec:1   20 fb aa		jsr gotoaafb
aaed:0aef:1   ae bc aa		ldx lbl_aabc
aaf0:0af2:1   ac bd aa		ldy lbl_aabd
aaf3:0af5:1   86 ac		stx sal
aaf5:0af7:1   84 ad		sty sal+1
aaf7:0af9:1   a2 01		ldx #$01
aaf9:0afb:1   a0 46		ldy #$46
aafb:0afd:1   8a       gotoaafb txa
aafc:0afe:1   48		pha
aafd:0aff:1   98		tya
aafe:0b00:1   48		pha
aaff:0b01:1   a5 2b		lda txttab
ab01:0b03:1   48		pha
ab02:0b04:1   a5 2c		lda txttab+1
ab04:0b06:1   48		pha
ab05:0b07:1   a6 ac		ldx sal
ab07:0b09:1   a4 ad		ldy sal+1
ab09:0b0b:1   86 2b		stx txttab
ab0b:0b0d:1   84 2c		sty txttab+1
ab0d:0b0f:1   20 5c cd		jsr sub_cd5c
ab10:0b12:1   68		pla
ab11:0b13:1   85 2c		sta txttab+1
ab13:0b15:1   68		pla
ab14:0b16:1   85 2b		sta txttab
ab16:0b18:1   a0 00    gotoab16 ldy #$00
ab18:0b1a:1   b1 ac		lda (sal),y
ab1a:0b1c:1   85 71		sta fbufpt
ab1c:0b1e:1   c8		iny
ab1d:0b1f:1   b1 ac		lda (sal),y
ab1f:0b21:1   85 72		sta fbufpt+1
ab21:0b23:1   85 72		sta fbufpt+1
ab23:0b25:1   b1 71		lda (fbufpt),y
ab25:0b27:1   f0 0b		beq skipab32
ab27:0b29:1   a5 71		lda fbufpt
ab29:0b2b:1   85 ac		sta sal
ab2b:0b2d:1   a5 72		lda fbufpt+1
ab2d:0b2f:1   85 ad		sta sal+1
ab2f:0b31:1   4c 16 ab		jmp gotoab16

ab32:0b34:1   68       skipab32 pla
ab33:0b35:1   91 ac		sta (sal),y
ab35:0b37:1   88		dey
ab36:0b38:1   68		pla
ab37:0b39:1   91 ac		sta (sal),y
ab39:0b3b:1   60		rts

ab3a:0b3c:1   8c f4 42		sty dflag
ab3d:0b3f:1   e0 00		cpx #$00
ab3f:0b41:1   f0 03		beq skipab44
ab41:0b43:1   8e f7 07		stx filenum
ab44:0b46:1   c0 00    skipab44 cpy #$00
ab46:0b48:1   d0 0c		bne skipab54
ab48:0b4a:1   ae f7 07		ldx filenum
ab4b:0b4d:1   20 c6 ff		jsr chkin
ab4e:0b50:1   20 e4 ff		jsr getin
ab51:0b53:1   20 e4 ff		jsr getin
ab54:0b56:1   20 75 ab skipab54 jsr sub_ab75
ab57:0b59:1   a5 90		lda status
ab59:0b5b:1   d0 19		bne skipab74
ab5b:0b5d:1   ad f4 42		lda dflag
ab5e:0b60:1   d0 14		bne skipab74
ab60:0b62:1   20 c4 b5		jsr sub_b5c4
ab63:0b65:1   a2 0f		ldx #$0f
ab65:0b67:1   20 a5 b5		jsr sub_b5a5
ab68:0b6a:1   20 67 b5		jsr sub_b567
ab6b:0b6d:1   a2 11		ldx #$11
ab6d:0b6f:1   20 91 b5		jsr sub_b591
ab70:0b72:1   a5 61		lda fac1
ab72:0b74:1   f0 e0		beq skipab54
ab74:0b76:1   60       skipab74 rts

ab75:0b77:1   20 06 43 sub_ab75 jsr rsDisable
ab78:0b7a:1   ae f7 07		ldx filenum
ab7b:0b7d:1   20 c6 ff		jsr chkin
ab7e:0b80:1   20 e4 ff		jsr getin
ab81:0b83:1   20 e4 ff		jsr getin
ab84:0b86:1   20 e4 ff		jsr getin
ab87:0b89:1   48		pha
ab88:0b8a:1   20 e4 ff		jsr getin
ab8b:0b8d:1   aa		tax
ab8c:0b8e:1   68		pla
ab8d:0b8f:1   20 1c b6		jsr sub_b61c
ab90:0b92:1   a0 00		ldy #$00
ab92:0b94:1   a2 00		ldx #$00
ab94:0b96:1   b9 db ce loopab94 lda lbl_cedb,y
ab97:0b99:1   c9 30		cmp #$30
ab99:0b9b:1   f0 01		beq skipab9c
ab9b:0b9d:1   e8		inx
ab9c:0b9e:1   e0 00    skipab9c cpx #$00
ab9e:0ba0:1   d0 02		bne skipaba2
aba0:0ba2:1   a9 20		lda #$20
aba2:0ba4:1   99 27 ce skipaba2 sta buffer2,y
aba5:0ba7:1   c8		iny
aba6:0ba8:1   c0 05		cpy #$05
aba8:0baa:1   90 ea		bcc loopab94
abaa:0bac:1   a0 05		ldy #$05
abac:0bae:1   a9 20		lda #$20
abae:0bb0:1   99 27 ce		sta buffer2,y
abb1:0bb3:1   c8		iny
abb2:0bb4:1   20 e4 ff loopabb2 jsr getin
abb5:0bb7:1   c9 20		cmp #$20
abb7:0bb9:1   f0 f9		beq loopabb2
abb9:0bbb:1   99 27 ce		sta buffer2,y
abbc:0bbe:1   c8		iny
abbd:0bbf:1   20 e4 ff loopabbd jsr getin
abc0:0bc2:1   f0 08		beq skipabca
abc2:0bc4:1   99 27 ce		sta buffer2,y
abc5:0bc7:1   c8		iny
abc6:0bc8:1   a5 90		lda status
abc8:0bca:1   f0 f3		beq loopabbd
abca:0bcc:1   84 61    skipabca sty fac1
abcc:0bce:1   a9 27		lda #$27
abce:0bd0:1   85 62		sta fac1+1
abd0:0bd2:1   a9 ce		lda #$ce
abd2:0bd4:1   85 63		sta fac1+2
abd4:0bd6:1   a2 01		ldx #$01
abd6:0bd8:1   20 a5 b5		jsr sub_b5a5
abd9:0bdb:1   4c 03 43		jmp rsEnable

abdc:0bde:1   e0 00    lbl_abdc cpx #$00
abde:0be0:1   d0 03		bne skipabe3
abe0:0be2:1   8e f7 07		stx filenum
abe3:0be5:1   c0 00    skipabe3 cpy #$00
abe5:0be7:1   d0 46		bne skipac2d
abe7:0be9:1   20 06 43		jsr rsDisable
abea:0bec:1   20 c6 ff		jsr chkin
abed:0bef:1   a9 00		lda #$00
abef:0bf1:1   8d 0f d0		sta index
abf2:0bf4:1   20 e4 ff loopabf2 jsr getin
abf5:0bf7:1   ac 0f d0		ldy index
abf8:0bfa:1   c9 0d		cmp #$0d
abfa:0bfc:1   f0 1c		beq skipac18
abfc:0bfe:1   99 27 ce		sta buffer2,y
abff:0c01:1   c8		iny
ac00:0c02:1   8c 0f d0		sty index
ac03:0c05:1   c0 50		cpy #$50
ac05:0c07:1   b0 11		bcs skipac18
ac07:0c09:1   a5 90		lda status
ac09:0c0b:1   29 42		and #$42
ac0b:0c0d:1   f0 e5		beq loopabf2
ac0d:0c0f:1   a9 5e		lda #$5e
ac0f:0c11:1   8d 27 ce		sta buffer2
ac12:0c14:1   a9 40		lda #$40
ac14:0c16:1   85 90		sta status
ac16:0c18:1   a0 01		ldy #$01
ac18:0c1a:1   84 61    skipac18 sty fac1
ac1a:0c1c:1   a9 27		lda #$27
ac1c:0c1e:1   85 62		sta fac1+1
ac1e:0c20:1   a9 ce		lda #$ce
ac20:0c22:1   85 63		sta fac1+2
ac22:0c24:1   a2 01		ldx #$01
ac24:0c26:1   20 a5 b5		jsr sub_b5a5
ac27:0c29:1   20 cc ff		jsr clrch
ac2a:0c2c:1   4c 03 43		jmp rsEnable

ac2d:0c2f:1   20 06 43 skipac2d jsr rsDisable
ac30:0c32:1   20 c6 ff		jsr chkin
ac33:0c35:1   c0 50		cpy #$50
ac35:0c37:1   90 02		bcc skipac39
ac37:0c39:1   a0 50		ldy #$50
ac39:0c3b:1   8c 0f d0 skipac39 sty index
ac3c:0c3e:1   a0 00		ldy #$00
ac3e:0c40:1   20 cf ff loopac3e jsr chrin
ac41:0c43:1   99 27 ce		sta buffer2,y
ac44:0c46:1   c8		iny
ac45:0c47:1   cc 0f d0		cpy index
ac48:0c4a:1   d0 f4		bne loopac3e
ac4a:0c4c:1   4c 18 ac		jmp skipac18

ac4d:0c4f:1   00       lbl_ac4d brk
ac4e:0c50:1   20 ea ff sub_ac4e jsr inctime
ac51:0c53:1   a6 c6		ldx ndx
ac53:0c55:1   d0 4e		bne skipaca3
ac55:0c57:1   ad 4d ac		lda lbl_ac4d
ac58:0c5a:1   d0 46		bne skipaca0
ac5a:0c5c:1   a9 05		lda #$05
ac5c:0c5e:1   8d 4d ac		sta lbl_ac4d
ac5f:0c61:1   ad 00 dc		lda cia1prta
ac62:0c64:1   48		pha
ac63:0c65:1   29 01		and #$01
ac65:0c67:1   d0 06		bne skipac6d
ac67:0c69:1   a9 91		lda #$91
ac69:0c6b:1   9d 77 02		sta keyd,x
ac6c:0c6e:1   e8		inx
ac6d:0c6f:1   68       skipac6d pla
ac6e:0c70:1   48		pha
ac6f:0c71:1   29 02		and #$02
ac71:0c73:1   d0 06		bne skipac79
ac73:0c75:1   a9 11		lda #$11
ac75:0c77:1   9d 77 02		sta keyd,x
ac78:0c7a:1   e8		inx
ac79:0c7b:1   68       skipac79 pla
ac7a:0c7c:1   48		pha
ac7b:0c7d:1   29 04		and #$04
ac7d:0c7f:1   d0 06		bne skipac85
ac7f:0c81:1   a9 9d		lda #$9d
ac81:0c83:1   9d 77 02		sta keyd,x
ac84:0c86:1   e8		inx
ac85:0c87:1   68       skipac85 pla
ac86:0c88:1   48		pha
ac87:0c89:1   29 08		and #$08
ac89:0c8b:1   d0 06		bne skipac91
ac8b:0c8d:1   a9 1d		lda #$1d
ac8d:0c8f:1   9d 77 02		sta keyd,x
ac90:0c92:1   e8		inx
ac91:0c93:1   68       skipac91 pla
ac92:0c94:1   48		pha
ac93:0c95:1   29 10		and #$10
ac95:0c97:1   d0 06		bne skipac9d
ac97:0c99:1   a9 20		lda #$20
ac99:0c9b:1   9d 77 02		sta keyd,x
ac9c:0c9e:1   e8		inx
ac9d:0c9f:1   68       skipac9d pla
ac9e:0ca0:1   86 c6		stx ndx
aca0:0ca2:1   ce 4d ac skipaca0 dec lbl_ac4d
aca3:0ca5:1   a5 cc    skipaca3 lda blnsw
aca5:0ca7:1   d0 29		bne skipacd0
aca7:0ca9:1   c6 cd		dec blnct
aca9:0cab:1   d0 25		bne skipacd0
acab:0cad:1   a9 14		lda #$14
acad:0caf:1   85 cd		sta blnct
acaf:0cb1:1   a4 d3		ldy pntr
acb1:0cb3:1   46 cf		lsr blnon
acb3:0cb5:1   ae 87 02		ldx gdcol
acb6:0cb8:1   b1 d1		lda (pnt),y
acb8:0cba:1   b0 11		bcs skipaccb
acba:0cbc:1   e6 cf		inc blnon
acbc:0cbe:1   85 ce		sta gdbln
acbe:0cc0:1   20 24 ea		jsr $ea24
acc1:0cc3:1   b1 f3		lda (user),y
acc3:0cc5:1   8d 87 02		sta gdcol
acc6:0cc8:1   ae 86 02		ldx color
acc9:0ccb:1   a5 ce		lda gdbln
accb:0ccd:1   49 80    skipaccb eor #$80
accd:0ccf:1   20 1c ea		jsr var_ea1c
acd0:0cd2:1   20 87 ea skipacd0 jsr var_ea87
acd3:0cd5:1   ee f3 ac		inc mod_acf2+1	; modifies branch instruction
acd6:0cd8:1   ee f3 ac		inc mod_acf2+1	; to jump to different tasks
acd9:0cdb:1   ee f3 ac		inc mod_acf2+1	; during cursor blink, apparently
acdc:0cde:1   ee e0 42		inc idlejif
acdf:0ce1:1   ad 0c d0		lda mupcase
ace2:0ce4:1   4a		lsr a
ace3:0ce5:1   6a		ror a
ace4:0ce6:1   49 ff		eor #$ff
ace6:0ce8:1   cd aa af		cmp lbl_afaa	; serial # related
ace9:0ceb:1   f0 06		beq skipacf1
aceb:0ced:1   8d aa af		sta lbl_afaa	
acee:0cf0:1   20 d3 ae		jsr sub_aed3
acf1:0cf3:1   18       skipacf1 clc
acf2:0cf4:1   90 fd    mod_acf2 bcc skipacf1	; infinite loop unless modified
acf4:0cf6:1   4c 0f ad		jmp gotoad0f

acf7:0cf9:1   4c cb ad lbl_0cf9 jmp gotoadcb

acfa:0cfc:1   4c 1c b0 lbl_0cfc jmp gotob01c

acfd:0cff:1   4c d2 b1 lbl_0cff jmp gotob1d2

; modem carrier status stuff
ad00:0d02:1   4c 1d b2 lbl_0d02 jmp gotob21d

ad03:0d05:1   4c 4f b2		jmp mod_b24f

ad06:0d08:1   4c 1c b0		jmp gotob01c

; reset task pointer
ad09:0d0b:1   a9 fd		lda #$fd
ad0b:0d0d:1   8d f3 ac		sta mod_acf2+1
ad0e:0d10:1   60		rts

ad0f:0d11:1   ce ca ad gotoad0f dec lbl_adca
ad12:0d14:1   10 05		bpl skipad19
ad14:0d16:1   a9 04		lda #$04
ad16:0d18:1   8d ca ad		sta lbl_adca
ad19:0d1b:1   ce ec 42 skipad19 dec var_42ec
ad1c:0d1e:1   10 05		bpl skipad23
ad1e:0d20:1   a9 05		lda #$05
ad20:0d22:1   8d ec 42		sta var_42ec
ad23:0d25:1   ae ec 42 skipad23 ldx var_42ec
ad26:0d28:1   ad f3 42		lda scnmode
ad29:0d2b:1   d0 12		bne skipad3d
ad2b:0d2d:1   ad 08 d0		lda chatpage
ad2e:0d30:1   d0 02		bne skipad32
ad30:0d32:1   a2 00		ldx #$00
ad32:0d34:1   bd c4 ad skipad32 lda colortbl,x
ad35:0d37:1   a2 0f		ldx #$0f
ad37:0d39:1   9d cc db loopad37 sta colorram+972,x
ad3a:0d3c:1   ca		dex
ad3b:0d3d:1   10 fa		bpl loopad37
ad3d:0d3f:1   a9 00    skipad3d lda #$00
ad3f:0d41:1   f0 2a		beq skipad6b
ad41:0d43:1   ad c8 b9		lda lbl_b9c8
ad44:0d46:1   cd c6 b9		cmp lbl_b9c6
ad47:0d49:1   90 22		bcc skipad6b
ad49:0d4b:1   cd c7 b9 lbl_0d4b cmp lbl_b9c7
ad4c:0d4e:1   f0 02		beq skipad50
ad4e:0d50:1   b0 1b		bcs skipad6b
ad50:0d52:1   ad ca ad skipad50 lda lbl_adca
ad53:0d55:1   29 02		and #$02
ad55:0d57:1   aa		tax
ad56:0d58:1   ad ea 42		lda key
ad59:0d5b:1   e0 00		cpx #$00
ad5b:0d5d:1   f0 02		beq skipad5f
ad5d:0d5f:1   49 80		eor #$80
ad5f:0d61:1   ae ec 07 skipad5f ldx mcolor
ad62:0d64:1   a4 02    sub_ad62 ldy zp_02
ad64:0d66:1   99 18 05 lbl_ad64 sta var_0518,y
ad67:0d69:1   8a		txa
ad68:0d6a:1   99 18 d9 lbl_ad68 sta colorram+280,y
ad6b:0d6d:1   60       skipad6b rts

ad6c:0d6e:1   ad 3e ad sub_ad6c lda skipad3d+1
ad6f:0d71:1   d0 39		bne skipadaa
ad71:0d73:1   ad c8 b9		lda lbl_b9c8
ad74:0d76:1   cd c6 b9		cmp lbl_b9c6
ad77:0d79:1   90 31		bcc skipadaa
ad79:0d7b:1   cd c7 b9		cmp lbl_b9c7
ad7c:0d7e:1   f0 02		beq skipad80
ad7e:0d80:1   b0 2a		bcs skipadaa
ad80:0d82:1   a4 02    skipad80 ldy zp_02
ad82:0d84:1   ad 65 ad lbl_ad82 lda lbl_ad64+1
ad85:0d87:1   85 fb		sta free_fb
ad87:0d89:1   ad 66 ad		lda lbl_ad64+2
ad8a:0d8c:1   85 fc		sta free_fc
ad8c:0d8e:1   b1 fb		lda (free_fb),y
ad8e:0d90:1   8d ea 42		sta key
ad91:0d93:1   ad 69 ad		lda lbl_ad68+1
ad94:0d96:1   85 fb		sta free_fb
ad96:0d98:1   ad 6a ad		lda lbl_ad68+2
ad99:0d9b:1   85 fc		sta free_fc
ad9b:0d9d:1   b1 fb		lda (free_fb),y
ad9d:0d9f:1   8d eb 42 lbl_ad9d sta shft
ada0:0da2:1   a9 01		lda #$01
ada2:0da4:1   8d 3e ad		sta skipad3d+1
ada5:0da7:1   a9 03		lda #$03
ada7:0da9:1   8d ca ad		sta lbl_adca
adaa:0dac:1   4c 3d ad skipadaa jmp skipad3d

adad:0daf:1   08       sub_adad php
adae:0db0:1   78		sei
adaf:0db1:1   ad 3e ad		lda skipad3d+1
adb2:0db4:1   f0 0e		beq skipadc2
adb4:0db6:1   a9 00		lda #$00
adb6:0db8:1   8d 3e ad		sta skipad3d+1
adb9:0dbb:1   ad ea 42		lda key
adbc:0dbe:1   ae eb 42		ldx shft
adbf:0dc1:1   20 62 ad		jsr sub_ad62
adc2:0dc4:1   28       skipadc2 plp
adc3:0dc5:1   60		rts

adc4:0dc6:1   tbl-adc9 colortbl .byte $0e,$03,$01,$03,$0e,$06

adca:0dcc:1   00       lbl_adca brk
adcb:0dcd:1   ad 0a dc gotoadcb lda cia1min
adce:0dd0:1   cd f1 42		cmp ha577
add1:0dd3:1   f0 69		beq skipae3c
add3:0dd5:1   8d f1 42		sta ha577
add6:0dd8:1   8d cc ce		sta lbl_cecc
add9:0ddb:1   20 c7 af		jsr sub_afc7
addc:0dde:1   ad 0b dc		lda cia1hour
addf:0de1:1   8d cb ce		sta lbl_cecb
ade2:0de4:1   ae 08 dc		ldx cia1dsec
ade5:0de7:1   c9 12		cmp #$12
ade7:0de9:1   d0 50		bne skipae39
ade9:0deb:1   ad cc ce		lda lbl_cecc
adec:0dee:1   d0 4b		bne skipae39
adee:0df0:1   ee c7 ce		inc lbl_cec7
adf1:0df3:1   ad c7 ce		lda lbl_cec7
adf4:0df6:1   c9 08		cmp #$08
adf6:0df8:1   90 05		bcc skipadfd
adf8:0dfa:1   a9 01		lda #$01
adfa:0dfc:1   8d c7 ce		sta lbl_cec7
adfd:0dff:1   ac c8 ce skipadfd ldy lbl_cec8
ae00:0e02:1   ad c9 ce		lda lbl_cec9
ae03:0e05:1   d9 d0 ce		cmp lbl_ced0,y
ae06:0e08:1   d0 0f		bne skipae17
ae08:0e0a:1   a9 00		lda #$00
ae0a:0e0c:1   8d c9 ce		sta lbl_cec9
ae0d:0e0f:1   ad c8 ce		lda lbl_cec8
ae10:0e12:1   f8		sed
ae11:0e13:1   18		clc
ae12:0e14:1   69 01		adc #$01
ae14:0e16:1   8d c8 ce		sta lbl_cec8
ae17:0e19:1   ad c9 ce skipae17 lda lbl_cec9
ae1a:0e1c:1   f8		sed
ae1b:0e1d:1   18		clc
ae1c:0e1e:1   69 01		adc #$01
ae1e:0e20:1   8d c9 ce		sta lbl_cec9
ae21:0e23:1   d8		cld
ae22:0e24:1   ad c8 ce		lda lbl_cec8
ae25:0e27:1   c9 13		cmp #$13
ae27:0e29:1   d0 0f		bne skipae38
ae29:0e2b:1   a9 01		lda #$01
ae2b:0e2d:1   8d c8 ce		sta lbl_cec8
ae2e:0e30:1   ad ca ce		lda lbl_ceca
ae31:0e33:1   f8		sed
ae32:0e34:1   18		clc
ae33:0e35:1   69 01		adc #$01
ae35:0e37:1   8d ca ce		sta lbl_ceca
ae38:0e3a:1   d8       skipae38 cld
ae39:0e3b:1   20 8f ae skipae39 jsr sub_ae8f
ae3c:0e3e:1   ad 09 dc skipae3c lda cia1sec
ae3f:0e41:1   20 ab af		jsr sub_afab
ae42:0e44:1   48		pha
ae43:0e45:1   8a		txa
ae44:0e46:1   a8		tay
ae45:0e47:1   68		pla
ae46:0e48:1   a2 17		ldx #$17
ae48:0e4a:1   20 94 af		jsr sub_af94
ae4b:0e4d:1   98		tya
ae4c:0e4e:1   20 94 af		jsr sub_af94
ae4f:0e51:1   ad 03 d0		lda tsr
ae52:0e54:1   f0 08		beq skipae5c
ae54:0e56:1   a9 59		lda #$59
ae56:0e58:1   f8		sed
ae57:0e59:1   38		sec
ae58:0e5a:1   ed 09 dc		sbc cia1sec
ae5b:0e5d:1   d8		cld
ae5c:0e5e:1   20 ab af skipae5c jsr sub_afab
ae5f:0e61:1   48		pha
ae60:0e62:1   8a		txa
ae61:0e63:1   a8		tay
ae62:0e64:1   68		pla
ae63:0e65:1   a2 24		ldx #$24
ae65:0e67:1   20 94 af		jsr sub_af94
ae68:0e6a:1   98		tya
ae69:0e6b:1   20 94 af		jsr sub_af94
ae6c:0e6e:1   ad e9 42		lda cphase
ae6f:0e71:1   d0 0f		bne skipae80
ae71:0e73:1   ad 03 d0		lda tsr
ae74:0e76:1   f0 0a		beq skipae80
ae76:0e78:1   a9 7c		lda #$7c	      ; $be7c -> ($a000)
ae78:0e7a:1   8d 00 a0		sta irqtable
ae7b:0e7d:1   a9 be		lda #$be
ae7d:0e7f:1   8d 01 a0		sta irqtable+1
ae80:0e82:1   ad 03 d0 skipae80 lda tsr
ae83:0e85:1   cd e9 42		cmp cphase
ae86:0e88:1   8d e9 42		sta cphase
ae89:0e8b:1   d0 03		bne skipae8e
ae8b:0e8d:1   20 dc af		jsr sub_afdc
ae8e:0e90:1   60       skipae8e rts

ae8f:0e91:1   ad c7 ce sub_ae8f lda lbl_cec7
ae92:0e94:1   09 30		ora #$30
ae94:0e96:1   8d 00 ce		sta d1str
ae97:0e99:1   ad c8 ce		lda lbl_cec8
ae9a:0e9c:1   20 ab af		jsr sub_afab
ae9d:0e9f:1   8d 03 ce		sta d1str+3
aea0:0ea2:1   8e 04 ce		stx d1str+4
aea3:0ea5:1   ad c9 ce		lda lbl_cec9
aea6:0ea8:1   20 ab af		jsr sub_afab
aea9:0eab:1   8d 05 ce		sta d1str+5
aeac:0eae:1   8e 06 ce		stx d1str+6
aeaf:0eb1:1   ad ca ce		lda lbl_ceca
aeb2:0eb4:1   20 ab af		jsr sub_afab
aeb5:0eb7:1   8d 01 ce		sta d1str+1
aeb8:0eba:1   8e 02 ce		stx d1str+2
aebb:0ebd:1   ad cb ce		lda lbl_cecb
aebe:0ec0:1   20 ab af		jsr sub_afab
aec1:0ec3:1   8d 07 ce		sta d1str+7
aec4:0ec6:1   8e 08 ce		stx d1str+8
aec7:0ec9:1   ad cc ce		lda lbl_cecc
aeca:0ecc:1   20 ab af		jsr sub_afab
aecd:0ecf:1   8d 09 ce		sta d1str+9
aed0:0ed2:1   8e 0a ce		stx d1str+10
aed3:0ed5:1   ac c7 ce sub_aed3 ldy lbl_cec7
aed6:0ed8:1   88		dey
aed7:0ed9:1   98		tya
aed8:0eda:1   0a		asl a
aed9:0edb:1   0a		asl a
aeda:0edc:1   a8		tay
aedb:0edd:1   a2 00		ldx #$00
aedd:0edf:1   b9 15 a2 loopaedd lda days,y
aee0:0ee2:1   20 94 af		jsr sub_af94
aee3:0ee5:1   c8		iny
aee4:0ee6:1   e0 04		cpx #$04
aee6:0ee8:1   d0 f5		bne loopaedd
aee8:0eea:1   ad c8 ce		lda lbl_cec8
aeeb:0eed:1   c9 10		cmp #$10
aeed:0eef:1   90 02		bcc skipaef1
aeef:0ef1:1   e9 06		sbc #$06
aef1:0ef3:1   a8       skipaef1 tay
aef2:0ef4:1   88		dey
aef3:0ef5:1   98		tya
aef4:0ef6:1   0a		asl a
aef5:0ef7:1   0a		asl a
aef6:0ef8:1   a8		tay
aef7:0ef9:1   b9 e5 a1 loopaef7 lda months,y
aefa:0efc:1   20 94 af		jsr sub_af94
aefd:0eff:1   c8		iny
aefe:0f00:1   e0 08		cpx #$08
af00:0f02:1   d0 f5		bne loopaef7
af02:0f04:1   ad 05 ce		lda d1str+5
af05:0f07:1   c9 30		cmp #$30
af07:0f09:1   d0 02		bne skipaf0b
af09:0f0b:1   a9 20		lda #$20
af0b:0f0d:1   20 94 af skipaf0b jsr sub_af94
af0e:0f10:1   ad 06 ce		lda d1str+6
af11:0f13:1   20 94 af		jsr sub_af94
af14:0f16:1   a9 2c		lda #$2c
af16:0f18:1   20 94 af		jsr sub_af94
af19:0f1b:1   a9 20		lda #$20
af1b:0f1d:1   20 94 af		jsr sub_af94
af1e:0f20:1   a9 31		lda #$31
af20:0f22:1   20 94 af		jsr sub_af94
af23:0f25:1   a9 39		lda #$39
af25:0f27:1   20 94 af		jsr sub_af94
af28:0f2a:1   ad 01 ce		lda d1str+1
af2b:0f2d:1   20 94 af		jsr sub_af94
af2e:0f30:1   ad 02 ce		lda d1str+2
af31:0f33:1   20 94 af		jsr sub_af94
af34:0f36:1   a9 20		lda #$20
af36:0f38:1   20 94 af		jsr sub_af94
af39:0f3b:1   ad 07 ce		lda d1str+7
af3c:0f3e:1   29 31		and #$31
af3e:0f40:1   c9 30		cmp #$30
af40:0f42:1   d0 02		bne skipaf44
af42:0f44:1   a9 20		lda #$20
af44:0f46:1   20 94 af skipaf44 jsr sub_af94
af47:0f49:1   ad 08 ce		lda d1str+8
af4a:0f4c:1   20 94 af		jsr sub_af94
af4d:0f4f:1   a9 3a		lda #$3a
af4f:0f51:1   20 94 af		jsr sub_af94
af52:0f54:1   ad 09 ce		lda d1str+9
af55:0f57:1   20 94 af		jsr sub_af94
af58:0f5a:1   ad 0a ce		lda d1str+10
af5b:0f5d:1   20 94 af		jsr sub_af94
af5e:0f60:1   a9 3a		lda #$3a
af60:0f62:1   20 94 af		jsr sub_af94
af63:0f65:1   ad 09 dc		lda cia1sec
af66:0f68:1   48		pha
af67:0f69:1   4a		lsr a
af68:0f6a:1   4a		lsr a
af69:0f6b:1   4a		lsr a
af6a:0f6c:1   4a		lsr a
af6b:0f6d:1   09 30		ora #$30
af6d:0f6f:1   20 94 af		jsr sub_af94
af70:0f72:1   68		pla
af71:0f73:1   29 0f		and #$0f
af73:0f75:1   09 30		ora #$30
af75:0f77:1   20 94 af		jsr sub_af94
af78:0f7a:1   a9 20		lda #$20
af7a:0f7c:1   20 94 af		jsr sub_af94
af7d:0f7f:1   ad 07 ce		lda d1str+7
af80:0f82:1   c9 38		cmp #$38
af82:0f84:1   b0 04		bcs skipaf88
af84:0f86:1   a9 c1		lda #$c1
af86:0f88:1   d0 02		bne skipaf8a
af88:0f8a:1   a9 d0    skipaf88 lda #$d0
af8a:0f8c:1   20 94 af skipaf8a jsr sub_af94
af8d:0f8f:1   a9 cd		lda #$cd
af8f:0f91:1   20 94 af		jsr sub_af94
af92:0f94:1   a9 20		lda #$20
af94:0f96:1   48       sub_af94 pha
af95:0f97:1   2d aa af		and lbl_afaa
af98:0f9a:1   c9 80		cmp #$80
af9a:0f9c:1   b0 06		bcs skipafa2
af9c:0f9e:1   c9 40		cmp #$40
af9e:0fa0:1   90 02		bcc skipafa2
afa0:0fa2:1   29 3f		and #$3f
afa2:0fa4:1   09 80    skipafa2 ora #$80
afa4:0fa6:1   9d 01 04		sta $0401,x
afa7:0fa9:1   e8		inx
afa8:0faa:1   68		pla
afa9:0fab:1   60		rts

afaa:0fac:1   tbl-afaa lbl_afaa .byte $ff	; serial # related

afab:0fad:1   48       sub_afab pha
afac:0fae:1   4a		lsr a
afad:0faf:1   4a		lsr a
afae:0fb0:1   4a		lsr a
afaf:0fb1:1   4a		lsr a
afb0:0fb2:1   09 30		ora #$30
afb2:0fb4:1   8d ef 42		sta var_42ef
afb5:0fb7:1   a8		tay
afb6:0fb8:1   8d ef 42		sta var_42ef
afb9:0fbb:1   68		pla
afba:0fbc:1   29 0f		and #$0f
afbc:0fbe:1   09 30		ora #$30
afbe:0fc0:1   8d f0 42		sta ptrpnfd
afc1:0fc3:1   aa		tax
afc2:0fc4:1   8d f0 42		sta ptrpnfd
afc5:0fc7:1   98		tya
afc6:0fc8:1   60		rts

afc7:0fc9:1   ad 03 d0 sub_afc7 lda tsr
afca:0fcc:1   f0 07		beq skipafd3
afcc:0fce:1   c9 65		cmp #$65
afce:0fd0:1   b0 03		bcs skipafd3
afd0:0fd2:1   ce 03 d0		dec tsr
afd3:0fd5:1   60       skipafd3 rts

afd4:0fd6:1   ad 03 d0		lda tsr
afd7:0fd9:1   c5 00		cmp d6510
afd9:0fdb:1   d0 01		bne sub_afdc
afdb:0fdd:1   60		rts

afdc:0fde:1   a2 20    sub_afdc ldx #$20
afde:0fe0:1   a9 20		lda #$20
afe0:0fe2:1   a9 20		lda #$20
afe2:0fe4:1   20 94 af		jsr sub_af94
afe5:0fe7:1   ad 03 d0		lda tsr
afe8:0fea:1   f0 11		beq skipaffb
afea:0fec:1   c9 65		cmp #$65
afec:0fee:1   90 0a		bcc skipaff8
afee:0ff0:1   a9 65		lda #$65
aff0:0ff2:1   8d 03 d0		sta tsr
aff3:0ff5:1   a9 2d		lda #$2d
aff5:0ff7:1   a8		tay
aff6:0ff8:1   d0 10		bne skipb008
aff8:0ffa:1   38       skipaff8 sec
aff9:0ffb:1   e9 01		sbc #$01
affb:0ffd:1   a0 30    skipaffb ldy #$30
affd:0fff:1   c9 0a    loopaffd cmp #$0a
afff:1001:1   90 05		bcc skipb006
b001:1003:1   e9 0a		sbc #$0a
b003:1005:1   c8		iny
b004:1006:1   d0 f7		bne loopaffd
b006:1008:1   09 30    skipb006 ora #$30
b008:100a:1   48       skipb008 pha
b009:100b:1   98		tya
b00a:100c:1   20 94 af		jsr sub_af94
b00d:100f:1   68		pla
b00e:1010:1   20 94 af		jsr sub_af94
b011:1013:1   a9 3a		lda #$3a
b013:1015:1   4c 94 af		jmp sub_af94

b016:1018:1   4c 12 b1 loopb016 jmp gotob112

b019:101b:1   4c 7f b1 loopb019 jmp gotob17f

b01c:101e:1   ad f3 42 gotob01c lda scnmode
b01f:1021:1   d0 0e		bne skipb02f
b021:1023:1   ad f4 07		lda chk_left
b024:1026:1   29 08		and #$08
b026:1028:1   d0 ee		bne loopb016
b028:102a:1   ad f4 07		lda chk_left
b02b:102d:1   29 02		and #$02
b02d:102f:1   d0 ea		bne loopb019
b02f:1031:1   ad 8d 02 skipb02f lda shflag
b032:1034:1   29 01		and #$01
b034:1036:1   8d ee 42		sta var_42ee
b037:1039:1   a5 c5		lda lstx
b039:103b:1   cd ed 42		cmp var_42ed
b03c:103e:1   f0 2b		beq skipb069
b03e:1040:1   8d ed 42		sta var_42ed
b041:1043:1   ae fb 42		ldx scnlock
b044:1046:1   d0 04		bne skipb04a
b046:1048:1   c9 04		cmp #$04
b048:104a:1   f0 49		beq skipb093
b04a:104c:1   ae f3 42 skipb04a ldx scnmode
b04d:104f:1   d0 1a		bne skipb069
b04f:1051:1   c9 03		cmp #$03
b051:1053:1   f0 33		beq skipb086
b053:1055:1   ae ee 42		ldx var_42ee
b056:1058:1   d0 09		bne skipb061
b058:105a:1   c9 05		cmp #$05
b05a:105c:1   f0 0e		beq skipb06a
b05c:105e:1   c9 06		cmp #$06
b05e:1060:1   f0 18		beq skipb078
b060:1062:1   60		rts

b061:1063:1   c9 05    skipb061 cmp #$05
b063:1065:1   f0 09		beq skipb06e
b065:1067:1   c9 06		cmp #$06
b067:1069:1   f0 13		beq skipb07c
b069:106b:1   60       skipb069 rts

b06a:106c:1   ce e8 42 skipb06a dec undcol
b06d:106f:1   60		rts

b06e:1070:1   38       skipb06e sec
b06f:1071:1   ad e8 42		lda undcol
b072:1074:1   e9 08		sbc #$08
b074:1076:1   8d e8 42		sta undcol
b077:1079:1   60		rts

b078:107a:1   ee e8 42 skipb078 inc undcol
b07b:107d:1   60		rts

b07c:107e:1   18       skipb07c clc
b07d:107f:1   ad e8 42		lda undcol
b080:1082:1   69 08		adc #$08
b082:1084:1   8d e8 42		sta undcol
b085:1087:1   60		rts

b086:1088:1   ad e8 42 skipb086 lda undcol
b089:108b:1   0a		asl a
b08a:108c:1   0d ee 42		ora var_42ee
b08d:108f:1   aa		tax
b08e:1090:1   a0 02		ldy #$02
b090:1092:1   4c 23 b3		jmp gotob323

b093:1095:1   ae f3 42 skipb093 ldx scnmode
b096:1098:1   4c 9e b0		jmp gotob09e

b099:109b:1   ec f3 42 sub_b099 cpx scnmode
b09c:109e:1   d0 cb		bne skipb069
b09e:10a0:1   e0 00    gotob09e cpx #$00
b0a0:10a2:1   d0 13		bne skipb0b5
b0a2:10a4:1   20 c3 b0		jsr sub_b0c3
b0a5:10a7:1   a2 01		ldx #$01
b0a7:10a9:1   a0 18		ldy #$18
b0a9:10ab:1   a9 01		lda #$01
b0ab:10ad:1   8e c6 b9 loopb0ab stx lbl_b9c6
b0ae:10b0:1   8c c7 b9		sty lbl_b9c7
b0b1:10b3:1   8d f3 42		sta scnmode
b0b4:10b6:1   60		rts

b0b5:10b7:1   20 ad ad skipb0b5 jsr sub_adad
b0b8:10ba:1   20 c3 b0		jsr sub_b0c3
b0bb:10bd:1   a2 07    lbl_10bd ldx #$07
b0bd:10bf:1   a0 16		ldy #$16
b0bf:10c1:1   a9 00		lda #$00
b0c1:10c3:1   f0 e8		beq loopb0ab
b0c3:10c5:1   a0 00    sub_b0c3 ldy #$00
b0c5:10c7:1   b9 28 04 loopb0c5 lda videoram+40,y
b0c8:10ca:1   aa		tax
b0c9:10cb:1   b9 00 41		lda $4100,y
b0cc:10ce:1   99 28 04		sta videoram+40,y
b0cf:10d1:1   8a		txa
b0d0:10d2:1   99 00 41		sta $4100,y
b0d3:10d5:1   b9 28 d8		lda $d828,y
b0d6:10d8:1   aa		tax
b0d7:10d9:1   b9 f0 41		lda tempcol,y
b0da:10dc:1   99 28 d8		sta $d828,y
b0dd:10df:1   8a		txa
b0de:10e0:1   99 f0 41		sta tempcol,y
b0e1:10e3:1   c8		iny
b0e2:10e4:1   c0 f0		cpy #$f0
b0e4:10e6:1   d0 df		bne loopb0c5
b0e6:10e8:1   a0       lbl_b0e6 BAD		; fixme: a0 00 ldy #$00
	; with BASIC ROM banked in, ptrget finds var address:
b0e7:10e9:1   00       ptrget1	brk		
b0e8:10ea:1   b9 98 07 loopb0e8 lda mask_bot,y
b0eb:10ed:1   aa		tax
b0ec:10ee:1   b9 00 40		lda tempbott,y
b0ef:10f1:1   99 98 07		sta mask_bot,y
b0f2:10f4:1   8a		txa
b0f3:10f5:1   99 00 40		sta tempbott,y
b0f6:10f8:1   b9 98 db		lda colorram+920,y
b0f9:10fb:1   aa		tax
b0fa:10fc:1   b9 50 40		lda $4050,y
b0fd:10ff:1   99 98 db		sta colorram+920,y
b100:1102:1   8a		txa
b101:1103:1   99 50 40		sta $4050,y
b104:1106:1   c8		iny
b105:1107:1   c0 50		cpy #$50
b107:1109:1   d0 df		bne loopb0e8
b109:110b:1   60		rts

b10a:110c:1   tbl-b111 t_bits	.byte %00000001,%00000010,%00000100,%00001000
b10e:1110:1			.byte %00010000,%00100000,%01000000,%10000000

b112:1114:1   a5 c5    gotob112 lda lstx
b114:1116:1   cd ed 42		cmp var_42ed
b117:1119:1   f0 26		beq skipb13f
b119:111b:1   8d ed 42		sta var_42ed
b11c:111e:1   ae 8d 02		ldx shflag
b11f:1121:1   e0 01		cpx #$01
b121:1123:1   f0 0c		beq skipb12f
b123:1125:1   c9 04		cmp #$04
b125:1127:1   f0 31		beq skipb158
b127:1129:1   c9 05		cmp #$05
b129:112b:1   f0 15		beq skipb140
b12b:112d:1   c9 06		cmp #$06
b12d:112f:1   f0 1e		beq skipb14d
b12f:1131:1   c9 03    skipb12f cmp #$03
b131:1133:1   f0 43		beq skipb176
b133:1135:1   c9 04		cmp #$04
b135:1137:1   f0 25		beq skipb15c
b137:1139:1   c9 05		cmp #$05
b139:113b:1   f0 25		beq skipb160
b13b:113d:1   c9 06		cmp #$06
b13d:113f:1   f0 2c		beq skipb16b
b13f:1141:1   60       skipb13f rts

b140:1142:1   ad 03 d0 skipb140 lda tsr
b143:1145:1   c9 65		cmp #$65
b145:1147:1   b0 f8		bcs skipb13f
b147:1149:1   ee 03 d0		inc tsr
b14a:114c:1   4c dc af		jmp sub_afdc

b14d:114f:1   ad 03 d0 skipb14d lda tsr
b150:1152:1   f0 ed		beq skipb13f
b152:1154:1   ce 03 d0		dec tsr
b155:1157:1   4c dc af		jmp sub_afdc

b158:115a:1   a9 00    skipb158 lda #$00
b15a:115c:1   f0 1d		beq skipb179
b15c:115e:1   a9 65    skipb15c lda #$65
b15e:1160:1   d0 19		bne skipb179
b160:1162:1   ad 03 d0 skipb160 lda tsr
b163:1165:1   c9 65		cmp #$65
b165:1167:1   b0 d8		bcs skipb13f
b167:1169:1   69 0a		adc #$0a
b169:116b:1   90 0e		bcc skipb179
b16b:116d:1   ad 03 d0 skipb16b lda tsr
b16e:1170:1   c9 0a		cmp #$0a
b170:1172:1   90 cd		bcc skipb13f
b172:1174:1   e9 0a		sbc #$0a
b174:1176:1   b0 03		bcs skipb179
b176:1178:1   4c 86 b0 skipb176 jmp skipb086

b179:117b:1   8d 03 d0 skipb179 sta tsr
b17c:117e:1   4c dc af		jmp sub_afdc

b17f:1181:1   a5 c5    gotob17f lda lstx
b181:1183:1   cd ed 42		cmp var_42ed
b184:1186:1   f0 0f		beq skipb195
b186:1188:1   8d ed 42		sta var_42ed
b189:118b:1   c9 05		cmp #$05
b18b:118d:1   f0 21		beq skipb1ae
b18d:118f:1   c9 06		cmp #$06
b18f:1191:1   f0 0d		beq skipb19e
b191:1193:1   c9 03		cmp #$03
b193:1195:1   f0 29		beq skipb1be
b195:1197:1   ad 9c 04 skipb195 lda videoram+156
b198:119a:1   09 80		ora #$80
b19a:119c:1   8d 9c 04		sta videoram+156
b19d:119f:1   60		rts

b19e:11a0:1   ce 9c 04 skipb19e dec videoram+156
b1a1:11a3:1   ad 9c 04		lda videoram+156
b1a4:11a6:1   c9 b0		cmp #$b0
b1a6:11a8:1   b0 05		bcs skipb1ad
b1a8:11aa:1   a9 b9		lda #$b9
b1aa:11ac:1   8d 9c 04		sta videoram+156
b1ad:11af:1   60       skipb1ad rts

b1ae:11b0:1   ee 9c 04 skipb1ae inc videoram+156
b1b1:11b3:1   ad 9c 04		lda videoram+156
b1b4:11b6:1   c9 ba		cmp #$ba
b1b6:11b8:1   90 05		bcc skipb1bd
b1b8:11ba:1   a9 b0		lda #$b0
b1ba:11bc:1   8d 9c 04		sta videoram+156
b1bd:11bf:1   60       skipb1bd rts

b1be:11c0:1   ad 9c 04 skipb1be lda videoram+156
b1c1:11c3:1   29 7f		and #$7f
b1c3:11c5:1   8d 9c 04		sta videoram+156
b1c6:11c8:1   29 0f		and #$0f
b1c8:11ca:1   09 80		ora #$80
b1ca:11cc:1   8d 09 d0		sta access
b1cd:11cf:1   4c 86 b0		jmp skipb086

b1d0:11d2:1   tbl-b1d1 lbl_b1d0 .byte $d1	; fixme: cmp ($77),y

b1d1:11d3:1	       lbl_b1d1 .byte $77

b1d2:11d4:1   a2 fa    gotob1d2 ldx #$fa
b1d4:11d6:1   ad ff cf		lda var_cfff
b1d7:11d9:1   4d 0a d0		eor mxor
b1da:11dc:1   29 10		and #$10
b1dc:11de:1   f0 09		beq skipb1e7
b1de:11e0:1   a9 01		lda #$01
b1e0:11e2:1   8d f1 07		sta carrst
b1e3:11e5:1   a2 a0		ldx #$a0
b1e5:11e7:1   d0 08		bne skipb1ef
b1e7:11e9:1   ad f1 07 skipb1e7 lda carrst
b1ea:11ec:1   09 80		ora #$80
b1ec:11ee:1   8d f1 07		sta carrst
b1ef:11f1:1   ad c6 b9 skipb1ef lda lbl_b9c6
b1f2:11f4:1   f0 11		beq skipb205
b1f4:11f6:1   8e 27 04		stx videoram+39
b1f7:11f9:1   a2 a0		ldx #$a0
b1f9:11fb:1   ad e5 42		lda bar
b1fc:11fe:1   29 01		and #$01
b1fe:1200:1   d0 02		bne skipb202
b200:1202:1   a2 fa		ldx #$fa
b202:1204:1   8e 00 04 skipb202 stx videoram
b205:1207:1   ad 1b b2 skipb205 lda lbl_b21b
b208:120a:1   cd d0 b1		cmp lbl_b1d0
b20b:120d:1   d0 09		bne skipb216
b20d:120f:1   ad 1c b2		lda lbl_b21c
b210:1212:1   cd d1 b1		cmp lbl_b1d1
b213:1215:1   d0 01		bne skipb216
b215:1217:1   60		rts

b216:1218:1   a2 01    skipb216 ldx #$01
b218:121a:1   4c 99 b0		jmp sub_b099

b21b:121d:1   tbl-b21c lbl_b21b .byte $d1

b21c:121e:1	       lbl_b21c .byte $77

; modem carrier status stuff:
b21d:121f:1   ad f1 07 gotob21d lda carrst
b220:1222:1   29 7f		and #$7f
b222:1224:1   c9 01    mod_b222 cmp #$01
b224:1226:1   f0 0c		beq skipb232
b226:1228:1   8d 23 b2		sta mod_b222+1
b229:122b:1   c9 00		cmp #$00
b22b:122d:1   d0 05		bne skipb232
b22d:122f:1   a9 01		lda #$01
b22f:1231:1   8d 05 d0		sta flag
b232:1234:1   ad f4 07 skipb232 lda chk_left
b235:1237:1   29 04		and #$04
b237:1239:1   c9 00    mod_b237 cmp #$00
b239:123b:1   f0 13		beq skipb24e
b23b:123d:1   8d 38 b2		sta mod_b237+1
b23e:1240:1   c9 00		cmp #$00
b240:1242:1   f0 0c		beq skipb24e
b242:1244:1   ad f1 07		lda carrst
b245:1247:1   29 7f		and #$7f
b247:1249:1   f0 05		beq skipb24e
b249:124b:1   a9 01		lda #$01
b24b:124d:1   8d 05 d0		sta flag
b24e:1250:1   60       skipb24e rts

b24f:1251:1   a9 01    mod_b24f lda #$01
b251:1253:1   48		pha
b252:1254:1   ad e8 42		lda undcol
b255:1257:1   29 0f		and #$0f
b257:1259:1   8d e8 42		sta undcol
b25a:125c:1   4a		lsr a
b25b:125d:1   29 fc		and #$fc
b25d:125f:1   aa		tax
b25e:1260:1   a5 14		lda linnum
b260:1262:1   8d 97 b3		sta lbl_b397
b263:1265:1   a5 15		lda linnum+1
b265:1267:1   8d 98 b3		sta lbl_b398
b268:126a:1   a0 00		ldy #$00
b26a:126c:1   bd 9e b3		lda lbl_b39e,x
b26d:126f:1   85 14		sta linnum
b26f:1271:1   bd 9f b3		lda lbl_b39e+1,x
b272:1274:1   85 15		sta linnum+1
b274:1276:1   b1 14		lda (linnum),y
b276:1278:1   8d 9a b3		sta lbl_b39a
b279:127b:1   bd a0 b3		lda lbl_b39e+2,x
b27c:127e:1   85 14		sta linnum
b27e:1280:1   bd a1 b3		lda lbl_b3a1,x
b281:1283:1   85 15		sta linnum+1
b283:1285:1   b1 14		lda (linnum),y
b285:1287:1   8d 9b b3		sta lbl_b39b
b288:128a:1   ad e8 42		lda undcol
b28b:128d:1   4a		lsr a
b28c:128e:1   4a		lsr a
b28d:128f:1   4a		lsr a
b28e:1290:1   0a		asl a
b28f:1291:1   aa		tax
b290:1292:1   bd a6 b3		lda lbl_b3a6,x
b293:1295:1   85 14		sta linnum
b295:1297:1   bd a7 b3		lda lbl_b3a7,x
b298:129a:1   85 15		sta linnum+1
b29a:129c:1   68		pla
b29b:129d:1   d0 23		bne skipb2c0
b29d:129f:1   ad 9a b3		lda lbl_b39a
b2a0:12a2:1   cd 9c b3		cmp lbl_b39c
b2a3:12a5:1   d0 1b		bne skipb2c0
b2a5:12a7:1   ad 9b b3		lda lbl_b39b
b2a8:12aa:1   cd 9d b3		cmp lbl_b39d
b2ab:12ad:1   d0 13		bne skipb2c0
b2ad:12af:1   ad e8 42		lda undcol
b2b0:12b2:1   cd e7 42		cmp undchr
b2b3:12b5:1   d0 0b    lbl_b2b3 bne skipb2c0
b2b5:12b7:1   ad 97 b3 loopb2b5 lda lbl_b397
b2b8:12ba:1   85 14		sta linnum
b2ba:12bc:1   ad 98 b3		lda lbl_b398
b2bd:12bf:1   85 15		sta linnum+1
b2bf:12c1:1   60		rts

b2c0:12c2:1   ae f3 42 skipb2c0 ldx scnmode
b2c3:12c5:1   d0 f0		bne loopb2b5
b2c5:12c7:1   a2 00		ldx #$00
b2c7:12c9:1   a0 00		ldy #$00
b2c9:12cb:1   8c 50 b2		sty mod_b24f+1
b2cc:12ce:1   ad e8 42		lda undcol
b2cf:12d1:1   8d e7 42		sta undchr
b2d2:12d4:1   29 07		and #$07
b2d4:12d6:1   8d 99 b3		sta lbl_b399
b2d7:12d9:1   ad 9a b3		lda lbl_b39a
b2da:12dc:1   8d 9c b3		sta lbl_b39c
b2dd:12df:1   ad 9b b3		lda lbl_b39b
b2e0:12e2:1   8d 9d b3		sta lbl_b39d
b2e3:12e5:1   ad 9a b3 loopb2e3 lda lbl_b39a
b2e6:12e8:1   20 00 b3		jsr sub_b300
b2e9:12eb:1   20 1e b3		jsr sub_b31e
b2ec:12ee:1   20 1e b3		jsr sub_b31e
b2ef:12f1:1   20 1e b3		jsr sub_b31e
b2f2:12f4:1   ad 9b b3		lda lbl_b39b
b2f5:12f7:1   20 00 b3		jsr sub_b300
b2f8:12fa:1   e8		inx
b2f9:12fb:1   e0 08		cpx #$08
b2fb:12fd:1   90 e6		bcc loopb2e3
b2fd:12ff:1   4c b5 b2		jmp loopb2b5

b300:1302:1   3d 0a b1 sub_b300 and $b10a,x
b303:1305:1   f0 04		beq skipb309
b305:1307:1   a9 fa		lda #$fa
b307:1309:1   d0 02		bne skipb30b
b309:130b:1   a9 20    skipb309 lda #$20
b30b:130d:1   09 80    skipb30b ora #$80
b30d:130f:1   99 f0 04		sta light,y
b310:1312:1   a9 fe		lda #$fe
b312:1314:1   ec 99 b3		cpx lbl_b399
b315:1317:1   d0 02		bne skipb319
b317:1319:1   a9 f3		lda #$f3
b319:131b:1   99 f0 d8 skipb319 sta $d8f0,y
b31c:131e:1   c8		iny
b31d:131f:1   60		rts

b31e:1320:1   b1 14    sub_b31e lda (linnum),y
b320:1322:1   4c 0b b3		jmp skipb30b

b323:1325:1   a5 14    gotob323 lda linnum
b325:1327:1   48		pha
b326:1328:1   a5 15		lda linnum+1
b328:132a:1   48		pha
b329:132b:1   8e 99 b3 lbl_b329 stx lbl_b399
b32c:132e:1   8a		txa
b32d:132f:1   4a		lsr a
b32e:1330:1   48		pha
b32f:1331:1   08		php
b330:1332:1   4a		lsr a
b331:1333:1   4a		lsr a
b332:1334:1   4a		lsr a
b333:1335:1   0a		asl a
b334:1336:1   28		plp
b335:1337:1   69 00		adc #$00
b337:1339:1   0a		asl a
b338:133a:1   aa		tax
b339:133b:1   bd 9e b3		lda lbl_b39e,x
b33c:133e:1   85 14		sta linnum
b33e:1340:1   bd 9f b3		lda lbl_b39e+1,x
b341:1343:1   85 15		sta linnum+1
b343:1345:1   68		pla
b344:1346:1   29 07		and #$07
b346:1348:1   aa		tax
b347:1349:1   bd 0a b1		lda $b10a,x
b34a:134c:1   c0 00		cpy #$00
b34c:134e:1   d0 0b		bne skipb359
b34e:1350:1   49 ff		eor #$ff
b350:1352:1   a0 00		ldy #$00
b352:1354:1   31 14		and (linnum),y
b354:1356:1   91 14		sta (linnum),y
b356:1358:1   4c 87 b3		jmp gotob387

b359:135b:1   c0 01    skipb359 cpy #$01
b35b:135d:1   d0 09		bne skipb366
b35d:135f:1   a0 00		ldy #$00
b35f:1361:1   11 14		ora (linnum),y
b361:1363:1   91 14		sta (linnum),y
b363:1365:1   4c 87 b3		jmp gotob387

b366:1368:1   c0 02    skipb366 cpy #$02
b368:136a:1   d0 09		bne skipb373
b36a:136c:1   a0 00		ldy #$00
b36c:136e:1   51 14		eor (linnum),y
b36e:1370:1   91 14		sta (linnum),y
b370:1372:1   4c 87 b3		jmp gotob387

b373:1375:1   c0 03    skipb373 cpy #$03
b375:1377:1   d0 17		bne skipb38e
b377:1379:1   a0 00		ldy #$00
b379:137b:1   84 61		sty fac1
b37b:137d:1   31 14		and (linnum),y
b37d:137f:1   f0 01		beq skipb380
b37f:1381:1   c8		iny
b380:1382:1   84 62    skipb380 sty fac1+1
b382:1384:1   a2 1e		ldx #$1e
b384:1386:1   20 a5 b5		jsr sub_b5a5
b387:1389:1   68       gotob387 pla
b388:138a:1   85 15		sta linnum+1
b38a:138c:1   68		pla
b38b:138d:1   85 14		sta linnum
b38d:138f:1   60		rts

b38e:1390:1   ad 99 b3 skipb38e lda lbl_b399
b391:1393:1   8d e8 42		sta undcol
b394:1396:1   4c 87 b3		jmp gotob387

b397:1399:1   tbl-b3af lbl_b397 .byte $00

b398:139a:1	       lbl_b398 .byte $00

b399:139b:1	       lbl_b399 .byte $00

b39a:139c:1	       lbl_b39a .byte $00

b39b:139d:1	       lbl_b39b .byte $00

b39c:139e:1	       lbl_b39c .byte $00

b39d:139f:1	       lbl_b39d .byte $00

b39e:13a0:1   tbl-b3a0 lbl_b39e .byte $f4,$07
b3a0:13a2:1			.byte $f5

b3a1:13a3:1   tbl-b3a1 lbl_b3a1 .byte $07

b3a2:13a4:1			.byte $e5,$42,$e6,$42
			;	.text "åBæB"

b3a6:13a8:1	       lbl_b3a6 .byte $aa
			;	.text "ª"

b3a7:13a9:1   tbl-b3d1 lbl_b3a7 .byte $d2,$b3
			;	.text "³Ò³"

b3aa:13ac:1   tbl-b3f9 litebar	.text " Sys "
b3af:13b1:1			.text " Acs "
b3b4:13b6:1			.text " Loc "
b3b9:13bb:1			.text " Tsr "
b3be:13c0:1			.text " Cht "
b3c3:13c5:1			.text " New "
b3c8:13ca:1			.text " Prt "
b3cd:13cf:1			.text " U/D "
b3d2:13d4:1			.text " Asc "
b3d7:13d9:1			.text " Ans "
b3dc:13de:1			.text " Exp "
b3e1:13e3:1			.text " Fn5 "
b3e6:13e8:1			.text " Fn4 "
b3eb:13ed:1			.text " Fn3 "
b3f0:13f2:1			.text " Fn2 "
b3f5:13f7:1			.text " Fn1 "

b3fa:13fc:1   8e d1 b4		stx lbl_b4d1
b3fd:13ff:1   8c d2 b4		sty lbl_b4d2
b400:1402:1   a9 02    lbl_1402 lda #$02
b402:1404:1   20 78 b4		jsr sub_b478
b405:1407:1   a9 93		lda #$93
b407:1409:1   85 fe		sta free_fe
b409:140b:1   20 a6 b7		jsr sub_b7a6
b40c:140e:1   ee 50 b2		inc mod_b24f+1
b40f:1411:1   60		rts

b410:1412:1   a2 27    sub_b410 ldx #$27
b412:1414:1   a9 06		lda #$06
b414:1416:1   9d 00 d8 loopb414 sta colormem,x
b417:1419:1   ca		dex
b418:141a:1   10 fa		bpl loopb414
b41a:141c:1   a9 a0		lda #$a0
b41c:141e:1   8d 1e 04		sta videoram+30
b41f:1421:1   8d 1f 04		sta videoram+31
b422:1424:1   8d 20 04		sta videoram+32
b425:1427:1   60		rts

b426:1428:1   8e d1 b4		stx lbl_b4d1
b429:142b:1   8c d2 b4		sty lbl_b4d2
b42c:142e:1   a9 00		lda #$00
b42e:1430:1   20 75 b4		jsr sub_b475
b431:1433:1   a9 00		lda #$00
b433:1435:1   8d 08 d0		sta chatpage
b436:1438:1   8d 03 d0		sta tsr
b439:143b:1   20 dc af		jsr sub_afdc
b43c:143e:1   ad f4 07		lda chk_left
b43f:1441:1   29 fb		and #$fb
b441:1443:1   8d f4 07		sta chk_left
b444:1446:1   ad f5 07		lda chk_right
b447:1449:1   29 fb		and #$fb
b449:144b:1   8d f5 07		sta chk_right
b44c:144e:1   ee 50 b2		inc mod_b24f+1
b44f:1451:1   60		rts

b450:1452:1   8e d1 b4		stx lbl_b4d1
b453:1455:1   8c d2 b4		sty lbl_b4d2
b456:1458:1   a9 01		lda #$01
b458:145a:1   20 75 b4		jsr sub_b475
b45b:145d:1   20 10 b4		jsr sub_b410
b45e:1460:1   ee 50 b2		inc mod_b24f+1
b461:1463:1   60		rts

b462:1464:1   8e d1 b4		stx lbl_b4d1
b465:1467:1   8c d2 b4		sty lbl_b4d2
b468:146a:1   a9 03		lda #$03
b46a:146c:1   4c 75 b4		jmp sub_b475

b46d:146f:1   tbl-b474 scnfiles .text "0:scn."

b473:1475:1	       scntype	.text "t"

b474:1476:1	       scnnum	.text "1"

b475:1477:1   8d e4 42 sub_b475 sta curdisp
b478:147a:1   18       sub_b478 clc
b479:147b:1   69 31		adc #$31
b47b:147d:1   8d 74 b4		sta scnnum
b47e:1480:1   a2 01		ldx #$01
b480:1482:1   20 99 b0		jsr sub_b099
b483:1485:1   a9 54		lda #$54
b485:1487:1   8d 73 b4		sta scntype
b488:148a:1   20 ac b4		jsr sub_b4ac
b48b:148d:1   a9 43		lda #$43
b48d:148f:1   8d 73 b4		sta scntype
b490:1492:1   20 ac b4		jsr sub_b4ac
b493:1495:1   a9 13		lda #$13
b495:1497:1   20 d2 ff		jsr chrout
b498:149a:1   a9 0b		lda #$0b
b49a:149c:1   85 61		sta fac1
b49c:149e:1   a9 00		lda #$00
b49e:14a0:1   85 62		sta fac1+1
b4a0:14a2:1   a9 ce		lda #$ce
b4a2:14a4:1   85 63		sta fac1+2
b4a4:14a6:1   a2 04		ldx #$04
b4a6:14a8:1   20 a5 b5		jsr sub_b5a5
b4a9:14ab:1   4c 10 b4 skipb4a9 jmp sub_b410

b4ac:14ae:1   ad d2 b4 sub_b4ac lda lbl_b4d2
b4af:14b1:1   09 30		ora #$30
b4b1:14b3:1   8d 6d b4		sta scnfiles
b4b4:14b6:1   a9 08		lda #$08
b4b6:14b8:1   a2 6d    lbl_b4b6 ldx #>scnfiles
b4b8:14ba:1   a0 b4    lbl_b4b8 ldy #<scnfiles
b4ba:14bc:1   20 bd ff		jsr setname
b4bd:14bf:1   a9 01		lda #$01
b4bf:14c1:1   a8		tay
b4c0:14c2:1   ae d1 b4		ldx lbl_b4d1
b4c3:14c5:1   20 ba ff		jsr setlfs
b4c6:14c8:1   20 06 43		jsr rsDisable	; disable rs-232 comms
b4c9:14cb:1   a9 00		lda #$00
b4cb:14cd:1   20 d5 ff		jsr load
b4ce:14d0:1   4c 03 43		jmp rsEnable

b4d1:14d3:1   tbl-b4d2 lbl_b4d1 .byte $08

b4d2:14d4:1	       lbl_b4d2 .byte $00

b4d3:14d5:1   8a		txa
b4d4:14d6:1   4c 0f 43		jmp rsSetBaud

b4d7:14d9:1   20 22 b5 sub_b4d7 jsr sub_b522
b4da:14dc:1   a0 02		ldy #$02
b4dc:14de:1   4c 9c b5		jmp gotob59c

b4df:14e1:1   20 d7 b4		jsr sub_b4d7
b4e2:14e4:1   a4 61		ldy fac1
b4e4:14e6:1   8c 0f d0		sty index
b4e7:14e9:1   88       loopb4e7 dey
b4e8:14ea:1   c0 ff		cpy #$ff
b4ea:14ec:1   f0 0c		beq skipb4f8
b4ec:14ee:1   c0 50		cpy #$50
b4ee:14f0:1   b0 f7		bcs loopb4e7
b4f0:14f2:1   b1 62		lda (fac1+1),y
b4f2:14f4:1   99 77 ce		sta buffer,y
b4f5:14f7:1   4c e7 b4		jmp loopb4e7

b4f8:14fa:1   60       skipb4f8 rts

b4f9:14fb:1   20 d7 b4		jsr sub_b4d7
b4fc:14fe:1   4c 74 a0		jmp gotoa074

b4ff:1501:1   20 22 b5 gotob4ff jsr sub_b522
b502:1504:1   a0 02		ldy #$02
b504:1506:1   4c b0 b5		jmp gotob5b0

b507:1509:1   8a		txa
b508:150a:1   48		pha
b509:150b:1   ad 0f d0		lda index
b50c:150e:1   20 69 cd		jsr sub_cd69
b50f:1511:1   ac 0f d0		ldy index
b512:1514:1   f0 09		beq skipb51d
b514:1516:1   88		dey
b515:1517:1   b9 77 ce loopb515 lda buffer,y
b518:151a:1   91 62		sta (fac1+1),y
b51a:151c:1   88		dey
b51b:151d:1   10 f8		bpl loopb515
b51d:151f:1   68       skipb51d pla
b51e:1520:1   aa		tax
b51f:1521:1   4c ff b4		jmp gotob4ff

b522:1524:1   86 47    sub_b522 stx varpnt
b524:1526:1   a9 00		lda #$00
b526:1528:1   06 47		asl varpnt
b528:152a:1   2a		rol a
b529:152b:1   85 48		sta varpnt+1
b52b:152d:1   8a		txa
b52c:152e:1   18		clc
b52d:152f:1   65 47		adc varpnt
b52f:1531:1   85 47		sta varpnt
b531:1533:1   a9 00		lda #$00
b533:1535:1   65 48		adc varpnt+1
b535:1537:1   85 48		sta varpnt+1
b537:1539:1   18		clc
b538:153a:1   a5 2f		lda arytab
b53a:153c:1   65 47		adc varpnt
b53c:153e:1   85 47		sta varpnt
b53e:1540:1   a5 30		lda arytab+1
b540:1542:1   65 48		adc varpnt+1
b542:1544:1   85 48		sta varpnt+1
b544:1546:1   18		clc
b545:1547:1   a9 07		lda #$07
b547:1549:1   65 47		adc varpnt
b549:154b:1   85 47		sta varpnt
b54b:154d:1   a9 00		lda #$00
b54d:154f:1   65 48		adc varpnt+1
b54f:1551:1   85 48		sta varpnt+1
b551:1553:1   60		rts

b552:1554:1   8a       sub_b552 txa
b553:1555:1   0a		asl a
b554:1556:1   a8		tay
b555:1557:1   b9 cd b5		lda vartable+1,y
b558:155a:1   85 48		sta varpnt+1
b55a:155c:1   b9 cc b5		lda vartable,y
b55d:155f:1   85 47		sta varpnt
b55f:1561:1   60		rts

b560:1562:1   85 45    sub_b560 sta varnam
b562:1564:1   86 46		stx varnam+1
b564:1566:1   4c 4f cd		jmp gotocd4f

b567:1569:1   a2 01    sub_b567 ldx #$01
b569:156b:1   20 79 00		jsr chrgot
b56c:156e:1   f0 0c		beq skipb57a
b56e:1570:1   20 df cd		jsr sub_cddf
b571:1573:1   85 61		sta fac1
b573:1575:1   86 62		stx fac1+1
b575:1577:1   84 63		sty fac1+2
b577:1579:1   4c 74 a0		jmp gotoa074

b57a:157c:1   20 91 b5 skipb57a jsr sub_b591
b57d:157f:1   4c 74 a0		jmp gotoa074

b580:1582:1   ad ef 07 gotob580 lda mci
b583:1585:1   48		pha
b584:1586:1   a9 00		lda #$00
b586:1588:1   8d ef 07 loopb586 sta mci
b589:158b:1   20 7a b5		jsr skipb57a
b58c:158e:1   68		pla
b58d:158f:1   8d ef 07		sta mci
b590:1592:1   60		rts

b591:1593:1   20 52 b5 sub_b591 jsr sub_b552
b594:1596:1   4c 9a b5		jmp gotob59a

; called from a36d, a5a1, a5ae
b597:1599:1   20 60 b5 sub_b597 jsr sub_b560
b59a:159c:1   a0 04    gotob59a ldy #$04
b59c:159e:1   b1 47    gotob59c lda (varpnt),y
b59e:15a0:1   99 61 00		sta fac1,y
b5a1:15a3:1   88		dey
b5a2:15a4:1   10 f8		bpl gotob59c
b5a4:15a6:1   60		rts

b5a5:15a7:1   20 52 b5 sub_b5a5 jsr sub_b552
b5a8:15aa:1   4c ae b5		jmp gotob5ae

b5ab:15ad:1   20 60 b5		jsr sub_b560
b5ae:15b0:1   a0 04    gotob5ae ldy #$04
b5b0:15b2:1   b9 61 00 gotob5b0 lda fac1,y
b5b3:15b5:1   91 47		sta (varpnt),y
b5b5:15b7:1   88		dey
b5b6:15b8:1   10 f8		bpl gotob5b0
b5b8:15ba:1   60		rts

b5b9:15bb:1   a9 00    sub_b5b9 lda #$00
b5bb:15bd:1   a0 04		ldy #$04
b5bd:15bf:1   99 61 00 loopb5bd sta fac1,y
b5c0:15c2:1   88		dey
b5c1:15c3:1   10 fa		bpl loopb5bd
b5c3:15c5:1   60		rts

b5c4:15c6:1   20 b9 b5 sub_b5c4 jsr sub_b5b9
b5c7:15c9:1   a9 81		lda #$81
b5c9:15cb:1   85 61		sta fac1
b5cb:15cd:1   60		rts

b5cc:15ce:1   tbl-b61b vartable .byte $41,$ce
b5ce:15d0:1			.byte $41,$80
b5d0:15d2:1			.byte $42,$80
b5d2:15d4:1			.byte $54,$d2
b5d4:15d6:1			.byte $44,$b1
b5d6:15d8:1			.byte $44,$b2
b5d8:15da:1			.byte $44,$b3
b5da:15dc:1			.byte $44,$b4
b5dc:15de:1			.byte $44,$b5
b5de:15e0:1			.byte $4c,$c4
b5e0:15e2:1			.byte $54,$d4
b5e2:15e4:1			.byte $4e,$c1
b5e4:15e6:1			.byte $52,$ce
b5e6:15e8:1			.byte $50,$c8
b5e8:15ea:1			.byte $41,$cb
b5ea:15ec:1			.byte $4c,$50
b5ec:15ee:1			.byte $50,$4c
b5ee:15f0:1			.byte $52,$43
b5f0:15f2:1			.byte $53,$48
b5f2:15f4:1			.byte $4d,$57
b5f4:15f6:1			.byte $4e,$4c
b5f6:15f8:1			.byte $55,$4c
b5f8:15fa:1			.byte $51,$45
b5fa:15fc:1			.byte $52,$51
b5fc:15fe:1			.byte $c1,$c3
b5fe:1600:1			.byte $45,$46
b600:1602:1			.byte $4c,$46
b602:1604:1			.byte $57,$80
b604:1606:1			.byte $50,$80
b606:1608:1			.byte $d4,$d2
b608:160a:1			.byte $c1,$80
b60a:160c:1			.byte $c2,$80
b60c:160e:1			.byte $c4,$d6
b60e:1610:1			.byte $44,$d2
b610:1612:1			.byte $43,$b1
b612:1614:1			.byte $43,$b2
b614:1616:1			.byte $43,$cf
b616:1618:1			.byte $43,$c8
b618:161a:1			.byte $cb,$d0
b61a:161c:1			.byte $43,$b3

b61c:161e:1   8d cd ce sub_b61c sta lbl_cecd
b61f:1621:1   8e ce ce		stx lbl_cece
b622:1624:1   a0 00		ldy #$00
b624:1626:1   b9 59 b6 loopb624 lda lbl_b659,y
b627:1629:1   be 5e b6		ldx skipb65e,y
b62a:162c:1   8d cf ce		sta lbl_cecf
b62d:162f:1   8e d0 ce		stx lbl_ced0
b630:1632:1   a2 30		ldx #$30
b632:1634:1   ad cd ce loopb632 lda lbl_cecd
b635:1637:1   cd cf ce		cmp lbl_cecf
b638:163a:1   ad ce ce		lda lbl_cece
b63b:163d:1   ed d0 ce		sbc lbl_ced0
b63e:1640:1   90 0f		bcc skipb64f
b640:1642:1   8d ce ce		sta lbl_cece
b643:1645:1   ad cd ce loopb643 lda lbl_cecd
b646:1648:1   ed cf ce		sbc lbl_cecf
b649:164b:1   8d cd ce		sta lbl_cecd
b64c:164e:1   e8		inx
b64d:164f:1   d0 e3		bne loopb632
b64f:1651:1   8a       skipb64f txa
b650:1652:1   99 db ce		sta lbl_cedb,y
b653:1655:1   c8		iny
b654:1656:1   c0 05		cpy #$05
b656:1658:1   d0 cc		bne loopb624
b658:165a:1   60		rts

b659:165b:1   tbl-b662 lbl_b659 .byte $10,$e8,$64,$0a,$01

b65e:1660:1	       skipb65e .byte $27,$03,$00,$00,$00

b663:1665:1   a9 c0    sub_b663 lda #$c0
b665:1667:1   a0 e0		ldy #$e0
b667:1669:1   a2 04		ldx #$04
b669:166b:1   4c 80 ca		jmp swapper

	; garbage collection
b66c:166e:1   18       sub_b66c clc
b66d:166f:1   a5 33		lda fretop
b66f:1671:1   c5 31		cmp strend
b671:1673:1   a5 34		lda fretop+1
b673:1675:1   e5 32		sbc strend+1
b675:1677:1   d0 28		bne skipb69f
b677:1679:1   a9 c7		lda #$c7	; "G" - garbage collection indicator
b679:167b:1   8d 1f 04		sta videoram+31
b67c:167e:1   20 63 b6		jsr sub_b663
b67f:1681:1   20 00 c0		jsr lbl_c000
b682:1684:1   20 63 b6		jsr sub_b663
b685:1687:1   a9 a0		lda #$a0
b687:1689:1   8d 1f 04		sta videoram+31
b68a:168c:1   18		clc
b68b:168d:1   a5 33		lda fretop
b68d:168f:1   c5 31		cmp strend
b68f:1691:1   a5 34		lda fretop+1
b691:1693:1   e5 32		sbc strend+1
b693:1695:1   d0 0a		bne skipb69f
b695:1697:1   a2 00		ldx #$00
b697:1699:1   20 59 be		jsr sub_be59
b69a:169c:1   a2 10		ldx #$10
b69c:169e:1   4c 2b cc		jmp gotocc2b

b69f:16a1:1   a9 00    skipb69f lda #$00
b6a1:16a3:1   85 61		sta fac1
b6a3:16a5:1   ad 03 d0 sub_b6a3 lda tsr
b6a6:16a8:1   cd 56 b7		cmp lbl_b756
b6a9:16ab:1   f0 0a		beq skipb6b5
b6ab:16ad:1   8d 56 b7		sta lbl_b756
b6ae:16b0:1   85 62		sta fac1+1
b6b0:16b2:1   a2 1d		ldx #$1d
b6b2:16b4:1   20 a5 b5		jsr sub_b5a5
b6b5:16b7:1   ee fb 42 skipb6b5 inc scnlock
b6b8:16ba:1   ad f3 42		lda scnmode
b6bb:16bd:1   d0 03		bne skipb6c0
b6bd:16bf:1   20 c4 b6		jsr sub_b6c4
b6c0:16c2:1   ce fb 42 skipb6c0 dec scnlock
b6c3:16c5:1   60		rts

b6c4:16c6:1   38       sub_b6c4 sec
b6c5:16c7:1   a5 33		lda fretop
b6c7:16c9:1   e5 31		sbc strend
b6c9:16cb:1   8d 50 b7		sta lbl_b750
b6cc:16ce:1   a5 34		lda fretop+1
b6ce:16d0:1   e5 32		sbc strend+1
b6d0:16d2:1   8d 51 b7		sta lbl_b751
b6d3:16d5:1   a5 31		lda strend
b6d5:16d7:1   cd 54 b7		cmp lbl_b754
b6d8:16da:1   d0 07		bne skipb6e1
b6da:16dc:1   a5 32		lda strend+1
b6dc:16de:1   cd 55 b7		cmp lbl_b755
b6df:16e1:1   f0 13		beq skipb6f4
b6e1:16e3:1   ad 50 b7 skipb6e1 lda lbl_b750
b6e4:16e6:1   8d 54 b7		sta lbl_b754
b6e7:16e9:1   ad 51 b7		lda lbl_b751
b6ea:16ec:1   8d 55 b7		sta lbl_b755
b6ed:16ef:1   a9 9b		lda #$9b
b6ef:16f1:1   a2 07		ldx #$07
b6f1:16f3:1   20 36 b7		jsr sub_b736
b6f4:16f6:1   a5 39    skipb6f4 lda curlin
b6f6:16f8:1   a6 3a		ldx curlin+1
b6f8:16fa:1   8d 50 b7		sta lbl_b750
b6fb:16fd:1   8e 51 b7		stx lbl_b751
b6fe:1700:1   cd 52 b7		cmp lbl_b752
b701:1703:1   d0 06		bne skipb709
b703:1705:1   ec 53 b7		cpx lbl_b753
b706:1708:1   d0 01		bne skipb709
b708:170a:1   60		rts

b709:170b:1   8d 52 b7 skipb709 sta lbl_b752
b70c:170e:1   8e 53 b7		stx lbl_b753
b70f:1711:1   ad f5 07		lda chk_right
b712:1714:1   29 01		and #$01
b714:1716:1   f0 1f		beq skipb735
b716:1718:1   a0 01		ldy #$01
b718:171a:1   b1 7a		lda (txtptr),y
b71a:171c:1   8d c7 07		sta mask_bot+47
b71d:171f:1   a2 00		ldx #$00
b71f:1721:1   a0 c8		ldy #$c8
b721:1723:1   ad 8d 02 loopb721 lda shflag
b724:1726:1   29 01		and #$01
b726:1728:1   f0 06		beq skipb72e
b728:172a:1   ca		dex
b729:172b:1   d0 f6		bne loopb721
b72b:172d:1   88		dey
b72c:172e:1   d0 f3		bne loopb721
b72e:1730:1   a9 c2    skipb72e lda #$c2
b730:1732:1   a2 07		ldx #$07
b732:1734:1   20 36 b7		jsr sub_b736
b735:1737:1   60       skipb735 rts

b736:1738:1   85 fb    sub_b736 sta free_fb
b738:173a:1   86 fc		stx free_fc
b73a:173c:1   ad 50 b7		lda lbl_b750
b73d:173f:1   ae 51 b7		ldx lbl_b751
b740:1742:1   20 1c b6		jsr sub_b61c
b743:1745:1   a0 04		ldy #$04
b745:1747:1   b9 db ce loopb745 lda lbl_cedb,y
b748:174a:1   09 80		ora #$80
b74a:174c:1   91 fb		sta (free_fb),y
b74c:174e:1   88		dey
b74d:174f:1   10 f6		bpl loopb745
b74f:1751:1   60		rts

b750:1752:1   tbl-b757 lbl_b750 .byte $00

b751:1753:1	       lbl_b751 .byte $00

b752:1754:1	       lbl_b752 .byte $00

b753:1755:1	       lbl_b753 .byte $00

b754:1756:1	       lbl_b754 .byte $00

b755:1757:1	       lbl_b755 .byte $00

b756:1758:1	       lbl_b756 .byte $00,$00

b758:175a:1   a9 8b		lda #$8b
b75a:175c:1   a2 e3		ldx #$e3
b75c:175e:1   4c 63 b7		jmp gotob763

b75f:1761:1   a9 79		lda #$79
b761:1763:1   a2 cd		ldx #$cd
b763:1765:1   8d 00 03 gotob763 sta ierror
b766:1768:1   8e 01 03		stx ierror+1
b769:176b:1   60		rts

b76a:176c:1   a5 31		lda strend
b76c:176e:1   85 33		sta fretop
b76e:1770:1   a5 32		lda strend+1
b770:1772:1   85 34		sta fretop+1
b772:1774:1   60		rts

b773:1775:1   a9 0f		lda #$0f
b775:1777:1   85 61		sta fac1
b777:1779:1   a9 e7		lda #$e7
b779:177b:1   85 62		sta fac1+1
b77b:177d:1   a9 ce		lda #$ce
b77d:177f:1   85 63		sta fac1+2
b77f:1781:1   a2 01		ldx #$01
b781:1783:1   20 a5 b5		jsr sub_b5a5
b784:1786:1   a0 04		ldy #$04
b786:1788:1   b9 f6 ce loopb786 lda tablcef6,y
b789:178b:1   99 61 00		sta fac1,y
b78c:178e:1   88		dey
b78d:178f:1   10 f7		bpl loopb786
b78f:1791:1   a2 0f		ldx #$0f
b791:1793:1   20 a5 b5		jsr sub_b5a5
b794:1796:1   20 b9 b5		jsr sub_b5b9
b797:1799:1   ad e5 ce		lda lbl_cee5
b79a:179c:1   85 62    lbl_b79a sta fac1+1
b79c:179e:1   ad e6 ce		lda lbl_cee6
b79f:17a1:1   85 61		sta fac1
b7a1:17a3:1   a2 1e		ldx #$1e
b7a3:17a5:1   4c a5 b5		jmp sub_b5a5

b7a6:17a8:1   a9 00    sub_b7a6 lda #$00
b7a8:17aa:1   8d e0 42		sta idlejif
b7ab:17ad:1   aa		tax
b7ac:17ae:1   a8		tay
b7ad:17af:1   20 1f a9		jsr sub_a91f
b7b0:17b2:1   20 ad ad		jsr sub_adad
b7b3:17b5:1   20 f7 b9		jsr sub_b9f7
b7b6:17b8:1   20 b1 b9		jsr sub_b9b1
b7b9:17bb:1   a5 d6		lda tblx
b7bb:17bd:1   cd c6 b9		cmp lbl_b9c6
b7be:17c0:1   b0 05		bcs skipb7c5
b7c0:17c2:1   ad c6 b9		lda lbl_b9c6
b7c3:17c5:1   85 d6		sta tblx
b7c5:17c7:1   a5 d6    skipb7c5 lda tblx
b7c7:17c9:1   cd c7 b9		cmp lbl_b9c7
b7ca:17cc:1   f0 08		beq skipb7d4
b7cc:17ce:1   90 06		bcc skipb7d4
b7ce:17d0:1   20 d5 b8		jsr sub_b8d5
b7d1:17d3:1   4c c5 b7		jmp skipb7c5

b7d4:17d6:1   20 9b b8 skipb7d4 jsr sub_b89b
b7d7:17d9:1   a5 fe		lda free_fe
b7d9:17db:1   29 7f		and #$7f
b7db:17dd:1   c9 20		cmp #$20
b7dd:17df:1   b0 19		bcs skipb7f8
b7df:17e1:1   a5 fe		lda free_fe
b7e1:17e3:1   a0 0c		ldy #$0c
b7e3:17e5:1   d9 a4 b9 loopb7e3 cmp lbl_b9a4,y
b7e6:17e8:1   f0 3f		beq skipb827
b7e8:17ea:1   88		dey
b7e9:17eb:1   10 f8		bpl loopb7e3
b7eb:17ed:1   a0 0f		ldy #$0f
b7ed:17ef:1   d9 70 a3 loopb7ed cmp prntcolr,y
b7f0:17f2:1   f0 06		beq skipb7f8
b7f2:17f4:1   88		dey
b7f3:17f5:1   d0 f8		bne loopb7ed
b7f5:17f7:1   4c 1b b8		jmp gotob81b

b7f8:17fa:1   a6 d3    skipb7f8 ldx pntr
b7fa:17fc:1   e0 27		cpx #$27
b7fc:17fe:1   d0 0a		bne skipb808
b7fe:1800:1   a6 d6		ldx tblx
b800:1802:1   ec c7 b9		cpx lbl_b9c7
b803:1805:1   d0 03		bne skipb808
b805:1807:1   20 d5 b8		jsr sub_b8d5
b808:180a:1   a5 fe    skipb808 lda free_fe
b80a:180c:1   20 16 e7		jsr $e716
b80d:180f:1   a6 d3		ldx pntr
b80f:1811:1   e0 28		cpx #$28
b811:1813:1   90 08		bcc gotob81b
b813:1815:1   a9 00		lda #$00
b815:1817:1   85 d3		sta pntr
b817:1819:1   a9 27		lda #$27
b819:181b:1   85 d5		sta lnmx
b81b:181d:1   20 9b b8 gotob81b jsr sub_b89b
b81e:1820:1   20 c9 b9		jsr sub_b9c9
b821:1823:1   20 b1 b9		jsr sub_b9b1
b824:1826:1   4c 6c ad		jmp sub_ad6c

b827:1829:1   98       skipb827 tya
b828:182a:1   0a		asl a
b829:182b:1   a8		tay
b82a:182c:1   b9 8a b9		lda lbl_b98a,y
b82d:182f:1   8d 39 b8		sta mod_b3b8+1
b830:1832:1   b9 8b b9		lda lbl_b98b,y
b833:1835:1   8d 3a b8		sta mod_b3b8+2
b836:1838:1   a5 fe		lda free_fe
b838:183a:1   20 ff ff mod_b3b8 jsr $ffff
b83b:183d:1   4c 1b b8		jmp gotob81b

b83e:1840:1   a2 00		ldx #$00
b840:1842:1   8e eb 07		stx mprint
b843:1845:1   8e ea 07		stx mspeed
b846:1848:1   8e f0 07		stx mdigits
b849:184b:1   a2 30		ldx #$30
b84b:184d:1   8e ff a5		stx lbl_a5ff
b84e:1850:1   4c a9 b8		jmp gotob8a9

b851:1853:1   29 80		and #$80
b853:1855:1   0a		asl a
b854:1856:1   2a		rol a
b855:1857:1   8d 0c d0		sta mupcase
b858:185a:1   60		rts

b859:185b:1   ad f3 42		lda scnmode
b85c:185e:1   d0 24		bne skipb882
b85e:1860:1   a0 00		ldy #$00
b860:1862:1   a9 20    loopb860 lda #$20
b862:1864:1   99 00 41		sta $4100,y
b865:1867:1   ad ec 07		lda mcolor
b868:186a:1   99 f0 41		sta tempcol,y
b86b:186d:1   c8		iny
b86c:186e:1   c0 f0		cpy #$f0
b86e:1870:1   d0 f0		bne loopb860
b870:1872:1   a0 00		ldy #$00
b872:1874:1   a9 20    loopb872 lda #$20
b874:1876:1   99 00 40		sta tempbott,y
b877:1879:1   ad ec 07		lda mcolor
b87a:187c:1   99 50 40		sta $4050,y
b87d:187f:1   c8		iny
b87e:1880:1   c0 50		cpy #$50
b880:1882:1   d0 f0		bne loopb872
b882:1884:1   ae c6 b9 skipb882 ldx lbl_b9c6
b885:1887:1   ca		dex
b886:1888:1   e8       loopb886 inx
b887:1889:1   20 75 b9		jsr sub_b975
b88a:188c:1   20 bf b9		jsr sub_b9bf
b88d:188f:1   ec c7 b9		cpx lbl_b9c7
b890:1892:1   90 f4		bcc loopb886
b892:1894:1   ad c6 b9		lda lbl_b9c6
b895:1897:1   85 d6		sta tblx
b897:1899:1   a9 00		lda #$00
b899:189b:1   85 d3		sta pntr
b89b:189d:1   a6 d6    sub_b89b ldx tblx
b89d:189f:1   20 f0 e9 sub_b89d jsr var_e9f0
b8a0:18a2:1   4c 24 ea		jmp var_ea24

b8a3:18a5:1   a6 d3		ldx pntr
b8a5:18a7:1   e0 27		cpx #$27
b8a7:18a9:1   d0 0c		bne skipb8b5
b8a9:18ab:1   a6 d6    gotob8a9 ldx tblx
b8ab:18ad:1   ec c7 b9		cpx lbl_b9c7
b8ae:18b0:1   d0 05		bne skipb8b5
b8b0:18b2:1   48		pha
b8b1:18b3:1   20 d5 b8		jsr sub_b8d5
b8b4:18b6:1   68		pla
b8b5:18b7:1   4c 16 e7 skipb8b5 jmp $e716

b8b8:18ba:1   a6 d3		ldx pntr
b8ba:18bc:1   d0 f9		bne skipb8b5
b8bc:18be:1   a6 d6		ldx tblx
b8be:18c0:1   ca		dex
b8bf:18c1:1   ec c6 b9		cpx lbl_b9c6
b8c2:18c4:1   b0 f1		bcs skipb8b5
b8c4:18c6:1   60		rts

b8c5:18c7:1   4c 16 e7		jmp $e716

b8c8:18ca:1   ad f5 07		lda chk_right
b8cb:18cd:1   29 10		and #$10
b8cd:18cf:1   f0 05		beq skipb8d4
b8cf:18d1:1   a2 02		ldx #$02
b8d1:18d3:1   20 84 be		jsr sub_be84
b8d4:18d6:1   60       skipb8d4 rts

b8d5:18d7:1   a5 ac    sub_b8d5 lda sal
b8d7:18d9:1   48		pha
b8d8:18da:1   a5 ad		lda sal+1
b8da:18dc:1   48		pha
b8db:18dd:1   a5 ae		lda eal
b8dd:18df:1   48		pha
b8de:18e0:1   a5 af		lda eal+1
b8e0:18e2:1   48		pha
b8e1:18e3:1   ad f3 42		lda scnmode
b8e4:18e6:1   d0 26		bne skipb90c
b8e6:18e8:1   a0 00		ldy #$00
b8e8:18ea:1   b9 28 41 loopb8e8 lda var_4128,y
b8eb:18ed:1   99 00 41		sta $4100,y
b8ee:18f0:1   b9 18 42		lda tempcol+40,y
b8f1:18f3:1   99 f0 41		sta tempcol,y
b8f4:18f6:1   c8		iny
b8f5:18f7:1   c0 c8		cpy #$c8
b8f7:18f9:1   d0 ef		bne loopb8e8
b8f9:18fb:1   a0 00		ldy #$00
b8fb:18fd:1   b9 18 05 loopb8fb lda var_0518,y
b8fe:1900:1   99 c8 41		sta var_41c8,y
b901:1903:1   b9 18 d9		lda colorram+280,y
b904:1906:1   99 b8 42		sta tempcol+200,y
b907:1909:1   c8		iny
b908:190a:1   c0 28		cpy #$28
b90a:190c:1   d0 ef		bne loopb8fb
b90c:190e:1   ae c6 b9 skipb90c ldx lbl_b9c6
b90f:1911:1   e8       loopb90f inx
b910:1912:1   20 9d b8		jsr sub_b89d
b913:1915:1   a5 d1		lda pnt
b915:1917:1   85 ac		sta sal
b917:1919:1   a5 d2		lda pnt+1
b919:191b:1   85 ad		sta sal+1
b91b:191d:1   a5 f3		lda user
b91d:191f:1   85 ae		sta eal
b91f:1921:1   a5 f4		lda user+1
b921:1923:1   85 af		sta eal+1
b923:1925:1   ca		dex
b924:1926:1   20 9d b8		jsr sub_b89d
b927:1929:1   20 d2 e9		jsr var_e9d2
b92a:192c:1   e8		inx
b92b:192d:1   20 bf b9		jsr sub_b9bf
b92e:1930:1   ec c7 b9		cpx lbl_b9c7
b931:1933:1   90 dc		bcc loopb90f
b933:1935:1   20 75 b9		jsr sub_b975
b936:1938:1   68		pla
b937:1939:1   85 af		sta eal+1
b939:193b:1   68		pla
b93a:193c:1   85 ae		sta eal
b93c:193e:1   68		pla
b93d:193f:1   85 ad		sta sal+1
b93f:1941:1   68		pla
b940:1942:1   85 ac		sta sal
b942:1944:1   c6 d6		dec tblx
b944:1946:1   20 9b b8		jsr sub_b89b
b947:1949:1   ad f3 42		lda scnmode
b94a:194c:1   d0 28		bne skipb974
b94c:194e:1   a0 27		ldy #$27
b94e:1950:1   b9 00 40 loopb94e lda tempbott,y
b951:1953:1   99 70 07		sta var_0770,y
b954:1956:1   b9 50 40		lda $4050,y
b957:1959:1   99 70 db		sta colorram+880,y
b95a:195c:1   b9 28 40		lda tempbott+40,y
b95d:195f:1   99 00 40		sta tempbott,y
b960:1962:1   b9 78 40		lda var_4078,y
b963:1965:1   99 50 40		sta $4050,y
b966:1968:1   a9 20		lda #$20
b968:196a:1   99 28 40		sta tempbott+40,y
b96b:196d:1   ad ec 07		lda mcolor
b96e:1970:1   99 78 40		sta var_4078,y
b971:1973:1   88		dey
b972:1974:1   10 da		bpl loopb94e
b974:1976:1   60       skipb974 rts

b975:1977:1   20 f0 e9 sub_b975 jsr var_e9f0
b978:197a:1   20 24 ea		jsr var_ea24
b97b:197d:1   a0 27		ldy #$27
b97d:197f:1   ad 86 02 loopb97d lda color
b980:1982:1   91 f3		sta (user),y
b982:1984:1   a9 20		lda #$20
b984:1986:1   91 d1		sta (pnt),y
b986:1988:1   88		dey
b987:1989:1   10 f4		bpl loopb97d
b989:198b:1   60		rts

b98a:198c:1   tbl-b9b0 lbl_b98a .byte $51

b98b:198d:1	       lbl_b98b .byte $b8,$51,$b8,$c5,$b8,$c5,$b8,$92,$b8,$59
b995:1997:1			.byte $b8,$a3,$b8,$b8,$b8,$a9,$b8,$bc,$b8,$3e
b99f:19a1:1			.byte $b8,$b8,$b8,$c8,$b8

b9a4:19a6:1	       lbl_b9a4 .byte $0e,$8e,$12,$92,$13,$93,$1d,$9d,$11,$91
b9ae:19b0:1			.byte $0d,$14,$07

b9b1:19b3:1   a9 27    sub_b9b1 lda #$27
b9b3:19b5:1   85 d5		sta lnmx
b9b5:19b7:1   a9 00		lda #$00
b9b7:19b9:1   85 d4		sta qtsw
b9b9:19bb:1   a9 00		lda #$00
b9bb:19bd:1   85 d8		sta insrt
b9bd:19bf:1   a6 d6		ldx tblx
b9bf:19c1:1   b5 d9    sub_b9bf lda ldtb1,x
b9c1:19c3:1   09 80		ora #$80
b9c3:19c5:1   95 d9		sta ldtb1,x
b9c5:19c7:1   60		rts

b9c6:19c8:1   tbl-b9c8 lbl_b9c6 .byte $07

b9c7:19c9:1	       lbl_b9c7 .byte $16

b9c8:19ca:1	       lbl_b9c8 .byte $07

b9c9:19cb:1   ee fb 42 sub_b9c9 inc scnlock
b9cc:19ce:1   78		sei
b9cd:19cf:1   ad 86 02		lda color
b9d0:19d2:1   8d ec 07		sta mcolor
b9d3:19d5:1   a5 c7		lda rvs
b9d5:19d7:1   8d ee 07		sta mreverse
b9d8:19da:1   a5 d1		lda pnt
b9da:19dc:1   8d 65 ad		sta lbl_ad64+1
b9dd:19df:1   a5 d2		lda pnt+1
b9df:19e1:1   8d 66 ad		sta lbl_ad64+2
b9e2:19e4:1   a5 d3		lda pntr
b9e4:19e6:1   85 02		sta zp_02
b9e6:19e8:1   a5 d6		lda tblx
b9e8:19ea:1   8d c8 b9		sta lbl_b9c8
b9eb:19ed:1   a5 f3		lda user
b9ed:19ef:1   8d 69 ad		sta lbl_ad68+1
b9f0:19f2:1   a5 f4		lda user+1
b9f2:19f4:1   8d 6a ad		sta lbl_ad68+2
b9f5:19f7:1   58		cli
b9f6:19f8:1   60		rts

b9f7:19f9:1   ce fb 42 sub_b9f7 dec scnlock
b9fa:19fc:1   ad ec 07		lda mcolor
b9fd:19ff:1   8d 86 02		sta color
ba00:1a02:1   ad ee 07		lda mreverse
ba03:1a05:1   85 c7		sta rvs
ba05:1a07:1   ad 65 ad		lda lbl_ad64+1
ba08:1a0a:1   85 d1		sta pnt
ba0a:1a0c:1   ad 66 ad		lda lbl_ad64+2
ba0d:1a0f:1   85 d2		sta pnt+1
ba0f:1a11:1   a5 02		lda zp_02
ba11:1a13:1   85 d3		sta pntr
ba13:1a15:1   ad c8 b9		lda lbl_b9c8
ba16:1a18:1   85 d6		sta tblx
ba18:1a1a:1   ad 69 ad		lda lbl_ad68+1
ba1b:1a1d:1   85 f3		sta user
ba1d:1a1f:1   ad 6a ad		lda lbl_ad68+2
ba20:1a22:1   85 f4		sta user+1
ba22:1a24:1   60		rts

ba23:1a25:1   20 5c a9 sub_ba23 jsr lbl_a95c
ba26:1a28:1   85 fe		sta free_fe
ba28:1a2a:1   48		pha
ba29:1a2b:1   ad e5 42		lda bar
ba2c:1a2e:1   29 01		and #$01
ba2e:1a30:1   aa		tax
ba2f:1a31:1   68		pla
ba30:1a32:1   e0 00		cpx #$00
ba32:1a34:1   f0 06		beq skipba3a
ba34:1a36:1   aa		tax
ba35:1a37:1   bd e9 bc		lda lbl_bce9,x
ba38:1a3a:1   85 fe		sta free_fe
ba3a:1a3c:1   c9 00    skipba3a cmp #$00
ba3c:1a3e:1   f0 39		beq skipba77
ba3e:1a40:1   ae 7a ba		ldx lbl_ba7a
ba41:1a43:1   dd 7b ba		cmp lbl_ba7b,x
ba44:1a46:1   d0 2c		bne skipba72
ba46:1a48:1   e8		inx
ba47:1a49:1   8e 7a ba		stx lbl_ba7a
ba4a:1a4c:1   e0 05		cpx #$05
ba4c:1a4e:1   90 29		bcc skipba77
ba4e:1a50:1   48		pha
ba4f:1a51:1   ad 1c b2		lda lbl_b21c
ba52:1a54:1   4a		lsr a
ba53:1a55:1   4a		lsr a
ba54:1a56:1   4a		lsr a
ba55:1a57:1   4a		lsr a
ba56:1a58:1   09 c0		ora #$c0
ba58:1a5a:1   20 ce a7		jsr sub_a7ce
ba5b:1a5d:1   ad 1c b2		lda lbl_b21c
ba5e:1a60:1   20 80 ba		jsr sub_ba80
ba61:1a63:1   ad 1b b2		lda lbl_b21b
ba64:1a66:1   4a		lsr a
ba65:1a67:1   4a		lsr a
ba66:1a68:1   4a		lsr a
ba67:1a69:1   4a		lsr a
ba68:1a6a:1   20 80 ba		jsr sub_ba80
ba6b:1a6d:1   ad 1b b2		lda lbl_b21b
ba6e:1a70:1   20 80 ba		jsr sub_ba80
ba71:1a73:1   68		pla
ba72:1a74:1   a2 00    skipba72 ldx #$00
ba74:1a76:1   8e 7a ba		stx lbl_ba7a
ba77:1a79:1   c9 00    skipba77 cmp #$00
ba79:1a7b:1   60		rts

ba7a:1a7c:1   tbl-ba7f lbl_ba7a .byte $00

ba7b:1a7d:1	       lbl_ba7b .byte $09,$0d,$01,$07,$05

ba80:1a82:1   29 0f    sub_ba80 and #$0f
ba82:1a84:1   09 30		ora #$30
ba84:1a86:1   c9 3a		cmp #$3a
ba86:1a88:1   90 02		bcc skipba8a
ba88:1a8a:1   69 06		adc #$06
ba8a:1a8c:1   4c ce a7 skipba8a jmp sub_a7ce

ba8d:1a8f:1   ad e5 42 sub_ba8d lda bar
ba90:1a92:1   29 01		and #$01
ba92:1a94:1   aa		tax
ba93:1a95:1   a5 fe		lda free_fe
ba95:1a97:1   e0 00		cpx #$00
ba97:1a99:1   d0 03		bne skipba9c
ba99:1a9b:1   4c ce a7		jmp sub_a7ce

ba9c:1a9e:1   ad e6 42 skipba9c lda tsr2
ba9f:1aa1:1   29 02		and #$02
baa1:1aa3:1   aa		tax
baa2:1aa4:1   a5 fe		lda free_fe
baa4:1aa6:1   29 1f		and #$1f
baa6:1aa8:1   a8		tay
baa7:1aa9:1   a5 fe		lda free_fe
baa9:1aab:1   e0 00		cpx #$00
baab:1aad:1   f0 28		beq skipbad5
baad:1aaf:1   c9 60		cmp #$60
baaf:1ab1:1   90 24		bcc skipbad5
bab1:1ab3:1   c9 80		cmp #$80
bab3:1ab5:1   90 0c		bcc skipbac1
bab5:1ab7:1   c9 a0		cmp #$a0
bab7:1ab9:1   90 1c		bcc skipbad5
bab9:1abb:1   c9 c0		cmp #$c0
babb:1abd:1   90 13		bcc skipbad0
babd:1abf:1   c9 e0		cmp #$e0
babf:1ac1:1   b0 14		bcs skipbad5
bac1:1ac3:1   ad 0c d0 skipbac1 lda mupcase
bac4:1ac6:1   d0 05		bne skipbacb
bac6:1ac8:1   b9 89 bd		lda lbl_bd89,y
bac9:1acb:1   d0 10		bne skipbadb
bacb:1acd:1   b9 a9 bd skipbacb lda lbl_bda9,y
bace:1ad0:1   d0 0b		bne skipbadb
bad0:1ad2:1   b9 69 bd skipbad0 lda lbl_bd69,y
bad3:1ad5:1   d0 06		bne skipbadb
bad5:1ad7:1   aa       skipbad5 tax
bad6:1ad8:1   bd e9 bb		lda asciitbl,x
bad9:1adb:1   f0 30		beq skipbb0b
badb:1add:1   48       skipbadb pha
badc:1ade:1   29 7f		and #$7f
bade:1ae0:1   c9 20		cmp #$20
bae0:1ae2:1   68		pla
bae1:1ae3:1   b0 25		bcs skipbb08
bae3:1ae5:1   c9 08		cmp #$08
bae5:1ae7:1   f0 25		beq skipbb0c
bae7:1ae9:1   c9 0d		cmp #$0d
bae9:1aeb:1   f0 33		beq skipbb1e
baeb:1aed:1   c9 12		cmp #$12
baed:1aef:1   f0 7a		beq skipbb69
baef:1af1:1   c9 92		cmp #$92
baf1:1af3:1   f0 6f		beq skipbb62
baf3:1af5:1   c9 91		cmp #$91
baf5:1af7:1   f0 45		beq skipbb3c
baf7:1af9:1   c9 11		cmp #$11
baf9:1afb:1   f0 45		beq skipbb40
bafb:1afd:1   c9 1d		cmp #$1d
bafd:1aff:1   f0 45		beq skipbb44
baff:1b01:1   c9 9d		cmp #$9d
bb01:1b03:1   f0 45		beq skipbb48
bb03:1b05:1   20 6e a2		jsr sub_a26e
bb06:1b08:1   90 6e		bcc skipbb76
bb08:1b0a:1   4c ce a7 skipbb08 jmp sub_a7ce

bb0b:1b0d:1   60       skipbb0b rts

bb0c:1b0e:1   ae f7 42 skipbb0c ldx interm
bb0f:1b11:1   d0 08		bne skipbb19
bb11:1b13:1   20 ce a7		jsr sub_a7ce
bb14:1b16:1   a9 20		lda #$20
bb16:1b18:1   20 ce a7		jsr sub_a7ce
bb19:1b1b:1   a9 08    skipbb19 lda #$08
bb1b:1b1d:1   4c ce a7		jmp sub_a7ce

bb1e:1b20:1   ad f7 42 skipbb1e lda interm
bb21:1b23:1   d0 03		bne skipbb26
bb23:1b25:1   20 62 bb		jsr skipbb62
bb26:1b28:1   ad e6 42 skipbb26 lda tsr2
bb29:1b2b:1   29 01		and #$01
bb2b:1b2d:1   f0 0a		beq skipbb37
bb2d:1b2f:1   a9 0d		lda #$0d
bb2f:1b31:1   20 ce a7		jsr sub_a7ce
bb32:1b34:1   a9 0a		lda #$0a
bb34:1b36:1   4c ce a7		jmp sub_a7ce

bb37:1b39:1   a9 0d    skipbb37 lda #$0d
bb39:1b3b:1   4c ce a7		jmp sub_a7ce

bb3c:1b3e:1   a9 41    skipbb3c lda #$41
bb3e:1b40:1   d0 0a		bne skipbb4a
bb40:1b42:1   a9 42    skipbb40 lda #$42
bb42:1b44:1   d0 06		bne skipbb4a
bb44:1b46:1   a9 43    skipbb44 lda #$43
bb46:1b48:1   d0 02		bne skipbb4a
bb48:1b4a:1   a9 44    skipbb48 lda #$44
bb4a:1b4c:1   48       skipbb4a pha
bb4b:1b4d:1   ad e5 42		lda bar
bb4e:1b50:1   29 02		and #$02
bb50:1b52:1   d0 02		bne skipbb54
bb52:1b54:1   68		pla
bb53:1b55:1   60		rts

bb54:1b56:1   a9 1b    skipbb54 lda #$1b
bb56:1b58:1   20 ce a7		jsr sub_a7ce
bb59:1b5b:1   a9 5b		lda #$5b
bb5b:1b5d:1   20 ce a7		jsr sub_a7ce
bb5e:1b60:1   68		pla
bb5f:1b61:1   4c ce a7		jmp sub_a7ce

bb62:1b64:1   a9 33    skipbb62 lda #$33
bb64:1b66:1   a2 34		ldx #$34
bb66:1b68:1   4c 6d bb		jmp gotobb6d

bb69:1b6b:1   a9 34    skipbb69 lda #$34
bb6b:1b6d:1   a2 33		ldx #$33
bb6d:1b6f:1   8d cc bb gotobb6d sta lbl_bbcb+1
bb70:1b72:1   8e db bb		stx l_bbda+1
bb73:1b75:1   4c b0 bb		jmp gotobbb0

bb76:1b78:1   a2 0f    skipbb76 ldx #$0f
bb78:1b7a:1   dd 70 a3 loopbb78 cmp prntcolr,x
bb7b:1b7d:1   f0 03		beq skipbb80
bb7d:1b7f:1   ca		dex
bb7e:1b80:1   d0 f8		bne loopbb78
bb80:1b82:1   bd 8f bb skipbb80 lda lbl_bb8f,x
bb83:1b85:1   8d d1 bb		sta lbl_bbd0+1
bb86:1b88:1   bd 9f bb		lda lbl_bb9f,x
bb89:1b8b:1   8d c2 bb		sta lbl_bbc1+1
bb8c:1b8e:1   4c b0 bb		jmp gotobbb0

bb8f:1b91:1   tbl-bb9e lbl_bb8f .text "7716524333107247"

bb9f:1ba1:1   30 31    lbl_bb9f bmi skipbbd2
bba1:1ba3:1   30 30		bmi skipbbd2+1
bba3:1ba5:1   30 30		bmi skipbbd5
bba5:1ba7:1   30 31		bmi lbl_bbd7+1
bba7:1ba9:1   30 30		bmi lbl_bbd7+2
bba9:1bab:1   31 31		and (strend),y
bbab:1bad:1   30 31		bmi l_bbdc+2
bbad:1baf:1   31 30		and (arytab+1),y
bbaf:1bb1:1   60       loopbbaf rts

bbb0:1bb2:1   ad e5 42 gotobbb0 lda bar
bbb3:1bb5:1   29 02		and #$02
bbb5:1bb7:1   f0 f8		beq loopbbaf
bbb7:1bb9:1   a9 1b		lda #$1b
bbb9:1bbb:1   20 ce a7		jsr sub_a7ce
bbbc:1bbe:1   a9 5b		lda #$5b
bbbe:1bc0:1   20 ce a7		jsr sub_a7ce
bbc1:1bc3:1   a9 30    lbl_bbc1 lda #$30
bbc3:1bc5:1   20 ce a7 lbl_bbc3 jsr $a7ce
bbc6:1bc8:1   a9 3b		lda #$3b
bbc8:1bca:1   20 ce a7		jsr sub_a7ce
bbcb:1bcd:1   a9 33    lbl_bbcb lda #$33
bbcd:1bcf:1   20 ce a7		jsr sub_a7ce
bbd0:1bd2:1   a9 31    lbl_bbd0 lda #$31
bbd2:1bd4:1   20 ce a7 skipbbd2 jsr $a7ce
bbd5:1bd7:1   a9 3b    skipbbd5 lda #$3b
bbd7:1bd9:1   20 ce a7 lbl_bbd7 jsr $a7ce
bbda:1bdc:1   a9 34    l_bbda	lda #$34
bbdc:1bde:1   20 ce a7 l_bbdc	jsr $a7ce
bbdf:1be1:1   a9 30		lda #$30
bbe1:1be3:1   20 ce a7		jsr sub_a7ce
bbe4:1be6:1   a9 6d    skipbbe4 lda #$6d
bbe6:1be8:1   4c ce a7		jmp sub_a7ce

bbe9:1beb:1   tbl-bc84 asciitbl .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09
bbf3:1bf5:1			.byte $0a,$0b,$0c,$0d,$00,$0f,$10,$11,$12,$13
bbfd:1bff:1			.byte $08,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d
bc07:1c09:1			.byte $1e,$1f,$20,$21,$22

bc0c:1c0e:1	       skipbc0c .byte $23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c
bc16:1c18:1			.byte $2d,$2e,$2f,$30,$31,$32,$33,$34,$35,$36
bc20:1c22:1			.byte $37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f,$40
bc2a:1c2c:1			.byte $61,$62,$63,$64,$65,$66,$67,$68,$69,$6a
bc34:1c36:1			.byte $6b,$6c,$6d,$6e,$6f,$70,$71,$72,$73,$74
bc3e:1c40:1			.byte $75,$76,$77,$78,$79,$7a,$5b,$5c,$5d,$5e
bc48:1c4a:1			.byte $5f,$2d,$41,$42

bc4c:1c4e:1	       skipbc4c .byte $43,$44,$45,$46,$47,$48,$49,$4a,$4b,$4c
bc56:1c58:1			.byte $4d,$4e,$4f,$50,$51,$52,$53,$54,$55,$56
bc60:1c62:1			.byte $57,$58,$59,$5a,$2a,$2d,$21,$2a,$2a,$00
bc6a:1c6c:1			.byte $81,$00,$00,$00,$00,$00,$00,$00,$00,$00
bc74:1c76:1			.byte $00,$00,$0d,$00,$00,$00,$91,$92,$0c,$00
bc7e:1c80:1			.byte $95,$96,$97,$98,$99,$9a,$9b

bc85:1c87:1   tbl-bce8 tablbc85 .byte $9c,$9d,$9e,$9f,$20,$21,$2d,$2d,$2d,$21
bc8f:1c91:1			.byte $2a,$21,$2d,$2a,$21,$2a,$2a,$2a,$2a,$2d
bc99:1c9b:1			.byte $2a,$2a,$2a,$2a,$21,$21,$21,$2d,$2d,$2d
bca3:1ca5:1			.byte $2a,$2a,$2a,$2a,$2a,$2a,$2d,$41,$42

bcac:1cae:1	       skipbcac .byte $43,$44,$45,$46,$47,$48,$49,$4a,$4b,$4c
bcb6:1cb8:1			.byte $4d,$4e,$4f,$50,$51,$52,$53,$54,$55,$56
bcc0:1cc2:1			.byte $57,$58,$59,$5a,$2a,$21,$21,$2a,$2a,$20
bcca:1ccc:1			.byte $21,$2d,$2d,$2d,$21,$2a,$21,$2d,$2a,$21
bcd4:1cd6:1			.byte $2a,$2a,$2a,$2a,$2d,$2a,$2a,$2a,$2a,$21
bcde:1ce0:1			.byte $21,$21,$2d,$2d,$2d,$2a,$2a,$2a,$2a,$2a
bce8:1cea:1			.byte $2a

bce9:1ceb:1   tbl-bd68 lbl_bce9 .byte $00,$00,$02,$00,$04,$00,$00,$00,$14,$09
bcf3:1cf5:1			.byte $00,$00,$93,$0d,$0e,$0f,$00,$11,$00,$13
bcfd:1cff:1			.byte $14,$15,$16,$17,$18,$19,$00,$1b,$00,$00
bd07:1d09:1			.byte $00,$00,$20,$21,$22

bd0c:1d0e:1	       skipbd0c .byte $23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c
bd16:1d18:1			.byte $2d,$2e,$2f,$30,$31,$32,$33,$34,$35,$36
bd20:1d22:1			.byte $37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f,$40
bd2a:1d2c:1			.byte $c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$ca
bd34:1d36:1			.byte $cb,$cc,$cd,$ce,$cf,$d0,$d1,$d2,$d3,$d4
bd3e:1d40:1			.byte $d5,$d6,$d7,$d8,$d9,$da,$5b,$5c,$5d,$5e
bd48:1d4a:1			.byte $5f,$00,$41,$42

bd4c:1d4e:1   tbl-bd4d skipbd4c .byte $43,$44

bd4e:1d50:1			.byte $45,$46,$47,$48,$49,$4a,$4b,$4c,$4d,$4e
bd58:1d5a:1			.byte $4f,$50,$51,$52,$53,$54,$55,$56,$57,$58
bd62:1d64:1			.byte $59,$5a,$00,$00,$00,$00,$14

bd69:1d6b:1   tbl-bdc8 lbl_bd69 .byte $20,$dd,$dc,$c4,$5f,$b3,$b2,$b3,$dc,$2f
bd73:1d75:1			.byte $de,$c3,$c9,$c0,$bf,$dc,$da,$c1,$c2,$b4
bd7d:1d7f:1			.byte $dd,$dd,$de,$df,$df,$dc,$d9,$bb,$c8,$d9
bd87:1d89:1			.byte $bc,$b0

bd89:1d8b:1	       lbl_bd89 .byte $c4,$41,$42,$43,$44,$45,$46,$47,$48,$49
bd93:1d95:1			.byte $4a,$4b,$4c,$4d,$4e,$4f,$50,$51,$52,$53
bd9d:1d9f:1			.byte $54,$55,$56,$57,$58,$59,$5a,$c5,$dd,$b3
bda7:1da9:1			.byte $b2,$5c

bda9:1dab:1   tbl-bdab lbl_bda9 .byte $c4,$2a,$b3

bdac:1dae:1   tbl-bdad skipbdac .byte $c4,$c4

bdae:1db0:1   tbl-bdb9 t_bdae	.byte $c4,$c4,$b3,$b3,$bf,$c0,$d9,$c0,$5c,$2f
bdb8:1dba:1			.byte $da,$bf

bdba:1dbc:1			.byte $fe,$c4,$2a,$b3,$da,$2a,$fe,$2a,$b3,$2a
bdc4:1dc6:1			.byte $c5,$dd,$b3,$e3,$5c

bdc9:1dcb:1   cd 07 be gotobdc9 cmp mod_be07
bdcc:1dce:1   f0 36		beq mod_be04
bdce:1dd0:1   8d 08 be		sta mod_be07+1
bdd1:1dd3:1   ad 07 be		lda mod_be07
bdd4:1dd6:1   48		pha
bdd5:1dd7:1   ad 08 be		lda mod_be07+1
bdd8:1dda:1   8d 07 be		sta mod_be07
bddb:1ddd:1   20 ef bd		jsr sub_bdef
bdde:1de0:1   20 04 be		jsr mod_be04
bde1:1de3:1   20 ef bd		jsr sub_bdef
bde4:1de6:1   8d 08 be		sta mod_be07+1
bde7:1de9:1   68		pla
bde8:1dea:1   8d 07 be		sta mod_be07
bdeb:1ded:1   ad 08 be		lda mod_be07+1
bdee:1df0:1   60		rts

bdef:1df1:1   48       sub_bdef pha
bdf0:1df2:1   8a		txa
bdf1:1df3:1   48		pha
bdf2:1df4:1   98		tya
bdf3:1df5:1   48		pha
bdf4:1df6:1   ad 07 be		lda mod_be07
bdf7:1df9:1   a0 c0		ldy #$c0
bdf9:1dfb:1   a2 04		ldx #$04
bdfb:1dfd:1   20 80 ca		jsr swapper
bdfe:1e00:1   68		pla
bdff:1e01:1   a8		tay
be00:1e02:1   68		pla
be01:1e03:1   aa		tax
be02:1e04:1   68		pla
be03:1e05:1   60		rts

be04:1e06:1   4c 00 c0 mod_be04 jmp lbl_c000

be07:1e09:1   tbl-be09 mod_be07 .byte $00,$00,$d0

be0a:1e0c:1   78       lbl_be0a sei
be0b:1e0d:1   8d 05 be gotobe0b sta mod_be04+1
be0e:1e10:1   a9 f0		lda #$f0
be10:1e12:1   4c c9 bd		jmp gotobdc9

be13:1e15:1   8d 05 be gotobe13 sta mod_be04+1
be16:1e18:1   a9 f4		lda #$f4
be18:1e1a:1   4c c9 bd		jmp gotobdc9

be1b:1e1d:1   8d 05 be gotobe1b sta mod_be04+1
be1e:1e20:1   a9 f8		lda #$f8
be20:1e22:1   4c c9 bd		jmp gotobdc9

be23:1e25:1   a9 00		lda #$00
be25:1e27:1   4c 0b be		jmp gotobe0b

be28:1e2a:1   a9 03    sub_be28 lda #$03
be2a:1e2c:1   4c 0b be		jmp gotobe0b

be2d:1e2f:1   a9 06		lda #$06
be2f:1e31:1   4c 0b be		jmp gotobe0b

be32:1e34:1   a9 09		lda #$09
be34:1e36:1   20 0b be		jsr gotobe0b
be37:1e39:1   48		pha
be38:1e3a:1   ad 09 be		lda mod_be07+2
be3b:1e3d:1   cd ab be		cmp lbl_beab
be3e:1e40:1   d0 0a		bne skipbe4a
be40:1e42:1   ad 0a be		lda lbl_be0a
be43:1e45:1   cd ac be		cmp lbl_beac
be46:1e48:1   d0 02		bne skipbe4a
be48:1e4a:1   68		pla
be49:1e4b:1   60		rts

be4a:1e4c:1   68       skipbe4a pla
be4b:1e4d:1   a2 01		ldx #$01
be4d:1e4f:1   8a		txa
be4e:1e50:1   60		rts

be4f:1e51:1   a9 00    lbl_be4f lda #$00
be51:1e53:1   4c 13 be		jmp gotobe13

be54:1e56:1   a9 03		lda #$03
be56:1e58:1   4c 13 be		jmp gotobe13

be59:1e5b:1   a9 06    sub_be59 lda #$06
be5b:1e5d:1   4c 13 be		jmp gotobe13

be5e:1e60:1   a9 09    lbl_be5e lda #$09
be60:1e62:1   4c 13 be		jmp gotobe13

be63:1e65:1   a9 0c		lda #$0c
be65:1e67:1   4c 13 be		jmp gotobe13

be68:1e6a:1   a9 00		lda #$00
be6a:1e6c:1   4c 1b be		jmp gotobe1b

be6d:1e6f:1   a9 03		lda #$03
be6f:1e71:1   4c 1b be		jmp gotobe1b

be72:1e74:1   a9 06		lda #$06
be74:1e76:1   4c 1b be		jmp gotobe1b

be77:1e79:1   a9 09    lbl_be77 lda #$09
be79:1e7b:1   4c 1b be		jmp gotobe1b

be7c:1e7e:1   a9 0c		lda #$0c
be7e:1e80:1   20 1b be		jsr gotobe1b
be81:1e83:1   4c 67 b5		jmp sub_b567

; some serial # stuff?
be84:1e86:1   a9 0f    sub_be84 lda #$0f
be86:1e88:1   20 1b be		jsr gotobe1b
be89:1e8b:1   a2 02		ldx #$02
be8b:1e8d:1   bd 08 be		lda mod_be07+1,x
be8e:1e90:1   4a		lsr a
be8f:1e91:1   4a		lsr a
be90:1e92:1   4a		lsr a
be91:1e93:1   4a		lsr a
be92:1e94:1   09 c0		ora #$c0
be94:1e96:1   9d fc 02		sta var_02fc,x
be97:1e99:1   bd 07 be		lda mod_be07,x
be9a:1e9c:1   38		sec
be9b:1e9d:1   e9 ff		sbc #$ff
be9d:1e9f:1   9d fc 02		sta var_02fc,x
bea0:1ea2:1   bd 08 be		lda mod_be07+1,x
bea3:1ea5:1   e9 00		sbc #$00
bea5:1ea7:1   29 0f		and #$0f
bea7:1ea9:1   9d fd 02		sta bsnpre,x
beaa:1eac:1   60		rts

beab:1ead:1   tbl-beac lbl_beab .byte $d0

beac:1eae:1	       lbl_beac .byte $78

bead:1eaf:1   tbl-bfff tablbead .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
beb7:1eb9:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bec1:1ec3:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
becb:1ecd:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bed5:1ed7:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bedf:1ee1:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bee9:1eeb:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bef3:1ef5:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
befd:1eff:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf07:1f09:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf11:1f13:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf1b:1f1d:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf25:1f27:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf2f:1f31:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf39:1f3b:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf43:1f45:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf4d:1f4f:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf57:1f59:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf61:1f63:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf6b:1f6d:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf75:1f77:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf7f:1f81:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf89:1f8b:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf93:1f95:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bf9d:1f9f:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfa7:1fa9:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfb1:1fb3:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfbb:1fbd:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfc5:1fc7:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfcf:1fd1:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfd9:1fdb:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bfe3:1fe5:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

bfed:1fef:1	       lbl_bfed .byte $00

bfee:1ff0:1	       lbl_bfee .byte $00

bfef:1ff1:1	       lbl_bfef .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
bff9:1ffb:1			.byte $00

bffa:1ffc:1	       lbl_bffa .byte $00

bffb:1ffd:1	       lbl_bffb .byte $00,$00

bffd:1fff:1	       lbl_bffd .byte $00,$00,$00

c000:2002:1   4c 0b c0 lbl_c000 jmp gotoc00b

c003:2005:1   4c 85 c1		jmp gotoc185

c006:2008:1   tbl-c00a tablc006 .byte $ff

; serial # stuff
	      ; $d1 = 209
	      ; $77 = 119
	      ; $f4 = 244
	      ; $78 = 120
c007:2009:1   tbl-c007 lbl_c007 .byte $d1

c008:200a:1   tbl-c00a lbl_c008 .byte $77,$f4,$78

c00b:200d:1   a6 ba    gotoc00b ldx fa
c00d:200f:1   8e 84 c1		stx lbl_c184
c010:2012:1   a9 01		lda #$01
c012:2014:1   ae 84 c1		ldx lbl_c184
c015:2017:1   a0 01		ldy #$01
c017:2019:1   20 ba ff		jsr setlfs
c01a:201c:1   ad 5d c1		lda len_screen
c01d:201f:1   a2 5e		ldx <sScreen
c01f:2021:1   a0 c1		ldy >sScreen
c021:2023:1   20 bd ff		jsr setname
c024:2026:1   a2 01		ldx #$01
c026:2028:1   a9 02		lda #$02
c028:202a:1   9d 3d c0		sta mod_c03d,x
c02b:202d:1   ca		dex
c02c:202e:1   8a		txa
c02d:202f:1   20 d5 ff		jsr load
c030:2032:1   20 13 c1		jsr lbl_c113
c033:2035:1   20 b1 c2 chk_c033 jsr sub_c2b1
c036:2038:1   ad d3 c2		lda lbl_c2d3
c039:203b:1   c9 02		cmp #$02
c03b:203d:1   d0 08		bne skipc045
c03d:203f:1   a9 02    mod_c03d lda #$02
c03f:2041:1   8d d3 c2		sta lbl_c2d3
c042:2044:1   20 b1 c2		jsr sub_c2b1
c045:2047:1   a9 01    skipc045 lda #$01
c047:2049:1   85 2b		sta txttab
c049:204b:1   a9 46		lda #$46
c04b:204d:1   85 2c		sta txttab+1
c04d:204f:1   a9 01		lda #$01
c04f:2051:1   ae 84 c1		ldx lbl_c184
c052:2054:1   a0 00		ldy #$00
c054:2056:1   20 ba ff		jsr setlfs
c057:2059:1   ad 68 c1		lda len_im
c05a:205c:1   a2 69		ldx #$69
c05c:205e:1   a0 c1		ldy #$c1
c05e:2060:1   20 bd ff		jsr setname
c061:2063:1   a9 00		lda #$00
c063:2065:1   a6 2b		ldx txttab
c065:2067:1   a4 2c		ldy txttab+1
c067:2069:1   20 d5 ff		jsr load
c06a:206c:1   86 2d		stx vartab
c06c:206e:1   84 2e		sty vartab+1
c06e:2070:1   a5 2d		lda vartab
c070:2072:1   18		clc
c071:2073:1   6d 3e c0		adc mod_c03d+1
c074:2076:1   85 2d		sta vartab
c076:2078:1   90 02		bcc skipc07a
c078:207a:1   e6 2e		inc vartab+1
c07a:207c:1   a6 2d    skipc07a ldx vartab
c07c:207e:1   a4 2e		ldy vartab+1
c07e:2080:1   86 2f		stx arytab
c080:2082:1   84 30		sty arytab+1
c082:2084:1   86 31		stx strend
c084:2086:1   84 32		sty strend+1
c086:2088:1   e6 2e		inc vartab+1
c088:208a:1   20 33 a5		jsr linkprg
c08b:208d:1   a9 01		lda #$01
c08d:208f:1   85 2b		sta txttab
c08f:2091:1   a9 08		lda #$08
c091:2093:1   85 2c		sta txttab+1
c093:2095:1   20 4a c1		jsr sub_c14a
c096:2098:1   20 16 c1		jsr sub_c116
	      ;
	      ; clear out rs232 routines
	      ;
c099:209b:1   a9 60		lda #$60
c09b:209d:1   a0 00		ldy #$00
c09d:209f:1   99 00 43 loopc09d sta rsinit,y
c0a0:20a2:1   88		dey
c0a1:20a3:1   d0 fa		bne loopc09d
c0a3:20a5:1   a9 10		lda #$10
c0a5:20a7:1   a0 e0		ldy #$e0
c0a7:20a9:1   a2 20		ldx #$20
c0a9:20ab:1   20 80 ca		jsr swapper
c0ac:20ae:1   a9 01		lda #$01
c0ae:20b0:1   ae 84 c1		ldx lbl_c184
c0b1:20b3:1   a0 01		ldy #$01
c0b3:20b5:1   20 ba ff		jsr setlfs
c0b6:20b8:1   ad 71 c1		lda len_mlextra
c0b9:20bb:1   a2 72		ldx #<sMLextra ; #$72
c0bb:20bd:1   a0 c1		ldy #>sMLextra ; #$c1
c0bd:20bf:1   20 bd ff		jsr setname
c0c0:20c2:1   a9 00		lda #$00
c0c2:20c4:1   20 d5 ff		jsr load
c0c5:20c7:1   a9 10		lda #$10
c0c7:20c9:1   a0 e0		ldy #$e0
c0c9:20cb:1   a2 20		ldx #$20
c0cb:20cd:1   20 80 ca		jsr swapper
c0ce:20d0:1   a9 10		lda #$10
c0d0:20d2:1   a0 d0		ldy #$d0
c0d2:20d4:1   a2 10		ldx #$10
c0d4:20d6:1   20 80 ca		jsr swapper
c0d7:20d9:1   a9 01		lda #$01
c0d9:20db:1   ae 84 c1		ldx lbl_c184
c0dc:20de:1   a0 01		ldy #$01
c0de:20e0:1   20 ba ff		jsr setlfs
c0e1:20e3:1   ad 7a c1		lda len_mleditor
c0e4:20e6:1   a2 7b		ldx #<sMLeditor ; #$7b
c0e6:20e8:1   a0 c1		ldy #>sMLeditor ; #$c1
c0e8:20ea:1   20 bd ff		jsr setname
c0eb:20ed:1   a9 00		lda #$00
c0ed:20ef:1   20 d5 ff		jsr load
c0f0:20f2:1   a9 10		lda #$10
c0f2:20f4:1   a0 d0		ldy #$d0
c0f4:20f6:1   a2 10		ldx #$10
c0f6:20f8:1   20 80 ca		jsr swapper
c0f9:20fb:1   a2 05		ldx #$05
c0fb:20fd:1   86 c6		stx ndx
c0fd:20ff:1   bd 0d c1 loopc0fd lda tablc10e-1,x
c100:2102:1   9d 76 02		sta keyd-1,x
c103:2105:1   ca		dex
c104:2106:1   d0 f7		bne loopc0fd
c106:2108:1   a9 00		lda #$00
c108:210a:1   8d 86 02		sta color
c10b:210d:1   6c 02 03 		jmp (imain)

c10e:2110:1   	       tablc10e .text " run"
				.byte 13  ; keyboard buffer?

c113:2115:1   4c 03 5f lbl_c113	jmp $5f03

c116:2118:1   ad 33 c0 sub_c116 lda chk_c033
c119:211b:1   c9 20		cmp #$20	; is it JSR?
c11b:211d:1   d0 f9		bne sub_c116
c11d:211f:1   ad 34 c0		lda chk_c033+1
c120:2122:1   c9 b1		cmp #$b1
c122:2124:1   d0 f2		bne sub_c116
c124:2126:1   ad 35 c0		lda chk_c033+2
c127:2129:1   c9 c2		cmp #$c2
c129:212b:1   d0 eb		bne sub_c116	; not JSR $c2b1... loop back
c12b:212d:1   a9 17		lda #%00010111
c12d:212f:1   8d 18 d0		sta vicbase
c130:2132:1   a9 1b		lda #$1b
c132:2134:1   8d 11 d0		sta vicregy
c135:2137:1   a9 c8		lda #$c8
c137:2139:1   8d 16 d0		sta vicregx
c13a:213c:1   a9 c7		lda #%11000111
c13c:213e:1   8d 00 dd		sta cia2prta
c13f:2141:1   a9 93		lda #$93
c141:2143:1   20 d2 ff		jsr chrout
c144:2146:1   a9 00		lda #$00
c146:2148:1   8d 21 d0		sta bckgrnd0
c149:214b:1   60		rts

c14a:214c:1   ad 6b c1 sub_c14a lda len_setup
c14d:214f:1   85 61		sta fac1
c14f:2151:1   a9 6c		lda #<sSetup
c151:2153:1   85 62		sta fac1+1
c153:2155:1   a9 c1		lda #>sSetup
c155:2157:1   85 63		sta fac1+2
c157:2159:1   ad 84 c1		lda lbl_c184
c15a:215c:1   4c 55 c3		jmp gotoc355

	      ;
	      ; length byte, filename
	      ;
c15d:215f:1   tbl-c183	len_screen	.byte 10
			sScreen		.text "screen 1.2"

c168:216a:1	       len_im		.byte 2
			sIM		.text "im"

c16b:216d:1   tbl-c170 len_setup	.byte 5
			sSetup		.text "setup"

c171:2173:1	       len_mlextra	.byte 8
			sMLextra	.text "ml.extra"

c17a:217c:1	       len_mleditor	.byte 8
			sMLeditor	.text "ml.editor"

c184:2186:1   tbl-c184 lbl_c184 .byte $08

; looks like some kind of initialization...
c185:2187:1   a9 00    gotoc185 lda #$00
c187:2189:1   8d fa 07		sta $07fa
c18a:218c:1   8d 08 d0		sta chatpage
c18d:218f:1   8d 03 d0		sta tsr
c190:2192:1   8d f4 07		sta chk_left
c193:2195:1   8d f5 07		sta chk_right
c196:2198:1   8d 09 d0		sta access
c199:219b:1   a9 01		lda #$01
c19b:219d:1   8d 00 d0		sta local
c19e:21a0:1   a0 00		ldy #$00
c1a0:21a2:1   98		tya
c1a1:21a3:1   99 00 40 loopc1a1 sta tempbott,y
c1a4:21a6:1   99 00 41		sta $4100,y
c1a7:21a9:1   99 00 42		sta tempcol+16,y
c1aa:21ac:1   88		dey
c1ab:21ad:1   d0 f4		bne loopc1a1
c1ad:21af:1   a9 60		lda #$60
c1af:21b1:1   a0 00		ldy #$00
c1b1:21b3:1   99 00 43 loopc1b1 sta rsinit,y
c1b4:21b6:1   88		dey
c1b5:21b7:1   d0 fa		bne loopc1b1
c1b7:21b9:1   a0 1f		ldy #$1f
c1b9:21bb:1   a9 40    loopc1b9 lda #$40
c1bb:21bd:1   99 a0 40		sta pmodetbl,y
c1be:21c0:1   88		dey
c1bf:21c1:1   a9 c0		lda #$c0
c1c1:21c3:1   99 a0 40		sta pmodetbl,y
c1c4:21c6:1   88		dey
c1c5:21c7:1   10 f2		bpl loopc1b9
c1c7:21c9:1   a9 ff		lda #$ff
c1c9:21cb:1   8d c0 40		sta $40c0
c1cc:21ce:1   a9 00		lda #$00
c1ce:21d0:1   8d c1 40		sta $40c1
c1d1:21d3:1   a9 d8		lda #$d8
c1d3:21d5:1   8d f2 42		sta mask
c1d6:21d8:1   a9 02		lda #$02
c1d8:21da:1   8d e8 42		sta undcol
c1db:21dd:1   a9 00		lda #$00
c1dd:21df:1   8d f3 42		sta scnmode
c1e0:21e2:1   20 1b c2		jsr sub_c21b
c1e3:21e5:1   20 40 c2		jsr sub_c240
c1e6:21e8:1   20 83 c2		jsr sub_c283
c1e9:21eb:1   20 9a c2		jsr sub_c29a
c1ec:21ee:1   20 35 c3		jsr sub_c335
c1ef:21f1:1   a9 36		lda #$36
c1f1:21f3:1   85 01		sta $01
c1f3:21f5:1   20 64 c2		jsr sub_c264
c1f6:21f8:1   20 7e a4		jsr sub_a47e
c1f9:21fb:1   20 00 cb		jsr $cb00
c1fc:21fe:1   a9 37		lda #$37
c1fe:2200:1   85 01		sta $01
	      ;
	      ; serial # stuff
	      ;
c200:2202:1   ad 08 c0		lda lbl_c008
c203:2205:1   4a		lsr a
c204:2206:1   4a		lsr a
c205:2207:1   4a		lsr a
c206:2208:1   4a		lsr a
c207:2209:1   09 c0		ora #$c0
c209:220b:1   8d fd 02		sta bsnprelo
c20c:220e:1   ad 08 c0		lda lbl_c008
c20f:2211:1   29 0f		and #$0f
c211:2213:1   8d ff 02		sta bsnvalhi
c214:2216:1   ad 07 c0		lda lbl_c007
c217:2219:1   8d fe 02		sta bsnvallo
c21a:221c:1   60		rts

; set up bsout vector
c21b:221d:1   ad 26 03 sub_c21b lda ibsout
c21e:2220:1   c9 2f		cmp #$2f
c220:2222:1   d0 07		bne skipc229
c222:2224:1   ad 27 03		lda ibsout+1
c225:2227:1   c9 cd		cmp #$cd
c227:2229:1   f0 16		beq skipc23f
c229:222b:1   ad 26 03 skipc229 lda ibsout
c22c:222e:1   8d 4d cd		sta $cd4d
c22f:2231:1   ad 27 03		lda ibsout+1
c232:2234:1   8d 4e cd		sta $cd4e
c235:2237:1   a9 2f		lda #$2f
c237:2239:1   8d 26 03		sta ibsout
c23a:223c:1   a9 cd		lda #$cd
c23c:223e:1   8d 27 03		sta ibsout+1
c23f:2241:1   60       skipc23f rts

c240:2242:1   a9 7f    sub_c240 lda #$7f
c242:2244:1   8d 0d dc		sta cia1icr
c245:2247:1   a9 32		lda #$32
c247:2249:1   8d 14 03		sta cinv
c24a:224c:1   a9 cc		lda #$cc
c24c:224e:1   8d 15 03		sta cinv+1
c24f:2251:1   a9 81		lda #%10000001
c251:2253:1   8d 1a d0		sta vicirqm
c254:2256:1   a9 00		lda #$00
c256:2258:1   8d 12 d0		sta raster
c259:225b:1   a9 1b		lda #%00011011
c25b:225d:1   8d 11 d0		sta vicregy
c25e:2260:1   a9 00		lda #$00
c260:2262:1   8d 0d d0		sta irqcount
c263:2265:1   60		rts

c264:2266:1   a9 0b    sub_c264 lda #$0b
c266:2268:1   8d 20 d0		sta bordrclr
c269:226b:1   a9 00		lda #$00
c26b:226d:1   8d 21 d0		sta bckgrnd0
c26e:2270:1   a9 0e		lda #$0e
c270:2272:1   20 d2 ff		jsr chrout
c273:2275:1   a9 08		lda #$08
c275:2277:1   20 d2 ff		jsr chrout
c278:227a:1   a9 05		lda #$05
c27a:227c:1   20 d2 ff		jsr chrout
c27d:227f:1   20 8f ae		jsr sub_ae8f
c280:2282:1   4c d3 ae		jmp sub_aed3

c283:2285:1   ad 08 03 sub_c283 lda igone
c286:2288:1   ae 09 03		ldx igone+1
c289:228b:1   8d be cd		sta mod_cdbd+1
c28c:228e:1   8e bf cd		stx mod_cdbd+2
c28f:2291:1   a9 97		lda #$97
c291:2293:1   a2 cd		ldx #$cd
c293:2295:1   8d 08 03		sta igone
c296:2298:1   8e 09 03		stx igone+1
c299:229b:1   60		rts

c29a:229c:1   ad 30 03 sub_c29a lda iload
c29d:229f:1   ae 31 03 lbl_c29d ldx iload+1
c2a0:22a2:1   8d 04 e4		sta var_e404
c2a3:22a5:1   8e 05 e4		stx var_e405
c2a6:22a8:1   a9 c8		lda #$c8
c2a8:22aa:1   a2 ca		ldx #$ca
c2aa:22ac:1   8d 30 03		sta iload
c2ad:22af:1   8e 31 03		stx iload+1
c2b0:22b2:1   60		rts

c2b1:22b3:1   a2 0d    sub_c2b1 ldx #$0d
c2b3:22b5:1   38		sec
c2b4:22b6:1   bd fc bf		lda lbl_bffb+1,x
c2b7:22b9:1   fd fa bf		sbc lbl_bffa,x
c2ba:22bc:1   08		php
c2bb:22bd:1   c9 23		cmp #$23
c2bd:22bf:1   d0 14		bne lbl_c2d3
c2bf:22c1:1   28		plp
c2c0:22c2:1   bd fd bf		lda lbl_bffd,x
c2c3:22c5:1   fd fb bf		sbc lbl_bffb,x
c2c6:22c8:1   c9 01		cmp #$01
c2c8:22ca:1   d0 09		bne lbl_c2d3
c2ca:22cc:1   ad d3 c2		lda lbl_c2d3
c2cd:22cf:1   49 62		eor #$62
c2cf:22d1:1   8d d2 c2		sta lbl_c2d2
c2d2:22d4:1   60       lbl_c2d2 rts

c2d3:22d5:1   tbl-c2d3 lbl_c2d3 .byte $02

c2d4:22d6:1   8a       sub_c2d4 txa
c2d5:22d7:1   0a		asl a
c2d6:22d8:1   a8		tay
c2d7:22d9:1   b9 e6 c2		lda lbl_c2e5+1,y
c2da:22dc:1   aa		tax
c2db:22dd:1   b9 e5 c2		lda lbl_c2e5,y
c2de:22e0:1   85 45		sta varnam
c2e0:22e2:1   86 46		stx varnam+1
c2e2:22e4:1   4c 4f cd		jmp gotocd4f

c2e5:22e7:1   tbl-c334 lbl_c2e5 .byte $41,$ce,$41,$80 ; variables
c2e9:22eb:1			.byte $42,$80,$54,$d2
c2ed:22ef:1			.byte $44,$b1,$44,$b2
c2f1:22f3:1			.byte $44,$b3,$44,$b4
c2f5:22f7:1			.byte $44,$b5,$4c,$c4
c2f9:22fb:1			.byte $54,$d4,$4e,$c1
c2fd:22ff:1			.byte $52,$ce,$50,$c8
c301:2303:1			.byte $41,$cb,$4c,$50
c305:2307:1			.byte $50,$4c,$52,$43
c309:230b:1			.byte $53,$48,$4d,$57
c30d:230f:1			.byte $4e,$4c,$55,$4c
c311:2313:1			.byte $51,$45,$52,$51
c315:2317:1			.byte $c1,$c3,$45,$46
c319:231b:1			.byte $4c,$46,$57,$80
c31d:231f:1			.byte $50,$80,$d4,$d2
c321:2323:1			.byte $c1,$80,$c2,$80
c325:2327:1			.byte $c4,$d6,$44,$d2
c329:232b:1			.byte $43,$b1,$43,$b2
c32d:232f:1			.byte $43,$cf,$43,$c8
c331:2333:1			.byte $cb,$d0,$43,$b3

c335:2337:1   a9 27    sub_c335 lda #$27
c337:2339:1   8d fc 07		sta tmp1
c33a:233c:1   ae fc 07 loopc33a ldx tmp1
c33d:233f:1   20 d4 c2		jsr sub_c2d4
c340:2342:1   ad fc 07		lda tmp1
c343:2345:1   0a		asl a
c344:2346:1   a8		tay
c345:2347:1   a5 47		lda varpnt
c347:2349:1   99 cc b5		sta vartable,y
c34a:234c:1   a5 48		lda varpnt+1
c34c:234e:1   99 cd b5		sta vartable+1,y
c34f:2351:1   ce fc 07		dec tmp1
c352:2354:1   10 e6		bpl loopc33a
c354:2356:1   60		rts

c355:2357:1   a6 2b    gotoc355 ldx txttab
c357:2359:1   a4 2c		ldy txttab+1
c359:235b:1   20 6e c3		jsr sub_c36e
c35c:235e:1   90 01		bcc skipc35f
c35e:2360:1   60		rts

c35f:2361:1   a6 2b    skipc35f ldx txttab
c361:2363:1   a4 2c		ldy txttab+1
c363:2365:1   86 ac		stx sal
c365:2367:1   84 ad		sty sal+1
c367:2369:1   a2 01		ldx #$01
c369:236b:1   a0 46		ldy #$46
c36b:236d:1   4c 9c c3		jmp gotoc39c

c36e:2370:1   86 ac    sub_c36e stx sal
c370:2372:1   84 ad		sty sal+1
c372:2374:1   c9 07		cmp #$07
c374:2376:1   b0 02		bcs skipc378
c376:2378:1   a9 08    lbl_2378 lda #$08
c378:237a:1   8d f7 07 skipc378 sta filenum
c37b:237d:1   a9 00		lda #$00
c37d:237f:1   20 90 ff		jsr setmsg
c380:2382:1   a9 01		lda #$01
c382:2384:1   ae f7 07		ldx filenum
c385:2387:1   a0 00		ldy #$00
c387:2389:1   20 ba ff		jsr setlfs
c38a:238c:1   a5 61		lda fac1
c38c:238e:1   a6 62		ldx fac1+1
c38e:2390:1   a4 63		ldy fac1+2
c390:2392:1   20 bd ff		jsr setname
c393:2395:1   a9 00		lda #$00
c395:2397:1   a6 ac		ldx sal
c397:2399:1   a4 ad		ldy sal+1
c399:239b:1   4c d5 ff		jmp load

c39c:239e:1   8a       gotoc39c txa
c39d:239f:1   48		pha
c39e:23a0:1   98		tya
c39f:23a1:1   48		pha
c3a0:23a2:1   a5 2b		lda txttab
c3a2:23a4:1   48		pha
c3a3:23a5:1   a5 2c		lda txttab+1
c3a5:23a7:1   48		pha
c3a6:23a8:1   a6 ac		ldx sal
c3a8:23aa:1   a4 ad		ldy sal+1
c3aa:23ac:1   86 2b		stx txttab
c3ac:23ae:1   84 2c		sty txttab+1
c3ae:23b0:1   20 5c cd		jsr sub_cd5c
c3b1:23b3:1   68		pla
c3b2:23b4:1   85 2c		sta txttab+1
c3b4:23b6:1   68		pla
c3b5:23b7:1   85 2b		sta txttab
c3b7:23b9:1   a0 00    gotoc3b7 ldy #$00
c3b9:23bb:1   b1 ac		lda (sal),y
c3bb:23bd:1   85 71		sta fbufpt
c3bd:23bf:1   c8		iny
c3be:23c0:1   b1 ac		lda (sal),y
c3c0:23c2:1   85 72		sta fbufpt+1
c3c2:23c4:1   85 72		sta fbufpt+1
c3c4:23c6:1   b1 71		lda (fbufpt),y
c3c6:23c8:1   f0 0b		beq skipc3d3
c3c8:23ca:1   a5 71		lda fbufpt
c3ca:23cc:1   85 ac		sta sal
c3cc:23ce:1   a5 72		lda fbufpt+1
c3ce:23d0:1   85 ad		sta sal+1
c3d0:23d2:1   4c b7 c3		jmp gotoc3b7

c3d3:23d5:1   68       skipc3d3 pla
c3d4:23d6:1   91 ac		sta (sal),y
c3d6:23d8:1   88		dey
c3d7:23d9:1   68		pla
c3d8:23da:1   91 ac		sta (sal),y
c3da:23dc:1   60		rts

c3db:23dd:1   tbl-ca7f tablc3db .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c3e5:23e7:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c3ef:23f1:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c3f9:23fb:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c403:2405:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c40d:240f:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c417:2419:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c421:2423:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c42b:242d:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c435:2437:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c43f:2441:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c449:244b:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c453:2455:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c45d:245f:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c467:2469:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c471:2473:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c47b:247d:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c485:2487:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c48f:2491:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c499:249b:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4a3:24a5:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4ad:24af:1			.byte $00,$00,$00,$00,$00,$00,$00,$00

c4b5:24b7:1	       lbl_c4b5 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4bf:24c1:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4c9:24cb:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4d3:24d5:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4dd:24df:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4e7:24e9:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4f1:24f3:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c4fb:24fd:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c505:2507:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c50f:2511:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c519:251b:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c523:2525:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c52d:252f:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c537:2539:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c541:2543:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c54b:254d:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c555:2557:1			.byte $00,$00,$00,$00,$00

c55a:255c:1	       lbl_c55a .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c564:2566:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c56e:2570:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c578:257a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c582:2584:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c58c:258e:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c596:2598:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5a0:25a2:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5aa:25ac:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5b4:25b6:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5be:25c0:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5c8:25ca:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5d2:25d4:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5dc:25de:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5e6:25e8:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5f0:25f2:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c5fa:25fc:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c604:2606:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c60e:2610:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c618:261a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c622:2624:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c62c:262e:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c636:2638:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c640:2642:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c64a:264c:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c654:2656:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c65e:2660:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c668:266a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c672:2674:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c67c:267e:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c686:2688:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c690:2692:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c69a:269c:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6a4:26a6:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6ae:26b0:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6b8:26ba:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6c2:26c4:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6cc:26ce:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6d6:26d8:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6e0:26e2:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6ea:26ec:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6f4:26f6:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c6fe:2700:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c708:270a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c712:2714:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c71c:271e:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c726:2728:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c730:2732:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c73a:273c:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c744:2746:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c74e:2750:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c758:275a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c762:2764:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c76c:276e:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c776:2778:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c780:2782:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c78a:278c:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c794:2796:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c79e:27a0:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7a8:27aa:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7b2:27b4:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7bc:27be:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7c6:27c8:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7d0:27d2:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7da:27dc:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7e4:27e6:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7ee:27f0:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c7f8:27fa:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c802:2804:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c80c:280e:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c816:2818:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c820:2822:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c82a:282c:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c834:2836:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c83e:2840:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c848:284a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00

c850:2852:1	       lbl_c850 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c85a:285c:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c864:2866:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c86e:2870:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c878:287a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c882:2884:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c88c:288e:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c896:2898:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8a0:28a2:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8aa:28ac:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8b4:28b6:1			.byte $00,$00,$00,$00,$00,$00,$00

c8bb:28bd:1	       lbl_c8bb .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8c5:28c7:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8cf:28d1:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8d9:28db:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8e3:28e5:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8ed:28ef:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c8f7:28f9:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c901:2903:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c90b:290d:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c915:2917:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c91f:2921:1			.byte $00

c920:2922:1	       lbl_c920 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c92a:292c:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c934:2936:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c93e:2940:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c948:294a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c952:2954:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c95c:295e:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c966:2968:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c970:2972:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c97a:297c:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c984:2986:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c98e:2990:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c998:299a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9a2:29a4:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9ac:29ae:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9b6:29b8:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9c0:29c2:1			.byte $00,$00,$00

c9c3:29c5:1	       lbl_c9c3 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9cd:29cf:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9d7:29d9:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9e1:29e3:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9eb:29ed:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9f5:29f7:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
c9ff:2a01:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca09:2a0b:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca13:2a15:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca1d:2a1f:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca27:2a29:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca31:2a33:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca3b:2a3d:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca45:2a47:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca4f:2a51:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca59:2a5b:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca63:2a65:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca6d:2a6f:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ca77:2a79:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00

; .a: source page
; .y: target page
; .x: # of pages to swap

ca80:2a82:1   8d c5 ca swapper	sta SrcPgSv
ca83:2a85:1   8c c6 ca		sty DestPgSv
ca86:2a88:1   8e c7 ca		stx NumPgSv
ca89:2a8b:1   20 06 43 swapagn	jsr rsDisable
ca8c:2a8e:1   78		sei
ca8d:2a8f:1   a5 01		lda $01
ca8f:2a91:1   48		pha
ca90:2a92:1   a9 34		lda #$34
ca92:2a94:1   85 01		sta r6510
ca94:2a96:1   ad c5 ca		lda SrcPgSv
ca97:2a99:1   85 6a		sta fac2+1
ca99:2a9b:1   ad c6 ca		lda DestPgSv
ca9c:2a9e:1   85 6c		sta fac2+3
ca9e:2aa0:1   ad c7 ca		lda NumPgSv
caa1:2aa3:1   85 6d		sta fac2+4
caa3:2aa5:1   a0 00		ldy #$00
caa5:2aa7:1   84 69		sty fac2
caa7:2aa9:1   84 6b		sty fac2+2
caa9:2aab:1   b1 69    loopcaa9 lda (fac2),y
caab:2aad:1   aa		tax
caac:2aae:1   b1 6b		lda (fac2+2),y
caae:2ab0:1   91 69		sta (fac2),y
cab0:2ab2:1   8a		txa
cab1:2ab3:1   91 6b		sta (fac2+2),y
cab3:2ab5:1   c8		iny
cab4:2ab6:1   d0 f3		bne loopcaa9
cab6:2ab8:1   e6 6a		inc fac2+1
cab8:2aba:1   e6 6c		inc fac2+3
caba:2abc:1   c6 6d		dec fac2+4
cabc:2abe:1   d0 eb		bne loopcaa9
cabe:2ac0:1   68		pla
cabf:2ac1:1   85 01		sta r6510
cac1:2ac3:1   58		cli
cac2:2ac4:1   4c 03 43		jmp rsEnable

cac5:2ac7:1   00       SrcPgSv	brk		; Source Page Save
cac6:2ac8:1   00       DestPgSv brk		; Target Page Save
cac7:2ac9:1   00       NumPgSv	brk		;  # of Pages Save

cac8:2aca:1   a9 00		lda #$00
caca:2acc:1   8d 06 e4		sta $e406
cacd:2acf:1   08		php
cace:2ad0:1   48		pha
cacf:2ad1:1   a9 46		lda #$46
cad1:2ad3:1   a0 e4		ldy #$e4
cad3:2ad5:1   a2 04		ldx #$04
cad5:2ad7:1   20 80 ca		jsr swapper
cad8:2ada:1   68		pla
cad9:2adb:1   28		plp
cada:2adc:1   20 00 46		jsr $4600
cadd:2adf:1   08		php
cade:2ae0:1   48		pha
cadf:2ae1:1   8a		txa
cae0:2ae2:1   48		pha
cae1:2ae3:1   98		tya
cae2:2ae4:1   48		pha
cae3:2ae5:1   20 89 ca		jsr swapagn
cae6:2ae8:1   68		pla
cae7:2ae9:1   a8		tay
cae8:2aea:1   68		pla
cae9:2aeb:1   aa		tax
caea:2aec:1   68		pla
caeb:2aed:1   28		plp
caec:2aee:1   60		rts

caed:2aef:1   8a		txa
caee:2af0:1   48		pha
caef:2af1:1   a9 c0		lda #$c0
caf1:2af3:1   a0 e8		ldy #$e8
caf3:2af5:1   a2 08		ldx #$08
caf5:2af7:1   20 80 ca		jsr swapper
caf8:2afa:1   68		pla
caf9:2afb:1   aa		tax
cafa:2afc:1   20 00 c0		jsr $c000
cafd:2aff:1   4c 89 ca		jmp swapagn

cb00:2b02:1   a9 01		lda #$01
cb02:2b04:1   8d 00 d0		sta local
cb05:2b07:1   a2 00		ldx #$00
cb07:2b09:1   20 99 b0		jsr sub_b099
cb0a:2b0c:1   a9 05		lda #$05
cb0c:2b0e:1   20 03 cd		jsr usetbl1
cb0f:2b11:1   a9 1b		lda #$1b	; message length
cb11:2b13:1   85 61		sta fac1
cb13:2b15:1   a9 25		lda #<bootmsg	; #$25
cb15:2b17:1   85 62		sta fac1+1
cb17:2b19:1   a9 cb		lda #>bootmsg	; #$cb
cb19:2b1b:1   85 63		sta fac1+2
cb1b:2b1d:1   a2 00		ldx #$00
cb1d:2b1f:1   20 a5 b5		jsr sub_b5a5
cb20:2b22:1   a2 00		ldx #$00
cb22:2b24:1   4c 80 b5		jmp gotob580

cb25:2b27:1   tbl-cb3f bootmsg	.byte $93		; 147 - clear screen
				.text " 1.2 Image2000 By IronAxe"
				.byte $8b

cb40:2b42:1   tbl-cbff tablcb40 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb4a:2b4c:1			.byte $00,$00

cb4c:2b4e:1	       lbl_cb4c .byte $00,$00,$00,$00,$00,$00,$00,$00,$00

cb55:2b57:1	       skipcb55 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb5f:2b61:1			.byte $00,$00,$00,$00

cb63:2b65:1	       skipcb63 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb6d:2b6f:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb77:2b79:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb81:2b83:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb8b:2b8d:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb95:2b97:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cb9f:2ba1:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cba9:2bab:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbb3:2bb5:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbbd:2bbf:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbc7:2bc9:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbd1:2bd3:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbdb:2bdd:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbe5:2be7:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbef:2bf1:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cbf9:2bfb:1			.byte $00,$00,$00,$00,$00,$00,$00

cc00:2c02:1   tbl-cc01 tablcc00 .byte $67,$b5

cc02:2c04:1   20 79 00 sub_cc02 jsr chrgot
cc05:2c07:1   a2 00		ldx #$00
cc07:2c09:1   c9 2c		cmp #$2c	; ","
cc09:2c0b:1   d0 03		bne skipcc0e
cc0b:2c0d:1   20 9b b7		jsr lbl_b79a+1
cc0e:2c10:1   60       skipcc0e rts

cc0f:2c11:1   20 02 cc sub_cc0f jsr sub_cc02
cc12:2c14:1   8e 0c 03		stx sareg
cc15:2c17:1   20 02 cc		jsr sub_cc02
cc18:2c1a:1   8e 0d 03		stx sxreg
cc1b:2c1d:1   20 02 cc		jsr sub_cc02
cc1e:2c20:1   8e 0e 03		stx syreg
cc21:2c23:1   ad 0c 03		lda sareg
cc24:2c26:1   ae 0d 03		ldx sxreg
cc27:2c29:1   ac 0e 03		ldy syreg
cc2a:2c2c:1   60		rts

cc2b:2c2d:1   a9 37    gotocc2b lda #$37
cc2d:2c2f:1   85 01		sta $01
cc2f:2c31:1   4c 37 a4		jmp gotoa437

cc32:2c34:1   a9 00    mod_cc32 lda #$00
cc34:2c36:1   d0 1a		bne skipcc50
cc36:2c38:1   ad f3 42		lda scnmode
cc39:2c3b:1   d0 05		bne skipcc40
cc3b:2c3d:1   a9 17		lda #$17
cc3d:2c3f:1   8d 18 d0		sta vicbase
cc40:2c42:1   a9 6a    skipcc40 lda #$6a
cc42:2c44:1   8d 12 d0		sta raster
cc45:2c47:1   a9 01		lda #$01
cc47:2c49:1   8d 19 d0		sta vicirqf
cc4a:2c4c:1   ee 33 cc		inc mod_cc32+1
cc4d:2c4f:1   4c bc fe		jmp var_febc

cc50:2c52:1   ea       skipcc50 nop
cc51:2c53:1   ad 0c d0		lda mupcase
cc54:2c56:1   29 01		and #$01
cc56:2c58:1   0a		asl a
cc57:2c59:1   49 17		eor #%00010111
cc59:2c5b:1   8d 18 d0		sta vicbase
cc5c:2c5e:1   a9 ea		lda #$ea
cc5e:2c60:1   8d 12 d0		sta raster
cc61:2c63:1   a9 01		lda #$01
cc63:2c65:1   8d 19 d0		sta vicirqf
cc66:2c68:1   ce 33 cc		dec mod_cc32+1
cc69:2c6b:1   4c c0 cd		jmp gotocdc0

cc6c:2c6e:1   0a       sub_cc6c asl a
cc6d:2c6f:1   aa		tax
cc6e:2c70:1   a5 01		lda $01
cc70:2c72:1   48		pha
cc71:2c73:1   a9 36		lda #$36
cc73:2c75:1   85 01		sta $01
cc75:2c77:1   08		php
cc76:2c78:1   78		sei
cc77:2c79:1   bd 00 a0		lda irqtable,x
cc7a:2c7c:1   a8		tay
cc7b:2c7d:1   bd 01 a0		lda irqtable+1,x
cc7e:2c80:1   aa		tax
cc7f:2c81:1   28		plp
cc80:2c82:1   68		pla
cc81:2c83:1   85 01		sta $01
cc83:2c85:1   60		rts

cc84:2c86:1   tbl-ccff tablcc84 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cc8e:2c90:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cc98:2c9a:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cca2:2ca4:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccac:2cae:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccb6:2cb8:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccc0:2cc2:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccca:2ccc:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccd4:2cd6:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccde:2ce0:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
cce8:2cea:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccf2:2cf4:1			.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
ccfc:2cfe:1			.byte $00,$00,$00,$00

cd00:2d02:1   20 0f cc sub_cd00 jsr sub_cc0f
cd03:2d05:1   8d 0c 03 usetbl1	sta sareg
cd06:2d08:1   8e 0d 03		stx sxreg
cd09:2d0b:1   8c 0e 03		sty syreg
cd0c:2d0e:1   20 6c cc		jsr sub_cc6c
cd0f:2d11:1   8c 23 cd		sty mod_cd22+1
cd12:2d14:1   8e 24 cd		stx mod_cd22+2
cd15:2d17:1   a5 01		lda $01
cd17:2d19:1   48		pha
cd18:2d1a:1   a9 36		lda #$36
cd1a:2d1c:1   85 01		sta $01
cd1c:2d1e:1   ae 0d 03		ldx sxreg
cd1f:2d21:1   ac 0e 03		ldy syreg
cd22:2d24:1   20 ff ff mod_cd22 jsr $ffff
cd25:2d27:1   8d 0c 03		sta sareg
cd28:2d2a:1   68		pla
cd29:2d2b:1   85 01		sta $01
cd2b:2d2d:1   ad 0c 03		lda sareg
cd2e:2d30:1   60		rts

; new ibsout vector:
cd2f:2d31:1   48		pha
cd30:2d32:1   a5 9a		lda dfltno
cd32:2d34:1   c9 04		cmp #$04
cd34:2d36:1   b0 15		bcs skipcd4b
cd36:2d38:1   a5 01		lda $01
cd38:2d3a:1   8d e4 ce		sta lbl_cee4
cd3b:2d3d:1   a9 36		lda #$36
cd3d:2d3f:1   85 01		sta $01
cd3f:2d41:1   68		pla
cd40:2d42:1   20 d7 a7		jsr sub_a7d7
cd43:2d45:1   48		pha
cd44:2d46:1   ad e4 ce		lda lbl_cee4
cd47:2d49:1   85 01		sta $01
cd49:2d4b:1   68		pla
cd4a:2d4c:1   60		rts

cd4b:2d4d:1   68       skipcd4b pla
cd4c:2d4e:1   4c ff ff sav_cinv jmp $ffff

cd4f:2d51:1   a5 01    gotocd4f lda $01
cd51:2d53:1   48		pha
cd52:2d54:1   a9 37		lda #$37
cd54:2d56:1   85 01		sta $01
cd56:2d58:1   20 e7 b0		jsr ptrget1
cd59:2d5b:1   4c 75 cd		jmp gotocd75

cd5c:2d5e:1   a5 01    sub_cd5c lda $01
cd5e:2d60:1   48		pha
cd5f:2d61:1   a9 37		lda #$37
cd61:2d63:1   85 01		sta $01
cd63:2d65:1   20 33 a5		jsr linkprg
cd66:2d68:1   4c 75 cd		jmp gotocd75

cd69:2d6b:1   aa       sub_cd69 tax
cd6a:2d6c:1   a5 01		lda $01
cd6c:2d6e:1   48		pha
cd6d:2d6f:1   a9 37		lda #$37
cd6f:2d71:1   85 01		sta $01
cd71:2d73:1   8a		txa
cd72:2d74:1   20 75 b4		jsr sub_b475
cd75:2d77:1   68       gotocd75 pla
cd76:2d78:1   85 01		sta $01
cd78:2d7a:1   60		rts

cd79:2d7b:1   8e 0c 03		stx sareg
cd7c:2d7e:1   a5 39		lda curlin
cd7e:2d80:1   8d 0d 03		sta sxreg
cd81:2d83:1   a5 3a		lda curlin+1
cd83:2d85:1   8d 0e 03		sta syreg
cd86:2d88:1   a9 d0		lda #>inchat
cd88:2d8a:1   85 14		sta linnum
cd8a:2d8c:1   a9 07		lda #<inchat
cd8c:2d8e:1   85 15		sta linnum+1
cd8e:2d90:1   a2 fa		ldx #$fa
cd90:2d92:1   9a		txs
cd91:2d93:1   20 a3 a8		jsr sub_a8a3
cd94:2d96:1   4c ae a7		jmp lbl_a7ad+1

; new IGONE vector:
cd97:2d99:1   a9 36		lda #$36
cd99:2d9b:1   85 01		sta $01
cd9b:2d9d:1   20 6c b6		jsr sub_b66c
cd9e:2da0:1   a9 37		lda #$37
cda0:2da2:1   85 01		sta $01
cda2:2da4:1   20 73 00		jsr chrget
cda5:2da7:1   c9 26    gotocda5 cmp #$26	      ; "&"
cda7:2da9:1   d0 0c		bne skipcdb5
cda9:2dab:1   20 73 00		jsr chrget
cdac:2dae:1   20 00 cd		jsr sub_cd00
cdaf:2db1:1   20 79 00		jsr chrgot
cdb2:2db4:1   4c a5 cd		jmp gotocda5

cdb5:2db7:1   a5 7a    skipcdb5 lda txtptr
cdb7:2db9:1   d0 02		bne skipcdbb
cdb9:2dbb:1   c6 7b		dec txtptr+1
cdbb:2dbd:1   c6 7a    skipcdbb dec txtptr
cdbd:2dbf:1   4c ff ff mod_cdbd jmp $ffff

cdc0:2dc2:1   a5 01    gotocdc0 lda $01
cdc2:2dc4:1   48		pha
cdc3:2dc5:1   a9 36		lda #$36
cdc5:2dc7:1   85 01		sta $01
cdc7:2dc9:1   a9 00    lbl_cdc7 lda #$00
cdc9:2dcb:1   f0 05		beq skipcdd0
cdcb:2dcd:1   ce c8 cd		dec $cdc8
cdce:2dd0:1   d0 09		bne skipcdd9
cdd0:2dd2:1   20 4e ac skipcdd0 jsr sub_ac4e
cdd3:2dd5:1   ad 0d d0		lda irqcount
cdd6:2dd8:1   8d c8 cd		sta lbl_cdc7+1
cdd9:2ddb:1   68       skipcdd9 pla
cdda:2ddc:1   85 01		sta $01
cddc:2dde:1   4c 81 ea		jmp $ea81

cddf:2de1:1   a5 01    sub_cddf lda $01
cde1:2de3:1   48		pha
cde2:2de4:1   a9 37		lda #$37
cde4:2de6:1   85 01		sta $01
cde6:2de8:1   20 9e ad		jsr lbl_ad9d+1
cde9:2deb:1   20 a3 b6		jsr sub_b6a3
cdec:2dee:1   aa		tax
cded:2def:1   68		pla
cdee:2df0:1   85 01		sta $01
cdf0:2df2:1   8a		txa
cdf1:2df3:1   a6 22    loopcdf1 ldx z_index
cdf3:2df5:1   a4 23		ldy z_index+1
cdf5:2df7:1   60		rts

cdf6:2df8:1   tbl-ce0a tablcdf6 .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

	      ;
	      ; d1$ (11 digits)
	      ;
ce00:2e02:1   tbl-ce0a d1str	.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce0a:2e0c:1			.byte $20

	      ;
	      ; long date format
	      ;
ce0b:2e0d:1   tbl-ce26 date_day .text "Sat "

ce0f:2e11:1   tbl-ce12 date_mon .text "Jan "

ce13:2e15:1   tbl-ce13 date_10	.text " "

	      ;
	      ; 20 isn't modified as far as I know
	      ;
ce14:2e16:1   tbl-ce18 date_1	.text "1, 20"

ce19:2e1b:1   tbl-ce19 year_10	.text "0"

ce1a:2e1c:1   tbl-ce1b year_1	.text "0 "

ce1c:2e1e:1   tbl-ce1f tm_hr_10 .text "1"

ce1d:2e1f:1   tbl-ce1e tm_hr_01 .text "2:"

ce1f:2e21:1   tbl-ce1f tm_mn_10 .text "0"

ce20:2e22:1   tbl-ce21 tm_mn_01 .text "0 "

ce22:2e24:1   tbl-ce23 time_ap	.text "PM"

ce24:2e26:1   tbl-ce26 tablce24 .byte $20,$20,$20

ce27:2e29:1   tbl-ce76 buffer2	.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce31:2e33:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce3b:2e3d:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce45:2e47:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce4f:2e51:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce59:2e5b:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce63:2e65:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce6d:2e6f:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20

ce77:2e79:1   tbl-cec6 buffer	.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce81:2e83:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce8b:2e8d:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce95:2e97:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ce9f:2ea1:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
cea9:2eab:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ceb3:2eb5:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20
cebd:2ebf:1			.byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20

cec7:2ec9:1   tbl-ced0 lbl_cec7 .byte $05

cec8:2eca:1	       lbl_cec8 .byte $03

cec9:2ecb:1	       lbl_cec9 .byte $10

ceca:2ecc:1	       lbl_ceca .byte $88

cecb:2ecd:1	       lbl_cecb .byte $12

cecc:2ece:1	       lbl_cecc .byte $00

cecd:2ecf:1	       lbl_cecd .byte $00

cece:2ed0:1	       lbl_cece .byte $00

cecf:2ed1:1	       lbl_cecf .byte $00

ced0:2ed2:1	       lbl_ced0 .byte $00

	      ;
	      ; looks like bcd-encoded days of month (1-10)
	      ;
ced1:2ed3:1   tbl-cee6 tablced1 .byte $31,$28,$31,$30,$31,$30,$31,$31,$30,$00

cedb:2edd:1   tbl-cee3 lbl_cedb .text "00000101",$00

cee4:2ee6:1	       lbl_cee4 .byte $00

cee5:2ee7:1	       lbl_cee5 .byte $00

cee6:2ee8:1	       lbl_cee6 .byte $00

cee7:2ee9:1   tbl-cef5 blddate	.text "12/30/99 09:45P"

cef6:2ef8:1   tbl-cef9 tablcef6 .byte $81,$19,$99,$99

cefa:2efc:1   tbl-cefc tablcefa .byte $9a ' ""
				.byte $00
cefc:2efe:1			.byte $00

cefd:2eff:1   tbl-cf00 tablcefd .byte $ff,$35,$ff,$20

.inc "rs232-swift.txt"