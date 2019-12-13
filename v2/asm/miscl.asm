; miscl.s "06/01/91 05:33p"
{info:build.sym}
{info:equates-2_0.sym}

callmod:
	ldx #<imodline
	ldy #>imodline
	jmp mlgosub

calcgoto:
	txa
	pha
	ldx #30
	jsr usevar ;a%
	ldx var+1
	ldy var
	pla
	bne calcgot1
	jmp mlgoto
calcgot1:
	jmp mlgosub

stcount:
	byte 0
stsize:
	byte 0

struct:
	sty stcount
	cpx #0
	beq putstruc
	cpx #1
	beq getstruc
	lda #68
	jmp usetbl1

putstruc:
	jsr fnvar1
	jsr evalstr
	sta stsize
	ldy #0
	tax
	beq puts2
puts1:
	lda ($22),y
	sta ($14),y
	iny
	cpy stcount
	bcs puts3
	dex
	bne puts1
puts2:
	lda #0
	sta ($14),y
	iny
	cpy stcount
	bcc puts2
puts3:
	rts

getstruc:
	jsr fnvar1
	jsr fnvar
	ldy #0
gets1:
	lda ($14),y
	beq gets1a
	iny
	cpy stcount
	bcc gets1
gets1a:
	sty stcount
	tya
	jsr makeroom
	ldy #0
gets2:
	lda ($14),y
	sta ($62),y
	iny
	cpy stcount
	bcc gets2
	ldy #4
gets3:
	lda $0061,y
	sta ($47),y
	dey
	bpl gets3
	rts

cursmenu:
	stx cursm1+1
	sty cursmx+1
	lda #1
	sta case
	jsr fnvar
	stx curscalc+1
	sty cursc0+1
cursm1:
	ldx #0
	jsr curscalc
cursm2:
	jsr xgetin
	cmp #13
	beq cursm3
	cmp #'['
	bne cursm5
	jsr xgetin
	ldy #2
	cmp #'A'
	beq cursm4
	iny
	cmp #'B'
	beq cursm4
	iny
	cmp #'C'
	beq cursm4
	iny
	cmp #'D'
	beq cursm4
	jmp cursm2
cursm5:
	ldy #2
	cmp #'{up}'
	beq cursm4
	iny
	cmp #'{down}'
	beq cursm4
	iny
	cmp #'{right}'
	beq cursm4
	iny
	cmp #'{left}'
	beq cursm4
	ldx curscalc+1
	stx $14
	ldx cursc0+1
	stx $15
cursm6:
	ldx #0
	ldy #7
cursm7:
	cmp ($14),y
	beq cursm8
	pha
	clc
	lda $14
	adc #8
	sta $14
	lda $15
	adc #0
	sta $15
	pla
	inx
cursmx:
	cpx #1
	bcc cursm7
	jmp cursm2
cursm8:
	stx cursm1+1
	jsr curscalc
cursm3:
	lda cursm1+1
	sta var+1
	lda #0
	sta var
	ldx #30
	jmp putvar ;a%
cursm4:
	lda ($22),y
	cmp #255
	beq cursm9
	sta cursm1+1
cursm9:
	jmp cursm1

curscalc:
	lda #$00
cursc0:
	ldy #$00
	cpx #0
	beq cursc3
cursc1:
	clc
	adc #8
	bcc cursc2
	iny
cursc2:
	dex
	bne cursc1
cursc3:
	sta $22
	sty $23
	ldy #0
	lda ($22),y
	tax
	iny
	lda ($22),y
	tay

cursposn:
	sty cursp0+1
	stx cursp2+1
	jsr cursmode
	beq cursp4
	lda #'{home}'
	jsr xchrout
cursp0:
	ldx #0
	beq cursp2
cursp1:
	lda #'{down}'
	jsr xchrout
	dex
	bne cursp1
cursp2:
	ldx #0
	beq cursp4
cursp3:
	lda #'{right}'
	jsr xchrout
	dex
	bne cursp3
cursp4:
	rts

cursmode:
	ldx #16
	jsr chkflag ;asc
	bne cursmod1
	lda #1
	rts
cursmod1:
	ldx #18
	jsr chkflag ;ans
	beq cursmod2
	lda #2
	rts
cursmod2:
	lda #0
	rts
