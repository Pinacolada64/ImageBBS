;	print"04/04/90 05:59p"
inline:
	lda #00
	byte $2c
clrarr:
	lda #11
	byte $2c
sound:
	lda #25
	byte $2c
inline0:
	lda #63
	byte $2c
convstr:
	lda #64
	byte $2c
convert:
	lda #65
	jmp usetbl1	; $cd03
copyrite:
	lda #67
	jsr usetbl1	; $cd03
	jmp outastr	; $cd00, defined in build.asm

;
; passed address in x (hi),y (lo)
;
caller:
	sty calljmp+1
	cpx callpage
	beq caller2
	lda callpage
	beq caller1
	jsr callswap
	jsr caller1
	jsr callswap
	lda 780
	rts

caller1:
	lda callpage
	pha
	stx callpage
	jsr callswap
	jsr caller2
	jsr callswap
	pla
	sta callpage
	lda 780
	rts

caller2:
	lda 780
	ldx 781
	ldy 782
calljmp:
	jsr $c000
	sta 780
	stx 781
	sty 782
	rts

callswap:
	pha
	txa
	pha
	tya
	pha
	lda callpage
	ldx #4 ;swap1/2
	cmp #>$f400
	bcs callswp1
	ldx #6 ;struct
	cmp #>$ee00
	bcs callswp1
	ldx #10 ;ecs
	cmp #>$e400
	bcs callswp1
	ldx #4 ;gc
callswp1:
	ldy #>$c000
	jsr swapper
	pla
	tay
	pla
	tax
	pla
	rts

callpage:
	byte 0
calltemp:
	byte 0
