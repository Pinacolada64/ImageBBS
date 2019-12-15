orig $c000
; save as "remote.prg" (or "++ remote"?)

newtxt	= $0a01
newvar	= $0a03
newary	= $0a03
newstr	= $0a03
newtop	= $4000

newgon	= $a7e4 ; Read and Execute the Next Statement
newerr	= $e38b	; standard Kernal error message handler

linkprg = $a533
runc	= $a68e ; Reset Pointer to Current Text Character to the Beginning of Program
		; Text
		; This routine resets the CHRGET pointer TXTPTR (122-123, $7A-$7B) so
		; that the next byte of text that the interpreter will read comes from
		; the beginning of program text.

usetbl1 = $cd03

hc000:
	jmp entry

	byte 255

	area 20		; 20 $00 bytes

oldout:
	word $0000
olderr:
	word $0000
oldmai:
	word $0000
oldgon:
	word $0000
oldtxt:
	word $0000
oldvar:
	word $0000
oldary:
	word $0000
oldstr:
	word $0000
oldtop:
	word $0000
oldmem:
	word $0000

entry:
	lda $326
	ldx $327
	sta oldout
	stx oldout+1
	lda #<newout
	ldx #>newout
	sta $326
	stx $327

	lda $300
	ldx $301
	sta olderr
	stx olderr+1
	lda #<newerr
	ldx #>newerr
	sta $300
	stx $301

	lda $302
	ldx $303
	sta oldmai
	stx oldmai+1
	lda #<newmai
	ldx #>newmai
	sta $302
	stx $303

	lda $308
	ldx $309
	sta oldgon
	stx oldgon+1
	lda #<newgon
	ldx #>newgon
	sta $308
	stx $309

	lda $2b
	ldx $2c
	sta oldtxt
	stx oldtxt+1
	lda #<newtxt
	ldx #>newtxt
	sta $2b
	stx $2c

	lda $2d
	ldx $2e
	sta oldvar
	stx oldvar+1
	lda #<newvar
	ldx #>newvar
	sta $2d
	stx $2e

	lda $2f
	ldx $30
	sta oldary
	stx oldary+1
	lda #<newary
	ldx #>newary
	sta $2f
	stx $30

	lda $31
	ldx $32
	sta oldstr
	stx oldstr+1
	lda #<newstr
	ldx #>newstr
	sta $31
	stx $32

	lda $33
	ldx $34
	sta oldtop
	stx oldtop+1
	lda #<newtop
	ldx #>newtop
	sta $33
	stx $34

	lda $37
	ldx $38
	sta oldmem
	stx oldmem+1
	lda #<newtop
	ldx #>newtop
	sta $37
	stx $38

	lda #0
	sta newtxt-1
	jsr linkprg
	lda $22
	ldx $23
	clc
	adc #2
	bcc *+2
	inx
	sta $2d
	stx $2e
	sta $2f
	stx $30
	sta $31
	stx $32

	jmp runc

newout:
	sta $fe
	pha
	txa
	pha
	tya
	pha
	lda #55
	jsr usetbl1
	pla
	tay
	pla
	tax
	pla
	rts

newmai:
	lda oldout
	ldx oldout+1
	sta $326
	stx $327

	lda olderr
	lda olderr+1
	sta $300
	stx $301

	lda oldmai
	lda oldmai+1
	sta $302
	stx $303

	lda oldgon
	lda oldgon+1
	sta $308
	stx $309

	lda oldtxt
	ldx oldtxt+1
	sta $2b
	stx $2c

	lda oldvar
	ldx oldvar+1
	sta $2d
	stx $2e

	lda oldary
	ldx oldary+1
	sta $2f
	stx $30

	lda oldstr
	ldx oldstr+1
	sta $31
	stx $32

	lda oldtop
	ldx oldtop+1
	sta $33
	stx $34

	lda oldmem
	ldx oldmem+1
	sta $37
	stx $38

	lda #<1
	sta $14
	lda #>1
	sta $15
	ldx #$fa
	txs
	jsr $a8a3
	jmp $a7ae	; NEWSTT: Set Up Next Statement for Execution
			;
			; This routine tests for the STOP key, updates the pointer to the
			; current line number, and positions the text pointer to read the
			; beginning of the statement.
