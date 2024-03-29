; irqhn.s - irq routine
; 12/13/07 04:37p
; 12/08/90 01:28a
;* counter to execute a different
;* part of the routine each jiffy

irq:
	jsr irq9
	jsr irq10
	inc idlejif
	lda mupcase
	lsr
	ror
	eor #$ff
	cmp caseflag
	beq irq0
	sta caseflag
	jsr dispdate

irq0:
	ldy #0
	lda irqtbl,y
	sta irqjmp+1
	iny
	lda irqtbl,y
	sta irqjmp+2
	iny
	cpy #16
	bcc irq0a
	ldy #0
irq0a:
	sty irq0+1
irqjmp:
	jmp $ffff
irqtbl:
	word irq1 ;page
	word irq2 ;time
	word irq3 ;blanker
	word irq4 ;lightbar
	word irq5 ;carrier
	word irq6 ;flag
	word irq7 ;lightbar
	word irq4 ;lightbar

caseflag:
	byte 255

;
;* chat page
;
irq1:
	ldy #4
	dey
	bpl irq1a
	ldy #4
irq1a:
	sty irq1+1
irq1z:
	ldx #5
	dex
	bpl irq1b
	lda timeset
	bne irq1g
	lda irq1e+1
	eor #10
irq1g:
	sta irq1e+1
	ldx #5
irq1b:
	stx irq1z+1
	lda scnmode
	bne irq1e
	lda chatpage
	bne irq1c
	ldx #0
irq1c:
	lda pagecol,x
	ldx #15
irq1d:
	sta acolr+24,x
	dex
	bpl irq1d
irq1e:
	lda #1
	ldy #39
irq1f:
	sta tcolr,y
	dey
	bpl irq1f
	rts

pagecol:
	byte 1,15,12,11,12,15

;
;* update time on screen
;
timeflag:
	byte 0

irq2:
	lda min
	ldx timeflag
	bne irq2a
	cmp bootdate+5
	beq ha872
irq2a:
	sta bootdate+5
	ldx #0
	stx timeflag
	jsr gettsr
	beq irq2b
	cmp #101
	bcs irq2b
	sec
	sbc #1
	jsr settsr
irq2b:
	lda hrs
	sta bootdate+4
	ldx ten
	cmp #$12
	bne ha86f
	lda bootdate+5
	bne ha86f
	inc bootdate
	lda bootdate
	cmp #8
	bcc ha832
	lda #1
	sta bootdate
ha832:
	ldy bootdate+1
	lda bootdate+2
	cmp ha560-1,y
	bne ha84d
	lda #0
	sta bootdate+2
	lda bootdate+1
	sed
	clc
	adc #1
	sta bootdate+1
ha84d:
	lda bootdate+2
	sed
	clc
	adc #1
	sta bootdate+2
	cld
	lda bootdate+1
	cmp #$13
	bne ha86e
	lda #1
	sta bootdate+1
	lda bootdate+3
	sed
	clc
	adc #1
	sta bootdate+3
ha86e:
	cld
ha86f:
	jsr makdate
	jsr alarm
ha872:
	lda scs
	jsr bcdtoa
	pha
	txa
	tay
	pla
	ldx #$17
	jsr dispdt
	tya
	jsr dispdt
	jsr gettsr
	beq ha083
	lda #$59
	sed
	sec
	sbc scs
	cld
; display tsr
ha083:
	jsr bcdtoa
	pha
	txa
	tay
	pla
	ldx #$24
	jsr dispdt
	tya
	jsr dispdt
	lda tsr2
	bne tchk1
	jsr gettsr
	beq tchk1
; display copyright msg when time expired:
	lda #<copyrite
	sta jmptbl
	lda #>copyrite
	sta jmptbl+1
tchk1:
	jsr gettsr
	cmp tsr2
	sta tsr2
	bne tchk2
	jsr disptime
tchk2:
	rts

