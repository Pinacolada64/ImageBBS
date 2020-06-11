; command line:
; wine casm4_00-beta-a.exe build.asm -prg:ml20.prg -verbose > build-errors

; changes from asm900827 to c64list3.50:
; - change "dup" to "area"

; in assembler, cmp #"{up}" does not work - see bug #73 on bughost
; lda #'a' (single quotes only) works

revision	= 1

;	version$ = "06/07/91 03:42p"
;	serial = 3 + (asc("A")and 15)*4096

;	print "{clear}Image BBS 2.0 ML "version$

	{include:equates-2_0.asm}
orig $6c00

;	wedge: load addr $0c00, reloc $0c00
	{info:embedding wedge.bin}
	embed wedge.bin
; orig:  the individual .bin file's load address
; embed: where in RAM the .bin file gets put
; reloc: where in RAM the module gets relocated to after "ml 2.0" loads

; orig $1800, embed $7000, reloc $d000: editor
{info:Aligning to $7000.}
orig $7000
	{info:embedding editor.bin}
	embed editor.bin

{info:Aligning to $8000.}
orig $8000

; orig $c000, embed $8000, reloc $e000: garbage collect
	{info:embedding garbage-collect.bin}
	embed garbage-collect.bin

{info:Aligning to $8400.}
orig $8400
; orig $c000, embed $8400, reloc $e400: e.c.s. checker
	{info:embedding ecs.bin}
	embed ecs.bin

{info:Aligning to $8e00.}
orig $8e00
; orig $c000, embed $8e00, reloc $ee00: struct
	{info:embedding struct.bin}
	embed struct.bin

{info:Aligning to $9400.}
orig $9400
; orig $c000, embed $9400, reloc $f400: swap1
	{info:embedding swap1.bin}
	embed swap1.bin

{info:Aligning to $9800.}
orig $9800
; orig $c000, embed $9800, reloc $f800: swap2
	{info:embedding swap2.bin}
	embed swap2.bin

{info:Aligning to $9c00.}
orig $9c00
; orig $c000, embed $9c00, reloc $fc00: swap3
	{info:embedding swap3.bin}
	embed swap3.bin

{info:Aligning to $a000.}
orig $a000
; cannot comment out a "uses:" line, so changing it to "info:"
@usetbl1:
	{include:jump-table.asm}
	{include:string-io.asm}
	{include:mci-commands.asm}
	{include:character-io.asm}
	{include:disk-io.asm}
	{include:irqhn.asm}
	{include:setup.asm}
	{include:varbl.asm}
	{include:miscl.asm}
	{include:screen-handler.asm}
	{include:modem.asm}
	{include:calls.asm}

;
; put intro program (fake protocol) in
;

{info:Aligning to $c000.}
orig $c000
	{include:intro.asm}
;
;* skip rest of proto area *
;
{info:Aligning to $cb00.}
orig $cb00

@swapper:
	sta swappg1 ; source page #
	sty swappg2 ; target page #
	stx swapsiz ; # of pages to swap
@swapagn:
	lda #'s'
	sta tdisp+31
	jsr rsdisab
	sei
	lda 1
	pha
	lda #$34
	sta 1
swappg1	= *+1
	lda #$00
	sta $6a
swappg2	= *+1
	lda #$00
	sta $6c
swapsiz	= *+1
	lda #$00
	sta $6d
	ldy #0
	sty $69
	sty $6b
swapr1:
	lda ($69),y
	tax
	lda ($6b),y
	sta ($69),y
	txa
	sta ($6b),y
	iny
	bne swapr1
	inc $6a
	inc $6c
	dec $6d
	bne swapr1
	pla
	sta 1
	cli
	jsr rsinabl
	lda #$a0
	sta tdisp+31
	rts

getversn:
	lda #15
	sta var
	lda #<version
	sta var+1
	lda #>version
	sta var+2
	ldx #1
	jsr putvar ;a$
	ldy #4
loop:
	lda versnum,y
	sta $0061,y	; var
	dey
	bpl loop
	ldx #15
	jsr putvar ;lp
	jsr zero
	lda rvisnum
	sta var+1
	lda rvisnum+1
	sta var
	ldx #30
	jmp putvar ;a%

scrnset:
	sta blnkflag
	sta $d030
	stx $d011
	rts

;
; find a basic variable
;

findvar1:
	lda 1
	pha
	lda #$37
	sta 1
	jsr ptrget1
	jmp exitint

;
; relink basic program lines
;

relink:
	lda 1
	pha
	lda #$37
	sta 1
	jsr linkprg
	jmp exitint

fpout:
; output floating point number
	lda 1
	pha
	lda #$37
	sta 1
	jsr $bddd
	jmp exitint

;
; make a dynamic string
;
makeroom:
	tax
	lda 1
	pha
	lda #$37
	sta 1
	txa
	jsr makerm1
exitint:
	pla
	sta 1
	rts

mlgosub:
	lda $7b
	pha
	lda $7a
	pha
	lda $3a
	pha
	lda $39
	pha
	lda #$8d
	pha
mlresume:
	lda #$37
	sta 1
mljump:
	jsr mlgoto
	jmp $a7ae

mlgoto:
	lda 1
	pha
	lda #$37
	sta 1
	stx $14
	sty $15
	jsr $a8a3
	pla
	sta 1
	rts

;
;* output a$
;

; enter with .x=number of spaces
outspace:
	txa
	beq outspac2
outspac1:
	lda #' '
	jsr xchrout
	dex
	bne outspac1
outspac2:
	rts

outcomma:
	lda #0
outcomm1:
	clc
	adc #10
	bcs outastr0
	cmp modclm
	bcc outcomm1
	sec
	sbc modclm
	tax
	jsr outspace
