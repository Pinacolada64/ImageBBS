; print"05/07/91 05:45p"
;
;* message command interpreter
;
;* mci routines follow *
domci0:
	jmp notc1
domci:
	cmp #'{pound}'
	bne domci0
	ldx mci
	bne domci0
	inc $96
	ldy $96
	lda ($71),y
	cmp #'{pound}'
	beq domci0
	and #63
	sta mcom
	inc $96
	iny
	lda ($71),y
	sta mchr
	and #$0f
	sta mnum
	iny
	lda ($71),y
	sta mchr2
	and #$0f
	sta mnum2
	lda mnum
	asl
	asl
	clc
	adc mnum
	asl
	clc
	adc mnum2
	sta mval
	iny
	lda ($71),y
	sta mchr3
;* actual mci routines *
	lda mcom
	cmp #40
	bcs combad
	asl
	tax
	lda comtbl,x
	sta comjmp+1
	lda comtbl+1,x
	sta comjmp+2
	lda mchr
	ldx mnum
comjmp:
	jmp $ffff
combad:
	jmp notc
mcom:
	byte 0
mnum:
	byte 3
mchr:
	byte 0
mnum2:
	byte 0
mchr2:
	byte 0
mval:
	byte 0
mchr3:
	byte 0

comtbl:
	word notc,coma,comb,comc
	word comd,come,comf,comg
	word comh,comi,comj,comk
	word coml,>@comm,comn,como
	word comp,comq,comr,coms
	word comt,comu,comv,comw
	word comx,comy,notc,notc
	word notc,notc,notc,ctab
	word notc,cvar,notc,clen
	word cstr,cnum,notc,notc

mcivars:
	ascii "d1"
	ascii "ld"
	ascii "na"
	ascii "rn"
	ascii "ph"
	ascii "bn"
	ascii "b{$80}"
	ascii "an"
	ascii "d2"
	ascii "d3"
	ascii "ak"
	ascii "lt"
	ascii "d4"
	ascii "ag"
	ascii "cc"
	ascii "dd"

mcivar:
	txa
	asl
	tay
	lda mcivars+1,y
	ora #$80
	tax
	lda mcivars,y
	jmp usevar0

@colors:
; 1st cyan is substituted for black
; ctrl 1-8:
	ascii "{cyan}{white}{red}{cyan}{purple}{green}{blue}{yellow}"
; c= 1-8:
	ascii "{orange}{brown}{lt. red}{gray1}{gray2}{lt. green}"
	ascii "{lt. blue}{gray3}"
;
;* £a - compare to variable
coma:
	jsr mcivar
	lda var+1
	sta coma2+1
	lda var+2
	sta coma2+2
	ldx #0
coma1:
	inc $96
	ldy $96
	lda ($71),y
	cmp #'{pound}'
	beq coma3
coma2:
	cmp $ffff,x
	bne coma4
	inx
	jmp coma1
coma3:
	lda #1
	sta mresult
	rts
coma4:
	lda #0
	sta mresult
coma5:
	inc $96
	ldy $96
	cpy #80
	beq coma6
	lda ($71),y
	cmp #'{pound}'
	bne coma5
coma6:
	rts
;
;* £b - send bells
comb:
	lda #7
	jmp repchr
;
;* £k - kolorific
comk:
	stx mkolor
	beq comc2
;
;* £c - set color
comc:
	lda mnum
	bne comc1
comqc=*+1
	ldx #3
	beq comc2
comc1:
	tay
	lda <@colors,y
	sta $fe
	jmp output
comc2:
	rts
;
;* £d - branch on not equal
comd:
	lda mresult
	beq comj
	rts
;
;* £e - branch on equal
come:
	lda mresult
	bne comj
	rts
;
;* £j - skip lines
comj:
	lda mnum
comj1:
	cmp #0
	beq comj2
	sta mjump
	lda #240
	sta $96
comj2:
	rts
;
;* £f - send form feed
comf:
	lda #$93
	sta $fe
	jmp output
;
;* £g - get character
comg:
	txa
	and #1
	sta case
	jmp inchr
