; 05/29/91 09:24p
; "outm" symbol is in "screen-handler.asm"
getmod:
	jsr getmdm
	sta $fe
	ldx #9
	ldy #5 ;cht-r
	jsr chkflags
	beq getmod0
	lda #0
	sta $fe
	rts
getmod0:
	ldx #16
	ldy #5 ;asc-l
	jsr chkflags
	beq getmod1
	ldx $fe
	lda tblatc,x
	sta $fe
getmod1:
	lda $fe
	beq getmod3
	ldx getmodn
	cmp getmodt,x
	bne getmod2
	inx
	stx getmodn
	cpx #5
	bcc getmod3
	pha
	lda bsnpre	; serial # prefix
	jsr outm
	lda bsnval+1
	jsr outh
	lda bsnval	; serial #
	pha
	lsr
	lsr
	lsr
	lsr
	jsr outh
	pla
	jsr outh
	pla
getmod2:
	ldx #0
	stx getmodn
getmod3:
	cmp #0
	rts
getmodn:
	byte 0
getmodt:
	byte 9,13,1,7,5 ;image
outh:
	and #$0f
	ora #$30
	cmp #$3a
	bcc outh1
	adc #6
outh1:
	jmp outm

outmodh:
	ldx interm
	bne outmodh1
	jsr outm
	lda #' '
	jsr outm
outmodh1:
	lda #08	; ctrl-h
	jmp outm

outmod:
	ldx #16
	ldy #5 ;asc-l
	jsr chkflags
	bne outmod0
	lda $fe
	jmp outm
outmod0:
	ldx #19
	ldy #5 ;ans-r
	jsr chkflags
	tax
	lda $fe
	and #$1f
	tay
	lda $fe
	cpx #0
	beq outmod0e
	cmp #096
	bcc outmod0e
	cmp #128
	bcc outmod0a
	cmp #160
	bcc outmod0e
	cmp #192
	bcc outmod0d
	cmp #224
	bcs outmod0e
outmod0a:
	lda mupcase
	bne outmod0c
	lda tblcta2,y
	bne outmod1
outmod0c:
	lda tblcta3,y
	bne outmod1
outmod0d:
	lda tblcta1,y
	bne outmod1
outmod0e:
	tax
	lda tblcta,x
	beq outmod3
outmod1:
	pha
	and #$7f
	cmp #32
	pla
	bcc outmod1a
	jmp outm
outmod1a:
	ldx #18
	ldy #5 ;ans-l
	pha
	jsr chkflags
	tax
	pla
	cmp #08	; ctrl-h, backspace
	beq outmodh
	cmp #13
	beq outmodm
	cmp #12	; form-feed?
	beq outmodl
	cpx #0
	beq outmod3
	cmp #'{up}'
	beq outmodup
	cmp #'{down}'
	beq outmoddn
	cmp #'{right}'
	beq outmodrt
	cmp #'{left}'
	beq outmodlf
	cmp #'{rvrs off}'
	beq outmodr0
	cmp #'{rvrs on}'
	beq outmodr1
	cmp #'{home}'
	beq outmodhm
	jsr colorchk
	bcs outmod3
	jmp outmodc
outmod3:
	rts

outmodm:
	lda interm
	bne outmodm1
	cpx #0
	beq outmodm1
	jsr outmodr0
outmodm1:
	ldx #17
	ldy #5	; asc-r
	jsr chkflags
	php
	lda #13
	plp
	beq outmodm2
	jsr outm
	lda #10
outmodm2:
	jmp outm

outmodup:
	lda #$41
	bne ansicom
outmoddn:
	lda #$42
	bne ansicom
outmodrt:
	lda #$43
	bne ansicom
outmodlf:
	lda #$44
ansicom:
	pha
	lda #27
	jsr outm
	lda #'['
	jsr outm
	pla
	jmp outm

outmodr0:
	lda #'3'
	ldx #'4'
	bne outmodr
outmodr1:
	lda #'4'
	ldx #'3'
outmodr:
	sta ansir1
	stx ansir2
	jmp ansi

outmodl:
	cpx #0
	bne outmodl1
	jmp outm
outmodl1:
	lda #'2'
	jsr ansicom
	lda #$4a
	jmp outm

outmodhm:
	lda #'1'
	jsr ansicom
	lda #';'
	jsr outm
	lda #'1'
	jsr outm
	lda #$48
	jmp outm

outmodc:
	ldx #15
outmodc2:
	cmp colors,x
	beq outmodc3
	dex
	bne outmodc2
outmodc3:
	lda ansiclrs,x
	sta ansicol
	lda ansiints,x
	sta ansiint
ansi:
	ldy #0
ansi1:
	tya
	pha
	lda ansibuf,y
	beq ansi2
	jsr outm
	pla
	tay
	iny
	bne ansi1
ansi2:
	pla
	rts

ansiclrs:	ascii "7716524333107247"
ansiints:	ascii "0100000100110110"
ansibuf:	ascii "{27}[0;"
ansiint:	ascii "0;"
ansir1:		ascii "3"
ansicol:	ascii "1;"
ansir2:		ascii "4"
ansibak:	ascii "0"
		byte $6d, 0
