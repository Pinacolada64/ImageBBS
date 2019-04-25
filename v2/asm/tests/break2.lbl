' break2.s - updated 12/4/2017
' display information (current address, stack pointer, $00, $01) when BRK encountered

' translated from compute!s fast assembler to c64list3.05:
' <http://www.commodoreserver.com/Downloads.asp>
' perhaps xa would work better:
' <http://www.floodgap.com/retrotech/xa/>

{number:10}
	sys{sym:setup}
	poke 828,0:sys 828
	end
{asm}
setup:
	lda #<brk1
	sta $316
	lda #>brk1
	sta $317
	rts
;
brkbuf	= $c000

brk1:
	ldx #5
	lda #27
	sta $d011
brk2:
	pla
	sta brkbuf,x
	dex
	bpl brk2
	tsx
	stx brkbuf+6
	sec
	lda 0
	sta brkbuf+7
	lda 1
	sta brkbuf+8
	lda $df02
	sta brkbuf+9
	lda brkbuf+1
	sbc #2
	sta brkbuf+1
	bcs brk2a
	dec brkbuf
brk2a:
	ldy #0
brk2b:
	lda msg1,y
	beq brk2c
	jsr hex2
	iny
	jmp brk2b
brk2c:
	ldx #0
brk3:
	cpx #2
	bcc brk3a
	lda #$20	; space
	jsr hex2
brk3a:
	lda brkbuf,x
	jsr hex
	inx
	cpx #10
	bne brk3
	lda #$0d
	jsr hex2
	ldy #0
brk3b:
	lda msg2,y
	beq brk3c
	jsr hex2
	iny
	jmp brk3b
brk3c:
	ldy #0
brk4:
	pla
	jsr hex
	iny
; this was commented out in original code:
	lda #$20	; space
	jsr hex2
; end commented out
	cpy #16
	bcc brk5
	lda #$0d
	jsr hex2
	ldy #0
brk5:
	tsx
	cpx #$ff
	bne brk4
	lda #$0d
	jsr hex2
	lda #$0d
	jsr hex2
;
; byte 2
;
hex:
	pha
	lsr
	lsr
	lsr
	lsr
	jsr hex1
	pla
hex1:
	and #$0f
	ora #$30
	cmp #$3a
	bcc hex2
	adc #$06
hex2:
	sta char
	txa
	pha
	ldx cpos
	lda char
	cmp #13
	beq hex3
hex2a:
	sta $0400,x
	lda #1
hex2b:
	sta $db00,x
	inx
	stx cpos
	cpx #40
	bcc hex4
hex3:
	clc
	lda hex2a+1
	adc #40
	sta hex2a+1
	lda hex2a+2
	adc #0
	sta hex2a+2
	clc
	lda hex2b+1
	adc #40
	sta hex2b+1
	lda hex2b+2
	adc #0
	sta hex2b+2
	ldx #0
	stx cpos
hex4:
	pla
	tax
	lda char
	rts
;
cpos:
	byte 0
char:
	byte 0
;
msg1:
alpha	= $40	; for poking lowercase strings to screen, $40+1 = "a"
; Original source had no strings here, "msg1:" and "msg2:" are therefore
; placeholders until I figure out what they're supposed to say
	byte $53	; "m"
	byte $59	; "s"
	byte $47	; "g"
	byte $31	; "1"
	byte 58		; ":"
	byte 13		; <return>
	byte 0		; <null>
msg2:
	byte $53	; "m"
	byte $59	; "s"
	byte $47	; "g"
	byte $32	; "2"
	byte 58		; ":"
	byte 13		; <return>
	byte 0		; <null>
{endasm}
