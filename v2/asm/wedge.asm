; include "equat.s",8
; for pass=1 to 3:org $0c00,-(pass=3),8,"@:ml.wedge"
; print pass

orig $0c00
{include:equates-2_0.asm}
;
; jump table
;


start:
	jmp install	; xx00: install w/o error trap
	jmp install0	; xx03: install w/error trap
	jmp openroom	; xx06: load after filename is set
	jmp arraysv0	; xx09: save array pointers
	jmp arrayrs0	; xx0c: restore array pointers
	jmp collect	; xx0f: garbage collection

wgone0:
	jmp wgone
weval0:
	jmp weval
wtrap0:
	jmp wtrap

tload:
	jsr collect
	jsr chrget
	jsr getfile
	jsr openroo1
	jmp gone2

openroom:
	jsr collect
	lda $ba
	sta $49
openroo1:
	ldx $31

	ldy $32
	stx $ac
	sty $ad
	ldx $33

	ldy $34
	stx $ae
	sty $af
	stx $31
	sty $32
	ldx #$2f
	jsr oprm
	ldx #$2d

	jsr oprm

loadfile:
	lda #8
	ldx $49

	ldy #0
	jsr setlfs
	jsr openf
	ldx #8
	jsr chkin
	jsr chrin
	jsr chrin
	jsr chrin
	jsr chrin
	jsr chrin

	sta l1+1
	jsr chrin

	sta l2+1
	jsr clrchn
	lda #8
	jsr closef
	jsr scan0
	lda #8
	ldx $49
	ldy #0
	jsr setlfs
	lda #0
	ldx $ae
	ldy $af
	jsr loadf
	bcc loadfil1
	jsr chopfile

loaderr:
	ldx #29
	jmp error
loadfil1:
	jsr linkprg

chopfile:
	ldx #<65535
	ldy #>65535
chopfil1:
	stx l1+1
	sty l2+1
	jsr scan0
	ldy #0
	tya
	sta ($ae),y
	iny
	sta ($ae),y
	clc
	lda #2
	adc $ae
	sta $ae
	lda #0
	adc $af
	sta $af

closroom:
	ldx $2d
	ldy $2e
	stx $ac
	sty $ad
	ldx $ae
	ldy $af
	stx $2d
	sty $2e
	ldx #$2f
	jsr clrm
	ldx #$31

clrm:
	sei
	ldy #0
	lda 0,x
	sta $b0
	lda 1,x
	sta $b1
clrm1:
	lda ($ac),y
	sta ($ae),y
	lda $ac
	cmp 0,x
	bne clrm0
	lda $ad
	cmp 1,x
	beq clrm4
clrm0:
	inc $ac
	bne clrm2
	inc $ad
clrm2:
	inc $ae
	bne clrm3
	inc $af
clrm3:
	jmp clrm1
clrm4:
	lda $ae
	sta 0,x
	lda $af
	sta 1,x
	cli
	rts

scan0:
	ldx $2b
	ldy $2c
	stx $ae
	sty $af
	stx $ac
	sty $ad
scan1:
	ldy #3
	lda ($ae),y
l2:
; cmp #0 gets modified
	cmp #0
	bne scan2
	dey
	lda ($ae),y
l1:
; cmp #0 gets modified
	cmp #0
	beq scan3
scan2:
	lda $ae
	ldx $af
	sta $ac
	stx $ad
	ldy #1
	lda ($ae),y
	tax
	dey
	lda ($ae),y
	cpx #0
	beq scan3
	sta $ae
	stx $af
	jmp scan1
scan3:
	rts

oprm:
	sei
	ldy #0
	lda 0,x
	sta $b0
	lda 1,x
	sta $b1
oprm1:
	lda $ac
	cmp 0,x
	bne oprm0
	lda $ad
	cmp 1,x
	beq oprm4
oprm0:
	lda $ac
	bne oprm2
	dec $ad
oprm2:
	dec $ac
	lda $ae
	bne oprm3
	dec $af
oprm3:
	dec $ae
	lda ($ac),y
	sta ($ae),y
	jmp oprm1
oprm4:
	lda $ae
	sta 0,x
	lda $af
	sta 1,x
	cli
	rts

pokefix:
	lda $15
	cmp #$40
	bcc pokefix1
	cmp #$43
	bcc pokefix0
	cmp #$46
	bcc pokefix1
	cmp #$4a
	bcs pokefix1
	sec
	sbc #$03
pokefix0:
	sec
	sbc #$30
	sta $15
pokefix1:
	rts

tpoke:
	jsr chrget
	jsr getnum
	jsr pokefix
	ldy #0
	txa
	sta ($14),y
	jmp gone2

