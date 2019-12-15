; include "equat.s",8
; print "Swap1: [" ;
; for pass=1 to 3:org $c000,-(pass=3),8,"@:ml.swap1":print pass;

orig $c000
{include:equates-2_0.asm}

hc000:
	jmp inline
hc003:
	jmp inline0
hc006:
	jmp password
hc009:
	jmp useeditr
;
; jump table routines
;
xgetin:
	lda #23
	jmp usetbl1
xchrout0:
	sta $fe
	lda passmode
	and #2
	beq xchrout1
	lda $fe
	rts
xchrout:
	sta $fe
xchrout1:
	pha
	txa
	pha
	tya
	pha
	lda #24
	jsr usetbl1
	pla
	tay
	pla
	tax
	pla
	rts
usevar:
	lda #29
	jmp usetbl1
putvar:
	lda #30
	jmp usetbl1
zero:
	lda #31
	jmp usetbl1
chatchk:
	lda #43
	jmp usetbl1
memory:
	lda #44
	jmp usetbl1
prtvar0:
	lda #46
	jmp usetbl1
carchk:
	lda #47
	jmp usetbl1
chatmode:
	lda #56
	jmp usetbl1
;
;********************************
;* string input routines
;********************************

;***********************************
;* input line to an$               *
;***********************************
;* on entry:                       *
;* pl=0 for upper/lower case       *
;* pl=1 for upper case only        *
;* w$ = text that was wrapped      *
;* or text to edit in              *
;* edit mode.                      *
;* p$ = text for prompt            *
;* .x register holds mode          *
;* .y register holds password mode *
;* flags                           *
;***********************************
;* on exit:                        *
;* an$ = text that was typed       *
;* w$ = text that was wrapped      *
;* location (chat) holds:          *
;* 0 = normal                      *
;* 1 = delete on column one        *
;*     or dot on column one        *
;* 2 = chat check hit              *
;* 3 = carrier/time loss           *
;***********************************
;
inline:
	stx editor ;flags
	sty passmode
	ldx #16
	jsr usevar ;pl
	lda var ;case lock
	and #1
	sta case
inline0:
	ldy #$00
	sty index
	sty tmp1 ;chars typed
	sty mjump
	sty chat ;result code
	sty buffer
	jsr prprompt
	lda editor
	and #$30 ;word wrap
	beq in0c ;and edit mode
	ldx #27
	jsr usevar ;w$
	ldy var
	beq in1
	sty tmp1
in0:
	dey
	lda (var+1),y
	sta buffer,y
	cpy #0
	bne in0
in0c:
	ldy #0 ;print buffer
	cpy tmp1
	beq in0d
in0a:
	lda buffer,y
	jsr xchrout
	iny
	cpy tmp1
	bcc in0a
	lda tmp1
	sta index
in0d:
	lda editor ;edit mode
	and #$20
	beq in0b
	jsr prcr
	lda #0
	sta index
	jsr prprompt
in0b:
	jsr zero
	ldx #27
	jsr putvar ;w$
in1:
	jsr xgetin ;main loop
	sta $fe
	jsr carchk
	beq in1a
	lda #0
	sta index
	lda #3
	sta chat
	jmp ctrlm
in1a:
	jsr chatchk
	beq in1b
	jsr chatmode
	jmp inline0
in1b:
	lda $fe
	ldy index
	ldx #ctrlend-ctrlchrs-1
in2:
	cmp ctrlchrs,x
	beq in3
	dex
	bpl in2
	jsr ctrlchk
	bcc in1
put:
	cpy llen
	bcc put0
	jmp wrap
put0:
	sta buffer,y
	jsr xchrout0
	inc index
	ldy index
	cpy tmp1
	bcc put1
	sty tmp1
put1:
	jmp in1
ctrlchrs:
	byte 4,9,13,20,21,22,23,24,25,14,2,46 ; 12
ctrlend:
ctrl:
	word ctrld,ctrli,ctrlm
	word ctrlt,ctrlu,ctrlv
	word ctrlw,ctrlx,ctrly
	word ctrln,ctrlb,dot

in3:
	txa
	asl
	tax
	lda ctrl,x
	sta ctrljm+1
	lda ctrl+1,x
	sta ctrljm+2
	ldy index
ctrljm:
	jmp $ffff

ctrld:
	ldx tmp1
	beq ctrld3
	cpx index
	beq ctrld3
ctrld1:
	cpy tmp1
	bcs ctrld2
	lda buffer+1,y
	sta buffer,y
	iny
	bne ctrld1
ctrld2:
	dec tmp1
ctrld3:
	jmp in1

ctrli:
	ldx tmp1
	cpx llen
	bcs ctrli3
ctrli1:
	cpx index
	beq ctrli2
	lda buffer-1,x
	sta buffer,x
	dex
	jmp ctrli1
ctrli2:
	inc tmp1
	lda #' '
	sta buffer,y
ctrli3:
	jmp in1

ctrlm:
	lda #13
	jsr xchrout0
	lda index
	sta var
	lda #<buffer
	sta var+1
	lda #>buffer
	sta var+2
	ldx #0
	jsr putvar ;an$
	jmp memory