gettsr:
	txa
	pha
	ldx #29
	jsr gvarptr ;tr%
	stx getts1+1
	sty getts1+2
	stx setts1+1
	sty setts1+2
	ldy #1
	pla
	tax
getts1:
	lda $ffff,y
	rts

settsr:
	pha
	jsr gettsr
	pla
setts1:
	sta $ffff,y
	rts

;
;* make string out of current date for d1$
;* (convert from 6 byte to 11 byte format)
;
mkdate:
	pha
	lsr
	lsr
	lsr
	lsr
	jsr mkdate1
	pla
mkdate1:
	and #$0f
	ora #$30
	sta d1str,y
	iny
	rts

mult3:
	tya
	sta mult3a+1
	asl
	clc
mult3a:
	adc #$00
	tay
	rts

makdate:
	ldy #0
	lda bootdate
	jsr mkdate1
	lda bootdate+3
	jsr mkdate
	lda bootdate+1
	jsr mkdate
	lda bootdate+2
	jsr mkdate
	lda bootdate+4
	jsr mkdate
	lda bootdate+5
	jsr mkdate
dispdate:
	ldy bootdate
	jsr mult3
	ldx #0
dispd1:
	lda daytbl,y
	jsr dispdt
	iny
	cpx #3
	bne dispd1
	lda #' '
	jsr dispdt
	lda bootdate+1
	cmp #$10
	bcc *+3
	sbc #6
	tay
	dey
	jsr mult3
dispd2:
	lda montbl,y
	jsr dispdt
	iny
	cpx #7
	bne dispd2
	lda #' '
	jsr dispdt
	lda d1str+5
	cmp #'0'
	bne dispd3
	lda #' '
dispd3:
	jsr dispdt
	lda d1str+6
	jsr dispdt
	lda #comma
	jsr dispdt
	lda #' '
	jsr dispdt
	lda #'2'
	jsr dispdt
	lda #'0'
	jsr dispdt
	lda d1str+1
	jsr dispdt
	lda d1str+2
	jsr dispdt
	lda #' '
	jsr dispdt
	lda d1str+7
	and #$31
	cmp #'0'
	bne dispd4
	lda #' '
dispd4:
	jsr dispdt
	lda d1str+8
	jsr dispdt
	lda #':'
	jsr dispdt
	lda d1str+9
	jsr dispdt
	lda d1str+10
	jsr dispdt
	lda #':'
	jsr dispdt
	lda scs
	pha
	lsr
	lsr
	lsr
	lsr
	ora #$30
	jsr dispdt
	pla
	and #$0f
	ora #$30
	jsr dispdt
	lda #' '
	jsr dispdt
	lda d1str+7
	cmp #'8'
	bcs dispd5
	lda #'A'
	bne dispd6
dispd5:
	lda #'P'
dispd6:
	jsr dispdt
	lda #'M'
	jsr dispdt
	lda #' '
;* convert to screen, store it
dispdt:
	pha
	and caseflag
	cmp #128
	bcs dispdt1
dispdt2:
	cmp #64
	bcc dispdt1
	and #63
dispdt1:
	ora #$80
	sta tdisp+1,x
dispdt3:
	inx
	pla
	rts

;* convert bcd to ascii
bcdtoa:
	tax
	lsr
	lsr
	lsr
	lsr
	ora #$30
	tay
	txa
	and #$0f
	ora #$30
	tax
	tya
	rts

;* display time remaining

disptime:
	ldx #32
	lda #' '
	jsr dispdt
	jsr gettsr
	beq dt0
	cmp #101
	bcc dt01
	lda #101
	jsr settsr
	lda #'-'
	tay
	bne dt3
dt01:
	sec
	sbc #1
dt0:
	ldy #$30
dt1:
	cmp #10
	bcc dt2
	sbc #10
	iny
	bne dt1
dt2:
	ora #$30
