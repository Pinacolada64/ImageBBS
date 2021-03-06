orig $c000
{uses:..\equates-2_0.asm}

; assemble with casm 4.0:
; wine casm.exe visual.lbl -prg:"++ visual.prg" -ovr

; legacy "fast assembler" code:
; rem open 15,8,15,"s:ml.visual":close 15
; for pass=1 to 3:org $c000,-(pass=3),8,"ml.visual":print"Pass:"pass


;
;*********************
;* visual editor
;*********************
;
; usetbl1 = $cd03
; buffer = $ce77
; buf2 = $ce27
;
numx = $14
numy = $15

; modes = $03ff	; 1023
; lines = $03fe	; 1022
; cline = $03fb	; 1019	; current line being entered/edited?
; flags = $03fa	; 1018
; comm	= $03f9	; 1017
; mline = $03f8	; 1016
; temp3 = $03f7	; 1015
; case1 = $03f4	; 1012
; flag1 = $03f3	; 1011
;
; colors = $e8da ; flashing chat page colors
;
	jsr visual
;	jsr visual31	; does not exist
	jmp visual2	; print lines entered?
;
visual:
	lda #1
	sta editor
	ldy #0
visual0:
	lda #'{rvrs off}'
	sta buf2,y
	iny
	lda #'{white}'
	sta buf2,y
	iny
	lda #' '
	sta buf2,y
	iny
	cpy #3*39
	bcc visual0
	sty index
	ldx #23
	stx numx
visual1:
	ldx numx
	jsr vputlnx
	dec numx
	bne visual1
	lda #1
	sta crsrc
	sta crsrx
	sta crsry
	lda #0
	sta crsrr
	lda #'{clear}'
	jsr xchrout
	jmp visual4

visual2:
	lda #'{clear}'
	jsr xchrout
	ldx #1
	stx numx
visual3:
	ldx numx
	jsr prtln
	lda #13
	jsr xchrout
	inc numx
	ldx numx
	cpx #24
	bcc visual3

	jsr crsrpos
visual4:
	ldx crsry
	jsr getdes

visual5:
	jsr xgetin
	pha
	and #$7f
	cmp #32
	pla
	bcc visual9
visual6:
	pha
	lda crsrx
	asl
	clc
	adc crsrx
	tay
	dey
	dey
	dey
	ldx crsrr
	lda revers,x
	sta (var+1),y
	iny
	ldx crsrc
	lda colors,x
	sta (var+1),y
	iny
	pla
	sta (var+1),y
	jsr xchrout
	inc crsrx
	lda crsrx
	cmp #40
	bne visual5
visual7:
	lda crsry
	cmp #23
	bcs visual8
	lda #13
	jsr xchrout
	lda #0
	sta crsrr
	lda #1
	sta crsrx
	inc crsry
	jmp visual4
visual8:
	lda #1
	sta crsrx
	sta crsry
	lda #0
	sta crsrr
	lda #'{home}'
	jsr xchrout
	jmp visual4
;
visual9:
	cmp #'{up}'
	bne visual10
	ldx crsry
	cpx #1
	beq visual10
	dec crsry
	jmp visual23
visual10:
	cmp #'{down}'
	bne visual11
	ldx crsry
	cpx #23
	beq visual11
	inc crsry
	jmp visual23

visual11:
	cmp #'{right}'
	bne visual12
	ldx crsrx
	cpx #39
	beq visual12
	inc crsrx
	jmp visual23
visual12:
	cmp #'{left}'
	bne visual13
	ldx crsrx
	cpx #1
	beq visual13
	dec crsrx
	jmp visual23

visual13:
	cmp #'{clear}'
	bne visual14
	jmp visual
visual14:
	cmp #013
	bne visual15
	jmp visual7
visual15:
	cmp #'{022}' ; ctrl-v
	bne visual16
	jmp visual2
visual16:
	cmp #'{024}' ; ctrl-x
	bne visual17
	jmp visual25
visual17:
	cmp #'{rvrs on}'
	bne visual18
	ldx #1
	jmp visual24
visual18:
	cmp #'{rvrs off}'
	bne visual19
	ldx #0
	jmp visual24
visual19:
	ldx #15
visual20:
	cmp colors,x
	beq visual21
	dex
	bne visual20
	jmp visual5
visual21:
	stx crsrc
	jsr xchrout
visual22:
	jsr xchrout
	jmp visual5
;
visual23:
	jsr xchrout
	jmp visual4
;
visual24:
	stx crsrr
	jmp visual22
;
visual25:
	ldx #23
	sta numx
	lda #0
	sta crsrc
visual26:
	ldx numx
	jsr getdes
	ldy #0
	ldx #0
	lda #'{rvrs off}'
	sta crsrr
visual27:
	lda (var+1),y
	iny
	cmp crsrr
	beq visual28
	sta crsrr
	sta buffer,x
	inx
	cpx #80
	beq visual30
visual28:
	lda (var+1),y
	iny
	cmp crsrc
	beq visual29
	sta crsrc
	sta buffer,x
	inx
	cpx #80
	beq visual30
visual29:
	lda (var+1),y
	iny
	sta buffer,x
	inx
	cpx #80
	beq visual30
	cpy #3*39
	bcc visual27
visual30:
	stx index
	ldx numx
	jsr putln
	dec numx
	bne visual26
	rts

getdes:
	lda #33
	jmp usetbl1
putdes:
	lda #34
	jmp usetbl1
xgetin:
	lda #23
	jmp usetbl1
xchrout1:
	lda #24
	jmp usetbl1
putln:
	lda #36
	jmp usetbl1
prtln:
	lda #39
	jmp usetbl1
;
xchrout:
	sta $fe
	pha
	jsr xchrout1
	pla
	rts
;
revers:
	byte 18+128,18 ; {rvrs off},{rvrs on}
;
crsrpos:
	lda #'{home}'
	jsr xchrout
	ldx crsry
	cpx #1
	beq crsrpos2
crsrpos1:
	lda #'{down}'
	jsr xchrout
	dex
	cpx #1
	bne crsrpos1
crsrpos2:
	ldx crsrx
	cpx #1
	beq crsrpos4
crsrpos3:
	lda #'{right}'
	jsr xchrout
	dex
	cpx #1
	bne crsrpos3
crsrpos4:
	rts

;
;* put and store string
;
vputlnx:
	txa
	pha
	lda 1
	pha
	lda #$37
	sta 1
	lda index
	jsr makerm1
	pla
	sta 1
	ldy index
	beq vputln2
	dey
vputln1:
	lda buf2,y
	sta (var+1),y
	dey
	bpl vputln1
vputln2:
	pla
	tax
	jmp putdes
;
crsrx:
	byte 0
crsry:
	byte 0
crsrc:
	byte 0	; cursor column?
crsrr:
	byte 0	; cursor row?
