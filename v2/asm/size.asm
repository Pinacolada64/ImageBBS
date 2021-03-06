
{include:equates-2_0.asm}

{asm}
orig $cf00
; size utility - NISSA 12/94
; updated 2018/09/28 for C64List 3.50 - rns

; while not strictly an image 2.0 utility, using its equate file is handy enough
; sys 52992 to start

	jsr linkprg	; cf00 20 33 a5

; patch: no longer reports an inflating block size between runs.
; fixes issue #2
; zero out size counters:
	lda #$00
	sta cf97	; hex size?
	sta cf98
	sta cf9a	; block size hi byte
	lda #$01
	sta cf99	; block size lo byte, start at 1 to avoid off-by-one error

	sec		; cf03 38
	lda $22		; cf04 a5 22
	ldy $23		; cf06 a4 23
	adc $2b		; cf08 65 2b
	sta vartab	; cf0a 85 2d
	bcc cf0f	; cf0c 90 01
	iny		; cf0e c8
cf0f:
	sty vartab+1	; cf0f 84 2e
	jsr $a65c	; cf11 20 5c a6
	ldy #$00	; cf14 a0 00
cf16:
	lda cfb5,y	; cf16 b9 b5 cf
	beq cf21	; cf19 f0 06
	jsr chrout	; cf1b 20 d2 ff
	iny		; cf1e c8
	bne cf16	; cf1f d0 f5
cf21:
	sec		; cf21 38
	lda vartab	; cf22 a5 2d
	sbc $2b		; cf24 e5 2b
	sta cf97	; cf26 8d 97 cf
	lda vartab+1	; cf29 a5 2e
	sbc $2c		; cf2b e5 2c
	sta cf98	; cf2d 8d 98 cf
	lda cf98	; cf30 ad 98 cf
	ldx cf97	; cf33 ae 97 cf
	jsr $bdcd	; cf36 20 cd bd
	lda #$20	; cf39 a9 20
	jsr chrout	; cf3b 20 d2 ff
	lda #$28	; cf3e a9 28
	jsr chrout	; cf40 20 d2 ff
	lda #$24	; cf43 a9 24
	jsr chrout	; cf45 20 d2 ff
	lda cf98	; cf48 ad 98 cf
	ldx cf97	; cf4b ae 97 cf
	jsr cf9b	; cf4e 20 9b cf
	lda #$29	; cf51 a9 29
	jsr chrout	; cf53 20 d2 ff
	lda #$2c	; cf56 a9 2c
	jsr chrout	; cf58 20 d2 ff
	lda #$20	; cf5b a9 20
	jsr chrout	; cf5d 20 d2 ff
cf60:
	sec		; cf60 38
	lda cf97	; cf61 ad 97 cf
	sbc #$fe	; cf64 e9 fe
	sta cf97	; cf66 8d 97 cf
	lda cf98	; cf69 ad 98 cf
	sbc #$00	; cf6c e9 00
	sta cf98	; cf6e 8d 98 cf
	bcc cf7e	; cf71 90 0b
	inc cf99	; cf73 ee 99 cf
	bne cf7b	; cf76 d0 03
	inc cf9a	; cf78 ee 9a cf
cf7b:
	jmp cf60	; cf7b 4c 60 cf
cf7e:
	lda cf9a	; cf7e ad 9a cf
	ldx cf99	; cf81 ae 99 cf
	jsr $bdcd	; cf84 20 cd bd
	ldy #$00	; cf87 a0 00
cf89:
	lda cfbc,y	; cf89 b9 bc cf
	beq cf94	; cf8c f0 06
	jsr chrout	; cf8e 20 d2 ff
	iny		; cf91 c8
	bne cf89	; cf92 d0 f5
cf94:
	jmp cfc5	; cf94 4c c5 cf
cf97:
	brk		; cf97 00
cf98:
	brk		; cf98 00
cf99:
	byte $01
cf9a:
	byte $00
;	ora ($00,x)	; cf99 01 00
cf9b:
	jsr cf9f	; cf9b 20 9f cf
	txa		; cf9e 8a
cf9f:
; print hex digit in .a
	pha		; cf9f 48
	lsr ; a		; cfa0 4a
	lsr ; a		; cfa1 4a
	lsr ; a		; cfa2 4a
	lsr ; a		; cfa3 4a
	jsr cfa8	; cfa4 20 a8 cf
	pla		; cfa7 68
cfa8:
	and #$0f	; cfa8 29 0f
	ora #$30	; cfaa 09 30
	cmp #$3a	; cfac c9 3a
	bcc cfb2	; cfae 90 02
	adc #$06	; cfb0 69 06
cfb2:
	jmp chrout	; cfb2 4c d2 ff
; strings:
cfb5:
	; "<cr>size: <null>"
	byte $0d,$53,$49,$5a,$45,$3a,$20,$00
	; ora $49d3	; cfb5 0d d3 49
	; ???		; cfb8 5a
	; eor $3a	; cfb9 45 3a
	; brk		; cfbb 00
cfbc:
	; " blocks<return><null>"
	byte $20,$42,$4c,$4f,$43,$4b,$53,$0d,$00
	; jsr $4cc2	; cfbc 20 c2 4c
	; ???		; cfbf 4f
	; ???		; cfc0 43
	; ???		; cfc1 4b
	; ???		; cfc2 53
	; ora $6c00	; cfc3 0d 00 6c
	; ???		; cfc6 02
	; ldy #$00	; cfc7 a0 00
cfc5:
	jmp ($a002)	; BASIC Warm Start Vector
cfc7:
	byte $00
{endasm}