;
;* £h - send backspaces
comh:
	lda #20
	jmp repchr
;
;* £i - input to buffer
comi:
	txa
	and #1
	sta case
	lda #0
	sta tmp1
	lda #4
	sta editor
	lda #0
	sta passmode
	jsr zero
	ldx #0
	jsr putvar ;an$
	lda $96
	pha
	lda $71
	pha
	lda $72
	pha
	lda len1
	pha
	jsr inline0
	pla
	sta len1
	pla
	sta $72
	pla
	sta $71
	pla
	sta $96
	rts
;
;* £l - send output to printer
coml:
	txa
	and #1
	sta mprtr
	rts
;
;* £m - margin set
@comm:
	ldx mnum2
	cmp #'<'
	bne comm1
	stx mleft
comm1:
	cmp #'>'
	bne comm2
	stx mright
comm2:
	inc $96
	rts
;
;* £n - send carriage returns
comn:
	lda #13
	jmp repchr
;
;* £o - output 19 characters
como:
	ldx #19
	jmp repchr
;
;* £p - set print mode
comp:
	stx mprint
	rts
;
;* £q - reset mci settings
comq:
	beq comq1
	stx comqc
comq1:
	jsr comc
	lda #0
	sta mjump
	sta mnum
	sta mreverse
	sta mprtr
	sta mprint
	sta mspeed
	sta mkolor
	sta mdigits
	sta mci
	sta mleft
	sta mright
	jmp comu1
;
;* £r - reverse mode
comr:
	txa
	and #1
	lsr
	ror
	eor #$92
	sta $fe
	jmp outchr
;
;* £s - set print speed
coms:
	stx mspeed
	rts
;
;* £t - compare to buffer
comt:
	cpx #2
	bne comt1
	ldx #24
	jsr usevar ;ac%
	lda var+1
	and #$0f
	ora #'0'
	sta buffer
comt1:
	lda #<buffer
	sta coma2+1
	lda #>buffer
	sta coma2+2
	ldx #0
	jmp coma1
;
;* £u - uppercase mode
comu:
	txa
comu1:
	and #1
	sta mupcase
	lsr
	ror
	eor #$0e
	sta $fe
	jmp outchr
;
;* £v - print variable
comv:
	stx mcom
	jsr mcivar
comv0:
	lda var
	sta comv1+1
	lda var+1
	sta comv3+1
	lda var+2
	sta comv3+2
	lda #0
	sta comv2+1
comv1:
	lda #$ff
comv2:
	cmp #$ff
	beq comv6
	ldy comv2+1
comv3:
	lda $ffff,y
	sta $fe
	ldx mcom
	cpx #2
	bcs comv4
	sta datebuf,y
	jmp comv5
comv4:
	jsr domode
comv5:
	inc comv2+1
	jmp comv1
comv6:
	ldx mcom
	cpx #2
	bcs comv8
	jsr convert
	lda #0
	sta comv2+1
comv7:
	ldy comv2+1
	lda date1,y
	sta $fe
	jsr output
	inc comv2+1
	lda comv2+1
	cmp #25
	bcc comv7
comv8:
	rts
;
;* £w - wait
comw:
	beq comw2
	inx
comw1:
	lda scs
comw2:
	cmp scs
	beq comw3
	dex
	bne comw1
comw3:
	rts
;
;* £x - abort file read
comx:
	lda #32
	sta chat
	rts
;
;* £y - yes/no £y£(d|e)n
comy:
	txa
	and #1
	jsr comy0
	stx mresult
	rts
;
comy0:
	pha
	lda #1
	sta $d001
	jsr xgetchr
	tax
	pla
	cpx #'N'
	bne comy1
	lda #0
comy1:
	cpx #'Y'
	bne comy2
	lda #1
comy2:
	cmp #0
	rts
;
cvar:
	lda $96
	pha
	lda $71
	pha
	lda $72
	pha
	lda mchr
	and #$7f
	ldx #0
	jsr usevar0
	lda $62
	sta $66
	ora #$80
	sta $62
	jsr fpout
	lda #0
	sta cvar1+1
	lda $0100
	cmp #' '
	beq cvar2