dt3:
	pha
	tya
	jsr dispdt
	pla
	jsr dispdt
	lda #':'
	jmp dispdt

; screen blanking
irq3:
	jsr chkblnk
	beq irq3a
	lda blnkflag
	bne irq3a
	inc blnkcntr
	bne irq3b
scrnoff:
	ldx #$0b
	lda #1
	bne scrnon1
scrnon:
	ldx #$1b
	lda #0
scrnon1:
	jsr scrnset
irq3a:
	lda #0
	sta blnkcntr
irq3b:
	rts
chkblnk:
	ldx #11
	jmp chkflag

bits:
	byte 1,2,4,8,16,32,64,128

;* put check on screen for carrier
irq5:
	ldx #$fa
	lda carrier
	eor mxor
	and #$10
	beq irq5a
	lda #1
	sta carrst
	ldx #$a0
	bne irq5d
irq5a:
	lda carrst
	ora #128
	sta carrst
irq5d:
	stx tdisp+39
	lda #$a0
	pha
	ldx #16
	ldy #5
	jsr chkflags
	bne irq5b
	pla
	lda #$fa
	pha
irq5b:
	pla
	sta tdisp
irq5c:
	rts

irq6:
	lda carrst
	and #127
irq6a:
	cmp #1
	beq irq6b
	sta irq6a+1
	cmp #0
	bne irq6b
	lda #1
	sta flag
irq6b:
	ldx #4
	ldy #5
	jsr chkflags
irq6c:
	cmp #0
	beq irq6d
	sta irq6c+1
	cmp #0
	beq irq6d
	lda carrst
	and #127
	beq irq6d
	lda #1
	sta flag
irq6d:
	ldx #36
	ldy #5
	jsr chkflags
	ldy #0
	tax
	beq irq6e
	ldy comqc
	sty mcolor
irq6e:
	sty fredmode
	rts

;* display lightbar checkmarks
irq7:
	ldy #1
	lda bar
	and #63
	sta bar
	cpy #0
	beq irq7z
	lda scnmode
	bne irq7z
	lda #0
	sta irq7+1
	lda tmpbar
	pha
	lda bar
	and #7
	sta tmpbar
	asl
	asl
	adc tmpbar
	sta tmpbar
	lda bar
	and #$38
	sta irq7a+1
	asl
	clc
irq7a:
	adc #0
	tay
	lda bar
	lsr
	lsr
	lsr
	asl
	tax
	lda chktbl+1,x
	pha
	lda chktbl+0,x
	ldx #0
irq7b:
	jsr irq7h
	cpx #20
	bcc irq7b
	pla
irq7c:
	jsr irq7h
	cpx #40
	bcc irq7c
	pla
	sta tmpbar
irq7z:
	rts

irq7d:
	lsr
	pha
	lda #' '
	bcc irq7e
	lda #$7a
irq7e:
	jsr irq7f
	pla
	rts

irq7j:
	lda bartbl,y
	iny
irq7f:
	ora #$80
	sta ldisp,x
irq7g:
	lda #15
	sta lcolr,x
	inx
	rts

irq7h:
	pha
	lda #15
	cpx tmpbar
	bne irq7i
	lda #1
irq7i:
	sta irq7g+1
	pla
	jsr irq7d
	pha
	jsr irq7j
	jsr irq7j
	jsr irq7j
	pla
	jmp irq7d

chkflag:
	ldy #5
chkflags:
; &,52,.x,.y
; enter with .x: lightbar item to work with (&,52,$hex,y allowed)
; .y: mode: see comments
	lda $ff
	pha
	stx $ff
	txa
	and #7
	tax
	lda bits,x
	pha
	lda $ff
	lsr
	lsr
	lsr
	and #$0f
	tax
	pla
	iny
	dey
	beq chkflag0	; &,52,x,0: clear
	dey
	beq chkflag1	; &,52,x,1: set
	dey
	beq chkflag2	; &,52,x,2: toggle
	dey
	beq chkflag3	; &,52,x,3: read status into a% (0=off, 1=on)
	dey
	beq chkflag4	; &,52,x,4: move lit section to .y
	dey
	beq chkflag5	; (ML only?): like &,52,x,3 but return status in .a?
