orig $c000
{include:equates-2_0.asm}
; include "equat.s",8
; for pass=1 to 3:org $c000,-(pass=3),8,"@:ml.ecs"
; print pass: a=0
;
;short format
; 0....flag
; ..... bit 128 active command
; ..... bit .64 used =1/empty=0
; ..... bit .32 gosub=1/goto=0
; ..... bit .16 line#=1/file=0
; ..... bit ..8 short=1/long=0
; ..... bit ..4 param=1/none=0
; ..... bit ..2
; ..... bit ..1 zz lock
; 1-2..access
; 3-4..command
; 5-6..file
; 7....credits
;
;long format
; 0......flag (same as short)
; 1-2....access
; 3-9....command (7 chars)
; 10-23..file (14 chars)
; 24-31..password (7 chars)
; 32.....credits
;
@ecs:
	cpx #0
	bne ecs1
	jmp ecschk
ecs1:
	dex
	bne ecs2
	jmp ecsgoto
ecs2:
	dex
	bne ecs3
	jmp ecsget
ecs3:
	dex
	bne ecs4
	jmp ecsput
ecs4:
	dex
	bne ecs5
	jmp ecsload
ecs5:
	dex
	bne ecs6
	jmp ecssave
ecs6:
	rts

ecsgoto:
	ldx #30
	jsr usevar ;a%
	lda var+1
	sta $14
	lda var
	sta $15
	lda 1
	pha
	lda #$37
	sta 1
	jsr $a8a3
	pla
	sta 1
	rts

ecschk:
	ldx #0
	jsr usevar ;an$
	ldy var
	sty index
ecsc2:
	lda (var+1),y
	sta buffer,y
	dey
	bpl ecsc2
	ldx #24
	jsr usevar ;ac%
	ldx var+1
	sec
	lda #0
	sta acc
	sta acc+1
ecsc3:
	rol acc
	rol acc+1
	dex
	bpl ecsc3
	ldx #30
	jsr usevar ;a%
	lda var+1
	sta zzf
	lda index
	beq ecsquit
	ldy #0
	lda #<ecsdefs
	sta var+3
	lda #>ecsdefs
	sta var+4
ecsscan:
	lda (var+3),y
	tax
	and #64
	beq ecsnext
	txa
	and #3
	beq ecsscan1
	and zzf
	beq ecsnext
ecsscan1:
	ldy #1
	lda (var+3),y
	and acc
	bne ecsscan2
	ldy #2
	lda (var+3),y
	and acc+1
	beq ecsnext
ecsscan2:
	ldy #0
	lda (var+3),y
	pha
	and #8
	bne ecsscan3
	jsr ecslong
	jmp ecsscan4
ecsscan3:
	jsr ecsshort
ecsscan4:
	pla
	bcc ecsnext
; got it!
	bmi ecsscan5
	lda #5
	bne ecsquit
ecsscan5:
	lsr
	lsr
	lsr
	lsr
	and #3
	clc
	adc #1
ecsquit:
	sta var+1
	lda #0
	sta var
	sta var+2
	sta var+3
	sta var+4
	ldx #30
	jmp putvar ;a%

ecsnext:
	ldy #0
	lda (var+3),y
	and #$c0
	beq ecsquit
	ldy #0
	lda (var+3),y
	ldx #8
	and #8
	bne ecsnext1
	ldx #32
ecsnext1:
	clc
	txa
	adc var+3
	sta var+3
	tya
	adc var+4
	sta var+4
	cmp #>ecsdefnd
;	bne ecsscan	; FIXME: can't reach ecsscan
; start pina addition:
	beq ecsnext2
	jmp ecsscan
ecsnext2:
; end pina addition
	lda #0
	beq ecsquit

acc:
	word $0000
zzf:
	byte $00

; check long command, exits with carry clear=not equal
ecslong:
	ldx #0
	ldy #3
ecslong1:
	lda (var+3),y
	beq ecslong2
	cmp buffer,x
	bne ecslong3
	iny
	inx
	cpx #7
	bne ecslong1
ecslong2:
	cpx index
	beq ecslong4
;nope
ecslong3:
	clc
	rts
;yup
ecslong4:
	ldy #24
	lda (var+3),y
	beq ecslong5
;do password later
ecslong5:
	ldy #10
	ldx #0
ecslong6:
	lda (var+3),y
	beq ecslong7
	sta buffer,x
	iny
	inx
	cpx #14
	bcc ecslong6
ecslong7:
	stx index
	stx var
	lda #<buffer
	sta var+1
	lda #>buffer
	sta var+2
	ldx #2
	jsr putvar ;b$
	ldy #24
	ldx #0
ecslong8:
	lda (var+3),y
	beq ecslong9
	sta buf2,x
	iny
	inx
	cpx #8
	bcc ecslong8