cvar1:
	lda $0100
	beq cvar3
	sta $fe
	jsr output
cvar2:
	inc cvar1+1
	bne cvar1
cvar3:
	pla
	sta $72
	pla
	sta $71
	pla
	sta $96
	rts

;* £# - length of field / fill chr
clen:
	lda mchr
	cmp #$30
	bcc clen1
	cmp #$3a
	bcs clen1
	lda mnum
	cmp #5
	bcc *+3
	lda #5
	sta mdigits
	lda #'0'
clen1:
	sta cnumc
	rts

;* £$ - print string variable
cstr:
	lda #2
	sta mcom
	lda mchr
	ldx #$80
	jsr usevar0
	jmp comv0
;
;* £% - print integer variable
cnum:
	lda mchr
	ora #$80
	ldx #$80
	jsr usevar0
	ldx var
	lda var+1
prax:
	jsr decimal
	ldy #0
	sty cnumf
	ldx mdigits
	beq cnum1
	lda #5
	sec
	sbc mdigits
	tay
cnum1:
	sty cnumd
	lda decchr,y
	cpy #4
	bcs cnum2
	ldx cnumf
	bne cnum2
	cmp #'0'
	bne cnum2
	ldx mdigits
	beq cnum3
	lda cnumc
	sta $fe
	jsr domode
	jmp cnum3
cnum2:
	sta $fe
	jsr domode
	inc cnumf
cnum3:
	ldy cnumd
	iny
	cpy #5
	bne cnum1
	rts
cnumf:
	byte 0
cnumd:
	byte 0
cnumc:
	byte '0'
;
;£<- - mci tab
ctab:
	inc $96
	lda mval
	cmp scnpos
	bcc ctab0
	beq ctab0
	cmp #40
	bcs ctab0
ctab1:
	lda #' '
	sta $fe
	jsr output
	lda mval
	cmp scnpos
	bne ctab1
ctab0:
	rts
;
;* repeat a character(£b,£h,£n,£o)
repchr:
	sta tmp5
	cpx #0
	beq repchr2
	stx tmp2
repchr1:
	lda tmp5
	sta $fe
	jsr domode
	dec tmp2
	bne repchr1
repchr2:
	rts

;* not an mci command
notc:
	dec $96
		dec $96
	lda #'{pound}'
notc1:
	cmp #$04
	bne domode
;
;* handle ctrl-d in string
	ldx #0
dodate:
	inc $96
	ldy $96
	lda ($71),y
	sta datebuf,x
	inx
	cpx #11
	bne dodate
	jsr convert
	lda #0
	sta index
dodate1:
	ldy index
	lda date1,y
	beq dodate2
	sta $fe
	jsr output
	inc index
	bne dodate1
dodate2:
	rts
;
;* do print modes
domode:
	sta $fe
	ldx mprint
	bne domode0
	jsr dospeed
	jmp output
domode0:
	jsr chkspcl
	and #$7f
	cmp #32
	bcs domode1
	jmp output
domode1:
	lda $fe
	sta tmp4
	txa
	and #15
	tax
	lda pmodetbl,x
	sta domode2+1
domode2:
	ldx #16
	lda pmodetbl,x
	beq domode5
	cmp #$ff
	beq domode6
domode3:
	sta $fe
	jsr output
	inc domode2+1
	bne domode2
domode5:
	rts
domode6:
	jsr dospeed
	lda tmp4
	jmp domode3
;
;* do print speed
dospeed:
	ldx mspeed
	beq dokolor
	jsr tenwait
;* do kolorific
dokolor:
	lda mkolor
	beq donone
	ldx mcolor
dokolor1:
	inx
	txa
	and #15
	beq dokolor1
	sta mnum
	lda $fe
	pha
	jsr comc
	pla
	sta $fe
donone:
	rts
;
; wait for .x tenths of a second
tenwait:
	cpx #0
	beq tnw3
tnw1:
	lda ten
tnw2:
	cmp ten
	beq tnw2
	dex
	bne tnw1
tnw3:
	rts
