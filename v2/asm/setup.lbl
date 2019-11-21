; "setup.s - 05/20/91 11:57a"

logoff:
	stx curdsp
	lda #0
	sta chatpage
	sta sndrept
	lda #11
	sta var
	lda #<d1str
	sta var+1
	lda #>d1str
	sta var+2
	ldx #4
	jsr putvar ;d1$
	lda #$a0
	sta tdisp+30
	sta tdisp+31
	sta tdisp+32
	rts

setbaud:
	txa
	jmp rsbaud
