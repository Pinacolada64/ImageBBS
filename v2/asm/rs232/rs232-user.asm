; "ml.rs232/user"
{include:..\equates-2_0.asm}

	BITCI	= $a8	; RS-232 Input Bit Count
	RIDATA	= $aa	; RS-232 Input Byte Buffer
	BITTS	= $b4	; RS-232 Output Bit Count
	NXTBIT	= $b5	; RS-232 Next Bit to Send
	RODATA	= $b6	; RS-232 Output Byte Buffer

	BAUDOF	= $0299 ; $299-$29a: Time Required to Send a Bit
	ENABL	= $02a1	; RS-232 Interrupts Enabled

; CIA #1
	CI1CRA	= $dc0e ; Control Register A

; CIA #2
	CI2PRA	= $dd00 ; Data Port A
	CI2PRB	= $dd01	; Data Port B
	TI2ALO	= $dd04 ; Timer A (low byte)
	TI2AHI	= $dd05 ; Timer A (high byte)
	TI2BLO	= $dd06 ; Timer B (low byte)
	TI2BHI	= $dd07 ; Timer B (high byte)
	CI2ICR	= $dd0d ; Interrupt Control Register
	CI2CRA	= $dd0e ; Control Register A
	CI2CRB	= $dd0f	; Control Register B

{def:comment_out}
{ifdef:comment_out}
	{info:INFO: commenting out oldout and nchrout}
{endif}

orig $0800

rstkey	= $fe56
norest	= $fe72
nmiexit	= $febc
findfn	= $f30f
devnum	= $f31f
nofile	= $f701

first:
xx00:	jmp setup
xx03:	jmp inabl
xx06:	jmp disab
xx09:	jmp >@rsget	; forward search local label @rsget
xx0c:	jmp rsout
xx0f:	jmp setbaud
;
;	word 0300,0600,1200,2400
strt:
	word 4915,2550,1090,0459,0220
full:
	word 3410,1705,0845,0421,0200
baudofs:
	word 3410,1706,0852,0426,0213
;
vectbl:
oldnmi: byte $18
	word nmi64
oldopn: byte $1a
	word nopen
oldcls: byte $1c
	word nclose
oldchk: byte $1e
	word nchkin
oldclr: byte $22
	word nclrch
oldchr: byte $24
	word nchrin

{ifndef:comment_out}
oldout:
	byte $26
	word nchrout
{endif}

oldget: byte $2a
	word ngetin
	byte 0

setup:	ldx #0
	lda #3
	sta 21
setup1: lda vectbl,x
	beq setup3
	sta 20
	lda #$4c	; replace with JMP opcode
	sta vectbl,x
	inx
	ldy #0
setup2: lda vectbl,x
	pha
	lda (20),y
	sta vectbl,x
	pla
	sta (20),y
	iny
	inx
	cpy #2
	bcc setup2
	jmp setup1
setup3: ldx #$01
	ldy #<426
	lda $2a6	; NTSC/PAL flag (0=NTSC)
	beq setup4
	ldx #$81
	ldy #<416
setup4: stx CI1CRA	; $dc0e
	sty baudofs+6
	rts

nmi64:	pha
	txa
	pha
	tya
	pha
nmi128: cld
	lda CI2PRB	; $dd01
	and #{%:00010000}
	sta carrier
	ldx TI2BHI	; $dd07
	lda #$7f
	sta CI2ICR	; $dd0d
	lda CI2ICR	; $dd0d
	bpl notcia
	cpx TI2BHI	; $dd07
	ldy CI2PRB	; $dd01
	bcs >@mask	; forward search local label @mask
	ora #2
	ora CI2ICR	; $dd0d
@mask:	and ENABL	; $02a1
	tax
	lsr
	bcc ckflag
	lda CI2PRA	; $dd00
	and #$fb
	ora NXTBIT	; $b5
	sta CI2PRA	; $dd00
ckflag:	txa
	and #$10
	beq nmion
strtlo:	lda #$42
	sta TI2BLO	; $dd06
strthi:	lda #$04
	sta TI2BHI	; $dd07
	lda #$11
	sta CI2CRB	; $dd0f
	lda #$12
	eor enabl
	sta enabl
	sta CI2ICR	; $dd0d
fulllo:	lda #$4d
	sta TI2BLO	; $dd06
fullhi:	lda #$03
	sta TI2BHI	; $dd07
	lda #$08
	sta BITCI	; $a8
	bne chktxd

notcia:	ldy #$00
	jmp rstkey

nmion:	lda enabl
	sta CI2ICR	; $dd0d
	txa
	and #$02
	beq chktxd
	tya
	lsr
	ror RIDATA	; $aa
	dec BITCI	; $a8
	bne txd
	ldy ridbe
	lda RIDATA	; $aa
	sta ribuf,y
	iny
	bpl nowrp
	ldy #0
nowrp:	sty ridbe
	lda #$00
	sta CI2CRB	; $dd0f
	lda #$12
