; "string-io.lbl 12/26/90 01:28a"
;*
;* string output routines *
;*
;
;* output string
outstr:
	lda #0
	sta $96
	lda var
	sta len1
	lda var+1
	sta $71
	lda var+2
	sta $72
	jsr gettsr
	beq outstr0
	lda flag
	bne outstr5
outstr0:
	lda mjump
	beq outstr1
	dec mjump
	beq outstr1
	bne outstr5
outstr1:
	jsr zero
	ldx #17
	jsr putvar ;rc
	ldx #15
	jsr usevar ;lp
	ldx #0
	lda var
	beq outstr2
	inx
outstr2:
	stx wrapflg
	lda #0
	sta lastout
	jsr outstr7
	jsr zero
	lda chat
	sta var+1
	ldx #38
	jsr putvar ;kp%
	lda chat
	beq outstr3
	jsr minusone
	ldx #17
	jsr putvar ;rc
	jsr zero
	ldx #18
	jsr putvar ;sh
	lda chat
	cmp #'/'
	bne outstr3
	lda #$86
	sta var
	lda #$3c
	sta var+1
	ldx #18
	jsr putvar ;sh

outstr3:
	lda wrapflg
	beq outstr6
	lda lastout
	cmp #32
	beq outstr5
outstr4:
	lda #13
	sta $fe
	jsr output
outstr5:
	jsr zero
	ldx #15
	jsr putvar ;lp
outstr6:
	rts

lastout:
	byte 0

outstr7:
	jsr setoutmd
	lda #0
	sta chat
	jsr carchk
	cmp #1
	bne outstr8
	lda #'/'
	sta chat
	rts

outstr8:
	lda len1
	beq outstr11
	ldy $96
outstr9:
	sty $96
	lda ($71),y
	sta $fe
	sta lastout
	jsr domci
	jsr moreprmt
	lda chat
	beq outstr10
	lda wrapflg
	beq outstr10
	lda readmode
	bne outstr10
	rts

outstr10:
	ldy $96
	iny
	cpy len1
	bcc outstr9
outstr11:
	rts

convtbl:
	byte <convan0,<convstr
	byte <convstr,<convstr
	byte <convstr,<newdate
	byte <strscan
convtbh:
	byte >convan0,>convstr
	byte >convstr,>convstr
	byte >convstr,>newdate
	byte >strscan

; manipluate an$
convan:
	cpx #7
	bcs cjmp
	lda convtbl,x
	sta cjmp+1
	lda convtbh,x
	sta cjmp+2
cjmp:
	jmp convan0

convan0:
	ldx #0
	jsr usevar ;an$
	ldy #10
convan1:
	lda (var+1),y
	sta datebuf,y
	dey
	bpl convan1
	jsr convert
	lda #20
	jsr makeroom
	ldy #19
convan2:
	lda date1+4,y
	sta (var+1),y
	dey
	bpl convan2
	ldx #0
	jmp putvar ;an$

ctrlchk0:
	pha
	and #$7f
	cmp #32
	pla
	rts

;
; carry clear if control char
;
ctrlchk:
	pha
	lda editor
	and #1
	beq ctrlch0
	pla
ctrlchk1:
	jsr colorchk
	bcc ctrlch2
	jsr ctrlchk2
	bcc ctrlch2
	pha
ctrlch0:
	pla
	cmp #32
	bcc ctrlch1
	cmp #128
	bcc ctrlch2
	cmp #160
	bcs ctrlch2
	cmp #133
	bcc ctrlch1
	cmp #141
	bcs ctrlch1
ctrlch2:
	sec
	rts
ctrlch1:
	clc
	rts

; exits with carry clear if color char
colorchk:
	sty cytmp
	ldy #15
colrch0:
	cmp colors,y
	beq colrch1
	dey
	bne colrch0
	ldy cytmp
	sec
	rts
colrch1:
	ldy cytmp
	clc
	rts

ctrlchk2:
	cmp #'{rvrs on}'
	beq ctrlch2a
	cmp #'{rvrs off}'
	beq ctrlch2a
	cmp #'{down}'
	beq ctrlch2a
	cmp #'{up}'
	beq ctrlch2a
	cmp #'{left}'
	beq ctrlch2a
	cmp #'{right}'
	beq ctrlch2a
	sec
	rts

ctrlch2a:
	clc
	rts

more0:
	rts
moreprmt:
	lda local
	bne more0
	lda usrlinm
	beq more0
	lda usrlin
	cmp usrlinm
	bcc more0
	ldx #34
	ldy #5
	jsr chkflags
	beq more0
	lda #0
	sta usrlin
	ldx #4
l1:
	lda var,x
	pha
	dex
	bpl l1
	ldx #48
	jsr usevar ;mp$
	ldy #0
l2:
	lda (var+1),y
	jsr xchrout
	iny
	cpy var
	bcc l2
	lda #1
	jsr comy0
	bne more1
	lda #'/'
	sta chat
more1:
	ldy #0
l3:
	lda #20
	jsr xchrout
	iny
	cpy var
	bcc l3
	ldx #0
l4:
	pla
	sta var,x
	inx
	cpx #5
	bcc l4
	rts

newdate:
	ldx #0
	jsr usevar ;an$
	lda var
	cmp #11
	bne newd0
	ldy #7
	lda (var+1),y
	and #'1'
	cmp #'1'
	bne newd2
	iny
	lda (var+1),y
	cmp #'2'
	bne newd2
	lda #'0'
	sta (var+1),y
	dey
	lda (var+1),y
	and #'8'
	sta (var+1),y
newd2:
	dec var
	inc var+1
	bne newd1
	inc var+2
newd1:
	ldx #0
	jsr putvar ;an$
newd0:
	rts

; &,15,6? - rns
strscan:
	sty strsc2+1
	ldx #0
	jsr usevar ;an$
	ldy #0
	ldx #0
	lda var
	beq strsc3
strsc1:
	lda (var+1),y
	dec var
	inc var+1
	bne strsc2
	inc var+2
strsc2:
	cmp #32
	beq strsc3
	sta buf2,x
	inx
	lda var
	bne strsc1
strsc3:
	stx index
	ldx #0
	jsr putvar ;an$
	lda index
	sta var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #1
	jmp putvar ;a$
