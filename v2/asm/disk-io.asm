; "dskio.s"
modtype:
	byte 0
modst:
	word prgstart
;
modtbl:
	word 0		;0
	word 0		;1
	word protosta   ;2
	word 0		;3
	word 0		;4
	word imstart    ;5
	word imstart    ;6
	word pmodetbl   ;7
	word bartbl     ;8
	word alarmtb    ;9
	word tblatc     ;10
	word tblcta     ;11
	word netalrm    ;12
	word wedgemem   ;13
;
;* program load routines
;
;* load various types of modules
;
prgfile:
	cpx #0
	bne prg0
	ldx #8
prg0:
	stx filenum
	sty modtype
	cpy #14
	bcc prg1
	rts
prg1:
	tya
	asl
	tay
	lda modtbl,y
	tax
	lda modtbl+1,y
	tay
	stx modst
	sty modst+1
	ldx #1
	jsr usevar ;a$
	lda #0
	jsr setmsg
	lda #1
	ldy #0
	ldx filenum
	jsr setlfs
	ldx var+1
	ldy var+2
	lda var
	jsr setnam
	lda modst+1
	beq prg2
	jsr rsdisab
	lda #0
	ldx modst
	ldy modst+1
	jsr loadf
	jsr rsinabl
	bcs prgerr
	rts
; load error
prgerr:
	ldx #29
	jmp farerr
;
prg2:
	jmp loadprg
;
;
;* read disk directory
dskdir:
	sty dflag
	cpx #0
	beq dskdir0
	stx filenum
dskdir0:
	cpy #0
	bne dskdir1
	ldx filenum
	jsr chkin
	ldx filenum
	jsr chkin
	jsr chrin
	jsr chrin
dskdir1:
	jsr dir
	lda $90
	bne dskdir2
	lda dflag
	bne dskdir2
	jsr minusone
	ldx #15
	jsr putvar ;lp
	jsr outastr
	ldx #17
	jsr usevar ;rc
	lda var
	beq dskdir1
dskdir2:
	rts
;* read single line of directory
dir:
	ldx filenum
	jsr chkin
	jsr chrin
	jsr chrin
	jsr chrin
	pha
	jsr chrin
	tax
	pla
	jsr decimal
	ldy #0
	ldx #0
dir3:
	lda decchr,y
	cmp #'0'
	beq *+2
	inx
	cpx #0
	bne *+3
	lda #' '
	sta buf2,y
	iny
	cpy #5
	bcc dir3
dir4:
	ldy #5
	lda #' '
	sta buf2,y
	iny
dir0:
	jsr chrin
	cmp #' '
	beq dir0
	sta buf2,y
	iny
dir1:
	jsr chrin
	beq dir2
	sta buf2,y
	iny
	lda $90
	beq dir1
dir2:
	lda buf2-1,y
	cmp #' '
	bne dir5
	dey
	bne dir2
dir5:
	sty var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #$01
	jsr putvar ;a$
	jmp clrchn
;
;* input from disk
dskin:
	cpx #0
	bne dskin0a
	stx filenum
dskin0a:
	cpy #0
	bne bytin
dskin0:
	jsr chkin
	lda #0
	sta index
dskin1:
	jsr getin
	ldy index
	cmp #13
	beq dskin3
	sta buf2,y
	iny
	sty index
	cpy #80
	bcs dskin3
	lda $90
	and #$42
	beq dskin1
	lda #'^'
	sta buf2
	lda #$40
	sta $90
	ldy #1
dskin3:
	sty var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #$01
	jsr putvar ;a$
	jmp clrchn
;
bytin:
	jsr chkin
	cpy #80
	bcc bytin0
	ldy #80
bytin0:
	sty index
	ldy #0
bytin1:
	jsr chrin
	sta buf2,y
	iny
	cpy index
	bne bytin1
	jmp dskin3
;
dumparr:
	sty dumparr4+1
	jsr chkout
	ldx #0
dumparr1:
	inx
	txa
	pha
	jsr getarr
	ldy #0
dumparr2:
	cpy var
	beq dumparr3
	lda (var+1),y
	jsr chrout
	iny
	bne dumparr2
dumparr3:
	lda #13
	jsr chrout
	pla
	tax
dumparr4:
	cpx #0
	bcc dumparr1
	jmp clrchn
