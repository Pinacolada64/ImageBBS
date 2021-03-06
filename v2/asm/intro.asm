; "12/13/90 03:31p"

	devnum = 186

; intro is a proto
	jmp intro
	jmp setup
	byte $ff ;intro

;
;* intro program
;
intro:
; fake rs232 driver
	lda #$60
	ldy #0
loop1:
	sta rs232,y
	dey
	bne loop1
; move editor from $7000 to $d000
	lda #$70
	ldy #$d0
	ldx #48
	jsr swapper
; move wedge from $6c00 to $0c00
	lda #$6c
	ldy #$0c
	ldx #4
	jsr swapper
; load "im"
	ldx #<prgstart
	ldy #>prgstart
	stx $2b
	sty $2c
	ldx #<prgstart+2
	ldy #>prgstart+2
	stx vartab	; $2d
	sty vartab+1	; $2e
	stx $2f
	sty $30
	stx $31
	sty $32
	lda #0
	sta prgstart-1
	sta prgstart
	sta prgstart+1
	lda #1
	ldx devnum
	ldy #0
	jsr setlfs	; $ffba
	lda file2
	ldx #<file2+1
	ldy #>file2+1
	jsr setnam	; $ffbd
	jsr loadprg
; restore screen
	lda #11
	sta $d011
	lda #$17
	sta $d018
	lda #'{clear}'
	jsr prtscn	; $e716
	lda #27
	sta $d011
; fake lightbar table
	lda #0
	ldy #0
loop2:
	sta chktbl,y
	iny
	cpy #16
	bne loop2
	lda #32
	ldy #0
loop3:
	sta bartbl,y
	iny
	cpy #192
	bne loop3
; run program
	lda #0
	jsr $a871
	jmp $a7ae
;
;* filenames
file2:
	ascii "{2}im"
;
;* setup routines *
;
;* main setup routine
setup:
	lda #0
	tay
loop4:
	sta cassbuff,y
	iny
	cpy #1024-cassbuff
	bne loop4
	ldy #0
loop5:
	lda date2,y
	sta date1,y
	iny
	cpy #28
	bne loop5
	lda #80
	sta ptrclmn
	lda #40
	sta modclmn
	lda #1
	sta local
	ldy #0
loop6:
	lda #32
	sta tempscn+$00,y
	sta tempscn+$a0,y
	lda #1
	sta tempcol+$00,y
	sta tempcol+$a0,y
	iny
	cpy #$a0
	bne loop6
	ldy #11
loop7:
	lda daysofm0,y
	sta daysofm,y
	dey
	bpl loop7
	jsr copytran
	ldy #15
	lda #16
loop8:
	sta pmodetbl,y
	dey
	bpl loop8
	lda #255
	sta pmodetbl+16
	lda #0
	sta pmodetbl+17
	ldy #0
loop9:
	lda #1
	sta alarmtb,y
	lda #0
	sta alarmtb+1,y
	iny
	bpl loop9
	ldy #12*3-1
loop10:
	lda montbl0,y
	sta montbl,y
	dey
	bpl loop10
	ldy #8*3-1
loop11:
	lda daytbl0,y
	sta daytbl,y
	dey
	bpl loop11
	ldy #31
loop12:
	lda date1fmt,y
	sta date1,y
	dey
	bpl loop12
	ldy #64
loop13:
	lda sndtbl0,y
	sta sndtbl,y
	dey
	bpl loop13
	ldy #0
	ldx #0
loop14:
	lda screentb,y
	iny
	sta lobytes,x
	lda screentb,y
	iny
	sta hibytes,x
	lda screentb,y
	iny
	sta lobytec,x
	lda screentb,y
	iny
	sta hibytec,x
	inx
	cpx #25
	bne loop14

	lda #0
	sta passmode
	lda #'X'
	sta mask
	lda #2
	sta bar
	lda #0
	sta readmode
	sta scnmode
	sta scnlock
	sta interm
	sta inchat
	jsr iosetup
	jsr setptrs
	jsr setirq
	jsr trapoff
	lda #$36
	sta $01
	jsr setscrn
	ldx #3
	jsr comq
	jsr startmsg
	lda #$37
	sta $01
	rts
;
;* setup i/o windows
;
iosetup:
	lda $0326
	sta oldout+1
	lda $0327
	sta oldout+2
	lda #<newout
	sta $0326
	lda #>newout
	sta $0327
	rts
;
;* setup irq vector
;
setirq:
	lda #127
	sta 56333
	lda #<raster
	sta 788
	lda #>raster
	sta 789
	lda #$81
	sta $d01a
	lda #$00
	sta $d012
	lda #$1b
	sta $d011
	lda #0
	sta irqcount
	rts
