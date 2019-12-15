{number:1}
	print "dtoi":sys {sym:dtoi}
	a=peek({sym:fac1}+0)
	b=peek({sym:fac1}+1)
	c=peek({sym:fac1}+2)
	d=peek({sym:fac1}+3)
	print "fac1:";a,b,c,d
	print d+256*(c+256*(b+256*a))
	print "datebuf: ";:for i=0 to 10:print chr$(peek(i+{sym:datebuf}));:next:print
	print "{down}itod":sys {sym:itod}
	print "datebuf: ";:for i=0 to 10:print chr$(peek(i+{sym:datebuf}));:next:print
	print "{down}d11to6":sys {sym:d11to6}
	print "date6: ";:for i=0 to 5:print peek({sym:date6}+i);:next:print
	print "{down}dcalcday":sys {sym:dcalcday}
	print "fac1+3:";peek({sym:fac1}+3)+1
	print (peek({sym:work}+2)*256+peek({sym:work}+3))*7+peek({sym:fac1}+3)
{asm}
fac1:
	byte 0,0,0,0
fac2:
	byte 0,0,0,0
work:
	byte 0,0,0,0
datebuf:
	ascii "19001011200"
date6:
	byte 01,89,08,12,81,26
;
;
; fac1 = fac1 / fac2
idiv:
	jsr imod
	jmp imw2f
;
; fac1 = fac1 % fac2
imod:
	lda fac2+0
	ora fac2+1
	ora fac2+2
	ora fac2+3
	bne idiv0
	rts
	
idiv0:
	jsr izwork
	ldx #1
idiv0a:
	lda fac2+0
	bmi idiv1
	asl fac2+3
	rol fac2+2
	rol fac2+1
	rol fac2+0
	inx
	jmp idiv0a
idiv1:
	jsr icmp
	bcc idiv2
	jsr isub
	sec
idiv2:
	rol work+3
	rol work+2
	rol work+1
	rol work+0
	lsr fac2+0
	ror fac2+1
	ror fac2+2
	ror fac2+3
	dex
	bne idiv1
	rts
;
; fac1 = fac1 - fac2
isub:
	sec
	lda fac1+3
	sbc fac2+3
	sta fac1+3
	lda fac1+2
	sbc fac2+2
	sta fac1+2
	lda fac1+1
	sbc fac2+1
	sta fac1+1
	lda fac1+0
	sbc fac2+0
	sta fac1+0
	rts
;
; compare fac1 to fac2
icmp:
	lda fac1+0
	cmp fac2+0
	bne icmp1
	lda fac1+1
	cmp fac2+1
	bne icmp1
	lda fac1+2
	cmp fac2+2
	bne icmp1
	lda fac1+3
	cmp fac2+3
icmp1:
	rts
;
; fac1 = fac1 * fac2
imul:
	jsr imf2w
	jsr izfac1
imul1:
	lda work+0
	ora work+1
	lda work+2
	ora work+3
	beq imul3
	lsr work+0
	ror work+1
	ror work+2
	ror work+3
	bcc imul2
	jsr iadd
imul2:
	asl fac2+3
	rol fac2+2
	rol fac2+1
	rol fac2+0
	jmp imul1
imul3:
	rts
;
; fac1 = fac1 + fac2
iadd:
	clc
	lda fac1+3
	adc fac2+3
	sta fac1+3
	lda fac1+2
	adc fac2+2
	sta fac1+2
	lda fac1+1
	adc fac2+1
	sta fac1+1
	lda fac1+0
	adc fac2+0
	sta fac1+0
	rts
;
imodx:
	jsr ibyte
	jmp imod
iaddx:
	jsr ibyte
	jmp iadd
imul10:
	ldx #10
	imulx: jsr ibyte
	jmp imul
;
ibyte:
	lda #0
	sta fac2+0
	sta fac2+1
	sta fac2+2
	stx fac2+3
	rts
;
imf2w:
	lda fac1+0
	sta work+0
	lda fac1+1
	sta work+1
	lda fac1+2
	sta work+2
	lda fac1+3
	sta work+3
	rts

imw2f:
	lda work+0
	sta fac1+0
	lda work+1
	sta fac1+1
	lda work+2
	sta fac1+2
	lda work+3
	sta fac1+3
	rts
;
iswap:
	ldx #3
iswap1:
	lda fac1,x
	pha
	lda fac2,x
	sta fac1,x
	pla
	sta fac2,x
	dex
	bpl iswap1
	rts
;
; zero out fac1
izfac1:
	lda #0
	sta fac1+0
	sta fac1+1
	sta fac1+2
	sta fac1+3
	rts

