; version$="07/30/90 05:43a"
; include "equat.s",8
; for pass=1 to 2:org $c000,-(pass=3),8,"@:menu.o"
; print pass;

; 0 - # entries
; 1 - item type character
;2,3- item value
;4,5- credits to charge
;6,7- access
;8-39 - text
;
usetbl1 = $cd03
buffer = $ce77
buf2 = $ce27
;
jmp menu
;
byte 255
byte version$
;
mpos: byte 0
mode: byte 0
;
menu:
	jsr chkflags
j0:
	jmp useamenu
;
weedmenu:
	jsr topamenu
	jsr nextmenu
	lda 67
	sta 69
	lda 68
	sta 70
	ldx #30
	jsr usevar ;a%
	ldx last
	beq weedm4
weedm1:
	ldy #0
	lda (67),y
	beq weedm4
	ldy #6
	lda (67),y
	and var
	bne weedm2
	iny
	lda (67),y
	and var+1
	bne weedm2
	dex
	bne weedm3

weedm4:
	stx var+1
	lda #0
	sta var
	ldy #0
	sta (69),y
	stx last
	ldx #30
	jmp putvar ;a%
weedm2:
	ldy #39
l1:
	lda (67),y
	sta (69),y
	dey
	bpl l1
	lda 69
	clc
	adc #40
	sta 69
	lda 70
	adc #0
	sta 70
weedm3:
	jsr nextmenu
	jmp weedm1
;
useamenu:
	lda #1
	sta mpos
	ldx last
	beq usemenu1
usemenux:
	jsr showmenu
	jsr posnmenu
usemenu0:
	jsr getkey
	beq usemenu1
	cmp #1
	beq usemenu2
	cmp #2
	beq usemenu4
	cmp #3
	beq usemenu5
	cmp #4
	beq usemenux
	jmp usemenu0
;
usemenu4:
	lda mpos
	cmp #1
	beq usem4a
	dec mpos
	lda #"{up}"
	jsr output
usem4a:
	jmp usemenu0
;
usemenu5:
	lda mpos
	cmp last
	beq usem5a
	inc mpos
	lda #"{down}"
	jsr output
usem5a:
	jmp usemenu0
;
usemenu1:
	lda #0
	sta var
	sta var+1
	ldx #30
	jsr putvar ;a%
	ldx #31
	jsr putvar ;b%
	lda #"Q"
	jmp usemenu3
usemenu2:
	jsr calcmenu
	ldy #2
	lda (67),y
	sta var
	iny
	lda (67),y
	sta var+1
	ldx #30
	jsr putvar ;a%
	ldy #4
	lda (67),y
	sta var
	iny
	lda (67),y
	sta var+1
	ldx #31
	jsr putvar ;b%
	ldy #1
	lda (67),y
usemenu3:
	sta buffer
	lda #<buffer
	sta var+1
	lda #>buffer
	sta var+2
	lda #1
	sta var
	ldx #1
	jsr putvar ;a$
	lda #"{clear}"
	jsr output
	lda mpos
	rts
;
showmenu:
	jsr topamenu
	lda #"{clear}"
	jsr output
	lda last
	beq show2
	ldx #2
	jsr prtvar0 ;b$
	ldx #14
	jsr prtvar0 ;ak$
	lda #" "
	sta dispitem+1
	sta disp0+1
	jsr dispitem
	ldx #2
	jsr prtvar0 ;b$
	ldx #14
	jsr prtvar0 ;ak$
	lda mode
	beq show1
	lda #"A"
	sta dispitem+1
	lda #")"
	sta disp0+1
show1:
	ldy #0
	lda (67),y
	beq show2
	jsr dispitem
	jmp show1
show2:
	ldx #2
	jsr prtvar0 ;b$
	ldx #14
	jsr prtvar0 ;ak$
	ldx #28
	jmp prtvar0 ;p$
;
dispitem:
	lda #" "
	cmp #" "
	beq disp0a
	inc dispitem+1
disp0a:
	jsr output
disp0:
	lda #" "
	jsr output
	lda #" "
	jsr output
dispitm1:
	lda 67
	clc
	adc #8
	sta var+1
	lda 68
	adc #0
	sta var+2
	ldy #8
disp1:
	lda (67),y
	beq disp2
	iny
	cpy #40
	bcc disp1
disp2:
	tya
	sec
	sbc #8
	sta var
	ldx #1
	jsr putvar ;a$
	jsr outastr
	lda #13
	jsr output
nextmenu:
	lda 67
	clc
	adc #40
	sta 67
	lda 68
	adc #0
	sta 68
	rts
;
topamenu:
	lda #<last
	sta 67
	lda #>last
	sta 68
	rts
;
calcmenu:
	jsr topamenu
	ldx mpos
	beq calc2
calc1:
	jsr nextmenu
	dex
	bne calc1
calc2:
	rts
;
posnmenu:
	lda mode
	bne posn1
	lda #<posnstr
	sta var+1
	lda #>posnstr
	sta var+2
	clc
	lda mpos
	adc #4
	sta var
	ldx #1
	jsr putvar
	jmp outastr
posn1:
	rts
;
posnstr:
	ascii "{home}{right}{down:29}"
;
toupper:
	cmp #65
	bcc toupper1
	cmp #91
	bcs toupper1
	ora #128
toupper1:
	rts
;
getkey:
	jsr xgetin
	jsr toupper
	cmp #"X"
	beq getkey3
	cmp #'{$89}'	; ctrl-shift-i
	beq getkey5
	ldx mode
	bne getkey0
	cmp #"{up}"
	beq getkey1
	cmp #"{down}"
	beq getkey2
	cmp #"A"
	beq getkey1
	cmp #"B"
	beq getkey2
	cmp #"U"
	beq getkey1
	cmp #"D"
	beq getkey2
	cmp #13
	beq getkey4
	cmp #" "
	beq getkey4
	jmp getkey
getkey1:
	lda #2
	rts
getkey2:
	lda #3
	rts
getkey3:
	lda #0
	rts
getkey4:
	lda #1
	rts
getkey5:
	lda #4
	rts
getkey0:
	cmp #"A"
	bcc getkey
	clc
	sbc #191
	cmp last
	beq getkey6
	bcs getkey
getkey6:
	sta mpos
	lda #1
	rts
;
chkflags:
	pha
	txa
	pha
	tya
	pha
	lda #0
	sta mode
	ldx #16
	jsr chkflag
	beq chkflag1
	ldx #18
	jsr chkflag
	bne chkflag1
	lda #1
	sta mode
chkflag1:
	pla
	tay
	pla
	tax
	pla
	rts
;
outastr:
	lda #0
	jmp usetbl1
usevar:
	lda #29
	jmp usetbl1
putvar:
	lda #30
	jmp usetbl1
output:
	sta $fe
	lda #55
	jmp usetbl1
xgetin:
	lda #23
	jsr usetbl1
	lda $fe
	rts
chkflag:
	lda #52
	ldy #5
	jsr usetbl1
	cmp #0
	rts
prtvar0:
	lda #46
	jmp usetbl1
last:
;	next pass
;	close 8
;	print (last-49152) "bytes used"
;	print ($ca80-last) "bytes free"
