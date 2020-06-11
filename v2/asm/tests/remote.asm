orig $c000
; save as "remote.prg" (or "++ remote"?)

; sets usable RAM to $0a01-$4000?

LINNUM	= $14	; Integer Line Number Value
INDEX	= $22	; $22-$25: Misc Temporary Pointers and Save Area
TXTTAB	= $2b	; Pointer to the Start of BASIC Program Text
VARTAB	= $2d	; start of BASIC variables
ARYTAB	= $2f	; Pointer to the Start of the BASIC Array Storage Area
STREND	= $31	; Pointer to End of the BASIC Array Storage Area (+1), and the Start of Free RAM
FRETOP	= $33	; Pointer to the Bottom of the String Text Storage Area
MEMSIZ	= $37	; Pointer to the Highest Address Used by BASIC

IERROR	= $300	; Vector to the Print BASIC Error Message Routine
IMAIN	= $302	; Vector to the Main BASIC Program Loop
IGONE	= $308	; Vector to the Routine That Executes the Next BASIC Program Token

IBSOUT	= $326	; Vector to Kernal CHROUT Routine (Default at 61898 ($F1CA))

newtxt	= $0a01
newvar	= $0a03
newary	= $0a03
newstr	= $0a03
newtop	= $4000

newgon	= $a7e4 ; standard Read and Execute the Next Statement
newerr	= $e38b	; standard Kernal error message handler

linkprg = $a533
runc	= $a68e ; Reset Pointer to Current Text Character to the Beginning of Program
		; Text
		; This routine resets the CHRGET pointer TXTPTR (122-123, $7A-$7B) so
		; that the next byte of text that the interpreter will read comes from
		; the beginning of program text.

usetbl1 = $cd03	; Image routine table

hc000:
	jmp entry

	byte 255

	area 0,20		; 20 $00 bytes

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
	lda IBSOUT	; $326
	ldx IBSOUT+1	; $327
	sta oldout
	stx oldout+1
	lda #<newout
	ldx #>newout
	sta IBSOUT	; $326
	stx IBSOUT	; $327

	lda IERROR	; $300
	ldx IERROR+1	; $301
	sta olderr
	stx olderr+1
	lda #<newerr
	ldx #>newerr
	sta IERROR	; $300
	stx IERROR+1	; $301

	lda IMAIN	; $302
	ldx IMAIN+1	; $303
	sta oldmai
	stx oldmai+1
	lda #<newmai
	ldx #>newmai
	sta IMAIN	; $302
	stx IMAIN	; $303

	lda IGONE	; $308
	ldx IGONE+1	; $309
	sta oldgon
	stx oldgon+1
	lda #<newgon
	ldx #>newgon
	sta IGONE	; $308
	stx IGONE+1	; $309

	lda TXTTAB	; $2b
	ldx TXTTAB+1	; $2c
	sta oldtxt
	stx oldtxt+1
	lda #<newtxt
	ldx #>newtxt
	sta TXTTAB	; $2b
	stx TXTTAB+1	; $2c

	lda VARTAB	; $2d
	ldx VARTAB+1	; $2e
	sta oldvar
	stx oldvar+1
	lda #<newvar
	ldx #>newvar
	sta VARTAB	; $2d
	stx VARTAB+1	; $2e

	lda ARYTAB	; $2f
	ldx ARYTAB+1	; $30
	sta oldary
	stx oldary+1
	lda #<newary
	ldx #>newary
	sta ARYTAB	; $2f
	stx ARYTAB+1	; $30

	lda STREND	; $31
	ldx STREND+1	; $32
	sta oldstr
	stx oldstr+1
	lda #<newstr
	ldx #>newstr
	sta STREND	; $31
	stx STREND+1	; $32

	lda FRETOP	; $33
	ldx FRETOP+1	; $34
	sta oldtop
	stx oldtop+1
	lda #<newtop
	ldx #>newtop
	sta FRETOP	; $33
	stx FRETOP+1	; $34

	lda MEMSIZ	; $37
	ldx MEMSIZ+1	; $38
	sta oldmem
	stx oldmem+1
	lda #<newtop
	ldx #>newtop
	sta MEMSIZ	; $37
	stx MEMSIZ+1	; $38

	lda #0
	sta newtxt-1
	jsr linkprg
	lda INDEX	; $22
	ldx INDEX+1	; $23
	clc
	adc #2
	bcc *+2
	inx
	sta VARTAB	; $2d
	stx VARTAB+1	; $2e
	sta ARYTAB	; $2f
	stx ARYTAB+1	; $30
	sta STREND	; $31
	stx STREND+1	; $32

	jmp runc

newout:
	sta $fe
	pha
	txa
	pha
	tya
	pha
	lda #55		; &,55: output
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
	sta IBSOUT	; $326
	stx IBSOUT+1	; $327

	lda olderr
	lda olderr+1
	sta IERROR	; $300
	stx IERROR+1	; $301

	lda oldmai
	lda oldmai+1
	sta IMAIN	; $302
	stx IMAIN+1	; $303

	lda oldgon
	lda oldgon+1
	sta IGONE	; $308
	stx IGONE+1	; $309

	lda oldtxt
	ldx oldtxt+1
	sta TXTTAB	; $2b
	stx TXTTAB	; $2c

	lda oldvar
	ldx oldvar+1
	sta vartab	; $2d
	stx vartab+1	; $2e

	lda oldary
	ldx oldary+1
	sta ARYTAB	; $2f
	stx ARYTAB+1	; $30

	lda oldstr
	ldx oldstr+1
	sta STREND	; $31
	stx STREND+1	; $32

	lda oldtop
	ldx oldtop+1
	sta FRETOP	; $33
	stx FRETOP+1	; $34

	lda oldmem
	ldx oldmem+1
	sta MEMSIZ	; $37
	stx MEMSIZ+1	; $38

	lda #<1
	sta LINNUM	; $14
	lda #>1
	sta LINNUM	; $15
	ldx #$fa
	txs
	jsr $a8a3	; Perform GOTO
	jmp $a7ae	; NEWSTT: Set Up Next Statement for Execution
			;
			; This routine tests for the STOP key, updates the pointer to the
			; current line number, and positions the text pointer to read the
			; beginning of the statement.