outastr0:
	jsr chrget
	beq outastr2
outastr1:
	cmp #';'
	beq outastr0
	cmp #44		; ","
	beq outcomma
	jsr getstr
	stx var+1
	sty var+2
	sta var
	jsr outstr
	jsr chrgot
	bne outastr1
outastr2:
	rts

	; $cc2b
@outastr:
	jsr chrgot
	bne outastr1
	ldx #1
	jmp prtvar

getstr:
	lda 1
	pha
	lda #$37
	sta 1
	jsr frmevl ; $ad9e
	bit $0d
	bpl getval
	jsr $b6a3
	tax
	jmp getstr1
getval:
	jsr $bddd
	lda #<$100
	sta $22
	lda #>$100
	sta $23
	ldx #0
getval1:
	lda $100,x
	beq getstr1
	inx
	bne getval1
getstr1:
	pla
	sta 1
	txa
	ldx $22
	ldy $23
	rts

fnvar:
	lda 1
	pha
	lda #$37
	sta 1
	jsr chkcom
	jsr $b08b
	ldx $47
	ldy $48
	pla
	sta 1
	rts
fnvar1:
	jsr fnvar
	stx $14
	sty $15
	rts

evalstr:
	lda 1
	sta rom0
	lda #$37
	sta 1
	jsr chkcom
	jsr frmevl	; $ad9e
	jsr $b6a3
	pha
	lda rom0
	sta 1
	pla
	ldx $22
	ldy $23
	rts

evalbyt:
	lda 1
	sta rom0
	lda #$e7
	sta 1
	jsr chkcom
	jsr $0079
	jsr $b79e
	lda rom0
	sta 1
	rts

spchars:
	ascii ",:{34}*?={13}{up arrow}"

{info:Aligning to $cd00.}
orig $cd00
;
; interface page	; target
;
; outastr[p]:
	jmp <@outastr	; $cc2b
; usetbl1:
	jmp <@usetbl1	; $a000
; swapper:
	jmp <@swapper	; $cb00
; swapagn:
	jmp <@swapagn	; $cb09
; trace:
	jmp  _trace	; $bc30 screen-handler.asm
; chkspcl:
	jmp >@chkspcl	; $cd25
; convchr:
	jmp >@convchr	; $cd15

@convchr:
	jsr chkspcl
	cmp #0
	bmi convchr1
	cmp #64
	bcc convchr1
	eor #64
convchr1:
	and #127
	rts

@chkspcl:
	cmp #$85
	bcc chkspcl1
	cmp #$8d
	bcs chkspcl1
	stx cxsav
	sec
	sbc #$85
	tax
	lda spchars,x
	ldx cxsav
chkspcl1:
	cmp #0
	rts

@usetbl1:
	sta 780
	stx 781
	sty 782
	asl
	tax
	lda 1
	pha
	lda #$36
	sta 1
	php
	sei
	lda jmptbl,x
	tay
	lda jmptbl+1,x
	tax
	plp
	lda #<caller
	sta jump+1
	lda #>caller
	sta jump+2
	cpx #$e0
	bcs jump
	sty jump+1
	stx jump+2
	ldx 781
	ldy 782
jump:
	jsr $ffff
	sta 780
	pla
	sta 1
	lda 780
nothing:
	rts

;
; new system chrout routine
;

newout:
	sta ptr1	; $9e
	lda 1
	pha
	lda #$36
	sta 1
	lda ptr1	; $9e
	jsr out
	sta ptr1	; $9e
	pla
	sta 1
	lda ptr1	; $9e
	rts
oldout:
	jmp $ffff

;
; raster interrupt routine
;
raster:
	lda #$00
	bne rast1
	lda scnmode
	bne rast0
	lda #23
	sta $d018
rast0:
	lda #106
	sta $d012
	lda #1
	sta $d019
	inc raster+1
	jmp $febc

rast1:
	nop
	lda mupcase
	and #1
	asl
	eor #23
	sta $d018
	lda #234
	sta $d012
	lda #1
	sta $d019
	dec raster+1
	inc jiffy

newirq:
	lda 1
	pha
	lda #$36
	sta 1
irqt:
	lda #$00
	beq newirq0
	dec irqt+1
	bne newirq1
newirq0:
	jsr irq
	lda irqcount
	sta irqt+1
newirq1:
	pla
	sta 1
	jmp $ea81

;
; far call to the error handler
;

farerr:
	lda #$37
	sta 1
	jmp error

;	rem
;	print " interface page:" tab(30) (*-$cd00)
;	rem
{info:Aligning to $ce00.}
orig $ce00
;
; buffer page
;

d1str:
	ascii "           "	; 11 bytes
	ascii "Tue Jan  1, 1988 12:00 PM   "
; buf2   ($ce27-$ce76)
	area 32,80
; buffer ($ce77-$cec7)
	area 32,80

;
; date in 6 byte bcd format
;
bootdate:
dateday:	byte $01
datemon:	byte $12
datedate:	byte $09
dateyear:	byte $90
		byte $20
		byte $00

;
; storage for conversion routines
;
binary:		area 4

;
; days in each month
;
ha560:
; FIXME: only 10?
	byte $31,$28,$31,$30,$31,$30,$31,$31,$30,$00
decchr:
	byte $30,$30,$30,$30,$30,$31,$30,$31
;
; storage for rom bank values
;
rom0:
	byte 0
rom1:
	byte 0
;
; the revision number of this ml
;
rvisnum:
	word revision
;
; the date this ml was made
;
version:
	ascii "06/07/91 03:42p"
;
; version 1.3
;
versnum:
	byte $81,$26,$66,$66,$66
