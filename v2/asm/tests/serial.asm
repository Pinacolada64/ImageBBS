{number:1}
{step:2}
' assemble with c64list 3.50
rem SERIAL.S -- 2018-11-17 PINACOLADA
' poke 56,144:poke 52,144:clr
sys {sym:serial1}:print peek(781)*256+peek(782)
print peek({sym:serialn})+peek({sym:serialn}+1)*256"(should =670)"
print peek({sym:serialr1})+peek({sym:serialr1}+1)*256
print peek({sym:rval})+peek({sym:rval}+1)*256
b=peek({sym:serialn})+peek({sym:serialn}+1)*256:n=0
{:61050}
a=peek({sym:rval})+peek({sym:rval}+1)*256
if a<>b then sys {sym:rand}:n=n+1:goto {:61050}
print n"times"
{asm}
test:	lda #0
	sta count
test1:	jsr rand8
	ldx rval
	lda rval
	sta test2+1
	lda rval+1
	and #0
	ora #4
	sta test2+2
test2:	inc $400
	lda 198
	beq test1
	rts
;
t1:	ldy #0
t2:	tya
	jsr rand8
	sta $400,y
	dey
	bne t2
	rts
;
rand11: pha
	txa
	pha
	tya
	pha
	ldy #0
	lda rval
	and #$02	; {%:00000010}
	jsr bitcount
	lda rval+1
	and #$04	; {%:00000100}
	jsr bitcount
	tya
	lsr
	rol rval
	rol rval+1
	lda rval+1
	and #$07	; {%:00000111}
	sta rval+1
	pla
	tay
	pla
	tax
	pla
	rts
;
rand8:	pha
	txa
	pha
	tya
	pha
	ldy #0
	lda rval
	and #$8e	; {%:10001110}
	jsr bitcount
	tya
	lsr
	rol rval
	pla
	tay
	pla
	tax
	pla
	rts
;
reprand:
	jsr rand11
	dey
	bne reprand
	dex
	bpl reprand
	rts
;
rval:	word $00ff
count:	byte 0
;
bitcount:
	ldx #8
bitcoun1:
	asl
	bcc bitcoun2
	iny
bitcoun2:
	dex
	bne bitcoun1
	rts
;
serialn:
	word 670
serialr1:
	word 0
;
serial1:
	lda serialn
	sta rval
	lda serialn+1
	sta rval+1
	ldx #3
	ldy #0
	jsr reprand
	lda rval
	sta serialr1
	lda rval+1
	sta serialr1+1
	ldx #3
	ldy #255
	jsr reprand
	rts
;
serial2:
	lda #1
	sta rval
	lda #0
	sta rval+1
	ldy serialn
	ldx serialn+1
	jsr reprand
	lda rval
	sta serialr1
	lda rval+1
	sta serialr1+1
	ldx #0
	ldy #0
loop:
	jsr rand
	iny
	bne loop2	; *+2
	inx
loop2:	lda rval
	cmp #1
	bne loop
	lda rval+1
	bne loop
	rts
;
rand:	inc $03e7	; +999
	rts ; fake routine
{endasm}