tsys:
	jsr chrget
	jsr frmnum
	jsr getadr
	lda $15
	cmp #$ff
	beq tsys1
	cmp #$c0
	beq tsys1
	jmp ilqerr

tsys1:
	jsr syscll
	jmp gone2

tnew:
	jsr chrget
	jsr linget
	ldx $14
	ldy $15
	jsr chopfil1
	jmp gone2

thex:
	ldx #0
	stx $62
	stx $63
thex1:
	jsr chrget
	bcc thex2
	cmp #'g'
	bcs thex5
	cmp #'a'
	bcc thex5
	sbc #7
thex2:
	and #$f
	ldx #4
thex3:
	asl $63
	rol $62
	bcs thex4
	dex
	bne thex3
	ora $63
	sta $63
	bcc thex1
thex4:
	 jmp ilqerr

thex5:
	ldx #$90
	sec
	jmp retval

tpeek:
	jsr chrget
	jsr parchk
	lda $14
	pha
	lda $15
	pha
	jsr getadr
	jsr pokefix
	ldy #0
	lda ($14),y
	tay
	pla
	sta $15
	pla
	sta $14
	jmp retbyt

tampr:
	jsr chrget
	jsr getaxy
	jsr usetbl1
	jmp gone2

wgone:
	lda 51
	cmp 49
	lda 52
	sbc 50
	bne wgone1
	jsr collect
	lda 51
	cmp 49
	lda 52
	sbc 50
	bne wgone1
; less than 256 bytes free, force
; out of memory error for safety
	ldx #1
	jsr arrayrs0
	ldx #16
	jmp error ; out of memory

wgone1:
	lda #$36
	sta 1
	jsr trace
	lda #$37
	sta 1
	jsr chrget
	cmp #'&'
	beq ampr0
	cmp #poketok
	beq poke0
	cmp #systok
	beq sys0
	cmp #loadtok
	beq load0
	cmp #newtok
	beq new0
	jsr chrgot
	jmp gone1

weval:
	jsr chrget
	ldx #0
	stx $d
	cmp #'$'
	beq hex0
	cmp #peektok
	beq peek0
	jsr chrgot
	jmp eval1

ampr0:
	jmp tampr
poke0:
	jmp tpoke
sys0:
	jmp tsys
load0:
	jmp tload
new0:
	jmp tnew
hex0:
	jmp thex
peek0:
	jmp tpeek

getaxy:
	jsr getparm
	stx 780
	jsr getparm
	stx 781
	jsr getparm
	stx 782
	lda 780
	ldx 781
	ldy 782
	rts

getparm:
	jsr chrgot
	ldx #0
	cmp #','
	bne getparm1
	jsr getbytc
getparm1:
	rts

wtrap:
	stx $030c
	lda $39
	sta $030d
	lda $3a
	sta $030e
	lda #<$e38b
	sta $300
	lda #>$e38b
	sta $301
	ldx #$fa
	txs
	lda #25
	sta 22
	lda #<trapline
	sta $14
	lda #>trapline
	sta $15
	jsr $a8a3
	jmp $a7ae

install:
	lda #<$e38b
	ldx #>$e38b
	jmp install1

install0:
	lda #<wtrap0
	ldx #>wtrap0
install1:
	sta $300
	stx $301
	lda #<wgone0
	ldx #>wgone0
	sta $308
	stx $309
	lda #<weval0
	ldx #>weval0
	sta $30a
	stx $30b
	rts

arrayoff:
	txa
	and #7
	asl
	asl
	tax
	ldy #2
	rts

;* copy pointers for arrays *
arraysv0:
	jsr arrayoff
arsv1:
	sec
	lda $002f,y
	sbc $2d
	sta arryptrs+0,x
	lda $0030,y
	sbc $2e
	sta arryptrs+1,x
	inx
	inx
	dey
	dey
	bpl arsv1
	rts

;* restore pointers for arrays *
arrayrs0:
	lda $2f
	sta $ac
	lda $30
	sta $ad
	jsr arrayoff

arrs1:
	clc
	lda arryptrs+0,x
	adc $2d
	sta $002f,y
	lda arryptrs+1,x
	adc $2e
	sta $0030,y
	inx
	inx
	dey
	dey
	bpl arrs1
	lda $2f
	sta $ae
	lda $30
	sta $af
	ldy #0
	beq arrs2
arrs3:
	inc $ac
	bne *+3
	inc $ad
	inc $ae
	bne *+3
	inc $af
arrs2:
	lda ($ac),y
	sta ($ae),y
	lda $ae
	cmp $31
	bne arrs3
	lda $af
	cmp $32
	bne arrs3
	rts

collect:
	lda #>gc
	ldy #>gchide
	ldx #gclen
	jsr swapper
	jsr gc
	jmp swapagn

; next pass:close 8
; print *-start "bytes"
