; print"02/02/91 01:25p"
;
;* character output routines *
;
;* output character in .a
;* preserve registers
xchrout:
	sta $fe
xchrout1:
	tya
	pha
	txa
	pha
	jsr outchr
xchrout2:
	pla
	tax
	pla
	tay
	lda $fe
	rts

;* output character, and
;* get response character
output:
	jsr outchr
	jsr getchr
	ldx #$a0
	lda $fe
	beq output1a
	cmp #'{home}'
	beq output2
output0:
	ldx #$a0
	cmp #'/'
	beq output1
	cmp #' '
	beq output1
	cmp #3	; ctrl-c?
	bne output1a
output1:
	sta chat
	ldx #'A'
output1a:
	stx tdisp+30
	rts
output2:
	lda #'P'
	sta tdisp+30
	jsr xgetchr0
	lda #$a0
	sta tdisp+30
	lda $fe
	jmp output0

setoutmd:
	lda passmode
	and #1
	beq setout1
	ldx #<outchr1
	ldy #>outchr1
	bne setout4
setout1:
	lda mci
	bpl setout2
	ldx #<outchr2
	ldy #>outchr2
	bne setout4
setout2:
	lda wrapflg
	beq setout3
	ldx #<outchr4
	ldy #>outchr4
	bne setout4
setout3:
	ldx #<outchr3
	ldy #>outchr3
setout4:
	stx outchr0+1
	sty outchr0+2
	rts

;* output character
outchr:
	lda $fe
	jsr chkspcl
	sta $fe
	jsr setoutmd
	lda $fe
outchr0:
	jmp outchr1

outchr1:
	jsr ctrlchk0	; defined in string-io.asm
	bcc outchr3
	lda mask
	sta $fe
	jmp outchr3

outchr2:
	jsr ctrlchk0
	bcs outchr3
	cmp #13
	beq outchr3
	cmp #20
	beq outchr3
	pha
	lda #'{rvrs on}'
	jsr outchr2a
	pla
	ora #64
	jsr outchr2a
	lda #'{rvrs off}'
outchr2a:
	sta $fe
outchr3:
	jsr outscn0	; defined in swap2.asm or screen-handler.asm?
	jsr outmdm0
	jmp outptr

outchr4:
	lda $fe
	ldx wrapind
outchr5:
	sta wrapbuf,x
	inx
	stx wrapind
	and #$7f
	cpx #80
	bcs outchr6
	cmp #33
	bcc outchr6
	rts
flushwrd:
	ldx wrapind
	bne outchr6
	rts
outchr6:
	lda #13
	sta $fe
	clc
	lda wrapind
	adc scnpos
	adc mright
	cmp #41
	bcc outchr6a
	jsr outscn
	clc
outchr6a:
	lda wrapind
	adc ptrclm
	adc mright
	tay
	dey
	cpy ptrclmn
	bcc outchr6b
	jsr outptr
	clc
outchr6b:
	lda wrapind
	adc modclm
	adc mright
	tay
	dey
	cpy modclmn
	bcc outchr6c
	jsr outmdm
outchr6c:
	ldy #0
	sty wrapdmp
outchr7:
	cpy wrapind
	beq outchr7a
	lda wrapbuf,y
	sta $fe
	jsr outscn
	jsr outmdm
	jsr outptr
	inc wrapdmp
	ldy wrapdmp
	bne outchr7
outchr7a:
	lda #0
	sta wrapind
	rts

outmdm:
	lda wrapflg
	beq outmdm0
	lda $fe
	cmp #32
	bne outmdm0
	ldx modclm
	inx
	cpx modclmn
	bcs outmdm2
outmdm0:
	lda $fe
	ldx modclm
	ldy usrlin
	jsr outadj
	stx modclm
	sty usrlin
	lda inchat
	bne outmdm1
	jsr carchk4
	bne outmdm2
outmdm1:
	lda $fe
	cmp #13
	bne outmdm3
	ldx mleft
	beq outmdm3
	stx outmdmc
	jsr outmod
	lda #' '
	sta $fe
outmdm4:
	jsr outmod
	dec outmdmc
	bne outmdm4
	lda #13
	sta $fe
	rts
outmdm3:
	jmp outmod
outmdm2:
	rts
outmdmc:
	byte 0

outptr:
	ldx #0
	bne outptr5
outptr6:
outptrfl = *+1	; referenced in irqhn.asm
	ldx #0
	bne outptr5
	rts

outptr5:
	lda $fe
	and #$7f
	cmp #32
	lda $fe
	bcs outptr0
	jsr colorchk
	bcc outptr4
	jsr ctrlchk2
	bcc outptr4
	cmp #13
	bne outptr4
outptr0:
	ldx ptrclm
	ldy ptrlin
	jsr outadj
	stx ptrclm
	sty ptrlin
outptr1:
	ldx #4
	jsr chkout
	lda $90
	bmi outptr3
	lda $fe
	jsr chrout
	cmp #13
	bne outptr3
	lda ptrlnfd
	beq outptr2
	jsr chrout
outptr2:
	lda #0
	sta outptr+1
	ldx mleft
	beq outptr3
outptr7:
	lda #' '
	jsr chrout
	dex
	bne outptr7
outptr3:
	jmp clrchn
outptr4:
	rts

;* output carriage return
prcr:
	lda #$0d
	jmp xchrout

;* output delete character
prdel:
	lda #$14
	jmp xchrout