chkflag6:
	sta chktbl,x
chkflag7:
	inc irq7+1
chkflag8:
	tax
	pla
	sta $ff
	txa
	rts

chkflag0:
	eor #$ff
	and chktbl,x
	jmp chkflag6
chkflag1:
	ora chktbl,x
	jmp chkflag6

chkflag2:
	eor chktbl,x
	jmp chkflag6
chkflag3:
	ldy #0
	sty var
	and chktbl,x
	beq chkflg3a
	iny
chkflg3a:
	sty var+1
	ldx #30
	jsr putvar ;a%
	jmp chkflag8
chkflag4:
	lda $ff
	sta bar
	jmp chkflag7
chkflag5:
	and chktbl,x
	jmp chkflag8

tmpbar:
	byte 0

; fkey: function key routines

fkey:
	ldx tmpkey
	lda 653
	and #4		; ctrl hit
	bne fkey1
	inx
fkey1:
	txa
	clc
	adc #40
	asl
	tay
	lda 3
	pha
	lda 4
	pha
	lda vars,y
	sta 3
	lda vars+1,y
	sta 4
	ldy #0
	lda (3),y
	sta fkeybuf
	iny
	lda (3),y
	tax
	iny
	lda (3),y
	sta 4
	stx 3
	ldy #0
	ldx fkeybuf
	beq fkey3
fkey2:
	lda (3),y
	sta fkeybuf+1,y
	iny
	dex
	bne fkey2
	lda #0
	sta fkeybuf+1,y
	lda #1
	sta fkeybuf
fkey3:
	pla
	sta 4
	pla
	sta 3
fkey4:
	rts

irq9:
	jsr $ffea
	lda $cc
	bne irq9f
	dec $cd
	bne irq9f
	lda #$14
	sta $cd
	ldy $d3
	lsr $cf
	ldx $0287
	lda ($d1),y
	bcs irq9e
	inc $cf
	sta $ce
	jsr $ea24
	lda ($f3),y
	sta $287
	ldx $0286
	lda $ce
irq9e:
	eor #$80
	jsr $ea1c
irq9f:
	jmp $ea87

irq10:
	lda sndtim1
	beq irq10a
	dec sndtim1
	bne irq10d
	lda sndwav1
	ldx sndwav2
	ldy sndwav3
	jsr irq10c
irq10a:
	lda sndtim2
	beq irq10d
	dec sndtim2
	bne irq10d
	lda #0
	tax
	tay
	jsr irq10c
	lda sndrept
	beq irq10d
	cmp #255
	beq irq10b
	dec sndrept
irq10b:
	lda sndtim1a
	sta sndtim1
	lda sndtim2a
	sta sndtim2
	lda sndwav3
	ora #1
	tay
	lda sndwav2
	ora #1
	tax
	lda sndwav1
	ora #1
irq10c:
	sta $d404
	stx $d40b
	sty $d412
irq10d:
	rts

settim:
	lda #$08
	byte $2c
setalm:
	lda #$88
	sta $dc0f
	cmp #$88
	beq settim2
	lda #1
	sta timeflag
	cpx #12
	bne settim1
	ldx #92
	bne settim2
settim1:
	cpx #92
	bne settim2
	ldx #12
settim2:
	txa
	jsr settim3
	sta hrs
	tya
	jsr settim3
	sta min
	lda #0
	sta scs
	sta ten
	lda #$08
	sta $dc0f
	rts

settim3:
	ldx #0
settim4:
	cmp #10
	bcc settim5
	sbc #10
	inx
	bne settim4