;* initial setup of screen
;* colors/ clear/ etc
setscrn:
	lda #$00
	sta $d020
	lda #$00
	sta $d021
	lda #$0e
	jsr chrout
	lda #$08
	jsr chrout
	lda #$05
	jsr chrout
	jsr makdate	; FIXME: in irqhn.lbl
	jmp dispdate	; FIXME: in irqhn.lbl
;
;* find basic variable
;
getvarp:
	txa
	asl
	tay
	lda varlist+1,y
	tax
	lda varlist,y
	sta $45
	stx $46
	jmp findvar1

;********************************
;* variables used by ml 	*
;********************************

; TODO: find out if these are the same variables/order as in varbl.lbl
; if so, turn them into an include
varlist:
	ascii "aN"	; an$ 0
	ascii "a{$80}"	; a$  1
	ascii "b{$80}"	; b$  2
	ascii "tR"	; tr$ 3
	ascii "d{$b1}"	; d1$ 4
	ascii "d{$b2}"	; d2$ 5
	ascii "d{$b3}"	; d3$ 6
	ascii "d{$b4}"	; d4$ 7
	ascii "d{$b5}"	; d5$ 8
	ascii "lD"	; ld$ 9
	ascii "tT"	; tt$ 10
	ascii "nA"	; na$ 11
	ascii "rN"	; rn$ 12
	ascii "pH"	; ph$ 13
	ascii "aK"	; ak$ 14
	ascii "lp"	; lp  15
	ascii "pl"	; pl  16
	ascii "rc"	; rc  17
	ascii "sh"	; sh  18
	ascii "mw"	; mw  19
	ascii "nl"	; nl  20
	ascii "ul"	; ul  21
	ascii "qe"	; qe  22
	ascii "rq"	; rq  23
	ascii "AC"	; ac% 24
	ascii "ef"	; ef  25
	ascii "lf"	; lf  26
	ascii "w{$80}"	; w$  27
	ascii "p{$80}"	; p$  28
	ascii "TR"	; tr% 29
	ascii "A{$80}"	; a%  30
	ascii "B{$80}"	; b%  31
	ascii "DV"	; dv% 32
	ascii "dR"	; dr$ 33
	ascii "c{$b1}"	; c1$ 34
	ascii "c{$b2}"	; c2$ 35
	ascii "cO"	; co$ 36
	ascii "cH"	; ch$ 37
	ascii "KP"	; kp% 38
	ascii "c{$b3}"	; c3$ 39
	ascii "f{$b1}"	; f1$ 40
	ascii "f{$b2}"	; f2$ 41
	ascii "f{$b3}"	; f3$ 42
	ascii "f{$b4}"	; f4$ 43
	ascii "f{$b5}"	; f5$ 44
	ascii "f{$b6}"	; f6$ 45
	ascii "f{$b7}"	; f7$ 46
	ascii "f{$b8}"	; f8$ 47
	ascii "mP"	; mp$ 48
	ascii "MN"	; mn% 49

; find all vars used by ml,
; get their pointers

setptrs:
	lda #49
	sta tmp1
setp1:
	ldx tmp1
	jsr getvarp
	lda tmp1
	asl
	tay
	sec
	lda $47
	sbc vartab	; $2d
	sta vars,y
	lda $48
	sbc vartab+1	; $2e
	sta vars+1,y
	dec tmp1
	bpl setp1
	rts

date2:
	ascii "Wed Feb 14, 1990 12:25 PM   "

copytran:
	ldy #0
@l1:
	lda tr1,y
	sta tblatc,y
	iny
	cpy #128
	bcc <@l1
	ldy #0
@l2:
	lda tr2,y
	sta tblcta,y
	iny
	bne <@l2
	ldy #0
@l3:
	lda tr3,y
	sta tblcta1,y
	lda tr4,y
	sta tblcta2,y
	lda tr5,y
	sta tblcta3,y
	iny
	cpy #32
	bcc <@l3
	rts

; tblatc - ascii -> commodore character translation
tr1:
	byte 0,0,2,0,4,0,0,0,20,9,0,0,147,13,14,15
	byte 0,17,0,19,20,21,22,23,24,25,0,27,0,0,0,0
	ascii " !{34}#$%&'()*+,-./"
	ascii "0123456789:;<=>?"
	ascii "@ABCDEFGHIJKLMNO"
	ascii "PQRSTUVWXYZ[{pound}]{up arrow}{back arrow}"
	ascii "{0}abcdefghijklmno"
	ascii "pqrstuvwxyz{0:4}{20}"

