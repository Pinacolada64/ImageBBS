orig $4300
; image 1.2 swiftlink driver - re-sourcing
rsinit:
	jmp >@rsinit	; 4300  4c 36 43
rsinabl:
	jmp >@rsinabl	; 4303  4c de 43
rsdisab:
	jmp >@rsdisab	; 4306  4c d4 43
rsget:
	jmp >@rsget	; 4309  4c 26 44
rsout:
	jmp >@rsout	; 430c  4c e8 43
rsbaud:
	jmp >@rsbaud	; 430f  4c 4f 44

bauds:
; bit 4=1: use internal clock generator
	byte {%:00010101};4312  15   300
	byte {%:00010110};4313  16   600
	byte {%:00010111};4314  17  1200
	byte {%:00011000};4315  18  2400
	byte {%:00011010};4316  1a  4800
	byte {%:00011100};4317  1c  9600
	byte {%:00011110};4318  1e 19200
	byte {%:00011111};4319  1f 38400

vectors:
; 0316 - brk
	byte $16	; 431a  16
oldbrk:
	word newbrk	; 431b  97 44
; 0318 - nmi
oldnmi:
	byte $18	; 431d  18
	word newnmi	; 431e  91 43
; 031a - open
oldopen:
	byte $1a	; 4320  1a
	word newopen	; 4321  73 44
; 031c - close
oldclose:
	byte $1c	; 4323  1c
	word newclose	; 4324  7c 44
; 031e - chkin
oldchkin:
	byte $1e	; 4326  1e
	word newchkin	; 4327  f7 43
; 0322 - clrchn
oldclrchn:
	byte $22	; 4329  22
	word newclrchn	; 432a
; 0324 - chrin
oldchrin:
	byte $24	; 432c  24
	word newchrin	; 432d
; 0326 - chrout
oldchrout:
	byte $26	; 432f  26
	word newchrout	; 4330  6a 44
; 032a - getin
oldgetin:
	byte $2a	; 4332  2a
	word newgetin	; 4333  1e 44
; end of table
	byte $00	; 4332  00

@rsinit:
; TxD/RxD IRQ off, DTR low (comint0)
	lda #$0b        ; 4336  a9 0b
	sta $de02       ; 4338  8d 02 de
; set up vectors
	ldx #$00        ; 433b  a2 00
	lda #$03        ; 433d  a9 03
	sta $15		; 433f  85 15
l4341:
	lda vectors,x	; 4341  bd 1a 43
	beq l4365       ; 4344  f0 1f
	sta $14		; 4346  85 14
	lda #$4c        ; 4348  a9 4c
	sta vectors,x	; 434a  9d 1a 43
	inx		; 434d  e8
	ldy #$00        ; 434e  a0 00
l4350:
	lda vectors,x	; 4350  bd 1a 43
	pha		; 4353  48
	lda ($14),y     ; 4354  b1 14
	sta vectors,x	; 4356  9d 1a 43
	pla		; 4359  68
	sta ($14),y     ; 435a  91 14
	iny		; 435c  c8
	inx		; 435d  e8
	cpy #$02        ; 435e  c0 02
	bcc l4350       ; 4360  90 ee
	jmp l4341       ; 4362  4c 41 43
l4365:
	lda #$00        ; 4365  a9 00
	sta $de01       ; 4367  8d 01 de
; enable RxD IRQ
	lda #$09        ; 436a  a9 09
	sta $de02       ; 436c  8d 02 de
; cia #2 data direction register b:
; set bit 4 to output - why?
	lda #$10        ; 436f  a9 10
	sta $dd03       ; 4371  8d 03 dd
	ldx #$00        ; 4374  a2 00
; check for DCD:
	lda $de01       ; 4376  ad 01 de
	and #$40        ; 4379  29 40
	beq l437f       ; 437b  f0 02
	ldx #$10        ; 437d  a2 10
l437f:
	stx $cfff       ; 437f  8e ff cf
	lda #$02        ; 4382  a9 02
	jmp >@rsbaud	; 4384  4c 4f 44
l4387:
; from 43a3:
; enable RxD IRQ:
	lda #$09        ; 4387  a9 09
	sta $de02       ; 4389  8d 02 de
	ldy #$00        ; 438c  a0 00
	jmp $fe56       ; 438e  4c 56 fe

newnmi:
	pha		; 4391  48
	txa		; 4392  8a
	pha		; 4393  48
	tya		; 4394  98
	pha		; 4395  48
	cld		; 4396  d8
; get SwiftLink status
	lda $de01       ; 4397  ad 01 de