settim5:
	sta $ff
	txa
	asl
	asl
	asl
	asl
	ora $ff
	rts

irq4:
	lda 197
	cmp oldkey
	beq irq4c
	sta oldkey
	cmp #3
	bcc irq4c
	cmp #7
	bcs irq4c
	and #3
	asl
	sta tmpkey
	lda 653
	cmp #2		; c= hit?
	bcs irq4d
	and #1
	sta shfkey
	ora tmpkey
	asl
	tay
	jsr irq4b
	sta irq4a+1
	iny
	jsr irq4b
	sta irq4a+2
irq4a:
	jmp $ffff

irq4b:
	lda ktbl1,y
irq4c:
	rts
irq4d:
	jmp fkey

tmpkey:
	byte 0
oldkey:
	byte 64
shfkey:
	byte 0

ktbl1:
	word t1fk1,t1fk2
	word t1fk3,t1fk4
	word t1fk5,t1fk6
	word t1fk7,t1fk7

t1init:
	ldy #0
	jsr chkflags
	ldx #<ktbl1
	ldy #>ktbl1
usekey:
	stx irq4b+1
	sty irq4b+2
	rts
t1fk1:
	ldx scnlock
	bne t1fk3b
	ldx scnmode
	jmp setmode1
t1fk2:
	lda blnkflag
	bne t1fk2a
	jmp scrnoff
t1fk2a:
	jmp scrnon

t1fk3:
	dec bar
t1fk3a:
	inc irq7+1
t1fk3b:
	rts

t1fk4:
	sec
	lda bar
	sbc #8
t1fk4a:
	sta bar
	jmp t1fk3a
t1fk5:
	inc bar
	jmp t1fk3a
t1fk6:
	clc
	lda bar
	adc #8
	jmp t1fk4a
t1fk7:
	lda bar
	asl
	ora shfkey
	pha
	tax
	ldy #2
	jsr chkflags
	pla
	cmp #2
	beq t1fk7a
	cmp #6
	beq t1fk7b
	cmp #12
	beq t1fk7c
	rts

t1fk7a:
	jmp t3init ;acs
t1fk7b:
	jmp t2init ;tsr
t1fk7c:
	lda outptrfl	; defined in character-io.asm
	eor #1
	sta outptrfl
	rts

; edit user's time
ktbl2:
	word t2fk1,t2fk2
	word t2fk3,t2fk4
	word t2fk5,t2fk6
	word t2fk7,t2fk7

t2init:
	ldx #<ktbl2
	ldy #>ktbl2
	jmp usekey
t2fk1:
	lda #0
	byte $2c
t2fk2:
	lda #101
t2fk2a:
	jmp settsr

t2fk3:
	ldx #1
	byte $2c
t2fk4:
	ldx #10
t2fk4a:
	jsr gettsr
	tay
@l2:
	cpy #101
	beq t2fk4b
	iny
	dex
	bne <@l2
t2fk4b:
	tya
	jsr settsr
	jmp disptime
t2fk5:
	ldx #1
	byte $2c
t2fk6:
	ldx #10
t2fk6a:
	jsr gettsr
	tay
@l1:
	cpy #0
	beq t2fk6b
	dey
	dex
	bne <@l1
t2fk6b:
	jmp t2fk4b

t2fk7:
	ldx #6
	jmp t1init

;
; edit user's access
;
ktbl3:
	word t3fk1,t3fk2
	word t3fk5,t3fk5
	word t3fk3,t3fk3
	word t3fk7,t3fk7

t3init:
	ldx #<ktbl3
	ldy #>ktbl3
	jsr usekey
	ldx #24
	jsr gvarptr ;ac%
	stx t3ini1+1
	sty t3ini1+2
	stx t3fk7a+1
	sty t3fk7a+2
	ldy #1
t3ini1:
	lda $ffff,y
	and #$0f
	ora #$b0
	sta adisp+22
	rts