;
;* character input routines *
;
;* get character into .a
;* handle mci access
xgetin:
	jsr xgetchr
	cmp #'{home}'
	beq xgetin
	cmp #'{pound}'
	bne xgetin2
	lda editor
	and #$08
	bne xgetin1
	jmp xgetin
xgetin1:
	lda #'{pound}'
xgetin2:
	rts

xgetchr:
	jsr setoutmd
	jsr flushwrd
	lda #0
	sta usrlin
xgetchr0:
	jsr getchr
	jsr carchk
	bne xgetchr1
	jsr chatchk
	bne xgetchr1
	lda $fe
	beq xgetchr0
	rts
xgetchr1:
	lda #13
	rts
;
;* input character to an$
;* waits for character
inchr:
	jsr xgetin
	lda $fe
	sta buffer
	lda #1
	sta var
	lda #<buffer
	sta var+1
	lda #>buffer
	sta var+2
	ldx #$00
	jmp putvar ;an$

;* get character
;* with case setting
getchr:
	jsr getkbd
	bne getchr1
	jsr carchk4
	bne getchr7
	jsr getmod
getchr1:
	cmp #$60
	bcc getchr3
	cmp #$80
	bcs getchr3
	adc #$60
getchr3:
	cmp #$a0
	bcc getchr4
	cmp #$bf
	bcs getchr4
	adc #$40
getchr4:
	cmp #$e0
	bne getchr5
	lda #$20
getchr5:
	cmp #$de
	bne getchr6
	lda #$ff
getchr6:
	tax
	lda editor
	and #$01
	bne getchr8
	cpx #$e0
	bcs getchr7
	cpx #$7b
	bcc getchr8
	cpx #$80
	bcs getchr8
getchr7:
	ldx #0
getchr8:
	stx $fe
	lda curdsp
	beq getchr9
	ldx #4
	ldy #5
	jsr chkflags
	bne getchr9
	lda idlejif
	cmp #60
	bcc getchr9
	lda #0
	sta idlejif
	lda idlesec
	ldx idleten
	ldy idlemin
	clc
	adc #1
	cmp #10
	bcc getchr8a
	lda #0
	inx
	cpx #6
	bne getchr8a
	ldx #0
	iny
	cpy idlemax
	bcc getchr8a
	pha
	lda #0
	jsr settsr
	pla
getchr8a:
	jsr dspidle
getchr9:
	lda $fe
	ldx case
	beq getchr11
	cmp #$41
	bcc getchr11
	cmp #$5b
	bcs getchr11
	ora #$80
getchr11:
	ldx #7
getchr12:
	cmp spchars,x
	beq getchr13
	dex
	bpl getchr12
	bmi getchr14
getchr13:
	cpx #6
	beq getchr14
	txa
	clc
	adc #$85
getchr14:
	sta $fe
	rts

getkbd:
	jsr crsron
getkbd0:
	ldx fkeybuf
	beq getkbd2
	inc fkeybuf
	lda fkeybuf,x
	bne getkbd1
	lda #0
	sta fkeybuf
getkbd2:
	lda 198
	bne getkbd3
	rts
getkbd3:
	jsr $f142
	cmp #$85
	bcc getkbd1
	cmp #$8d
	bcs getkbd1
	lda #0
getkbd1:
	cmp #0
	rts

;* get character from the modem
;* and move recieve window
getmdm:
	jsr rsinabl
	sec
	jsr rsget
	bcs getmdm6
	pha
	ldx #16
	ldy #5
	jsr chkflags
	beq getmdm1
	pla
	and #$7f
	pha
getmdm1:
	pla
	rts
getmdm6:
	lda #0
	rts

; ********************************
; * misc character routines      *
; * last revision: 8/30/87       *
; ********************************

; check carrier
; returns:
;0 if carrier / local
;1 if carrier dropped
;2 if time out

carchk:
	lda local
	bne carchk2
	ldx #4
	ldy #5
	jsr chkflags
	bne carchk2
	jsr carchk3
	beq carchk1
	lda #0
	jsr settsr
	jsr disptime
	lda #1
	rts
carchk1:
	jsr gettsr
	bne carchk2
	lda editor
	and #$40
	bne carchk2
	lda #2
	rts
carchk2:
	lda #0
	rts
; check actual carrier
; 0 = ok
; 1 = drop
carchk3:
	lda carrst
	and #127
	rts

;check if it's ok to use the modem
; 0 = ok
; <>0 = no
carchk4:
	ldx #4
	ldy #5
	jsr chkflags
	bne carchk5
	lda local
	bne carchk5
	jmp carchk3
carchk5:
	rts

chatchk:
	ldx #8
	ldy #5
	jmp chkflags

outadj:
	cmp #13
	beq outadj1
	cmp #20
	beq outadj3
	cmp #'{right}'
	beq outadj4
	cmp #'{left}'
	beq outadj3
	cmp #'{down}'
	beq outadj7
	cmp #'{up}'
	beq outadj6
	and #$7f
	cmp #'{home}'
	beq outadj8
	cmp #32
	bcs outadj4
	rts
outadj1:
	iny
outadj2:
	ldx #0
	rts
outadj3:
	cpx #0
	beq outadj5
	dex
	rts
outadj4:
	inx
outadj5:
	rts
outadj6:
	cpy #0
	bne outadj5
	dey
	rts
outadj7:
	iny
	rts
outadj8:
	ldx #0
	ldy #0
	rts
