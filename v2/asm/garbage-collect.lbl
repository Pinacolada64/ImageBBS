; print fre(0) - (fre(0)<0) * 65536
orig $c000

;
; image 2.0 garbage collection
;

hi	= 51
size	= 128

tdisp	= $0400+(40*24)	; screen RAM, last row

;
; setup gc parameters
;
initgc:
	lda #$c7	; "G"
	sta tdisp+31
	lda 3
	pha
	lda 4
	pha
	lda 5
	pha
	lda 6
	pha
	lda 7
	pha
	lda 8
	pha
	lda 49
	ldx 50
	sta lo
	stx lo+1
	lda 55
	ldx 56
	sta hi
	stx hi+1
gc0:
	lda #0
	sta index
; loop thru scalars
	lda 45
	ldx 46
	sta 3
	stx 4
gc1:
	lda 3
	cmp 47
	bne gc1a
	lda 4
	cmp 48
	beq gc4
gc1a:
	ldy #0
	lda (3),y
	bmi gc2
	iny
	lda (3),y
	bpl gc2
	lda #2
	jsr add3
	ldy #0
	jsr dostr
	lda #5
	jsr add3
	jmp gc1
gc2:
	lda #7
	jsr add3
	jmp gc1

; loop through arrays

gc4:
	lda 3
	cmp 49
	bne gc4a
	lda 4
	cmp 50
	beq gc6
gc4a:
	ldy #0
	lda (3),y
	bmi gc5
	iny
	lda (3),y
	bpl gc5
	iny
	jsr doarray
gc5:
	ldy #2
	clc
	lda 3
	adc (3),y
	tax
	iny
	lda 4
	adc (3),y
	stx 3
	sta 4
	jmp gc4
gc6:
	lda index
	beq gc7
	jsr collect
	lda index
	cmp #size
	beq gc0
gc7:
	pla
	sta 8
	pla
	sta 7
	pla
	sta 6
	pla
	sta 5
	pla
	sta 4
	pla
	sta 3
	lda #$a0
	sta tdisp+31	; turn off "G"
	rts

add3:
	clc
	adc 3
	sta 3
	bcc add3a
	inc 4
add3a:
	rts

doarray:
	clc
	lda (3),y
	adc 3
	sta 7
	iny
	lda (3),y
	adc 4
	sta 8
	lda 3
	pha
	lda 4
	pha
	iny
	lda (3),y
	asl
	clc
	adc #5
	jsr add3
doarray1:
	lda 3
	cmp 7
	bne doarray2
	lda 4
	cmp 8
	beq doarray3
doarray2:
	ldy #0
	jsr dostr
	clc
	lda 3
	adc #3
	sta 3
	bcc doarray1
	inc 4
	jmp doarray1
doarray3:
	pla
	sta 4
	pla
	sta 3
	rts

dostr0:
	rts
dostr:
	lda (3),y
	tax
	iny
	lda (3),y
	sta 5
	iny
	lda (3),y
	sta 6
	cpx #0
	beq dostr0
	lda 5
	cmp lo
	lda 6
	sbc lo+1
	bcc dostr0
	lda 5
	cmp hi
	lda 6
	sbc hi+1
	bcs dostr0
	ldx index
	beq dostr4
	ldx #0
dostr1:
	lda 6
	cmp tbldh,x
	bcc dostr6
	bne dostr2
	lda 5
	cmp tbldl,x
	bcc dostr6
	beq dostr5
dostr2:
	stx temp
	cpx #size-1
	beq dostr4
	ldx #size-1
dostr3:
	lda tblpl-1,x
	sta tblpl,x
	lda tblph-1,x
	sta tblph,x
	lda tbldl-1,x
	sta tbldl,x
	lda tbldh-1,x
	sta tbldh,x
	dex
	cpx temp
	bne dostr3
dostr4:
	lda 3
	sta tblpl,x
	lda 4
	sta tblph,x
	lda 5
	sta tbldl,x
	lda 6
	sta tbldh,x
	lda index
	cmp #size
	beq dostr5
	inc index
dostr5:
	rts
dostr6:
	inx
	cpx index
	bcc dostr1
	cpx #size
	bcc dostr4
	rts

collect0:
	rts
collect:
	ldx #0
collect1:
	cpx index
	beq collect0
	lda tblpl,x
	sta 3
	lda tblph,x
	sta 4
	lda tbldl,x
	sta 5
	lda tbldh,x
	sta 6
	stx temp
	ldy #0
	lda (3),y
	tax
	sec
	lda hi
	sbc (3),y
	sta hi
	lda hi+1
	sbc #0
	sta hi+1
	txa
	tay
	dey
collect2:
	lda (5),y
	sta (hi),y
	dey
	dex
	bne collect2
	ldy #1
	lda hi
	sta (3),y
	iny
	lda hi+1
	sta (3),y
	ldx temp
	inx
	jmp collect1

index:
	byte $00
temp:
	byte $00
lo:
	word $0000
tblpl:
	area size
tblph:
	area size
tbldl:
	area size
tbldh:
	area size