t3fk3:
	dec adisp+22
	lda adisp+22
	cmp #$b0
	bcs t3fk3a
t3fk2:
	lda #$b9
	sta adisp+22
t3fk3a:
	rts
t3fk5:
	inc adisp+22
	lda adisp+22
	cmp #$ba
	bcc t3fk5a
t3fk1:
	lda #$b0
	sta adisp+22
t3fk5a:
	rts
t3fk7:
	lda adisp+22
	and #$0f
	ldy #1
t3fk7a:
	sta $ffff,y
	ldx #2
	jmp t1init

minhi:
	byte 0
minlo:
	byte 0

cminute:
	txa
	pha
	lda #0
	sta minlo
	sta minhi
	tya
	and #$7f
	cmp #$12
	bne cminute1
	tya
	sec
	sbc #$12
	tay
cminute1:
	tya
	lsr
	lsr
	lsr
	lsr
	tax
	tya
	and #$0f
	cpx #0
	beq cminute3
cminute2:
	clc
	adc #10
	dex
	bne cminute2
cminute3:
	cmp #80
	bcc cminutex
	sbc #68
cminutex:
	ldy #60
	jsr cminute4
	pla
	pha
	lsr
	lsr
	lsr
	lsr
	ldy #10
	jsr cminute4
	pla
	and #$0f
	ldy #1

cminute4:
	tax
	beq cminute7
cminute5:
	clc
	tya
	adc minlo
	sta minlo
	bcc cminute6
	inc minhi
cminute6:
	dex
	bne cminute5
cminute7:
	rts

alarm:
	ldx bootdate+5
	ldy bootdate+4
	jsr cminute
	ldx #49
	jsr gvarptr ;mn%
	stx alarmy+1
	sty alarmy+2
	ldy #1
alarmx:
	lda minhi,y
alarmy:
	sta minhi,y
	dey
	bpl alarmx
	lda #0
alarm0:
	sta alarm1+1
alarm1:
	ldx #0
	lda alarmtb,x
	bne alarm2
	lda alarmtb+1,x
	tax
	ldy #5
	jsr chkflags
	bne alarm3
	beq alarm6
alarm2:
	lda alarmtb+1,x
	beq alarm6
alarm3:
	ldx alarm1+1
	lda alarmtb+2,x
	cmp minhi
	bne alarm4
	lda alarmtb+3,x
	cmp minlo
	bne alarm4
	ldy #1
	bne alarm5
alarm4:
	lda alarmtb+4,x
	cmp minhi
	bne alarm6
	lda alarmtb+5,x
	cmp minlo
	bne alarm6
	ldy #0
alarm5:
	lda alarmtb+7,x
	tax
	jsr chkflags
alarm6:
	lda alarm1+1
	clc
	adc #8
	bpl alarm0
	ldx #28
	ldy #5 ;net-l
	jsr chkflags
	beq alarm8
	ldy #0
alarm7:
	lda netalrm,y
	cmp minhi
	bne alarm10
	lda netalrm+1,y
	cmp minlo
	beq alarm9
alarm10:
	iny
	iny
	cpy #48
	bcc alarm7
alarm8:
	rts
alarm9:
	ldx #29
	ldy #1 ;net-r
	jmp chkflags

{ifdef:standalone}
; these are just here to squelch undefined symbol errors

bootdate:	area 11
comqc:		byte 1
d1str:		area 11

; from build.lbl:
;
; days in each month (in BCD format, I think, but 10 months only?)
;
ha560:
	byte $31,$28,$31,$30,$31,$30,$31,$31,$30,$00


; from includes (23 bytes + $00)
daytbl:
	ascii "SunMonTueWedThuFriSat"

;>C:c000  53 75 6e 4d  6f 6e 54 75   SunMonTu
;>C:c008  65 57 65 64  54 68 75 46   eWedThuF
;>C:c010  72 69 53 61  74 00 00 00   riSat...

{endif}