ctrlt:
	cpy #0
	beq ctrlt1
	lda buffer-1,y
	jsr ctrlt4
	dec index
ctrlt2:
	jmp in1
ctrlt1:
	ldx editor
	bpl ctrlt2
	lda #20
	sta buffer
	lda #1
	sta chat
	rts

ctrlt3:
	pla
	eor #128
	jmp xchrout0
ctrlt4:
	ldx mci
	bmi ctrlt6
	jsr colorchk
	bcc ctrlt5
	pha
	and #$7f
	cmp #'{rvrs on}'
	beq ctrlt3
	cmp #'{rvrs off}'
	beq ctrlt3
	cmp #'{right}'
	beq ctrlt3
	pla
ctrlt6:
	lda #20
	jmp xchrout0
ctrlt5:
	rts

ctrlu:
	cpy tmp1
	bcs ctrlu1
	lda buffer,y
	jmp put
ctrlu1:
	jmp in1

ctrlv:
	jsr prcr
	jsr prprompt
	ldy #0
ctrlv1:
	cpy index
	bcs ctrlv2
	lda buffer,y
	jsr xchrout0
	iny
	bne ctrlv1
ctrlv2:
	jmp in1

ctrlw:
	cpy #0
	beq ctrlw1
	dey
	lda buffer,y
	jsr ctrlt4
	lda buffer,y
	cmp #' '
	bne ctrlw
ctrlw1:
	sty index
	jmp in1

ctrlx:
	lda #'{pound}'
	jsr xchrout
	jsr prcr
	jmp inline0

ctrly:
	ldy index
	cpy tmp1
	bcs ctrly1
	lda buffer,y
	cmp #' '
	php
	jsr xchrout0
	inc index
	plp
	bne ctrly
ctrly1:
	jmp in1

ctrln:
	ldy index
	cpy tmp1
	bcs ctrln1
	lda buffer,y
	jsr xchrout0
	inc index
	jmp ctrln
ctrln1:
	jmp in1

ctrlb:
	cpy #0
	beq ctrlb2
ctrlb1:
	lda buffer-1,y
	jsr ctrlt4
	dey
	bne ctrlb1
	sty index
ctrlb2:
	jmp in1
;
dot:
	cpy #0
	bne dot1
	lda editor
	and #2
	beq dot1
	lda #1
	sta chat
	rts
dot1:
	lda #'.'
	jmp put

wrap:
	sta tmp2
	lda editor
	and #16
	bne wrap0
	lda editor
	and #32
	bne wrap0a
	lda #7
	jsr xchrout0
wrap0a:
	jmp in1
wrap0:
	lda tmp2
	cmp #' '
	bne wrap1
	sty tmp3
	jmp wrap6
wrap1:
	sta tmp2
	dey
wrap2:
	lda buffer,y
	cmp #' '
	beq wrap3
	dey
	bne wrap2
	lda tmp2
	sta buf2
	lda #1
	sta var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #27
	jsr putvar ;w$
	jmp ctrlm
wrap3:
	ldx #0
	sty tmp3
	iny
	cpy index
	bcs wrap5
wrap4:
	lda buffer,y
	sta buf2,x
	lda #20
	jsr xchrout0
	inx
	iny
	cpy index
	bcc wrap4
wrap5:
	lda tmp2
	sta buf2,x
	inx
	stx var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #$1b
	jsr putvar ;w$
wrap6:
	ldy tmp3
	iny
	sty index
	lda #32
	sta buffer-1,y
	jmp ctrlm

prprompt:
	lda editor
	and #4
	bne prpr1
	lda passmode
	pha
	lda #0
	sta passmode
	ldx #28
	jsr prtvar0 ;p$
	lda #':'
	jsr xchrout
	lda #' '
	jsr xchrout
	pla
	sta passmode
prpr1:
	rts
;
; exits with carry clear
; if control character
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
	cmp #'{rvrs on}'
	beq ctrlch2
	cmp #'{rvrs off}'
	beq ctrlch2
	cmp #'{down}'
	beq ctrlch2
	cmp #'{up}'
	beq ctrlch2
	cmp #'{right}'
	beq ctrlch2
	cmp #'{left}'
	beq ctrlch2
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
;
; exits with carry clear
; if color character
;
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

prcr:
	lda #$0d
	jmp xchrout
;
;* password input routine *
;
password:
	lda #1
	sta case
	lda #15
	sta llen
	lda #4
	sta editor
	txa
	ora #1
	sta passmode
	jsr inline0
	lda #0
	sta passmode
	rts

useeditr:
	lda edittbl,x
	sta editjmp+1
	jsr editswap
editjmp:
	jsr $1800
editswap:
	pha
	txa
	pha
	tya
	pha
	lda #$18
	ldy #$d0
	ldx #16
	jsr swapper
	pla
	tay
	pla
	tax
	pla
	rts
;
edittbl:
	byte 0,3,6
;
; next pass:close 8:print"]"
; print *-$c000 "Bytes"
; if (*-$c000) > 1024 then print"Too Big!"