; tblcta - commodore -> ascii character translation
tr2:
	byte 0,1,2,3,4,5,6,7,8,9,10,11,12,$0d,0,$0f
	byte 16,17,18,19,8,21,22,23,24,25,26,27,28,29,30,31
	ascii " !{34}#$%&'()*+,-./"
	ascii "0123456789:;<=>?@"
	byte 97,98,99,100,101,102,103,104,105,106,107,108,109,110,111
	byte 112,113,114,115,116,117,118,119,120,121,122
	ascii "[{pound}]{up arrow}{back arrow}"
	ascii "-abcdefghijklmno"
	ascii "pqrstuvwxyz*-!**"
; $0d=141=Shift-Return ($0d+$80)
	byte 0,129,0,0,0,0,0,0,0,0,0,0,0,$0d,0,0
; 144-158
	ascii "{0}{up}{rvrs off}"
	byte 12,0,149,150,151,152,153,154,155,156,157,158,159
; 160 ($a0): shift-space -> ' '
; 160-175
	ascii " !---!*!-*!****-"
	ascii "****!!!---******"
	ascii "-abcdefghijklmno"
	ascii "pqrstuvwxyz*!!**"
	ascii " !---!*!-*!****-"
	ascii "****!!!---******"

; tblcta1
tr3:
	byte 032,221,220,196,095,179,178,179
	byte 220,047,222,195,201,192,191,220
	byte 218,193,194,180,221,221,222,223
	byte 223,220,217,187,200,217,188,176

; tblcta2
tr4:
	byte 196,065,066,067,068,069,070,071
	byte 072,073,074,075,076,077,078,079
	byte 080,081,082,083,084,085,086,087
	byte 088,089,090,197,221,179,178,092

; tblcta3
tr5:
	byte 196,042,179,196,196,196,196,179
	byte 179,191,192,217,192,092,047,218
	byte 191,254,196,042,179,218,042,254
	byte 042,179,042,197,221,179,227,092

;* months and days
montbl0:
	ascii "JanFebMarAprMayJunJulAugSepOctNovDec"
daytbl0:
	ascii "???SunMonTueWedThuFriSat"
daysofm0:
	byte 31,28,31,30,31,30
	byte 31,31,30,31,30,31

date1fmt:
	ascii "Sat Dec  9, 1990 12:00 AM EST   "

sndtbl0:
; &,25,0: beep
	byte $00,$40,$10,$f0,$11
	byte $00,$00,$00,$00,$00
	byte $00,$00,$00,$00,$00
	byte $10
; &,25,1: ding
	byte $44,$40,$0b,$00,$15
	byte $00,$00,$00,$00,$00
	byte $d8,$2a,$00,$00,$00
	byte $50
; &,25,2: bell
	byte $00,$60,$09,$00,$11
	byte $00,$60,$09,$00,$11
	byte $00,$60,$09,$00,$11
	byte $20
; &,25,3: bong
	byte $44,$10,$0d,$00,$15
	byte $30,$08,$0b,$00,$15
	byte $1c,$04,$0d,$00,$15
	byte $e0

startmsg:
	lda #1
	sta local
	ldx #0
	jsr setmode
	lda #5
	jsr usetbl1
	lda #verslen
	sta var
	lda #<bootvers
	sta var+1
	lda #>bootvers
	sta var+2
	ldx #0
	jsr putvar ;an$
	ldx #0
	jmp prtvar0 ;an$
;
bootvers:
	ascii "{clear} Image BBS v2.0 Rev {pound}%a: {pound}$a{f6}"
	verslen = *-bootvers

screentb:
	word $400+000,$d800+000
	word $400+040,$d800+040
	word $400+080,$d800+080
	word $400+120,$d800+120
	word $400+160,$d800+160
	word $400+200,$d800+200
	word $400+240,$d800+240
	word $400+280,$d800+280
	word $400+320,$d800+320
	word $400+360,$d800+360
	word $400+400,$d800+400
	word $400+440,$d800+440
	word $400+480,$d800+480
	word $400+520,$d800+520
	word $400+560,$d800+560
	word $400+600,$d800+600
	word tempscn0,tempcol0
	word tempscn1,tempcol1
	word tempscn2,tempcol2
	word tempscn3,tempcol3
	word tempscn4,tempcol4
	word tempscn5,tempcol5
	word tempscn6,tempcol6
	word tempscn7,tempcol7
	word $400+960,$d800+960