; TxD/RxD IRQs off:
	ldx #$0b        ; 439a  a2 0b
	stx $de02       ; 439c  8e 02 de
; %10001000? what is it comparing against?
	and #$88        ; 439f  29 88
	beq l4387       ; 43a1  f0 e4
	ldx #$00        ; 43a3  a2 00
; get SwiftLink status
	lda $de01       ; 43a5  ad 01 de
; bit 6: DCD high
	and #$40        ; 43a8  29 40
	beq l43ae       ; 43aa  f0 02
	ldx #$10        ; 43ac  a2 10
l43ae:
	stx $cfff       ; 43ae  8e ff cf
; get SwiftLink status
	lda $de01       ; 43b1  ad 01 de
; receive register full?
	and #$08        ; 43b4  29 08
; yes
	beq l43c9       ; 43b6  f0 11
; get byte from acia
	lda $de00       ; 43b8  ad 00 de
; get rs232 recv buffer tail pointer
	ldy $029b       ; 43bb  ac 9b 02
; FIXME: 2.0's input buffer is at $0b00
	sta $cb00,y     ; 43be  99 00 cb
	iny		; 43c1  c8
	bpl l43c6       ; 43c2  10 02
	ldy #$00        ; 43c4  a0 00
l43c6:
; update rs232 recv buffer tail pointer
	sty $029b       ; 43c6  8c 9b 02
l43c9:
; re-enable RxD IRQ:
	lda #$09        ; 43c9  a9 09
	sta $de02       ; 43cb  8d 02 de
	pla		; 43ce  68
	tay		; 43cf  a8
	pla		; 43d0  68
	tax		; 43d1  aa
	pla		; 43d2  68
	rti		; 43d3  40

@rsdisab:
	php		; 43d4  08
	pha		; 43d5  48
	lda #$0b        ; 43d6  a9 0b
	sta $de02       ; 43d8  8d 02 de
	pla		; 43db  68
	plp		; 43dc  28
	rts		; 43dd  60

@rsinabl:
	php		; 43de  08
	pha		; 43df  48
	lda #$09        ; 43e0  a9 09
	sta $de02       ; 43e2  8d 02 de
	pla		; 43e5  68
	plp		; 43e6  28
	rts		; 43e7  60

@rsout:
	sta $9e		; 43e8  85 9e
l43ea:
; get SwiftLink status
	lda $de01       ; 43ea  ad 01 de
; bit 4: is TxD empty?
	and #$10        ; 43ed  29 10
; yes
	beq l43ea       ; 43ef  f0 f9
	lda $9e		; 43f1  a5 9e
; put it in the acia
	sta $de00       ; 43f3  8d 00 de
	rts		; 43f6  60

newchkin:
	stx l441d       ; 43f7  8e 1d 44
	jsr $f30f       ; 43fa  20 0f f3
	bne l440e       ; 43fd  d0 0f
	jsr $f31f       ; 43ff  20 1f f3
	lda $ba		; 4402  a5 ba
	cmp #$02        ; 4404  c9 02
	bne l4411       ; 4406  d0 09
	sta $99		; 4408  85 99
	clc		; 440a  18
	jmp <@rsinabl	; 440b  4c de 43
l440e:
	jmp $f701       ; 440e  4c 01 f7
l4411:
	ldx l441d	; 4411  ae 1d 44
	jsr <@rsdisab	; 4414  20 d4 43
	jsr oldchkin	; 4417  20 26 43
	jmp <@rsinabl	; 441a  4c de 43
l441d:
	brk		; 441d  00

newgetin:
	pha		; 441e  48
	lda $9a		; 441f  a5 9a
	cmp #$02        ; 4421  c9 02
	bne l4445	; 4423  d0 20
	pla		; 4425  68
@rsget:
	sta $9e		; 4426  85 9e
	sty $97		; 4428  84 97
	ldy $029c       ; 442a  ac 9c 02
	cpy $029b       ; 442d  cc 9b 02
	beq l4440       ; 4430  f0 0e
; FIXME: 2.0's output buffer is at $0b00
	lda $cb00,y     ; 4432  b9 00 cb
	sta $9e		; 4435  85 9e
	iny		; 4437  c8
	bpl l443c       ; 4438  10 02
	ldy #$00        ; 443a  a0 00
l443c:
	sty $029c       ; 443c  8c 9c 02
	clc		; 443f  18
l4440:
	ldy $97		; 4440  a4 97
	lda $9e		; 4442  a5 9e
	rts		; 4444  60
