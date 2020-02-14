orig $c000

usetbl1	= $cd03
chrout	= $ffd2
clrchn	= $ffcc
chkout	= $ffc9
var	= $61

{undef:standalone}
{ifdef:standalone}
save_x:
	.byte $00
save_y:
	.byte $00
{endif}

dump:
; for standalone code only - I don't think "&,16,x,y"
; needs this temporary storage stuff

{ifdef:standalone}
	ldx save_x
	ldy save_y
{endif}
	stx dump3+1	; output device #
	sty dump7+1	; # of arrays to output
	lda #1
	sta dump1+1
	lda #0
	sta dump2+1
	jsr chkout
dump1:
	lda #1
	pha
	tax
	jsr getarr
	inc dump1+1
dump2:
	lda #0
	sec
	adc var
	cmp #79
	bcc dump4
	jsr clrchn
	lda #0
	sta dump2+1
dump3:
	ldx #2
	jsr chkout
dump4:
	ldy #0
dump5:
	cpy var
	beq dump6
	lda (var+1),y
	jsr chrout
	inc dump2+1
	iny
	bne dump5
dump6:
	lda #13
	jsr chrout
	inc dump2+1
	pla
dump7:
	cmp #100
	bcc dump1
	jmp clrchn

getarr:
	lda #33		; &,33: getarr
	jmp usetbl1
