;	print"12/27/90 04:10p"
;
;********************************
;* variable handling routines *
;********************************

	;* get descriptor for tt$(.x)
getarr:
	jsr findarr
	ldy #2
	jmp usevar1
;
;* get and copy memory to buffer
;
getln:
	jsr getarr
	ldy var
	sty index
getln0:
	dey
	cpy #$ff
	beq getln1
	cpy #80
	bcs getln0
	lda (var+1),y
	sta buffer,y
	jmp getln0
getln1:
	rts
;
;* print tt$(.a)
;
prtln:
	jsr getarr
	jmp outstr
;
;* put descriptor for tt$(.x) and
;* store buffer in memory
;
putarr:
	jsr findarr
	ldy #2
	jmp putvar1
;
;* put and store string
;
putln:
	txa
	pha
	lda index
	jsr makeroom
	ldy index
	beq putln2
	dey
putln1:
	lda buffer,y
	sta (var+1),y
	dey
	bpl putln1
putln2:
	pla
	tax
	jmp putarr
;
;* find descriptor for tt$(.x)
;
findarr:
	stx $47
	lda #0
	asl $47
	rol
	sta $48
	txa
	clc
	adc $47
	sta $47
	lda #0
	adc $48
	sta $48
	clc
	lda $2f
	adc $47
	sta $47
	lda $30
	adc $48
	sta $48
	clc
	lda #7
	adc $47
	sta $47
	lda #0
	adc $48
	sta $48
	rts
;
;* find BASIC variable
;
gvarptr:
	txa
	asl
	tay
	clc
	lda vars,y
	adc vartab	; $2d
	tax
	lda vars+1,y
	adc vartab+1	; $2e
	tay
	rts
@varnam:
	jsr gvarptr
	stx $47
	sty $48
	rts
findvar:
	sta $45
	stx $46
	jmp findvar1
;
;* print string variable
;
prtvar:
	jsr usevar
	jmp outstr
;
;* print string variable w/mci
;
prtvar0:
	lda mci
	pha
	lda #0
	sta mci
	jsr prtvar
	pla
	sta mci
	rts
;
;* get variable descriptor
;
usevar:
	jsr <@varnam
	jmp usevar2
usevar0:
	jsr findvar
usevar2:
	ldy #4
usevar1:
	lda ($0047),y	; varpnt
	sta ($0061),y	; var
	dey
	bpl usevar1
	rts
;
;* put variable descriptor
;
putvar:
	jsr <@varnam
	jmp putvar2
putvar0:
	jsr findvar
putvar2:
	ldy #4
putvar1:
	lda ($0061),y	; var
	sta ($47),y	; varpnt
	dey
	bpl putvar1
	rts

zero:
	lda #0
	ldy #4
zero1:
	sta $0061,y	; var
	dey
	bpl zero1
	rts
minusone:
	jsr zero
	lda #$81
	sta var
	rts

	;********************************
	;* variables used by ml *
	;********************************
vars:
	ascii "aN"	;  0-an$
	ascii "a{$80}"	;  1-a$
	ascii "b{$80}"	;  2-b$
	ascii "tR"	;  3-tr$ [? rns]
	ascii "d{$b1}"	;  4-d1$
	ascii "d{$b2}"	;  5-d2$
	ascii "d{$b3}"	;  6-d3$
	ascii "d{$b4}"	;  7-d4$
	ascii "d{$b5}"	;  8-d5$
	ascii "lD"	;  9-ld$
	ascii "tT"	; 10-tt$
	ascii "nA"	; 11-na$
	ascii "rN"	; 12-rn$
	ascii "pH"	; 13-ph$
	ascii "aK"	; 14-ak$
	ascii "lp"	; 15-lp
	ascii "pl"	; 16-pl
	ascii "rc"	; 17-rc
	ascii "sh"	; 18-sh
	ascii "mw"	; 19-mw
	ascii "nl"	; 20-nl
	ascii "ul"	; 21-ul
	ascii "qe"	; 22-qe
	ascii "rq"	; 23-rq
	ascii "AC"	; 24-ac%
	ascii "ef"	; 25-ef
	ascii "lf"	; 26-lf
	ascii "w{$80}"	; 27-w$
	ascii "p{$80}"	; 28-p$
	ascii "TR"	; 29-tr%
	ascii "A{$80}"	; 30-a%
	ascii "B{$80}"	; 31-b%
	ascii "DV"	; 32-dv%
	ascii "dR"	; 33-dr$
	ascii "c{$b1}"	; 34-c1$
	ascii "c{$b2}"	; 35-c2$
	ascii "cO"	; 36-co$
	ascii "cH"	; 37-ch$
	ascii "KP"	; 38-kp%
	ascii "c{$b3}"	; 39-c3$
	ascii "f{$b1}"	; 40-f1$
	ascii "f{$b2}"	; 41-f2$
	ascii "f{$b3}"	; 42-f3$
	ascii "f{$b4}"	; 43-f4$
	ascii "f{$b5}"	; 44-f5$
	ascii "f{$b6}"	; 45-f6$
	ascii "f{$b7}"	; 46-f7$
	ascii "f{$b8}"	; 47-f8$
	ascii "mP"	; 48-mp$
	ascii "MN"	; 49-mn%