ecslong9:
	stx index
	stx var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #1
	jsr putvar ;a$
	ldy #31
	lda (var+3),y
	sta var+1
	lda #0
	sta var
	ldx #31
	jsr putvar ;b%
	sec
	rts

; check short command,cc=not equal
ecsshort:
	ldy #0
	lda (var+3),y
	and #4
	beq ecsshrt1
	lda index
	cmp #2
	bcs ecsshrt2
ecsshrt1:
	lda index
	cmp #2
	bne ecsshrt3
ecsshrt2:
	ldy #3
	lda (var+3),y
	cmp buffer
	bne ecsshrt3
	ldy #4
	lda (var+3),y
	cmp buffer+1
	beq ecsshrt4
;nope
ecsshrt3:
	clc
	rts
;yup
ecsshrt4:
	ldy #5
	lda (var+3),y
	sta buffer
	ldy #6
	lda (var+3),y
	sta buffer+1
	ldx #2
	stx index
	stx var
	lda #<buffer
	sta var+1
	lda #>buffer
	sta var+2
	ldx #2
	jsr putvar ;b$
	ldy #7
	lda (var+3),y
	sta var+1
	lda #0
	sta var
	ldx #31
	jsr putvar ;b%
	ldx #1
	jsr usevar ;a$
	lda #0
	sta var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #1
	jsr putvar ;a$
	sec
	rts

ecsget:
	ldx #0
	stx $6b
	lda #<ecsdefs
	sta $69
	lda #>ecsdefs
	sta $6a
ecsg1:
	inc $6b
	jsr ecsgetln
	lda $6a
	cmp #>ecsdefnd
	bcs ecsg2
	ldy #0
	lda ($69),y
	bne ecsg1
ecsg2:
	lda $6b
	sta var+1
	lda #0
	sta var
	sta var+2
	sta var+3
	sta var+4
	ldx #30
	jmp putvar ;a%

ecsput:
	sty $6c
	lda #0
	sta $6b
	lda #<ecsdefs
	sta $69
	lda #>ecsdefs
	sta $6a
ecsp1:
	inc $6b
	jsr ecsputln
	lda $6a
	cmp #>ecsdefnd
	bcs ecsp2
	lda $6b
	cmp $6c
	bne ecsp1
ecsp2:
	rts

ecsgetln:
	ldy #31
ecsgl1:
	lda ($69),y
	sta buffer,y
	dey
	bpl ecsgl1
	ldy #8
	lda buffer
	and #8
	bne ecsgl2
	ldy #32
ecsgl2:
	sty index
	tya
	clc
	adc $69
	sta $69
	lda #0
	adc $6a
	sta $6a
	ldx $6b
	jmp putln

ecsputln:
	ldx $6b
	jsr getln
	ldy #7
	lda buffer
	and #8
	bne ecspl1
	ldy #31
ecspl1:
	sty index
ecspl2:
	lda buffer,y
	sta ($69),y
	dey
	bpl ecspl2
	sec
	lda index
	adc $69
	sta $69
	lda #0
	adc $6a
	sta $6a
	rts

getln:
	lda #35
	jmp usetbl1
putln:
	lda #36
	jmp usetbl1
usevar:
	lda #29
	jmp usetbl1
putvar:
	lda #30
	jmp usetbl1

ecsload:
	ldx #1
	jsr usevar ;a$
	lda var
	ldx var+1
	ldy var+2
	jsr setnam
	ldx #32
	jsr usevar ;dv%
	lda #8
	ldx var+1
	ldy #0
	jsr setlfs
	lda #0
	ldx #<ecsdefs
	ldy #>ecsdefs
	jmp loadf

ecssave:
	ldx #1
	jsr usevar ;a$
	lda var
	ldx var+1
	ldy var+2
	jsr setnam
	ldx #32
	jsr usevar ;dv%
	lda #8
	ldx var+1
	ldy #0
	jsr setlfs
	lda #<ecsdefs
	ldx #>ecsdefs
	sta var
	stx var+1
	ldx #<ecsdefnd
	ldy #>ecsdefnd
	lda #var
	jmp savef

; FIXME: not sure what this is doing - aligning to 32-byte boundary?
; if int(*/32)<>(*/32) then for i=*-int(*/32)*32 to 31:byte 0:next

ecsdefs:
	byte $00
; end of ecs defs? - rns
	orig $c9ff
;	ecsdefnd = ecs + $a00
ecsdefnd:
	byte $00
; next pass:close 8
; print *-ecs "Bytes"
; a=ecsdefnd - ecsdefs
; print "Room for:"
; print a/32 "Long Commands, or"
; print a/8 "Short Commands"