switch:	ldy #$7f
	sty CI2ICR	; $dd0d
	sty CI2ICR	; $dd0d
	eor enabl
	sta enabl
	sta CI2ICR	; $dd0d
txd:
	txa
	lsr
chktxd:	bcc exit
	dec BITTS	; $b4
	bmi char
	lda #$04
	ror RODATA	; $b6
	bcs store
low:	lda #$00
store:	sta NXTBIT	; $b5
exit:	jmp nmiexit
char:	ldy rodbs
	cpy rodbe
	beq txoff
	jsr sendchr
	bne low
txoff:	ldx #0
	stx CI2CRA	; $dd0e
	lda #1
	bne switch

sendchr:
	lda robuf,y
	sta RODATA	; $b6
	iny
	bpl send1
	ldy #0
send1:	sty rodbs
	lda #9
	sta BITTS	; $b4
	rts

disabl:	pha
test:	lda enabl
	and #$03
	bne test
	lda #$10
	sta CI2ICR	; $dd0d
	lda #$02
	and enabl
	bne test
	sta enabl
	pla
	rts

fulbuf: jsr strtup
	jmp point
@rsout:	sta ptr1	; $9e
	sty xsav	; $97
point:	ldy rodbe
	sta robuf,y
	iny
	bpl rsout1
	ldy #0
rsout1: cpy rodbs
	beq fulbuf
	sty rodbe
	ldy scnmode
	bne strtup
	pha
	ldy #0
outdisp:
	lda sdisp+30,y
	sta sdisp+29,y
	iny
	cpy #9
	bcc outdisp
	pla
	sta sdisp+38
strtup:
	lda enabl
	and #1
	bne ret3
	sta NXTBIT	; $b5
	ldy rodbs
	jsr sendchr
	lda baudof
	sta TI2ALO	; $dd04
	lda baudof+1
	sta TI2AHI	; $dd05
	lda #$11
	sta CI2CRA	; $dd0e
	lda #$81
change:
	sta CI2ICR	; $dd0d
	php
	sei
	ldy #$7f
	sty CI2ICR	; $dd0d
	sty CI2ICR	; $dd0d
	ora enabl
	sta enabl
	sta CI2ICR	; $dd0d
	plp
ret3:	clc
	ldy xsav	; $97
	lda ptr1	; $9e
	rts

nchkin: stx xtmp
	jsr findfn
	bne nosuch
	jsr devnum
	lda $ba		; current output device
	cmp #2		; rs232
	bne back
	sta dfltn	; $99 - input device
inable:	sta ptr1	; $9e
	sty xsav	; $97
	jsr getenabl
	bne ret1
	sta CI2CRB	; $dd0f
	lda #$90
	jmp change

nosuch:	jmp nofile

back:	ldx xtmp
	jsr disab
	jsr oldchk
	jmp inabl
xtmp:	byte 0

ngetin: pha
	lda dflto	; $9a
	cmp #2		; rs232?
	bne notget
	pla
@rsget:	sta ptr1	; $9e
	sty xsav	; $97
	ldy ridbs
	cpy ridbe
	beq ret2
	lda ribuf,y
	sta ptr1	; $9e
	iny
	bpl rsget1
	ldy #0
rsget1: sty ridbs
	ldy scnmode
	bne ret1
	ldy #0
inpdisp:
; scroll input window
	lda sdisp+2,y
	sta sdisp+1,y
	iny
	cpy #9
	bcc inpdisp
	lda ptr1	; $9e
	sta sdisp+10	; put last char rec'd
ret1:	clc
ret2:	ldy xsav	; $97
	lda ptr1	; $9e
	rts
notget: pla
	jsr disab
	jsr oldget

inabl:	php
	pha
	txa
	pha
	tya
	pha
	jsr inable
	pla
	tay
	pla
	tax
	pla
	plp
	rts

disab:	php
	jsr disabl
	plp
	rts

getenabl:
	lda enabl
	and #$12
	rts

dtrtable:
	byte 0,38

setdtr: and #1
	tay
	lda dtrtable,y
	sta CI2PRB	; $dd01
	rts

setbaud:
	cmp #0
	bmi setdtr
	cmp #5
	bcc setbaud1
	rts
setbaud1:
	asl
	tay
	lda strt,y
	sta strtlo+1
	lda strt+1,y
	sta strthi+1
	lda full,y
	sta fulllo+1
	lda full+1,y
	sta fullhi+1
	lda baudofs,y
	sta baudof
	lda baudofs+1,y
	sta baudof+1
	jsr getenabl
	bne ret1
	sta CI2CRB	; $dd0f
	rts

; question: do we comment this out? it was originally
{ifndef:comment_out}
nchrout:
	jsr disab
	jsr oldout
	jmp inabl
{endif}

nopen:
	jsr disab
	jsr oldopn
	jmp inabl

nclose:
	jsr disab
	jsr oldcls
	jmp inabl

nclrch:
	jsr disab
	jsr oldclr
	jmp inabl

nchrin:
	jsr disab
	jsr oldchr
	jmp inabl