; zero out work buffer
izwork:
	lda #0
	sta work+0
	sta work+1
	sta work+2
	sta work+3
	rts
;
dgettwo:
	jsr izfac1
	jsr dgetone
	asl
	asl
	adc fac1+3
	asl
	sta fac1+3
dgetone:
	lda datebuf,y
	iny
	and #$0f
	clc
	adc fac1+3
	sta fac1+3
	rts
;
dgethour:
	jsr dgettwo
	cmp #80
	bcc dgethr1
	sbc #68
dgethr1:
	cmp #12
	bne dgethr2
	sec
	sbc #12
dgethr2:
	cmp #24
	bne dgethr3
	sec
	sbc #12
dgethr3:
	sta fac1+3
	rts
;
;convert 11 byte date to int
;(from datebuf to fac1)
; x=(((y*12+m)*31+d)*24+h)*60+n
;
dtoi:
	ldy #1
	jsr dgettwo ;y
	ldx #12
	jsr imulx ;*12
	jsr iswap
	jsr dgettwo
	dec fac1+3
	jsr iadd ;+m
	ldx #31
	jsr imulx ;*31
	jsr iswap
	jsr dgettwo
	dec fac1+3
	jsr iadd ;+d
	ldx #24
	jsr imulx ;*24
	jsr iswap
	jsr dgethour
	jsr iadd ;+h
	ldx #60
	jsr imulx ;*60
	jsr iswap
	jsr dgettwo
	jsr iadd ;+n
	rts
;
dputtwo:
	ldx #0
dputt1:
	cmp #10
	bcc dputt2
	sbc #10
	inx
	bne dputt1
dputt2:
	jsr dputone
	txa
dputone:
	ora #$30
	sta datebuf,y
	dey
	rts
;
dputhour:
	cmp #12
	bne dputhr1
	clc
	adc #12
dputhr1:
	cmp #0
	bne dputhr2
	clc
	adc #12
dputhr2:
	cmp #13
	bcc dputhr3
	clc
	adc #68
dputhr3:
	jmp dputtwo
;
ddoput:
	jsr imodx
ddoput0:
	lda fac1+3
	jsr dputtwo
	jmp imw2f
ddoput1:
	jsr imodx
	inc fac1+3
	jmp ddoput0
ddoputh:
	jsr imodx
	lda fac1+3
	jsr dputhour
	jmp imw2f

;convert int to 11 byte date
;(from fac1 to datebuf)

itod:
	ldy #10
	ldx #60
	jsr ddoput
	ldx #24
	jsr ddoputh
	ldx #31
	jsr ddoput1
	ldx #12
	jsr ddoput1
	jsr ddoput0
	lda #0
	jmp dputone

itof:
	lda fac1+0
	sta $62
	lda fac1+1
	sta $63
	lda fac1+2
	sta $64
	lda fac1+3
	sta $65
	lda $62
	eor #$ff
	rol
	lda #$00
	sta $70
	sta $66
	lda #$90
	sta $61
	jmp $b8d2
;
d11to6:
	ldy #0
	ldx #0
	jsr izfac1
	jsr dgetone ;day
	sec
	sbc #1
	sta date6,y
	inx
	jsr dgettwo ;year
	sta date6,x
	inx
	jsr dgettwo ;month
	sec
	sbc #1
	sta date6,x
	inx
	jsr dgettwo ;date
	sec
	sbc #1
	sta date6,x
	inx
	jsr dgethour ;hour
	sta date6,x
	inx
	jsr dgettwo ;min
	sta date6,x
	rts

dcalcday:
	jsr izfac1
	lda #>365
	sta fac1+2
	lda #<365
	sta fac1+3
	ldx date6+1
	jsr imulx
	lda date6+1
	beq dcalcd1
	sec
	sbc #1
	lsr
	lsr
	tax
	jsr iaddx
dcalcd1:
	ldy date6+2
	beq dcalcd3
dcalcd2:
	dey
	lda dmonths,y
	tax
	jsr iaddx
	cpy #0
	bne dcalcd2
dcalcd3:
	lda date6+2
	cmp #2
	bcc dcalcd4
	lda date6+1
	beq dcalcd4
	and #3
	bne dcalcd4
	ldx #1
	jsr iaddx
dcalcd4:
	ldx date6+3
	jsr iaddx
	ldx #1
	jsr iaddx
	ldx #7
	jmp imodx

dmonths:
	byte 31,28,31,30,31,30,31,31,30,31,30,31

{endasm}