l4445:
	pla		; 4445  68
	jsr <@rsdisab	; 4446  20 d4 43
	jsr oldgetin	; 4449  20 32 43
	jmp <@rsinabl	; 444c  4c de 43

@rsbaud:
	cmp #$fe        ; 444f  c9 fe
	bcc l4460       ; 4451  90 0d
	beq l445a       ; 4453  f0 05
	lda #$09        ; 4455  a9 09
	jmp l445c       ; 4457  4c 5c 44
l445a:
	lda #$08        ; 445a  a9 08
l445c:
	sta $de02       ; 445c  8d 02 de
	rts		; 445f  60

l4460:
	and #$07        ; 4460  29 07
	tay		; 4462  a8
	lda bauds,y     ; 4463  b9 12 43
	sta $de03       ; 4466  8d 03 de
	rts		; 4469  60

newchrout:
	jsr <@rsdisab	; 446a  20 d4 43
	jsr oldchrout	; 446d  20 2f 43
	jmp <@rsinabl	; 4470  4c de 43

newopen:
	jsr <@rsdisab	; 4473  20 d4 43
	jsr oldopen	; 4476  20 20 43
	jmp <@rsinabl	; 4479  4c de 43

newclose:
	jsr <@rsdisab	; 447c  20 d4 43
	jsr oldclose	; 447f  20 23 43
	jmp <@rsinabl	; 4482  4c de 43

newclrchn:
	jsr <@rsdisab	; 4485  20 d4 43
	jsr oldclrchn	; 4488  20 29 43
	jmp <@rsinabl	; 448b  4c de 43

newchrin:
	jsr <@rsdisab	; 448e  20 d4 43
	jsr oldchrin	; 4491  20 2c 43
	jmp <@rsinabl	; 4494  4c de 43

newbrk:
; so they kept the brk handler...
	lda #$27        ; 4497  a9 27
	sta $d011       ; 4499  8d 11 d0
	ldy #$00        ; 449c  a0 00
	lda #$21        ; 449e  a9 21
	jsr l44d5       ; 44a0  20 d5 44
	lda $00		; 44a3  a5 00
	jsr l44c2       ; 44a5  20 c2 44
	lda $01		; 44a8  a5 01
	jsr l44c2       ; 44aa  20 c2 44
	lda $df02       ; 44ad  ad 02 df
	jsr l44c2       ; 44b0  20 c2 44
	tsx		; 44b3  ba
	txa		; 44b4  8a
	jsr l44c2       ; 44b5  20 c2 44
l44b8:
	pla		; 44b8  68
	jsr l44c2       ; 44b9  20 c2 44
	tsx		; 44bc  ba
	cpx #$ff        ; 44bd  e0 ff
	bne l44b8       ; 44bf  d0 f7
	byte $02        ; 44c1  02

l44c2:
	pha		; 44c2  48
	lsr		; 44c3  4a
	lsr		; 44c4  4a
	lsr		; 44c5  4a
	lsr		; 44c6  4a
	jsr l44cb       ; 44c7  20 cb 44
	pla		; 44ca  68
l44cb:
	and #$0f        ; 44cb  29 0f
	ora #$30        ; 44cd  09 30
	cmp #$3a        ; 44cf  c9 3a
	bcc l44d5       ; 44d1  90 02
	adc #$06        ; 44d3  69 06
l44d5:
	sta $0400,y     ; 44d5  99 00 04
	lda #$01        ; 44d8  a9 01
	sta $db00,y     ; 44da  99 00 db
	iny		; 44dd  c8
	rts		; 44de  60

	nop		; 44df  1a
	nop		; 44e0  1a
	nop		; 44e1  1a
	nop		; 44e2  1a
	nop		; 44e3  1a
	nop		; 44e4  1a
	nop		; 44e5  1a
	nop		; 44e6  1a
	nop		; 44e7  1a
	nop		; 44e8  1a
	nop		; 44e9  1a
	nop		; 44ea  1a
	nop		; 44eb  1a
	nop		; 44ec  1a
	nop		; 44ed  1a
	nop		; 44ee  1a
	nop		; 44ef  1a
	nop		; 44f0  1a
	nop		; 44f1  1a
	nop		; 44f2  1a
	nop		; 44f3  1a
	nop		; 44f4  1a
	nop		; 44f5  1a
	nop		; 44f6  1a
	nop		; 44f7  1a
	nop		; 44f8  1a
	nop		; 44f9  1a
	nop		; 44fa  1a
	nop		; 44fb  1a
	nop		; 44fc  1a
	nop		; 44fd  1a
